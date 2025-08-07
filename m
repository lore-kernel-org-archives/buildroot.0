Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F9BC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29462804BE;
	Thu,  7 Aug 2025 17:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3Ik62WaCPqa; Thu,  7 Aug 2025 17:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFCA804BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFCA804BD;
	Thu,  7 Aug 2025 17:19:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5927531
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73BC780C55
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVg4hhQ7nuwa for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E8E80C3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2E8E80C3F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4E4A86FE4; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:04 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 0cc802c363a32850fd2273a9083c67fc29c0deeb
X-Git-Newrev: 108ed8dc3f0531656147af29d39e7b30d012fd56
X-Patchwork-Hint: ignore
Message-Id: <20250807171914.A4E4A86FE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-aiohttp:
 security bump to v3.12.14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=108ed8dc3f0531656147af29d39e7b30d012fd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This fixes the following vulnerability:
- CVE-2025-53643:
    In aiohttp prior to version 3.12.14, the Python parser is vulnerable
    to a request smuggling vulnerability due to not parsing trailer
    sections of an HTTP request. If a pure Python version of aiohttp is
    installed (i.e. without the usual C extensions) or
    AIOHTTP_NO_EXTENSIONS is enabled, then an attacker may be able to
    execute a request smuggling attack to bypass certain firewalls or
    proxy protections. Version 3.12.14 contains a patch for this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-53643

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e4451602ebee8ef6f6b354e8f9b6dcc80206f079)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index ac12cafeea..0aa8dbd3bc 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  7835f28e41adf6f09467533e8de0c199  aiohttp-3.11.14.tar.gz
-sha256  d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c  aiohttp-3.11.14.tar.gz
+md5  4ed66dcec63108ae3a7c01d0415b4dd9  aiohttp-3.12.14.tar.gz
+sha256  6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2  aiohttp-3.12.14.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index d3e7d12eb6..e52b6e81c5 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.11.14
+PYTHON_AIOHTTP_VERSION = 3.12.14
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/96/91e93ae5fd04d428c101cdbabce6c820d284d61d2614d00518f4fa52ea24
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
