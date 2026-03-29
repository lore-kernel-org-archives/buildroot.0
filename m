Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F620F3D5FE
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 11:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2BF60A74;
	Sun, 29 Mar 2026 11:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHhoIvJGlVzX; Sun, 29 Mar 2026 11:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D53460A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774782406;
	bh=16SA9SMKX+slGxVAsQbGL5VCt2BH6stQGD4a/jRnTok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MxIxwYM2/V8OXoTi8KXu4Fa+7NCl1fie2tTewk//M8g0z5kLwnShRErk7BQOQi2lo
	 xsy5vREHXqN32xoKniQuLv3YvxXopeS+MkmZLAWa5YB8XHr6AtAOuUs1PQse/nGhjh
	 N9hjfklxvLwHec8D0J7j/oStVz0yrMJuiuPIEi5O/3egGZDKoxRa4PbWTa0QEFEXOP
	 wLxNoHvggilWiVck4KCy22nIzsnhiR8aVrgGgEejjxi5NU+Z7lLGKDr4wREUi0oQpf
	 TYqtot5R1VRhSAVtPcfBCLhTfsXyslTqoywl8+YV3GwtJz6Nnz+tZY3bJbMkWqVhnY
	 OqHH4Os0MA4gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D53460A90;
	Sun, 29 Mar 2026 11:06:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C48DD10F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B551C400C8
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiKunCAYdSvl for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E29340015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E29340015
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BC307FDB6; Sun, 29 Mar 2026 11:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 12:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9624acf9aae9292cc2d9c20f277db0e3b0bd8955
X-Git-Newrev: bdd2384cc266ada6cca762c8e9b7ff0bd924f9ba
X-Patchwork-Hint: ignore
Message-Id: <20260329110635.7BC307FDB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cloudpickle: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdd2384cc266ada6cca762c8e9b7ff0bd924f9ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support for the python-cloudpickle package, which provides
a Pickler class that extends the standard pickle.Pickler functionality.

This package is required as a dependency for gymnasium and other
machine learning or scientific computing libraries that require
advanced object serialization.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-cloudpickle/Config.in               |  7 +++++++
 package/python-cloudpickle/python-cloudpickle.hash |  5 +++++
 package/python-cloudpickle/python-cloudpickle.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b74de1b142..781d82ecd1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3479,6 +3479,9 @@ F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
+N:	Xukai Wang <kingxukai@zohomail.com>
+F:	package/python-cloudpickle/
+
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
 F:	package/gloox/
diff --git a/package/Config.in b/package/Config.in
index 4c2ea0864f..c113a9780e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
+	source "package/python-cloudpickle/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
diff --git a/package/python-cloudpickle/Config.in b/package/python-cloudpickle/Config.in
new file mode 100644
index 0000000000..a174f7a4f3
--- /dev/null
+++ b/package/python-cloudpickle/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CLOUDPICKLE
+	bool "python-cloudpickle"
+	help
+	  Pickler class to extend the standard pickle.Pickler
+	  functionality.
+
+	  https://github.com/cloudpipe/cloudpickle
diff --git a/package/python-cloudpickle/python-cloudpickle.hash b/package/python-cloudpickle/python-cloudpickle.hash
new file mode 100644
index 0000000000..078002eb4a
--- /dev/null
+++ b/package/python-cloudpickle/python-cloudpickle.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cloudpickle/json
+md5  75330dc4ce5fcd4dee785c62c96f9012  cloudpickle-3.1.2.tar.gz
+sha256  7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414  cloudpickle-3.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5  LICENSE
diff --git a/package/python-cloudpickle/python-cloudpickle.mk b/package/python-cloudpickle/python-cloudpickle.mk
new file mode 100644
index 0000000000..9f74783667
--- /dev/null
+++ b/package/python-cloudpickle/python-cloudpickle.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cloudpickle
+#
+################################################################################
+
+PYTHON_CLOUDPICKLE_VERSION = 3.1.2
+PYTHON_CLOUDPICKLE_SOURCE = cloudpickle-$(PYTHON_CLOUDPICKLE_VERSION).tar.gz
+PYTHON_CLOUDPICKLE_SITE = https://files.pythonhosted.org/packages/27/fb/576f067976d320f5f0114a8d9fa1215425441bb35627b1993e5afd8111e5
+PYTHON_CLOUDPICKLE_SETUP_TYPE = flit
+PYTHON_CLOUDPICKLE_LICENSE = BSD-3-Clause
+PYTHON_CLOUDPICKLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
