Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51FC433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C3A409C6;
	Sat, 19 Mar 2022 19:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JM8WHQ3DPz2A; Sat, 19 Mar 2022 19:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58025409DB;
	Sat, 19 Mar 2022 19:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6481BF255
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE19605EA
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKJkFj8bHX_v for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:14:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E9F60671
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:14:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA66283CB8; Sat, 19 Mar 2022 19:05:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 20:09:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4a8139a361a7aabd4ae2a2e54b46e2c1be677c8d
X-Git-Newrev: 8c602fcfd2422705fec134281d99f3db8c9dc84e
X-Patchwork-Hint: ignore
Message-Id: <20220319190531.AA66283CB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-pillow:
 security bump to version 9.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c602fcfd2422705fec134281d99f3db8c9dc84e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-24303: In show_file, use os.remove to remove temporary images

- CVE-2022-22817: Restrict builtins within lambdas for ImageMath.eval

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 07b070be39f9c51592c85fb76cd7af00539abc19)
[Peter: mention security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index f3ca8e6014..88a5d7cada 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  c5af6e413d2fe9247cf16ce25c816b14  Pillow-9.0.0.tar.gz
-sha256  ee6e2963e92762923956fe5d3479b1fdc3b76c83f290aad131a2f98c3df0593e  Pillow-9.0.0.tar.gz
+md5  8deffccb4f402df154fd2fd504d8487c  Pillow-9.0.1.tar.gz
+sha256  6c8bc8238a7dfdaf7a75f5ec5a663f4173f8c367e5a39f87e720495e1eed75fa  Pillow-9.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2f2e817882..901876e0ee 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/b0/43/3e286c93b9fa20e233d53532cc419b5aad8a468d91065dbef4c846058834
+PYTHON_PILLOW_VERSION = 9.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/03/a3/f61a9a7ff7969cdef2a6e0383a346eb327495d20d25a2de5a088dbb543a6
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
