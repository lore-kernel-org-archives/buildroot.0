Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89108C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED7CC8408D;
	Tue,  7 Jun 2022 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxu4qmWmpJBs; Tue,  7 Jun 2022 20:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6FB83FEB;
	Tue,  7 Jun 2022 20:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60B6F1BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DA1083FEB
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kC_ol8DTamB3 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1491883FA8
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:31:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d14so16665947wra.10
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JXc8txSnFdA2GbyHHMITJpwzjBEbItal6z3Zg6GrCsc=;
 b=NAK6zOzcy+rDz+r3Q133a1JaQIvVtG5q/dsNTxeMg2SfCwXgq6NlrBb3GW/7ly+V8T
 PbZvzH5Cmv4nLseHyGh30+vIRN8RfWplt7BwgHgbo/mDybpONygGeKv/aQYxQZneqCAH
 4XMbNVbdWoXbdGELf6Iw75B0x3+48cagzjdJDD8CiOcspSWI0i9wjtucEd/gvFm9uxuu
 fkWw6P2OwccZGua6U3I8KDYj5idQ/bnUfneq6cHQuOa2J8IngrGVHyz7aMbby20WUtfm
 v0SH8193OHLiG9P9PoSp/mq0ZvgTw1Ag3uA3/R7um8DnaUHXMTqlztLU8O0dzFsL47WK
 /2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JXc8txSnFdA2GbyHHMITJpwzjBEbItal6z3Zg6GrCsc=;
 b=dBOcNEKuqVVrVFjHVeB/vI8weEGwrvB041JgEPLtc02jyJGaENpwPvZjZNJbjPAf+q
 vnsrZEofbBwgocGxgbjNDd/ZqIaFnpeeZBsO31zCBEyAWxj8lxKo0/AGtdjmI8AVbkyC
 ODqj1HPUrkKzasFn6qhQthI2JdTzVCfQary0RQXsIzfsQWnFEvQnlRape4SMBzTNU0Fz
 +a5wKspESFTj/iY0O2Lm2QUbnSOPphq9FgrtWmdMLOJoe3DQ+ggOYohUAQF1dp/XbPcm
 KG3iEsheJv2vrq3NMhQnoFbNy7SJMwc2vAkHoB0+pkRV5Bdd67xMKFN9DrtO6Nq6lgaa
 M9FQ==
X-Gm-Message-State: AOAM532TPDBZ3MvZ+ChhfvxQP72hcmA4f8wPMLP6uTi2inOOweEA0m70
 IYozQcDGCFKLKS9aOmn5gNEQWSt4ITs=
X-Google-Smtp-Source: ABdhPJzjHhPMsOW1zSJe6wkzPAiSsMNTGpAD8G5P/oNCZe2KgBIdhJH9COmXEA41BN4XLw4Xnew22w==
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id
 u11-20020adfdb8b000000b0020ffb4fc3damr29963706wri.163.1654633875944; 
 Tue, 07 Jun 2022 13:31:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039c325eaff2sm18225855wmq.26.2022.06.07.13.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:31:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 22:28:28 +0200
Message-Id: <20220607202828.1130778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jpeg: SIMD needs VSX with little
 endian
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

SIMD needs VSX with little endian to avoid the following build failure:

In file included from /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolor-altivec.c:25:
/nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolext-altivec.c: In function 'jsimd_rgb_ycc_convert_altivec':
/nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jsimd_altivec.h:93:26: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vsl'? [-Wimplicit-function-declaration]
   93 | #define VEC_LD(a, b)     vec_vsx_ld(a, b)
      |                          ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/be6d5ad0cee4ee19eb25e595d44555a1af6e073b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 0a786060d7..371f89aa49 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_JPEG_SIMD_SUPPORT
 	bool
 	default y if BR2_X86_CPU_HAS_MMX
 	default y if BR2_ARM_CPU_HAS_NEON
-	default y if BR2_POWERPC_CPU_HAS_ALTIVEC
+	default y if BR2_POWERPC_CPU_HAS_ALTIVEC && !BR2_powerpc64le
+	default y if BR2_POWERPC_CPU_HAS_VSX && BR2_powerpc64le
 	default y if BR2_aarch64 || BR2_aarch64_be
 
 config BR2_PACKAGE_JPEG
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
