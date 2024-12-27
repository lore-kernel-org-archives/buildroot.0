Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7E9E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B412060837;
	Fri, 27 Dec 2024 14:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4cXjS7snh-4; Fri, 27 Dec 2024 14:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C326085C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3C326085C;
	Fri, 27 Dec 2024 14:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A225BF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC61402A0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDTSQ8iTfCAn for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0493440177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0493440177
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E50A38751E; Fri, 27 Dec 2024 14:31:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 13:57:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3960334ba26c5f7235e5865c3d61ccef901aefe7
X-Git-Newrev: 8ddfab3770591ce2435a61d027efd46ad098ea1d
X-Patchwork-Hint: ignore
Message-Id: <20241227143124.E50A38751E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.11.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ddfab3770591ce2435a61d027efd46ad098ea1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-propcache runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiohttp/Config.in           | 1 +
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 01a1ed8a3d..08883316d8 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
 	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index fd3ca7d72a..0aa22e9fa3 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  fa0526dab4bf4b755537ae5718a43e25  aiohttp-3.10.10.tar.gz
-sha256  0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a  aiohttp-3.10.10.tar.gz
+md5  17f04b60068122e998a60a3010679501  aiohttp-3.11.11.tar.gz
+sha256  bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e  aiohttp-3.11.11.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 17eeae72b3..19e62745e0 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.10.10
+PYTHON_AIOHTTP_VERSION = 3.11.11
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/17/7e/16e57e6cf20eb62481a2f9ce8674328407187950ccc602ad07c685279141
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fe/ed/f26db39d29cd3cb2f5a3374304c713fe5ab5a0e4c8ee25a0c45cc6adf844
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
