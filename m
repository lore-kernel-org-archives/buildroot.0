Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8211DC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F418409F9;
	Fri,  7 Aug 2026 09:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oI3kLS9BMZhN; Fri,  7 Aug 2026 09:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D5840A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095236;
	bh=ZMGdiCoL0seIRa5pmknw9Afyd6N/e9nQh4fgwdNtoWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h4NkLW9+/q9oCUuB0dlElEviZi7KNoA5WvnP/8eC8yNyJfTeOmGU7TiTAFoWw7dCP
	 l0sAD4oKnO++cpjoZzd0/6b4oym1qxH1JBa6W5Ggcp/i5VYHJu+Tv8fu7mWzkICPxM
	 IGB7YsghDq1/5W0lELDyNIVXygPfI1mqvRZbYUXTODGSjNVpMioXZhFkr3/UUPo3Vy
	 zs3PnxEKwLUc0sTk+auMWjicodRT8iIUEP/tZ+xOAVnLYpuulh3qeS6O5mOEnsxpbf
	 0Vj0ftdAipY3rGX8DWXO3k0VsZpQmGHJk/DYEnAL4G2KqyK2fb6PhVO2SR0cjWuTp7
	 b9ih30Nxshagw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D5840A13;
	Fri,  7 Aug 2026 09:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D46397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A501409F9
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGd3wyf2a_Mh for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D06409FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D06409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62FD68CA40; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a6506ec5a39e0a7b254c3795f2e63d2f7384ef02
X-Git-Newrev: af97fbb9ca5c8e1eaef4ef182836c2b61774ee00
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.62FD68CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/samba4: security
 bump to v4.22.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af97fbb9ca5c8e1eaef4ef182836c2b61774ee00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes: https://www.samba.org/samba/history/samba-4.22.11.html

This is a security release in order to address the following defects:
o CVE-2026-6949:   TSIG packet with name compression can crash DNS

                   Incorrect size calculations when a TSIG record contains
                   compressed names can lead to a large out-of-bounds write
                   causing the server to crash.

                   https://www.samba.org/samba/security/CVE-2026-6949.html

o CVE-2026-58216:  An authenticated user could possibly crash a KDC process

                   A kpasswd packet that contains malformed ASN.1 might cause
                   the server to access 6 bytes of unallocated memory. This
                   memory is not exposed to the user, but in some
                   circumstances the server could crash.

                   https://www.samba.org/samba/security/CVE-2026-58216.html

o CVE-2026-58218:  DNS signing DoS via TKEY name cache exhaustion

                   An unauthenticated user can repeatedly register names TKEY
                   names, which floods a cache causing legitimate TKEYs to be
                   expunged. This can practically block the use DNS TSIG
                   signing.

                   https://www.samba.org/samba/security/CVE-2026-58218.html

o CVE-2026-58221:  Samba AD authenticated LDAP access domain takeover

                   Samba AD low-privilege authenticated LDAP access allows
                   modifications to internal LDB special DNs, which permits a
                   domain takeover.

                   https://www.samba.org/samba/security/CVE-2026-58221.html

o CVE-2026-58222:  Samba AD LDAP Compare filter injection and trusted-request
                   confusion disclose protected attributes

                   An ordinary authenticated domain user can bypass access
                   checks and query confidential Active Directory attributes
                   (such as KDS root keys) via LDAP Compare requests. Due to a
                   filter injection flaw and trusted execution context, the
                   LDAP Compare operation can be turned into a
                   protected-attribute disclosure oracle.

                   https://www.samba.org/samba/security/CVE-2026-58222.html

o CVE-2026-58224   The CTDB protocol has bounds checking issues

                   CTDB fails to do integrity checking of received packets.
                   This includes failure to check field lengths against packet
                   lengths when unmarshalling packets.

                   https://www.samba.org/samba/security/CVE-2026-58224.html

(alternative to commit b5e6133eabd3371f999f26215ac70406530eb0d9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1875343d11..ad60feaa2a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.22.10.tar.asc
-sha256  e601437cde4845a42e7818379cd0ad5fc4fa518a7cf5284cc0a2657e79b30c34  samba-4.22.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.11.tar.asc
+sha256  d569b298a81cc212a39e9d1813bc4ca5c71ac93c4ceb2eec03db178096958d00  samba-4.22.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 50ae8ba6af..3cbcbd0dd1 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.22.10
+SAMBA4_VERSION = 4.22.11
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
