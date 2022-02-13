Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C24EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12548401F8;
	Sun, 13 Feb 2022 11:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22m5OTfzm-MK; Sun, 13 Feb 2022 11:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C4304022C;
	Sun, 13 Feb 2022 11:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D96611BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C72BE60B56
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sU1-DiDqCzb2 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:41:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFCFB60671
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:41:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso5552327wmq.4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE81y3LJXT06TuP4RnyIBXVtvOWiXNO9xdRiHTRCLh0=;
 b=CxANsUCOsvKJICoEejRHo78Mb+afDun4DQQcPiC5ywocX2/OXnEQrzoxOUM2ipocQU
 PgHS7CWVcyd7Up+vExXTemfMc9ZMP/4adaMKUnizyU31FqSbYCLfUBnVgK3el+wOzrIN
 ym5kOC6Haqgc+t59GdVU49xFzFDmGJGfpL5SA6hVtOZdHaI7k5YZ5HHOt9R0K4bzZzOs
 YB8UfAS86cBWe4q7A+fEc1ASlIyzCVmSE4wmwVPTfjkBwIeEmaxSO0aqklywgFJXoij5
 9UYzAxE2o6S1zWTYa6q5ydyL/xiFbNMQq01JltX0Hua7aE6uF+4+IxI78hy7aUc98Y8o
 BIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE81y3LJXT06TuP4RnyIBXVtvOWiXNO9xdRiHTRCLh0=;
 b=WP60c2SWSFaBeq+h140o+oLYzKm5LJcEg5uNd0gXDR7lx66OQSFvciGOjq3v2lDLW2
 o0OLZAMIBqtW6F7cgl91mp22jpA2krprTI8g8MiyZ7TOWvqFPugdeTnlzkD7Xdgd8dIZ
 MHcUO2ZTOuOCTo61njqwkIQtm9Tt/3J2jU9qk/PmTe4qOOqDvxLGda0XIZe8cmCyrZjq
 44BJVCB+uMSC8KI238PiwD4Bgf00omJ0wKja9iTa73FZoTDY6H9uxZbb7ITg1pgOQE3k
 FhnHkTaPUyF6oKq7DKkRZzeU/nKHHAXQClA494CNuYtJ5Z1sq/10YQ7TdJw0ul21rRhJ
 lVmg==
X-Gm-Message-State: AOAM5327JbaxsXT+GMzG9DngYlZcMh/xMKAYzhm2NG72wwNL3MlxhHJZ
 xThwgORDSmcK9GtWqa72TobCvufqSLs=
X-Google-Smtp-Source: ABdhPJycGskqBfJG5kV7xz4++VjFfim8hMV5zrUToYU8jA6Dh5I8A290CIU7rgS7VVKxZQIzNvUWCg==
X-Received: by 2002:a05:600c:686:: with SMTP id
 a6mr6882538wmn.161.1644752508985; 
 Sun, 13 Feb 2022 03:41:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g12sm3709822wmq.28.2022.02.13.03.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 03:41:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:42:14 +0100
Message-Id: <20220213114214.1057171-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: add LIBBPF_CPE_ID_VENDOR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libbpf_project:libbpf is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibbpf_project%3Alibbpf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbpf/libbpf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 6750b063c0..06f3f3475a 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -8,6 +8,7 @@ LIBBPF_VERSION = 0.6.1
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
+LIBBPF_CPE_ID_VENDOR = libbpf_project
 LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 LIBBPF_INSTALL_STAGING = YES
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
