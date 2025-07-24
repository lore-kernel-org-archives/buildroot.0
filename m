Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB3C87FCA
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B944941B4B;
	Thu, 24 Jul 2025 19:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7ywCdCYIBgl; Thu, 24 Jul 2025 19:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E4641B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E4641B48;
	Thu, 24 Jul 2025 19:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC10B115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D255941A5B
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zajeJnLhCQLp for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2F640752
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2F640752
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5EC86ABE; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:27:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa043ddeab68a194fe8275e9406a43d2cbf0bfc6
X-Git-Newrev: fdf9173555a5eccb95e2f8988b1c21eccc371916
X-Patchwork-Hint: ignore
Message-Id: <20250724193036.0D5EC86ABE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: bump to
 version 0.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdf9173555a5eccb95e2f8988b1c21eccc371916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since version 0.17.0, see:
https://github.com/magic-wormhole/magic-wormhole/blob/0.19.2/NEWS.md

Note that, since v0.18.0, magic-wormhole is using python-qrcode. This
commit reflects that change by adding this new runtime dependency in
Config.in.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-magic-wormhole/Config.in                  | 1 +
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
index bb1cbb546a..57db1bde78 100644
--- a/package/python-magic-wormhole/Config.in
+++ b/package/python-magic-wormhole/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
 	select BR2_PACKAGE_PYTHON_HUMANIZE # runtime
 	select BR2_PACKAGE_PYTHON_ITERABLE_IO # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_QRCODE # runtime
 	select BR2_PACKAGE_PYTHON_SPAKE2 # runtime
 	select BR2_PACKAGE_PYTHON_TQDM # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 38ac016f0d..8ba2c04993 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  61143e1480353de7b502d1b904837fb0  magic_wormhole-0.17.0.tar.gz
-sha256  142c7a271684b0b04470792601848f6b0ade0d8bf54fbcb30c6259d75edd9d06  magic_wormhole-0.17.0.tar.gz
+md5  37fdc279a6b55f52945098850a381708  magic_wormhole-0.19.2.tar.gz
+sha256  b2b4a78acf09ff4cfc503a238f674394a5e735fa08dcd54519243ffc67f97c71  magic_wormhole-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 37fddf6c21..ce146181f7 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.17.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.19.2
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1b/a8/32a54e75643206665f569dac6ab19727aefb508b148882f1d05dff003667
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/e0/5b/4aff155b8e8ead4bc7c6aa3d1c19dc75aac2315e0c9b12f4e2f246b40141
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
