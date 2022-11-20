Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E8EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E4E42E57;
	Mon, 20 Feb 2023 21:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E4E42E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUb5hjEgjUtt; Mon, 20 Feb 2023 21:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE0C42DC1;
	Mon, 20 Feb 2023 21:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE0C42DC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 251731BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804AB610D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804AB610D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDlVMvMSCp8o for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B5A610C4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B5A610C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93FC681979; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:02:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58ba17c7849056fbeb3b4d652749af32f81e7360
X-Git-Newrev: f901a90f57927bf09ccac2dc145c77688501cfe2
X-Patchwork-Hint: ignore
Message-Id: <20230220205151.93FC681979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xen: security bump to
 version 4.14.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f901a90f57927bf09ccac2dc145c77688501cfe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Includes a number of bugfixes and the security fixes up to xsa-400:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-5/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index a81d05e3f7..5637f0e8d9 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e76d56dfcdabf5d80aa06819f44472de49526a518dbb483eb08e7ff9aec2c669  xen-4.14.4.tar.gz
+sha256  a1a24092ad14658eed420b7d56b67d0d9d5b314e96c30a799b45f3a721f98bf0  xen-4.14.5.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 03341d4275..169753e89f 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.4
+XEN_VERSION = 4.14.5
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
