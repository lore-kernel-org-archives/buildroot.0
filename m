Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED2606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P/uzI1g0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GCXzI0zn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA85960768;
	Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdhF4Y3hzzkP; Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6055606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119224;
	b=UxNZZ0dBwSxGNU3CEpVupv3LKLgPHAzx4pv1SVQ2V4/BGCFfWX4FAm2wGeJkD8exap3t
	 4R2C6jpJmxklWN9GnWUdWNRwN+yLkacHIVuSbEuldAtsavNeQfo/UgaAoBAr3U1Cns8y8
	 HD8T3Js+RggEsNY57++cj4xZ66ptYROjx5CXXcMq91MwR4EiASmOX1pQVF46pyucjJHCy
	 br8OcEMmN4X94BSRf1J0CutqiQ6IpIj29YcIj1ip2oZqkKlCSAt0AJxI7kybCX6tGeYvY
	 xANgb/kdOoMlocWB1Mlioyw+5bYfy/iROuXkrm/f2GiC62z4FGnG3gomymNWUbGPYsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+AH6g9K0mOe1f06/iOqZXvLO657uatQ/h4mDxAnnACI=;
	b=mPE7muyNIxp4s/Of2vOll2ifN5DBb0tQrKsPh8zA1IQRxqqWs6VRdQIbhK7Hb0KhQnbE
	 av/CvcsEp5hf8v5ZqlbZBwHqkh/P/O0r4ErhQKs1EL8ID0LkzzrrPoBnE9n7i7y27Bo2X
	 zHTVgebPHqWX3ikp6HJpGAmmP1UkUuT5P5rdkOCjQi1XP9Gph0oCKJXWSkkOfFVB3GpQ1
	 DscKz1qdJ2kTm8IKuFyZqanwXYl7e/Np83W2N+Iactp/hubrkomzILfEx3ugtn723EeLc
	 nRXp2iiwH48L2VpE5iR0an6Q43ZW+VHQk348cdO0hY/NY7q4Fsb03D9zqFeu/mpa1OQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GCXzI0zn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119224;
	bh=+AH6g9K0mOe1f06/iOqZXvLO657uatQ/h4mDxAnnACI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P/uzI1g0zqDcleShdaB3ANKmx3sHaEgE+DHEH7II4SC4eJrq/HXsxJ3AgpDrK9ixd
	 KvzsyJrVifxYvrAd9lCYsjUluwyFDq8O+xB93Q3CV41/OVZNvXGWHjz9x5gMlYxx77
	 blkKPUGIr2xvrrmLsAPL2tH6Q1lnkXZWH3kLg9WtsMlsGMwBSzvQwGLeEjsdS3Eapv
	 UKYXryGqtaotqAFPqRrhoUHmTmOe+EgPwys6M2Ash1iqTLWtiyjhQlw6AreGsT7wma
	 RkqEsjpHeju3PljUNLxfX83m+pgPblT57ar8beXIj/sF238o0KnvvHa5Ai5tJKFkFc
	 KKRXAXY/r7NKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6055606CB;
	Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B3D64BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D7C26068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gdi2__GHZSKI for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E02DA606CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119219;
 b=Kmw7hmfAW7C3xB7nRERc+/wpL0ExBbEdZgpI/tn4fm24US9Cr887yqcMD6Ohz5dyGB4C
 OBabTKVmVxIgRFXhUvA7FD3KrW84k91NkpMehlKLZKe3HlrUFQ3ofjVqRB/kN767YXvN6
 e/e1sI6JGyWf9Rd6bte8ZnqQz3UDNjsAfYXSrgB+3PCihC1PR89CJLSVCnQzfaNpgNy/I
 R/eCo8z2XCQTJE1klpmTsiFPSk12Rc979Wd5xLSjLvuADnARLeN1eOaDchQ4fqDtlGwOZ
 H16kIIo3o2cMdbLvMfx5lJfeMFkMgF4lRUYX/g3ykPGB1RNekzeAc74hocLUOaGZeTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=REXJrc7vD5PhdYIamVeWzSQMq6t+yzeKA+R2OTGiXJk=;
 b=SL1Jv9cshWkTV4r0uCOhhRoTSuWTY0afhpKhCohSwvL8hyVHviO3tbADcg49jo+DbIQT
 dlxC7Qspy7BfQtjuRygmKf5APl6OiSyma0IrI9wT4ZTpYcOtTwUtefaOeFuj1SS7c90b4
 bC9kYIDCm6FMO58YtYljJ0leKjZXCZy+oMzMahw/6P7MjpoHjXMnCYxcrZW5+utOrlN8u
 C2QZMJq/L/8QWOobAV+D8IQgp3er3Z8IkCjrZrVqlxpY9QYlElnX0c2KTgHxp0529Nink
 /m8T1Rz9CNxz4iljayK1Dx1NU02if2FEwxcJ4asdgnCRMqQZeeYNxUWHSnh5EWuhQJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GCXzI0zn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GCXzI0zn
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E02DA606CB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6aa046a99c6so16198a12.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119217; x=1793724017;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=REXJrc7vD5PhdYIamVeWzSQMq6t+yzeKA+R2OTGiXJk=;
 b=GCXzI0znJatxJLA9Nw1Y1Ko+0jsYLo7Q4KZdqVTMYJKmMqSZZ43CFemgvuJQ7mj8SQ
 h+zaIBpWdKZ6/zOxi72Zm1dOIeGkpSszZXr6adQGjBnZjh0LY6uZNhL++ZeMivHYXvxL
 OnzTzZBOHsOVCsSU/fz7leGuL2BhHkXC5WPbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119217; x=1793724017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=REXJrc7vD5PhdYIamVeWzSQMq6t+yzeKA+R2OTGiXJk=;
 b=Fr5ug1cG3kzXzoumdeCD3hfKdgvRd8b+7WbSwu1TORne6hh+WyKJQd7G0QxQDTqUkv
 o3Lg8HTNdAYJl/Em4EIu/SJYm7i9OboAZjNJeV6BzosHakBZwCTjCNJpxPGtyqPQX8/R
 fbgcXwnls5vj5bkJMJygIUy83m4iaQoBBQFxlRhFPejsDe/qEmcRc7b4l5hP5TT0gtBc
 KdNAcJPbJfEkaoEcQvtsKh+C6Ik7O6xDVnZ3fUX52fmvZbRm8fD20nisLcrzrq7bXkds
 lP81DwK+1Woahyn+Nbqs8F1KhzPaiuxswQi85Ic0isBNeaOY5JDqMZzmIrLm6mizY+nt
 ETjA==
