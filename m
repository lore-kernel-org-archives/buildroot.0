Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5FCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8677083F50;
	Thu,  2 Dec 2021 17:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNvdIQRsJi70; Thu,  2 Dec 2021 17:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0082683F4D;
	Thu,  2 Dec 2021 17:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A518F1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A15B96F4BB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eCKDoKNoM3H for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 067906F496
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:51:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o13so362551wrs.12
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 09:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhRbk5c6rflzo6+X3EVTNXu7SSh6Nh58Mvh25xPBGVY=;
 b=TPfBzrH01rcfukQCeXWB/s/3PAUvHsUUxUCwo0MQKwNdZcx9AwRJ7HcMcuT0Ma0fUG
 MKXRAGHJr+4bgam4rEocdJfpSOi405Ljqi46cC/p0QJa3AwcfN7tDnnV0fv9hMZjZoTk
 sUD9ag1e8jK8UFjpDSMUf0fVyhvx0elJOyQGw4VN1BmB/H2tm4h36wCilV+TbtSe0HRD
 EVoKcpVFkwr9viVD1Qms2vSqsKRS+qYbv0LHBvjSMbL1orZk1/TgJVwm1HCYgwZ/8hb4
 TM7a0DtoQeTrSPgmsIExRfYebpyyy0+F7pDKgaN/sGjagAgPMR9eH7Us8akwo9ro0XqO
 m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhRbk5c6rflzo6+X3EVTNXu7SSh6Nh58Mvh25xPBGVY=;
 b=QKfub4hjMAwWOjemhLdPcFY1YdvY5eNISNUUQ62E2Dj46N/UieiKCJ6bxi19ab4Vyy
 VkyJnUUnfF1SbjcjJF5sV5YTZ1JEVGA8dT8YALyHqFdyQi2RBE9XZmDrO3WV3ngMdNII
 BZUTqLwU0qZuxvXvImvEXdcFlO4ItCYC9tEeFgUMeccSxUo7KgJBK4K0qNzcw1sJ3J2j
 vYoXea4Zn+PRn+vxtlectA62rYq7udf4sai7YeRTnw7rALACLAyHCg5BaA4OYnkfHotc
 c7LtnltkYMm1hImlGTStF2sv3w/svuyZRFSrwtsLH9i8LdYAW7kzPrE8sVRlzMZgqlcy
 Q90A==
X-Gm-Message-State: AOAM533UbBJAWsWsJ/QgxK6Vj6ndNq7Y/wy98Bk9mpWx/LDtroWPApre
 E2QLOC6Z5W1S2MzLhEEASS+r9UtlLh5pdQ==
X-Google-Smtp-Source: ABdhPJz7U+Hy+xe725hlek/sHKUwb45Kk7GTRmX/A+XSysGwRmV0MXt2o8I2kteoX6DGyJsjI25rGA==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr16013021wrs.537.1638467497006; 
 Thu, 02 Dec 2021 09:51:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j40sm346988wms.16.2021.12.02.09.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:51:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 18:51:48 +0100
Message-Id: <20211202175148.1464234-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: drop spurious spaces
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
45bce2575d8dd3f08fbf0870f7cfc2fbd3c7a3e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfuse3/libfuse3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 767382271e..1dbe918c5b 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -19,7 +19,7 @@ LIBFUSE3_CONF_OPTS = \
 	-Dtests=false
 
 define LIBFUSE3_DEVICES
-	/dev/fuse  c  666  0  0  10  229  0  0  -
+	/dev/fuse c 666 0 0 10 229 0 0 -
 endef
 
 define LIBFUSE3_PERMISSIONS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
