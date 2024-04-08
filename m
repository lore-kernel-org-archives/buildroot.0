Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F547CD1296
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 19:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF4A407BA;
	Mon,  8 Apr 2024 19:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9ap4pQgSAN0; Mon,  8 Apr 2024 19:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E18C407C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E18C407C0;
	Mon,  8 Apr 2024 19:31:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1EE1BF2E5
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97EE760B73
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGy74tRhLorz for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 19:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C07760B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C07760B63
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C07760B63
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 19:31:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-416422e2acbso10995145e9.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 12:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712604701; x=1713209501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z+wHuLn3YekOFPZq/842/uKwCTuQZT7EuMnlaLPxKsA=;
 b=k9iJYSYk8tubsOSbIVeovuzfuj1rDtX629sV6bIFerupQmREhVbsdkb3O79mgvxKc/
 YHxGNPyz1WDzNv3aqTgzGXdSCnzvszGvqCGfcarLlcG2G68CcbeplOzAUy3cTldxrVCo
 xhU0vARjjjXXWMa7l9Q1+JgRL2zFwMl1avJ/SZvKMBcFeJIGlTLayNpJ5yPf2ZF42fxr
 5l2jcYW+UB83hS92vz8U8EpqkL7PuZDA1jePAhe0bdoPXfaOH+xBvbB8O1L5O7e0rZ9s
 TZrjEzeaCavEbvPREuTWFaX+WpxNopr6jCN3hz/bxykgPAxTwcly0dhtoO2KkQXb2wDH
 TEMg==
X-Gm-Message-State: AOJu0YxHWqFv0M5JCY+6gsuxCqDTa0vVSlgvLz3+DlZDDKPWrNzbiWJH
 Z2XvZd28JznZIYkc6yL0QYXSzQfk3LmLeCVO2zyw47ILMSvOexGm5oWD5bZ7
X-Google-Smtp-Source: AGHT+IH0x6zM2dGDXUwF24GXKAILE1jz7Pziu/lzc3iZ+Ba7bQYetKyy3eEKicWk91Lh4xfVvfSfMQ==
X-Received: by 2002:a05:600c:5111:b0:416:2baf:60b0 with SMTP id
 o17-20020a05600c511100b004162baf60b0mr513634wms.12.1712604700979; 
 Mon, 08 Apr 2024 12:31:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0041568e91c41sm17889957wmo.41.2024.04.08.12.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 12:31:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 21:31:39 +0200
Message-ID: <20240408193139.196047-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712604701; x=1713209501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+wHuLn3YekOFPZq/842/uKwCTuQZT7EuMnlaLPxKsA=;
 b=I0dXFYXxxkul/h9WlRxza/eQ3SwJgghFbw7ZReqNNpIQjf4rGy8KEuhtbwAWMD/RPV
 W9HMYmMqmha3Ret0fby5KtnSkwP9gHEBmTTTd5Qy7Pu998u8/ls6rUE+TKw4YrTaDSoM
 Y714omhy5e53cljWt3CeH2+DvhW9xQp3F+B2awQJ+tVLPjQy83Sodf0uzz70A8nR18Tr
 e2hjeInY7EJswcSb9yutL2sdgJc+1Kqju4G3Y7sMMYa1GSMLzVaVOcWoLXC8oWSnle3e
 UxzNckvKkbR+NXq/9jaJeSFLstvPsVD6dVsIVUbyWnap6QML1qTSqvEeDWr9oNPlOtjq
 g8PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I0dXFYXx
Subject: [Buildroot] [PATCH 1/1] package/dmraid: set -fPIC
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

Add -fPIC to CFLAGS to fix the following build failure raised since
commit de6415ad9c35b2013af1f1821bcac12ba3959674:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: misc/misc.o: warning: relocation against `stdout@@GLIBC_2.2.5' in read-only section `.text'
/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: log/log.o: relocation R_X86_64_PC32 against symbol `stdout@@GLIBC_2.2.5' can not be used when making a shared object; recompile with -fPIC

Fixes: de6415ad9c35b2013af1f1821bcac12ba3959674
 - http://autobuild.buildroot.org/results/0349c6bfd66f5e50429e4a5cc07fb7abf2b07345

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmraid/dmraid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 9a78c2ae07..97c729aa70 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -13,7 +13,7 @@ DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_LICENSE = GPL-2.0
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
-DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 DMRAID_DEPENDENCIES = lvm2
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
