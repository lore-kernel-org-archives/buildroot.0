Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C862DC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1294460725;
	Sat, 22 Aug 2026 22:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNfETS0xblt8; Sat, 22 Aug 2026 22:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787436062;
	bh=kYtdqgyyDYSdoBRKcKHYNe5bq2v490JIK8vPncevCwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EJ1kkOS04oVRWRmZFO0ZBqFFD2Snv4WMfpFlDueauJ8vsphVZEWY/9kojiCR77Jxv
	 ZwNiDuLobLEC3pjez5MiDzB3u3i+8FneW1+XtDI02OD3eF5dARd53g9kOeeTV6oAAn
	 Q7BpmojG8forIQZ/U/PwRDV5FXCuydud+hj+RD9LmybWbkkDefcnUmioCkNdy2ARZs
	 jKu8n/r+JkvyVDSkPCkC1gvPFBOcr64BAVtROrcDfIrKKat2tSkv3DZoQ7VtzW2lS5
	 LJTwbJv2PwRHbHUrQXNquEVkIM0npRw22lPcSWUoiUUVovactu6Q6IIXr3E+dZyYXb
	 3Cn6MoTWRtSnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509FE606F5;
	Sat, 22 Aug 2026 22:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB26476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24391400FF
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02KFg4qPjXij for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 22:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810AC40063
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:01:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 403AF8E650; Sat, 22 Aug 2026 22:00:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 23:54:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 546fd31c70d5c380c59dfe12eef1811876c32b44
X-Git-Newrev: 05c13e87e983705ef65c18979a5d1bb7b50438a2
X-Patchwork-Hint: ignore
Message-Id: <20260822220006.403AF8E650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh2: fix CVE-2026-66032
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
Content-Type: multipart/mixed; boundary="===============8569915225246808596=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8569915225246808596==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05c13e87e983705ef65c18979a5d1bb7b50438a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport the fix for CVE-2026-66032.

A SFTP error path can leave a dangling pointer after freeing the
response buffer, which may result in a double free on subsequent error
handling.

Use Debian's libssh2 1.11.1 backport of the upstream fix.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-sftp-prevent-dangling-pointer-after-free.patch | 29 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch b/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch
new file mode 100644
index 0000000000..3658c00e0d
--- /dev/null
+++ b/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch
@@ -0,0 +1,29 @@
+From 5e4776146552d898b9c0e1b313cd093fa8dc92d0 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Thu, 2 Jul 2026 11:00:23 -0700
+Subject: [PATCH] Prevent dangling pointer by nullifying data (#2180)
+
+Set data to NULL after freeing it to avoid dangling pointer. fixes
+GHSA-px3w-7g75-hg7w.
+
+Credit: VladimirEliTokarev
+Forwarded: not-needed
+
+CVE: CVE-2026-66032
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2026-66032.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/sftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1279,6 +1279,7 @@
+                                "got HANDLE FXOK"));
+
+                 LIBSSH2_FREE(session, data);
++                data = NULL;
+
+                 /* silly situation, but check for a HANDLE */
+                 rc = sftp_packet_require(sftp, SSH_FXP_HANDLE,
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 6b2d774b38..583ed56c1c 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -27,6 +27,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-55200
 # 0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch
 LIBSSH2_IGNORE_CVES += CVE-2025-15661
 
+# 0007-sftp-prevent-dangling-pointer-after-free.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-66032
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============8569915225246808596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8569915225246808596==--
