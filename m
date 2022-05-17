Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4E5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F191C60B30;
	Tue, 17 May 2022 21:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eTZxiVITYUa; Tue, 17 May 2022 21:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0293160AFD;
	Tue, 17 May 2022 21:17:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACE151BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B83840132
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITUu-c5na3zD for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A93400FB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:17:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j25so34863wrc.9
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjsRiRGyR3jEoA7pEPs0CyVUoS6SOy29BeXgMhFptNI=;
 b=VuLKkCvtVTVmC5w4gU/nyy/jjDVMWJMXt3qgl0DPraXujFgEzH8f0PIOXzIfkZTrzj
 tZQd0rgp5qdd3HSUdairC4zQ4uVpuJfDTIE0oHliQFXLDL/Z3vQmpYJcgcjRmOmV6Qaa
 0gnBLtfNEAdhpVkgdpmcgXMBgcTkjYpuB/7/R62VDRbM8c1NcgNM/pE/RWsHlPHRuBjR
 3VMf5qhK+52XK8uWclXFigfVe+MvWd3zIn2EAg2OaImtEw7PZRjHiWK5tQeVJsv1WbD+
 q73JKcU2Du0MpcoHFEMP5i9toYv75XcrWTxAP9IqoiauWLPwJgbuSWgGAa17vhw4UPxh
 v63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjsRiRGyR3jEoA7pEPs0CyVUoS6SOy29BeXgMhFptNI=;
 b=az38pMl7zXs4KdhVKEsuRz+cycGBGGtYQV1dsRsKcuc0toC9iQqoxsHRqgp4ElLkqo
 MQxl5GzNzwUCmXdsrUAC1ZlTI0m/B0k8MFFc6RKOoH4vH9M+Y9KrWDOxMtJPVs/qnHWO
 YK9ATmwccW/sdectWWUxvsSbKuKFfWhP/C4aiWeJEUgqy+3KjOqh8QS3O9Gw/BFB7pFI
 3KV8TJFFrf5bgwKJDmPnOm7++s2PkSGyORHmL5Lw3oCwY9X/JNdE93xp53p3t+jWDTMx
 e5oYgy7oUAj0sTBwqjW75zuSrRo7Bf4ijAJJ9YMHhwKiTURNtivBLQTtZOLcei/jYuah
 4XQA==
X-Gm-Message-State: AOAM532TkQVbbW+ECoVKraEov7x7PQxVinLP8VusR5Eb/vH41wyZxWQo
 eFeUAuyL+TjAFlhXWgcbjBeX9A1/pfI=
X-Google-Smtp-Source: ABdhPJyrQmGgwiPgaqnPlMbw/3fjJHXxfubPTC1O8JTvcLMHAkjIBGuhgEBUqoDo/B17KRHF956+zw==
X-Received: by 2002:a5d:4538:0:b0:20d:fadd:5fd8 with SMTP id
 j24-20020a5d4538000000b0020dfadd5fd8mr4664688wra.26.1652822272613; 
 Tue, 17 May 2022 14:17:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i19-20020adfa513000000b0020d0b60000csm117482wrb.20.2022.05.17.14.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:17:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 23:15:05 +0200
Message-Id: <20220517211505.7445-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix build without
 plugins
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.17.0 in
commit ffd45b8726d42bb299199d9f1e10ee3d3469c85a and
https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
      |                      ^~~~~~~~~~~~~~~~~~~~
      |                      TEEC_LOAD_PATH

Fixes:
 - http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-tee_supplicant.c-fix-build-withou.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch

diff --git a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
new file mode 100644
index 0000000000..e41c9138ee
--- /dev/null
+++ b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
@@ -0,0 +1,39 @@
+From f2a7c942393c6383ac89d9264999cd9c93a70b80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 19:33:57 +0200
+Subject: [PATCH] tee-supplicant/src/tee_supplicant.c: fix build without
+ plugins
+
+Fix the following build failure with CFG_TEE_SUPP_PLUGINS != y raised
+since version 3.17.0 and commit [1].
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
+  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
+      |                      ^~~~~~~~~~~~~~~~~~~~
+      |                      TEEC_LOAD_PATH
+
+Link: [1] https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448
+Fixes: http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OP-TEE/optee_client/commit/f2a7c942393c6383ac89d9264999cd9c93a70b80]
+---
+ tee-supplicant/src/tee_supplicant.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_supplicant.c
+index 7b186ed9..53c29a26 100644
+--- a/tee-supplicant/src/tee_supplicant.c
++++ b/tee-supplicant/src/tee_supplicant.c
+@@ -101,7 +101,9 @@ static struct tee_shm *shm_head;
+ 
+ struct tee_supplicant_params supplicant_params = {
+ 	.ta_dir = "optee_armtz",
++#ifdef TEE_PLUGIN_LOAD_PATH
+ 	.plugin_load_path = TEE_PLUGIN_LOAD_PATH,
++#endif
+ 	.fs_parent_path  = TEE_FS_PARENT_PATH,
+ };
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
