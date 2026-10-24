Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SaoLqm/u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E9181775;
	Sat, 24 Oct 2026 14:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_Vckhwiz-ly; Sat, 24 Oct 2026 14:08:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF7D481585
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792850903;
	b=LtrsN5NzflY57zLfezgPIy8yAdyHAc/YlgG4CjFGaPzZ0DCUwVKPvv4bPZDF7TLHzrbt
	 6En8MUzxNqUvc4eBNiw372FcPnCzG+5J+ALuIpG9jrXUazCkiTEAdKXo3ObMYrkFISAe9
	 nMDkBuJu0xuNWHbK7HQzgSCV245FikyhN1aU/SByGvB9S3Nb+M/ANRjHKqu1eFfrMNO5P
	 da3s9QRJKjotI3CiXCOSfF1UGf+KObuKxZyBH4WFXKUehzA7hxTTt+E88Vulz+QD6uQvN
	 RxXOc4gkkFBnaiohw3StB5zP1XnYr7U6NlM0hMV8jABXBV1c7pUlOWv0shO+htgnkOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792850903;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K2PLtnkf09UhShjtpycHN3l1bxIKd9n4wLAGLdvaHSA=;
	b=o6gmj1hkX4pDw8/AyKaRLMzwqesWfCmYkrss/hChklhn4rmzebJD+DohaJ/zhLlmzO6Y
	 mk8Oz38Br7IAkvLHavrQ58Zu270uUpFa9ha3bhLnFFK7FK+/bnKP8xRpfCtzn1D9Tiavu
	 nXIQLeWpURTMe4m43bh8bf7uBC/HBJRFB0nJU8+11zArkz9sw9OtX5UadWFZd36ApkJ72
	 dYtDsRWpLjS2WoXCFk4sYsJdOgxn0M1TDGI5k7Cf4Mb8zf+RsaY4YrsRqYanuSYoCqOMR
	 lVjDIsowhjcriSVXMC9dc8mPm5CISIHw//nGGmwuYMPebmD3DEvlQtbw+0KWiSSKPnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792850903;
	bh=K2PLtnkf09UhShjtpycHN3l1bxIKd9n4wLAGLdvaHSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=SaoLqm/uRcfOdElGu5HmRO/SA3Q7gT1FvewZNWrsMKehmuxRuBq2fmlpVjfckEphj
	 5R1SdG1SNjKu/a3nMAuSw3oU/tMDkbq3iZa+tCUM5e5IsQyerApDxuk3WoPDMe/iws
	 7yOmdg8u/Oc34uV7TZzp18EFBd+xq+pcpmWeLbe+F3+ymBaFENQqGf6lJjzZJghm3C
	 47oG/zPCoTXQX375/9uBhG4Sr4AlPxWUon7u7cF2xoXkW+rzEPwExj7KCkfqvNTRZC
	 ajYN1QO/t2wDxfq8hPlHD1BqzSQPH5LAQ2BCcNHx+CkiCbVwa2xaqkB6JqIOhp/4fa
	 QByylhCHa1zYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7D481585;
	Sat, 24 Oct 2026 14:08:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3F53C4
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74F7160680
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx-_BDgeJA-D for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CBE7560688
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792850901;
 b=MSa6TsMU9flwK8FfRAIJr4889wjFq/ib+qpAtmKm9UawGdhlLXVCmRuetCjmuzQxcydg
 Q25wmJ2bUf6c5XnAZV3o+fWRupCGpxZBUJWsB1vxKEv2GdT3sssix1ZvtdlmacwOhrrKH
 sh6noXwyJRR6ph5vP9vRZV9fPalAS43OeVAj+XEB/entKzRDSCoflnFFMONIFGDJbz20N
 WEXlCrrPTghNxG+sQ2IhYZuq6o3+TB8iteqMgilJB8nFDGUtL993PlNuy7HZQLS5cdofh
 owEOCUt7lK033ED4yHTHhpb/NtdmqmAIxzZ3AG1HHFgavDl7NDkiClsWXtreLec8ifA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792850901;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=b19GZanRR/3/SV933jJ1RsNJgdT4TbHdodGUKob55lI=;
 b=J5m2jWrBVbWj0ZjgwjaHw6fS9Qe2Bh7A9r9IjVs0ZX8DLuR/gTy64CkF4amDySgeegsU
 nqaQHD8TRg1ZvrG0l+nMKRZAOqolK5Jhm2DYXyKxuCx/G/EOFL459PhZlAjaNkkatw+CK
 83/oxMDbcs+s0xEkeYR2yzT3hkuq7Qq3BniFgLb7BBcA90NtkL6ERwKLhnII62uNZTeI1
 KLAyzMXV4kFEP05APNBi6F5ppp07xVkKRd2N9nt1YNY5cX3fpBxkPP0ZDW5pfBmkEY41l
 GC43zgdfKnctIOJlwtO0QRX5QDQSlH2Lst4f72K8rsIQvKhLBUCWa8yIciv5FJVYy0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="eB/vgmTW"; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE7560688
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:08:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1xAT073xVL-00NQu4; Sat, 24
 Oct 2026 16:08:17 +0200
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:08:03 +0200
Message-ID: <20261024140803.1467342-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SULCZKV8ql/LjEMR6+VbaKO/LAn471BZ8dLXN+1FAQeAP91e/7V
 dk4SFske95Rwkvoo3M8UrHT5INA5zx06owfXE5GEoM4nTeC+VkbcCsQC+l7Rhd+2VzlbuQk
 DgmwK/Z4hxB9dZmwFX2Oey+ZeRPJVEtVyf3nE5LBKt62d1iGUJrCb7/f5hv9X+iGSa78NcM
 PuTAFgqJK5jrFNURBrbow==
