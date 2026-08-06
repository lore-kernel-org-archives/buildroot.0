Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D086C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B0480DE9;
	Thu,  6 Aug 2026 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEnQHXJUlfaN; Thu,  6 Aug 2026 22:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C048380F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053739;
	bh=7bIMyRJo5sN7OP2BjiN6v2qHAOpA6J8h1IsvuL/vJ4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fhqbsgpowaMQS8dUvgy3y+gl41wlMTFVjGsFYn1fMsOE5TdESXFgtS5sqw87nC1Pa
	 EAPxWYITn19fNAxO3j3fICCP0If/eab4FKiGW39Fo5DHExhOsZRWTwneFGeGOwKnmz
	 XQzw8HLtt5HUGs/P5M/4vYmWQLVtpdsdvpmU94IfVxjG/xo8QNtuYsmj+Spe1jZhBL
	 o4DYCh4gBhMAG8H/VLTIrgZfr1Dhm24ZHdDCDtqMPQeymyOqgQwAsHe0mEF4SyHtbo
	 aH6dmDW9w8BA3baT1MrdcTk3QqyAOZWYZ08/YjvEQ811nF+K/EjTpGJfpBqCzG1lOt
	 mE6C/d4d6IsRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C048380F42;
	Thu,  6 Aug 2026 22:02:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B48D3522
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19A5408CC
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Erc_qERWWr4c for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1A96408C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1A96408C3
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91A7F8CA1F; Thu,  6 Aug 2026 22:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Aug 2026 23:20:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8583d8b2b452bab02acbd39ac2b0f40889bd99dc
X-Git-Newrev: 209117f1dd8a833c8a588c6fdffcff30abb1eaf3
X-Patchwork-Hint: ignore
Message-Id: <20260806220129.91A7F8CA1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr-util: security bump to version
 1.6.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/209117f1dd8a833c8a588c6fdffcff30abb1eaf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
CVE-2026-34502.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 7e2793cd77..b8fff95de6 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
-sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
+sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 477db1c593..c11957bc56 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.3
+APR_UTIL_VERSION = 1.6.4
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
