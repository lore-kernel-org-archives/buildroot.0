Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06879CFD641
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916FD8209B;
	Wed,  7 Jan 2026 14:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIvPiiMYMpHz; Wed,  7 Jan 2026 14:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5A682028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767795630;
	bh=wxUZIr9E2b1f05xemr2VADwvdfquKugfXQkoWa8rUmw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WxnAD6x5Ez+x7pbmxDcaKwlxbSvZhwQ8X5XT669DFwmBpMEMmXtB46ts9I3C14cvM
	 Yn4igY8uo0sEKplbkFJWKRJh0UJ3uZmdJ7UtY8USN0X7fXBHrdyCujx8YAOGHgfRFG
	 /jxSV6o1gqKTEHOc3dnmdzM82bJtmPXszK+aP1n7etCmZhASqPRlFBwl25TKMz7lpj
	 XPY1If+eSdn2oGVPqR8w2hP58l1kpblx8eP68ckzQkx5aAMbvhprIkE6pyKo6qiFxb
	 n3OTEVH4s5e0DY6ohOweh3ZF3EW3M2wxhKNPljTNJZvXpZ94RySOAwzXEc+vNpF0Qs
	 zHo04DpOH4FWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5A682028;
	Wed,  7 Jan 2026 14:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70169970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56FF960817
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HG0mUmUIvCg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B246607B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B246607B6
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B246607B6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:20:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D14411814B9; Wed,  7 Jan 2026 15:20:23 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 15:20:15 +0100
Message-ID: <20260107142018.131972-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1767795624; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=xb50nZpyUzYUz/XrHa9qwyPWjbyCZtne1KllbpoITak=;
 b=nCY6SiC3K0rYvA+7B2Vdkqk5eBZn4f+6/F7jiXET6zcCKyIgso+gVyRY7iTTANCysjQNUP
 eP05hIeD7IvlsU/Rf7uAFCZNYLs13Rm6aF23j9ALf8xBPe1Nppa8NIxZX2wl/u2vVi3d/a
 X1CoOxqLxRi4pCqF1TrXiNnkIIQwp78=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=nCY6SiC3
Subject: [Buildroot] [PATCH] package/spdlog: bump to version 1.17.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/gabime/spdlog/releases/tag/v1.17.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 947acb0dfc..7fb80dd2ac 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8741753e488a78dd0d0024c980e1fb5b5c85888447e309d9cb9d949bdb52aa3e  spdlog-1.16.0.tar.gz
+sha256  d8862955c6d74e5846b3f580b1605d2428b11d97a410d86e2fb13e857cd3a744  spdlog-1.17.0.tar.gz
 sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 245feac801..b12666613c 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.16.0
+SPDLOG_VERSION = 1.17.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