X-Gm-Message-State: AFq9FYJMCoPj0MiIaBCsOB8MdIcg+8FLVdrPXb1PplG15gCDBeTn/RMK
 fFsLF73AUIDRpia/+yxWJGlNd5RNy03eVN8t2CzKJaymScPfz+aamJyMpAurSvJk3IPl/dE7O0q
 8wNMS/0Y=
X-Gm-Gg: AYBFou0YWVKrT+mnT4cp1tBWt9gZutgXSY4yTQiTRzTCAt8fWKuhAA2XtJ8NiunQhUu
 Ry2dNwt3qQAXmXrAWzjjAi4xS+ArmhCWL83tH77zZ6oRUtUCMNFEv3lTX25SzNDzdZKg0+JV4dK
 +b+tTsmieg4XV4fDl1DF32VTq9kAcJ3oaGWJJseb1Jekpuvyeqx8tfECrfcCStDWo5X3pTdugQF
 dTNtl7RJ61/weN+HLppUVMeKfqeagvZA3g/yTLrDGDg6VlHTKM7ei3e5WNP5ZLetPesTiA+pXnb
 QP65qfmymZ7BGlAxefyqdpqvdzd+9Q2Z13+Df6umyk/3/434uxkkUr3x8NcXcynBz/d/fr5X9pA
 A7SJvhYXA3iguuYAYI1T0iASnhQLQxjwYVEdpm9aHbekNfSAYv+QXPbIMXUFhuZLUIZ9PyQ6Zqd
 gR6JCE26vmEsjz0o+inA9uzxts/3tQKxJiRdwd1MzK6AGESfrlWH2fRdxiazT+Tb2l80YlevDln
 OiXQMJsMbaVAhESNlVmFChrx7ZvmBdXAg5Z7HjwnnnSQ6goDpXw/g98d3l4kzIjnpK+rApFE1fo
 EVDKveK0czL8XwJ3NOnWPHMOFyPi31so+BQNlqH6QUQ59OE90pXPz7JKWXrmY4ZUUu982fEt2ad
 vggC294lt08slm6p/gjKgIS8tx12Tt+f5Clgfy6Ds3nwk/E6BTqn/N6gqimAioA==
