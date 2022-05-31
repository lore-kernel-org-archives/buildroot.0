Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85675C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 12:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F08A40B1B;
	Tue, 31 May 2022 12:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElePK5yWK5wz; Tue, 31 May 2022 12:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB6140B0B;
	Tue, 31 May 2022 12:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB9BA1BF57B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA40F40B02
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aryD0CseZBJu for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 12:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CB7E40AFB
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:51:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v25so9313713eda.6
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forkoder-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1hjbH0cd0IJoKkfoaUKJNIUeSKupQ6wp8BkpwYMn6hI=;
 b=ZPe/J8plaGG5jnS+/zvILlP9YUB9JU5/NBE+iYbJoktCJr/Y0ZVlH57LqSvsirY2lj
 HPr7SlEuYggJ2NVYAYN+gJZaHRHolfgkHPyD5G2bWtacHTa1MMp3t/JzTy6IS0Nwqcap
 OBiBNcM5JpfX+PXEyGJQ81kDtt/ap4nt7T2aqMb9mie6dZmN9YR1NlhEWOU8/JCzvEL3
 4fEqkkNf8BvHgmUc54I2tqwRR1ONSnh4xVwLfbSFt3xzv4PF0TzaP/u1009AHnsfWkix
 1NjKCbePDBVySb+N82ONAwU8mlNSmeC5icN95nvemU72zGwYJMIDd7sZv8vz7hD0VCn9
 790A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1hjbH0cd0IJoKkfoaUKJNIUeSKupQ6wp8BkpwYMn6hI=;
 b=s/kVt9w23qul0x7AMWk+iqnqVTyviACza3ZdScrnIP7liL1YhuP4x9k1WnRiUBj0qj
 gpjqhUjAi/OZa9pqq2VyD9tOOwCiblYh2P92bwYZYz+OWi5gs3cWzErI02LS4OEJeWcb
 vPjqZyGuCrx3Vz3xuNkQifx1wMsXxBGrXC/3J603TS+43xiwIyhWqNYnm7O6MCmzEVRY
 I0FIPmLBH/kBcEK1p80taX7tRQ3A44CvW90ZlenB9U1JPahzuhDiV64Jf8qpr3spmi3n
 U2FQE+7J4CAgOm1OVV1G+U+HQ2v+ru4VbYCj/A1optN1Lq3egIljppGy+z/+h1usGlt+
 hyZA==
X-Gm-Message-State: AOAM531YECjd4hg5pHjF81jgh0fKJzglhXrWtN1nedNk+KUTLh1JdgEt
 ewb7On1aXYpMmdtjG0zmOMaQFS5KU9Zjh43D
X-Google-Smtp-Source: ABdhPJxNq4dq8n1mu7AxlrESiiPZUU1ltwP/9foAmZhs/X/SFCZs+b029BzgS4Mzndv2XuiPtGJStQ==
X-Received: by 2002:a05:6402:542:b0:42d:c7d6:4121 with SMTP id
 i2-20020a056402054200b0042dc7d64121mr14919358edx.302.1654001515093; 
 Tue, 31 May 2022 05:51:55 -0700 (PDT)
Received: from Vlad-ExternalManjaro.home
 ([2a02:a03f:61bc:9e00:725c:af7c:8d:b8e5])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a50a405000000b0042d6d8ec1d5sm6450355edb.60.2022.05.31.05.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:51:54 -0700 (PDT)
From: vsvoboda@forkoder.eu
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 14:51:50 +0200
Message-Id: <20220531125152.135227-1-vsvoboda@forkoder.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] fs/ext2: add option for zstd compression
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
Cc: Vladimir Svoboda <vsvoboda@forkoder.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Svoboda <vsvoboda@forkoder.eu>

---
 fs/ext2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 333ead95fe..705446df57 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ
 	help
 	  Do compress the ext2 filesystem with xz.
 
+config BR2_TARGET_ROOTFS_EXT2_ZSTD
+	bool "zstd"
+	help
+	  Do compress the ext2 filesystem with zstd.
+
 endchoice
 
 endif # BR2_TARGET_ROOTFS_EXT2
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
