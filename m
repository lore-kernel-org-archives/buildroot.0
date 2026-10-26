Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C649606A31D
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=el3iiH/E
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9422080E46;
	Mon, 26 Oct 2026 11:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPoGNXvTojD5; Mon, 26 Oct 2026 11:40:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C2AF380E26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793014823;
	b=VMxFYj9Zq9m9oBhjg9BIgLEwRutGf6GdSdB6VqaJ30Ju/NeiXWslrs83coYcerIea6rq
	 7QOXBpPNTqzqPHMhG4Pb2o9xMwVXexYYe2BuZuOSIL9JWnX7Zhl7pTc5clM5C4kJhYEKm
	 TJpAg6pFTnrEcp/ZiDm0e9B131SIaA3qINZtHs+j4WkNNK6BI0cgeY1qg3UDT/R9mb3JJ
	 yz4WPEhhy1E/A2JHgiG8FPQGUTycOGRTgwQ1s3KgNPeJnAQV99y1sIR7SAzIjUQ6fAiHO
	 wpi9cSVeXDoBXpoddFqKxXEV2Y5ZBIUlswBNAGkcJnJLWrEAvviojZyV/Eo/GFvKjkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793014823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MIGwJ04x6TZAo0aAyUokFVLaQ8g26VrXd91d7w8k4Kc=;
	b=gl4jC6ZXLTcISwLjclQp/otXOv8J0r3XZIPvyO3nu5Cc54T0fJcrF2ToYI+vNhsfQI8i
	 nRH7WmJw3Ka6fSZqpMwRNQAPh3PwwQd1MPk6oRkpeMJh/KM71zIyUMGd+wBPqlq0Pub05
	 gqRVDuVwFXqmSEdS7qOD8k5aC+fWqMRSTLD3YRCa3z2jhvnl0OAdoi8o8YB7oHd6CeG8F
	 Li03D4PVd2Sk2k66OL66RGvzqozmW3bpXCvSGQn7+PBMvVneh+mUVBeg4a+tpoEq2C0UA
	 ZGko2QQaREEKhqKwV6+P+qrBxD2qAb2gU23h1Xjdpw1VEJT8R7TtN0g+OnffCqoFFgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793014823;
	bh=MIGwJ04x6TZAo0aAyUokFVLaQ8g26VrXd91d7w8k4Kc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=el3iiH/EZaXC+pSMJierUi7qC6c0etJwtbeJ7ZHJFa2tVxHgp4mvc7JkIsXCoeMF4
	 ypKDVoT1tFR9XGtNAWAn9I+pGGcDalE0a91x9pULZHypEqVPtyISqZYZ6h6ssmswdK
	 4zRodYSIwi9DtAILC9M5wZ2l+Jo93ggUs314GKoFrEZ/A8hkbVYDXG6WtXgEzkpOfB
	 STH8cspZuJc8UeiYRh2qvzwxpRH6BwKfJEOEK5VqGsgigTqLgx4tLVv6oYcCYnchr7
	 6yhiLOnRmAJBDYVxcENU4E2UNTvbeb4RFnnPTgDF5xDaAEZrT12GyTBW6gzm4qMsVH
	 xErwv4com8Ubg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2AF380E26;
	Mon, 26 Oct 2026 11:40:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8542143
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B02760641
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yurmf0W3K1nb for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 11:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 51F92605EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793014821;
 b=JlTR2PvCjoqkZYnqM8AW22Zrd4Dnj+mPirPb/3EOkyIqbKVRYyvy0vM9kkCFnmM9fkSC
 ujvB37CFpUwCAXmLM5TXsrQlKUD0yFvqDU7L1oBRgBl/Kr8kEoKmUked6H0/Lb1/YAT3g
 gGYWCYy3SBT6LK5AhviWJy9rV1lodIyVVHzCwwazPNdYQplBNUwJvU8Bd5ObsV3r91a41
 hcnXB3YbRA8eQT8KpxflXQgJ4BNrn+e7KZ45qqP4HdBeNdcDuf+SXHMspgB7eh2nHgM1R
 K91q3u0dQX05d/kf84onAGFbidjZfAdL+6p30oQ/fVqzhepyvicnStEKuAlwOYBKZSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793014821;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=a/uDXOoSw991p9Wg0rHAp8WZJm6hVQkD0MlqOy0ttAU=;
 b=HKnartU0sMNhfB+AwpIatcHuYwz8tBL0j5u4K6n3q5jOHjEfdAyBnWfZs/odEowBL4yk
 HFvu5kJN7z+mkHP1mXvpnsfXGSh3TcfpuiSfaA8dXAeAD52tkBE6kwdbJjQ6+yw5MN6ma
 l25Ma6CeC7t9eZvsBKluXptqmXoIPxW2NC9+VQyN1e8+DhZN5pguy+K8/ne2LZd1EbgmX
 I8rC28elwauMqbx43nFK7QfbRv9qxxyGLCZG+cUgXedUEKbo3Q4J1WxHaO0+6tTBMIwY7
 0/7Qz/aMUgibMXn7GW4ELBEnOQBrkpGkdWEk9zFI8vT11ulACjKz66FEbaf1a11vyPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=QpO9x4vS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F92605EA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:40:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c498e2d623bso90750666b.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793014819; x=1793619619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a/uDXOoSw991p9Wg0rHAp8WZJm6hVQkD0MlqOy0ttAU=;
 b=nrPM7GDICgNdHl4MsyDexwn5DmJT8cwMqRwKBPB/6ROx3chdun9/n3IOP2iuycyW2i
 2eJMBnkxqP3HHws2Z1rS2XW8fKBW2eRpXdObgSZ2Fv6VaNWN2tBY2ZyWoA4JCPN/t7Ve
 a6pGKMQbwof/0FSDm1CEl0MO+eZNRHAL+8FhChZIvRvJP80UsJ2pOgJy1QfeXTFIn/z/
 flg5P3TeQYZNdWPVi6/Q432VG/S+/FEEULKrwHm69/AR120OoagmJ+rzGA99/kE1vM9x
 kxPBV3urRkYCxDOJ63nE0EG+B9YU+UfTjTHbhB19YbsFP7KZb6s8PTMHQNRdf4jv1EHy
 ldxA==
