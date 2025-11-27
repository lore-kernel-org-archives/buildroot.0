Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C7D116F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C7D61AE9;
	Thu, 27 Nov 2025 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otf76Xawy5mD; Thu, 27 Nov 2025 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E793461AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E793461AC9;
	Thu, 27 Nov 2025 20:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26245967
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 069E161755
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5O6o-Vcgd1zx for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A44C61758
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A44C61758
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 291CC85FCC; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 13:26:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac0a735d99ddc9f595bc46d763677f6627a5c510
X-Git-Newrev: 001fe444001c748a163691083f9141b0711f09d4
X-Patchwork-Hint: ignore
Message-Id: <20251127200757.291CC85FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: security
 bump version to 1.6.51
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

commit: https://git.buildroot.net/buildroot/commit/?id=001fe444001c748a163691083f9141b0711f09d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.51/ANNOUNCE

Fixes CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 & CVE-2025-65018.

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08ad91052b69090b74220d89b13cfc29fb86ed72)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3fae82b5e7..fc4aeba85a 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.46/
-sha1  11423f5ea270e7bb42dd2d519696adcd016d5df3  libpng-1.6.46.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
+sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
 # Locally computed:
-sha256  f3aa8b7003998ab92a4e9906c18d19853e999f9d3bca9bd1668f54fa81707cb1  libpng-1.6.46.tar.xz
+sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e73e0bb686..96b97d134f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.46
+LIBPNG_VERSION = 1.6.51
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
