Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B3CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684DD845DA;
	Fri, 29 Aug 2025 17:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZoJiZImDOd1; Fri, 29 Aug 2025 17:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81952845D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81952845D9;
	Fri, 29 Aug 2025 17:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AF61F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26BD541960
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBemDCBa6yEk for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:55:25 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Aug 2025 17:55:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4C3F41957
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C3F41957
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4C3F41957
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:55:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([157.180.225.234]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1umn7V0U2x-00BGe2; Fri, 29
 Aug 2025 19:50:18 +0200
Date: Fri, 29 Aug 2025 19:50:18 +0200
To: buildroot@buildroot.org
User-Agent: K-9 Mail for Android
Message-ID: <7BD4D763-6B95-4C41-884E-54A067A2D3B4@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:n6z5eKcmEKVccsHjITnhxP5J6nAL4NitRgHFqpuFpMJswMGo57Y
 aiOgUIqYIVv4dCpCOC53eELStOI1ai0emHRsc8GPLwLy6zbamzy6Tv3IR9Cs0Z39GbxNftn
 K/Hi+yB8xRPS6CaTQeE1Yp+DBtN96TcIHhwcS0esUs2MyqOOV1KC9uiARwdvV9eLQySxcQV
 6IjLKYfN5uljU+BzUXKHA==
UI-OutboundReport: notjunk:1;M01:P0:ojhq8WGRUVQ=;POy6Gbc/ocvbIVk5zB5Lp4NWQeh
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1756490123; x=1757094923; i=frank-w@public-files.de;
 bh=0uYvZ8Fp0ZHqALSgj6RR2Y8EEgazhd18UW7Koevyyao=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Reply-to:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NLYSstvuV3um2QWqhTrzUZ8y6MPvB0hDLhrKCeAmUBv1AHmg2EV6PMJIm1VJAApy
 sD5oztZ1iH/WxtiVZBEZbJvZ/D3jaoVskNHxW5cGkyo2V9d+jmvU6GUY9MbD9fL1y
 i1TMqA5KgsHg+dKy46S/mHm4BMpOVstSGSWz2/j9bfE9KAgj70m539riwE9qmKEuX
 94DTy7djSwSanmWDlU4jf/HEwMu/s473fw3vBkTOBxLLd70BHveLD+gvDkOpDvXWR
 xBis6eFJnLVpzzOna8Xjac6VtDifxtMpW+iagMmRvAQ/oR+6v3sFjjC0lh/nXeKiB
 PAmjGtTF9ERXDS1vgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NLYSstvu
Subject: [Buildroot] zless / zgrep
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

I had troubles getting zgrep and zless working in buildroot 2025.5.

See here:
https://unix.stackexchange.com/questions/799248/buildroot-zgrep-zless-not-working

My solution so far:
BR2_PACKAGE_LESS=y
And symlink for grep
/usr/bin/grep -> /bin/grep

Maybe it is not ideal solution. In stackexchange there are posted more
solutions i post here for discussion  and fixing.
I hope this is fixed in next release :)

I guess some more users had this,but found no topic about before asking.
regards Frank
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
