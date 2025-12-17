Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2856D65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D9640F8E;
	Wed, 17 Dec 2025 21:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbIY441_M-em; Wed, 17 Dec 2025 21:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE47040F92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007925;
	bh=zPNvQl9KA8wcdCoQPKKf0ftF4GY+CpIj/edEX1lcHeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U/BGKhUjSBFCAMrIR7pcKx4YaRyFFA6fIVpNIcALKFuaJHPbWeShiACKKf1Eg/1oX
	 GqtRW1gNJT8g98FtbyvzX2i3S3SMJiSxwKFZQ2FXlW7UWtv9cufR6J0Qdqa6s5TKmy
	 Tx2ThqQacDmhcZVqeJNrbexQsHJXosNUbGaMc9O1OfeiOCtv3aLi2IASWEa0XuYkaj
	 AnIOhgqIZ5YIjUT7nmALMMofSGJR8S3of+4SDfEoS95jSg+aKS2xZky5+pC0Iv4eIt
	 AfAi3Xdyb0Y2zsFo+v5hFUoDPrY3/8K+cXE6VYeCo8W/p6DD0Z6d6mNY34gcMBjiuI
	 9R4DNgxbndjig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE47040F92;
	Wed, 17 Dec 2025 21:45:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01AD1361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F0D40F8B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1M9ZUPBW8Wc for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE1C240F8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1C240F8A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD13681E43; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4b951da9203fa8195366397d491631fe3dcaad1
X-Git-Newrev: 476ebb35858d738a0773930379ebe0e8b1c2c7ac
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.CD13681E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zope-interface: bump
 version to 8.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=476ebb35858d738a0773930379ebe0e8b1c2c7ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/zopefoundation/zope.interface/blob/8.1.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 480d572355..3e9844b348 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  dd3e8e7b18c0845f9590a13b2ef66a46  zope_interface-8.0.1.tar.gz
-sha256  eba5610d042c3704a48222f7f7c6ab5b243ed26f917e2bc69379456b115e02d1  zope_interface-8.0.1.tar.gz
+md5  865a1632f5f9fd517f042006381ebf29  zope_interface-8.1.1.tar.gz
+sha256  51b10e6e8e238d719636a401f44f1e366146912407b58453936b781a19be19ec  zope_interface-8.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index e6425ecc4b..2ec511bdfc 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.0.1
+PYTHON_ZOPE_INTERFACE_VERSION = 8.1.1
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/88/3a/7fcf02178b8fad0a51e67e32765cd039ae505d054d744d76b8c2bbcba5ba
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/71/c9/5ec8679a04d37c797d343f650c51ad67d178f0001c363e44b6ac5f97a9da
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
