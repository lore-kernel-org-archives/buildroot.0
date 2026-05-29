Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC92CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DDB185A37;
	Tue,  9 Jun 2026 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MywjY5tnra1O; Tue,  9 Jun 2026 13:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E8A085985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010203;
	bh=+ScXg/LWgPFZZ6qoLaJYW61XaQHEetJ//L2f2G5DBGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RmOVFbop46Mme2xivPy8CPJ8aisLoYaFo5GC7b7uwbCzZBeS980lae1YfY8dPDv3y
	 tRIauh5ovqdwspHmM1diBY41/PElYvODoC/eFOVFZRRCxbxQtPEZVgLpPbNKLCUPHK
	 +ngUiCA90ob10ZPRr/FLeqIrKCvCK5gIUI7dHMJTxBUZV0TiDlPjnumY+WL0t4uQUS
	 mAdi7QK4V00lXB89unhRErxl6DS0uptbQSPgVobId8GTZIWsIbcYiAkHiRRQCH4fwp
	 UCextlDdbarTBZ82eKVCj3s/s5VbR1iPE21HOUmg0T69w8sdIJB8OEVi6G2P7tiUHa
	 qJp5qR7HDoMYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8A085985;
	Tue,  9 Jun 2026 13:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13182190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0265E42707
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA7Lh7lCCa45 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CE942561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0CE942561
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD19287E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87c525ddb7046b96ee1640f56c5ac555771e496c
X-Git-Newrev: 8ecbcc713ee106295991d2dfaed5f6188c944667
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.DD19287E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: optionally use libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ecbcc713ee106295991d2dfaed5f6188c944667
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libcec only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libcec/libcec.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 5e6d84ebbd..0e730503da 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -12,8 +12,8 @@ LIBCEC_LICENSE_FILES = LICENSE.md
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBCEC_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBCEC_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
