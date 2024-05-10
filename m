Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14C3C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79D8542C25;
	Fri, 10 May 2024 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmnLZ59EHDCc; Fri, 10 May 2024 21:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F9A42C2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F9A42C2F;
	Fri, 10 May 2024 21:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D10541BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2CB84304
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KL9AIBFSsM44 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CFC842DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67CFC842DC
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:34:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C81886F79; Fri, 10 May 2024 21:34:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:33:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dd00cbce5d9d2eb4f5232080459ba32416192ef
X-Git-Newrev: 0daf2fc73d82ccb7c3e4018fd1b863232dc35fe5
X-Patchwork-Hint: ignore
Message-Id: <20240510213459.5C81886F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: fix CPE ID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0daf2fc73d82ccb7c3e4018fd1b863232dc35fe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 11b439ce1bd28506051fff14646f8bbdbbbe58d8 forgot to set
HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index d55c2d081e..778a5235f4 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -11,6 +11,7 @@ HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).t
 HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
 HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
