Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E700FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 02:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6632D833A0;
	Tue, 17 May 2022 02:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGfScnr7ugx8; Tue, 17 May 2022 02:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E09B83381;
	Tue, 17 May 2022 02:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D67811BF33F
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 02:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4BDF40573
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 02:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLjd8yiw9M3c for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 02:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21D6B404FE
 for <buildroot@buildroot.org>; Tue, 17 May 2022 02:05:02 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id z26so17896060iot.8
 for <buildroot@buildroot.org>; Mon, 16 May 2022 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BTq6yeLe+P0pMNwSAaRY8hgptwGGV59IAdu1dYnYcM=;
 b=bsXzjC8mPQ5TTkCn3y5n+zDCkxf8tOfQ2YvUM4NjZoS4xh9wT5+/5k2otLkZJMSNBR
 oc+JXP5UG8kh9HmEwD/hRAxZLd1yG+csMgv5S2U3F8ChasbcGIdNgYfL+nzk3UFqrPB1
 BkeHXnOXvv14svWiwMvGzdlo52kW+Z4bT8wJmREOVWiRri52GEHNRB9/SKrBOgm29T9E
 4ffR50r5MtS/jXMeZeoFSCY0SPt2NDYE2yvm2GDJXJ9BlFx1lY92f8Kf6mqEXYWLWQhC
 7GivLJhH7vUfRITlHS/sFFkX73/WBPc5MJHCgEjB5xydp3E6TVk+Yl/GWGvAZAFF9Ldx
 Xtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BTq6yeLe+P0pMNwSAaRY8hgptwGGV59IAdu1dYnYcM=;
 b=cAUsFNVcrDTR9oxmTdRdFcAzkD7Lky0EwbR04PbXK5bETBWGmVB1t5yPPAkO16u3C0
 50DZd2Y/Po+Ng3iFO43dxqLGMagILjWIIzpwTo1S7BcHIRCAeoqLLvIMpIWlMKk2NakX
 5xqbkNvjKcYykcPoPWXMNr+acInjKt4GMB4u8fP6kEaCesD/fmbFCrDQ8VhRKuUeBCwP
 hCxGge8P0muspi7fqnKZAtqhy9qC32nxsv/bRUadKuUT9k5hfIm+RsNOIlh10G0vR8BB
 aUR/cMvRSbFhhqGiVYHO9EBlkMMZdNtOArxStV9ykZ5Qbi6gTOOv0qNw5cGq8kSps6Vt
 GUkA==
X-Gm-Message-State: AOAM5304NLoPMrdjQRIhWrUvLsQl2tBqbFrb8QPzK5dpM+jzqfhShi7L
 dwA2xqHRw00Ri3gdNEGEXPZbM2Uu/hI=
X-Google-Smtp-Source: ABdhPJw6O190za9HhWw6H+cZoNliSgeTo5CdeWOExO9l0CzqbeT4hLiuGI06urhYB2APwcBuJcty3w==
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr9102759iom.209.1652753101879; 
 Mon, 16 May 2022 19:05:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 q18-20020a056e02097200b002d121a24278sm270531ilt.53.2022.05.16.19.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 19:05:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 20:04:52 -0600
Message-Id: <20220517020452.334921-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{glibc, localedef}: bump to version
 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
Generating locale C.UTF-8
[error] LC_MONETARY: value for field `mon_decimal_point' must not be an empty string
[error] no output file produced because errors were issued

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f28c15c2a3..e0bbf341eb 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  0ca43b2a6cd74609519554303a16e350abdac0e66943c5d98d91228233c826a0  glibc-2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586.tar.gz
+sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5772c3355b..f3a08fbf24 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
+GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index fb5edde0c2..061b7c7fc2 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
+LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
