Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB2C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648A881107;
	Fri, 31 Jul 2026 11:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L0tFqsqap15; Fri, 31 Jul 2026 11:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A6E8111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499031;
	bh=DJLQcDUBYOCqmdVQ0LkSnJM6CtD91GjTERb0mvH/5cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gtV6inRNHTAff5bMQbf1yX/DgQ3IRQzcG6pnVyN9t4h5dxBF1jo3A57gsf4KVDFo0
	 YmEcZnP5ZtHbzzfucuM5d4CJDQ7ov4gUZwgWNYJES/iSYi3si1l0w1IcQWBuuryDNC
	 wkE2N2bAKlCEJEIzw+Xn2vISUQt7w8Hxz7iLVSdg9SZ9XliC16SGw4kxI1ZXn1KjNc
	 C3Ea8Tf0+YWSZlJRz9LDxWiUqtDqlBITfl4sSE7Bx7B2Y9zw/GWvxxcyQgZs/Ow2TU
	 xY/8mmACgJozkSvRQPz9hoN5Z0kizFwsts+r8DbSoif2fjUywc6SBXALsdAYggEms7
	 W3vSC5pNPARGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A6E8111C;
	Fri, 31 Jul 2026 11:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2921237F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B7B560825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oadlUWN7abUv for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A16ED60AA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A16ED60AA7
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F478B741; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:04:22 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 377bd40298eed7134ba39002e046bbf2455147ac
X-Git-Newrev: 0be222379c3993f27a32b5173059c1f0c1d3b125
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.92F478B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libssh: security
 bump version to 0.11.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0be222379c3993f27a32b5173059c1f0c1d3b125
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.11.5
https://www.libssh.org/2026/07/21/libssh-0-12-1-and-0-11-5-security-release
s/

Fixes the following security problems:

CVE-2026-15370: Stack buffer overflow in SFTP server longname construction
CVE-2026-59843: Denial of service via zero advertised channel packet size
CVE-2026-59844: Denial of service via oversized SFTP read length
CVE-2026-59845: Denial of service via unchecked ProxyCommand fork() failure
CVE-2026-59846: Information disclosure via ProxyCommand %r username expansion
CVE-2026-59847: Integrity downgrade via OpenSSL AES-GCM tag verification
CVE-2026-59848: Denial of service via SFTP responses with unknown request IDs
CVE-2026-59849: Denial of service via automatic certificate authentication loop
CVE-2026-59850: Use-after-free via data callbacks on closed channels
Zero-initialize every ssh_string

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 93e7a673e83ee9b66f10f70cd3c7c0a53dcee6b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 5a103eb593..2920d79b94 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.5.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
+sha256  6898ba9dd836d618b71dc7a4bb786a502c173cef5cafbf20fe5e0567ba4ea30c  libssh-0.11.5.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 56de66d6ea..97f3e8a2a2 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
