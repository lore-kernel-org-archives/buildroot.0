Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 18:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 859FB84127;
	Tue,  8 Mar 2022 18:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMWOIGgrFA-p; Tue,  8 Mar 2022 18:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3466840B8;
	Tue,  8 Mar 2022 18:02:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D02121BF86D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF3F44154C
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWDW1IZ9kZkg for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 18:02:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 761B940209
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 18:02:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q14so14256779wrc.4
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2dPD5DY/01cnSgiiQWpUUeEu9bdfSwMAeKFFlTaJc4=;
 b=hsyvW21NciJ8BRXNqIjnOV3hVrOv670+LRytkZPEydnI3N5QhzSiug3DPqB9ulCR1k
 ydcD717XnNjf73JFlCc0Dzkg3sNODKLzeSlWfaCKDDRHMCfNBO4fqfZKzy21xLTk2lyT
 SqRruaXXOmwDi82RUdByfWkG7eLQwd3rz7k2L83LqTH7XCF+fn23fptPg0Y3fQMFAKhs
 renglvTHDTBtgjWhuo/iS3uk/pfGWpDLy04tJGp6nLT0GoKSb0XGCtGlHM89DLabu3A9
 zd01h8uZcxNUJL965A0+MxEE4h4YuYEsF1ftJsDweyTPYuNIt/BITI3rt505g0BOd2Pl
 zP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2dPD5DY/01cnSgiiQWpUUeEu9bdfSwMAeKFFlTaJc4=;
 b=YtatBWTylNeX1isG+eNLEp11QYutL8iyWPgUQYv4fp7jMZvep1bO0bS3rBYXRCbDFb
 ZSvyk3TeWNv3/Zw/v51CxgotaTnTVP1QbBzkkkiQHcxwG/0evKPQjpRoYtJ9G1DFaG2t
 U4IHEsWN3IKExJCeQ7vonUyGXxkqW9/jHJsZ0hCuTHKaq3WNwprGvv+hXzj/0cq5KyeZ
 QTjLy6fBTBoK7/QvJubsrYN3tsLnjfghFzzNtbY3dIogV4IWq/iZcaXVvrZR3WQSn7Gl
 5vjZS2r9+FTPcCaUoTLz0jRFFBc82S8DO4vMrSzJJte6Vnl2FcXvF/iKd0KabMqSIoWf
 pylQ==
X-Gm-Message-State: AOAM532WK8CA7GVvTCUzuml9TJ+BugzQHBhHhfvXuQBqSKgNPjvaPu5E
 S1upBHUJa/58gFx3WkUU2hiikqZXUIQ=
X-Google-Smtp-Source: ABdhPJwnjLdMgDrU53OOSQdiLESAX49P6onlDcpjM8fwkG/UfKGpCWOiQtDsnbBysZZNzbskcyi7DA==
X-Received: by 2002:a5d:628d:0:b0:1f1:d81d:d6da with SMTP id
 k13-20020a5d628d000000b001f1d81dd6damr12742434wru.20.1646762554389; 
 Tue, 08 Mar 2022 10:02:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bl20-20020adfe254000000b001f1fa450a3asm9047098wrb.72.2022.03.08.10.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:02:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 19:01:52 +0100
Message-Id: <20220308180152.1558214-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.6.1
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

https://github.com/FreeRDP/FreeRDP/releases/tag/2.6.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 780061bdbb..28e733aa2f 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.6.0.tar.gz.sha256
-sha256  a4ba0a75e30ed25fffc4cd4e89d0eb92e66894caeb6c78dc5e23b6b7c04f60fe  freerdp-2.6.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.6.1.tar.gz.sha256
+sha256  e4b3b93d102bc03164f592d26d7a06d6de648bf78b1e3dcbd8d62941431c1f28  freerdp-2.6.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c8978db6ce..a1791b27f0 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.6.0
+FREERDP_VERSION = 2.6.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
