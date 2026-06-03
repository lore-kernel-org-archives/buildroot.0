Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E785CCD6E72
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA24A61651;
	Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1raRPTaIFHG; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D37106157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512589;
	bh=h0XtlsaiV9mGn9Ovgmy9dXRRvGZJ5Bq2dwmuZ5wxjgw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nSfiG8ZEx8N0jGuOBBG1cqxr9maN4Txklj6I0C0MgxdahkpbZY6y1tzVrLMKLKDiP
	 nlJpysMjpTva8hgld8s5Cx8HJVbcAWsmsRSTUvfE6iSVJ0ORYzsLJcraXfmEBdCc8N
	 ErofkANYqTFF4fyjE2C+pi3QC8HbTID0X6JuSKMFp9HGCDerjg8g30BBawSzIyFrh1
	 Zgygli1LxbleJg9E8m+EPnK1pDFRFqAfcHP++bVZ7TIVDSvhguccp65ckjnR2T5efM
	 hhGoev/wiYMJkp1q4u8jhVT0zO+n19G7nDC4rW5nJ9BQiSXcpAPuIRdMH/FrUB05tH
	 eE0YIUGsrbyUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37106157F;
	Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BB9192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 223458084B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzhrLDAJZLQq for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6295E807CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6295E807CA
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5608F87991; Wed,  3 Jun 2026 18:49:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9ccc1109c955f86e95afa0656220de6d7a4ebe3
X-Git-Newrev: fb756443fade620d1bab26724ed8b50239d19c8a
X-Patchwork-Hint: ignore
Message-Id: <20260603184932.5608F87991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb756443fade620d1bab26724ed8b50239d19c8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.2.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index d8df707924..c9739b2b92 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.0
-sha256  94017020f96d025bb66ae91574e4cf334bcad23e8175a8a40565b3721bc2eaff  harfbuzz-14.2.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.1
+sha256  a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e  harfbuzz-14.2.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 36b53f53eb..77d96febf3 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.2.0
+HARFBUZZ_VERSION = 14.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
