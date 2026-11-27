Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A4606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AklzSi1K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PyXR2sIZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B4481205;
	Fri, 27 Nov 2026 11:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZHAJCyo8DG5; Fri, 27 Nov 2026 11:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B09381183
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795778718;
	b=BoRTivakIjySkDZgU7KuI0f7yr3cMT+L7m43q6hqEtTzYNUOAAX3DwHF4Uvh1yBVMCeo
	 okcGU3dwkS+e3azfhvaVSbxj7cpG4bRl812kapfa6liHoWNgRLGjcjYBJ5nySAV/Gm/Ct
	 Wu55V6THXBCAe0zR3cAwCL6tyNUedsDnGAVxxTLkOTLkBTQxpW3RZwDXHGGbf9JKJV3B0
	 yDiuwImbJ+OEnqulsAHR0wIkK6i4sGlEHcyNtiIbOVZnBDKHyogBNyyYSwGd2Sf9Oi2mK
	 B3HNSBuTQRpATRu2GFkpRIqEqW8c6+rmvIG6NZvJxRNdHl4syZHAH6BuqGRxplxB3Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795778718;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=12o0VCJ2LU5x8fkkBqMJ98xmVt7p866h1oFjLSX1DUw=;
	b=NWqMAklUQcQKZsCGsxLy84DNKVdH0TTOGsxt6J1P6JpBiQsZEUYFTOO0ge6VTQjkHZmN
	 bovLFZn0GiUCAkcoy0mCDBnvCuFXCFmB9fGh/qYD6i8HqqIY9QiFDCJ0+HljZ9ks7BJ2s
	 RUFDR63s+QiCvN+/LBdq096XTa6kCPzDf5QddSQ2P5sTXo/Nbirwx23JfPJLgbZ6FETFw
	 N0oAchSh6kFFZLKhycRNOTqS6QUJZ1LU4XqeaKzTBehMtDfVmpvlRM7SNQyY5JLbRELct
	 67A9J52XaYS9l7h3w7Dqr57G1yds6RBvncVhFL79wdnBN07Q+lqvGEhLkNNkT3yEZRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795778718;
	bh=12o0VCJ2LU5x8fkkBqMJ98xmVt7p866h1oFjLSX1DUw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AklzSi1KujweAdTI3UAzzbY4nS6IMkThQTezVO1k1ViTLkOz/t62+zBxvR14jyuko
	 xrvUHpe1Ru93AjSDhXv7J8FRQVVUZhMuIuLTZIuPKpTBLPYQqAaxzBCLV5WUmbpq2e
	 BJaZd4kbuyak5d3cCDgZVPXITBA6HCSq2y6tqT7nVdlHTuRPyze6IK4pUb1Kcymjt7
	 vNWT3mQ115Fv0RLkQC87yMm1f+8/PZTDwAQZ6y89Z1Obkivu+JH7Iwlkkpu6nAE9ai
	 fP4D6Q/gj7ZPesHeTTCptDLwej+rXnSlThRBnBov25wCMK61iof/oAcGv5xHvV0O8J
	 M9z7EANW6z8Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B09381183;
	Fri, 27 Nov 2026 11:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A49D9D1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96817408C7
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBwdU3QHXjuB for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:25:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F104408A8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PyXR2sIZ
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F104408A8
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c50692e6c0aso124149266b.3
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795778711; x=1796383511;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iHa1jYYRh332bdpbkN+eenbtrPFg5Zwj3iRz/+Sv8RE=;
 b=PyXR2sIZRH2EG5lT169cEEvpIhuuHApvA4apvJNSTDkw1B6S/M3ohNqPrRZzsLeELg
 T4T+ukE4Tskb3sIY1vHk0L8QmWlwKvEah72ZKp3OIy3lkvB6WUqXb3zxgOr76C4hG93M
 Py5zQyxjSIsc8qwZYtqh1e2/hwglfzCPQ+bbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795778711; x=1796383511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iHa1jYYRh332bdpbkN+eenbtrPFg5Zwj3iRz/+Sv8RE=;
 b=YkI71f7+ofPh1EjsuRoA9pvFfUgkxy0X9G9DUtG9tFdpivcFGnQx6PBBCOJahICiSI
 ipWIvpvjWZ594pry4xlZAMlQyhEurSkWLJzuaVMUX5K+GMK4zgYtbqL9bKvo90oad0Tn
 sjxu9sP0/4TMOfOKu9dCZ0IddaoHqU1PuP1tBMnncKa2a1JqLrBVEEHgf4KXWAvUzMn9
 zfSyIoz5rUmkUyTzjYtcTFIsmhmkMsTvCfRgpCGa6KvDPRq2EDs+4sdnQHOQ8rHhK8qm
 /ikursyPavx/42CYl++Bop7WdCIxFC5FEgDX+aIIfFseIMwY2gqXG5IOxTpQ2BXpvPiT
 91jA==
