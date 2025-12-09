Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF81D3B98C
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66BA084551;
	Tue,  9 Dec 2025 18:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYId5y-bgd91; Tue,  9 Dec 2025 18:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A09E84561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304907;
	bh=lKTKGG/8lKtJ5W0sdl77WFwKeFHDhuL7tsEf9RzeTIY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l3vKC5gj3qTF8p3XXmdtKyeOvZm1yT1bUcsl6CwVVVzncaWmfKtedbtQCQwyDX3Fe
	 hn1sL1rqP/Xu6JE5GWKt0qKRNFsKs+63i3pEhCMa8JDmG0MrEKsl6WAij+zmnmnJ42
	 q8Ab086Q2uOE6aXa7/V1Ognzs/OPGiuIfMcvOFU5+CC4BkXs/p477eBsf5CB/EoEMV
	 x/JJ0qKo4zGi1aGta16iS86ZNgMHsY3xqouPpJhhw3XNHQ/DZmJ0ow6puD17aXwBAC
	 FNxbawgEcwZJV6D3+2kHHggJUNwk6xA2+Rw1MJ2uM2EvcgJhnc+of+FZjNhWrxh5nx
	 C7apKcVUJ767Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A09E84561;
	Tue,  9 Dec 2025 18:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E919E237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E623C40169
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltuWTGSUKYfc for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8014016A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB8014016A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A2686967; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a644ea1e2d8c48e84cf9bb770abe71765949c1da
X-Git-Newrev: b464afb37920beb8fdd84c87eacec16b8a825d2d
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.B8A2686967@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hackrf: bump version
 to v2024.02.1-118-g390837715b
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

commit: https://git.buildroot.net/buildroot/commit/?id=b464afb37920beb8fdd84c87eacec16b8a825d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This bump includes patches which add cmake4 compatibility.

Instead of adding patches for
https://github.com/greatscottgadgets/hackrf/commits/main/host/CMakeLists.txt
to the latest release from Februar 2024 we bump the package to the latest
commit from November 2025.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change _VERSION to use "git describe --abbrev=40" format]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hackrf/hackrf.hash | 2 +-
 package/hackrf/hackrf.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 0426009dd3..f2424d44d2 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32a03f943a30be4ba478e94bf69f14a5b7d55be6761007f4a4f5453418206a11  hackrf-2023.01.1.tar.xz
+sha256  5aed35668876b661662c56575af982af8d5c7cb8e30b6ba220eacc7e00f0894f  hackrf-v2024.02.1-118-g390837715b3741902b1b13c899bfd04a0bb6b0da.tar.gz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 0d7533815d..c1be8ea9e6 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2023.01.1
-HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
-HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
+HACKRF_VERSION = v2024.02.1-118-g390837715b3741902b1b13c899bfd04a0bb6b0da
+HACKRF_SITE = $(call github,greatscottgadgets,hackrf,$(HACKRF_VERSION))
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
