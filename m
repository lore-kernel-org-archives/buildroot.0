Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC05BE9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08906111F;
	Thu, 19 Feb 2026 17:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HE0Yo0Z9Cka3; Thu, 19 Feb 2026 17:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB1C610F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521943;
	bh=OI9HJ8JypTJOhlkX5hU7GuJm64vCIEnqsp8oSeWN8zI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l116zOzrSihpQJSEB01nYIZnpOTSsCXMnNTloBWj+NGNp6lCZ2b/8ScmdscXHcphJ
	 /Xj5kG8M2fmWdSoL2EUmP3cNVyy8f60Z/9bv3wxR5QWyQpJJuBHKBVkCjUM76cS1vI
	 RQvadt99WOyNe5aCzlwJMBQ/+FHnvtMm8ahxU2ondt0zKWzV9Y8WOAyvkvLXeD2qvA
	 I7HTCuIWQBvggIyJs69Fk2ZCb+1ST9JIdqWtIPDNHFTGBf2wWdJThdWy3Cc8VU2ITt
	 HejBY0T++bU+8S4yDO9LSXjSIauSsVNtWktGqwlfqUxZUcz22zKciD9t09/VCt8xcR
	 Pk0ARkT7E/mzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB1C610F4;
	Thu, 19 Feb 2026 17:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 630AC37A
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47AAB40848
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwzHAgRedpaV for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC45403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC45403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BA6782DF0; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:05:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d61f45a163a385cbe059ec0ef4ebf05f0551412
X-Git-Newrev: 5d59cfc7c9344c4f06ecc937952f3f7360af6407
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.5BA6782DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtasn1:
 security bump to version 4.21.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d59cfc7c9344c4f06ecc937952f3f7360af6407
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security vulnerability:

CVE-2025-13151: Stack-based buffer overflow in asn1_expand_octet_string
function
https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00001.html

Release notes:
https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00000.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5fd8b2458690a865065ef97951a345f659477648)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libtasn1/libtasn1.hash | 4 ++--
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index b9c9dad131..f099b7bfd6 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz.sig
-sha256  92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c  libtasn1-4.20.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz.sig
+sha256  1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87  libtasn1-4.21.0.tar.gz
 # Locally calculated
 sha256  990ef6a87f29a9d3db33698b94ea026a5d0f81bbf9806333d73699a250b7e5d6  README.md
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 3154e500f1..9a853e2312 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.20.0
+LIBTASN1_VERSION = 4.21.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
