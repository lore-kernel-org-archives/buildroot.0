Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE30606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JVZ7tLwA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hK0DYAGW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B8F6079D;
	Fri, 30 Oct 2026 11:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iioDIK9aS1Pm; Fri, 30 Oct 2026 11:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1A1C60667
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793359797;
	b=Qn5eM3UJS62p+buUASlav3zZ5iXjWz+dhOwrOqrS2ePl/Xl8Hj99jilKcZByhsUOhvnV
	 nilvLlohqaQdZ2J9X9eDIamKBlkNS4jVKJB/sBswSORDSPUI66LlcH5rB6AMSqEN7BnWR
	 GpDmKX53rO00l0yc56ddqzH4E0KoMrRQnj9uoEXnCXtDRRIBh9Vn5qEuRFMLV/3xTvFhL
	 LvLK6l/wBzBAW+qKeAt3eYzdEwtaXpI6y4rAA4JTTiDUOZIoOYFQRnce320cEqyvCXxPg
	 t/caJnUk1pWLykcLoRl+/avAoJldZro9cQnanix5SzTunJIjovNnzpJStulVz0eIByg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793359797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D8WRu5pwi3dBaBrn+YJaFYg1FnfAoxXmmV/GkDfHs9Y=;
	b=KlbuxpeF6FGnFGpSxuadrbvTeLG3WgOVtsg/6RC2GtRKCpEleNPT06W9mts4AOWCnqHe
	 APycNU/2Np2oERoQWcz52nIZn8lyQgKro34V0sSRqvsTtMvd72+ta6p4zmwFdWdOJ1HtV
	 rfsNRqKajQrh8RrQYb39wtBWaPfxBxVmIzkl96pLY4KaSm3rvVsuVAoHVf3W6CImO2UCR
	 81RJtHethyDmB8eWCABgkx5n90aJd33BsZrttFHd4+RQpUTb5sdEQJDOP/2m6c24dQfmI
	 6f6+Wn6f5yov4s/Tg0RczyL3J2/G0S4R3rPusNo/QLR3khzSxdocDECqlmBWmPWa54w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793359797;
	bh=D8WRu5pwi3dBaBrn+YJaFYg1FnfAoxXmmV/GkDfHs9Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JVZ7tLwADtUJbxqJDktcFyUdhyEr42QoG0643yeQnFQirJVDg6LkZKVyJAPexdmjC
	 uM0umYx9cwtIdYOOiaqsN2jW16WkVzjMOmWSD5AB+mVRKu4J0YSTE0HfaiSzIJP/ds
	 sboOGbEVztsnglbvPTwHGeSFbeKG0IINsnF9llQExpOXus1GZhsuIEHV1EGk4VwgLh
	 mQyLf0VbeAIySNncWoGlRvAF9RFWWjTG7NV1pQqt81shjctqdnY0UUB6Ak+xSdGy2v
	 St4sKpjVmcxh4HKpAMzJ/9WA73sYaCPCKCiO8awg3qnwel1pNm28XVX0deEkKZnHGj
	 1ke2/pOZyaWvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A1C60667;
	Fri, 30 Oct 2026 11:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 501541DE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D55E4066F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lib-mMgq_h1K for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC0EA4067A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793359795;
 b=clW5TGF9c8CKXOx+l+kU4DX8AvAhigUW2w/8nQHa9bZmB7JsUtUzsQL34uHbyV970ATZ
 v1k/jQ+lb7kXTzy3VpYuyxifG7hhuGf8cF6XP9NYnTUMSJmBEQGBo2ahEtj3fkWDAW7eR
 pNwhR/7eHmuKAfhej8XA1b0eZe8Lom5Zv8fvbXZ/gDR/J0332h9wYAdlta11ZQAbDR2HT
 ZoPErH94NAF2FOdHJU+DOwZ/pes4TFYIvP4BG4FkdW8Dy0V8VM+ydoeHpVdiK1Km9a3QH
 r0RhMtyLShiBudqCTz9Y3wn3GMduOdmwynPERanmuhFHXwFUBr2LedPngk+WzV7vWdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793359795;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=GkmRg3h6VpWB9K2OqmjDMXPgzclDiqzDwuy0K762aME=;
 b=tcUhHkoOtHLQ6g5jEmcCgUQgZ9oFzBlhQQ5ZzQLURYhIoApnY0MTSPz0hTzgZd+xSEc4
 OVgVUwNMuTkDFDzOJkkR4dZHjpceX+qoEXz0XagcoaKdfp4dunRhuOJOEvJ+tF0dgmiI6
 mf5emfFwgsSmNbnLeRxIPjjceAFZHggZxkoQ2hHH8LmC0BN+oxS+kYweG1h4830j/jZIC
 mTtHhfm2grhWNTgZd1mpy00dO1hPlJEwbx1YC2fheNPZ6400WpFUDvpJ3kmNBy0QJBkPx
 xxW8K5TRVFAK1XRMJrmT/z5EQ10P/4FpxAmq679T6aWIgxLZHF45EaPiOJoT1rTGxNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=baylibre.com;
 dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256
 header.s=google header.b=hK0DYAGW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=ddrake@baylibre.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com
 header.a=rsa-sha256 header.s=google header.b=hK0DYAGW
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC0EA4067A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:29:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so3974205e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1793359792; x=1793964592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GkmRg3h6VpWB9K2OqmjDMXPgzclDiqzDwuy0K762aME=;
 b=hK0DYAGWg/CraZ+qti0s/0PUhmK3IKxltbuUXEGOEDdiGQbJHV2zgUNNpPc8L0R2OD
 hABh3QT5+0wOvvSr7M1ptyoMUXnNFL/kmpzvSBymsRNXyiuTiFge8wBSvloGx8L9yWNN
 lV1i/481zqCsW3GYmd2fpfmdYsM90O17NROeS8r7aUC0yBoN3giqU85d60YeybfXdzJ5
 LaYqT652V+P+4T3TdG8VlEi/TRAAzGOVdsARMDzrk2hVUbzAgVoAOJiGuWrIfdkorRS4
 pgqIUND46Og0A/tERHZqewavJxbXjm4dC71ODCqgp3otxjT4s2RgB213LpmdQhN9nIvk
 Ztqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793359792; x=1793964592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GkmRg3h6VpWB9K2OqmjDMXPgzclDiqzDwuy0K762aME=;
 b=UHhQWhbnuhIRhKI7uL94u+JclxILBNUquea2mMPrpF+blzi8wBRW8bhlsdz4pONWOy
 Crqe9i1P+Iucr2mwj80m2lsGFEWDN0l/HT2ZbZEPTwjSF8rHXBo6p/k2RzF614i118pw
 LYtF07vyjBjAJosMXOHyzmcNmG8o9nkNYL1ElMLfTp7E8SuZZq66J9Ek+tLxeLFBLe9a
 i564KksEgjcvZWo3ANLOKg/41kWh31najTHH2V0274HgEGL3MeH5v3oNTbzViRbzsW7d
 j/bDAyn45GBWsu1FSILikuWd7XKKR8edw0nLSqCC5xkm3Kg0CFgGccvQjl8QwWq3NEKN
 V2fA==
