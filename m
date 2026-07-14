Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C0C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE8840729;
	Tue, 14 Jul 2026 10:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0B-FBOyZgzm; Tue, 14 Jul 2026 10:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F2C4067C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784024169;
	bh=lEpwtsHO5O28/GHL02wp5T8Mt2e4npQGUJrkwoS/roE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nIbYYKCGe7HqYXrJah6CieRMIPh6ti1/hZ5ZrkqheeayccDHyLq+XsMF0Jw42SUuM
	 78odJAfFhUaivfW9NbjfTJmZ/LCXQM6sxPl+Duke0amyQb3i5M0tTydK6kKgRvXUZ7
	 N1BkUO8JGxET8WVGRwvENCotnhP4YW96tyBvg3zdBhiXnx7wLLxSAEfLKjP9gq0OAC
	 V++GQ7nfY4pH81W/LIcEV6Uch6LnsLwJylJdxozXIThd5R/tI4o7E3TLQlEXHMOWvA
	 QFrY36tNKjJFFf8MKkQkaqn4yJBQO0F6rb/DitRbMBpLVksaM+zk1Ctg7NV8z7P9aU
	 FcYox8yN6UeHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F2C4067C;
	Tue, 14 Jul 2026 10:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A47128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD044067C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pg1Toh8h107B for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C6944067A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C6944067A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC4B8886B; Tue, 14 Jul 2026 10:15:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 12:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1aa7228e661fe82489d12ca8272c31138f252ed
X-Git-Newrev: 500961bebacf0b631de223ceb412abcfe5e446dc
X-Patchwork-Hint: ignore
Message-Id: <20260714101532.7FC4B8886B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiod: bump to version 2.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/500961bebacf0b631de223ceb412abcfe5e446dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here: https://github.com/brgl/libgpiod/blob/master/bindings/python/CHANGELOG.md

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 package/python-gpiod/python-gpiod.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index d3277c5a20..a94bbaffaf 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  c9c2fb67d78204896d85a7945314356f  gpiod-2.4.2.tar.gz
-sha256  602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7  gpiod-2.4.2.tar.gz
+md5  b9df2fa69d4d7a77b0d5c70ff157a6c9  gpiod-2.5.0.tar.gz
+sha256  53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a  gpiod-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 6881f0df43..592107111d 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.4.2
+PYTHON_GPIOD_VERSION = 2.5.0
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/fc/c2/c7bc26965855f39ae3e1b09b404a1fdc3b172dac371012c316f5b9b6a314
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
 PYTHON_GPIOD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