UI-OutboundReport: notjunk:1;M01:P0:/XWHmMbbMq0=;ZRKuJebO1y6XvHM5v2fVM11swVX
 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
 ==
Subject: [Buildroot] [PATCH 1/1] package/python-brotli: build against
 package/brotli
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Adrian Perez de Castro <aperez@igalia.com>, Julien Olivain <ju.o@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

By default, python-brotli builds the brotli libraries as part of the
Python module. Set USE_SYSTEM_BROTLI=1 to disable that and link
against the libraries provided by the brotli package instead to avoid
duplicating build time and code.

Also add notes to package/brotli and package/python-brotli to keep the
versions in sync, to avoid any incompatibility issues.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
On my system the build time of python-brotli (extract to taget
installed) shrinks from 20 sec to 1 sec, and the size of
target/usr/lib/python3.14/site-packages/_brotli.cpython-314-aarch64-linux-musl.so
from 806 KB to 34 KB.

Of course a build that uses brotli only from Python trades that for
having to build package/brotli (which comes out to about the same time
& size), but for anyone using both it's a nice improvement, and in any
case its cleaner.

 package/brotli/brotli.mk               | 1 +
 package/python-brotli/Config.in        | 1 +
 package/python-brotli/python-brotli.mk | 7 +++++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 47e2f8e57c..6dca818e7a 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Keep the version in sync with python-brotli
 BROTLI_VERSION = 1.2.1
 BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
 BROTLI_LICENSE = MIT
diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
index ca493bfeff..81d55be5e6 100644
--- a/package/python-brotli/Config.in
+++ b/package/python-brotli/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BROTLI
 	bool "python-brotli"
+	select BR2_PACKAGE_BROTLI
 	help
 	  Python bindings for the Brotli compression library.
 
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index 6f5e966a05..0cf0b4bdd6 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
+# Keep the version in sync with brotli
 PYTHON_BROTLI_VERSION = 1.2.1
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
 PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
-PYTHON_BROTLI_DEPENDENCIES = host-python-pkgconfig
+PYTHON_BROTLI_DEPENDENCIES = brotli host-python-pkgconfig
 
 PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)
 
@@ -18,6 +19,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 PYTHON_BROTLI_CFLAGS += -O0
 endif
 
-PYTHON_BROTLI_ENV = CFLAGS="$(PYTHON_BROTLI_CFLAGS)"
+PYTHON_BROTLI_ENV = \
+	CFLAGS="$(PYTHON_BROTLI_CFLAGS)" \
+	USE_SYSTEM_BROTLI=1
 
 $(eval $(python-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
