Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0DBC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64FE40A03;
	Fri,  7 Aug 2026 09:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_3Z47XZnZBF; Fri,  7 Aug 2026 09:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0214540A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095336;
	bh=8XRdLu0UfQ5KaXmKFv+D4GvxztUc3gr227A1g65jArI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e+KfL6bh9Y9J9bu8yL5JbasJkVRfraiKrn4KbWV6G06OaQ40woVRIrugLNB3GYPv1
	 JAw74e7JScT+fuK3UUXOq9G7FUaEVyNSl34qHR7ZXbcaByOVe1mreo+UWH/sTDso0e
	 ry+LJzcLfEeSbgkUEo3KFoXMCPJGNOx+5uI54rmO4SaUaAdShwoX6n7n2idSi0h+I/
	 21V/LLzQqbI/PGGKjSAcHH88j7iYGafINMO62xYSxCOJg7u5LF0d+JiA0g0703KHVI
	 rEXDTc+qJv4H9K71ZaQL2f6vunHn1tDt9aY+BFfkN2OPN58kYiWNVRg6G9dMd1MMaf
	 2nqbUgsfW9vkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0214540A28;
	Fri,  7 Aug 2026 09:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D9D397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E95A40A07
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAuWwwQHoAKm for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFED40A03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CFED40A03
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 140D98CA44; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5937858c88164c3cfb5dd6ae68d152e081280422
X-Git-Newrev: c39801d4efa0f51938ac3893bb2d48d3c10d3c69
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.140D98CA44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/samba4: security
 bump version to 4.24.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c39801d4efa0f51938ac3893bb2d48d3c10d3c69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit b5e6133eabd3371f999f26215ac70406530eb0d9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
