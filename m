Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C0CD0406
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD38401C1;
	Mon,  5 Jan 2026 21:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVz9QGLxsHCl; Mon,  5 Jan 2026 21:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC3DF40271
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646854;
	bh=V/fjoxJPRA9Q0bR3bPedMLb4vQp4du73yr/nSOfBFE4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J3SwVoo6YAqOvZBryp9J6MgKy4eXifxZWVAWIa3uELFa2QDVHopHPlXEs4w7/RC4D
	 3zBRYlvS1kQbbpuzlo/SEBhMF2vJezV54vVPStk/3nkaghWJ+3RTHCSg602W5gU252
	 DmBCzxScPuAuaLfdlY91Tg+b4FdzzQcgac8GOzaid/0cUOG7LTBiMYJAmr/Utj7EGK
	 gLyaMkMFsboDTKb1yN7BO/8/wl5f5PeJBMtfURR3V5HX2UACDF+/yT3puwxxpAXjit
	 JFNSNqMF23ncEm5KUDGV/D5Am4T4nCvf5t23r8B3kiJBnpdFqe+koVA8xFoXjDyFzS
	 KXivDPGB7PmaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3DF40271;
	Mon,  5 Jan 2026 21:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C96D7E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B07D440211
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_4rRuzIWnvM for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BFE40199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BFE40199
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD3F882BF; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:54:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 668b97a68024805bac7101b181f7b243dc2644e9
X-Git-Newrev: c0d71ccaf6d2d114d3f8cbfd143c3fb8278dd855
X-Patchwork-Hint: ignore
Message-Id: <20260105210051.BCD3F882BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-librt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0d71ccaf6d2d114d3f8cbfd143c3fb8278dd855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                      |  1 +
 package/python-librt/Config.in         |  6 ++++++
 package/python-librt/python-librt.hash |  5 +++++
 package/python-librt/python-librt.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ed79910b9d..352fd626e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1204,6 +1204,7 @@ menu "External python modules"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
+	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
new file mode 100644
index 0000000000..1e29629680
--- /dev/null
+++ b/package/python-librt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LIBRT
+	bool "python-librt"
+	help
+	  Mypyc runtime library.
+
+	  https://github.com/mypyc/librt
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
new file mode 100644
index 0000000000..5c7f55bbb9
--- /dev/null
+++ b/package/python-librt/python-librt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/librt/json
+md5  2f0564db5d18a9e41bcd1fbdbdbee77c  librt-0.7.7.tar.gz
+sha256  81d957b069fed1890953c3b9c3895c7689960f233eea9a1d9607f71ce7f00b2c  librt-0.7.7.tar.gz
+# Locally computed sha256 checksums
+sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
new file mode 100644
index 0000000000..5c1ecd8e5e
--- /dev/null
+++ b/package/python-librt/python-librt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-librt
+#
+################################################################################
+
+PYTHON_LIBRT_VERSION = 0.7.7
+PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/b7/29/47f29026ca17f35cf299290292d5f8331f5077364974b7675a353179afa2
+PYTHON_LIBRT_SETUP_TYPE = setuptools
+PYTHON_LIBRT_LICENSE = MIT
+PYTHON_LIBRT_LICENSE_FILES = LICENSE
+PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
+
+$(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
