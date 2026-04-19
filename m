Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07615EA71AD
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 23:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A0CF80F23;
	Sun, 19 Apr 2026 23:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9ES_GrsS1gw; Sun, 19 Apr 2026 23:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B23A80F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776640894;
	bh=0QG2VtlZ5GxsbJ8AsM/fbHy+rXGTn8NOPq4STBmf7Xw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BRpFglzrXkAco77wcBa4z+X7PjxsAumc/P0NSM7pwQPE/H7oyGtghs3eQ6riZ+mIR
	 oXzkeYBoI9A9fzLhcbiUQpkv4X+2WCmftSnECMfmGu6301pd8XS5SD0AsPdAhJGVJS
	 6AOeyP3q6Spj3ge3rOEl45PDi/iXFBbd+jQyditfLVxBJK2FoB+TcEG8T0/hqWFXXh
	 MPxasVs5GllDIzEDwCjtyu/wFfmqyWYOFb197enc9Y2r9xZxYeqiCA7olPMly6CJVB
	 nLEhlI7bw4gG8S8qeEtBKRJI3hvrbuUuURcgT+O/JkUNiHhP8nVuu1GvuMn+cqxkPx
	 iSKXL7P1wCjVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B23A80F00;
	Sun, 19 Apr 2026 23:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85086259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6996C404E1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB99BLtBk-Ew for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 23:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7D540168
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7D540168
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0D7F8208E; Sun, 19 Apr 2026 23:21:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 01:21:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23a3df15ed2a7499b52cbbf044c0129651fb2e75
X-Git-Newrev: a4f2419164c4f3514e573427f6537f94c2878837
X-Patchwork-Hint: ignore
Message-Id: <20260419232130.F0D7F8208E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.37.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4f2419164c4f3514e573427f6537f94c2878837
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.1.2...upstream%2F1.37.2

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Marcus:
  - link to changes list in salsa
  - re-add updated sha1sum
]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 1f52d37f1a..13e8695128 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
-sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13  fakeroot_1.37.1.2.orig.tar.gz
-sha256  959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224  fakeroot_1.37.1.2.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
+sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3 595964 fakeroot_1.37.2.orig.tar.gz
+sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index ea0edb7665..12d7f1c4a1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.1.2
+FAKEROOT_VERSION = 1.37.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
