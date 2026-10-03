Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6F0CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B7D8169B;
	Sat,  3 Oct 2026 13:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXw84mvvVrEl; Sat,  3 Oct 2026 13:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ED0B080D4B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035874;
	b=nmnDjqqDz2CpX2OpXIDgiWjFusUGdD6UQ9glBXsbcc9f/i4LOdsUpIfzuMVESy0aWwtx
	 xW06PIpuwSGbBrJX3aoWZZEg5pvObMM84i/GG2gzFhDsCJ4rErkGn5ePXBlLY5Cu4fe/V
	 8PEsfDjCj+Kcud7nYs2MOR77+95roCJikAbKZAX+0fC46ltGHzpM+lzmqnczZ1n1JACeH
	 5FuyF7QVHmeVI8Ne2DfdXwk0qcF11qRoqe4rQe15YGKN6z+59wS+bPxgrm1vT2WhT0ZQT
	 LP0TXe8wUgQmB9dfOWlW5J2bug8Pofl5jj+W9XSKDCDJflKU0RVqN8cl8CEYWpyjXpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2naCKnE8c2BxHdwAAGA00AJCDv8j+qA1mXytg05a7zY=;
	b=FYrFO7qdUDO7zThmTGom08wUKDOuWBpyY3UtwQ892SSHMlaZCgPpFSAhB8Yx4a8NTTFK
	 USgFpngtSpDpeM3cIJLJf5ilT0OFIk1ZuxxeC3iZjj+IQ3U41cK0vTO8OWhWBSBFcRS5i
	 yKVQQkMucar/kNWb2sP8xlmP3RXSEqMSn8x8Y2Pv6JC5AEdjXCUPX/OlSuCkrmtRPkqSi
	 2IXKMShP9zX+P3gQ5TBTF8t6imRCjFrbphylhfWwxrXcrylu85jj0AR4XUurgaG1QfzSe
	 340DZeMgzcW/mcC1/OaO+nY60466oN2gFGHhmY4mAh+RKUdrq2exliAWLva5+DO2+Hw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035874;
	bh=2naCKnE8c2BxHdwAAGA00AJCDv8j+qA1mXytg05a7zY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ih053bNToqVoNAn9jaKbQCP6wkNjA+weQLmEEVHU9WXBuuqFTbghae4M8JZABLUb+
	 aF4sJihQhkIGDJNiBmial72QZ05XRoIQr8ZG7IxXqZzdGk/xPmy4ABQO84v5sltIKB
	 0LdmQMJA7VEe4iRNxTBHXPbV1P5xbgp1v+MAPVgv+SlnqbiSKI98N1RJa5ohrXpinA
	 oUBZ4EjnwQp4rz7+Y8ZcTSiJblJVjmDz/vXpVILxjHQKoaABkNy7ua1NKvSMHv81Zk
	 XpfB+RXQOd36iYK36ZgFskovQpfLyGiyd2f54uiUuGxfZaFIjtUW3z/Cgbu0K3vpPB
	 1s0cotfTjG9KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0B080D4B;
	Sat,  3 Oct 2026 13:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F51A14
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17AE7414E1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Srt7sPiquXz9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A835A414F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=E0r1JmruqFYqFwdahiFk5QkQ+aHl0ZXw6LsR58VS0+3bXKaeBh68rNnbESS5aO93dIPO
 O8g33V1iwNmkVMkRYUc9kzMyGMhWE33C4LyrLobFgmeR6IeFIvbAIWeEVeuWowvLk/DGA
 lN62N7tr3SO6ysEa1GOrjJm6xp6Z3Kd/QK3egp1HGR+YR7oLA2rZMs04njHNkCI1wKRgl
 jyXVmc/rs1zIf7lR72E1JSq7pxgh15SlS1XGxjpfc3hCUVm/2NmmW8h6ukoEgunxPShY7
 4sDgCaT9hiBbNc7TFnbIcenMBs5N0Yh1uJmpMAjx3xNWJQpsyoW8Ufz4/nMw+3BZYJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vgsTVAWgPP7oS0YC6H2ZO/HFIRtgveHSRaBZfWKNHAs=;
 b=dhK59NomlzHOPgrV3sGBru5voexIHUWZBYjbSprzxpCztZ9M4jxaxdcbZGhzztC7r93p
 qJ4LKq3vjnxT9/Z2DQauGq0P3YbBZd/XwqTF3ZLvz1R5q/DrqNWeS54t3xLsLilLKvz9+
 8gWloGQoRFOJ0PRUw3CEy8C619fTpR8zedchz84T+uKUgfW4pY7Zei7JXnd9FM+z+hRdv
 m7PzY0KSU5tLSi65NXht8DjoKg6AaouBlB+AunlKqrybGLZ5KT6kQ65eG55/Zxm/O04SI
 NyAuRLyk+e8ZMoXzkMxckt2c74OiWLH1uJmcP8NhBAP8TeCgMMAM/ewV9IEREDWLkXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A835A414F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F31E488699; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5ea4614a2b110d50eb8bf2f28bbc73b31c3827d
X-Git-Newrev: dd673499e1def085fa1cdcf9c0ed092a40e8cb24
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.F31E488699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 6.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd673499e1def085fa1cdcf9c0ed092a40e8cb24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the setuptools-rust build backend and vendor the Rust
dependencies. The pure Python implementation is no longer available.

Propagate the Rust architecture dependency to python-zlmdb.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cbor2/Config.in         |  3 ++-
 package/python-cbor2/python-cbor2.hash |  5 ++---
 package/python-cbor2/python-cbor2.mk   | 12 ++++++------
 package/python-zlmdb/Config.in         |  2 ++
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/python-cbor2/Config.in b/package/python-cbor2/Config.in
index ba9383f787..c0a114e1f2 100644
--- a/package/python-cbor2/Config.in
+++ b/package/python-cbor2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CBOR2
 	bool "python-cbor2"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	help
-	  Pure Python CBOR (de)serializer with extensive tag support.
+	  CBOR (de)serializer with extensive tag support.
 
 	  https://cbor2.readthedocs.io/
diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index b4d3025889..4ec5434b49 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  21a7e1096c25ef19a81730e2c0ce05a6  cbor2-5.9.0.tar.gz
-sha256  85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea  cbor2-5.9.0.tar.gz
+# Locally calculated after vendoring
+sha256  c0be697accd3e106feb9a082f52b6c6e2b83428148ab78ce6732a76c380233f8  python-cbor2-6.1.5-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index bb8944f861..b35fba187a 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.9.0
-PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
-PYTHON_CBOR2_SETUP_TYPE = setuptools
+PYTHON_CBOR2_VERSION = 6.1.5
+PYTHON_CBOR2_SOURCE_PYPI = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
+PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/39/34/d443914ea562a985ccb357682e17b7190d5d58eff797c741379be47a8f31
+PYTHON_CBOR2_SITE = $(PYTHON_CBOR2_SITE_PYPI)/$(PYTHON_CBOR2_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_CBOR2_SETUP_TYPE = setuptools-rust
+PYTHON_CBOR2_CARGO_MANIFEST_PATH = rust/Cargo.toml
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
 PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
-HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 007ca72723..884cfff182 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ZLMDB
 	bool "python-zlmdb"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cbor2
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
@@ -20,6 +21,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	  https://github.com/crossbario/zlmdb
 
 comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
