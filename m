Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9795C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE000847CB;
	Fri, 28 Feb 2025 16:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0Xx3EG-YMWZ; Fri, 28 Feb 2025 16:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BBB847E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BBB847E5;
	Fri, 28 Feb 2025 16:43:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 215B31DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E4AF419F3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xvRiGt-FRXa for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C97F42509
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C97F42509
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07D148772A; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 14:06:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdd2803e1b5a1f0e716550ffc16c6fdee2213d47
X-Git-Newrev: 6780975af09776a7f4ecc5713416dd8ddbaec87c
X-Patchwork-Hint: ignore
Message-Id: <20250228162945.07D148772A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-httpx: bump to
 version 0.28.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6780975af09776a7f4ecc5713416dd8ddbaec87c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop no longer required python-sniffio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-httpx/Config.in         | 1 -
 package/python-httpx/python-httpx.hash | 4 ++--
 package/python-httpx/python-httpx.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-httpx/Config.in b/package/python-httpx/Config.in
index 592cd559cd..0d20e6ca06 100644
--- a/package/python-httpx/Config.in
+++ b/package/python-httpx/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_HTTPX
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_HTTPCORE # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
 	help
 	  The next generation HTTP client.
 
diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
index 3ffd491c9e..b2609c9b5c 100644
--- a/package/python-httpx/python-httpx.hash
+++ b/package/python-httpx/python-httpx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx/json
-md5  f29763f29da610b185d2ca33937c572f  httpx-0.27.2.tar.gz
-sha256  f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2  httpx-0.27.2.tar.gz
+md5  774cf32b9cd94a44189fbe5871026664  httpx-0.28.1.tar.gz
+sha256  75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc  httpx-0.28.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index 21bbd48a58..aef46a33bf 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX_VERSION = 0.27.2
+PYTHON_HTTPX_VERSION = 0.28.1
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956
 PYTHON_HTTPX_SETUP_TYPE = hatch
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
