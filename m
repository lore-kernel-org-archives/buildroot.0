Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01603C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 11:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9868179D;
	Thu, 22 Aug 2024 11:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vU3DutYYj84; Thu, 22 Aug 2024 11:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D975817A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D975817A2;
	Thu, 22 Aug 2024 11:33:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 589E01BF361
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 11:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46AB1817A2
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 11:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aJlLW8-NWWN for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 11:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C2DE8179D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2DE8179D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C2DE8179D
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:33:32 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 566802C85C6D;
 Thu, 22 Aug 2024 13:33:30 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 13:33:29 +0200
Message-Id: <20240822113329.695395-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724326410; bh=p9NCapa44X7CLed98w2FoeT6az9SWlCHpkk5RZrmO9E=;
 h=From:To:Cc:Subject:Date;
 b=M33lqRPlShjrNfr/Z3v1oRnYzuJ8RLLGjiW/rdfH8sMDK8qEepfPc8lyHUaeZv03I
 /C+rXhW+G4XjU3pK+gpQzT0/Orog4AwebRUnAZ4xmFdMeDffkEavPIJL88BxAYH/Fn
 ulIturhduFm8bY1S4ckobbOA8tU3ZhibflhWTDeHsME2EyZs9SX5gQow4q/ugr/Y0G
 3/TpIi97Nxh1gwwE/aZJ4Bv+oOY43J6haA7+SxluK2DmPcQmR8U628G2z/4CndsSi6
 soRfMjxfg7wd7Rg6oXs93gySkhtH4xKRytv01wNlTh4ljjUhitzXVSDNJTSkxidJeS
 SZVknPCVQFdhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=M33lqRPl
Subject: [Buildroot] [PATCH] package/python-django: bump to 5.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://docs.djangoproject.com/en/5.1/releases/5.1/

We need to add --skip-dependency-check to build options as django
currently pins setuptools <69.3 [1] and buildroot uses a newer version.

The Django pin is likely to not be affected by PEP-625 [2] handling,
which was added to setuptools 69.3 [3][4]. We don't really care about
the sdist name changing for django though, so we can use a newer version
of setuptools as well.

Django has been confirmed to still install and work correctly by running
the runtime test.

[1] https://github.com/django/django/commit/4686541691dbe986f58ac87630c3b7a04db4ff93
[2] https://peps.python.org/pep-0625/
[3] https://github.com/pypa/setuptools/issues/3593
[4] https://github.com/pypa/setuptools/blob/main/NEWS.rst#v6930

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a5a8c7426d..8ddc221973 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  fb167eef987a98421cad62036868a1ca  Django-5.0.8.tar.gz
-sha256  ebe859c9da6fead9c9ee6dbfa4943b04f41342f4cea2c4d8c978ef0d10694f2b  Django-5.0.8.tar.gz
+md5  77f44885427c09458e1abd0b48e09517  Django-5.1.tar.gz
+sha256  848a5980e8efb76eea70872fb0e4bc5e371619c70fffbe48e3e1b50b2c09455d  Django-5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 2c5c20ee4d..de5d2a9d06 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.8
+PYTHON_DJANGO_VERSION = 5.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/79/1c/55733805bb735e26fee0430045efdb61df6fd704b6aebf2154875ef9e6a9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1e/0c/d854d25bb74a8a3b41e642bbd27fe6af12fadd0edfd07d487809cf0ef719
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
+PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
