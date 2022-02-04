Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6E1C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F81D405C7;
	Fri,  4 Feb 2022 15:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMt34zWDWamo; Fri,  4 Feb 2022 15:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4863640529;
	Fri,  4 Feb 2022 15:48:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 444311BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1527D41778
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_IGRYRpFpNU for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E353041779
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989594;
 bh=J15ZFSLXaOBiy0wbBRU+tATIEiPlolLqfThDSthHo3U=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ksZ/jE0utdZwxde6gIba6Vu13+/aye0774F8+m/vgiUjrbQY4mPbKEn64tVbQHPVi
 3ISVCJUeQxolyQpZsFZTuJFpCakMFxsIiiJUHJx5W8cSPJDhN0rGweXivtNTzx35Eh
 p6SfzsmxWNeptKeDyBKdX25LY0npXn92ZCtd1YUI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MY68T-1mhcOq3qRx-00YTWA for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:29 +0100
Message-Id: <20220204154631.17814-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YjPQvJlSqhUKM1ReGHvRy6RRiDP9sQrdvN3hwZOCqTW/mvgJdKy
 rlLK/N9cDu7BQ4iSq/v/nHwlSgJ3MrH2MQWBEcYrZZkPPiEts242ZUjbZaxwQ3ic8f8Rg92
 YA5PimNW1WKnncMbDSKot2VXgWMiRl1uKq+ZlRhOu4idYBXzUSGLv87wAffBMw2PmeBMDfX
 GXc85Hhil2CaUjiyMxTvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JIDG+SeubcQ=:OlWp/RXIb5cz3epcaIVbtm
 5GWVG6n3g1yR8xTj6hbgTetCDwRxxjfemdiy//QaNEW8qyQuIWbRNYshCCj7Hhkx03tzKGQAr
 R2cZ8YxCraOC5RXdVNTd5QxWCMaTmvuPBmFWcQywxkis6bmySbv1vCM+IgL0q+bKeJl7hFNBd
 Gz3nlN+V0OjLmdDO1lUOUOE2VLoiVAnp4zCCeG3ZhYM6HuDUVVVFmGDMS8YP9YELnVE8s5XDx
 LGO0P8UmNNrt1bHdbasGHqErIPl6QkucX3SdZnTRc1UuIglI1frZGB3A+XFH7xSW6cnFYwtQ6
 9HdPus2+PG8uCyAmws0SogNrnbRq7mFq5g32pkcVL1CwHyGrWdqduBwfBlRLiX+hmy5dCTkkx
 S7H+BAIzZYLiUVWVRW5ULspgfJ3AmenffL7kSfmqOB7A18lC36gndlyxaBrgIDUJQNNIjRth2
 hTpBVMIaH8mU2HlcbMfCO6vruI01nFbqhJiY0VyA+Fc7SFwA6XUWDfADUEF354nM5i2SugRVM
 3F5cV2/nkYlE0cUEcgZXsqtsvixINdl0jW1R+piTstnPLFmC3mg/OtfxFyJlO8xSPCpSlwzQb
 JN6AYn3gYPk3oxtcXAAJSUjw4SNYHmWTWjGFMWzF9zQYnzTX07yfDQr8m7XISAQ52RZBWpx7V
 uq3EWufKOZczBoPmsBMD/zIVH19IFuFBrJHo4rXlvT3yvTUXxIZm+8BJhVF9ckVSkGhZlnjVZ
 ZFB/EEkzLNXjFua8s/ZAzzR596TrxJqDwAgmjNtQ3rPvRcF7qHT1qBns0KUDm6Oj3HEUr3ogB
 tP9W9L7s4+QvtR1Dr7hg16awRVAqw2ri9ZCMOUWtswwj8fQX3UDcYPFNs7/+u/xcdxBSf/+Fo
 43i/heobkkA2XeKdEsct2wRTKgxKExIwM7TisNEJ+4Kq7fnXpSw+o2oNIT7Qvy1btL/5XeNvP
 XrpKL/+3k5l45L+so3O5z8k0bK+rRlhVFvzY6rb7gF/LNY6C7KY8TBpZ9Pc9VL+W99ZTmIO1+
 19uDiwObNyUHgktdjIMG3MNF2XXPan2p+Cm07sz/i5U2m/BrXi1Ho2jwdu1afjgWUWFkvUsj9
 jynWrIn5A25EO8=
Subject: [Buildroot] [PATCH v1 10/12] package/gstreamer1-editing-services:
 bump version to 1.18.6
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index daaf729c70..e29dc112ce 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.5.tar.xz.sha256sum
-sha256  8af4a8394d051f3e18280686db49a6efaccc95c0c59a17f0f564e32000590df5  gst-editing-services-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.6.tar.xz.sha256sum
+sha256  fe10d14ef896aa21038317f6f81e1158ccc6caaed9b0d5a29ae5bdd63074582c  gst-editing-services-1.18.6.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index d3de79c5f6..a3722cbbca 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.5
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.6
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