X-Gm-Message-State: AFq9FYJTzvr5akbDhy2uQQ9fRzDr6550PYmVwucBMRE0UfbLwOjcL06d
 SOl1ly0JPlqJg3kpgIPkU5W4kiIRoqaGklonjZwhUvUPZPm5nJSQt/NZYAzCkA==
X-Gm-Gg: AYBFou34E+JKFg5ETq6wnwuVXXbIomcnzcXzZLqMOPM/+KHMEC2Qqh0QjJXzK5vbIiH
 DQyhq+3SqqvvFc7NDNSyzcVASpwL48uguC9RazdsLkjy0rn5ZywF80Z9WBo4t9v/vNAGFGGYLwK
 rvKPhlY1b7yW72OviIgs63uS437Wvj+oF3xNNbPtYM4RQ7NiuxXwdxop/sgdsluT8AY0Tws1/II
 Pp2+ZLmwoWBqdi5ftIKwZSFEnbPowhSJX9h+BCvDa6RAy+fOTWBGhyUboxipG5OMzJiDOW2vuyG
 sqbfGUcXcHtc0Hp7lWACzAZlmgzzUIEiMSrTzIyfaoGCqWaKrcGutDM2dXZvobZf4JzNGR6FnVm
 qNKNKVlOIHi0qVu9HxkpN9aq7+k+WDKzZnIxjs1zn9qNCHtU0/bVlFM1sO3HyD6QOzPxb0238fT
 Pn/FH/rCHsS26kwexzxAP5aJ8k4SozSBT+CCAJTJQy0TMtqjcUigftyxcSEFj8DghJrR8UHZDCq
 m1GsF1IGrZqj+zt+brlec+MyDOnJLS9kyL/ez3F+8qAVk88rqv/uE/PAZ9dYWkYij64Zb7l02OA
 e+XXhXbVo3jEsaTYwJS7kDaYy1mkOgS08ZA=
X-Received: by 2002:a17:907:3f1e:b0:c32:9a87:3f13 with SMTP id
 a640c23a62f3a-c46bdd97afdmr766301866b.8.1793014818867; 
 Mon, 26 Oct 2026 04:40:18 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4e99a2sm310516966b.24.2026.10.26.04.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 04:40:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 12:40:17 +0100
Message-Id: <20261026114017.1124466-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libxmlb: bump version to 0.3.29
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.28
https://github.com/hughsie/libxmlb/releases/tag/0.3.29

These releases bring query speedups and fixes for reloading a silo.

The zstd option no longer accepts the deprecated true/false values,
but we already use enabled/disabled.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libxmlb/libxmlb.hash | 4 ++--
 package/libxmlb/libxmlb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index a7a0c53be1..7d18c22fa4 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,4 +1,4 @@
-# From https://github.com/hughsie/libxmlb/releases/tag/0.3.27
-sha256  63fa0275f7454d77c10e0af37f79dfdb071821caf429a57dbd9598ea3a9defd6  libxmlb-0.3.27.tar.xz
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.29
+sha256  448294be33bfae62f00fa66e506f1cae80237ce71b7ab6530aefa75005eeb08a  libxmlb-0.3.29.tar.xz
 # Locally computed:
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index e9829e4c4b..8384876ecd 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.27
+LIBXMLB_VERSION = 0.3.29
 LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
 LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
