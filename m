Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCFCD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBCA184191;
	Fri, 15 May 2026 09:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRSPDk1Q5qHS; Fri, 15 May 2026 09:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB2E8416C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839009;
	bh=Ku+ER6uS5/rGM296YUIGbydZIrPDbq0Lpd9vAJcLAPc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gtMpMbP3fhHI68sa0knMmGOgRMuBXv3T1LyBFU3L4jY2zogNVknXM4ZUfYaNEDxr8
	 01by3TxoQErMHDJOIcJHBVSzcs/6E+0EUMvAjAWFrzvvqvrub4ytvnBv8tRDDPxL48
	 UqDp2aAXWl4qciqPg+KiIR9me94SDOui/NSfUU4fi9RZ9nc9OzAecBfGcAmXUJIBjt
	 E8/LU6vloILggdt9NTvYueLloB1xCOZDiawFgePKjRQdQoDQNPhFWfN7HPKK4k8/vm
	 AU0MmGEuBLbb+4+MOJRffcB7bQ/fX8+SnJfoWOZOygMrLeXHrux92l8lybXr5LC8dr
	 TGMNF290m9VsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB2E8416C;
	Fri, 15 May 2026 09:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 070AFE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5550783DD2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmhBEHm4T2Hb for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B8283E8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91B8283E8F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 026CB8632D; Fri, 15 May 2026 09:56:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 73594f1d0e53f5be9f2676d33524cedd857fbffe
X-Git-Newrev: 4e05cde6527621736cb6cbbc26958adc4a9942ca
X-Patchwork-Hint: ignore
Message-Id: <20260515095634.026CB8632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmediaart: bump
 version to 1.9.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e05cde6527621736cb6cbbc26958adc4a9942ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.7.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmediaart/libmediaart.hash | 4 ++--
 package/libmediaart/libmediaart.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 34094744a9..f5d052a61a 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
-sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
+# From https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.7.sha256sum
+sha256  2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b  libmediaart-1.9.7.tar.xz
 
 # Locally computed:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index d4480dbe5d..3d454023f3 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).7
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	https://download.gnome.org/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
