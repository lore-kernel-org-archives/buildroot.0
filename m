Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A9C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 06:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC4161013;
	Thu, 15 May 2025 06:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FG_xswNE5W7; Thu, 15 May 2025 06:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225616073F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225616073F;
	Thu, 15 May 2025 06:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1C5153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1BFF60774
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ew_tfjxZbE1z for <buildroot@buildroot.org>;
 Thu, 15 May 2025 06:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04983606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04983606A9
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04983606A9
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:55:52 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso572178b3a.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 23:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747292152; x=1747896952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMel7nuDwtjBOgIsk9zUzQJLuguX3vCHmUj6rkXz1to=;
 b=N2vX+Y5rJkMhTQGh65uo46OINMJjrtizHjn+5veLMEHxN4T1CiCPUg9pRzsRmeCuRl
 a6nXz6EzAsa/TjWhjEATAqmTDjBjsDpqa3fad/2jmAYV3wkaqrolEpIwiXfLq8g+/KYf
 hfiHZOMVZc9CmqRykqEq75/9zmCEH/+uCVrUY0vuAOXtVAO/2gRhTv1nItzV4lSAr/QD
 scAMFoETWolrIKBUV3Yg9NvVOa2bqYdoHM7y1r/Sexr0RhANNDBTRnH80+45EyCRyplB
 JVYdfPxOnDPB4BjXh8yyTFlsIuyVHobgqPSwzaUhfUWSUmK2EkO5Nhw69/aff/jJ96ZE
 BZWQ==
X-Gm-Message-State: AOJu0YxlewLM88yA96jqtCLpTOICdX2wXkNN947if/yyHnrSV0hlkDx1
 EF43fZhIxPlS797qyWiN0PT5zi5JfdHAOmIPjxK6s3h+Aj8mOUHG81q0auso
X-Gm-Gg: ASbGncvQnWnMJtwA3YX1N649WuvRgNaLVJjmXDLKV3ahSg8qkXkviXH3Hi6so4q9E+n
 qM58iRYIOFlfP6rVjKHnzhJBR5zCqD9KnmzbJs9odVoN64ReJZfrK041fYMtyjr5kLHacuhu38K
 IDc/CS2XGnQaAMJq2inUiDc6H5773PORvvSbt65IjAHNPzLN+mTCFkf2RjtuRFZtx/1gbGlfUyE
 qbsC5MUHKWD7mvuwv5TcrcCUOBdJpM5aPrlamB1pRyygrAwI0HCQmlr1NiamKgiD4p5tZZiVugV
 oLSu7XyOPPY8kyvqnlOXHyBaA4+E30njHf1izSwy00aSfTtY8sEELtrDCP8hj+1sXrPI6ajm1Rh
 aSEebI1H/bS2DYIkV8Qb3KQd4DfUIOgz4vTLN1g==
X-Google-Smtp-Source: AGHT+IGm1qnRrv7CQ1reemX1km4nb9fuNoEeq3oJQm4zRJli1sfFo/rR1HQ75e9WLEouwxnkIw9x5Q==
X-Received: by 2002:a05:6a20:cf16:b0:216:185c:af0b with SMTP id
 adf61e73a8af0-216185caf81mr201536637.39.1747292151707; 
 Wed, 14 May 2025 23:55:51 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7423770510asm10405182b3a.26.2025.05.14.23.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 23:55:51 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Wed, 14 May 2025 23:55:46 -0700
Message-Id: <20250515065546.34258-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747292152; x=1747896952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMel7nuDwtjBOgIsk9zUzQJLuguX3vCHmUj6rkXz1to=;
 b=Uc7iScZCX/3usG6jhdbpT0nAnHCly2XEd+HR6rKH43fFEp/GXCcbYy+tN5d0x6AsLA
 28qX4WMFVRZLMRA1/kEUTurU6LZgYeBJQ26riS3M2bC8z6QoabJerRYhY9csPA9JNiat
 z5P9bBjdexma3M3QMYKq6KvL9K/OsEa4iU47zXlZmDdpxC1HwAZUdlWbJgzcSee7H8/Q
 dUjL+lQVMvpVBGr/ahsL2Xg491OvFGieNVHxCWkhV9ALL37fHSbuHRG366MbGqD9w0wX
 7G2+5n5R+KPsTQ+n6e7BA6nQC5QUN2+1NYnOUl6qq8Trh5xQ8IHzKXmIR/6Bl8V4SUX6
 ol/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Uc7iScZC
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 10.0p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.openssh.com/txt/release-10.0

Fixes: CVE-2025-32728 (sshd)
https://security-tracker.debian.org/tracker/CVE-2025-32728

Install sshd-auth.
https://github.com/openssh/openssh-portable/commit/6072e4c9385713e9c166f32cfca6a7e603d4f0b8

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0bbc4874df..62c3bcad99 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.9p2
-sha256  91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673  openssh-9.9p2.tar.gz
+# From https://www.openssh.com/txt/release-10.0
+sha256  021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c  openssh-10.0p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 115290ce13..f1b8c0920b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.9
-OPENSSH_VERSION_MINOR = p2
+OPENSSH_VERSION_MAJOR = 10.0
+OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
@@ -119,6 +119,7 @@ define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
 	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
+	$(INSTALL) -D -m 0755 $(@D)/sshd-auth $(TARGET_DIR)/usr/libexec/sshd-auth
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
