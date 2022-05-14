Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBD3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 13:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80DE83E17;
	Sat, 14 May 2022 13:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9wkKdSwJ1wi; Sat, 14 May 2022 13:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA46A82948;
	Sat, 14 May 2022 13:58:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80E991BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A0FF40C71
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viX9JZXkvZw9 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 13:58:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E51A400A6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 13:58:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e29so5117049wrc.11
 for <buildroot@buildroot.org>; Sat, 14 May 2022 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=InlBHZEU2NwIiWXiRk6zR9Oh5PJANORjZPU2iNzWXaU=;
 b=Nm5CuCPitJmNOXPXySUI7PJxX5blYITFdP6ZbD8Xkfx3qPC1IRS9Qq2RkgtGyWCmrE
 rPE7ZgmD+ebUBWwfqzhNX0aj6Qa8bSWJJ1jgIsUfkuliym0IM3QDfuw9doj6OAcs04Cy
 5XROxrT6I3O/WdVulHj7LjWSJbxogdnNEsxpHzbWvxemd2HCN2WCQfvfqggjXSObfgH7
 oZiU2Bo99OaCky8MPfdijoc5AahuK/p6KgVdIl5pF76fbO0n6AR8C3MLFtoFl5a85nym
 S+iozVo8YC3Vs4ForSqdT5hdEzEcSGRCzOICTEUNZ/fIeTpJXMb2h7aoGD4ce3rLVVKy
 00jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=InlBHZEU2NwIiWXiRk6zR9Oh5PJANORjZPU2iNzWXaU=;
 b=FwCe/ZyIAAM578gTWosGMvZkSBophyHQD3KeyOyQUviriLrU4dJLZ0haEE4f3cgpZz
 4m6qky4qpT5NDypF0opiSQC+oDD+5aglHilsi1Qic3cZrH2y+FQ5bpNBIxN2WoSQ98yE
 BJ/BfLgV+nQc4kctR4UGJHTYnieomgHCu7aw5WHjy/4+2t2nZEjo7ebtkDu/Xa99Jr9f
 OrWnIkmEGj8b95zBEAKsG3C9L78q17rZd869jRZ26C7ZC6s8s/TqdQw8VTl9f+mpmU4P
 0WOk8rFHjiXQ4WkWKIImuDXULa4kpwBHKamMowfYnxP1ZWg+MjkJgzs+DWURyoh7Wjfj
 ZPiw==
X-Gm-Message-State: AOAM532oBZc9Qm/gzf2eGQRaTUOREmShh+qKGngjZwnYjMfTg8sgue+l
 r5QabG4hH+1k2R4CDLMxdKSLCLDJq6M=
X-Google-Smtp-Source: ABdhPJzbWXk7N3PRTZ5j6O9hP9OkwaxLS/Y39gcuSPn2gqOe48FYIRmSR0R36a2vBzeEpdVrpe7CFg==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ecb:1113 with SMTP id
 e11-20020a5d6d0b000000b0020c4ecb1113mr7555245wrq.203.1652536682430; 
 Sat, 14 May 2022 06:58:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c26c400b003942a244eeasm4963254wmv.47.2022.05.14.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 06:58:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 15:55:38 +0200
Message-Id: <20220514135538.1830643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix BR2_PACKAGE_RAUC_GPT
 option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
c2d3033ddcf0c497cd46744bdd2bee84d18349a4:

Makefile:576: *** util-linux-libs is in the dependency chain of rauc that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/298974d87bc1f578d67de2b1861e2f11f6c22374

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rauc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 2ea51f5bad..1170e50845 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -27,6 +27,8 @@ config BR2_PACKAGE_RAUC_DBUS
 
 config BR2_PACKAGE_RAUC_GPT
 	bool "GPT support"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	help
 	    This option enables support for GPT partition tables.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
