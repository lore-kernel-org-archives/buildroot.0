Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933B6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106CD40242;
	Sun, 26 Dec 2021 18:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqph9mYQHNhw; Sun, 26 Dec 2021 18:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B52940121;
	Sun, 26 Dec 2021 18:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F28A81BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E23044031B
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL113S18uT4R for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:16:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0969340308
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:16:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q16so28265766wrg.7
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vlaxdwYX7Y0/WxKHIda2qHNTTEemL/qwjVhW1A13wc8=;
 b=TTdOkQMxFn7BNp9VAF1g3AZWKAw20G3DW9R9dsfyuPEu/ecPYMGziaJQWzctnydJQb
 aV/bvO8YGWiBIq84xJbs49BGvch81wjdOV3SsJi0Mr+/GeBx/OpVx9Qq2undHsqL3Uzw
 iHCgCf6yOB95LLKSxbi+k1LrqAy37b1AlCCTjMZMK3XWke7rnzcslzJak40UED8EHdWY
 3NlPNV0/V2PJ4ZaQVBflC1odIfb8OdQA8LxwbBV9Sd2b+qv37dAALTVkN+sWuzeqpoL3
 /XOpud6V+0CDdTZmnc6OiYmaqWRub3+ufZP7+4nccBSuypA+VmS7tU2Hm0/wM2X28af5
 HmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vlaxdwYX7Y0/WxKHIda2qHNTTEemL/qwjVhW1A13wc8=;
 b=ydcOGcJlu+ZFsii63S1blBXPHiqFjyi8FDI+mIggdM6DR3cO8IOD5YzjGVt6eOk6Cm
 Q86w+FbeaaHoDKc/z2nlhT4P1BgndOSuAsTyTxzPxQcTRYYU394DUKiIW16liTMo2Hli
 AHFwLLGrrT2RMgRlLQnj+f8bkZHEAyag4G0DO56JzAUEkNgZnSr2si3QErMa1ijyedhI
 qBOOmU9G4WqplLphDCsvbYUXBzRYxOE5BWsXFXELfkC2sY9LfoxNweCObmjOfK8UJSlQ
 znNWsT/g/Lu3LZgz9f44LD8I7ErXjvvo/sHQtS5mSXvzKeBbXfEPV4cox8UqdE9k3I4N
 jirw==
X-Gm-Message-State: AOAM533uvTz853TgqWCiNrxew0Ld8Rbi2ni157chDNEd6Ocpu2mY7c+q
 f9LKC1FD9YKENYNzb8qGOul0oAKFj02z5w==
X-Google-Smtp-Source: ABdhPJxHrDhINqociyxVOaHeeNY2lklCocgwkNwa8q6NeYGoeZNuM5UVIGKuwEX+earftGeYtST57A==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr10894783wrr.619.1640542590108; 
 Sun, 26 Dec 2021 10:16:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b132sm13654305wmd.38.2021.12.26.10.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:16:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 19:15:39 +0100
Message-Id: <20211226181539.1359099-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.5.0
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update indentation in hash file (two spaces)
- Update hash of LICENSE.txt, link on BSD license added with:
  https://github.com/slimm609/checksec.sh/commit/ab89f24ad3cbf33d49716bb8ea4c4cc32ff771d5

https://github.com/slimm609/checksec.sh/blob/2.5.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checksec/checksec.hash | 4 ++--
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 397cfe381e..41aae8188c 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d  LICENSE.txt
-sha256 d3c8e80bdd1cee0c2f0e60cb7a8a9482b82f651ea069e3a4453ae9a44072a632  checksec-2.2.2.tar.gz
+sha256  1034459d7cd2b0ee515c2b6b003375fec566fb59c838fc5e1961e1fcf76b54fa  checksec-2.5.0.tar.gz
+sha256  7888fee828bf56d547fc1f634e40638984148b4fc41373b7626eb465060640de  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index e46e858437..61ef110f90 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.2.2
+CHECKSEC_VERSION = 2.5.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
