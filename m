Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121C6D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3FAA832C2;
	Wed,  7 Jan 2026 18:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DheFj26JN4dN; Wed,  7 Jan 2026 18:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E237583279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808970;
	bh=luBBIaOzs78rUP/7AHbRiMktdt4HUUnz5O8J8mJdq14=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KXqmP3n9uqvckqZddwhuGKmMHds1MRWqYUaq2UkB+B5QAAvwS1PKTOJxqE6e9mGDm
	 mh6hYAPJWHoeBXcIO/cAmoHxiwIy8MUykJo+lfhqcvayCbBLuf4heeHur4E63luvrv
	 y/OLHTwqtnHwKkbJJYTllFZppoRFmWEQHndUvo004pAc8M/Oh2U8ULGxCSCI6bcjb/
	 iNXCRat9zPy0kXHwKJAaxo0mWAbXVBQWppPhcuwRP+9JT/rA8Hvpkqh9Wfkz8JvuPw
	 4/08GlzNLEfYB5Zhvzaj2OPvML/PZ59/Uin7d1cjxnxxozCLrlksCaH+tKL7HrkhoZ
	 pKuNXBZ7L5m7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E237583279;
	Wed,  7 Jan 2026 18:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3F725B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B729440DD6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEWkitYT6wF1 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA5040A76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BA5040A76
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79CE781340; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:27 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 24b6fcc197504e50a33eeb34a39d3d91caab763c
X-Git-Newrev: 8d4db92e66f2c7a7b7322bcb94aeb48f7f491731
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.79CE781340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/cpp-httplib:
 remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d4db92e66f2c7a7b7322bcb94aeb48f7f491731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit [1] removed the stale cpp-httplib patched but the
IGNORE_CVES entry wasn't removed.

[1] 8988278241 package/cpp-httplib: remove stale patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77d1dcd2eaa75386f8f044d213877543e46c72be)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 62255180f4..ed5c33d2a5 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,9 +13,6 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
 
-# 0001-merge-commit-from-fork.patch
-CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
-
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
