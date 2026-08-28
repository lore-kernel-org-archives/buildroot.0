Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3692AC61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFA58127E;
	Fri, 28 Aug 2026 14:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIIKxRxtB6Is; Fri, 28 Aug 2026 14:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927190;
	bh=O3p7JxnPo8keQO/8FBJRW2PimaqZlCaO9bBTFlH47Ho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ckiazd6ENxuZMe6u8WwLtuStmG3OwR0/kkfRlXZ85RdDKZ8fHZZnOUeIyUqx5iSmF
	 NikTFS+mbh6aT1CUqYNEH8qa8cIKB2+rZllwt2AyJCdOASER59mmn8RXrpSkKw7DLx
	 M+KSbJrM2/QQHeS/dPfqQrMwhQrO44vPY6Ww4fXtLpHILITq6VgpwbvbeYKizeNPGt
	 SSLsDXoAmGNNIvictoQE6NPHO30HNp1qdL6eS9u3aWZjoZOixdvWeBnY2vky+5pBfa
	 rZ08KWhEw5PBU4edioXllXEtfQV8h0sWmk4k2AD1+fnntZLhvqVFDJ/5XKCoHLddSP
	 6VXFfVRcgWc1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437608125A;
	Fri, 28 Aug 2026 14:26:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E66FED2D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7D7780E1D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCJH9YI7fVLP for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9312080ECB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91672921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: bf04be147bff4f0548a5c05b2e178cba93fc7ea9
X-Git-Newrev: 28f764e641b279b58d0201652b74c267d3f3964e
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.91672921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libssh2: fix
 CVE-2025-15661
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2854586223215003666=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2854586223215003666==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28f764e641b279b58d0201652b74c267d3f3964e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Backport the SFTP symlink bounds checking fix for CVE-2025-15661.

The initial fix requires the LIBSSH2_UNCONST compatibility backport on
libssh2 1.11.1. Also include the upstream follow-up fixing
SSH_FXP_STATUS handling introduced by the initial security fix.

The patches are based on the upstream fixes and Debian's libssh2 1.11.1
backports.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 546fd31c70d5c380c59dfe12eef1811876c32b44)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0004-sftp-symlink-fix-out-of-bounds-read.patch | 117 +++++++++++++++++++++
 ...005-libssh2-priv-backport-LIBSSH2_UNCONST.patch |  30 ++++++
 ...-sftp-symlink-fix-SSH_FXP_STATUS-response.patch |  46 ++++++++
 package/libssh2/libssh2.mk                         |   5 +
 4 files changed, 198 insertions(+)

