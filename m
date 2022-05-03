Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 02:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA884049B;
	Tue,  3 May 2022 02:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSCHYLMH4FrH; Tue,  3 May 2022 02:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958D94036A;
	Tue,  3 May 2022 02:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23C2F1BF363
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 02:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1284B416E0
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 02:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8uqSJTiRhku for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 02:31:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 437CC416D9
 for <buildroot@buildroot.org>; Tue,  3 May 2022 02:31:21 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id z12so8980108ilp.8
 for <buildroot@buildroot.org>; Mon, 02 May 2022 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gAqr3Y/0IcZfL7QSFuD39E8fr/Gg0iOzDign8lIYeAY=;
 b=cdjyXuZg4oLPJCu8RVECPrIM1tGAXc92XrIZughBwdGEId90tYUKMgttB6Y8z+cBND
 ybnB0jnDUn7occ1NasiO8OfxcdeHG6pWAmYSrEhwiAsyZmneDlWoTFp4ePbgPUjEBeQK
 UDeJzvHmBMUZiX78HjBt/zATMQK0KeqdxhjHcwBxvxgiqyhGLvmfTR+vIKB112z7UTTD
 jaoXVCWlIc/UlqcWDzc8RXiPWZxYDz+opjcJNxgH02bMRxHS7EKd+G64bq+c5ZOByb85
 JKuCEVEsEGltli5bZ/VdIfIctjhXgINdSskweszuZyANRiCCeqad7TPXPXSaZ45Lxe9q
 McSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gAqr3Y/0IcZfL7QSFuD39E8fr/Gg0iOzDign8lIYeAY=;
 b=qVADFYygdUtFoTytrlmBK+SazwCXpds+qyIM1UeXVtms27i/NQ1OAQ0ZedgtCZXxqJ
 SnQjfxY8xGOHekuoElTZUVy2jItaxiNkE2GDkiWlRTEXMweXkoTTAbDrteax1Egcxx8P
 rhTP4+rkfZfuh7aiseGguBheJgL6fSJGi8kmUIOkDi1mb8XDCtT0dcs+PKa5BOdSOXmg
 OdnBs/3oArK7ivWviNfrRBjuwpDniUr/NiVF9Cpd4/JLNpMNhPHtnjyPDQ2N2jMVWP3f
 hB4elmIOBs9PRW+7kL6DPf+c5hBn5Md1qIgbUPWr7p+iv+CeXFTOzdWhEWtWVuKryuQp
 Kimw==
X-Gm-Message-State: AOAM531gDfL9Ojrd30V9dhuWIVIPxRCSFOwegna/9bx6RvyPohPqs+GP
 Fvsxa1cEDqzba1GU94Ar7yslLbAvK3w=
X-Google-Smtp-Source: ABdhPJyfuH3QdHqeBgIOI6YKDDibibKRpz++67vl7nxyAa3GM4ignNrRqugA/RhpJp9XsCxcc0uksg==
X-Received: by 2002:a05:6e02:1a69:b0:2cf:3ec:c528 with SMTP id
 w9-20020a056e021a6900b002cf03ecc528mr4076831ilv.3.1651545079906; 
 Mon, 02 May 2022 19:31:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 u4-20020a022e44000000b0032b6835aad2sm1468341jae.145.2022.05.02.19.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 19:31:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 20:31:17 -0600
Message-Id: <20220503023117.266256-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add DTS cuimage fixup
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If we don't have a DTS name or path we need to also disable cuimage
to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
support.

Fixes:
linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 70af84f002..b821e60114 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
             configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
+        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
+            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
+            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
         if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
             configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
