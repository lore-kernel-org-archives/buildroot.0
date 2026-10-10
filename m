Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D444DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89118407FE;
	Sat, 10 Oct 2026 20:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXEWpIZ4C2gW; Sat, 10 Oct 2026 20:48:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 82F5D40871
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791665333;
	b=k2R9ugpX0SXGU1tJVAQ6gQ70UHphE6pFuUpTUGuCuKG2RjKqSnK8ZwIF4dxKeX6f4WRc
	 D4+9NRxQmYlNZXI/7jdk95GZ5rV1Xv0vNdLXaSmiS2bvHZUObVEsKUZnfunz51Qm/XlkB
	 JGgGZgEvnXCJPIBPJGc3nQyuZX+JBdmhTmx7fL1tohfirqQsOVmvhJqkPysRp2YSbWJZS
	 zyjEBnbGc3NJsllhZ5tpeVywWeJD8Wm2uE4U/o/8Mg4kwkMqRU6YO/w+6GxcqcrGlCNE1
	 XQv3gbj4jXfyKe9iVb1xRusngOU1hirUgE2MB/usftycw0EcfxeVPWnCdfKi7xW7CMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791665333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2tBhP8vdN6I/RIWOkJ3NUJXDT5aYn0kO8fQzGsE/pQs=;
	b=PEaALfVhl+/Y5AADQf3075Pq+4NcAyMf+jGUmq138BtJwv4N7atbU5nTFVrSPWW1u3rG
	 3FrvOM+Z5EjuhxRReRE9gsOC5rGr4w/koUW/jD1fhEYtSFBagrg6j6ww2x920V7jp4lct
	 fqrq+wciHkgx3dJPnm90BOvNeBaqfdrzY/7lHv4d3+F+r+74o470kfdEh7y0dHJgoexP0
	 mXIOmk9v42D6yVELyuJzS5RddGJqMkK6LEZHe6aKC8nbnFdvzgdWNHF7WeUxYRF29EMJg
	 gLFD6uKr98GloOVSH4cfsIdWI0BXu1GNMLlFZCPQlCmye2m++D/klyt7FkImQ3lZltQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791665333;
	bh=2tBhP8vdN6I/RIWOkJ3NUJXDT5aYn0kO8fQzGsE/pQs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W2fQnf2bsuYmNPd344xbJR/OLeFo8wIiRZflESVVs+cNQp1BBbJ4IYLbEGZ+qwfWg
	 tzE0yJ+Hbqc+F/rjdcXropTBCDa/iP5AIf9ETR7QdfqEAGUGtyjL6nQPewJKghSYdf
	 xRI7uTBa1HAfULTghG75aeLw5MpDb7sqBI/GYcgkL3yOX6Mg8QUFJFDwen4TC7NWKJ
	 IkPk+6fFUTwC2bK2WLpmc1sm8rPoUIGzY/FT/DwBMvh7ryF6z98lyoADDIulDqbvYi
	 2IOVOmREOxpg49GhBxutRuNXbCNDFtKVTWLUg6GpPmHnmtIA0QwkxYjnpnx95fvqkS
	 HVEaavfOjwxCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F5D40871;
	Sat, 10 Oct 2026 20:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9739235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 900DA810DC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGlvDUjx9kAd for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:48:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 82ACE810D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791665330;
 b=n9gJLgTFWtI1PY9vzhdQrAtskhaSdIg1jMebjZxwCaZtV1ypdKS5xG9D1C7FPCnQadQZ
 741qhk8tXbpt3VL7aFSwyR4mWyLvMs2ErcJty4biOk9TDWxDCWOcYzIbU8cmwoZVTVkNp
 xvmiNPRIw1rfw1ONH/JEWxksw3/1IfPhfYAIUyKg/xUVRuxGFnJ8xTamXwsYQNpP9VKaW
 okHVoCLsVJR+Z3usxZ4sR0l8KmjGocLAHlmy9Tj8oSm88oh6LYX1BV/525UoTTQdxD45r
 KEM0EEvqnKt0Q6EKk2QGPh2F5pOcNwmqOzXEFTIVszQCyc55S76zwkc3smvNUAEAm5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791665330;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=y+Xr8J3ii1jnCwdliDCXPZ9ow1xIYvMkJy2MloJrp4A=;
 b=efeS321HUnpf96XUUiRgdz8iihbzCdCW1KDekNgvp/apYH9i+gfsm92GzOqcr8CDi8qo
 08+QaXP9Q2Rd8F7mrOq25xxSoJ3hJKnFiFeQxSgSjGDbf3zYZwPgBEphY5eXsiAbdtLN8
 fbdnoByqeypBpsJfVgFHvr4tpPHWrlL/Hddk/yH7lGZ1YYvHnLPjXOyp2tvW9Yz+mKCXN
 SGI0XwCc+t3Xjf1ax+L4WEHpuCo00eJ+uukgoYGxaCxDtAFToohvwSHOEJ35PhDHjQxO7
 +jz4IHgxes43xybCAneoDkmaPp3ccEha7pK9D2c+PyHEvbuYQBC4IBcNdTdJEUt/MXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82ACE810D0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E4093561; Sat, 10 Oct 2026 20:47:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:47:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 725cea53c7aca562de0869ecf1c89467b3e4bc2f
X-Git-Newrev: 0c198828a636c07273cc46e8a82413ef464507c3
X-Patchwork-Hint: ignore
Message-Id: <20261010204732.15E4093561@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c198828a636c07273cc46e8a82413ef464507c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                          |  1 +
 package/python-serialx/Config.in           |  8 ++++++++
 package/python-serialx/python-serialx.hash |  5 +++++
 package/python-serialx/python-serialx.mk   | 16 ++++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fb84adf4ff..a768b6b7b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1422,6 +1422,7 @@ menu "External python modules"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-serial-asyncio/Config.in"
+	source "package/python-serialx/Config.in"
 	source "package/python-servestatic/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-serialx/Config.in b/package/python-serialx/Config.in
new file mode 100644
index 0000000000..bfe2f72cea
--- /dev/null
+++ b/package/python-serialx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERIALX
+	bool "python-serialx"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Serial library with native synchronous and asynchronous
+	  support for Linux and other platforms.
+
+	  https://github.com/puddly/serialx
diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
new file mode 100644
index 0000000000..36ef9681f7
--- /dev/null
+++ b/package/python-serialx/python-serialx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/serialx/json
+md5  e9646009ff5c2b7149cb7ef63df94c65  serialx-1.11.0.tar.gz
+sha256  38a4b60212d994449c9f3314c523ec629f1ccf629f4767b3867c7a5381366ab9  serialx-1.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
new file mode 100644
index 0000000000..b0bfd48a61
--- /dev/null
+++ b/package/python-serialx/python-serialx.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-serialx
+#
+################################################################################
+
+PYTHON_SERIALX_VERSION = 1.11.0
+PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/9b/c5/8c3f3e7985ca108fab641cc453ae015e1f6f15344064b99f115281c8bbdc
+PYTHON_SERIALX_SETUP_TYPE = setuptools
+PYTHON_SERIALX_LICENSE = Apache-2.0
+PYTHON_SERIALX_LICENSE_FILES = LICENSE
+PYTHON_SERIALX_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_SERIALX_BUILD_OPTS = --skip-dependency-check
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
