Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D810E77180
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D6C80F30;
	Tue, 10 Dec 2024 16:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTvQ7HhFpQEz; Tue, 10 Dec 2024 16:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC7A80F3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC7A80F3E;
	Tue, 10 Dec 2024 16:23:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4C9A6F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D6F403CB
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iabUgBtq_SoN for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 16:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCB22403B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB22403B9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCB22403B9
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.199]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1tylTa1DEW-00nv8u; Tue, 10
 Dec 2024 17:23:02 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2024 17:22:40 +0100
Message-ID: <20241210162243.1541113-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210162243.1541113-1-fiona.klute@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sHtIUDysgBR5lW3zUlgvnqHUiO4kbpfc4dEOtjoNNQfpTHFaTqb
 ubYvhX647w1N/nGtNdjooHXl3/nsnsiFIStTuPKrioNYrNBKCMRd97FaHrsMiKDjQRLGz72
 6ieL4N0LgRdfmUsyI5PsxkJNBn66jZjU9aW4VosHapojYt2C6XuQi8SVF5G/P8QKgOSFyYL
 IxsKzZkycaYK0JUq+LeJA==
UI-OutboundReport: notjunk:1;M01:P0:JOHILkFZkPs=;YePDLjxXm+Omg1B8Qnv2m/UIRwF
 BEP9W4swQOn6pV42DmzJCi8Yp4rHnSIcYCflG8gx1LQUm4wZj/Mfm8HvNwjlJmBP4pc9h00vP
 N6i+FcTANAVOsPKURlNRjnWtYSkYX1bURbM67HWToPSbwiSW6FnGBiLJZ2psXHlpMYwrUT0UG
 mIlQBR1nJV6aBuuXKDuJkeqby7V0OSQigJFm0Pv7mjOL4SFu7hMX1GpDhOU3Utsltk2d7ayQB
 HOCI51q7UFvvLAFLynu28zsi8tbv1/8suVkZH4c5FrT7VRTEpwaptVyHXvtTv+NrU6ZbgkoW8
 cFjrVCbV13NozkJs/Xw7g7UYcteJFvAbNwmPo79xw1L80PmBDZofrY6adAW2nKYHSj85hBYdL
 LZ9aiaDQbIuZniKRfp153PTL9nwomBtSZzbrdaRhyyK6vSpxkKL2JjLXPn4q2iSxKEp+ITzCl
 oHJQMSJrF23Q/Gcy0rVAmmMAq7hd+pnQjbNiffRcQ31BVAxxO6QE74wu0EWAadRi6ekettirz
 VDETfWGmTOzO6yk0UmSLHRMLWsNpw0mxUpvU7dgxefmMuegKCZW4g+Bhkj3lWPIeuUJQrHNyI
 FeLY8jNZqkZDltPvjKF/GldE0ViCufTzHc1Ck+H1nkZP6gLC2qbcssvJnS2l9rV95XiCgTw7m
 +cCrOhywKHQMkLMtTxO16ffOb4oWPYUc3qmW7LpiW6lY2crWscj68wjisgqMPlwFssqyonfaK
 Atxf70Pajbm9UFD630p6jSpsCS2Q0WHb91FF7v7p+O8ztEklzlhoUfL5w1svLfUfm8dhy2ZVf
 g0k1Hdl/EE8TY0DpE6qH+n4/0TnzQ274AT3ApL/77aR2AM+oY4Loe+ljLskd44r3U2pM91892
 cOYMnoJys0ij8KCk3JR9MWCa7iCIWxzQsDcVoYWR8GpMhmpmNRiydfNeB5KqLmLDyRGDth0FJ
 sFHfVNoHNnkZAPt7Y+2O9wUVj+Z2CFmVFVVuEk3311wTSdHEUDwY86bA2xkJ5S9oxlrElc1w1
 IY6YER/erjEcWnSxvSktmiblC322l3NNgorAd3pEvLuprB847JxLJKXUDsZ/js3zUYxH6kZx1
 ZkSStxkLumhk6R+3UILwVpCeuU+D3I
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733847782; x=1734452582; i=fiona.klute@gmx.de;
 bh=GU+3igM4oNFrKipAv3tDOeyzVqg2N/xXho6LI+K0qTw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=H1WPPq/zuNwGbqDa2PwLN1rjloRW9T3thCnZXEHfs0vaNWKP6lJYXUuuAOxPU5SI
 8hiWVlOh+S6w6klUqWo3rvi+Icz4/wwBUw4KpqD95pbwIULfAG0/bKutsC203BPQp
 D8hFKw/+bHD0Y4uE+TtxhQg+zyB00jaWuoaEo1Edz5L3qgeX9e40U8tL5+LEDzXbO
 vwxDQF5ZI04pnCyZ1vhFZfXUMA2jt0MdJVyRaQvqmaz2Lzo+QLA0ilshyxWvlbOeN
 qhKL1/89l8+t3szZ6Qvt0QSDQPhhto0h+6ITpIefebNdT4NoZqghQgdlvRnqrDM0P
 Die9xXFs2Bv7DiTZtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=H1WPPq/z
Subject: [Buildroot] [PATCH v2 2/4] package/bluez5_utils: fix dbusconfdir
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/bluez5_utils/bluez5_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1695aeb210..7725fb94bf 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--with-dbusconfdir=/etc
+	--with-dbusconfdir=/usr/share
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-obex
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
