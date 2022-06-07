Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1761ECCA47C
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 17:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96ED683EDA;
	Tue,  7 Jun 2022 17:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peNxtGAXJ4LU; Tue,  7 Jun 2022 17:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBCE083EB3;
	Tue,  7 Jun 2022 17:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 217421BF2C0
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED3060B83
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYP4PI1u96sG for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 17:34:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 142FB60B2B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 17:34:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so9888623wms.3
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ht8xdj4kbcYt+jri4zQXwGojQ4DRXrbMf8rZHOp8ujw=;
 b=Ayugt8W3PtfmhUHwqOTuqvZ0F0XwVQseYTdlyNFMuru5I66Ju1Fw3lYqUpX/dJEuVk
 6NeHQO4I3oh3k0wnGhV20Cq1c+rZgqveGkx/b+7PEaMrkQ4g++cKCtvpCLnsmajWPKKH
 9cQ0fXBSLDYptZvanLYRI24Rv/ksBdhQ0bB/GG14bzLUJf9Zt0IY2Z/+X7H3YpNYp0QB
 XnSRhsFyoa6A9qltd06sdWUfHqgZ3jcJQjUJJieuYjjt+m5HSgh7N2PQWARjeYx0sjm4
 batVw//R1O3i1N+G4R8p77e0nMCUW9wwuTKceVFNZosHtdjnyxljQrvZqEIh+f4RozYx
 QwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ht8xdj4kbcYt+jri4zQXwGojQ4DRXrbMf8rZHOp8ujw=;
 b=6zsH1r7wwcJF6aiQaxV8jIhKN58kszfo7nEdbE27m5s20R7bEYjJzPPGuWYHHHof1b
 DDLxq0UkfS9NJiz7M6SP672fDRmzMOqOCVY9L2gOTRiHcjnl3qziT46pScz64nao9lGY
 OKqI4wraRn6yDPhE5O6COW0Toriprvm8hEqN5Rg3PlhgpKqIhm59VFp28Hg+sOvL+bOJ
 JJU6DgKkJ9OWsMVX/j91IyW+5u/HX8PHpZmr/PgPfjuDbT0zDVr0+gJn5gAHg2WvzhcS
 1Wnkg0SbpERRKcLzXunV/fkLElvlEWO+IYz6/Wps91+SfpwBoagv+ydZRm/sodrKevGo
 GDzg==
X-Gm-Message-State: AOAM530MyDrCIeE/YJ8EqH3lFXV+6SZQk2G7GQWAq2p3+MxfNo9fcAgv
 rJZHgbrhOw7UkM7IWg+TMXCDwQnynJc=
X-Google-Smtp-Source: ABdhPJwlbEDo8nay7cxEkZ4beM7XQmnX1DG0TTFXUM7YDWjN5HxJA5JR/k4pr6wBr8Lvpp/OdYxkeQ==
X-Received: by 2002:a05:600c:19d2:b0:39c:325e:ea69 with SMTP id
 u18-20020a05600c19d200b0039c325eea69mr28217601wmq.88.1654623250115; 
 Tue, 07 Jun 2022 10:34:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c34ca00b003942a244f33sm16554141wmq.12.2022.06.07.10.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 10:34:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 19:31:37 +0200
Message-Id: <20220607173137.911359-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbsd: fix sh4aeb build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following sh4aeb build failure:

In file included from nlist.c:44:
nlist.c: In function '__elf_is_okay__':
local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
      |                         ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-src-local-elf.h-fix-big-endian-sh.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch

diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
new file mode 100644
index 0000000000..8612d268f8
--- /dev/null
+++ b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
@@ -0,0 +1,39 @@
+From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Jun 2022 19:27:13 +0200
+Subject: [PATCH] src/local-elf.h: fix big endian sh
+
+Fix the following build failure with big endian sh (e.g. sh4aeb):
+
+In file included from nlist.c:44:
+nlist.c: In function '__elf_is_okay__':
+local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
+  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
+      |                         ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
+---
+ src/local-elf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/local-elf.h b/src/local-elf.h
+index 1dd3b42..8c4794f 100644
+--- a/src/local-elf.h
++++ b/src/local-elf.h
+@@ -230,7 +230,7 @@
+ #if defined(__LITTLE_ENDIAN__)
+ #define ELF_TARG_DATA	ELFDATA2LSB
+ #elif defined(__BIG_ENDIAN__)
+-#define ELF_TARG_DATA	ELFDATA2LMSB
++#define ELF_TARG_DATA	ELFDATA2MSB
+ #else
+ #error Unknown SH endianness
+ #endif
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
