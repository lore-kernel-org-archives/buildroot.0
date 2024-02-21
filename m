Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4ABC48BF6
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 08:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E21781514;
	Wed, 21 Feb 2024 08:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H33y6_QGdifR; Wed, 21 Feb 2024 08:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534E48209D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534E48209D;
	Wed, 21 Feb 2024 08:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 851B91BF2E3
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71375405F3
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 08:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptdnaaWx8fjT for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 08:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.141;
 helo=cczrelay01.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C73D41665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C73D41665
Received: from cczrelay01.in2p3.fr (cczrelay01.in2p3.fr [134.158.66.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C73D41665
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 08:36:30 +0000 (UTC)
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
 (authenticated bits=0)
 by cczrelay01.in2p3.fr (8.14.4/8.14.4) with ESMTP id 41L8aSOi011578
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 21 Feb 2024 09:36:28 +0100
Message-ID: <d74f4d3c-bbd2-4dea-96df-77122691ce9f@clermont.in2p3.fr>
Date: Wed, 21 Feb 2024 09:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>
References: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
 <d2a4dc21-1140-497d-91d6-2dde78e98cd0@smile.fr>
 <a6433199-1362-4d80-9ccf-389d8e7ed517@clermont.in2p3.fr>
 <643b99fe-655d-45b9-80dd-f47bb53efcb2@smile.fr> <ZdWYBJ7mt1L2CTjL@landeda>
From: David Picard <david.picard@clermont.in2p3.fr>
In-Reply-To: <ZdWYBJ7mt1L2CTjL@landeda>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new
 package
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0554347483185692309=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============0554347483185692309==
Content-Type: multipart/alternative;
 boundary="------------gj02sLXsAAvjhorVXygd5U8R"
Content-Language: fr, en-US

This is a multi-part message in MIME format.
--------------gj02sLXsAAvjhorVXygd5U8R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

So, should I submit a package, using the LIBFOO_EXTRA_DOWNLOADS feature 
? What value would you recommend for LIBFOO_DL_DIR ?

David

Le 21/02/2024 à 07:28, Yann E. MORIN a écrit :
>>> I did it on purpose. This package is called a library, but it really is a bunch
>>> of C files. You only use a subset, depending on your hardware. This code was
>>> made to be compiled in the application, not as a conventional library.
>>> I could copy the files to STAGING, but cleaning would be more complicated and it
>>> would waste some disk space.
>> Ok, maybe is should not be packaged in Buildroot then.
>> When a package is build by Buildroot, it can generate a binary, a library or
>> provide some header files.
>> If your application doesn't bundle intel-socfpga-hwlib sources but it requires
>> it to build in Buildroot, you can use LIBFOO_EXTRA_DOWNLOADS to add an extra
>> download step.
> I agree with Romain. It does not make miuch sense IMHO to just drop
> source files like that. And the _EXTRA_DOWNLOADS mechanism is exactly
> tailored to such cases.

--------------gj02sLXsAAvjhorVXygd5U8R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    So, should I submit a package, using the LIBFOO_EXTRA_DOWNLOADS
    feature ? What value would you recommend for LIBFOO_DL_DIR ?<br>
    <br>
    David<br>
    <br>
    <div class="moz-cite-prefix">Le 21/02/2024 à 07:28, Yann E. MORIN a
      écrit :<br>
    </div>
    <blockquote type="cite" cite="mid:ZdWYBJ7mt1L2CTjL@landeda">
      <pre><blockquote type="cite" style="color: #007cff;"><blockquote
      type="cite" style="color: #007cff;"><pre class="moz-quote-pre"
      wrap="">I did it on purpose. This package is called a library, but it really is a bunch
of C files. You only use a subset, depending on your hardware. This code was
made to be compiled in the application, not as a conventional library.
I could copy the files to STAGING, but cleaning would be more complicated and it
would waste some disk space.
</pre></blockquote><pre class="moz-quote-pre" wrap="">Ok, maybe is should not be packaged in Buildroot then.
When a package is build by Buildroot, it can generate a binary, a library or
provide some header files.
If your application doesn't bundle intel-socfpga-hwlib sources but it requires
it to build in Buildroot, you can use LIBFOO_EXTRA_DOWNLOADS to add an extra
download step.
</pre></blockquote><pre class="moz-quote-pre" wrap="">I agree with Romain. It does not make miuch sense IMHO to just drop
source files like that. And the _EXTRA_DOWNLOADS mechanism is exactly
tailored to such cases.
</pre></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------gj02sLXsAAvjhorVXygd5U8R--

--===============0554347483185692309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0554347483185692309==--
