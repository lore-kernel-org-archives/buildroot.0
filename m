Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840CC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2701640940;
	Fri, 10 Jul 2026 13:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWCRPd89FRTz; Fri, 10 Jul 2026 13:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDF440912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690976;
	bh=bf9rUK+AYlRscw0gApIUUP5pdcWcRaaCvKHt4wPaU9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P/39lWlB7s8ZDvKL2ksYphwZlm+J4nBP7artSihz6d8cnXYzmHR9qfT8MxG9cOSzw
	 jdNfavYIM5c9VjmP7O8mVcBVnSNtRjLxkFzwBHYXN6w8e+kwUvExPUXTxz3iBbkYI7
	 85rBX12YQHEH4b2LK4LG1sCOeuqcBfCJH671AK94KwgwRm5UY+hZ7Lp21p59jzWMvG
	 gHl4GxH5yBYkK60UbUcX5AwK9bb80pZkeKpaWmskBBenxUixem8a8OD4kgGj4gn1At
	 TZmaNZ2uAI/XLzXfqX/X74cnnbI27jTqX+2sJVr7ejCNMv43wG4qyTC1/bWCTvX/HT
	 FM+yS7Fmhapvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDF440912;
	Fri, 10 Jul 2026 13:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCF6A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D546810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xirTzMgw0-On for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B643F810B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B643F810B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB60A88675; Fri, 10 Jul 2026 13:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:49:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1d6fb5aef01ed0207c9f94b42c635869374dce4a
X-Git-Newrev: 3ec41904238ff46a45101f884525edb75555fc82
X-Patchwork-Hint: ignore
Message-Id: <20260710134216.EB60A88675@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh2: add
 upstream patch for CVE-2026-55199
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ec41904238ff46a45101f884525edb75555fc82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2026-55199:
    libssh2 through 1.11.1, fixed in commit 1762685, contains a pre-
    authentication denial of service vulnerability in the SSH_MSG_EXT_INFO
    handler in src/packet.c that allows a malicious SSH server to cause a
    client CPU exhaustion loop by sending a crafted extension count value.
    A malicious server can set nr_extensions to 0xFFFFFFFF during key
    exchange, causing the client to spin in a tight CPU loop for over 60
    seconds because return values from _libssh2_get_string() are unchecked
    and the session timeout does not apply to CPU-bound loops.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-55199
  - https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 3c8cfad8045a2b731177e6f9b150b065980410b5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...sh2-get-string-return-in-EXT-INFO-handler.patch | 43 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 46 insertions(+)

diff --git a/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
new file mode 100644
index 0000000000..c7319a6b51
--- /dev/null
+++ b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
@@ -0,0 +1,43 @@
+From 17626857d20b3c9a1addfa45979dadcee1cd84a4 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >= 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream: https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index ae86365d2a..8a7a0d2690 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+                     nr_extensions -= 1;
+ 
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+ 
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 1843d25051..c85129a7cd 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -16,6 +16,9 @@ LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 # 0001-username-len-bound-checking.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-7598
 
+# 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-55199
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
