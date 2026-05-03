Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93092CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A7E842F6;
	Sun,  3 May 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5qnBhOEThQH; Sun,  3 May 2026 14:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D47842FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819904;
	bh=2MsjFNfneEjshKDKZ9tCuZ4Vkw4dyHE0ZtnNzBB1/HU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AR75iMQiwndhlP8fFZ7jK1SPh6J00/lLauShdD/7M2VjkB3v43uNcXh48X9ooswpq
	 0i1VOHAwtsNZfjisX4Llx/w80ccBpE/FEGdwsdzQYQVJHZgTJIn2lijPGjnOCM9i7Y
	 wSwjA716Jp1jVfSCQPyABr81wnTyMQUwuY1ZIf3LwL+C+WIft6UpGHe1sDpIWoK9eo
	 iCblSNMLBNfZ8w9Ug1XqEL2Ma/IN8jRc8iY7vwcsYo8KsbXqDaQrIvBwG5ekre1k/J
	 sUrjpXd50fgJETfV7zKpXR2cBmlp17zvp+BEAFhVls4dxCjqK2S5B5tDL0DgPnbE2v
	 UjA0ye3KLiQkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D47842FA;
	Sun,  3 May 2026 14:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 090EC190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4818406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-ZrTQqSJrLB for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150C74074C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 150C74074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56A883FC1; Sun,  3 May 2026 14:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1faa61323c3c32ab8dc3779886266a7e79b67947
X-Git-Newrev: a3982407cdff3c7314f58d4042dde6d9af246c1f
X-Patchwork-Hint: ignore
Message-Id: <20260503145050.C56A883FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uswid: bump version to 0.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3982407cdff3c7314f58d4042dde6d9af246c1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/hughsie/python-uswid/blob/0.6.0/docs/source/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uswid/python-uswid.hash | 4 ++--
 package/python-uswid/python-uswid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
index 3385fc58a0..d9b890913a 100644
--- a/package/python-uswid/python-uswid.hash
+++ b/package/python-uswid/python-uswid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uswid/json
-md5  3d4295821faf35512528381716126c03  uswid-0.5.2.tar.gz
-sha256  1d6c53acf160edc9b42e4ba535343b3567f2f341d289b9e63ca6a84372c2c518  uswid-0.5.2.tar.gz
+md5  9dad3f374739448c3aaff9cedb1810df  uswid-0.6.0.tar.gz
+sha256  98b04b2750aa7ca97fc83c65cb24808174c3cd5f7e99d96727161034963137bf  uswid-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index 8596307938..3ba20ef476 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_USWID_VERSION = 0.5.2
+PYTHON_USWID_VERSION = 0.6.0
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/15/64/d200424bf8f87ef25b516d438d745b03aa4ec381756d86cc3ff6bf29393c
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5b/4b/4eb0e287c6587f55212e87eaf24d262d21d47a56d034dfae11649eff613f
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
