Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 16:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E230040125;
	Sun, 19 Dec 2021 16:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKVkYFjE3vL4; Sun, 19 Dec 2021 16:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC6940368;
	Sun, 19 Dec 2021 16:07:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB671BF228
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE5C240364
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id At9n6Bsg2ei5 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 16:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBB2740125
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 16:07:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e5so15013786wrc.5
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh8TzYf9FOjEzCNGO+cio82DlY47dfx+NYESsRlUKwo=;
 b=EV3lmMSYAmdbj6nIgu4lMnfGOAY0DPygG2hoYa3dL0HmlIuPQWQ7FPd6ewJN1qGVEu
 OWyCh0XzlmLQ+LCOob7o//mNhdlk80LYk20cM3lk5+hP7i1QtJV4qWOYIeT/+TWeF86p
 i5X6vDP4a2yac0drROonGmiHuEBCooBpq/MTeO3zZBAD81D5Zg2XLjqXA1zCsVVMqRX9
 +m3MEr7ef6/QNngaB0MeM78BKg9+i5puclrbdskL9kn4/zImcsnPmaZywNGGkJ6az6CE
 VixiUbfyHp4ecx2eq8Zf9Pa06aGk4zgXehpy/FJBOCCm6DJS8A8QLT94H2kbMfMekxNn
 ZRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh8TzYf9FOjEzCNGO+cio82DlY47dfx+NYESsRlUKwo=;
 b=zpEI2yJgNA+Bbg+Ghk3jTg4zxvp1MhAYb9i94xtheRXQrhazalSufxNezz4+QleGl3
 swNyNb5kn4TVEer083j92NgoouiyrjpjEVVUGfzhNhgTd0MPMy29zdK7fdF3FdMo6ggs
 BHOz8u3M45UxLyM6PKxwFCmkLoFd280F4S2Kn7A/QPgPNmOhRvm+tTEmZ4tLsToQJd55
 rRAbCWM/ZUwah35GntvGy8YeTt6IfWBzu5cEC6iaYUPHDy9QVNi9JeoEQSKnlSDEHb/F
 41MrfBK4N7MPTZQx6wj9Dm7LpNoJS3c2zzZq7dmyxmEQnvPJPhyNKX1RRsxSluFIcLUT
 WUrg==
X-Gm-Message-State: AOAM530KaJO9bTdeXNyIlV6gF47rjjDVDa3tk1yPHaJGN9X6/nOA4joJ
 ptrJ0OcTQohbitpdmZ8Qk/bu2RzdEfRYUw==
X-Google-Smtp-Source: ABdhPJxHhSWNGVcU51fr9sYFU0rmMHNETNH1++zRq9jf0CRJIUwZGQd1/mzQ/qdrsvl7c3AVBuhOEw==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr10375922wrd.362.1639930043795; 
 Sun, 19 Dec 2021 08:07:23 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id h15sm18579039wmq.32.2021.12.19.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 08:07:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 17:06:27 +0100
Message-Id: <20211219160627.1360325-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sshpass: bump to version 1.09
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/sshpass/code/HEAD/tree/tags/V1.09/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sshpass/sshpass.hash | 2 +-
 package/sshpass/sshpass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index 9635a91806..cb8968bca4 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60  sshpass-1.06.tar.gz
+sha256  71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7  sshpass-1.09.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index 6c14f0fe7d..21e10397b6 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHPASS_VERSION = 1.06
+SSHPASS_VERSION = 1.09
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
 SSHPASS_LICENSE = GPL-2.0+
 SSHPASS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
