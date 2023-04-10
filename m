Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D5C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B226FEBA;
	Mon, 10 Apr 2023 19:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B226FEBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQrR4OHHBnZj; Mon, 10 Apr 2023 19:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708726140D;
	Mon, 10 Apr 2023 19:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708726140D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 621571C3BA6
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ADF740997
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ADF740997
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8hRNS5P2Uh1 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C69D74192C
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69D74192C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4C3383D2C; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:35:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7694bc5cb4a3b36c7c647b012251f8168766f1d7
X-Git-Newrev: c7e1df73c26436902e1662dd37973afb6cb5b6df
X-Patchwork-Hint: ignore
Message-Id: <20230410193614.C4C3383D2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uclibc: security
 update to 1.0.43
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7e1df73c26436902e1662dd37973afb6cb5b6df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Security fix for CVE-2022-29503

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f12bf2e6a78f1b5ff203fc234be68e224ec49b0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0122d08789..cdca75b113 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.42/uClibc-ng-1.0.42.tar.xz.sha256
-sha256  ec6dae44ce86558885e56bc3bef6bd4d082397114e6e1fc15795f71e804d7016  uClibc-ng-1.0.42.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.43/uClibc-ng-1.0.43.tar.xz.sha256
+sha256  8c1f550f14728a9c06ff1fb3e85069f7f10f4d684b03e163f4d9d41727124047  uClibc-ng-1.0.43.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 99ea548ebe..373ed140d4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.42
+UCLIBC_VERSION = 1.0.43
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
