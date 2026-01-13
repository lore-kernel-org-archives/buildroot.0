Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3FD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE36683E29;
	Tue, 13 Jan 2026 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hj-SR4Rj3ex; Tue, 13 Jan 2026 21:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF2783E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338006;
	bh=kOMX7c5teYpdQn6DkUGUeXJ1bVCoR5fRtYlhUnXy//w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TPo2FMyWXyQvArm/mTVC19iiPezFmGGSeXLF/qTwED2ow/29o4DLsOqEDf7RZiBxo
	 phPeqZYoGzOQ3uV/GMEBX24u+ZRRdkTeuypjQyuPcHNpn3X8oevoUnv9W0xqpNSq2w
	 A20EqKSBcK1z77n4tJ/Ibdx0xBqgXaFs1YnO5paxMoCDlYUG5IMLU4ce0/RjPzZMNO
	 dLf/eUr3CFso/c75RkA08Btv5MTqfMvGCxDuWxJ7FXxFRIqSgEbHRa3EkdkRdf9rWR
	 ztHG9D4P9UyyLktSlPVprIMRefpFCv8gvW/kmICO5/nfar27x+APku/Lm496RMuPIC
	 vCmOhIjjzueKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF2783E79;
	Tue, 13 Jan 2026 21:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6820231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B75B407AE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeoUf_6mHKFL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 078674077C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078674077C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04AED80F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 509fa5fd553eeb0cb77afed72bbf5cd1b50d3274
X-Git-Newrev: 87b18e6308a030375e58c150d4bcaa84d295a830
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.04AED80F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xconsole: bump version
 to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=87b18e6308a030375e58c150d4bcaa84d295a830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-April/003512.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 6 +++---
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index 59d4a67194..d8181fbe5f 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003173.html
-sha256  7b4a6af068e40e2e6a4521d6f35c9253ec152c287d025fff9cc4c99f2586bba4  xconsole-1.0.8.tar.xz
-sha512  93fd8527abed4faaf0f6a3804ab08dbcb926b0aaf67fd814c003b6b1102e2f643be5362a020c7028ae928925ffd423df6eb456d4ed48cf30a4c5f00a7ce648fa  xconsole-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003512.html
+sha256  0c775978cacdda76dfc8b5a97142f145a177d26220dd307866d9dd62e7391189  xconsole-1.1.0.tar.xz
+sha512  1b5b1e1e15e3b988c159e924ac5c51734c4e37ed112815fc6bf6e36f80e840ccd904a4f0b0f27191e0dbf656d367a38873fd493a266887daa111e5266eebf37e  xconsole-1.1.0.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 57ece56190..bd4c43e321 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.0.8
+XAPP_XCONSOLE_VERSION = 1.1.0
 XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.xz
-XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
 XAPP_XCONSOLE_LICENSE_FILES = COPYING
 XAPP_XCONSOLE_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