X-Received: by 2002:a17:906:1953:b0:c3f:98d4:dfda with SMTP id
 a640c23a62f3a-c49a5379e0cmr374269466b.3.1793119216658; 
 Tue, 27 Oct 2026 09:40:16 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:39:59 +0100
Message-ID: <20261027164013.1602502-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 02/14] package/mender-connect: bump to
 version 3.1.0
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

License changes are due to golang dependency [1]

Update github.com/go-ozzo/ozzo-validation/v4 from v4.3.0 to v4.4.1
Update github.com/mendersoftware/go-lib-microfrom 904960e to f0e3087
Update github.com/stretchr/testify from v1.11.1 to v1.12.1
Update github.com/urfave/cli/v3 from v3.11.0 to v3.12.0

1: https://github.com/mendersoftware/mender-connect/commit/14ebf68bd4f83057f75beb06702d6f8adac84aac

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/mender-connect.hash | 20 +++++++++++---------
 package/mender-connect/mender-connect.mk   | 12 +++++++-----
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 2872bb467c..8daf1dc5af 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6400  mender-connect-3.0.0-go2.tar.gz
-sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FILES_CHKSUM.sha256
+sha256  7cdd498ea5073b0b22cbe3b1db0a6f0d86243089112a5905a9b1d2b0c18609bb  mender-connect-3.1.0-go2.tar.gz
+sha256  649734d795498f215fe39bba2a166a53864afe83caebd5fe9c363aac9132b9d4  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
@@ -8,21 +8,21 @@ sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FI
 #
 # Apache-2.0
 sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
-sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
+sha256  80297c4cb7b51b895d0385e45fe3d773271c8ae4c58e7c6d1ee0312dddaa4ad2  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 sha256  1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/github.com/vmihailenco/msgpack/v5/LICENSE
 sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/github.com/vmihailenco/tagparser/v2/LICENSE
+sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
 #
 # BSD-3-Clause
-sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
-sha256  0b77fdea862f869ef4f201ac5649bdbd38ccb055c7f6454dffae9e2adb4941c1  vendor/github.com/gorilla/websocket/LICENSE
+sha256  c615fb76b7891c9b36b0e352c111d5a2fe77c0111e4129a23659b25b26c3fdd2  vendor/github.com/stretchr/testify/internal/difflib/LICENSE
+sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/golang.org/x/sys/LICENSE
+sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
 #
 # ISC
-sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
+sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/stretchr/testify/internal/spew/LICENSE
 #
 # MIT
 sha256  a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14aef4  vendor/github.com/creack/pty/LICENSE
@@ -32,4 +32,6 @@ sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor
 sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
 sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
-sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
+sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/go.yaml.in/yaml/v3/LICENSE
+sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
+sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 98fdfe16df..ae9094f3b4 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 3.0.0
+MENDER_CONNECT_VERSION = 3.1.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
@@ -17,11 +17,11 @@ MENDER_CONNECT_LICENSE_FILES = \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
 	vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
-	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
+	vendor/github.com/stretchr/testify/internal/difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
-	vendor/golang.org/x/net/LICENSE \
 	vendor/github.com/gorilla/websocket/LICENSE \
-	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/stretchr/testify/internal/spew/LICENSE \
 	vendor/github.com/creack/pty/LICENSE \
 	vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
 	vendor/github.com/satori/go.uuid/LICENSE \
@@ -29,7 +29,9 @@ MENDER_CONNECT_LICENSE_FILES = \
 	vendor/github.com/stretchr/objx/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/v2/LICENSE \
-	vendor/gopkg.in/yaml.v3/LICENSE
+	vendor/go.yaml.in/yaml/v3/LICENSE \
+	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
+	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 
 MENDER_CONNECT_DEPENDENCIES = \
 	dbus \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
