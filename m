Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390CC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6B460AE4;
	Fri, 31 Jul 2026 11:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr3AT-smNqXd; Fri, 31 Jul 2026 11:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E2160AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499028;
	bh=9DZodECaiF+pRcseCQxDQZGVZ9wjWpxlBSdjXIUp32M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oA/c0Ze2G3fL8WCEs9Zo/uGUaYrgrdr5RgCTmAvk7gUWYXN2GVVUBKBr9POG2EEBo
	 6Gnha0aRVgKWE/X2Hj3gucYThtRUnSl88+A5vc4MExCdjM/MakAPwGaSjySINMcfv5
	 pItmjPfaP2MdGXttEbfqK6/fWKVetRKW/dShcoaym1N9aKJvUi/s0/66VrycllPY93
	 JAIzu8/ImsvNX51KDvHbWEsPbBRJtVnvk7vf6ynAI8ZotnzGmai8BiRi70s9OrEjAi
	 mxCIXaEau84Psy2scykUUUGoUWbDUz+Kl8+CUZ45W0cZx3hZ86ZFK9mld6u3db1Xxb
	 yIzmlfDZwUN/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E2160AFD;
	Fri, 31 Jul 2026 11:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADF5937F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A058A60825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXrBW_SafYeW for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41E560AB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F41E560AB1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5C1A8B741; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:44 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f987d74fd4f774a1c7f26fced93ab12e691ae471
X-Git-Newrev: 85a70eceed37cee9f50b05257dc475c51b894ff4
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.E5C1A8B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/binutils: fix
 license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85a70eceed37cee9f50b05257dc475c51b894ff4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

A few headers outside libiberty use LGPL-2.1+, too, and other headers
and some scripts use GPL-2.0+.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 95b77f7a71fdb312421dab8839d6fdfa4964c9eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/binutils/binutils.hash | 1 +
 package/binutils/binutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index df2613055a..dc78113dc8 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,5 +7,6 @@ sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
 
 # locally computed
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..f39d24e986 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -27,8 +27,8 @@ BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTION
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
-BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+
+BINUTILS_LICENSE_FILES = COPYING COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
 # 0003-objdump-memleak.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
