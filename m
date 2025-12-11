Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE99D4335B
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C076280F1D;
	Thu, 11 Dec 2025 22:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsioF191F_B9; Thu, 11 Dec 2025 22:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D204380F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765492204;
	bh=BRiAlDiMXx0hvV9bJdcqjCMsj0Gn3h+6qkrqwe9Ueoo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eHNdO77mwvllqtfjhYdG5HJXo5v6StbTsJfYnEjyHhzIz2UzUJqMn4o0Q9DIfGu/S
	 YXxXMcL9XKnu9ko1DDgi7vlydk3HbIEQTRdxhaS2iYUW8J7DMKJdxcjG9dzkjjn2uW
	 JBnoBKDkbACBPoN5F1BPTnFyXOk4vWdga7bkW5I7TjPujtEQgb6YU39qntOOaPvmNC
	 5d8ItXMMPqFWTG3MuCqbDjOZZId53xyPkx1xRiQOmUEGAAqpnYIMhRi4Ri9tTlG7bi
	 vkMVQmt65GrMn2J6aRNK1Ipj983rjLHs8HzmdApVHb7Ui9OTdSJ+dd9s6Ip4hwK7YF
	 wQW+4rvzEOCIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D204380F37;
	Thu, 11 Dec 2025 22:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4E42C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A307F80F33
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qAzyCHWKniF for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF82080B20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF82080B20
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD8A686C29; Thu, 11 Dec 2025 22:30:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 23:08:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dd501bcc9fe95ff315e1b92539a6989e08d049c
X-Git-Newrev: e73101a0c3de59bd81a6d57a9313df8ac5c7f8a0
X-Patchwork-Hint: ignore
Message-Id: <20251211223002.DD8A686C29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: security bump to
 2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e73101a0c3de59bd81a6d57a9313df8ac5c7f8a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.6.0 fixes the following security issues:

* CVE-2025-66471 / GHSA-2xpw-w6gg-jr37 [1]:
  Fixed a security issue where streaming API could improperly handle
  highly compressed HTTP content ("decompression bombs") leading to
  excessive resource consumption even when a small amount of data was
  requested. Reading small chunks of compressed data is safer and much
  more efficient now.

* CVE-2025-66418 / GHSA-gm62-xv2j-4w53 [2]:
  Fixed a security issue where an attacker could compose an HTTP
  response with virtually unlimited links in the Content-Encoding header,
  potentially leading to a denial of service (DoS) attack by exhausting
  system resources during decoding. The number of allowed chained
  encodings is now limited to 5.

2.6.0 also contains the removal of a deprecated but apparently still
widely used API. 2.6.1 reintroduces this API. [3]

Full 2.6.0 Changelog: https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#260-2025-12-05

[1] https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37
[2] https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53
[3] https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#261-2025-12-08

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index f4162882f7..9376221040 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
-sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
+md5  52150787074f43057a0e691c7ebe00d8  urllib3-2.6.1.tar.gz
+sha256  5379eb6e1aba4088bae84f8242960017ec8d8e3decf30480b3a1abdaa9671a3f  urllib3-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 9ec6c7f3c0..5b68dea6bc 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.5.0
+PYTHON_URLLIB3_VERSION = 2.6.1
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/5e/1d/0f3a93cca1ac5e8287842ed4eebbd0f7a991315089b1a0b01c7788aa7b63
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
