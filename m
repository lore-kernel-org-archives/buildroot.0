Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF06F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355BB611A2;
	Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-j9zwJsQpVs; Sun, 15 Mar 2026 22:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C03C61209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613122;
	bh=BTK6Atu7MnxO0J5cnfiw22yR5Iw9PlZBAgdt1EaCs1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EuVQLBHNX8/JcG+6qyJkSyYy7bP1WIgSdGwXH9FaOubqts6GFRpGyVMww/uD8nGWG
	 4snSZev/QJ8X0BWcLJqEU+hZa4sb0amvCIoKbZx7KEET+UvfY07T4E1780ELXZH4Sj
	 jKLqyykOzBlsVq2HY3HYh0l80ttHWp8b6rqoPkwGs4jlo4TCoZGAx/dghKdLpQzcjJ
	 7dxemxSVOq3cf3yMBlIU/ypPeSw7WQPSsKePP4chVVvQ71dg3HbNYKNBb9CDilswvr
	 kJ923w9j2zPR6Pt5qADvEDHjD63PQvzL021MR4sFUxWOXNM5YvNbxiQ7rEdepYtu9l
	 SJxPPTggeYikg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C03C61209;
	Sun, 15 Mar 2026 22:18:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12283357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD3A1610D3
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30gEq_Al_JIl for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D1A61089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D1A61089
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9355083F4D; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4326be19baf1b9fd997ee3a0bd4d4d66c04c1215
X-Git-Newrev: c3c045546a70b8a94ecab9a079aa8e5ce5d2b92c
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.9355083F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pkgconfig: bump version to
 1.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3c045546a70b8a94ecab9a079aa8e5ce5d2b92c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/matze/pkgconfig?tab=readme-ov-file#changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pkgconfig/python-pkgconfig.hash | 4 ++--
 package/python-pkgconfig/python-pkgconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pkgconfig/python-pkgconfig.hash b/package/python-pkgconfig/python-pkgconfig.hash
index 2fa57a7be5..7ecb8a9f3e 100644
--- a/package/python-pkgconfig/python-pkgconfig.hash
+++ b/package/python-pkgconfig/python-pkgconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pkgconfig/json
-md5  12523e11b91b050ca49975cc033689a4  pkgconfig-1.5.5.tar.gz
-sha256  deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899  pkgconfig-1.5.5.tar.gz
+md5  fe94675a8b78717922de3e7694ee0643  pkgconfig-1.6.0.tar.gz
+sha256  4a5a6631ce937fafac457104a40d558785a658bbdca5c49b6295bc3fd651907f  pkgconfig-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cdfc7f89d8c93b15d447c9ed71d5a533b4e44b82ec86daaefb10f6db37b9e13a  LICENSE
diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
index fc7e8273fe..4fbf22ab65 100644
--- a/package/python-pkgconfig/python-pkgconfig.mk
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PKGCONFIG_VERSION = 1.5.5
+PYTHON_PKGCONFIG_VERSION = 1.6.0
 PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
-PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
+PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/52/fd/0adde075cd3bfecd557bc7d757e00e231d34d8a6edb4c8d1642759254c21
 PYTHON_PKGCONFIG_SETUP_TYPE = poetry
 PYTHON_PKGCONFIG_LICENSE = MIT
 PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
