Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1D0C5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 16:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47598405BF;
	Tue, 18 Aug 2026 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O21RSIbBk5Tj; Tue, 18 Aug 2026 16:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4981408E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787071017;
	bh=npwazQm6TF28GQuFhWbI7IseRmIgE0plfaQEfxvotuM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VeTX3RgtkY2u6dkTp8MHl46b4gExCtHPc07W98NiYBGLpX9gKZE4PZ8VQmZQgZ3SB
	 W1fymdW79IrtxD+02XARs7EcnP8Pj7qSlxtFFBNoy2jzYiI5Zlhcz9x9Pn00nyZQQW
	 IIphR3qk+7/UFZzlAncHGSv9xmzjGVo0f7KHhvlt2Q1CGoW/nxjzKzm360Gf/lX16T
	 CTa6oeD0qhghxFVv/AxbECgFyIfe+u2pEJJSMwb13qGloGcp//M82NyTGlWHpMnBZ6
	 IF7EwxGhJmKBp5QZ7FvDzbMgBw6rovHqMKfOdF0XzXmguST4D8b3/eE30r6w5xQ3Qe
	 a8pqGSb2h308A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4981408E1;
	Tue, 18 Aug 2026 16:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57DFE39E
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55163810E2
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8mE0MqCwTKz for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 16:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1D0810E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1D0810E0
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A8D78DB2E; Tue, 18 Aug 2026 16:36:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 18:35:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e9110bf23a86d1e312e23fc19921cd911f53861
X-Git-Newrev: 2d40ae9f2c6026fe201c894c79b2fc844e953465
X-Patchwork-Hint: ignore
Message-Id: <20260818163602.7A8D78DB2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: security bump version to
 1.9.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d40ae9f2c6026fe201c894c79b2fc844e953465
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-5917 when used with libssh2

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.7

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 38486c4e4d..f8e8a042d5 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a88a42a4ea9bdab7aa8686eead3bf7d9c6dd74529caca16ab22eaa92433d31d9  libgit2-1.9.6.tar.gz
+sha256  1a4fbe7589e814777ae76b64734ad80f4ecad22cd33a22682a2aaea4ae5375e7  libgit2-1.9.7.tar.gz
 sha256  e0938121c0554985fe17196ac38fc590d149268e9c46e0c0e7a2eae1354fae71  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b4d9984540..7ae02654f6 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.6
+LIBGIT2_VERSION = 1.9.7
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
