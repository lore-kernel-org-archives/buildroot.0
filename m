Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897B2CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 09:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFC561B10;
	Thu, 16 Oct 2025 09:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3kFJ2sjN7vs; Thu, 16 Oct 2025 09:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4824D61B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4824D61B0C;
	Thu, 16 Oct 2025 09:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82143968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 09:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74329418BB
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 09:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py1ItxQ0kVgi for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 09:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73DB440623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73DB440623
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73DB440623
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 09:21:49 +0000 (UTC)
Received: from framework-OT (ip-185-104-138-122.ptr.icomera.net
 [185.104.138.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 57E2C2C8442B;
 Thu, 16 Oct 2025 11:21:46 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 11:21:23 +0200
Message-ID: <20251016092124.800402-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760606506; bh=yWe5U2udixI2YdLdIbd02cFxOu2LF8CIPfUmSlEC/5M=;
 h=From:To:Cc:Subject:Date;
 b=GNnDdxzoFTcTanvy7XpwDxtAbXu79LBkej4tUZGwymvFe944Glwf9z54jKEYhtOb7
 x98NhCARh94J1N1xDpynRNzrH5e3ol8DGo/Ezyyiw6c1PcYEgUseZr4olyFcAa384m
 Df5I7M/PKz6DWVr9TTCAmlRF6LQO42qJT/VopwbdBh+wHaGJhth1H/NxC3KWuOMToa
 R8g946NUfdWm3hkqkGPcYD9wf9qpf6NM9gQaegPtK6dEBml7cjU5RN5EawlP3C60n3
 El4Lrqbrb6QP9lf4g3j1pV7YvwdnEkQjhfthAmsoLTQx4kneLRbwRcRxOAx17Gc/5L
 DzQLQF+pB0B8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GNnDdxzo
Subject: [Buildroot] [PATCH] package/python-charset-normalizer: bump to 3.4.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md#changelog

Upstream setuptools-scm build dependency. Also the upper bound of
mypy(c) is currently high enough that we can remove the
--skip-dependency-check hack.

mypy(c) is now also optional if CHARSET_NORMALIZER_USE_MYPYC isn't set
to one. As we don't really care about the performance optimization in
the host package we can skip the mypyc step and remove the dependency on
mypyc for the host package.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-charset-normalizer.hash                    |  4 ++--
 .../python-charset-normalizer.mk                      | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 0518440057..dd10c11e73 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  1d808eb9efaf70bf0ec3b800f3c7dca8  charset_normalizer-3.4.1.tar.gz
-sha256  44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3  charset_normalizer-3.4.1.tar.gz
+md5  3c73a3c5c05a896c1169d8b5298dc4e5  charset_normalizer-3.4.4.tar.gz
+sha256  94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a  charset_normalizer-3.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 64a82dd016..8b9c954bce 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.4
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
-PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
-HOST_PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
-HOST_PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
-HOST_PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
-
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
