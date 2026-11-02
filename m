Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8E60C51ED
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BEW+QdOm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWWFpPJl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4C5607EC;
	Mon,  2 Nov 2026 15:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRcfUtDRrfLs; Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60FD260669
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632989;
	b=L2mEWIby2c/wIk7XkYWR7udBfDz11y9Y7K8quK49NYx1tlrmufSDv7V87ET9gW0RIUGU
	 iQBhFlw1g6ea6yfcOsBuQ40NQph1vKQP7ZiIyAII0Eb49z6/mwPAxXB3NzoJtm+M/r0eT
	 a7boc1zDh4BUJZIguod0Dihf6XQY5XPPj8y0oOByvHG3x9HcZkNb41j6WnJnsqNNaDKGi
	 HvBt9ZWKKdblELz3P2ERUWFIc3oueuwE8OVlWZPtLOkOztEtI8fG9AdyYbJDe8zttHLrc
	 oRxAmhhQgopfDeRRWU+jIeiwbCrq8BGMwqgfQKlaX8Og7mqA/yKmntNR4srddSGhzlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ppyZV4UVEFJV2oKgEau1ou2GdB0lHyu8EDuO2YB+p4Q=;
	b=LEMIuBW6mAhBe9gA5Lr05YNduUhN3NDUMGBt+hqhbdRH7+pP0e0HTfmjjKdzGpXGSEAP
	 vz4y3kDXxwUfm2rTqLdjs0UAVmYdJz/lnsetS8XoV1TRWtDrM5j1OpqK/htXt3pDmBozn
	 gKz3dhbp/NaJfA7gNAIZjzOiOT+msTl+zxI8B/rhf2TAlyW/vmIrRNBrnkF4daJupq8nz
	 /gFRD+52Th3reuZnDPyHHVaa/a/vv9IjBnn6oMmpO0X+6+BkVpt8Sd3XywrzVdF9o3Yzv
	 puBcxJRscXCms93ILI4FpOKhhwugcyBKLR6PmFQYlXg+k3gObExlKDZWJlOL5G2dEhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWWFpPJl;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632989;
	bh=ppyZV4UVEFJV2oKgEau1ou2GdB0lHyu8EDuO2YB+p4Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEW+QdOmWvK4paVQl/zntK9kP6c4frwDA9v1TCwvWEPePhzm4+kCZNhFwE9KuOpOn
	 +OMXuVuDyRTo/l7Iq2+eSbkkkqd9UlkqCMEIoGGOBnLP/0EVgdO5XgjQX/AMcM5uBa
	 +R/EgwImFq1FA8zsRKgzsPeP1PwO0+MSA++hrDFLkvLUkX5q8c6M/N8/wZ7AO9n+O4
	 WJi3FlWfb/1QoiIoYGP67pWjvO43F8Pkii9GOL7qaLjXmJWJvoxxCi17KJ9sgOm1se
	 oHyVVs4sven7S0Kxwt3Rlwh/wnlY/sPQE2bej/j/i91g0fz6Axo7rnYaAgCqtfitFw
	 dMCYI8ALux9SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FD260669;
	Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C038C2A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD6260661
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TaoexdYHNOR for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E7A9606D0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632987;
 b=KVF+KFahsaWv67CDCHNqPtdh0gRLUYzEsFV6hqOQjKfqyJ/RO7L9oYtmTx6yJH+AWxJv
 rtUT+Wsfk/GzuOr+ceUUKDrCpyw2nJnlP8pxeER0M3wnQXtbDg/11xMdXO9a3YYnNk6c9
 jTv2rLoXoOCIPmJz+suXiDVhxo7NfNTcLeVJPrOSvQIiw9nWByLMjlCn3+YzYPSebZCqG
 iPPaPqTgLg0R5UoccimDd9wJuS1rjbqVocVoMxyv093Nzo08Yiuf3OVjC4/T4uQ7dJMg2
 9e+vcjRrAIaCOhuJvfQTHax52n/tbwVwznx/uwCOgA4OUu7iS1mMD6GJjJOxgCcTzmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632987;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=JhThHh1gbc0/baG/DtefEW43TpGTC0r+7F+QZEp35nE=;
 b=iCExeBDHkMuVmPWbARk2HJL0CTgG8OCxv//7Ay4xr0jw5LJgUESumycAKzWNaYFnluup
 pWV9LFjV/YbBqlZIHkVTL3PeXwlIk9CedTNNxGyCZsZXEP+lN2wJCFXog3GoRhKzFYjnV
 QIc0I7ERl/M2gGUUf21WakZXoB9wo9hdaIhpcLC1qU8RGhngUQhzrFYBrwbZZnB7+id3x
 Hvmr78Hzb99xiyh/X2BBqejjYOvrvcDxi8kbtN0B2t1tHN2ChoC+aghi1g6SOGb6eM83y
 K8KEsrZ+05TtcmLktcYguCp7RZBlgvAo9LbihyUMEWnUxn8TCYUQxTYCNqAqP5zm6wQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=RWWFpPJl; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=RWWFpPJl
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E7A9606D0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so36033865e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632984; x=1794237784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JhThHh1gbc0/baG/DtefEW43TpGTC0r+7F+QZEp35nE=;
 b=RWWFpPJlpLUlvw+SfTmG5qRMqgOtxoGwbyYwWauZ+atvj9KH7lYZvx+bjGAP3OS2Uz
 KtB/PugGisfr/Le5oaITo+AC2eFITtPF4MnGwJLZhgVheGrtNOyaqB8dxEvIvJX95hi2
 9lMYRxhcxcAymtrXrR7zOCbgtbIARJ93RKyEfvvC8Bc31Gyv4lTtnS6TMGAw0GKeWFfB
 HvtJEpSsSj0FL+ij5qvlsLD4WfICbxXJpuZZpZ9Q0OG9+sefsGnkTi5Penj2rBjUcGJJ
 4u5Az7Z7rtuX0Lc+XcQqazk1nAfMvQB/0+QWCoBrhfCMjwZreRl4/2eCty0ujZyTD3oj
 L0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632984; x=1794237784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JhThHh1gbc0/baG/DtefEW43TpGTC0r+7F+QZEp35nE=;
 b=V44L7IH/wLHQIxUVPPyYZx4rsQd8RlUmDBD837Ki4H8h7sflAJ0CjJyILioAF5d4UK
 WZD4X+A5Yx5EKYQMYiHbSCxz31YieYxskHs6IXkC1Ux/G+NTG5bb1XnRsTgxXqlkHYhD
 Ltgjf5Aet8sb+BuiBXlO6S9sQtbBNMlz0Velh/Ho1Ot4TknA6/Hs9MCCOUAkU9GPovTi
 ds4BTqOI5xzIKxAZlN8F4I0Mlmlup8/g1dvl/hsJWauxPhehM4Qkc60wmnOiSOixbPXQ
 jV58nLqu84ikRPZnq7hHkEXH2eVH83sidygg3jjxjHyDkpsypK4kwNqt5HmspVipdy5i
 wI2g==
