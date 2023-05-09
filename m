Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC346C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AABC84606;
	Tue,  9 May 2023 13:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AABC84606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7S9G2GzYGWF; Tue,  9 May 2023 13:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3FD8406D;
	Tue,  9 May 2023 13:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA3FD8406D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 492021BF867
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 13:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2200F61612
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 13:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2200F61612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rm3kBMuZyCZZ for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 13:41:02 +0000 (UTC)
X-Greylist: delayed 00:29:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FED960ADA
Received: from smtp.zfn.uni-bremen.de (smtp.zfn.uni-bremen.de [134.102.50.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FED960ADA
 for <buildroot@buildroot.org>; Tue,  9 May 2023 13:41:02 +0000 (UTC)
Received: from [IPV6:2003:ca:7f37:2300:4625:d4a8:928a:b8]
 (p200300ca7f3723004625d4a8928a00b8.dip0.t-ipconnect.de
 [IPv6:2003:ca:7f37:2300:4625:d4a8:928a:b8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.zfn.uni-bremen.de (Postfix) with ESMTPSA id 4QFz7g1hrszDCdm;
 Tue,  9 May 2023 15:11:27 +0200 (CEST)
Message-ID: <dbd01b75-87ae-639b-9118-2079cac505d3@itp.uni-bremen.de>
Date: Tue, 9 May 2023 15:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: de-DE, en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <00604ac1-606d-ab11-8302-619aab02bcfe@t-online.de>
 <ca66b08b-e69f-2cc0-102e-241f0a03fa93@mind.be>
From: =?UTF-8?Q?Niclas_G=c3=b6tting?= <ngoetting@itp.uni-bremen.de>
In-Reply-To: <ca66b08b-e69f-2cc0-102e-241f0a03fa93@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=uni-bremen.de; s=2019; 
 t=1683637887; i=@uni-bremen.de;
 bh=OLhx6DkXox/6JWk1SJWa55squpIO0KACBIerjEcv0l4=;
 h=Date:To:Cc:References:From:In-Reply-To;
 b=XG4tVH5LxFWOXhTKEySPgCkJlMh85Hy/yrhb55PWZxVkcRIcnmSLUfLVav3loT0ss
 My/r+tX0TPbWnxTWNyJHnjr0ucgZr/HMrGs/TUQ89MCulV5zqElJC8Fc18LgihVv5K
 3l//hESE7/r0H6cfsGtwMLklHQyhwl1MzG0rUHQeKZMzZBYZNVZGtwKC0dGHCGk6/9
 Fio0ZDyx22Vkkyk3e9bIU9649309sYdcKFFCarjo33yclkK534Po3ETooXDShZ+7Sn
 oBjo1qj6IgSogSEGW1tz1cqZ97ipexwc8UqZyZzUYabmdVNL8DUcj9BS2zdEKk5ieY
 MU9c+PkQA8Fgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=uni-bremen.de header.i=@uni-bremen.de
 header.a=rsa-sha256 header.s=2019 header.b=XG4tVH5L
Subject: Re: [Buildroot] SWUpdate default services
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: multipart/mixed; boundary="===============8182383009531352950=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============8182383009531352950==
Content-Type: multipart/alternative;
 boundary="------------kbQJ0djggH6wVLNzsHBAepUE"
Content-Language: de-DE, en-US

This is a multi-part message in MIME format.
--------------kbQJ0djggH6wVLNzsHBAepUE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thank you for the fast response!

On 25.04.23 22:25, Arnout Vandecappelle wrote:
>  Adding James in Cc, he added this.
>
> On 24/04/2023 12:06, Niclas Götting wrote:
>> Hi all,
>>
>> currently, the `swupdate`-package (for init-systems other than 
>> systemd) automatically installs a file called 
>> `/usr/lib/swupdate/conf.d/90-start-progress`, with the only content 
>> being
>>
>> exec /usr/bin/swupdate-progress -w -r &
>
>  This was done in commit 0e94459ad52e87033c170522610e83215a444242 to 
> align Buildroot with the upstream-maintained meta-swupdate. I.e., in 
> meta-swupdate this is done by default.
>
>  I guess the idea is that most people want this progress feature.
>> For me, this is problematic because of two reasons:
>>
>>  1. Having `swupdate-progress` running in the background is optional 
>> and should
>>     therefore not be the default.
>
>  If you don't want it, you can always remove it in a post-build script.
Removing the file in a post-build script depends on the file always 
being in the exact same location with the exact same name. I think it 
would be much cleaner, if the file wasn't there in the first place. 
After all it is a single line, which can indeed be trivially added in a 
rootfs overlay and consistently so.
>
>>  2. The process is not handled via a service, but is started every 
>> time the
>>     `swupdate` service is started. If you restart SWUpdate five 
>> times, there
>>     will be five `swupdate-progress` processes.
>
>  That is indeed annoying. I'm not really sure how this conf.d works. 
> Would there be a way to use start-stop daemon instead (and create a 
> pid file), and stop it in the init script?

Yes, the clean way would be to have separate service for 
swupdate-progress, which could be shipped with buildroot. I would also 
be okay with this solution.

Generally, as SWUpdate is such a flexible framework, I don't know if it 
is a good idea to include any standard service at all. Most people will 
want different kinds of setups than the standard and then need to delete 
all unneeded files in scripts, which I consider unclean.

>
>  Regards,
>  Arnout
>
>> Maybe I have overseen something, but I believe the file should not 
>> have been there in the first place and I would prefer to add my own 
>> scripts if I needed them. In any case, I would propose an option to 
>> disable installing this file.

Best regards
Niclas
--------------kbQJ0djggH6wVLNzsHBAepUE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode">Thank you for the fast
      response!
      <br>
      <br>
      On 25.04.23 22:25, Arnout Vandecappelle wrote:
      <br>
      <blockquote type="cite" style="color: #007cff;"> Adding James in
        Cc, he added this.
        <br>
        <br>
        On 24/04/2023 12:06, Niclas Götting wrote:
        <br>
        <blockquote type="cite" style="color: #007cff;">Hi all,
          <br>
          <br>
          currently, the `swupdate`-package (for init-systems other than
          systemd) automatically installs a file called
          `/usr/lib/swupdate/conf.d/90-start-progress`, with the only
          content being
          <br>
          <br>
          exec /usr/bin/swupdate-progress -w -r &amp;
          <br>
        </blockquote>
        <br>
         This was done in commit
        0e94459ad52e87033c170522610e83215a444242 to align Buildroot with
        the upstream-maintained meta-swupdate. I.e., in meta-swupdate
        this is done by default.
        <br>
        <br>
         I guess the idea is that most people want this progress
        feature.
        <br>
        <blockquote type="cite" style="color: #007cff;">For me, this is
          problematic because of two reasons:
          <br>
          <br>
           1. Having `swupdate-progress` running in the background is
          optional and should
          <br>
              therefore not be the default.
          <br>
        </blockquote>
        <br>
         If you don't want it, you can always remove it in a post-build
        script.
        <br>
      </blockquote>
      Removing the file in a post-build script depends on the file
      always being in the exact same location with the exact same name.
      I think it would be much cleaner, if the file wasn't there in the
      first place. After all it is a single line, which can indeed be
      trivially added in a rootfs overlay and consistently so.
      <br>
      <blockquote type="cite" style="color: #007cff;">
        <br>
        <blockquote type="cite" style="color: #007cff;"> 2. The process
          is not handled via a service, but is started every time the
          <br>
              `swupdate` service is started. If you restart SWUpdate
          five times, there
          <br>
              will be five `swupdate-progress` processes.
          <br>
        </blockquote>
        <br>
         That is indeed annoying. I'm not really sure how this conf.d
        works. Would there be a way to use start-stop daemon instead
        (and create a pid file), and stop it in the init script?
        <br>
      </blockquote>
      <br>
      Yes, the clean way would be to have separate service for
      swupdate-progress, which could be shipped with buildroot. I would
      also be okay with this solution.
      <br>
      <br>
      Generally, as SWUpdate is such a flexible framework, I don't know
      if it is a good idea to include any standard service at all. Most
      people will want different kinds of setups than the standard and
      then need to delete all unneeded files in scripts, which I
      consider unclean.
      <br>
      <br>
      <blockquote type="cite" style="color: #007cff;">
        <br>
         Regards,
        <br>
         Arnout
        <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">Maybe I have
          overseen something, but I believe the file should not have
          been there in the first place and I would prefer to add my own
          scripts if I needed them. In any case, I would propose an
          option to disable installing this file.
          <br>
        </blockquote>
      </blockquote>
      <br>
      Best regards
      <br>
      Niclas
      <br>
    </div>
  </body>
</html>

--------------kbQJ0djggH6wVLNzsHBAepUE--

--===============8182383009531352950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8182383009531352950==--
