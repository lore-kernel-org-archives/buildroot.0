Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40450C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06FEB406E0;
	Wed, 26 Aug 2026 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4pZtURr7fJV; Wed, 26 Aug 2026 20:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777019;
	bh=QQHhSjyX3OskRWyijbtnYK/zGS+42fDCMwHGZxB0qwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mgn+sLkWYhhE5/0WA1teh/gsU3FKh7eViXgTNthvVxyQEWcqMc9A7AH1O4hRwuBPT
	 L9AaQwAHKwthStRuYD/Q/1rmJz8bOjiq1cUIDPdPRCsS57U2otjAySt3s0QfkbVgap
	 6rEWd8smyvXMoOYUR3TuaL690JDkSNtFiWQNoWpF+pVJfHXq9q3n2iRond3qsprdYE
	 e5aMtkICXa9MizfmvoHcNwguY9ArokUEWgs4MUO8PYbGtrcOQuAa1f7CUy6B0oSDK4
	 rse1qkN/yzAiuTXjReDeVM5RU81vyr92lWY4kvOHCAmw+4Sh0HJ4byXVW34k1eQI/D
	 //4Qpydz7pHjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AFD406E6;
	Wed, 26 Aug 2026 20:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 918E8323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8393080897
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewDNEHLebSlN for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB589808A9
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983E19204A; Wed, 26 Aug 2026 20:42:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 22:35:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f5d678c371196410082864b78e47ae0e8475f41
X-Git-Newrev: 02d8a41f0958f452570952f333cdf884f24f5723
X-Patchwork-Hint: ignore
Message-Id: <20260826204240.983E19204A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{avro-c,
 python-avro}: security bump to v1.12.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/02d8a41f0958f452570952f333cdf884f24f5723
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release includes a broad round of hardening against malformed and
adversarial input across the Python SDK (bounding allocations and enforcing
decompression limits before trusting size fields read from the input).

See the release notes https://avro.apache.org/blog/2026/08/12/avro-1.12.2/

Also update the download url, because www-eu.apache.org/dist/...
is a redirection to downloads.apache.org/...

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 4 ++--
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 9a53346cd1..4e34c27c23 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.12.2/c/avro-c-1.12.2.tar.gz.sha512
+sha512  bed6a7e324e7cac52d2bdfe0a596ab90c32c0f99ffecb517a72e465dad5fcfddc49dbfde0efa33e4c8ad73f2e97ad2c90d52f31a51f55b05576a9b36b2c3546b  avro-c-1.12.2.tar.gz
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 3e41716836..8d18f78cdf 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.12.1
-AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
+AVRO_C_VERSION = 1.12.2
+AVRO_C_SITE = https://downloads.apache.org/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
 AVRO_C_INSTALL_STAGING = YES
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index f7a241b14d..2941240053 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/avro/json
-md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
-sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
+md5  0ff774ab3e45a2d48e5b68cd688cba66  avro-1.12.2.tar.gz
+sha256  e900e7b59a4781f63d9e935e88f6ec50c4d60be3f4adf9c63b51ed39d578fe08  avro-1.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index f13ea9d2ca..37fcf76c90 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.12.1
+PYTHON_AVRO_VERSION = 1.12.2
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
+PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/5f/68/973b9c682aa2c3cf2b05fc4c961af11b9be1d9b46604f65aed23cd4fd1e6
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