diff --git a/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.patch b/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.patch
new file mode 100644
index 0000000000..a855697046
--- /dev/null
+++ b/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.patch
@@ -0,0 +1,117 @@
+From 2dae3024897e1898d389835151f4e9606227721d Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 10 Oct 2025 08:26:20 -0700
+Subject: [PATCH] Update sftp_symlink to avoid out of bounds read on malformed
+ packet #1705 (#1717)
+
+
+CVE: CVE-2025-15661
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2025-15661.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/2dae3024897e1898d389835151f4e9606227721d
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+--- libssh2-1.11.1.orig/src/sftp.c
++++ libssh2-1.11.1/src/sftp.c
+@@ -3795,15 +3795,19 @@ static int sftp_symlink(LIBSSH2_SFTP *sf
+ {
+     LIBSSH2_CHANNEL *channel = sftp->channel;
+     LIBSSH2_SESSION *session = channel->session;
+-    size_t data_len = 0, link_len;
++    size_t data_len = 0, lk_len;
+     /* 13 = packet_len(4) + packet_type(1) + request_id(4) + path_len(4) */
+     ssize_t packet_len =
+         path_len + 13 +
+         ((link_type == LIBSSH2_SFTP_SYMLINK) ? (4 + target_len) : 0);
+     unsigned char *s, *data = NULL;
++    struct string_buf buf;
+     static const unsigned char link_responses[2] =
+         { SSH_FXP_NAME, SSH_FXP_STATUS };
+     int retcode;
++    unsigned char packet_type;
++    uint32_t tmp_u32;
++    unsigned char *lk_target;
+
+     if(sftp->symlink_state == libssh2_NB_state_idle) {
+         sftp->last_errno = LIBSSH2_FX_OK;
+@@ -3891,8 +3895,25 @@ static int sftp_symlink(LIBSSH2_SFTP *sf
+
+     sftp->symlink_state = libssh2_NB_state_idle;
+
+-    if(data[0] == SSH_FXP_STATUS) {
+-        retcode = _libssh2_ntohu32(data + 5);
++    buf.data = (unsigned char *)LIBSSH2_UNCONST(data);
++    buf.dataptr = buf.data;
++    buf.len = data_len;
++
++    if(_libssh2_get_byte(&buf, &packet_type)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (type)");
++    }
++
++    if(packet_type == SSH_FXP_STATUS) {
++        if(_libssh2_get_u32(&buf, &tmp_u32)) {
++            LIBSSH2_FREE(session, data);
++            return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                                  "SFTP Protocol Error (code)");
++        }
++
++        retcode = (int)tmp_u32;
++
+         LIBSSH2_FREE(session, data);
+         if(retcode == LIBSSH2_FX_OK)
+             return LIBSSH2_ERROR_NONE;
+@@ -3903,30 +3924,37 @@ static int sftp_symlink(LIBSSH2_SFTP *sf
+         }
+     }
+
+-    if(_libssh2_ntohu32(data + 5) < 1) {
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+         LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "Invalid READLINK/REALPATH response, "
+-                              "no name entries");
++                              "SFTP Protocol Error (id)");
+     }
+
+-    if(data_len < 13) {
+-        if(data_len > 0) {
+-            LIBSSH2_FREE(session, data);
+-        }
++    /* look for at least one link */
++    if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
++        LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP stat packet too short");
++                                     "Invalid READLINK/REALPATH response, "
++                                     "no name entries");
+     }
+
+-    /* this reads a u32 and stores it into a signed 32bit value */
+-    link_len = _libssh2_ntohu32(data + 9);
+-    if(link_len < target_len) {
+-        memcpy(target, data + 13, link_len);
+-        target[link_len] = 0;
+-        retcode = (int)link_len;
++    if(_libssh2_get_string(&buf, &lk_target, &lk_len) == LIBSSH2_ERROR_NONE) {
++        if(lk_len < target_len) {
++            memcpy(target, lk_target, lk_len);
++            target[lk_len] = '\0';
++            retcode = (int)lk_len;
++        }
++        else {
++            retcode = LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++        }
+     }
+-    else
+-        retcode = LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++    else {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (filename)");
++    }
++
+     LIBSSH2_FREE(session, data);
+
+     return retcode;
diff --git a/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch b/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch
new file mode 100644
index 0000000000..7b91d22039
--- /dev/null
+++ b/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch
@@ -0,0 +1,30 @@
+Needed by the fix for CVE-2025-15661
+
+Cherrypicked from
+commit 606c102e52f8447de2b745dd6c5ddf418defc519
+Author: Viktor Szakats <commit@vsz.me>
+Date:   Thu Jan 30 21:18:23 2025 +0100
+
+
+CVE: CVE-2025-15661
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/libssh-unconst-backport.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/606c102e52f8447de2b745dd6c5ddf418defc519
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+--- libssh2-1.11.1.orig/src/libssh2_priv.h
++++ libssh2-1.11.1/src/libssh2_priv.h
+@@ -117,6 +117,14 @@
+ #define UINT32_MAX 0xffffffffU
+ #endif
+
++#ifdef _WIN64
++#define LIBSSH2_UNCONST(p)  ((void *)(libssh2_uint64_t)(const void *)(p))
++#elif defined(_MSC_VER)
++#define LIBSSH2_UNCONST(p)  ((void *)(unsigned int)(const void *)(p))
++#else
++#define LIBSSH2_UNCONST(p)  ((void *)(uintptr_t)(const void *)(p))
++#endif
++
+ #if (defined(__GNUC__) || defined(__clang__)) && \
+     defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 199901L) && \
+     !defined(LIBSSH2_NO_FMT_CHECKS)
diff --git a/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch b/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch
new file mode 100644
index 0000000000..2883c102dc
--- /dev/null
+++ b/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch
@@ -0,0 +1,46 @@
+From 4ed26f5740bdd409269ed9fb48a28bf8f565b681 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 20 Oct 2025 14:04:52 -0700
+Subject: [PATCH] Fix sftp_symlink when getting SSH_FXP_STATUS response (#1731)
+
+Move advancing past packet ID before reading the FXP_STATUS response.
+
+CVE: CVE-2025-15661
+Upstream: https://github.com/libssh2/libssh2/commit/4ed26f5740bdd409269ed9fb48a28bf8f565b681
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/sftp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 70d7686daf..bb297b831a 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -4006,6 +4006,13 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+                               "SFTP Protocol Error (type)");
+     }
+
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (id)");
++    }
++
+     if(packet_type == SSH_FXP_STATUS) {
+         if(_libssh2_get_u32(&buf, &tmp_u32)) {
+             LIBSSH2_FREE(session, data);
+@@ -4025,13 +4032,6 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+         }
+     }
+
+-    /* advance past id */
+-    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+-        LIBSSH2_FREE(session, data);
+-        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP Protocol Error (id)");
+-    }
+-
+     /* look for at least one link */
+     if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
+         LIBSSH2_FREE(session, data);
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 0ccf5effb3..6b2d774b38 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -22,6 +22,11 @@ LIBSSH2_IGNORE_CVES += CVE-2026-55199
 # 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-55200
 
+# 0004-sftp-symlink-fix-out-of-bounds-read.patch
+# 0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch
+# 0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch
+LIBSSH2_IGNORE_CVES += CVE-2025-15661
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============2854586223215003666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2854586223215003666==--
