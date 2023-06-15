Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE0EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C2F60E2F;
	Thu, 15 Jun 2023 20:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23C2F60E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGDkmvnF3Wv2; Thu, 15 Jun 2023 20:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609EC60B48;
	Thu, 15 Jun 2023 20:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 609EC60B48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6F571BF3C0
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD40060B48
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD40060B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhRvd3jZTsLV for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 20:42:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0855C60A88
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0855C60A88
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 20:42:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcb3.dip0.t-ipconnect.de [84.161.188.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 654B3A4C05AA
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 22:42:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50866)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1q9tnY-0004oD-0L
 for buildroot@buildroot.org; Thu, 15 Jun 2023 22:42:28 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 22:42:27 +0200
Message-Id: <20230615204227.659097-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1686861748;
 bh=ly8gH3vQMueeV+fkR5sZnR5wm6zHZieuDslJRNSotjs=;
 h=From:To:Subject:Date:From;
 b=BN4msnEhfFRIsEYp52mtuq5xnl+MY2ld8hY0OgglX0a7V8kT5c2M4ezmtJ5AQoNCu
 XpHx1bXqQ98bHk5sTP97p/cl+2vGXND0QSAuqrB9z2/e158SOBQ9OwCRUHMk2dE0Cf
 Mg5lverAH+WjLjc/URHIjitBQGhsSRPWXs8GEmyp5vj8Vq32QeSGvX42T3K29gPYMh
 fIfjf8i4eNnwa75PSfK5BCZ/avDrB87KbqTwpcp6Xn/13nIZ9g3Yu8LvLmso+GgRHg
 glyFQh+SBhl4Zd6kGMaKqLgVxS3zcSw/IJHWHTn7hjgPG4G1A4uc9tWCsUGyJ4d6k8
 iRiPQO/sa72sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BN4msnEh
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 8078b41157..16bffb7e57 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  371a2a323a99a79299b9b4caa4a31bc7b2cdff63236e68d429f3ee50e75f3dd4  openvpn-2.6.4.tar.gz
+sha256  e34efdb9a3789a760cfc91d57349dfb1e31da169c98c06cb490c6a8a015638e2  openvpn-2.6.5.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 920677e170..7c2506870e 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.4
+OPENVPN_VERSION = 2.6.5
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
