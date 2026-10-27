Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3410606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N3fiix9+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fi3KoEMG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E97D40808;
	Tue, 27 Oct 2026 16:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1CVZAVCwrfe; Tue, 27 Oct 2026 16:40:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE1CF407FE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119242;
	b=kDiVpyDDaAzzvbALBq6jGn8O08tQdJMyzEuZ4nxw9lsJZk9N+8ZPkR9lEC0chP4z9rmD
	 ciCsznos/aX2os1OzdEuoOvLWAMlR+eXeVbfTGL9UBa/EEn4yQ/gaMyBL1Z7AFmic+Amj
	 taXIx7vFut8M/Gux3mFEOSkRudkfvDrzkz/y2QCp20dOmL19f8nmJlAOBPbz9Wlp58t2a
	 3Q6LR2Lfs4NEUH73P+SNaMJ4mFL8yQ/kLbLW+RsuvUVl9M0OA8G/vFn+rpFmsEoiQKfx1
	 3x3CwNZpO0xbjoOODRnp/4p8LOKhrLo5xhSrHIe6WgkMN/Qgfps89J/oLQyDtqL3vyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WbBCAz9kKqcPg7s2GKDN9SHSNvK3cdHR9hzktLL03oA=;
	b=rxPj0aTcg1EOBB6biZjZtGL4Pq+MRcJoL2W4f+1oDVauL+9RXeLTmY8I3OoD3k60yU8+
	 V23pAx8daiplc6LlI7xjq+gft8PTx1pguEfdyJ5ZT8/92eXTOLMTWZdDlPzT9RCMhFsG4
	 7oCQ+9Mm6gsHJC7VP+RoavjVQppObj0kOZVM6Ul2bfqulIEM8/jXeGyn0EiYUM7B4myCA
	 efjkAwZyCDb0gPXfV5y1PRf5d/rt+QF/2ynGot3F41ju4wtZ6wnkCr7pxrOCW+ss7/Zk0
	 XJXsU34rEb71ETxuLFJ+YGwb99/QFzjRmcjCKlVOldpDdU9SVwXmBZYlU40HUv9aeEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119242;
	bh=WbBCAz9kKqcPg7s2GKDN9SHSNvK3cdHR9hzktLL03oA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N3fiix9+IJSZah+rO6WDEkZpDB68ff0W2ESrcHk9B1k/HH0SPADNczQS7KYEhsDFB
	 m2UXhfYPlAktbfbUB6rxWddPpaidGwd2S91k42SH9EQiI+g0F0c6dlZ6byJ2McLaSW
	 gsJ6M3+mZJMVafsQJKn5jc92eLlHzDtZczrYISpH99RNG4qvnmjZdEyv+r69JmDVNs
	 ykfHn6vLKhIXSVsvC8UrdvmyhSI0nkQH2odRT1kLkJPIpefdXQQbwBHpNLv2iRtYDw
	 QmIupVm7AQWblJpEO4rDBDYZYOUhvVQlzM+SYY/FyNC6608+CchWnSs7UGYOkTsWkj
	 jp3gZm/yqHdmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1CF407FE;
	Tue, 27 Oct 2026 16:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 180CE4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F6280FFF
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3z0rkpLVEfl for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 15DD980CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119227;
 b=JsBts9AserUjuBRqyTZ2ileDReRGLCne+frMDBNxQAXnzcvSrYpFqV6JyUziubYlXgKT
 q7rtkhXeWe1Mkk2AkaAKOtXSqRY7DHOv/KAzXGzseHxQUnLPSUOqrdKDHVi9kJO+Scccb
 +ouaE7YGX9tUdB7wpa0QhAR5D17oZ7saLjg1yMPfrcOipCT7JnrGTznzduNKRX5lyreOP
 PJtbcRzZgmMJR7YqelMA0tRbQIlaeEMa+uc8xsIsjnBb1ZxY8QdijG275dvQJMP5us5M3
 NWf01D9cwHyjJRM46bfqriOHdDPovPevranHWNd5baF2HGs8qHD9G8GPnU1o6q3vbMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119227;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=wosg/BPGfzOQCidu66Wj7yq51Aw57oO55BtbC0FJp0M=;
 b=BAYD9BqXdKKwXXWm+eAFfrCIzoVEm0XAUD7V5UL4zhjaFEVFrJyoSuCrf3QRBMhXK+nq
 mrxHW6UAhYP+Ehz0NVnQLzA6hkWK3zZTPoNb091VJ0rsIK0gLG05vItrKYs6vzpD3mwos
 mi6lG3i/nPPYAVym2FgnS8jS7TLs1h5y/sa+gIPDqqn/cODv9cRyeXlbZiz+/jRUZm5fH
 s7P5LC08r7Pp0+AMf1O3KqyZ+KlZ3dmoCCMoLbdDQB3tt6Mn3dYWeevhy0ehJVa23fOX6
 z6Y7mp2MmA+oOCj1AZpJda1xhmbzPFY2MEHxzCnykSIeRI3IT4Qga7k7l/nyfQxFDgw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fi3KoEMG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fi3KoEMG
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15DD980CEC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c40f5077425so242066b.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119225; x=1793724025;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wosg/BPGfzOQCidu66Wj7yq51Aw57oO55BtbC0FJp0M=;
 b=fi3KoEMGMHRuciKTn8Bor/gGsGXFKcMDQA5t9J6ldR8Yjv7Ljp0rXUjYu9AKBoidMx
 E4cw1PcayxnogdzcRSy1H5tbIbQQwrz7kjyKDAk8ac4SQssehdqyTUbrat2nealAZtAo
 C70GF+Q6mf8VdgWc+1dwKZpNdnBNipDzQiYog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119225; x=1793724025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wosg/BPGfzOQCidu66Wj7yq51Aw57oO55BtbC0FJp0M=;
 b=KLqGUB7X51iDj8LAKG92f+CtLl8xQJgb17AtCwmYTpIG3fZ/Aq0SC0W5HrHKsEX4SM
 Jauy6QOTKrpEXD9JgodMl0DPKV45UnYFfNA6pyMk2DVeNFSPzGHAAUovdEEawM0f9/mk
 dbc+gGoIGK+5V/4l+2F4BnWRcIk8jO5N7DBM0qrmuSdP8YJicM+ir5PmxbXxOpXbFYNl
 8dcwc7r2lbUc08r6HFet+aKPyAw8czFOO/FNnPcVYKcNzg93NspaBZ7jgo8ORFr5Fwu6
 coOf5M+FTpfADWQWhZStKODs4z2uaxzfcI5o8VOGOjWKgLFXlMlhGY6uWvoNHMMm1jKE
 cUkg==
