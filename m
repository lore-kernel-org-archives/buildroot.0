Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46841D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B61340C38;
	Tue, 13 Jan 2026 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcfTGaU4Uto8; Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43EFD40D31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337973;
	bh=sWr7dp5esWDlLZNfgPe1+XQo59Vsmsr0QvpjPM9kRKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ceKQi+YOzz2n+Js3vmq0brIB95i6CtbpjJtrQsb6ryhHM3QyPl984nyHwmxNc0fil
	 tZTguhjMRyVB5w2aE+xWmjfftu2azwayARzVoqXUXdTOj4PMxOjsfEqYI5yvCTlRGa
	 VDHJA8QtfSX3DYFU93yKNwFA7qXYSD7Hp77NnciNf/N7GTlvJzBC4Y0jAxV+cjF958
	 fgPCenylNCWiHXF84QUjky+IbiSBeiRCBoWOTNa8/LavgdUCR1gaKtJj+nWD0k56C4
	 PVD3wY8ElizaOox+Q1ffPyYBVRSuCpqKVUOifwV8x/8csSqR2wfWvzSBrD64BmDwwn
	 IA0teUbpQEXLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43EFD40D31;
	Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D78461CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14520407CF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwqXSzk0zd4I for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7219D4079E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7219D4079E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 715E787F77; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b07acd7c9d9ad4d4d85dfca6b3640caf6e2df602
X-Git-Newrev: bd3024c896b5704c8c5765892f8b92ced874710b
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.715E787F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlogo: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd3024c896b5704c8c5765892f8b92ced874710b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003557.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xlogo/-/commit/c31ea299ed8e2915361dc4109d7720bb32992413

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xlogo/xapp_xlogo.hash | 8 ++++----
 package/x11r7/xapp_xlogo/xapp_xlogo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index 58f2ac4028..7dc7580b36 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003257.html
-sha256  c16ae461a7f7ea275f55c82acf3ee86ce0eb5e406f3a91ab2bb4d332693f32a0  xlogo-1.0.6.tar.xz
-sha512  f0c921e0e34d2c0959d95ca0fcb7488395043280b8b35bcad4e8a528224f2b38581fbf60e82239d06760ecd637692cb29c3b1c0c46ac7f269f692a139d954ea0  xlogo-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003557.html
+sha256  8a3f67b20407a53286a7de1a04dbda12d272234d59ef35e68ecfaf7633d83624  xlogo-1.0.7.tar.xz
+sha512  dfea0d42aeec7394c487e009c22ebb24af9501fa8144079d4fe1f32931cfad6bd1eb3830a1d211b9785a9f89fe22c61d4d4b6d6b881af42f3f916ccc5eb9ce66  xlogo-1.0.7.tar.xz
 # Locally computed
-sha256  972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
+sha256  29bfb0a3200dfa6868639a6ab313d1049d0aee6c2de2752c2c279a6be6121b1e  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 27d693bec9..84f464204a 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOGO_VERSION = 1.0.6
+XAPP_XLOGO_VERSION = 1.0.7
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.xz
 XAPP_XLOGO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOGO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
