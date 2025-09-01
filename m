Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FAFCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 06:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D534413F7;
	Mon,  1 Sep 2025 06:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTrxQCjcMPCU; Mon,  1 Sep 2025 06:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275AF413F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275AF413F4;
	Mon,  1 Sep 2025 06:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2947610E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B2726132F
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yct_l-pTEZc for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 06:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A59CD600BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59CD600BB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A59CD600BB
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:50:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([194.15.83.7]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wL0-1uu5Ma1HS8-000DPY; Mon, 01
 Sep 2025 08:50:08 +0200
Date: Mon, 01 Sep 2025 08:50:05 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
User-Agent: K-9 Mail for Android
In-Reply-To: <005e8f89-cf8a-4c6e-bd47-7ca76c84a636@rnout.be>
References: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
 <005e8f89-cf8a-4c6e-bd47-7ca76c84a636@rnout.be>
Message-ID: <EB33CDD3-3920-4D6F-BA89-A8D71CFBF4B6@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7dJnOY4IXd/lMf2iXEck8lMMJRTmYog7jn2g52GcmM/WM9PXTK1
 sgTGOXuhrVQq+NoKkLGIaeKCAnv6GCq9lTrBN2q/YaLICKnuiAoqbjCgxlbOZOrySuJnQfq
 Agxo3XlcTu42n2qThFGUwEDZ4ffAeB4JlH7URWIHpJaBphLphwwNvImydaeTSceHEGyhaBS
 r7vo0y8B2WeGk5/tZMQZA==
UI-OutboundReport: notjunk:1;M01:P0:2jg4r0Mw5sQ=;pc72tyWibTf+1uxkbDvLUjoRjpf
 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
 WcedCZews8eWTvAPOUC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1756709408; x=1757314208; i=frank-w@public-files.de;
 bh=qNQCoWWmNzeW+O1djCn1ZIM0LKuahjcliIT/QNayqBI=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Reply-to:In-Reply-To:
 References:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cCLZS8mmbItNuONkVlvbPdGm0XOa3bDNjuOoJBgkE7RCaDkJUKdVFLlEOZnGLSwS
 NDetfWQN279huwtOOp99woolg000JuNq90kLQ2mf2AD0fNS5TXWcy0Bs+iRcuVEep
 /d6qZrNMr7KBFYEDXOngwnTnA0hnS8wFC4uitpESDGyWGmLmIeGS3ZTkFQmtEHj/6
 qE2IUOVq4yZDK5dwZmJly3IC+j8buQGnZFveaIh9pTMNou7BUv4ydz4TeAQHmjpb3
 STXzAGFlKXMnSyEWeJ8xdS1F5lPm6JHfne6yQK9IpWWwrA+LQBPSY045BvekPYEDv
 40I5VVvtd0yAgJfUaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=cCLZS8mm
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
From: Frank Wunderlich via buildroot <buildroot@buildroot.org>
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am 1. September 2025 08:27:41 MESZ schrieb Arnout Vandecappelle <arnout@rnout.be>:
> Hi Frank,
>
>On 29/08/2025 19:50, Frank Wunderlich via buildroot wrote:
>> Hi,
>> 
>> I had troubles getting zgrep and zless working in buildroot 2025.5.
>> 
>> See here:
>> https://unix.stackexchange.com/questions/799248/buildroot-zgrep-zless-not-working
>
> The solutions given there are pretty good.
>
> For zless, there is not much we can do on the Buildroot side. Perhaps the zless script could be fixed upstream so that it uses the full path to less (which is set at build time through execprefix) instead of just calling "less" - that way the busybox applet is bypassed.

Tbh using fixed path is not a good solution,see zgrep. Normally PATH is used with specific order and then builtins were tried.
Maybe we can add package Less to be selected when gzip is selected.

> For zgrep, adding GZIP_CONF_ENV += GREP=grep to gzip.mk sounds like a good approach. Would you be willing to send a patch [1] that does that? Ideally you should also create a runtime test that checks that zgrep is working.

Not sure if this works because grep is called with fixed path,or is this env variable used at builttime to modify the script?

Is there any easy example how to create and test such checks?

> Regards,
> Arnout
>
>[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
>
>
>> My solution so far:
>> BR2_PACKAGE_LESS=y
>> And symlink for grep
>> /usr/bin/grep -> /bin/grep
>> 
>> Maybe it is not ideal solution. In stackexchange there are posted more
>> solutions i post here for discussion  and fixing.
>> I hope this is fixed in next release :)
>> 
>> I guess some more users had this,but found no topic about before asking.
>> regards Frank
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>


regards Frank
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
