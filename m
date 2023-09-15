Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C5ACD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAC1613E9;
	Fri, 15 Sep 2023 21:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AAC1613E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iESv1QQH1Uxp; Fri, 15 Sep 2023 21:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA36260C0A;
	Fri, 15 Sep 2023 21:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA36260C0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE9E51BF20B
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9716360C0A
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9716360C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBtKKCmcr2NI for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:59:08 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CCFB607AA
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCFB607AA
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-403004a96a4so29227085e9.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694815146; x=1695419946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D0AX9mDYudCZHYtVrDtoEx0GRl2Nv+JbclD5FWeHrPI=;
 b=EHb+zimZb6YCTRGNN2wgzkip5AuDInC9XDht7GuRiRuqRecNcYQUbkrFtXrXLNTQ9Y
 pNRrYvgsKDvXdcFF1GY+iiBgFUoJqGXUqYhfDSZAiKLX0Ilze4wXXjgDM3ZFZ8RIc1T7
 E3dB5YeEkFjYG/eyPoUueROhZtkwrkuC81CD3NTF/t6md6Hd/pUlf5uQK9J9oBIcAwk+
 RM5CQrweIm56gcPSriI+F3O4QcJvEHNLgVbatEIguaNsYsrDlKhNxUXayzWkzdiHYGUl
 OjtKOc+ADIyOQ0Jejrtp73EtS+ByQcsYNLG5IzFUg3eK8KP4WeJN67rSvf0VbpRLn5tX
 perQ==
X-Gm-Message-State: AOJu0YyaK43YUqtw7ioZYXdD3BOewkuHnFyx95oStgMqKdGdAi/hSse3
 Z85rojmXMeR/M14/XiZdukhWqg90qa8=
X-Google-Smtp-Source: AGHT+IErhYptOxVdCBXkZuwT9nRbLuZWCSgMtZsS6Go5e9kozqUbnY5EQY+graIWt/3Oif6PH4JcrQ==
X-Received: by 2002:a05:600c:cc:b0:401:c944:a4d6 with SMTP id
 u12-20020a05600c00cc00b00401c944a4d6mr2346418wmm.28.1694815145870; 
 Fri, 15 Sep 2023 14:59:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fe1fe56202sm5653023wml.33.2023.09.15.14.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 14:59:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 23:58:59 +0200
Message-Id: <20230915215859.39831-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694815146; x=1695419946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D0AX9mDYudCZHYtVrDtoEx0GRl2Nv+JbclD5FWeHrPI=;
 b=c6OZje6xKH7dmdYheFZS8HzSP77zCq5xCqvTtUuT8DFr3b6X2be3Og2blnQtFMt6aK
 y50FNIwhqbAGiGMfCkXWUHMOdw9/VF6tTq8QSoju/dIfhYy34ofmf17IvZff457fPwD2
 nUCifJpEnjAOz/QEIYMJpiua8HKyiEqH4T12r7E9kLiptT2GoeeQvOWzPkNt1YBISKHa
 Nyvnly+H5Jc8SayDGb3mjQcWK+IJFxHrx4c4JYjRpLT+6CdBcpt/PIi2yXZeT0u/kx1e
 qkOQ1uQnahsYuPCJiAPn6HIVypYgQWWbY8N0SCZRW/vMwc/HAQ2zke3Gz0hJRNefDaAk
 XtNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c6OZje6x
Subject: [Buildroot] [PATCH 1/1] package/mdadm: add MDADM_CPE_ID_VENDOR
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

cpe:2.3:a:mdadm_project:mdadm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/A4FAEC6A-3572-48E9-ABB8-C96D8C8B91AF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mdadm/mdadm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c61937306a..ef518cd238 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -9,6 +9,7 @@ MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
+MDADM_CPE_ID_VENDOR = mdadm_project
 
 MDADM_CXFLAGS = $(TARGET_CFLAGS)
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
