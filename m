Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3547606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cW10sICn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60134087C;
	Thu,  5 Nov 2026 13:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxXiLaPqZ6cb; Thu,  5 Nov 2026 13:25:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A2F1140871
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793885139;
	b=QFl7RcM6+QUXv51Z5w+zTg2O+ETNm20eJVDUKY5w5/pLNFn3drV6rEho9jOTZBtZtcn4
	 Bs0vHTFkzWFCoCRJykZvKCzxzzNXpvt6zL90+WNx9UdUF/BemX/PwsPbxHur4d9NDZ52w
	 RoDnO74rXNpgAepG1UgAx9VKdLoWDkHdDY7/U9W3kWpRhudG8YZJG0dnK9QMj7q1MsDS8
	 xEHIm6Cj4DSbxKvQCRGOfM3/lJJDuzcVHmxQfjWui7q0h2Xqj0bCdhd/pDUTe5yjodPdK
	 guQUnxqOlQzJwH8pL1Pf4vL736MdSs7QaXI4u103kbfeRlLUQuvED78fA7/4lYrsKsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FaSc5vdpe9eEIS6dSm5KOFpdLALLmYoVXfWjzZawEuY=;
	b=H2TZ7ycN9VWq89b0MMf6+/L5LrpIbG9ANGbyYvh9ADYF89ryhr5iy0IjXyclSuYe/WFG
	 QWoi7L50MLBlQhNmEjb3ctWRqZqmbYi9o93sfk/SbvMKGm6zeKs0KTxxNlRxR9ijvK0Ua
	 WrS14WrY2+HQ9OS4x1iwpoq3t5RG4/XQhvXdreTUfI5Z6+Emi6kb6dNwfee2dDEeiPqx2
	 FwmTGZ6WZOkkydj8TefPol4Mjj3MHZFSrsiVM5kHDYYypDZ52Ha49LsHaUhtBGX/KNPxJ
	 SH6u9hV3CM616GkrKt+yc6Vp//xAIlF6uNVQVdtlxDbsepEN1KcQ1xu/SbUBAXHyG8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793885139;
	bh=FaSc5vdpe9eEIS6dSm5KOFpdLALLmYoVXfWjzZawEuY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cW10sICnUa/ypkuFhMlI69cxvGPGVAlTpFVM0KkzhD3drHrZCmCiv+nJ4tMI2WhVV
	 oT+zZqboCofdYQLFzTuzqJFEwamjM9ohb4QZeBUgDUtMfsQB+NpDyWXlSfguJ10eNA
	 DUKK5SKzWYz9hu6sumRcO3qUIMaPZvRD67GqORXd/KSroBattRDgU/vjm7e8LSGGJq
	 I1r32HxmKKTqFGyrVoJvkEPwwiimF9LsEUhlpZyp+VoTVPdoFsHox/qD5nSPY6gZMf
	 WG/V5D6A9txMkICQNF2rqnzwDJqzWtT/hv6L1bWwInLuneFKvSmCTPMtZD/hI1hE1u
	 CIgHJl4dUpYlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2F1140871;
	Thu,  5 Nov 2026 13:25:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FF3280
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 532A64010C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLUS9BqAnfgv for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:25:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 755BD4007E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 755BD4007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:25:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1wyOB03uZb-00SQox; Thu, 05
 Nov 2026 14:25:34 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 14:25:21 +0100
Message-ID: <20261105132521.3787872-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VK9lqTm5vddpQB0sbxkVMBkFNWgF2bc7+MN4F1ib7sLFhrtLZmU
 EApV2CvzDqw4NThuKkouCRelviam5ZRSL5gY0WT6ZpQfMUiAobWlmjum202YoMYWykESUT7
 Bv+2h0w4fhVUWxAImVm3xajhdTaLi8kv9qHCsXBf858D40vWNhsGkGTPkK64bIvJUvOQmwo
 nTqBLy9q+ieKvtRoiU+vA==
UI-OutboundReport: notjunk:1;M01:P0:8PfkZBRTQi0=;J7i9zzBQ1zFtH9Sob5iPNcV/kF1
 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
 Kqm6NU0qYf+HDHmWEA==
Subject: [Buildroot] [PATCH v2 1/1] package/fakeroot: add patch to fix
 segfault with glibc 2.44
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Glibc 2.44 changed handling of FTS.fts_statp in a way that causes
segfaults when using fts_read() with certain flags, please see patch
description for details. This showed in a Buildroot build on Arch with
BR2_TARGET_ROOTFS_CPIO_DRACUT=y: dracut-install uses fts_read() when
searching kernel modules to install, and segfaulted.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* patch was accepted upstream, change Upstream: URL from MR to commit
  on main

