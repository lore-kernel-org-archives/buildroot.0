Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A1C4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07608406C0;
	Mon,  6 May 2024 08:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O4SWFbm1qSv; Mon,  6 May 2024 08:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD9D40707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD9D40707;
	Mon,  6 May 2024 08:20:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1F981BF5EA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE55A406C0
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-nQI0cPLy8d for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39F34406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F34406C3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39F34406C3
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:20:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so9896355e9.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 01:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714983607; x=1715588407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvFiWIUbkjzw/ovUZRTSqRuk2ZBAnKwHVaLcRF2ZLm8=;
 b=AfH+7Xf7rhiAqN0byzY4gTq2cLi83JZKl4JygqaV2kHUrHSQsEcWkVynjsTVTEmMap
 4bar3PtpV3IdecR++ruJkDVvA/6Z42gy5iZoTdCVw9SHHBzcZ/XS089v0+rz2g5GQN7N
 TC6vlLF0PX8AIUSx5nYMOCemNmSQfOdhDPRluQ5voq/DCt5b9OfnwLKr78aM3snu92g9
 kB6ve29eMhcudMStyV/X5By1/b/0BFIVsf1X9e+xeOBraa4CV7L3pn5XYbsaLSZ7rNfg
 IOMQh/CkvIPlO9Bv1E4o2jyAU1IYjQad2lk0QIeDX4bVT91OOtp8Yah+dPkYqG/yOFw6
 MpiQ==
X-Gm-Message-State: AOJu0YwSm558q+1Ob03KynngCv1TEeP9dukiRVx4mE05S+p0Q0RLsZ0x
 w90emfmhpjIbGGF8S4eG1L9DdW1w/Enmgk8ZJskkepzui+lRjE2FBCB0FQ==
X-Google-Smtp-Source: AGHT+IFLIH3xxv5Rs8R1nS8hrpCJnxJWKVtAsShAxZbEkcY3C6A+JgtbWSuNcIHTqF+LS3D6LB9nrw==
X-Received: by 2002:a05:600c:b8a:b0:418:fd27:692 with SMTP id
 fl10-20020a05600c0b8a00b00418fd270692mr6583420wmb.14.1714983607212; 
 Mon, 06 May 2024 01:20:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b0041c012ca327sm15262874wmb.45.2024.05.06.01.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:20:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 10:19:59 +0200
Message-ID: <20240506081959.330708-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
References: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714983607; x=1715588407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvFiWIUbkjzw/ovUZRTSqRuk2ZBAnKwHVaLcRF2ZLm8=;
 b=UgGd+KSYXsy4con/c9GaQ0llyqzwlLfyzdGGJ7c0zoclAi9SApcQ9iqeI7bbZRnkiq
 k4WJVY150RJV4UBVzJ0ra3e0z0z3yCiZHKpW4PITqITFawtaRdkxvofvH/DVcLRtDJnk
 0gxoJesPOPs+GhVSqyfRlvqgHOiYJXM3hvtVXaOvfMhFGPWiMSXegXlBClKqaNyuk9pk
 8JXFhsOSDNYvQSNvb0puVI4+I2kb+TpsexjkRkcf+a3wbFAan5TznvHrY9H7u50mrswr
 PzYPumLjckh49z1+59bkUzas25Y4d9gfzrmJcOSDnJPz6as32VKhI3mHFNa8+lgiBXcN
 gyTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UgGd+KSY
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to version
 6.0.19
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - CVE-2024-23839 - Critical severity
 - CVE-2024-23836 - Critical severity
 - CVE-2024-23835 - High severity
 - CVE-2024-24568 - Moderate severity
 - CVE-2024-28870 - HIGH
 - CVE-2024-32663 CRITICAL (HIGH for 6.0.x)
 - CVE-2024-32664 CRITICAL (HIGH for 7.0.x)
 - CVE-2024-32867 MODERATE

https://forum.suricata.io/t/suricata-7-0-3-and-6-0-16-released/4468
https://forum.suricata.io/t/suricata-7-0-4-and-6-0-17-released/4534
https://forum.suricata.io/t/suricata-6-0-18-released/4539
https://forum.suricata.io/t/suricata-7-0-5-and-6-0-19-released/4617

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 41befa61b9..58ab0d93b0 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1bd546149ac6671c2476d520a38eab7755e10c3080fd2ec2dc8624b0cf89ee75  suricata-6.0.15.tar.gz
+sha256  98c812faef466d337f107f13ae37843f1c719942b93832d70f1a2fd7ee1b5c2c  suricata-6.0.19.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 5b52635328..2083e0caba 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.15
+SURICATA_VERSION = 6.0.19
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
