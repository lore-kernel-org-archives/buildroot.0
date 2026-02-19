Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D59CE9A04C
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 14:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0093082733;
	Thu, 19 Feb 2026 14:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0thuJPBolTq; Thu, 19 Feb 2026 14:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD00826DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771512208;
	bh=U9gbgv+wj5Z3IZH6SdUYbh5b99eaVQUslifblKaaxBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AcqpcTexjQn8Wsz+iXX1dIrLQGKTV270sstGQ8ehnrmxU5bfLXVon5Q8NVG25id2m
	 0+ptlxsEaFPi1H4wT1KuSBdPP18Zz1sVYUHKdzH9vpUymWK9mAw/LMxn5ujiQ5KtXM
	 4/kZAH0c9FnSV2vy5vRQIufzwzsbbnl0wdEmnKv0udZKXGo4a52OiM478Ilm9w1bbF
	 G5FMNLKY59lUPufiLJV/UUC42Jz6yUiC/vfLRJei27Q5Kw6YV7jnAHcEVeYPUGZvjm
	 q18RLhHMmGF/CxZ3amiyfCF8jCegDDjQcVP3fgZY1EMMG+CtrKk18fd4fBhh5FdGKt
	 joGVrY6xTh08g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD00826DE;
	Thu, 19 Feb 2026 14:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7458206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF1982684
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3pDHEHXCZtu for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8297B81DD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8297B81DD8
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B97D87059; Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 15:31:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 575bd0d04d14781c95e9563fac09abe57b3e6d1a
X-Git-Newrev: 7dfa4d3a25076361fbe8ec1ba7d4029830e93103
X-Patchwork-Hint: ignore
Message-Id: <20260219144324.7B97D87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette.mk: bump to
 version 0.52.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7dfa4d3a25076361fbe8ec1ba7d4029830e93103
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here: https://starlette.dev/release-notes/
This also includes the versions 0.51.0 and 0.52.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 9b84774c86..72c56012f7 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  f3479ed026aeaffb43af371d3b7db527  starlette-0.50.0.tar.gz
-sha256  a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca  starlette-0.50.0.tar.gz
+md5  3fafce592e3b272a54e2fe7727397fc1  starlette-0.52.1.tar.gz
+sha256  834edd1b0a23167694292e94f597773bc3f89f362be6effee198165a35d62933  starlette-0.52.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index af8a49e0fd..9831fbcf13 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.50.0
+PYTHON_STARLETTE_VERSION = 0.52.1
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ba/b8/73a0e6a6e079a9d9cfa64113d771e421640b6f679a52eeb9b32f72d871a1
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/c4/68/79977123bb7be889ad680d79a40f339082c1978b5cfcf62c2d8d196873ac
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
