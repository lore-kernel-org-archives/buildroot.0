Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B54AC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 15:14:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4AD6104F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 15:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC4AD6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C8CD40496;
	Wed, 18 Aug 2021 15:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zk3zn8KYtpzV; Wed, 18 Aug 2021 15:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA5D1404D7;
	Wed, 18 Aug 2021 15:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D875E1BF317
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 15:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C823780ABB
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 15:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhTy_rgIM9Nc for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 15:14:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ABED80CEB
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 15:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7599A1814BC; Wed, 18 Aug 2021 17:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629299653; h=from:subject:date:message-id:to:mime-version:content-type:
 content-language:in-reply-to:references;
 bh=jfyMrf2UAYDsx/5p2jqi1bupSYm5g4FKH23c7p40uRU=;
 b=AeJXLNmz+s0l+w9TVCOQ4b1Mbk/nU7XIVPWMiypH6AuO0VcaHDhivzUQabBRHKUyhrPeVi
 pwKHe+NeMh1pEd/4A3PRYXilcKuT4sBroAJo4cLvOEy4KdPKZpj9kF79y8a+4sn14dMe7A
 Xhc+dflzGUMgasngJNhr54P1aWrVT7Q=
To: =?UTF-8?Q?Honor=c3=a9_Julien_Abijuru?= <abijul001@gmail.com>,
 buildroot@busybox.net
References: <CAMF_Hqkdoregortj-vDGDUoDThEQemdUcXn36x9z1oweUvbyUA@mail.gmail.com>
 <09721949-64a8-969d-db9b-c9b66e991dd0@heine.tech>
 <CAMF_Hq=XpMOuK61NLCkNdC8vzaTURwR0rujFtgeXwU0cbJANAQ@mail.gmail.com>
Message-ID: <d67cdc42-a271-0452-15d6-d6c480f50784@heine.tech>
Date: Wed, 18 Aug 2021 17:14:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMF_Hq=XpMOuK61NLCkNdC8vzaTURwR0rujFtgeXwU0cbJANAQ@mail.gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [Bluez] Bluez5 utils/tools not found
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: multipart/mixed; boundary="===============8931008988798187719=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a multi-part message in MIME format.
--===============8931008988798187719==
Content-Type: multipart/alternative;
 boundary="------------E8E6A577BCF146051E95F7F5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8E6A577BCF146051E95F7F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18.08.21 15:28, Honoré Julien Abijuru wrote:
> Hello Micheal,
>
> Thanks for the reply. I already enabled the CLI client but I still 
> can't find bluetoothctl.
>
> When I type in my target command line :
> #bluetooth
> I get : -/bin/sh: bluetoothctl: not found
>
> In fact, I don't have any bluez tool, util or client in my target.


I just noticed I oversaw your buildroot version. In the 2021.08 release 
we added a new tools option to
bluez5-utils so I was under the false impression you meant that option.

the bluez-tools package is for another project (see 
https://github.com/khvzak/bluez-tools).

So it is pretty strange, that the binaries from both packages are 
missing in your image.

For me that looks some kind of weirdness with your build. Did you do a 
fresh build?


Regards,

Michael

>
> Regards,
>
> Le mer. 18 août 2021 à 15:13, Michael Nosthoff <buildroot@heine.tech> 
> a écrit :
>
>     Hi,
>
>     On 18.08.21 15:05, Honoré Julien Abijuru wrote:
>     >
>     > Hello,
>     >
>     > I'm using buildroot to develop an embedded system that uses
>     bluetooth
>     > and for that I enabled bluez5-tools and bluez5-utils. I got the
>     images
>     > for my target but when I test them I have any blueZ util/tool.
>     > Especially I want the bluetoothctl command line tool.
>     >
>     the option BR2_PACKAGE_BLUEZ5_UTILS_TOOLS installs
>     bluemoon, btattach, hex2hcd, l2test, l2ping, mpris-proxy, rctest
>
>
>     If you need bluetoothctl you have to select
>     BR2_PACKAGE_BLUEZ5_UTILS_CLIENT ("build CLI client").
>
>
>     Regards,
>
>     Michael
>

--------------E8E6A577BCF146051E95F7F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 18.08.21 15:28, Honoré Julien
      Abijuru wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMF_Hq=XpMOuK61NLCkNdC8vzaTURwR0rujFtgeXwU0cbJANAQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Hello Micheal,
        <div dir="auto"><br>
        </div>
        <div dir="auto">Thanks for the reply. I already enabled the CLI
          client but I still can't find bluetoothctl.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">When I type in my target command line :</div>
        <div dir="auto">#bluetooth</div>
        <div dir="auto">I get : -/bin/sh: bluetoothctl: not found</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">In fact, I don't have any bluez tool, util or
          client in my target.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I just noticed I oversaw your buildroot version. In the 2021.08
      release we added a new tools option to<br>
      bluez5-utils so I was under the false impression you meant that
      option.</p>
    <p>the bluez-tools package is for another project (see
      <a class="moz-txt-link-freetext" href="https://github.com/khvzak/bluez-tools">https://github.com/khvzak/bluez-tools</a>).</p>
    <p>So it is pretty strange, that the binaries from both packages are
      missing in your image.</p>
    <p>For me that looks some kind of weirdness with your build. Did you
      do a fresh build?</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Michael<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMF_Hq=XpMOuK61NLCkNdC8vzaTURwR0rujFtgeXwU0cbJANAQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Regards,</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">Le mer. 18 août 2021 à 15:13,
          Michael Nosthoff <a class="moz-txt-link-rfc2396E" href="mailto:buildroot@heine.tech">&lt;buildroot@heine.tech&gt;</a> a écrit :<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
          <br>
          On 18.08.21 15:05, Honoré Julien Abijuru wrote:<br>
          &gt;<br>
          &gt; Hello,<br>
          &gt;<br>
          &gt; I'm using buildroot to develop an embedded system that
          uses bluetooth <br>
          &gt; and for that I enabled bluez5-tools and bluez5-utils. I
          got the images <br>
          &gt; for my target but when I test them I have any blueZ
          util/tool. <br>
          &gt; Especially I want the bluetoothctl command line tool.<br>
          &gt;<br>
          the option BR2_PACKAGE_BLUEZ5_UTILS_TOOLS installs<br>
          bluemoon, btattach, hex2hcd, l2test, l2ping, mpris-proxy,
          rctest<br>
          <br>
          <br>
          If you need bluetoothctl you have to select <br>
          BR2_PACKAGE_BLUEZ5_UTILS_CLIENT ("build CLI client").<br>
          <br>
          <br>
          Regards,<br>
          <br>
          Michael<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------E8E6A577BCF146051E95F7F5--

--===============8931008988798187719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8931008988798187719==--