X-Gm-Message-State: APuU4Z+OwjsjfRKrg1+HbPtQaumPewG9/leqMWgTQPM8wbd1GAfGREnL
 HnTjJfA0BTPJcNzTfUTCOSd8awKCooMMrmYLRdFBJWPEAo8ayXek4d95Pht4m/E0axbXu8+8gDY
 3JHOqKuI=
X-Gm-Gg: AZFdTZf9TmamjE1u3Vb+d9JAl/wGHAaPrsFwEX8ti/oMR6V2t7SJdu+iE8eRn2RlYPv
 nX2a0qy7ZiYrY84EkmOa8MKYkFik3gS6S8s17ibTsDnDdhLcFjctlFB87BnROkPPKXLMzKELT1n
 Fv8j7ABGHD2unBE01i9/tHIomwYaNlgZPhaXaLbfMhI71Zaio0Nv4F0jtnyWPFTbcDMQJzjcYyY
 aoAYrV1NGbMLoT9SwBi7nxuRkrebWW4C2ycg+St2THAQ9U/NussT5lXy8UyeqLKqVxYBXMb5t4R
 v6WolTuRsGAY5+JFWKsW/0ymdvf6a14dp8yXI4+EgnCUjJeUr9lZ42bBKZqd5DaO2KUY+So9msN
 IzDYoiE2Kcob2IbodkJilShJrkNvHEfY7YiSMpjr94EqK+L07FuTe6Kyx4dGJJnQoO1oHCWluAZ
 PuPwlxCMgK+d6vO1nDJ9MluXaRJ8lMbzmaA/uaBjABcvw5BcRj/lW3f5vffA3zpsGx/6+q/T/qY
 y9930Ux3YIVaHsiFArSWKbWzd4lrVl1qaAqVk35F1QQ+dzvkhYrKy3qgYEWHNO357Fp94fhTIDp
 MXEwGWH1fP2x79TF15CDgP6A3XMvNYZMOUadST4FQ8bYVcbJRGuOlgtE/2o+4AhJk/j8qdYzgZz
 ymGeD4Ev0TJo6h/Lv1YpFottJgThMKDa3kMOhcmIuhos+k8wuczFNqfFIocNURR7ha4otyfPkfg
 dMdsX7pB2D/7Pa4/SGRXW62WtKL+s5X5pbJOJFDo2ceg2twaMlQzNypUL/8+b1k6O9cOa0WjnWF
 qGh9RIFSqLfaAPtJZF5/SJw1uPVB543Ibhn6iwFWliIWctdf4/zDsFwlEgcEjG07tKS8pYKjQ==
X-Received: by 2002:a17:906:80d7:b0:c51:9c26:7f10 with SMTP id
 a640c23a62f3a-c519c26a5cfmr794809166b.3.1795778711124; 
 Fri, 27 Nov 2026 03:25:11 -0800 (PST)
Received: from adam-linux.arnhem.chello.nl
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea3701sm885808166b.48.2026.11.27.03.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:25:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2026 12:25:05 +0100
Message-ID: <20261127112507.2594905-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
References: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] package/flutter-pi: bump to version
 edda7f9a
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Notable upstream changes:
- avoid blocking the raster thread on page flip
- add a pixel ratio override option
- add DRM fd support
- always force zero rotation in KMS planes
- fix text_input escape sequences

Tested with flutter 3.50.1 using
tests.package.test_flutter.TestFlutter.test_run.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 892aff75f5..b89949ba31 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b30e8b67109a81a7c2a2bbec3d82491b69e827a1eb84c529f3e31691c19671d5  flutter-pi-af8c8d66c5f40a6aaf366882bb9ca525be9c600a-git4.tar.gz
+sha256  0f2e55cac9bc4d80b645532c60fe632a6e6d7322f7536a795658b984796c3ef9  flutter-pi-edda7f9a216a2fd60586ef350aac84ebaa847bb0-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 4444493e61..411f414472 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = af8c8d66c5f40a6aaf366882bb9ca525be9c600a
+FLUTTER_PI_VERSION = edda7f9a216a2fd60586ef350aac84ebaa847bb0
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
