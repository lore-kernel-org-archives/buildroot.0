Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79102C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:58:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CEA6159A
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40CEA6159A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AFC26076B;
	Mon,  4 Oct 2021 21:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_GAvmHYIh1k; Mon,  4 Oct 2021 21:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A9F60855;
	Mon,  4 Oct 2021 21:58:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 434231BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FD014035E
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkxrGR4y9rgc for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605DB400F3
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 389CE8F2B9; Mon,  4 Oct 2021 21:54:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 23:43:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6cbc9ed92b83fd8cde4d97c40d63c0ee73be8b76
X-Git-Newrev: 5387888188fd87d7459cd571a9e671223add7545
X-Patchwork-Hint: ignore
Message-Id: <20211004215448.389CE8F2B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/xen: security
 bump to version 4.14.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5387888188fd87d7459cd571a9e671223add7545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Includes a number of bugfixes and the security fixes up to xsa-384:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-3/

Drop the now upstream
0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch, and
renumber the remaining patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 69e4493fb1e676f29347701a58f67d81bd76b1eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...th-64-bits-time_t.patch => 0002-Fix-build-with-64-bits-time_t.patch} | 0
 ...intf-format.patch => 0003-libs-light-fix-tv_sec-printf-format.patch} | 0
 ...ntf-format.patch => 0004-libs-light-fix-tv_sec-fprintf-format.patch} | 0
 package/xen/xen.hash                                                    | 2 +-
 package/xen/xen.mk                                                      | 2 +-
 5 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/0003-Fix-build-with-64-bits-time_t.patch b/package/xen/0002-Fix-build-with-64-bits-time_t.patch
similarity index 100%
rename from package/xen/0003-Fix-build-with-64-bits-time_t.patch
rename to package/xen/0002-Fix-build-with-64-bits-time_t.patch
diff --git a/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch b/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
similarity index 100%
rename from package/xen/0004-libs-light-fix-tv_sec-printf-format.patch
rename to package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
diff --git a/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch b/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
similarity index 100%
rename from package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch
rename to package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index fd0310c921..e30db09516 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e35099a963070e3c9f425d1e36cbb1c40b7874ef449bfafd6688343783cb25ad  xen-4.14.2.tar.gz
+sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index b84214ed16..b635996afb 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.2
+XEN_VERSION = 4.14.3
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
