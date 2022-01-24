Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B056C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532B140495;
	Mon, 24 Jan 2022 17:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVl6XtbYCIwn; Mon, 24 Jan 2022 17:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F8C40277;
	Mon, 24 Jan 2022 17:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDC31BF296
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FF840342
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-_kZ1AFYMsc for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:28:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD442401CA
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:28:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso34739776wmj.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4qmLQpR+OagH1MsaTKLlDDjtEkieRveNZKsAfnpvpI=;
 b=bT61oJp2KP8zavYDI9WgPwRDbcPXFv96qz8W5um26lMIN3mIoUqGrl3Rau6thTe7u/
 cHjntUKtlxadC08xWNW4RsTyjaPVJ5/r9e346jRKsMT7pS+aEa9CVxDvEk52yiA047Th
 Est68nktTobuf2V426AYz8v+oFiIZbbB1N0JS8qfSE77mF/wZBSa6UNnlx+V089dlvnq
 z79fDrT9NGSFWiyURnzhcAe1AZWNEB/4NpSuca9wjiFElCt/j6DKWO2CIE4SuGh9F0Hn
 SotCnXQBM7AbUhJ8a12NE/Ocxl58cMXkH/62Y3fQVCXjdA6Np5ZUyo9xosZ2w5EcMddA
 ashw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4qmLQpR+OagH1MsaTKLlDDjtEkieRveNZKsAfnpvpI=;
 b=y1Na5fqu1C9ynCVJBd7fWS+MwZjpqOpJcQzNrUU22nGqJ7dh3mF0/RdchQ1P/hs1Lr
 rjZY3C6G2Fh3CGD4PihZsP4TeGmyx2fZ2C75DqcPWgh1eVXqkPQV88dwKnYLcRCScVRE
 /vbUt8MxD/mzsZiQLUYPnoMCpBZ6X3DhUCn8Vbbg4zh66eDeaJKwfzDM1QAMGpRdhirN
 QyCvJdq2ZXDd56zE8hSkMdoFjS0IaFN/jm4NJDdFNiQvRPpriDOdJgVQNpGn7A2pKadN
 MPoe9dysGXPOJt1LNATlWKwutlEmQdqSEz/RLaFwFmwOelVzFKIHfz6rMy73Oo9jCK0T
 sr2Q==
X-Gm-Message-State: AOAM531MQMFT+lcnCRWWKYBV0EV1YN46pLhrsj6g/PqRHsDsuWRtRpLN
 Tk3itfm5c0QnTvLJkCGDh5A1RdInmDw=
X-Google-Smtp-Source: ABdhPJzGgA6w1VCr8xPOYJmN6CjbeC0ogHZ48wh8EKn4TCbSpAdUUzs02XxXMib5KY3L7YjhP5ggSQ==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr2690475wmc.120.1643045284984; 
 Mon, 24 Jan 2022 09:28:04 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f14sm3949188wmq.36.2022.01.24.09.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:28:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:26:23 +0100
Message-Id: <20220124172623.2303019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lvm2: bump to version 2.03.14
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

Update indentation in hash file (two spaces)

https://github.com/lvmteam/lvm2/blob/v2_03_14/WHATS_NEW

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.hash | 6 +++---
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 1260669480..c52eaee1e1 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
 # From http://sources.redhat.com/pub/lvm2/sha512.sum
-sha512 e4d3bfb38b346251a2ea2cee7b79f2e12ed407652b659b35b65f58c8bb252943cee1c511713aeec8ff3400790e0e99ea6b83e8740050defe5cbb118f18bf7700  LVM2.2.03.12.tgz
+sha512  6a93bed1d5cf36f0f48d4d413d028b0e480cd4fc20e25d173770a892f265d2a0cc68d01a720b1513469953649e989532cd0c45f9538f92a4190eb3dc4555857d  LVM2.2.03.14.tgz
 # Locally computed sha256 checksums
-sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
-sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
+sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 70da10696c..f875b292f3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.03.12
+LVM2_VERSION = 2.03.14
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = http://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
