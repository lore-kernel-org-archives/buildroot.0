Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E545F9D0D6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD7A42B2E;
	Tue, 14 Apr 2026 15:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcatBxjV0_7f; Tue, 14 Apr 2026 15:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD08842C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181784;
	bh=7NQccdqUi3RCE6tVzXqjKTcwMs1HNWJ1vnbaTneVXkQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c2C0BFO7JS7uQp9Lfjg8yuSEfrc3bKU4XkXQbuIjNXnZHnHGoLSgGuVpJO6+vQQs6
	 kuPQrLlxvWh5hNT1qQtL0hJRXo8j+J4W2Cl7zpNtZ0+LMx258Y5Wjw6MrUSuTM29rn
	 IJ3SFwJcPlAIrGambMiwdf115/YmyfUDQz8qbhRNwjd+BBaefwg2h48iUoLnJVUYEL
	 zPEorNOiVltDME8VOUwpjDiieDMB74/l1gM8aekirfFl1eYEBeUaeuGPFTnP3QxBai
	 Ix/dbk29TR+eTeliRlOFjfWH8yWfIjQGZxh/Ztw2Of1Xxq7CFdlC47J7/4rC4uZXz3
	 7ipjaGv52ldow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD08842C29;
	Tue, 14 Apr 2026 15:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 021D2237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A24DD42B18
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ud975QS7Xzwg for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08EB42AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08EB42AF3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E638150E; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 11:56:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f3f4ba919e254811adb86c2166b2e973a8e33d2c
X-Git-Newrev: d75c53a758f35f8c4ea9a4605146144cd762a3e1
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.51E638150E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/nghttp2: patch
 CVE-2026-27135
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d75c53a758f35f8c4ea9a4605146144cd762a3e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following vulnerability:

- CVE-2026-27135:
    nghttp2 is an implementation of the Hypertext Transfer Protocol
    version 2 in C. Prior to version 1.68.1, the nghttp2 library stops
    reading the incoming data when user facing public API
    `nghttp2_session_terminate_session` or
    `nghttp2_session_terminate_session2` is called by the application.
    They might be called internally by the library when it detects the
    situation that is subject to connection error. Due to the missing
    internal state validation, the library keeps reading the rest of the
    data after one of those APIs is called. Then receiving a malformed
    frame that causes FRAME_SIZE_ERROR causes assertion failure. nghttp2
    v1.68.1 adds missing state validation to avoid assertion failure. No
    known workarounds are available.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-27135
  - https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1

(cherry picked from commit 7d26ff6c144e17327351dcf8aa5dfa6181afee85)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...te-validations-to-avoid-assertion-failure.patch | 105 +++++++++++++++++++++
 package/nghttp2/nghttp2.mk                         |   3 +
 2 files changed, 108 insertions(+)

diff --git a/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
new file mode 100644
index 0000000000..ef8b9a5a5d
--- /dev/null
+++ b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
@@ -0,0 +1,105 @@
+From 5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1 Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Wed, 18 Feb 2026 18:04:30 +0900
+Subject: [PATCH] Fix missing iframe->state validations to avoid assertion
+ failure
+
+CVE: CVE-2026-27135
+Upstream: https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/nghttp2_session.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index bcea547343..0fbcc930b9 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -5573,6 +5573,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         on_begin_frame_called = 1;
+ 
+         rv = session_process_headers_frame(session);
+@@ -6041,6 +6045,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           if (nghttp2_is_fatal(rv)) {
+             return rv;
+           }
++
++          if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++            return (nghttp2_ssize)inlen;
++          }
+         }
+       }
+ 
+@@ -6293,6 +6301,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         session_inbound_frame_reset(session);
+ 
+         break;
+@@ -6599,6 +6611,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         if (nghttp2_is_fatal(rv)) {
+           return rv;
+         }
++
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
+       } else {
+         iframe->state = NGHTTP2_IB_IGN_HEADER_BLOCK;
+       }
+@@ -6775,6 +6791,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+             rv = session->callbacks.on_data_chunk_recv_callback(
+               session, iframe->frame.hd.flags, iframe->frame.hd.stream_id,
+               in - readlen, (size_t)data_readlen, session->user_data);
++            if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++              return (nghttp2_ssize)inlen;
++            }
++
+             if (rv == NGHTTP2_ERR_PAUSE) {
+               return (nghttp2_ssize)(in - first);
+             }
+@@ -6861,6 +6881,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         if (rv != 0) {
+           busy = 1;
+ 
+@@ -6879,6 +6903,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+@@ -6907,6 +6935,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 98f837e28e..9e051d24ed 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -14,6 +14,9 @@ NGHTTP2_CPE_ID_VENDOR = nghttp2
 NGHTTP2_DEPENDENCIES = host-pkgconf
 NGHTTP2_CONF_OPTS = --enable-lib-only
 
+# 0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
+NGHTTP2_IGNORE_CVES += CVE-2026-27135
+
 define NGHTTP2_INSTALL_CLEAN_HOOK
 	# Remove fetch-ocsp-response script unused by library
 	$(Q)$(RM) -rf $(TARGET_DIR)/usr/share/nghttp2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
