Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846CEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B6B40824;
	Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHj6dojy3KJG; Thu,  1 Jan 2026 09:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0B140830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260565;
	bh=ualWUHFegHcB3ckgfDnzy/W+edcPZqarOIOnllgfRkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EbII548BNuRzbWeI/9ki1n8mjFNVIVpVWlj5kiIOEBROmTdm3pBzxKRLDX0wHLnHm
	 HW5++qoorg36lhkDqSBHGglNKDdfpB8v9E0hnE7U5+nHvhBQefTzl9h3mKjwUa0oiy
	 psMe0Py7aoZLdOQi0UDSFNGA/J+qV1cudU2zv7Z7XVS/w5FVhwadvd4npHIP8SwIGG
	 LKoSuKByA3IfyQOCPtrHsCGEgZnJHPojIUb9XP1EzSCZUjIe3+fSUWzbWvKu8tCfPa
	 qHaPT4ZNXMupJpAFSCYLlsW/1uxrFUfiBD9sf272XlcbXnbwPEw2s7D54OcCi/lQdN
	 HxOVYyIsDHrxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0B140830;
	Thu,  1 Jan 2026 09:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D24351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3470814C7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbUcPEF9Tw4H for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA8ED814DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8ED814DC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B88E1878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d31d1bb5626b8bcfd370e121b9e854b86e392f8
X-Git-Newrev: fb17b7f665234cf112068d4dad88011d47844dbe
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.B88E1878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml-clib: bump to
 version 0.2.15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb17b7f665234cf112068d4dad88011d47844dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash | 4 ++--
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
index fdafa0b28c..262c3522e8 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml-clib/json
-md5  70ca03596450ed0ad19393620c51a4c2  ruamel.yaml.clib-0.2.14.tar.gz
-sha256  803f5044b13602d58ea378576dd75aa759f52116a0232608e8fdada4da33752e  ruamel.yaml.clib-0.2.14.tar.gz
+md5  1fc58bc3b04ac2871cb30ce29a117b40  ruamel_yaml_clib-0.2.15.tar.gz
+sha256  46e4cc8c43ef6a94885f72512094e482114a8a706d3c555a34ed4b0d20200600  ruamel_yaml_clib-0.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  f8ad7efe71dde909f2d694f7dc69470d3dbe07c001c0b30c6bd9951e472077fa  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index b44bbf5187..0eb34e169f 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.14
-PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/d8/e9/39ec4d4b3f91188fad1842748f67d4e749c77c37e353c4e545052ee8e893
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.15
+PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel_yaml_clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/ea/97/60fda20e2fb54b83a61ae14648b0817c8f5d84a3821e40bfbdae1437026a
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