X-Gm-Message-State: AFq9FYLtZu2Oh3XdAOtZDd2cPCPF2eg6zy4FJZIhNtsEQtockvF7JOG1
 vtEinnBIlbSqwB9MoQsWA7R76PABGUBUMnJ9g+8NnDPit0xqQWiLVgBDTiRAqDSrv14Q1jVX6fY
 AJybU/us=
X-Gm-Gg: AYBFou33TdHpnbaJ0VeGzVhSVl0Y5diA7xVvtbGLlpHqV7oQxq1BKQSVRedTscS/gJ4
 pL8XbGJSKpnuNqJ/+P63yorGE8rpplMH0AAaOasF+01g+LBqbxycGmZXiy2Vy3NzcAj4R1xo5B5
 MRdth+4tp38uMaYIDgqxHEslPYMv4G1KQhRL+YTIa7CKQ1hrKzEzZbLvTs67gr+rwHbHRvJ7IKx
 5tApAev1yDlnZFitFbBsQlziPeWEVcdh97UN7zSYTJPF799l9j+fR25spKQaTo6ZsCsniJbE3fT
 iPry3lyrAi+Tgsgk2Bye6gCFvFQ3HsmGwRK0jDa4ycQ69LE7MXyEmq1iKqn1qihOhFoRvkLciMO
 D/+m2wa0J6PVHRSCdahQQuvIjib1KGNpMjRU6T7qVWIaa+YfYvrWnQ3d2Taxoe99ryMolQTjAv7
 EqctnGeI1zdURmFCq1xXd8QvVYGG4t7/CXhxShArr1cgALGSLyXoILGdNCcuwXimY5g1N3AgaXc
 yfYw7akvHxB6ACQSPodvBA9Tf6NrsfvqnuiOQBwGrTFBmb5EEeASp8wNjviEJKfXmezZY/jbnFB
 v9Bu630PxH/1uVE4+eh2AWV+3L1wb5YyEYxsnpK03ert4UsYzWLhGN5sz8VmTkN/tmNxpjxuCPA
 cuTajv2XzaYOE93LzwSiufoeoULXqvfQDvQtnB+6nlxM6HQKZSj7lzIciepzf0A==
X-Received: by 2002:a17:906:abc3:b0:c29:4634:5c8f with SMTP id
 a640c23a62f3a-c46bd95850amr1316086066b.0.1793119224800; 
 Tue, 27 Oct 2026 09:40:24 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:24 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:09 +0100
Message-ID: <20261027164013.1602502-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 12/14] test_mender/post-build.sh: add rootfs
 image checksum for bootstrap artifact
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just like the generate_mender_bootstrap_artifact method in
board/mender/x86_64/post-image-efi.sh, calculate the rootfs-image checksum.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_mender/post-build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 76698fb7d9..db075628e0 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -4,11 +4,15 @@ COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
+  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.cpio |awk '{print $1}')
+
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
+    --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
     --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
     --version 3
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