X-Gm-Message-State: AFq9FYKbJKcm0F2wrlW1IkiO/MJz92guD11PdLPs3t4SO5ywqVKY6YuI
 K0U7K+1v92/HnJOca2kXCQ6i9pPZZ0DKenrBPVVn1/SUhItasVlDi4pvTkx+nW+pVl8DjA5gYZR
 Hw6pH2oM=
X-Gm-Gg: AYBFou3afWIPpJn2fUTcQ+gwAwubaw1Lr8522cLXfTqkTgWkgeg2YFp1i/gIs4CGAY4
 hPWGzf7POJ2QIBzyS04qSf2dMiqz5VjEPqHXTUjOCPz1sdThioL8Li9csa2/v96Rotbd8FHaVGk
 o9FzrHunFzMk49zbkYFMtDV7QS81jYm9im6dQoua7n1nVTW+PS3ykDsqP86Fl2ftEP0N1TNnV3C
 p07gW0bu2Fc4me1kbDMB2VqBQBE6jw4gwYwP0gQ0+35CNeE68UDWoPGUxDWTR52lUlcPvx6QWek
 DjSDNGeL8gqOts+fzqt7Y1cp0LSOhyNUhX+xVwQCErId7wxp+mUYIEtfdVdRs/h7CQ6ls4C9bVh
 /AxZmIMrBtG1Q2Z6zPGwRbDxEy1hsXr1JBEV9Rqn51x7qJbby4/1eXkbEpBu3HEIZVRzyzjHKkt
 t2UJiN2YWuwfJmW4c5odpt6z/G8YPtbB78GyhhXcq6mTzrpUNAzKY6jRnWGOsZmmMcGDrTzmFaz
 68MOhFLxLf7wMnrFWhVbAzYN/pD71OVx1jETvjDOFoAuIvCCUeyFRqtP8gFLDkKJIH+kQcJjV2t
 bEdt/DrKXYph8/l3aHdj6E1NMV0=
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id
 5b1f17b1804b1-4ac17191017mr40407455e9.8.1793359792179; 
 Fri, 30 Oct 2026 04:29:52 -0700 (PDT)
Received: from numbers ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09bcc967sm38172315e9.3.2026.10.30.04.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:29:51 -0700 (PDT)
From: Daniel Drake <ddrake@baylibre.com>
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 11:29:40 +0000
Message-ID: <20261030112940.45635-1-ddrake@baylibre.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx93frdm_defconfig: fix U-Boot build
 without host GnuTLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Daniel Drake <ddrake@baylibre.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mkeficapsule tool is enabled in the U-Boot config for this board,
which needs GnuTLS. If GnuTLS is not present on the build host, it fails
with:

  tools/mkeficapsule.c:20:10: fatal error: gnutls/gnutls.h: No such file or directory

Enable BR2_TARGET_UBOOT_NEEDS_GNUTLS, as the other i.MX93 defconfigs do.

Fixes: 638c9592cf ("configs/imx93frdm_defconfig: new defconfig")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 configs/imx93frdm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx93frdm_defconfig b/configs/imx93frdm_defconfig
index f5a5f973a0..e97eb28c02 100644
--- a/configs/imx93frdm_defconfig
+++ b/configs/imx93frdm_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_frdm"
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
