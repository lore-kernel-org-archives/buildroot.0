Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F69AD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A6C761095;
	Mon,  8 Dec 2025 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93jJDF3C8nu6; Mon,  8 Dec 2025 19:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B346102A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765222585;
	bh=wriTm4Tvui2reQFYpDgCIHcKjdCv36s33hh9d2CXbmk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gWBeQ6TnZYUFw+H4mkb2Cyp4mrg83ebLtp4PXXvr3W6ResWGExjORHBVkkuZMfdgK
	 bwPqWSjU+KQ2xwpeu9XLjb8CT6gOo3pOv4iTWpDucNw6nxmF1YCE8Yjlwhg2K9xUk5
	 r3roEV0XR8ju3Ld0pGEBpLX6VyR2uX9xIazAY9xI1g95DfFx45ngJuankWgSASsz1i
	 vfZLc+H69IhrooBR1Tben1uET+gjm3caZVd4JrlizmWPe0XlktGLbrLDH7M4YOO8CG
	 nqYzrQvItmUz6+srYSnUrgeHOP9IYHe09dvfvlaio5WM0iYbMKtH9zJugCNyXONFFh
	 RL9SLDhS1EfHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B346102A;
	Mon,  8 Dec 2025 19:36:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3901A151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2982D404DA
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ov2shHMGDNFZ for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 19:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DA1740473
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DA1740473
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:36:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1837586492; Mon,  8 Dec 2025 19:36:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 20:33:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6086429850d20ce7fbcaf88ca83504c674992c10
X-Git-Newrev: 8344efd7646d3eed0e2313b1f692bb662d6e2d8f
X-Patchwork-Hint: ignore
Message-Id: <20251208193623.1837586492@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 6.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=8344efd7646d3eed0e2313b1f692bb662d6e2d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/strace/strace/blob/v6.18/NEWS

Buildroot commit a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c bumped the
linux kernel to version 6.18 which broke the build of strace.

The issue can be reproduced with commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_PACKAGE_STRACE=y
    EOF
    make olddefconfig
    make strace

The build is failing with error:

    listmount.c: In function 'print_mnt_id_req':
    listmount.c:39:16: error: 'struct mnt_id_req' has no member named 'spare'
       39 |         if (req.spare) {
          |                ^

Fixes:
https://autobuild.buildroot.org/results/8e3de892a1c4aa176a8b3a5defba48aa9830bc89/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - update pgp key comment in hash file
 - add commands to reproduce the issue and error log
 - add autobuilder failure log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strace/strace.hash | 7 ++++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f6833d08f0..268045ef1d 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,6 @@
-# Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.17/strace-6.17.tar.xz.asc
-sha256  0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0  strace-6.17.tar.xz
+# Locally calculated after checking signature with RSA key from
+# https://raw.githubusercontent.com/strace/strace/refs/tags/v6.18/GPG-KEY
+# https://strace.io/files/6.18/strace-6.18.tar.xz.asc
+sha256  0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325  strace-6.18.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c693d15bf9..5230b4d60c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.17
+STRACE_VERSION = 6.18
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
