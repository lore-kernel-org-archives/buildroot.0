Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A148FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A7D160B77;
	Tue,  5 May 2026 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baVyM5Co6pcL; Tue,  5 May 2026 21:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D126360B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016556;
	bh=fI2Nu3/r55cZjM0I7uWVCShvpXEHQbQqqwfxYoYtipA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qe5T9bfCoiMi0J8ry5piGzTkTWItGKsRPk2VOjfTnTklWdHk5GqpYfn0wPmaPftNu
	 fHnRzhn9NEmV3uHd7tZxlfiUxyDnw/hpy8Iop6DD21UrIQqDHDF2T06MIaqBZ1qhMA
	 4OYX+TB51oHRwtOSxcJFB60ELj149RfSCdZuEWuIuqMQfq1WEQXomXYYUtz2qcRX2a
	 4B9viCwu8QCK4N0lpUhygl3YVdezDukX89Gz5bxv8abslrgt+xtaczoKrUPLblfCtO
	 0a3T2pWQyRJHIFc1Htbr0Q0Iau0ImAg93an07vXRLxu3vUSpPGAsN4GuKr3kx43Xqf
	 ajGyXcO8p+LlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D126360B60;
	Tue,  5 May 2026 21:29:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F06315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1485740446
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgdAW2gI2qlV for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6466640444
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6466640444
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E6ED84689; Tue,  5 May 2026 21:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:21:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea67c920a9d39e6241230f7e68a1ea32bfdc231c
X-Git-Newrev: 256eb4b881437f6ee88d9e3d53810921248bdad5
X-Patchwork-Hint: ignore
Message-Id: <20260505212913.6E6ED84689@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.13.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/256eb4b881437f6ee88d9e3d53810921248bdad5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_13_6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index c01bcd8f1b..46ec78bf06 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.5
-sha256  7a8945f4ac7d4bb79c0055cd3db7857a6934c2b7ab3d80bb11a0f5271e36fd94  ccache-4.13.5.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.6
+sha256  a7de667ca08cf67c3c8af9f213f6aa701a1188a2b3163fb74483858ce5e79fbb  ccache-4.13.6.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 74fa2fbf90..a7302d6361 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.5
+CCACHE_VERSION = 4.13.6
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
