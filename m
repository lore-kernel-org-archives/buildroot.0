Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA643CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F573414C2;
	Mon,  1 Sep 2025 09:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37C3jq01R9qO; Mon,  1 Sep 2025 09:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD6D415F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD6D415F6;
	Mon,  1 Sep 2025 09:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEF4169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB6883C60
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpTCdGemsha2 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:02:10 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 09:02:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDE5F83C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE5F83C4E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDE5F83C4E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:02:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([194.15.83.7]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1uGL0J3FUr-00oU1z; Mon, 01
 Sep 2025 10:56:58 +0200
Date: Mon, 01 Sep 2025 10:56:58 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
User-Agent: K-9 Mail for Android
In-Reply-To: <aee5f574-276f-4e44-9418-733bf0621ed6@rnout.be>
References: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
 <005e8f89-cf8a-4c6e-bd47-7ca76c84a636@rnout.be>
 <EB33CDD3-3920-4D6F-BA89-A8D71CFBF4B6@public-files.de>
 <aee5f574-276f-4e44-9418-733bf0621ed6@rnout.be>
Message-ID: <09004AF1-8D65-4611-A8BB-9B38B2DFFC77@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bDaKVgBeLSWJcCISNHLilLe/fxQ1BAN3xLOa2+rzrY2gcvj3IpB
 4iXa3TQTjpLECx1fMklm/v/qUcPTc7Bamtq8+W3MYCjAjJ3CPIBsjfA5xHZzBW/xcNNbj84
 c+qzbN1MARlr6K3ySirT8P1W20zbMIaWevo90LfMESBWVsCY5+FQxxF9Fr8qCatINNn4Djf
 cfnmrPf0XSPwcMmndeq0A==
UI-OutboundReport: notjunk:1;M01:P0:3gYxeglCnR0=;NiUtnm/gUjk7sWEeM2UJPMkVfVR
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1756717327; x=1757322127; i=frank-w@public-files.de;
 bh=F5k1yNfROkOdEzQNr5FKtDH5cS1jbSwV6uecpO0DQYQ=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Reply-to:In-Reply-To:
 References:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VMvEo3kWPEd2/5Ty8po2Lmthm3lDrEMJOr1DMm76kJt6Z6EasGz+81S2YMhluRRm
 E6QWUVN7o9n5fNVjFF2+lb6tskwpbx+J6SKucybGnaXOv6aNjBW556CJhBfa7yQpZ
 0/+RmNjh4wB0+XBveGxP1D4Q5cnxS8eyFbrWdp0Y7HlI/KNKiQPOTqn9dL6WdWakQ
 eWPPPpdaF4/IKeNkpRj95CVA9d1iaFxwV7O+6EJmCIPvxI3PPAg64ROqf58rnCyBm
 ysLF7jhrq7RIBqHMCL6G01w2MgvQyrrR9IUhVlCz62XQnKknbH3IEpk4JgP1J+ayw
 sf8JlS9Jd/spA5egUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VMvEo3kW
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

Am 1. September 2025 10:44:13 MESZ schrieb Arnout Vandecappelle <arnout@rnout.be>:
>
>
>On 01/09/2025 08:50, Frank Wunderlich wrote:
>> Hi,
>> 
>> Am 1. September 2025 08:27:41 MESZ schrieb Arnout Vandecappelle <arnout@rnout.be>:
>>> Hi Frank,
>>> 
>>> On 29/08/2025 19:50, Frank Wunderlich via buildroot wrote:
>>>> Hi,
>>>> 
>>>> I had troubles getting zgrep and zless working in buildroot 2025.5.
>>>> 
>>>> See here:
>>>> https://unix.stackexchange.com/questions/799248/buildroot-zgrep-zless-not-working
>>> 
>>> The solutions given there are pretty good.
>>> 
>>> For zless, there is not much we can do on the Buildroot side. Perhaps the zless script could be fixed upstream so that it uses the full path to less (which is set at build time through execprefix) instead of just calling "less" - that way the busybox applet is bypassed.
>> 
>> Tbh using fixed path is not a good solution,see zgrep. Normally PATH is used with specific order and then builtins were tried.
>
> For zless: it is a script that is bundled in the "less" package. Since they come from the same package, it should make sure that it uses the actually less executable it expects. So it actually should _not_ rely on PATH. (The same reasoning applies for a case where there are multiple versions of less installed in the same system; the zless script should use the less version that it corresponds with.) Note that this only applies to less: the script also calls gzip, but that one is not bundled in the less package so it should use the one from PATH.

No,zless came with gzip too as i had the issue with gzip package without less package where builtin less is called and seems ignoring the LESS* variable set in the script before calling less.

> For zgrep, it's different because zgrep comes with the gzip package. So it should use gzip from a specific place, and grep from PATH. In this case using the wrong gzip doesn't do anything wrong because busybox gzip is sufficiently compatible.

It uses wrong grep because this path is hardcoded in script (i guess from gzip package) to different location than busybox use (thats why my symlink works - path was correct).

But you say "busybox gzip" so gzip is also builtin? Maybe my issue is caused because i had added gzip package but not the separate less/grep package...

> Regards,
> Arnout
>
>> Maybe we can add package Less to be selected when gzip is selected.
>> 
>>> For zgrep, adding GZIP_CONF_ENV += GREP=grep to gzip.mk sounds like a good approach. Would you be willing to send a patch [1] that does that? Ideally you should also create a runtime test that checks that zgrep is working.
>> 
>> Not sure if this works because grep is called with fixed path,or is this env variable used at builttime to modify the script?
>> 
>> Is there any easy example how to create and test such checks?
>> 
>>> Regards,
>>> Arnout
>>> 
>>> [1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
>>> 
>>> 
>>> 
>>>> My solution so far:
>>>> BR2_PACKAGE_LESS=y
>>>> And symlink for grep
>>>> /usr/bin/grep -> /bin/grep
>>>> 
>>>> Maybe it is not ideal solution. In stackexchange there are posted more
>>>> solutions i post here for discussion  and fixing.
>>>> I hope this is fixed in next release :)
>>>> 
>>>> I guess some more users had this,but found no topic about before asking.
>>>> regards Frank
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>> 
>> 
>> 
>> regards Frank
>


regards Frank
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
