Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550E1CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C0782012;
	Tue,  9 Jun 2026 13:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnJUl0e0_wwN; Tue,  9 Jun 2026 13:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E717D82217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010265;
	bh=hgiVdC8Urym1KExeXUqbIdNU9hCDXRuiiCmB0as93n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OxKeGFDi3qfQDv1/Tj95pa002jM6iIkiJLslhcYj9qle8p7PD7pSJI+Q8sN7IJNDU
	 S5jMsnqYDNs1PC5ovjkjUMmQFyLVOXnGLOCrBtOJ/vOPDzMP2d/m7GzPTSvShCLRKq
	 I07bXqkkNB3MttIRoxhsQoizQwUMFMylrhN1zsKtu4Hrcc2ZoWSS7e5ybb37purRx3
	 LV2nUsRyCPOJn84EoLXkdcxd++NAdWAxSzi29L0e1+BzR+t9LRVs2rjxY9rRmiq7lE
	 mHINkZLZcqY/OznOn2gjcJvdDbktvU76h4bID4fTmz7ClypYD2iBvGM+1ZKcRFbqQV
	 eU3ljo8XeDUzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E717D82217;
	Tue,  9 Jun 2026 13:04:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C49190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ABFD426EC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCDDkdtfgxuk for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E18426C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7E18426C6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F339387E68; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 21:23:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
X-Git-Newrev: e4fefb5f616c9d6b8f61348352bd947554bcf40c
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.F339387E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/palo: bump to 2.29
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
Content-Type: multipart/mixed; boundary="===============4468482207179712694=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4468482207179712694==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4fefb5f616c9d6b8f61348352bd947554bcf40c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
* psc_misc: Add function to get PDC firmware version
* ipl: Fix mfg mode on C8000, rp34x0 and rp44x0

This has been tested on hp 712, booting from network and from disk.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/palo/palo.hash | 2 +-
 boot/palo/palo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/palo/palo.hash b/boot/palo/palo.hash
index 2a7e2ef89a..9019d00f04 100644
--- a/boot/palo/palo.hash
+++ b/boot/palo/palo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73db9f60d439c4ae9d31b049671283e01d95ae364fc78b4db37eed5523218d6c  palo-2.28.tar.gz
+sha256  bca096116d403b7d370794d84853c4f4a4703d604c01a645d1fbd1c5be42a7e0  palo-2.29.tar.gz
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/boot/palo/palo.mk b/boot/palo/palo.mk
index dadb0cde92..d2761042f5 100644
--- a/boot/palo/palo.mk
+++ b/boot/palo/palo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PALO_VERSION = 2.28
+PALO_VERSION = 2.29
 PALO_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/snapshot
 PALO_LICENSE = GPL-2.0
 PALO_LICENSE_FILES = COPYING

--===============4468482207179712694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4468482207179712694==--
