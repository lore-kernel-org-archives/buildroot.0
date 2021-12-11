Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF17C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6258D80C29;
	Sat, 11 Dec 2021 18:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W93bjbcf7iJO; Sat, 11 Dec 2021 18:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E4780C0F;
	Sat, 11 Dec 2021 18:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDCCC1BF426
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6FFC80BF5
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsNGnwaDUCaM for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:13:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA40E80BF4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 18:13:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a18so20197988wrn.6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G08TwNefJ9DEMNfOgaOGeeS7UEyj2FNK97vcoFItGjg=;
 b=YlVExvRvygP1hbMhYCOLq7ZGTh2t4dAwiW5lV0y4NUCi7iIVya4BK0CpB0czTn3SaT
 qe7W4svYekYMj74ltl36Sj59VYLcB5ETsSoSXxwoGgwYf18nMASh4geq/IWqTPNCZ33X
 mM0PVPmCVvADCFQqijtFp1nveTx/VWDpZpu5x0dFzptc3gx7awHohyPmv6btYIGEAKkL
 MGTePSHIKpb6k7iQUZIAcqvvnQDExqbWg35+YDwg/DI4vuJl2wWEVBm3L7wtjF4icKZJ
 srIM00koRMwoOE3MabAcE0AImBM5rxYryXzA++WvUZuQ14/aHi66QMPjTHi3KpG1Yi85
 Jpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G08TwNefJ9DEMNfOgaOGeeS7UEyj2FNK97vcoFItGjg=;
 b=m4Msg8YHs1333GY/mSMwsJD9x/dvKtioH0YziBVf8bMpMHAdDxzbf2M5hM/jx9G3hA
 bezCzep7FBXItNWg/7zYFNgmsSeCZXMlTd3hcFzpf9sl0iLdRLXtZxU9yMOGceVlUjh6
 opvp3Wa4ct5vcoZ1vcZSqw7CBpiahk+qxQPx4kgjOBiUwjszHqRC++qtqZirs6NJoBfo
 avmpyrjwuxcxCOAYlcAR4UnA9bQ1V+RFDgwZF/bDeeD1Z/3+UyohlQgXvW2JFcRKjxp4
 7SLWHAYEaRCLgms1TfqZg0ZyBV98+1Ux01XEnlOCgwDXWlvR8C2uie/ey0QhT9dU7W9I
 MkRQ==
X-Gm-Message-State: AOAM533S6okD7NHdlAQdhX4NI5mgqSS11f7CJLTEABRHpaDrm8PAOr4m
 euTCTyAv12CtMNk63HGewA0XzLlI+D/uVw==
X-Google-Smtp-Source: ABdhPJz5nvnCCAHo985UYrsNwenqUNawDXzNqCxExcyXSboWAn+c9DcbNKpWA3EdYp2sNcXMK79hGA==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr6395295wri.634.1639246418680; 
 Sat, 11 Dec 2021 10:13:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f7sm6840059wri.74.2021.12.11.10.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 10:13:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 19:13:23 +0100
Message-Id: <20211211181323.51024-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: bump to version 4.18.0
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

https://lists.gnu.org/archive/html/info-gnu/2021-11/msg00002.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtasn1/libtasn1.hash | 4 ++--
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index fc3610b965..fa39dd2c73 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz.sig
-sha256  ece7551cea7922b8e10d7ebc70bc2248d1fdd73351646a2d6a8d68a9421c45a5  libtasn1-4.17.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.18.0.tar.gz.sig
+sha256  4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898  libtasn1-4.18.0.tar.gz
 # Locally calculated
 sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index d9d14fde83..5cc33d505e 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.17.0
+LIBTASN1_VERSION = 4.18.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
