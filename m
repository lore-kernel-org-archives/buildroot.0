Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5963DC79FA1
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 21:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D451B60728;
	Tue,  8 Sep 2026 21:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7whQEzzxUcP; Tue,  8 Sep 2026 21:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C818606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788901260;
	b=PLYKEzqrSH1GdZjQyYE7tyMZ5h+s/3vsrb+eMtmAt8lSGunAlgfbaEhABl5xS5rCuXqr
	 ZKhqM8WxaeMRbh8viqlJSgJYsmEjz2Rk5L6qnAUdvMt8wyoKug3lMaBBGPK6owdnDGbAA
	 D6m8890VjECTixebMci/03MEmAkOmfFiJrmWdWCB4oJVmOssGrblunATyDH4M9LWrAjVP
	 EIVdaX7Sw2l+2FEmgDPHAp1iC7kLxKRUQUSYQpTP8pepP9JFOBSsgIRFCSXQnsF1ODxqL
	 2fhYuEEVs6W/4r6BPsstwwgEjNc8g7JnjRe8tifHARp7szYHpZ3mP+iK0faZA4sfXtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788901260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=00d5vqHJr5fS1denr9G+Zgqtn94LRaxl58FYOJEFbo0=;
	b=jB09OonglU7CXMU5KLSd9+FpsMoHtiSQw9IkVx/Ry/xxQvIJQODTuN6937VcdJbyrbKU
	 1uRrTwXg/UPwrb1DacEK97K03Y21ZYkA23fxVSG1QKQV/yu801XixjGkrG2YZSIpwDVSa
	 Uetqf0vj0vuUYG2sEy3IsFvNR57KFFXa02+55sykcVyExrK0Dh4XAi0qj81JUIUa51Aei
	 P2bTY+VSNXfnn0DAdQXFuxcoonRS0lrW72SNqx1H3tXWkR3Hu1q8RCLnfWnt/FuPlZ3ST
	 fiXUJH6Y8PXdVMBzjZFzjgvSOtjwSMsQd2ZugXBcR2tdCPHmRoakXb2thWhmFX90sRw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788901260;
	bh=00d5vqHJr5fS1denr9G+Zgqtn94LRaxl58FYOJEFbo0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OsZf7CIu6vUlh7ukDgPfea2pYfJP3jIapnt8oLc4EJ9m2qhcsXKI7PCBUZ8ZNDd0o
	 9xbFVTcb6yduNP3xbaWkmM6SYMMJd72LyxkVcRNXJHR/hOQoxN0MCzH4tc8RvdfRw8
	 qhlRJOtS5m3ZdXkZrX0pQyRXuR0dMYKN5MPRMvbejS8cvu+1af/Rbnzc0cLBpQINht
	 MP4fU9hZ29/wb4Db94vJzoWsBLx1ZuAhAHswXr/K8OqbHbxvOolG/JwBrDKNHQevuO
	 lw8v2CC59ckDa3nRztdiWzi5wL6mGS7wgWwK2rzzHah9N6/YqSoOxJX36/tXSpGiVI
	 oFk7xcyMPbkOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C818606F8;
	Tue,  8 Sep 2026 21:01:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C8F74CC
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B12440651
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiqqd2AR5Q9N for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 21:00:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E899C4064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788901258;
 b=fwZv/VUYMLjXHoiXDYacb0/5ZiTkEpyAGu1fewYUUNkv/qFg3OYfSWPr2g6vmq8NBHCC
 ool6XULoFsB8pcZH9vMD60ljwUVrUmJIy6aCyQYOZZdgrwLrb2AJ4XVY6ar/DeAE4BEyb
 EBmyxRr6rmXT3sBXzznV5iPo/vcyVeG+UnOPd7atIdKGzRFkIdmZRMZnjTpJNTTKrF+/n
 xdrSJd8WTSqcSJTTVd5H5c6ye84MOS6sUiTSeIdydPMtRkGxXydpBN6/xqOxNZudpC2oH
 hJIsDfMdj6CSaVSs7F8I0QU5SiFaLzr3rGTFMYwkov1y20leH2reoD/AdaWr3GIB2Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788901258;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=5RQqMhM9r3r2kMz2hhtA32Htch/QpxgszmyCgs7xCAo=;
 b=QE7jBLuXgEnJnaWXGlK7/F+vXnjFenoRj1lvaBStqOOZbGfi8aEkSuWCJB6UNK4E9i3M
 8L0p+zTGvscXEBSmYTqLKqfJ6zoGgOMnjZUQ6sv0Z6lELSflgO8BkP7pnda+B4JWr44Lg
 QK+N9i2U2/wHi/gK3rdHSt0fuN/yeJuEfUBT+9o9BRwV26WHHFPbstNeszUxXz9+qrqnH
 oGeLQXitDynyMoQ7/4bCgzM18aqOIgaKJGP1JZWyPezfMhH87V0hH1cJe1meZIQMvk8aA
 i3WA6v8DHJon01JIz2Q+oTqbjBwtEZUuEyYrQYSoC4OKZG0ROsnbnyfB7+4RcrPIw9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FzpNVc+q; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E899C4064E
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:00:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 738321A1A4E
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:00:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4919D6031F;
 Tue,  8 Sep 2026 21:00:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50FB211C7AAE3; 
 Tue,  8 Sep 2026 23:00:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  8 Sep 2026 23:00:48 +0200
Message-ID: <20260908210051.436241-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] support/scripts/gen-bootlin-toolchains: fix
 ARMv7 EABIhf toolchains condition
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
selected, even when EABI is used due to how the condition is
constructed. This obviously fails as those toolchains are EABIhf,
causing the following build issue:

Incorrect ABI setting: EABI selected, but toolchain is incompatible

This is for example what happens with:

BR2_arm=y
BR2_cortex_a32=y
BR2_ARM_EABI=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y

In order to address this, we adjust the script generating the Bootlin
toolchain package so that EABIhf is required for both ARMv7 and
ARMv8.

Please note that we already require BR2_arm for those toolchains, so
we are *only* talking about ARMv8 cores being used in 32-bit mode.

This will be needed to fix:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4579949d18..ee64a86902 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -53,12 +53,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
