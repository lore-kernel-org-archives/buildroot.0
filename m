Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74824C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105CC60EDC;
	Tue, 15 Apr 2025 20:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLYb8ZRpfv1k; Tue, 15 Apr 2025 20:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDF4607A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CDF4607A3;
	Tue, 15 Apr 2025 20:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF95B109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5FC681289
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVWVJyzSg110 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F37981FDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F37981FDC
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:33:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDD4C84AE3; Tue, 15 Apr 2025 20:33:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:27:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fdbbefa08308921fe096f38fa71e63dafc5d6ac
X-Git-Newrev: e2eb2ee58b9f70ebb83231537cca19bd28fa48de
X-Patchwork-Hint: ignore
Message-Id: <20250415203350.CDD4C84AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: bump to version 2.76
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2eb2ee58b9f70ebb83231537cca19bd28fa48de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog 2.73 -> 2.74:

- ERRATA: Bug 219838  the psx go package fails to build standalone.
- This release addresses Bug 219687 reported by David Runge.
- Group syntax parsing bugfix for pam_cap from Tianjia Zhang.
- Doc typo fix for cap_get_proc.3 from Tianjia Zhang.
- Fix transitive include in capsh.c from Leo.
- Go package documentation updates, including more cap examples.

Changelog 2.74 -> 2.75:

- This release is devoted to a fix for Bug 219838 reported by Frank.

Changelog 2.75 -> 2.76:

- More libpsx and psx Go package mechanism fixes (many thanks to
Christial Kastner for helping dive into the off-piste
architectures. See Bug 219915.)

- To make the various .so files continue to be runnable as standalone
programs added another workaround for glibc. (Bug 219880 reported by
Christian Kastner.)

- Made a new man page cap_text_formats(7). This makes it possible to
separate the tool man pages from the developer man pages. I believe
this was the second time this was requested, by Carlos
Rodriguez-Fernandez this time (can't find the former request in my
email).

- Dropped Make.Rules definition of SYSTEM_HEADERS Thanks to Ross
Burton for reporting.

- Removed a spurious debugging printf() from setcap tool.

- Removed cap_ workarounds for go.dev cap package examples. The
website bugs have been resolved: go/issues/70611; go/issues/70630.

- Added a Makefile to the contrib/seccomp example.

See
https://sites.google.com/site/fullycapable/release-notes-for-libcap
for all release notes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index ec59f224bb..68c331f2b4 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5  libcap-2.73.tar.xz
+sha256  629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f  libcap-2.76.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 25b3a46c44..b4158a5be8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.73
+LIBCAP_VERSION = 2.76
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
