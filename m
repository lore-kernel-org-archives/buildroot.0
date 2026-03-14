Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D79D10854A7
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183F260F9D;
	Sat, 14 Mar 2026 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUmaK9kfXnjX; Sat, 14 Mar 2026 20:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7EC60853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773521176;
	bh=nZ4cDMIqiou8eYMgSg018D3wea0WdCihlL1Vu5//xg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KFGbdNcKfQRsadASA4AlyYOBSfiSUWDZYYil3ariSOh1qnp90sSvmDELReOfvBMFV
	 2cIybkc8BmNYHprjZuto7lC/teQZxMTgH3NYfnjqhSirZgOLYY6GBAcYpOePUmvOkp
	 zvfFpfK3gr1QMiFu5qAvE6NVxGfxQ8aa9zP4zorXuM1BJpd2UZ+lzHU7uZnc1B3yM2
	 7YOeaGWwzy5ExeSWGkufCyAQDdHf0JtZtEQWzs//Hi1SY1ulQ4lT12G7Ym6SNo+3VM
	 RSfzQj8RDFUNteDroBnIMF+1q6Ke9sqLwvD8V8XPoSQR1B35JxTRHkWo+YPhi/eAMV
	 zqPrX8x3I4KGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7EC60853;
	Sat, 14 Mar 2026 20:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C264201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E67094126F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSf9SGVucuqi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13BE641262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13BE641262
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B075860D7; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 21:38:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d4dc5f54235c83ce3bc676edc674cae68b66371
X-Git-Newrev: 9b839527e38a2ed71ab7d5432ad740d5e7b71962
X-Patchwork-Hint: ignore
Message-Id: <20260314204612.3B075860D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ell: bump version to 0.83
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b839527e38a2ed71ab7d5432ad740d5e7b71962
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.83

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 034ab74c4b..ccd11151c7 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14  ell-0.81.tar.xz
+sha256  39a562f5ab2768e69da1ffbb1f98a8eb3483baffc7d2ef6adc3705e4fd4e53fb  ell-0.83.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index db9dc80366..799438e5e6 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.81
+ELL_VERSION = 0.83
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
