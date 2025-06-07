Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72584C61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 17:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3996481A27;
	Sat,  7 Jun 2025 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RIZ09u8gVha; Sat,  7 Jun 2025 17:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FEC81749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FEC81749;
	Sat,  7 Jun 2025 17:10:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6BD1A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C9B40510
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8c0wRDkXlhT for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 17:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0C894051D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C894051D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0C894051D
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.120.224]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOA3P-1uD9PG2FTd-00P7wy; Sat, 07
 Jun 2025 19:09:55 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  7 Jun 2025 19:09:35 +0200
Message-ID: <20250607170936.1502446-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607170936.1502446-1-fiona.klute@gmx.de>
References: <20250607170936.1502446-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:I9P/O7fhGmgBrbG3v2U6rlgQXTtz+5V90gkDu6ruDF40UUpziG8
 L2JIVxfS95axyR/ZkcEZmfUIRtGNasPwEFOUmeAO+Nzv4P68rQ/1EfxvFz33sANrgj/Dp8m
 3JPUuY3UyedU/Iid7svpm+CK3/eazxGOWu8bpHg5lctAM7Aqi0KidxphbBeULNzfW/I+T3m
 boQiuf1jtzugtdqOvk/8g==
UI-OutboundReport: notjunk:1;M01:P0:huCzPhmW32g=;o0GV6lEKSQoe2eSEKoFA2nIbrc+
 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
 8tQavfeOtXvIGt75
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749316195; x=1749920995; i=fiona.klute@gmx.de;
 bh=coevUl5iFeOH4fzwihcZKaSRQ4sLJGIbEeE9uGYuxdo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r7Ky39Rfz9Efj1KSpzo9P2EARQcP07HSg1j+0B/0Bt9mTIBSE0dgWo5sYVEcxFVA
 1dbZe/maCotJWXUo/nMMGMfz4RG622h6HcKDsyqWI0LTR29KoelxRtodgZU5Fyrwy
 OjAZdqfKcUvBWRyDgl0HhlaTzMCiudWeiDzpv6ZX/XG/FSovStDjdZPMTcqsp/zuS
 1V+OwYHrDfIGaV81o4dAFkAGbH/9a3PgvNdW0jJUCbG2g2wF5Bdq4/JEDuHihHOkA
 2SMPo6n0cy5WVYakydzY4hRj1OqLBRkWH4Vx1tD0BM1qhoHnrVbThMuwm3rIWxfsB
 3aPe04CjDDWmSXWbKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=r7Ky39Rf
Subject: [Buildroot] [PATCH 2/3] package/eudev: install hwdb.bin to
 libexecdir
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

The hwdb sources are always deleted from the rootfs image (see commit
07aa585aa6517eeb7f805b4d84a9667be4b3e259), so the resulting hwdb.bin
is installed package data, not user configuration. The name of the
"--usr" flag to "udevadm hwdb" may be confusing, but it chooses the
libexecdir location, whether that is in /usr or not.

Eudev checks both locations and prefers the one in /etc if it exists,
so overriding the configuration in an installed system is possible as
before, with the advantage that /etc/udev/hwdb.bin (if any) can be
deleted to restore defaults.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 99c9f0dcab..e9884f52d5 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -82,7 +82,7 @@ define HOST_EUDEV_INSTALL_CMDS
 endef
 
 define HOST_EUDEV_BUILD_HWDB
-	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+	$(HOST_DIR)/bin/udevadm hwdb --update --usr --root $(TARGET_DIR)
 endef
 HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
