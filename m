Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338EDCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A13785B6A;
	Tue,  9 Jun 2026 13:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYqlxCq8QJAx; Tue,  9 Jun 2026 13:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E59CD85B79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010251;
	bh=k+Psxazto1vcq/kC+/QtpEwovy/Aavi4miZClAtmD90=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=McZKN+gXCliUO1TqSN5Rmlj1ErvmBIxh5/spcWBgtjoRHh8V6MK1607hc+K333sd8
	 zBtBR+iTHAxsYhRG+eWS2GmD7eqYgYm0DYsknt4RbnINmqWFnjJWOoYTLK236U4XyM
	 F9p0SkLM9qrnP7KraXuOuKQM2CyfL6G3i857/f1AQ15kHZWv+BhJVlW/ss75P14pJf
	 0YWRa29gLzVB+C6+9pzOjIDTJUQQiml1QVkfN5DI0+RfAPFzIViLmM8x5mlLjfEGjI
	 85LE55+FEpvZRoqhzGmYhJfWYajQb95cf+V+DMd7TGfUbgROO1GsiDgjetPoyFQhNi
	 TGc9g8Ee5j1qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E59CD85B79;
	Tue,  9 Jun 2026 13:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC6E9196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C09742716
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZWrd-wAPBBM for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4AC426DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B4AC426DE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 970B287E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:19:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0b43038a3a743156e4cbe447e54199c765d2ad8
X-Git-Newrev: 6e13cdd9a05fd85abbbdc297a08a7ac63475067e
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.970B287E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 1.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e13cdd9a05fd85abbbdc297a08a7ac63475067e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
* https://starlette.dev/release-notes/#101-may-21-2026
* https://starlette.dev/release-notes/#110-may-23-2026

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Marcus: add release notes]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 4aa8d75119..bed49bf689 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  2c35b502eb0f34a3708d743b3e817186  starlette-1.0.0.tar.gz
-sha256  6a4beaf1f81bb472fd19ea9b918b50dc3a77a6f2e190a12954b25e6ed5eea149  starlette-1.0.0.tar.gz
+md5  2d1e880ba9520c487e52dec610a0dfc5  starlette-1.1.0.tar.gz
+sha256  e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f  starlette-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 8d369d53ab..20126e11ae 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.0.0
+PYTHON_STARLETTE_VERSION = 1.1.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/81/69/17425771797c36cded50b7fe44e850315d039f28b15901ab44839e70b593
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/95/66/4d20cdf39a8d6a51e663b7038e3b828ff211d3891a43a713fe7e4643f3a8
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
