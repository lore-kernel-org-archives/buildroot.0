Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CA1C5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F0F40A04;
	Sun,  8 Jun 2025 11:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV98tscSZO5I; Sun,  8 Jun 2025 11:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6FA940918
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6FA940918;
	Sun,  8 Jun 2025 11:09:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95706C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E0460E11
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikNEcbiAMzIc for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A12A060DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A12A060DDF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A12A060DDF
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:09:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D7C62B00572;
 Sun,  8 Jun 2025 13:09:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Sun,  8 Jun 2025 13:09:35 +0200
Message-ID: <20250608110935.18887-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380986;
 bh=ud44q+rpVHC3OVwmDN5JXekMrdh/qWZmOa5zpOta4i8=;
 h=From:To:Cc:Subject:Date:From;
 b=R7eDxyLN08bLWyhIqj5uRypH0Fi1qBqbcB71J3HqzYrVOkTYUVXY3TTQ3KlyS007h
 KcFaVcwxgK6Yyzza07m8h/FatNMe7U69c3r1+NaxgnZDqB7DzXrDR/mt3fZ+c3a3AB
 VRqasK5EXunOSIvYtKWnrJFAx5FVfJF0pSSsyeJs4IdITbRlbHFM6GZyguANPmvGnH
 JSskXtthpGGNOw9k3fyHpnqYB6bcyXotr7taQb9vIz81DBHKXXrXpFheVvDosfFXfw
 RkLZrLiuZNNbnTZKZ+ds70ESfN2e3urPqs9ft2sGTfFvZ4mUqJKvSdbuTUuMBsxNmC
 4RJ06qrvW2sXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R7eDxyLN
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: webrtc
 needs sync_4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] "package/gstreamer1/gst1-plugins-bad: bump version
to 1.24.11" added new requirements for webrtc which selects the
sctp plugin, but forgot to propagate its dependencies. The sctp
plugin depends on BR2_TOOLCHAIN_HAS_SYNC_4.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP
      Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
      Selected by [y]:
      - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && !BR2_STATIC_LIBS [=n]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/90b3cfedf44cc92289746aa30e439be409ca3747

Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 4c4e993714..89db860f87 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -659,6 +659,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 	bool "webrtc"
 	depends on !BR2_STATIC_LIBS # libnice -> gnutls
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gst1-plugins-bad sctp
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # libgstsdp
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
@@ -669,6 +670,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 
 comment "webrtc needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	bool "webrtcdsp"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
