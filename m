Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D03EEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EE740ABA;
	Thu,  5 Mar 2026 08:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R20a3jea8vP; Thu,  5 Mar 2026 08:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14F9405A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697759;
	bh=tXdLOYWvOcjw3i6iTsPAcu1ihUE042D3l0amQ0PZuys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qP0Sq6A4e4PJkfclu92dAGkhdcux9Yc76O+lDo6GTtRk/3E7y7s1bld/LBrhl9h1a
	 mPEFmbhWmbtnmSkUyR3yKlXKD1+gggZ3/YaAN4MB7GwV7y7Js1CM+QP2HeivqbmA8Z
	 ty5N6x6Lkt+an7j73MgRMoybOshuDYL+nOJIU3dTMja/pIeEoDx2wuNKtoRI4OgFcB
	 k2kmGxCpv/qGE7xWb0jDtO564fDS+DVYTToNfoCNpeIMJ62AWOAqmJiyRFsl8uxJDX
	 wKhCdZChtyU0e6wQVba/H2nEm89NOSfzvB5KPM2Ey03raCXk0yyY9duy7R8rZh0TA/
	 yB9wLjdh/ZvSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E14F9405A2;
	Thu,  5 Mar 2026 08:02:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03EE81EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB724065F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJkrZvvUzgrF for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26EB4405A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EB4405A2
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B7A828F8; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 21:18:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aee709bd45d90fb12577530d1e37ace4e198c778
X-Git-Newrev: 1822a98827b1f1f500548cf9a9bc8f7bdb838c24
X-Patchwork-Hint: ignore
Message-Id: <20260305080209.33B7A828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Add Chen Pei to iniparser
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1822a98827b1f1f500548cf9a9bc8f7bdb838c24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88a684d9ac..2673a59824 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -611,6 +611,9 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
+N:	Chen Pei <cp0613@linux.alibaba.com>
+F:	package/iniparser/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
