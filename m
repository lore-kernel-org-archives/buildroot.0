Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01ACC54F54
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 18:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B207160A3E;
	Tue, 28 Jul 2026 18:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6-R3LvzMMxS; Tue, 28 Jul 2026 18:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0870608FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785264819;
	bh=RjkeoF41RKUwmQgHdsy/KrFlIL+W+SWP38ngk2zczMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jcmLxSRweimoIcCR8QhEXo3T3hu0/FP5hk5mkTsZpV3+a5zKUDcqgpgT2b0b8QcQk
	 cLKiezA5XjEdJ2JdeNerll0WHv1r/59BDOmbHHBKLIlZQ4cINMlqwhZU7p/N/Aa8m9
	 BPyZDiK7W/48FL0eJxAaaCyCG9aqM6pJP/QKThIVwqfmHRkzBgiZpLHDXJIi1YWo41
	 g4VsQoUgtw9+NKETu15GaqIuoSdcl71K8SHXDc6ZikwZwMJylhicPoP7c7WVudwSai
	 EDB0+yzUgcD+9aPsuTG48tAa1TUtMSrfFd53e8t7qswb7phEmZ/dGIiTqHYmsY0BG9
	 5LLfsylAhmZKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0870608FE;
	Tue, 28 Jul 2026 18:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7B55350
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59CE608FD
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCP247Wblc8R for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 18:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1FC608FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1FC608FE
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FC098B432; Tue, 28 Jul 2026 18:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 20:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0cadb45523f02cf987ef3a2b73343b601e59d22
X-Git-Newrev: b5e6133eabd3371f999f26215ac70406530eb0d9
X-Patchwork-Hint: ignore
Message-Id: <20260728185254.8FC098B432@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.24.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5e6133eabd3371f999f26215ac70406530eb0d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.5.html

This is a security release in order to address the following defects:

o CVE-2026-6949:
  TSIG packet with name compression can crash DNS

   Incorrect size calculations when a TSIG record contains
   compressed names can lead to a large out-of-bounds write
   causing the server to crash.

   https://www.samba.org/samba/security/CVE-2026-6949.html

o CVE-2026-58216:
  An authenticated user could possibly crash a KDC process

   A kpasswd packet that contains malformed ASN.1 might cause
   the server to access 6 bytes of unallocated memory. This
   memory is not exposed to the user, but in some
   circumstances the server could crash.

   https://www.samba.org/samba/security/CVE-2026-58216.html

o CVE-2026-58218:
  DNS signing DoS via TKEY name cache exhaustion

   An unauthenticated user can repeatedly register names TKEY
   names, which floods a cache causing legitimate TKEYs to be
   expunged. This can practically block the use DNS TSIG
   signing.

   https://www.samba.org/samba/security/CVE-2026-58218.html

o CVE-2026-58221:
  Samba AD authenticated LDAP access domain takeover

   Samba AD low-privilege authenticated LDAP access allows
   modifications to internal LDB special DNs, which permits a
   domain takeover.

   https://www.samba.org/samba/security/CVE-2026-58221.html

o CVE-2026-58222:
  Samba AD LDAP Compare filter injection and trusted-request
   confusion disclose protected attributes

   An ordinary authenticated domain user can bypass access
   checks and query confidential Active Directory attributes
   (such as KDS root keys) via LDAP Compare requests. Due to a
   filter injection flaw and trusted execution context, the
   LDAP Compare operation can be turned into a
   protected-attribute disclosure oracle.

   https://www.samba.org/samba/security/CVE-2026-58222.html

o CVE-2026-58224:
  The CTDB protocol has bounds checking issues

   CTDB fails to do integrity checking of received packets.
   This includes failure to check field lengths against packet
   lengths when unmarshalling packets.

   https://www.samba.org/samba/security/CVE-2026-58224.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7c44ed747a..3931e55669 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.4.tar.asc
-sha256  df2c51ab4361ec626ab9988e5946efcca8465bc7afae834291d5558468265ff8  samba-4.24.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.5.tar.asc
+sha256  6d5d7ee82f5ce9da4135086c9b184e47a58b4b023565f58abbb1f8c8a922306b  samba-4.24.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d481f9d417..79551e1ee4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.4
+SAMBA4_VERSION = 4.24.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
