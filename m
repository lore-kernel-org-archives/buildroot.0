Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF41C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F3D6069A;
	Sat, 25 Jul 2026 11:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyumFrjeklUK; Sat, 25 Jul 2026 11:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F337960672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977713;
	bh=LD2ReLKgAVxmQNqfBj9CKaQH+R3uXYeURnyp+EGXM+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CEmat1U0YwJ+iHPXDDTYQiz1l4/tZEAsWtVQ2JAztck/TkSTqnsaHuvkA8zNNMyx8
	 c+bWPjoOHL+LcmxcUxqQiO9tvtGTAPRoZZp0ygLC0fXEJ0EaoeKEchwQvdQ0avs9XH
	 NmAToqwnQSQGGV2Zc4xPIvaNHyirsgk7k1ls7e1pe/RGU+xfN0Z+JMZ+MSNP0XBG/Q
	 //W/e6n6li2SM1WmsPs59TDNGpOtvWyU1UF/eWELEkFaxJ1hUISC5b0hnPiWG0Encb
	 Z+/y89jpGqC2y2R9ejp2H2iL5NeXN9BNn2L7r0YghmTEblEIPcScA4x7x1KRbDMnzk
	 z94KxeHaRwpsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F337960672;
	Sat, 25 Jul 2026 11:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB08636E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0AE58105B
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUEOlNarzj5O for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E0D80FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4E0D80FB0
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FE4E82B8C; Sat, 25 Jul 2026 11:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34d7758626db287c5c144a810444b1ec2ff61ed3
X-Git-Newrev: 655ade728de6355df4718419cbf288a3dfec54b8
X-Patchwork-Hint: ignore
Message-Id: <20260725110749.9FE4E82B8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 1.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/655ade728de6355df4718419cbf288a3dfec54b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/dav1d/-/blob/1.5.4/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b6bae42e8f..8c1a989c16 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.3/dav1d-1.5.3.tar.xz.sha256
-sha256  732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011  dav1d-1.5.3.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz.sha256
+sha256  686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5  dav1d-1.5.4.tar.xz
 # Locally computed
 sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 011ab2ddf0..6808d8a078 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.3
+DAV1D_VERSION = 1.5.4
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
