Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE8CD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82AB661377;
	Sun,  3 May 2026 14:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhbljLp0lMii; Sun,  3 May 2026 14:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C2FC6139A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819863;
	bh=J0f+nOJXxZ+Fg/XxLImS3mO6uKrSgdflGzZrnc5uXws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eWCmOCg93YlHhNcp8AYClJ/76GsxQlEZphXoXVYohjAFAfxorQ7oCTl1o2pd1SRyU
	 pikSk+Kk6eQEdJAae395EosiepM6RiEDgU4fh+Rjo0QKscQrfOTe0mWv6y5Tha/OHv
	 sAMLpkZkPCE1gO50bodo5b6O2BaxkUdj5wDxJdHkN81YZ4fAQSSF9BgRi1/qHlFziR
	 jJDJKm9X0k4kEgpWVwgUowiSyIEJkhYHzql14hZaPjXcBjfgzLg9WA9a0+XgldrqpO
	 MH5C8qJHZdeeg35eo9oB/7Xa4ef5q+y8M/CTbdWESJRdiThsn+Odba1X+P/5dKw0PX
	 U6KaQ/8MluMKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C2FC6139A;
	Sun,  3 May 2026 14:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E383190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F2840C85
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8IGNZtKdCb8 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45EE84148E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45EE84148E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1D8983FAE; Sun,  3 May 2026 14:50:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7330ecb682cba3b2cad1022f979e70f2df951316
X-Git-Newrev: 522da23ccb3b35ea66811b8f83b76e54fb43836c
X-Patchwork-Hint: ignore
Message-Id: <20260503145026.F1D8983FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: bump version to
 1.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/522da23ccb3b35ea66811b8f83b76e54fb43836c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/installer/releases/tag/1.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 577b23a7ab..dbea06738d 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  d961d1105c9270049528b1167ed021bc  installer-0.7.0.tar.gz
-sha256  a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631  installer-0.7.0.tar.gz
+md5  fdf6be7db2ab6fdfbfacfdb208abc33a  installer-1.0.0.tar.gz
+sha256  c6d691331621cf3fec4822f5c6f83cab3705f79b316225dc454127411677c71f  installer-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 094a918090..22b79ec464 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.7.0
+PYTHON_INSTALLER_VERSION = 1.0.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/05/18/ceeb4e3ab3aa54495775775b38ae42b10a92f42ce42dfa44da684289b8c8
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/5f/ef/230b70e66db6ab01d5cbb93329688ed1f06b2b0618a74925e36384ff0fba
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
