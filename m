Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EC9C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 14:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D585C407FC;
	Mon, 13 Jul 2026 14:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SS8KeqH_aznv; Mon, 13 Jul 2026 14:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E09BB407FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783952002;
	bh=wjZ6yMm1U4smDtElgqKKFxdq2/eEt3GweGPlbTbfq0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZ0f7sSsn1A8JqLaA5Vm8p4m0DHdr9CGzeQL6OZPgkYK6rq55bf+sLXPBQppZnMer
	 7eFSuiPb7pg1wS8jLbgERxp1nODZaRWvZCMV7gIg8jF+9Ey7GNiHrLSYAT9ZxgU66R
	 3y6OvxWRye8kD76SR4X/GQedEj6aSvK1biVtVB3ii0Ch26DAISbdA99Qu6oC39J0PH
	 HlSmNxAMMa6w9AR9Ce+VyrV+5kWekVCel/v8reYP+TH9nghw4kdhY++sJA3RBi++60
	 MccYtVdkL6CTq/80Y+Bc5a7quPOLNSGEXJFifpzGuk9DAxppN6D/JWmuOYxxYFUHLV
	 3vPgNAg8Ql/NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09BB407FF;
	Mon, 13 Jul 2026 14:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAF09128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D832380E86
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk9CPaN2qvSl for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 14:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3681D80E82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3681D80E82
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC87E887D4; Mon, 13 Jul 2026 14:12:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 16:06:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 102d5c2c918af677ab996d6cdc73e980abdaaf75
X-Git-Newrev: 6d8a1bb4c845159fd174661055cf9113fcd62a97
X-Patchwork-Hint: ignore
Message-Id: <20260713141245.DC87E887D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 1.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d8a1bb4c845159fd174661055cf9113fcd62a97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog since 1.0.5:

Fix various minor issues, like theoretical
integer overflows for extreme inputs or NULL
dereferences if the application passes NULL
where it should not.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 4dfe62deeb..90b598f9a5 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
+sha256  bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70  libmicrohttpd-1.0.6.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a3b24d363c..6e7c79ee88 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.5
+LIBMICROHTTPD_VERSION = 1.0.6
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