v1: https://patchwork.buildroot.org/project/buildroot/patch/20261016125527.1314651-1-fiona.klute@gmx.de/

 ...t-FTS.fts_statp-to-NULL-fix-segfault.patch | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch

diff --git a/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
new file mode 100644
index 0000000000..3320897d1c
--- /dev/null
+++ b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
@@ -0,0 +1,113 @@
+From 5b72148221405de22589011e9f56247468a2c51a Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Thu, 15 Oct 2026 18:25:16 +0200
+Subject: [PATCH] Do not set FTS.fts_statp to NULL, fix segfault
+
+Glibc always allocates fts_statp since commit
+99303f387179332d64e5ee34a6b58e82a523bae5 ("io: Use gnulib fts
+implementation (BZ 22944, BZ 20331)"), and expects it to be allocated,
+including using fts_statp->st_size to indicate whether fts_read should
+stat the entry (see fts_set_stat_required() in io/fts.c). The
+structure is reused, and with that setting fts_statp to NULL causes a
+segfault on a following call that tries to set a field in fts_statp.
+
+Instead of setting fts_statp to NULL and checking for that, check for
+FTS_NOSTAT and fts_info values indicating that fts_statp is undefined,
+and leave fts_statp alone if either is true.
+
+Program to reproduce the problem with glibc versions newer than the
+commit mentioned above (pass at least one directory on the command
+line, files do not trigger the segfault):
+
+int main(int argc, char **argv) {
+	if (!argv[1]) {
+		printf("no parameters!\n");
+		exit(1);
+	}
+
+	FTS *fts = fts_open(&(argv[1]), FTS_NOSTAT | FTS_PHYSICAL, NULL);
+	if (!fts) {
+		perror("fts_open() failed");
+		exit(2);
+	}
+
+	for (FTSENT *ftsent = fts_read(fts); ftsent != NULL; ftsent = fts_read(fts)) {
+		printf("seen: %s\n", ftsent->fts_accpath);
+	}
+	if (errno != 0)
+		perror("fts_read() failed");
+
+	if (fts_close(fts) < 0) {
+		perror("fts_close() failed");
+		exit(3);
+	}
+	return 0;
+}
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://salsa.debian.org/clint/fakeroot/-/commit/322d274c0899c82167794142ad2cd3e1a6e5ef07
+---
+
+ libfakeroot.c         |  9 ++++-----
+ libfakeroot_inode64.c | 11 ++++-------
+ 2 files changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/libfakeroot.c b/libfakeroot.c
+index 69e2f6f..4a00fb8 100644
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -2151,10 +2151,8 @@ FTSENT *fts_read(FTS *ftsp) {
+   }
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   r=next_fts_read(ftsp);
+-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
+-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
+-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
+-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++  if (r && !(ftsp->fts_options & FTS_NOSTAT
++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+     SEND_GET_STAT(r->fts_statp, _STAT_VER);
+   }
+ 
+@@ -2173,7 +2171,8 @@ FTSENT *fts_children(FTS *ftsp, int options) {
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   first=next_fts_children(ftsp, options);
+   for(r = first; r; r = r->fts_link) {
+-    if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++    if (r && !(ftsp->fts_options & FTS_NOSTAT
++               || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+       SEND_GET_STAT(r->fts_statp, _STAT_VER);
+     }
+   }
+diff --git a/libfakeroot_inode64.c b/libfakeroot_inode64.c
+index ba5802c..e5aecbd 100644
+--- a/libfakeroot_inode64.c
++++ b/libfakeroot_inode64.c
+@@ -112,12 +112,8 @@ FTSENT *fts_read$INODE64(FTS *ftsp) {
+   }
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   r=next_fts_read$INODE64(ftsp);
+-#ifdef __APPLE__
+-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
+-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
+-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
+-#endif
+-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++  if (r && !(ftsp->fts_options & FTS_NOSTAT
++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+     send_get_stat64((struct stat64 *)r->fts_statp);
+   }
+ 
+@@ -136,7 +132,8 @@ FTSENT *fts_children$INODE64(FTS *ftsp,
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   first=next_fts_children$INODE64(ftsp, options);
+   for(r = first; r; r = r->fts_link) {
+-    if(r->fts_statp) {  /* Should we bother checking fts_info here? */
++    if (!(ftsp->fts_options & FTS_NOSTAT
++          || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+       send_get_stat64((struct stat64 *)r->fts_statp);
+     }
+   }
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