X-Gm-Message-State: AFq9FYJ6YqsxkEZWff4Dhh/f9Yrzov5QX0tJvYDcutVIsABUJlmnrVNa
 gGE6wNyAAHDQ9sk2Yl5WAjuatBU/G0OQVVvZQgO1I8ZDu+3UqnU5TiNpVToSNA==
X-Gm-Gg: AYBFou0V8IZe7808muvsuh/rWIy6QLB5TGAXLYygwFV9UZyBR8lrJI9jxSGcggn3olA
 vrXaL8pdFuxdm83GJt7AtVf6lpWkH19XfCw3iFVcsT0kWgWeWclarESAsEWo14hlN3wRo3mNjnK
 3zxZAcUtbDEEASLihiksuERrFZdrY1AYRnbD6uEUeXTg+6wwOgYNC5d7gE/PKSI/JFuU0Mm3yvS
 s8Jd2PgyU5d7G1j7bV7YEnBg1/FyhCCzq9n5lXn8Ll5VoXR/BuSPo1a8dh88UmKeb9dD5tKXlDF
 OulaOODfWD8rFNoOWEYqbkriIElX8iAGSw3kTFmA6dGgbdFRbR7YNRHeyYUmHe2McHP3ye6GeGp
 8BiYleLJRkOhJlP+W+ktqiN5KedgB6KLD1Rc36yvQMpQsjCoEOH1n1BTS5a+ncGPkIC2dyvVRgi
 /eKAUZEEl3d/OrftTqNpKOPLV3LH8e0+Pvr5PndTm5zrVKWVh03FH0sRfoGZy900fD0hIDvCaZz
 /+QSyaSGIHcu80sK61A7DzP5Uo2S9RsQmZgfZIw1IwpOcb4S/TtS9z1TCfhCcUyTdAD731q6lZc
 bzVcAZqYS0VFhlh8yR3zbisNUTbRrZWcBMAzz/CfMaL6JHLvz0Duaw==
X-Received: by 2002:a05:600d:6508:b0:4b0:bc65:b9b5 with SMTP id
 5b1f17b1804b1-4b0bc65ba2bmr71940405e9.35.1793632983904; 
 Mon, 02 Nov 2026 07:23:03 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:03 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:54 +0100
Message-Id: <20261102152258.1948796-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] configs/sipeed_lichee_rv*: switch to
 Bootlin glibc toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
- new patch

 configs/sipeed_lichee_rv_defconfig      | 4 +++-
 configs/sipeed_lichee_rv_dock_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 5bddd0360e..6ae03df3c1 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 4d1ec159d1..5b20d291bd 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
