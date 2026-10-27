Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BD606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PZpmG3IO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=G6OdruLY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2DE607E6;
	Tue, 27 Oct 2026 16:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubKxDQ6ah2ee; Tue, 27 Oct 2026 16:40:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F89A607D3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119241;
	b=CfTBZZFGsnCbEY4Rb/+C7bAWA79gO/4XnDZD/GugVlo4Lvz5ldJeL+G2RsglX4t90W2P
	 xYBp56QFSQU5r5bhrMZsl5OJaKTUeCQJgugFEkshYZ+MEareQ7nlZe05wkZ2k4zXaCbS2
	 Fn+VTIfyjI+Yb9iVSyJ/+UB29WuRsaNamU2qsRhkp276w8bz1+EwIcho5rdn+UGbnfWMD
	 g8N79p+a8cHIZq74u/ouJzuIJ6UH2ueMPHwk+rP4G/m9eLrzcDeReHPU/a+VzwvivNl3X
	 +cWL7cxnha3VNGZa4fVdNa1v+CUtX3gImJGpOPcSHD/7tQasN8+MpzsVDmTNo1PgITQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0YCdEyJ6WqHRDofLuIqM0fDvcKVVX7WoaM/8KDax990=;
	b=fhL1B3iwSg/WSNSEHmSMVCr1iYZA4wril/LulZz86kxdkPavvPXK++i9c0umV/YiDyr/
	 50BySIaSoSX0507WFHhRyD3ElCK2LuBxF9qM7NBoijS6b7naoBqD5FEv8QGFVZLXN1K7w
	 YbJAGqleBBWm8clgi56w7c/S9rePSm84hrZTetELrpGtCacVyDs+CswIqZE/9jMEB4QVN
	 zYN+pKvR6gp97xJSqJIY4o2qBrI45AFA+SGuMx1sAciaq+x1nYu9KbetkqnIH4EXua+Q9
	 Tq3/ExkV0kt3XyAlBNybKYjyEDHLdjxW2kuGnbWks+EmMcm/NciKTCo4FK0tYZs79mA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119241;
	bh=0YCdEyJ6WqHRDofLuIqM0fDvcKVVX7WoaM/8KDax990=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PZpmG3IOR1v/EwpQANEgvczPUZq/+VZIlBHsA4LosnJCrXsRwLoJjgwWugef6cowa
	 gqL7GMxEv9VcF+Jb0dtXXQl25pXmvj2NBYPIubVzlCvueovqxxJTyc18EKiYJ/JYXA
	 TdZ3lHNa6I4xaKsgFIyrE/HjTH8vsNKvJyC6IuNVXfo2wlb1QP30F4Rc07Na7090YV
	 XOJWL47/Bqug3aIustg6ezP/Hv5/reK/uFUrDb4TYWoVSfjOMXmhu7+VrhU8V9x/x1
	 ubqEOGn+XbCT1BUyjocWZ8OjpXdIQqYLgWzoqVyCMtL7BCU8rtrf+gQlGaFAgPV6/4
	 2NgfS8ftyKRxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F89A607D3;
	Tue, 27 Oct 2026 16:40:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8827B91
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AF5F40024
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IK9A6NzBiQFc for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A2640400E9
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119227;
 b=DXM3EY6nxf5rN9rom3ywAyS3SvlR5AeJPuGoPZFpR25P4JVqILuaQFuJAvaof+vJCrk4
 jxhzt74llpn8hpkTbYLL867tJJj/54aT2AXciIcgNPmcFJdQNhwctFic6kRcgrXqsgfoz
 jrVipi+fJDm8AYFlBtVgwwo9nRsj6pHHHs56rQmFNAdV0e975EXV+/cIOK4uXpofZfQch
 ER0B6n4+MGVN2jqMxx4o5Zx8J1/y01PsN0w3VhS0CYEjevwZSQySvi0qYIFviy2yzbChZ
 QCciaVrwHpBDB39TKOyehxYJeFuoGXbMyuf2DZjRGK/39ntzn3E5ZuvHlJAaAKT6dOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119227;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Nztr7leEOdsdm+DQ8JPc1z2M6qZRsHYXNwY3rYQvW9U=;
 b=spPFtdGJmgF3ctMU5NtGaJAvYZbb4xihC6Nt6dP1ShQ5DvavcPOdcsa9fpHSIkBUTARH
 H0Tul7EdDpaIPPk9gtW7xJMmJlQxdd7i18lrvGRDWeKv3qm2aX8QWy1GzYA2Toh3Q+CKn
 kZSlCnPE9GiD/xhvCKQrlAiytAQ2APTWfXPWHWyLQLp1gxebgO+O0UCM1MS2cp31eWjmK
 HpsKSvIs7mfSqU33rT47ifMiVsSdHjMQ4HKxw1CPGfWPBtuLtwccMz1wrY2XMoL7HlTEN
 oOr5ZKAXEYS7t0xR8G15h+/oQTbjnMB4Mh6l6xgnk4Qe17BunWkJLRPZGdUc5j/Triw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=G6OdruLY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=G6OdruLY
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2640400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b1b34ed603so17437a12.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119223; x=1793724023;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nztr7leEOdsdm+DQ8JPc1z2M6qZRsHYXNwY3rYQvW9U=;
 b=G6OdruLY2jMuz/bmXxhs8KL9gf0DoquWZAVxqqQWHfCPLoAexumngkx8bkxEbgQG9k
 Mg/JfKBivtxXM7t7KS+F6sTr3UiMWT9F3E+pCQUZGcga2c9NsD/HGo0LbHL8hwgJn33i
 3AucSytLowQcF0ETLoDj+c4TFmOj9kcFUQTng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119223; x=1793724023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Nztr7leEOdsdm+DQ8JPc1z2M6qZRsHYXNwY3rYQvW9U=;
 b=uXPrheX7SUst/hpEmwWTdETOIgnplfbgwbJuCy9DXMxQr6DZQEE5AXe+V8Xrox1/ZR
 jGlWYq73kLMo0gFSmIbTqZ4PUyasMB9mvpJTgQc3LRPFlVdaODkUJmTVi3RrFE8ai3Rs
 WbhseC2E2zlrA/C8jWyG1FzCcx8MD8VC7qOtHI7MXyRISkPW0wGfvT4XcvdRLFHvVa2x
 lypFHoZsSKpQRAAioVtbWGmVtMkhZ8ueY6MvZDT9a+3qnMHcAV0NubsvSbwD0saHGHD3
 Wkydvgj7Lv//+VXVjUPHms0KykS8OorgGSJj67K5ilUaa/JAE/nqI5LaLnuO6ME3JPtp
 nmJw==
