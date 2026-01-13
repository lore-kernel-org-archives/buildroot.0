Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C04D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C4440DBC;
	Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vOWVH3DSonv; Tue, 13 Jan 2026 20:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC5F40DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337998;
	bh=icXebKvO6awbSrOfnDKRwgIJwurKjPk24XsGBRnBrRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LslnxogASNhXUtspUAAxdnZVpSmmrp1MfE7j2xewZBSj/vfhc0OG0T+JKLfJBvH8s
	 XX5oxY4NzkupXJAgW1IMB6Ji/JIXGodE99OAnUFeCD1TglmaWgvohvviRusRYoCP6M
	 uxRSg1GFpvciIWW0ju5mOKEtHSDVZ3HWpMSrrLjYHrCp2HbjCJx5BVfzmv3DtTdAHt
	 VlF7L+Td1KRD/WPAhFlSiALIqqRiqo2QeKZXOfYTZMvwjH/lDjCoQba5edtB37OP5p
	 IPCqEoGMEzg5sAJSJ1wpQzsUjaNL9XDd3fxenU9whRqukB9CfqFWL/Czo7JcxQ6UhJ
	 peBVCINMvwYNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC5F40DA6;
	Tue, 13 Jan 2026 20:59:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A6A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AFE240793
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nK0waQTWpzMk for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669104079B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 669104079B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64E4681382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8b547a44a5e59e4ee8b2152b6af3e8835425520
X-Git-Newrev: b07acd7c9d9ad4d4d85dfca6b3640caf6e2df602
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.64E4681382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_fslsfonts: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b07acd7c9d9ad4d4d85dfca6b3640caf6e2df602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003563.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash | 6 +++---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index 20573576c9..cc25b854b2 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003210.html
-sha256  01cb0c5a7dbddadef846ca3b52c2ab9c60f2c32c3f16584cd97a6c7f293341ee  fslsfonts-1.0.6.tar.xz
-sha512  1181a8e6cc820410d1deac98b3e5097506e4168c6515307b6b9aaf705cb57193a009cb331a51d46ce68e9548712f122b5c942d5a1bc1e01bdd191b7b1beab09e  fslsfonts-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003563.html
+sha256  67cddb1aa7fccab5d107beef32fa2c143e8a132a2b974a557557b24c6f306b63  fslsfonts-1.0.7.tar.xz
+sha512  e907e3fc1fdbfe72b7c1a502ab479ee2ff4d8577dc0c86152dee5ee48471e514d7c5749707ceb936027cbd93c68a79a0be30334aeb1f812549907c2726e38dd0  fslsfonts-1.0.7.tar.xz
 # Locally computed
 sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 1b8d630124..cee58ec7a5 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.6
+XAPP_FSLSFONTS_VERSION = 1.0.7
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.xz
 XAPP_FSLSFONTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
