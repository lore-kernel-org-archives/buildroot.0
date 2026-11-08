Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A429606A320
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ab7OMVhM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190B460678;
	Sun,  8 Nov 2026 10:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhbvMd8W5q4Y; Sun,  8 Nov 2026 10:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 31EEF60664
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794132012;
	b=lHIIFYJNhlW1Io0FeMFSg/k4zOVMsr1SxmqrIqPLIk7jY3EcuK3Bb7urWKp+D8kdPn1E
	 /vUDpzVMta8koUAru4lKYaz1pgmmqbXLQPWNnQ6YwQRPU6+zR3QYjFGmk1ywnJhPyhY30
	 bVYy2JHqaqtbtZoh74GtEDeJwjTH4bozNK2N3B07/EkDc6eLrWioGgv7jbitkJpi/XV/r
	 HM/+Pi18EytTYmhLkDGc9XGzjh5GKqN4TMGZwul/v6TcvHOLWXUUbjM6RtfMoJAG2hVJ6
	 C3JRx0ZkmupsSunLnuxDi2dq4NT9m/OHNLkwuDa+5thF4MrDffx8eI+v/+1hYfvbbfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794132012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mdir1m53wS46V/BRopS84hZcjP/Bk1A5EilGnc19lG0=;
	b=InCjaDThs6zuSZlIVaRuMjvRQVzF1zlxwGEOFtO6C/gsO7ZdiFSsnRgfLn00IUS5Stfl
	 vbnVuyAPYidGWuZJt2jhklEHvcYcutroJv77F7XI+Bde2gnb3eqs7iuzXf0bbkoC3ZaTt
	 A38yrFSHhK6JIZ/y1yt+Tw3PVdA4Zj8r77Twpvf45F5Gf75vs2IQJauCG+rofvSpRlwZI
	 mm7XgYx7/XKJnMrALANti2QmKTT941sZvbR2iwzN13lylPoMp3cdRYr7R3s2bVxmOvAzz
	 cIpLV9B+F4B889Wcm2ldb1TlV5nBYhrMsPfqpHYQsh1c5v3XPSEE8vGdV3SR4dMSYIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794132012;
	bh=mdir1m53wS46V/BRopS84hZcjP/Bk1A5EilGnc19lG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ab7OMVhMVcg1lV2pKnhiIvlmJ+kxVnxY6wNI3owPOtCiCmNq34t1jA7gtLDGg/+dU
	 Wh5Zk0HBNhrUPGZ2CuPUY3it4LtrGLN8HJdQNe+eV1dWuEk4X8+TWIWP4fUH5YyBpT
	 lkYpybzAg89rURbMclDt7NTX9I41W2zBUSHTm2DjHcCL60oiIDmBOks0wngB9trRx8
	 5uVt0fgFLlBKTVCNFX9jrxosPd55wXeTwUV/Dj7e2jYjQlpfHiUVa7UktiFqGFGr8p
	 focxmhOZP05OnlP6tRcHjz1EU3JPTpGGnXXNO0HEPrcQ8cC6bAdKryyNA6mXPohWDN
	 vrQFRPS8xyeCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31EEF60664;
	Sun,  8 Nov 2026 10:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C0B31F
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1946460664
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk6_GzZrOvq8 for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 10:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4EA1B6061D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA1B6061D
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80F138A574; Sun,  8 Nov 2026 09:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Nov 2026 10:53:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 261a30b253068338d8c4f1548828eddef754ffe0
X-Git-Newrev: cdd3776b4ea728fdda5fcde708e25d0a092e6864
X-Patchwork-Hint: ignore
Message-Id: <20261108095836.80F138A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.22.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdd3776b4ea728fdda5fcde708e25d0a092e6864
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes in 1.22.6 (released 2026-08-20):
- Some changes have been made to the code to pacify gcc's static
  analyzer.
- 'regex(7)' has been added to the --help output and to section
  'SEE ALSO' in the man page.
- It has been documented in the manual that the cut buffer is deleted
  when a new file is read with 'e' or 'E'.
- It has been documented in the manual that using a regular expression
  inside the command-list of a global command may cause the "last
  regular expression processed" to differ between the first and
  subsequent executions of the command-list.

https://lists.gnu.org/archive/html/bug-ed/2026-08/msg00003.html

Tested using:
- utils/test-pkg -a -p ed

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 39a6ff5f22..acd4896fdb 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html
-sha256  56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc  ed-1.22.5.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2026-08/msg00003.html
+sha256  3f33b22135219c39c3c695f7b7171c2567d3e2a17c798c0a90607320cbb268f2  ed-1.22.6.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 6e1d5a3d05..32638ae081 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.5
+ED_VERSION = 1.22.6
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