X-Gm-Message-State: AFq9FYIYi8PDUzfTGeUsFMdF1ipjy438vupkGYj53Q6hZ+rgrINxQR+G
 LlENKSFBQFg/9ScY2AY4KHCYbc1Lh4npufuIpNF/ZSBmIJq3schx2GDDFkbVG9I/HrlvVTHgYOi
 cIZI+ufk=
X-Gm-Gg: AYBFou2ThNfw/+eaongnoDwtOwWGNrz9EW2SbIiBgLX3khVX7XZVRERVjtk+iU16hPG
 PXGDEHyqasTVv8IljXoMSKO80PNEdXKhge8amAgMIlDT2ERi8I/esrb+G3vk8M5NXw3ZJQjjSKR
 wQTQbwMXrZ11g6iN1ebKlWb5O6jxw6pOUGDRZjltfOeRY1SlzLWeHxyOLoUEQoAIzPamM4BnvaB
 PV9AZXjLbADpeEMno95L49kjVIrmL9EYWJLnVIuPLHHkEpIz0EsPDu0jr9enkgQviEawCjq/dVn
 LAqQZWktQOjpn2pPCMb08yJG2yEeN7QD0t7TLwWHKLNUTdo5E6ipN84BaZIyCPb/DYp5ypzmGA0
 sa+vSG+Mkgy7Kl+cPCofltv0p/nl938XjASAMUnNMXkuUyuVOr+niN8dkakODgmiyzHy4iLLBO2
 5z2JytfU9FpRfDUNoyxk0VkwBtXNNjOlgHmmLJidagr+7T/bYdZSBNq1xDU6CnKbx/Gudb0Xh2D
 8ADUjJF8Sf/ZZRS3aqI9VdrYelKslYdmE5QBdeF0R1T10lhzhKNh2Jb4lHdEOZfRny8UtvxlMGK
 OqENZO6IJ5BQ2KbGGjrtKHw5eG0ibzsA6VzoKJif81qH+jkxoon7rBe59+VPfs6O3QmX/6CLMec
 x/Tez4ksKHWzw18d+yJijzHg7c11RjsybiDnB7LWmmwhu05HhAz00ISOMs5pp4g==
X-Received: by 2002:a17:906:ecb8:b0:c49:9a88:75f6 with SMTP id
 a640c23a62f3a-c499a887aaemr485957966b.2.1793119223381; 
 Tue, 27 Oct 2026 09:40:23 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:07 +0100
Message-ID: <20261027164013.1602502-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 10/14] board/mender/x86_64/post-image-efi.sh:
 do not prepend artifact name to mender image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Do not prepend ${COMPATIBLE_TYPES} to the user-specified artifact
name. Especially since compatible types can be added multiple times
to mender-artifact.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-image-efi.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a1dccb25b3..5f0b5a83ec 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
         -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
