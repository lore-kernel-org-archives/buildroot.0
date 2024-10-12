Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390BCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1C960BF2;
	Sat, 12 Oct 2024 15:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f03YbfZAKPsR; Sat, 12 Oct 2024 15:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D270860BB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D270860BB1;
	Sat, 12 Oct 2024 15:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7A31BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 896E940763
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tp-Q9o3k9vye for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744A24074D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744A24074D
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D56785CB0; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 16:57:03 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f4dfdc13503fb5557c75c4c7c4163bb935ff8983
X-Git-Newrev: 907c08271f6ae348c09a1a3a74e23f90aa39b210
X-Patchwork-Hint: ignore
Message-Id: <20241012150759.5D56785CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libpcap: security
 bump version to 1.10.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=907c08271f6ae348c09a1a3a74e23f90aa39b210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

CVE-2023-7256: Clean up sock_initaddress() and its callers to avoid
  double frees in some cases.
CVE-2024-8006: Fix pcap_findalldevs_ex() not to crash if passed a
  file:// URL with a path to a directory that cannot be opened.

Changelog: https://github.com/the-tcpdump-group/libpcap/blob/bbcbc9174df3298a854daee2b3e666a4b6e5383a/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0982498c6735a2d90b5540370d17e48c31c962bc)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 34339c1261..7f53b99b8c 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz.sig
-sha256  ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f  libpcap-1.10.4.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
+sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 3d05590da3..67adb0a978 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.4
+LIBPCAP_VERSION = 1.10.5
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
