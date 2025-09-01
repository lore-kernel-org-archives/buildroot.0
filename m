Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4326CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9AA60BE5;
	Mon,  1 Sep 2025 09:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaygKAQuhK1Y; Mon,  1 Sep 2025 09:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5D660DB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5D660DB9;
	Mon,  1 Sep 2025 09:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDBBB169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B262380F24
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bsXYhi1dIEU for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B11F480F1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11F480F1C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B11F480F1C
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E932EB978500; Mon,  1 Sep 2025 08:27:43 +0200 (CEST)
Message-ID: <005e8f89-cf8a-4c6e-bd47-7ca76c84a636@rnout.be>
Date: Mon, 1 Sep 2025 08:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: frank-w@public-files.de, buildroot@buildroot.org
References: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756708064; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=UYid97WK9Clt7GZ3lmc/3ajB9ohGO2fsqUPos3CHHuw=;
 b=cgbw8dbmMT3zAa2JgA91akiw9yi7Qf7f/rppHuT/FU37XBDP3hMmFJEHYm+C75fIt9et/n
 fio10MWjvD+vJT3ojWVEl0n6nQKKcpbV9ud/9V+I/XFmjTharHjYvvHlTJrojQ6508Qx0S
 sF5AQuYoBn7Oz60knec3zjeQ2k2LuMVherBFZhNr4mBmjzxs6oovkFpWJsvbup1SbfskxS
 pLsX2rRh258jKb2+6+Cn+z2hritdaR9dG1m6hdCO9izIuKKNI2dF8KM+riJzgr/dri9Kqd
 oJjamhSkCWSfjdQ9izCqpZ83V4ilR2wpNBhHnP147X+eFBBj4rbxX8V73O0X4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cgbw8dbm
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

  Hi Frank,

On 29/08/2025 19:50, Frank Wunderlich via buildroot wrote:
> Hi,
> 
> I had troubles getting zgrep and zless working in buildroot 2025.5.
> 
> See here:
> https://unix.stackexchange.com/questions/799248/buildroot-zgrep-zless-not-working

  The solutions given there are pretty good.

  For zless, there is not much we can do on the Buildroot side. Perhaps the 
zless script could be fixed upstream so that it uses the full path to less 
(which is set at build time through execprefix) instead of just calling "less" - 
that way the busybox applet is bypassed.

  For zgrep, adding GZIP_CONF_ENV += GREP=grep to gzip.mk sounds like a good 
approach. Would you be willing to send a patch [1] that does that? Ideally you 
should also create a runtime test that checks that zgrep is working.

  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches



> My solution so far:
> BR2_PACKAGE_LESS=y
> And symlink for grep
> /usr/bin/grep -> /bin/grep
> 
> Maybe it is not ideal solution. In stackexchange there are posted more
> solutions i post here for discussion  and fixing.
> I hope this is fixed in next release :)
> 
> I guess some more users had this,but found no topic about before asking.
> regards Frank
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
