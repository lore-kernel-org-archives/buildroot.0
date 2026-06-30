Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D670FC43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 20:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3DA561089;
	Tue, 30 Jun 2026 20:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gp8ZOUpix9xM; Tue, 30 Jun 2026 20:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C5B60838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782850249;
	bh=RkzDMCewZYRO/OgQ/C3r+jOcg0/LMAnw06im5/WZdf0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Da6sWyHSrKsUJAmFUH0D+uJ1MFtn5i0aQCKG812hRPuBEgtJBs+SCUXM+oUbK8BGi
	 mKgkWQdgGotDO2lOzTJr3MnWXNtAaDhgtQbj8fCxpbnM+TdJs/Af5DVIObklFtjnhC
	 XOzOS4UyK6KdM4Y46RJLVWpUZ+yQoae6vgw/iCERwpUK4HenqkSUR8CVpxb7b2Yndz
	 SOQ5z6JEJzdiLGzmN+3gmqnGwrVoUCkSIi/iHVxrMYS2/gXBJEuz5xKEtwC+n37FU1
	 cslP6U5OYqoKwN7RPjy10osM1zZ7bbklmlCd4CFYlUWd0Gumxx67+YzU6BAWfAte6F
	 i0CW4QMdfYS9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C5B60838;
	Tue, 30 Jun 2026 20:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD0D332C
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 924E160727
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOddK8WnZNSM for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 20:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5D8606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E5D8606AE
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:10:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30F02875A9; Tue, 30 Jun 2026 20:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jun 2026 21:58:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54de8d26d0ec1d0b7651a0f9866f6846ebe0f758
X-Git-Newrev: 3c8cfad8045a2b731177e6f9b150b065980410b5
X-Patchwork-Hint: ignore
Message-Id: <20260630201017.30F02875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh2: add upstream patch for
 CVE-2026-55199
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c8cfad8045a2b731177e6f9b150b065980410b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
