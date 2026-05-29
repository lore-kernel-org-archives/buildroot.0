Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358AACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE68042285;
	Fri, 29 May 2026 16:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jh1gD5Cxzlpo; Fri, 29 May 2026 16:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1581242288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780073068;
	bh=TciPTIEERs9i1TOxKW2DvCCpdGXIdnxAirlcB8ECvR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iUVcK9CuCB1dSUIc4MsCNhC121XPsqZu+fg0dtb8PrHly0qaaA9+nsjhwTwJ/aLOB
	 rgfju8fJrWW39mKUOSLJFuhVDLrUKNyqXwZ3Cvd84vqoOz6x2iO8rSmxszLggESi6E
	 7K6pb9vGTVf6YrOep906GqDABW1K2t/l1Y3bPt0zzYrOMiNpe6lHnA4VuT+3as28tw
	 qSJJxV559C5VosUMfxQ4kW3d2BP2wRqdjXq05631iwohD5wXkIGGumZOCMfWfdpl8+
	 DOBbK4Wcl10/KgpjvRBaVufuAq0a2aNm70mrsufgNokZ505IvCv9snKV5hEk640Szn
	 zpDna5rQxfEAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1581242288;
	Fri, 29 May 2026 16:44:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9334DF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 748B641ECD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwPZYAdKiZG5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E9041ECA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61E9041ECA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:44:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B96DB87403; Fri, 29 May 2026 16:44:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:44:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 30554b42055d1943aa302bff2a6c27ed01c42752
X-Git-Newrev: 5a761ac88c6bdb9a6a0f77d65fb92b0d25544677
X-Patchwork-Hint: ignore
Message-Id: <20260529164412.B96DB87403@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-fast: bump
 to version 5.0.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a761ac88c6bdb9a6a0f77d65fb92b0d25544677
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog:
https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md#v5014-2026-05-26

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Marcus: add changelog to commit message]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 4709b7ed18..8341aab93d 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  af7d1d9f9b169f07fb4f185c6a78d664  dbus_fast-4.0.4.tar.gz
-sha256  43137f0b73a7adbf7d5c0e9eb9d8d34df9e6e0aeafade2166e641c52dfe0a853  dbus_fast-4.0.4.tar.gz
+md5  e7c3a629f252de1aeca447c79ba40399  dbus_fast-5.0.14.tar.gz
+sha256  9c30a134be1a1e4021630e551de040ec38705213c0889ecfdb0218f83beaffa3  dbus_fast-5.0.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 895d5fefd5..91c6679e1d 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 4.0.4
+PYTHON_DBUS_FAST_VERSION = 5.0.14
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/5f/cd/402b0e524bdf37d8b1d22b1d926c538bf1d2eedf115ea1d401c6c08a7d81
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7f/6b/d4c8871e772ddf73e76bfd725dbb6fa82eb11492b370b423892016f0e579
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
