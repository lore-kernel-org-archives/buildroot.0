Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427D6CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BDBF842CE;
	Sun,  3 May 2026 14:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcAibnJyIL6w; Sun,  3 May 2026 14:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48137842D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819887;
	bh=XRZbR4JcgA6duoXNb/7tMnPS3RfG+AhRr12TA+m2PgA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kT5c3/jUJl05v4qDF2xV9pMTV/Reh7K2qpixoJy7+vu8x9y8PF5kCxQXw86U4e/En
	 oKl4cHcnw+2WsA1os5ndQHyvLlcl1yIli5vxPQ3ys5X/DbB8C6NcYozI28DHVf8BWG
	 YxLLh77hWZetErEFVynobr00GjIDpB4SCokqzkyWfF5s86bbCf+RYVQTpHbXYDUBKi
	 RIFVGbANTM8SI10OgF29R3nq0+C4pt4K30t/EChQj/DykB2zav9ScRD2z1Qos5hdDD
	 f+hN8eB91ImaCcZi8Yr5hHx55TRVaQjELqIOo8ytD/yj2dWh9zThhwGIzU1BXkDxEP
	 Ec8ZzaHolFb2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48137842D1;
	Sun,  3 May 2026 14:51:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10139127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB97E84267
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-AT_TUj05Zo for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9F184270
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F9F184270
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCAA783FC0; Sun,  3 May 2026 14:50:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d695881f8dc68ff1efe2cce75dda462c5990e3c
X-Git-Newrev: 444160f8d548e401b5bc4bcee16456e5bb8143cd
X-Patchwork-Hint: ignore
Message-Id: <20260503145045.CCAA783FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump version to
 2.58.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/444160f8d548e401b5bc4bcee16456e5bb8143cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/getsentry/sentry-python/blob/2.58.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 8ec550c4e9..f1d47352c2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  e8e3d9ea3aa3c7fdc465b33b10505aa3  sentry_sdk-2.54.0.tar.gz
-sha256  2620c2575128d009b11b20f7feb81e4e4e8ae08ec1d36cbc845705060b45cc1b  sentry_sdk-2.54.0.tar.gz
+md5  05b3bf19415d54f831e52d83e4371ce9  sentry_sdk-2.58.0.tar.gz
+sha256  c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f  sentry_sdk-2.58.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 21795bf449..585a1c2cda 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.54.0
+PYTHON_SENTRY_SDK_VERSION = 2.58.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c8/e9/2e3a46c304e7fa21eaa70612f60354e32699c7102eb961f67448e222ad7c
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/b3/fb8291170d0e844173164709fc0fa0c221ed75a5da740c8746f2a83b4eb1
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
