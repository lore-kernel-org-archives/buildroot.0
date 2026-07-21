Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A444BC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C2A6089F;
	Tue, 21 Jul 2026 19:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pet-igYcfq2; Tue, 21 Jul 2026 19:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18AC26089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663170;
	bh=Evfd2vU9IxyaPZu9BWzvx7k7R8yuphU5izmydEfuUqk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KUUFlvQL/iRtLYQQQoBQVGRw/0O0rgfZTcVKld5YUCD4ahn7dmrjaPJOZHFMpCRMT
	 uyagJdeO4/eEPiLhqdJU/IdtF/hWrLnxo/bMeh3MwZ/k98nQ/JSp1zRiZMUvGWQxWt
	 2Fg+322/2fh1U9x1005YAhEADT86Rii/khlVtC8wK8z6F8/lNq0HHkmb+n2dde8rVA
	 OYo5vnL/PoEu5oNfM6UXFgGTnczEVLztNDQYJaWmE5LLElGTuCGi7rV8Oz8upXMINe
	 LkMRuGaauaV2qB7HmJSxzQg3OGhyiU+PSII6OTqR7Ry7R208/3UWHXHUpYqDv4MnkR
	 6lQVPgR0Go2og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18AC26089B;
	Tue, 21 Jul 2026 19:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 001B442A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5F744016B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5EecECz77BV for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93FB400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93FB400B5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BB2C8913B; Tue, 21 Jul 2026 19:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 21:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be3100145892f8f3c5d59382ebbc3e9dfadc6bbd
X-Git-Newrev: 93e7a673e83ee9b66f10f70cd3c7c0a53dcee6b0
X-Patchwork-Hint: ignore
Message-Id: <20260721194529.9BB2C8913B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: security bump version to
 0.12.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93e7a673e83ee9b66f10f70cd3c7c0a53dcee6b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.1
https://www.libssh.org/2026/07/21/libssh-0-12-1-and-0-11-5-security-releases/

Fixes the following security problems:

CVE-2026-15370: Stack buffer overflow in SFTP server longname construction
CVE-2026-59842: Information disclosure via short GSSAPI Curve25519 public key
CVE-2026-59843: Denial of service via zero advertised channel packet size
CVE-2026-59844: Denial of service via oversized SFTP read length
CVE-2026-59845: Denial of service via unchecked ProxyCommand fork() failure
CVE-2026-59846: Information disclosure via ProxyCommand %r username expansion
CVE-2026-59847: Integrity downgrade via OpenSSL AES-GCM tag verification
CVE-2026-59848: Denial of service via SFTP responses with unknown request IDs
CVE-2026-59849: Denial of service via automatic certificate authentication loop
CVE-2026-59850: Use-after-free via data callbacks on closed channels
CVE-2026-59851: Authentication bypass via missing GSSAPI principal check
Zero-initialize every ssh_string

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 8c40dea2e5..a1f59fe810 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
+# https://www.libssh.org/files/0.12/libssh-0.12.1.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
+sha256  d3941af0a2d78d5d82ed7a36988e9133994312f035b9659a6e43f8db3968784c  libssh-0.12.1.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 017ff2c197..5fd34b47b0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.12
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
