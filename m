Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA31C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AEB4038D;
	Thu, 27 Jan 2022 18:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJiscsYFGI99; Thu, 27 Jan 2022 18:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F26484019F;
	Thu, 27 Jan 2022 18:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 852951BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 807D84019F
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bk5c6wBLJqAC for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B9D3400CC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:06:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e2so6311454wra.2
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iadm3vMHWfnchJjrtpid8MFI2uzK/zvDms6OCT4gH9E=;
 b=EWx0LUIG7hk5di43FzDa5RryVI6UMrK+LZ40O2iv6kxw+CMCA8c+msL17GeYJHRn3d
 T4nEB+ZBKw8jmTTAip8H6qIZFoRrq1ULVERXfOgXA18BGxF8l9PMI8q1OHyplyuA4SBf
 vqZyqG745cZ3mCtsWUjlfXkh/iCcgGED5vrGiVohI3tTId1rG7a9amwGjNy2JC8618d9
 A68VdPh3q+bw0K/6gq7TjiqLaLlpSsy3yN6ajf9GBNyUekKbY+LzyGR+nGYtdwYRvdym
 RSrDfpp89pN6RAuBzx/OoSe4zSgcf76l9giXZRXM6zHJT7L3K3NjCOnoqD/d+RWi2zo8
 GApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iadm3vMHWfnchJjrtpid8MFI2uzK/zvDms6OCT4gH9E=;
 b=gE/BaWI+1cozLlxQH+AZjBHv5epWbfBypwhfJTJkkqPLrYePytB2S0zW5iiROpHoaH
 QwOHrq1QNj36XL1kjnMuhnTxF4eJeJwIRsDLC/Id/NkMLa6A0C57EfHtbYYPm98LDTy3
 2V/Ujnfgi0mA8ZCdjt0nWOjTLYErlY/Y+L0JVHWTAqIPC3gWXglJln8AxxiMLwaTdLt9
 XRNlQN4N14M2BXc1fMZWoGIuPWheNgbB1UYzDPLIMZwE6Z3PyxiXrFRKmLP/n1DKsqDc
 r8nJKdfgnTOxeBCUH0ByozFwD3b+kwLE2xhrifK8w5/6+Om/LxZveRKkOwJk+N8yzsov
 Fu3g==
X-Gm-Message-State: AOAM530gUQ3bHyIW0eF+lAHtx9wK0N8O9dFNcPlL2McpaiRQ6MCSFQ3i
 PxBG7IjG6JECXeM07Z8mF5uegZ74YU4=
X-Google-Smtp-Source: ABdhPJxE9m67zq0nKeGuyb5eQySmfDJ6+qOPILt37WKOKctR7KhjCnnlv0iAn+6CChOOP5VnoHJfrw==
X-Received: by 2002:a5d:534a:: with SMTP id t10mr4114372wrv.285.1643306801120; 
 Thu, 27 Jan 2022 10:06:41 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t1sm3288262wre.45.2022.01.27.10.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 10:06:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:04:55 +0100
Message-Id: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/jasper: use JAS_ENABLE_DOC
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
Cc: Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace CMAKE_DISABLE_FIND_PACKAGE_{DOXYGEN,LATEX} by JAS_ENABLE_DOC
which is available (and working as expected) since version 2.0.20 and
https://github.com/jasper-software/jasper/commit/cddb7b199a1c78f3ec0b2c6b8af705588437af4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jasper/jasper.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 6ef1afcac7..59c5b3d66a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -11,9 +11,7 @@ JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_CPE_ID_VENDOR = jasper_project
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
-JASPER_CONF_OPTS = \
-	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
-	-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE
+JASPER_CONF_OPTS = -DJAS_ENABLE_DOC=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
