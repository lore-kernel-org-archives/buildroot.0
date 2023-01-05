Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58854C3DA7A
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD509405F4;
	Thu,  5 Jan 2023 13:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD509405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axfVk6uUkp3g; Thu,  5 Jan 2023 13:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA6E40125;
	Thu,  5 Jan 2023 13:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA6E40125
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB7A31BF964
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D42E381F62
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D42E381F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOYqBz_DpmOh for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30EA81FDA
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A30EA81FDA
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhS-RD; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-MN; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 13:59:59 +0100
Message-Id: <20230105130000.682525-5-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105130000.682525-1-martin@geanix.com>
References: <20230105130000.682525-1-martin@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=JjPoqiPcZiL0F9ieWUYUGB4kWmF/8CN8OZB3QUB9PdE=; b=0nYW/sedWTaAbgBDC7W/ZrDbTM
 QO0eNn7TWI5zDDzIqZE31YXAh5xX7tMFI0JXlW53O6WutnwlCcgBK63ONWDyHqvtfPyVkiEGsPQ+b
 eMIF5rdBItirclGR1sbV7SNyKHMrOs9ES401VuQJhal0NFy10W7YqrpF7o9K4bVP+7DF3qIHg6Fwp
 Fwv064RNw4ewkTX+XlaQN4UckseuemA3Yu/zVhcOIX3nT7JD32TcAw34xeux+ncx3DcWrNILHh7Gx
 E/Dux1ox6pdytb85t2E7DqLJHZnZXZmqJV0wCnDW0J4U4zUCf2t2o+o1Xea/0JyPQjfnmJLewfxhN
 Jv/BePVQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=0nYW/sed
Subject: [Buildroot] [PATCH 4/5] package/python-marshmallow-sqlalchemy: new
 package
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Martin Hundeboll <martin@geanix.com>
---
 package/Config.in                                  |  1 +
 package/python-marshmallow-sqlalchemy/Config.in    | 10 ++++++++++
 .../python-marshmallow-sqlalchemy.hash             |  5 +++++
 .../python-marshmallow-sqlalchemy.mk               | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-marshmallow-sqlalchemy/Config.in
 create mode 100644 package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
 create mode 100644 package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk

diff --git a/package/Config.in b/package/Config.in
index f5b7c100ed..e3a0900866 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1122,6 +1122,7 @@ menu "External python modules"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-marshmallow/Config.in"
+	source "package/python-marshmallow-sqlalchemy/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
diff --git a/package/python-marshmallow-sqlalchemy/Config.in b/package/python-marshmallow-sqlalchemy/Config.in
new file mode 100644
index 0000000000..f48d27edd6
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_MARSHMALLOW_SQLALCHEMY
+	bool "python-marshmallow-sqlalchemy"
+	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
+	help
+	  SQLAlchemy integration with the marshmallow
+	  (de)serialization library.
+
+	  https://github.com/marshmallow-code/marshmallow-sqlalchemy
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
new file mode 100644
index 0000000000..4fbbd86eb5
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
+md5  5e012b07ccf4ad67dbd3f38cc68cb1f4  marshmallow-sqlalchemy-0.28.1.tar.gz
+sha256  aa376747296780a56355e3067b9c8bf43a2a1c44ff985de82b3a5d9e161ca2b8  marshmallow-sqlalchemy-0.28.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6de41a12f5147c7cbec2a890def8529b14156317cd6755ebec761375d791acb0  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
new file mode 100644
index 0000000000..293ea29be6
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-marshmallow-sqlalchemy
+#
+################################################################################
+
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.28.1
+PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/eb/96/3895bde2247fa653c36d887ff08e439665668aa7c991a3924ae199be88d6
+PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
+PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
