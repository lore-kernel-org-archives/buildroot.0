Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D684606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/MWP030
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBBD60AD5;
	Thu, 26 Nov 2026 19:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6Buu_bQtvbw; Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 608D660AA8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721109;
	b=iHQSlyGZ8zTKvzPLvV9lSOJEO2UF4/lgRZATz0ZJ33PBL7cDRRomfxYQkVk25m4fj6FP
	 2jL3Z7NPqT/CazmIBRhjNlkEnfvtce0Ve00xRJsCLX1ULZZmDsP86n0KGXlMUM9cMbHYu
	 M/yCzJhi0f2tRI2j9LctPUCYx1i1tOjbagZiaS0Sv/96ZTmfRPwnCTyY1P3rwMQFWFlmx
	 nFX0gF7Bs1vfXq0rBG3kZLSkpDojvrdawVdUGnScX+bAK4/ekOyY7wBCGYP3cE7IUZKj7
	 ku7MZvBPENTjf+LSFvCkjv51AA+P5U2k3lzafIhhGonDRnuanNKuGjXa/VgMQYB/R9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=hmhkNSHZWFAFocMXiG3qYa4faLJwSSh4nMGBhidjOjA=;
	b=PAz0SZc+C92kpLsliAsu/fyq9SFSu9xBvOLVwQhJo1E+Ms9R1VKiJX/BBwtrNM9psEDm
	 GpzrRn09Zm9fzu9Dqzqd81vygDN0cM2lMCvWYKKpvFfw88zeU3kq/6rR1HlkqJPCB9Ut1
	 5tYf2+895Qwoo65CQBip7bhhLRK77n61wBg+JROxnWNuA8KynVlcbKcrTKG94pmUFtI17
	 4B36sU2g1WGZ7V+t8g243yxWxsJPjckPi+2NLzJz8rFiGV0186tNoHAHZd351t5U5YCdK
	 T6Yf1iGHlRSwoR1YW7K1dHI7AVuYqHvjMXmyGico1r+vS0bAYFtTpfJoLXtNhF9KHtw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721109;
	bh=hmhkNSHZWFAFocMXiG3qYa4faLJwSSh4nMGBhidjOjA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a/MWP030RVd4Gffxm5JwCB7cRFG5IFPUH8K81pvzMajddMYJnXEV36OKhDiSuxm8Q
	 3iRBX6nOIzqkyvIEFx4OmR3lCb+E6JCjFzwlpmwQUZFjTZ40e0Dh4ya+hyGZC3ysmQ
	 Zzy9lIr/4NyY1/nXkLYhz3EVMhk0Q6fvBUN7pXn3HGqE1Dx5AEZCHCAeDRVY7/ql+g
	 Sz9Ec6gjkWTFtVGTxltnXuMZyiu/qlLUnd+qupzcI57LHLc57Pk/UAW2eVxtmzjtzG
	 lC85ljWiZjc39KZzt5cmpH4K9XO1wVTgFL6OrU4p1kMlis0BlKj0RuSRLBANlY4guJ
	 z78+jDy9VYzsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608D660AA8;
	Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B350F22B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F4960AD4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbwe90errKGr for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E67A60AA5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E67A60AA5
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:05 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721104; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:ntl9OC4wXfVe/YZ07LTcUyln5kDK
 Dc3SBNASl5tTbkH1F6PVnt+w6THe0UUltmsDLlL2XM/X2eilAkHibKrMB1qEOFzRYORVgkPPa44
 MimtY21W3B7QwcXXYrVKB5CktauSq1g1SezMgt9Hnwhk3Rrp4Pr5CHjou9VPZgiePC1LOU69eCZ
 QMqLCTQyS3n4B7pu28gIf9e+mR8jcHuiLYQ7/T6lnA39SoBPeRIrJw2nFlzwt4Hoc6tG5wopfnG
 HoWQhFJufArXgGme+Bk5OA8yNzHdaaLkePnkZG3Pnk8TRZaouQjE2LH/dHyhSaXfWDSPRlFUure
 mdZv41EHOySArA==;
Message-Instance: m=1; h=sha256: HoMlElR5KTAhmhb5p4gNueP/+wzeDPvu8wKRBNkFug4=:
 bUHCLkw0bttH6S1V+qzTGYXeGDgBfHiFoxXnUk3uyqA=, sha512:
 oRO1gLZzhGqxp7nMEX5SixWdAOy6OIWOx3dMU001lahrvX8T+tKy8wkm9vniod8WJ5+QXdymVFWFm2LdD2wqWA==:
 f58w4E2Y9tCf7/6mO1CQGjvTHZJ8JpSJvueaDpttvrJMAhZiMBhM+hdCJQE0dOEDSZmMSdm66DGwf8MR6eUXAQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbRs-1xjMg83lZW-002eL8; Thu, 26
 Nov 2026 20:24:59 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:32 +0100
Message-ID: <20261126192435.1826415-8-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bUfjTNchJOWw1w01Lm92FrxI874vEZl72bgOfFJ08CTSI/rYGq6
 A56MQSH6Wze59Q3iNQ96aID7fEPQx6doN9ftp0VNaaU3Z0XXdMyLryg3GO9AOaxizR+6Da3
 rvqcS7YLhs0mroW3kEI+S30yHIQzzbHuZfEML9//zEmQ1WkUVX2BYUJB/onkOiRi/ml0unN
 xRfykDNW8Kj5KEClh3FtA==
UI-OutboundReport: notjunk:1;M01:P0:66HOdPsXAfU=;bxubthT2yCDyCKAbn9LHYwZRVR9
 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
Subject: [Buildroot] [PATCH 07/10] fs/cpio: if using Dracut,
 provide target dracut-util
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Set DRACUT_RUNTIMEDIR to point to the install location of dracut-util
in STAGING_DIR.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index ce39e47d93..3ba9c0a1da 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -85,6 +85,7 @@ define ROOTFS_CPIO_CMD
 	)
 	export DRACUT_ARCH="$(ARCH)"
 	export DRACUT_INSTALL_PATH=$(BR2_SYSTEM_DEFAULT_PATH)
+	export DRACUT_RUNTIMEDIR=$(STAGING_DIR)/lib/dracut
 	$(if $(BR2_PACKAGE_BUSYBOX),export DRACUT_MODULE_BUSYBOX_LINKS="$$(cat $(BUSYBOX_DIR)/busybox.links)")
 	$(if $(BR2_PACKAGE_NETWORK_MANAGER),export NM_VERSION="$(NETWORK_MANAGER_VERSION)")
 	$(HOST_DIR)/bin/dracut \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
