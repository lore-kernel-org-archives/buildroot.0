Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96710C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19757406DE;
	Sun,  5 Jul 2026 16:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeWJCHW_oLBM; Sun,  5 Jul 2026 16:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40AC5406E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783268003;
	bh=8B5NQk0n9Ohu52KB4ACEYucTvSuzAUhK0XD4PAAP60Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ah7JxtyhVAU0vvQqbPOGFSs2MyzeQ2plF4FeQXAvzC9kZmZiOvPKzy/jAGoXk9ROo
	 pZj0FT2ofbNZlys3QldpNRJT3ZxTpaaSpi2TqAAfKo6K3vp7d5K0H/CQQTyP+4Ohzy
	 omuyOJqlUJp8lkdglYxMyz6pHlKN3djT83zbERFj2k/lqpaWx+WjdSriA1tqErFWsD
	 YjVHuMU7vtcpHWtQuYxkJGDO+nJR8aAxTrTiomCgC0ZyhX3JPjB/J34Ig2BPgz2cgT
	 6m9OJGFx7Dn81Ol/PalNh7wEdLfr9fjCmhREXTpv12AYbsK5sbUZJsnUkmtvFbbKYB
	 kCYcFAwi0QsEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AC5406E1;
	Sun,  5 Jul 2026 16:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23A5A2A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0964040071
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJzP8hkwjHLe for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF69C40056
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF69C40056
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:13:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8892B88499; Sun,  5 Jul 2026 16:12:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 16:51:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6021eda8a7532c6cbe71b7a7523fbf82a403f6b7
X-Git-Newrev: 82fcd634ac81fb7e0f6fc32cc600a42528912d42
X-Patchwork-Hint: ignore
Message-Id: <20260705161250.8892B88499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: bump to version 3341
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82fcd634ac81fb7e0f6fc32cc600a42528912d42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version fixes boolean usage for musl toolchains:

Use <stdbool.h> whenever possible to work around musl libc incorrectly
defining __bool_true_false_are_defined.

Fixes:

https://autobuild.buildroot.org/results/5719bb7f5bd709cebc8012341c0b448a8fec3aba/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 00cef19b77..d7555c3be8 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a071da3204132585a40313e17e01699d428e0fc9b58d30fcd7e538037254668  libxmlrpc-r3335-svn5.tar.gz
+sha256  b7fbe0fe9f6393c59c31f85c0ca7d050db83bb630fceef75ca7cabfd2fc3fc3a  libxmlrpc-r3341-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 283914ca81..c2ccfe80ab 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # 1.67.00 (code/advanced@r3335)
-LIBXMLRPC_VERSION = r3335
+LIBXMLRPC_VERSION = r3341
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
