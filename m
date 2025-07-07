Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADFFC8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99099613F2;
	Mon,  7 Jul 2025 14:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_iZLeqr-wWC; Mon,  7 Jul 2025 14:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9246140D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9246140D;
	Mon,  7 Jul 2025 14:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C112E12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B1E8211C
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zTAFSXK28tE for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A227581FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A227581FA1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A227581FA1
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMfc-1uVUlA1Xue-008JwR; Mon, 07
 Jul 2025 16:11:04 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  7 Jul 2025 16:10:51 +0200
Message-ID: <20250707141052.280200-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707141052.280200-1-fiona.klute@gmx.de>
References: <20250707141052.280200-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GLEOeHQShZhS7alA2NPBHN0rWWPvHHA+HnttO+KPszb1x8JudAz
 0LoG+/VGLM7JCg/Ufmkd4Y2pGV1a2GMDvnKOyJXzSIr6SyIXMmU8ymTY6OEnNAcW7rseY6a
 WkEOulNkfJjSVsXtKp/ouB3UNv/1FMTFBcTq07UAe3R3ZrKsxuNUHXazgysOftQm0WItJad
 VjIhqlIHfvnai5nD/cBhA==
UI-OutboundReport: notjunk:1;M01:P0:FDkErg6N4v8=;fWKJB00SrS/wbZYu0R1y/UBzJTL
 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
 7nEezn+HyuX2y4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751897464; x=1752502264; i=fiona.klute@gmx.de;
 bh=ioV/bZWL6QzX4+5Mm6VIV+YIRqAiB+nQ+AGQt/LMc/k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CNQaxnqcppaMc/dzRlTo5K3oWVrqVzjXSveXQzLy9Q1wMfleP0yNWOzYyLhh0CVc
 d6zd9+l19Vp/vkeMRW+OSBL/t43eWpxbF5Fea+lGnUlYe0SHCGekGylyPE9KIjWPi
 MwtHBSxMe2SBOwoJssfcqhmWiW6mbXozBJxZiRePB9IEOfchYkclaoU5G87E9onxN
 JJY/7mwPmVdcVRV81bnOdt/8jUG37aznAyeILjT6U/N2Pr7QAoaPPXq8F6xfI+ZSq
 078kTCX0MFKkF+FbW2PK8EI5ZMilxmQvgQLVMF/8Ql1J1M+jwKHDhHf6LvLY74k5+
 4oADZ7I1SrE3I9tqgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CNQaxnqc
Subject: [Buildroot] [PATCH 2/3] package/tpm2-abrmd: install D-Bus policy to
 /usr/share, not /etc
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

Default policies should go to /usr/share, /etc should be used to
override them locally if needed.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 2bb0ebbbb5..a4e7645374 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -14,7 +14,8 @@ TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
 TPM2_ABRMD_CONF_OPTS = \
 	--disable-defaultflags \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
-	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
+	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no) \
+	--with-dbuspolicydir=/usr/share/dbus-1/system.d
 
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_ABRMD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
