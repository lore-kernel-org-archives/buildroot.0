Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DC2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 22:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C279D83163;
	Fri, 14 Jan 2022 22:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WN6lRFwNFSb; Fri, 14 Jan 2022 22:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F38E830C5;
	Fri, 14 Jan 2022 22:43:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF6F01BF59C
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD41160B12
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6Hd4pN58nOo for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 22:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D716A607F7
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 22:42:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c66so8749271wma.5
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWYGY6HMJXrDWBAsIgtkyYM6Pj1hGiHXxgf62GtkG+E=;
 b=IkHZCTmZ1SAdyI9PObUbqwAMQQWzZoR5qoBP25wBR5IpqB5lE742XxpqczZl4/PEOm
 CDryDFIZh5QbLHuNeQiJEO7/A06UWGCmBnjGcatJbXrmGZAZzVvPXCWqds8ESYjCR6cb
 QEPeWDg8FJHKJN8z8H+RpjX1v/hZ4E7AFqWgtBE3uv1mgVnrz36OttJSY2jVrvqIDFlt
 JKjcslV6CFj17Lv1u8xI2SvhFa2fBbTNyyKAG5rLuhUBPuJaCjPsLAxUrD2OwGnoNOLC
 AT4hut5GhqUr7lxEYkV42cwfNYnDhyH5tKSOnTvahDRGJ1iLdAiHPoiI6ZVm1kX1utTQ
 L74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWYGY6HMJXrDWBAsIgtkyYM6Pj1hGiHXxgf62GtkG+E=;
 b=aBwCD6MwV/LHinQPw7sFWALSO3Vbr0GabxxssEZdZeN2m8Pr2eUPY9uykivWT2bdFH
 6V2wxTCpN0Ho9Gg4hm0D+TAO+2I7TI98mE6KxNotxq0Bj+if3CwEPOiMZA67lNt77qmt
 CE9MZPM0Xox4Sh7MuXACJ+kxKf6VpO3OcQM9u+hROnq6ICQwL0ud2J5tMOF2ztL4ssCI
 5FZui9sKqz6YJ5ipZmEdoS7b1rCBeuAeIVDtjsompTRJVxG8B80R7infzxodHiOeiglx
 Vw4MX+Gpsk2JgMvzth1GzBBS12jTv2+SlTJe9UCMzHRjSrfgg0gH0VpERLGpCMrP729b
 fW2w==
X-Gm-Message-State: AOAM532tiCPtNn8GqM8R6baSI5GLHiHJV6qEoS96lexP+Q+CwjAgw27W
 4xBnG2ATaLl8s7h12zulXH8FXtfeVh4=
X-Google-Smtp-Source: ABdhPJwHR7nV+zVhLI4/aVNF+UCap9LcyNEz73QgwtiKL1+TjOxGYyaZoPpVk+GU1CfXEUyCj1HBGQ==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr10233484wrn.6.1642200177083; 
 Fri, 14 Jan 2022 14:42:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id z3sm9239509wma.12.2022.01.14.14.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 14:42:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 23:40:35 +0100
Message-Id: <20220114224035.1502100-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.11
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

Fix the following security issues:
- https://www.wireshark.org/security/wnpa-sec-2021-16.html
  (CVE-2021-4186)
- https://www.wireshark.org/security/wnpa-sec-2021-17.html
  (CVE-2021-4185)
- https://www.wireshark.org/security/wnpa-sec-2021-18.html
  (CVE-2021-4184)
- https://www.wireshark.org/security/wnpa-sec-2021-20.html
  (CVE-2021-4182)
- https://www.wireshark.org/security/wnpa-sec-2021-21.html
  (CVE-2021-4181)

https://www.wireshark.org/docs/relnotes/wireshark-3.4.11.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index bc7c9f4d7e..7b67e316ed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.10.txt
-sha1  63839abd94d3ae376f860e2d2969777680106578  wireshark-3.4.10.tar.xz
-sha256  8aa7ef4a44ae62bb8db463cf761e2cc03b97305e0e77ed5be53fa83729187cef  wireshark-3.4.10.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.11.txt
+sha1  b656d8709b8b0b3d2a94665af6bec88495ad994c  wireshark-3.4.11.tar.xz
+sha256  a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279  wireshark-3.4.11.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2ba81d1f39..0361d0bb64 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.10
+WIRESHARK_VERSION = 3.4.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
