Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0906C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42CBA40121;
	Mon, 24 Oct 2022 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42CBA40121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b_kOu6NDYrb; Mon, 24 Oct 2022 21:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F63A400D6;
	Mon, 24 Oct 2022 21:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F63A400D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F01C51BF338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F324033A
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F324033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKhzjsrl5zbO for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:01:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A875C40339
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A875C40339
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 949BF86FD5; Mon, 24 Oct 2022 21:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:00:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0465ad54f290635f599361d00a9f601ace19416e
X-Git-Newrev: 325a354234594fdcf557c6fa3db75976acfde4bd
X-Patchwork-Hint: ignore
Message-Id: <20221024210131.949BF86FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distro: bump to version
 1.8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=325a354234594fdcf557c6fa3db75976acfde4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adds md5 file hash published on:
https://pypi.org/pypi/distro/json

For change log since 1.7.0, see:
https://github.com/python-distro/distro/releases/tag/v1.8.0

Most notable change is the upstream support for Buildroot
(included in python module docs and tests).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-distro/python-distro.hash | 4 +++-
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index 8f09197156..3d3e4258de 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,3 +1,5 @@
+# From https://pypi.org/pypi/distro/json
+md5  a1e81972bbcfc0dc77dd0cde590c22a6  distro-1.8.0.tar.gz
+sha256  02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8  distro-1.8.0.tar.gz
 # Locally computed
-sha256  151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39  distro-1.7.0.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index c69849b7ac..e079d8e265 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.7.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/b5/7e/ddfbd640ac9a82e60718558a3de7d5988a7d4648385cf00318f60a8b073a
+PYTHON_DISTRO_VERSION = 1.8.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
