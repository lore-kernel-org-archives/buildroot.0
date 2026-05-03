Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C30CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC1261210;
	Sun,  3 May 2026 14:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2jR1X6qG4mH; Sun,  3 May 2026 14:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97EA61349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819857;
	bh=jXZ711esiKh9Z8u7sPn22K099DA9mCASl/sSLD1q6Ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KZVNDy+GejJo+D0O6x758kBygclBndL8tkQQTadU1/AObxs189oF/fqscuk+2cJzv
	 YPFjvxUtSZcXY9Q+Iw5gCPrfwPB2TLNJfAtVKqC3W9CWpzHBu58sdqW+nejJ/t1/Qt
	 D+we/ihcI8W0ZnCd5i2N3bZ/RJWny8fWqBmYvKWZ6NmfAwYvLopjklzbBQwHDFYVW6
	 31AswOGC0W4gzAuLFm4SnpLm4L3q9UHYONssgGebEz+pQWUjlqI+xlDYX4fU4+myoX
	 MGZzsGqqk05UbewSYJtvfGd7jjdaC3Hk4Lz+IqibgjXFzWLRs76HntQioGP24J+6fQ
	 UQn1qlhtMi9OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97EA61349;
	Sun,  3 May 2026 14:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3B01190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95D10406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWGPvEFHUVio for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91354072A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B91354072A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82B7083FAE; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c53fcad220ac8414cb1178d7442afa03d3a2c679
X-Git-Newrev: 66dab62b4737651a1d1e9df51fd9843438e77ea4
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.82B7083FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-patch-ng: bump version to
 1.19.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66dab62b4737651a1d1e9df51fd9843438e77ea4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/conan-io/python-patch-ng/releases/tag/1.19.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-patch-ng/python-patch-ng.hash | 4 ++--
 package/python-patch-ng/python-patch-ng.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-patch-ng/python-patch-ng.hash b/package/python-patch-ng/python-patch-ng.hash
index f832552c30..467423a887 100644
--- a/package/python-patch-ng/python-patch-ng.hash
+++ b/package/python-patch-ng/python-patch-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/patch-ng/json
-md5  208be456725a65cb570ffd3e3589f6ba  patch-ng-1.19.0.tar.gz
-sha256  27484792f4ac1c15fe2f3e4cecf74bb9833d33b75c715b71d199f7e1e7d1f786  patch-ng-1.19.0.tar.gz
+md5  ce9a4d39c104658cbee699b6522cdf6f  patch_ng-1.19.1.tar.gz
+sha256  036a3cc00134ec53f37e92333958ee75e117f2e62a5ec2b85c7122e5e815c29e  patch_ng-1.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d807f69dbc4f24153544ac011b741015ea47231c69fe16b1e74759f299349a78  LICENSE
diff --git a/package/python-patch-ng/python-patch-ng.mk b/package/python-patch-ng/python-patch-ng.mk
index fe24b0bc95..b5f285d106 100644
--- a/package/python-patch-ng/python-patch-ng.mk
+++ b/package/python-patch-ng/python-patch-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATCH_NG_VERSION = 1.19.0
-PYTHON_PATCH_NG_SOURCE = patch-ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
-PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/65/bb/ebd7c6058dcfbf634986f9a8b3fb638f3269501c73701a48b7530042da5b
+PYTHON_PATCH_NG_VERSION = 1.19.1
+PYTHON_PATCH_NG_SOURCE = patch_ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
+PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/da/b6/8ea8095f964f93567bbe28709298b30104ad418b50d4217538387bf48f7d
 PYTHON_PATCH_NG_SETUP_TYPE = setuptools
 PYTHON_PATCH_NG_LICENSE = MIT
 PYTHON_PATCH_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
