Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA8CD13D8
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 14:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A70D6403B9;
	Sat, 31 Aug 2024 14:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxp2DKkUzrsR; Sat, 31 Aug 2024 14:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A74640347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A74640347;
	Sat, 31 Aug 2024 14:55:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D55A1BF310
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 14:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D97D40347
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 14:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXgIKWGCkVG2 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 14:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 457A440420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 457A440420
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 457A440420
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 14:55:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso667670166b.1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 07:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725116103; x=1725720903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8fLE6j2+bh5WdOACqbU9SdQ0LqCqeiKsxKLS0EGhfY=;
 b=ryqJqxo/QWdzc927tdxc3aT6zsmnRTpEEechgB5IhnTfL63MoAIKDkDNaI43aR4SIZ
 zsxB23/E5no47R1cIPAbqlCh6IFax+JiG7n6VXslyVK0CR9akKh8EjdsROEhCCnAwRby
 D1/JdpiUf9FS9y020qjj2yk2WH5+TuEg+MLDKXRCdi+F535mHNyxvoRPlbiaINYTreU3
 XjGwaH0CQWzx7E9VGFOtj6GoPo3GlgGoOxx9eO/k6EnLWO342KUuNXlfmZ/5ZYET/nrl
 AvFeryB+HGRY8qGj6uYH23v1NCsVEirQxt0m7Gv+4coLjCcdgVRKqZWLvm6vt7jwo9xN
 VhaQ==
X-Gm-Message-State: AOJu0Yz7GJjEpNO24P2DIN4/s/gR9MswZfAdXg69m/1g7MRA5lZx9J1E
 zcu57K1NHbWXFycIXaPLhpFj/mPvUuj9QU8pb3anntdjNnEivzoTkjXl/aCqDXetLzZWs3+0JCb
 slsc=
X-Google-Smtp-Source: AGHT+IFvLcRq98tJDGC8FL5kU4a5HqeSKWpIk+1HIeVUqvgPLxQui6uMP+ctH2qNMOe3TwvQLO3q4w==
X-Received: by 2002:a17:907:d589:b0:a7a:c7f3:580d with SMTP id
 a640c23a62f3a-a89a2924ab3mr552190266b.25.1725116103009; 
 Sat, 31 Aug 2024 07:55:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196968sm333123966b.139.2024.08.31.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 07:55:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 16:54:50 +0200
Message-ID: <20240831145450.3162934-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
References: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725116103; x=1725720903;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8fLE6j2+bh5WdOACqbU9SdQ0LqCqeiKsxKLS0EGhfY=;
 b=W3+gOCKIiBqAkPSvn02PD87Qr3t9jPyaBhhzVbLYBHdYUtSlyBCxyb7Z3ioBN0eE2/
 GfTJTctuBfae91VzlLF6hPKF4t1E2omb7NVTnQeplSlX8DEnvzWzF24M51RZOhtiu2AJ
 +9GYJV56z3nW5DHZnvb/dJc+Uok9RrmPF0DzM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=W3+gOCKI
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Dario Binacchi for babeld
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Added in v2

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec20c..33d4c119531f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,6 +790,7 @@ F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/babeld/
 F:	package/sscep/
 F:	package/uuu/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
