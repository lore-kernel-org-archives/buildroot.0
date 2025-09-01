Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFECA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5704152C;
	Mon,  1 Sep 2025 09:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9hEkIErBUfy; Mon,  1 Sep 2025 09:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D95C41499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D95C41499;
	Mon,  1 Sep 2025 09:19:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E0B169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A3AF60F33
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elLHTJMCii7R for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04DA960DF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DA960DF8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04DA960DF8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6EE5B9784CD; Mon,  1 Sep 2025 10:44:16 +0200 (CEST)
Message-ID: <aee5f574-276f-4e44-9418-733bf0621ed6@rnout.be>
Date: Mon, 1 Sep 2025 10:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: frank-w@public-files.de, buildroot@buildroot.org
References: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
 <005e8f89-cf8a-4c6e-bd47-7ca76c84a636@rnout.be>
 <EB33CDD3-3920-4D6F-BA89-A8D71CFBF4B6@public-files.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <EB33CDD3-3920-4D6F-BA89-A8D71CFBF4B6@public-files.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756716258; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=F1mHiX8CyaYSz8FCsIoztYPhBYOAGQEv5hM4onQdPJY=;
 b=IsRgdGQ/vh1heBgsir5Qwm8Clb3Kx5OD3BrEGUtxV6SqgEq4yDw+wAom7Og5tc3prTxEtv
 Wo40NY6Yv/r5mu10n8+Fr5q29I2QxeznyaeO9DNFnVyz1ppzmLm+VaJMTUH5mq2UEgQ55O
 9dr43U8Jt5J1oizN3zo/BeTvMu19Gyf63GtwQ9I5xlEe5fYv3PNPXzbG/SXNH/ml2pBUgv
 e7aiAp3YQi2Qvo2BDepZ+eUnZ4n2EMJrcmVyRYc5lD0Qo9No1qC5r4n1rW4n/om5h8LqlB
 AQXnoxCzzNi73hR25KSVE+0AbQIKF0ETVQmzRA6WPkyL1KsO1+274RmeGaUBJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IsRgdGQ/
Subject: Re: [Buildroot] zless / zgrep
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/09/2025 08:50, Frank Wunderlich wrote:
> Hi,
> 
> Am 1. September 2025 08:27:41 MESZ schrieb Arnout Vandecappelle <arnout@rnout.be>:
>> Hi Frank,
>>
>> On 29/08/2025 19:50, Frank Wunderlich via buildroot wrote:
>>> Hi,
>>>
>>> I had troubles getting zgrep and zless working in buildroot 2025.5.
>>>
>>> See here:
>>> https://unix.stackexchange.com/questions/799248/buildroot-zgrep-zless-not-working
>>
>> The solutions given there are pretty good.
>>
>> For zless, there is not much we can do on the Buildroot side. Perhaps the zless script could be fixed upstream so that it uses the full path to less (which is set at build time through execprefix) instead of just calling "less" - that way the busybox applet is bypassed.
> 
> Tbh using fixed path is not a good solution,see zgrep. Normally PATH is used with specific order and then builtins were tried.

  For zless: it is a script that is bundled in the "less" package. Since they 
come from the same package, it should make sure that it uses the actually less 
executable it expects. So it actually should _not_ rely on PATH. (The same 
reasoning applies for a case where there are multiple versions of less installed 
in the same system; the zless script should use the less version that it 
corresponds with.) Note that this only applies to less: the script also calls 
gzip, but that one is not bundled in the less package so it should use the one 
from PATH.

  For zgrep, it's different because zgrep comes with the gzip package. So it 
should use gzip from a specific place, and grep from PATH. In this case using 
the wrong gzip doesn't do anything wrong because busybox gzip is sufficiently 
compatible.

  Regards,
  Arnout

> Maybe we can add package Less to be selected when gzip is selected.
> 
>> For zgrep, adding GZIP_CONF_ENV += GREP=grep to gzip.mk sounds like a good approach. Would you be willing to send a patch [1] that does that? Ideally you should also create a runtime test that checks that zgrep is working.
> 
> Not sure if this works because grep is called with fixed path,or is this env variable used at builttime to modify the script?
> 
> Is there any easy example how to create and test such checks?
> 
>> Regards,
>> Arnout
>>
>> [1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
>>
>>
>>
>>> My solution so far:
>>> BR2_PACKAGE_LESS=y
>>> And symlink for grep
>>> /usr/bin/grep -> /bin/grep
>>>
>>> Maybe it is not ideal solution. In stackexchange there are posted more
>>> solutions i post here for discussion  and fixing.
>>> I hope this is fixed in next release :)
>>>
>>> I guess some more users had this,but found no topic about before asking.
>>> regards Frank
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
> 
> 
> regards Frank

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
