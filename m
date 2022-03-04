Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3653EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CCC416CC;
	Fri,  4 Mar 2022 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eddA3AxGxjxP; Fri,  4 Mar 2022 19:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA28C416C5;
	Fri,  4 Mar 2022 19:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20131BF2F8
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE67A416C5
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLNUyXBIHdal for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 19:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B68E2416C2
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 19:40:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so2836222wmq.2
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WAXnFo1Wwnv+6r4fQr3cklXnhesGuRT4JFmEqGI8RiE=;
 b=Yx8qn9q88nrMcEgz4sIwnH+alLQe0RLshnsUQtu1MdiqBSGpoCsDTprn/Pnf5af8zl
 tc1RHSpEDpHTAp5Gse6Ab7iii0X8D1Z3PZRNK4b8Zio9Ym/Sfrdy8u08py0uiC4YHXXj
 OvSfwo2Gq1gy8rQXt4eBNBTQuA4gwZ+YaPS5gC0MaNFV4y0kOyPKJ7uOikGjfoMrLVM+
 JNc/CNvOqGC8g9XB9y3lIkKz+ZxeavoTx1jOqgaiM+6COleSqxM2JFePlZgUFHSZYO7J
 NIhbXpIW9GMSUnb/YVTvYcrMU/40UJ3PodKyggO51kpCxM/IJ4KvdrxWkNFw6R8C0cwc
 iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WAXnFo1Wwnv+6r4fQr3cklXnhesGuRT4JFmEqGI8RiE=;
 b=Agoovy3aI1FAF9KzyR4fATk3bvr4ZK6a6gSlw8LVa8j+8E+lC3SedlVTP7G6zeYPlt
 TE8mGm3p9xtTtDL4U77mtRtqnc0Mc3IJjwf60jSYITsP/rhNKJWdBtI40hbZNcbr618U
 q9Ktp6Tc6S/mZumdsyZ/IjcIRFXznB8dQuaSOtxCkpC6vQHkJvfUPq3oUaXCSAXdLCsL
 Eeon5woS3YLdNAQm04tE1fCeL5ghb2iZkM6vNQUeqtTST7aoVDLkrPR+cbZNM/dCg+Df
 nJfHhniroR2nifTEqD+f9FKvMyGdvbBLHIV223bGhg4GVgTX/1XfMIaASDXwvEvZK/sg
 S7kg==
X-Gm-Message-State: AOAM5337S/PWSPM8HIPrKHCl47jf/TpZkqZ0DwxoHAufdXgxgHlBBdap
 UCY6ywsCNwDgj0BFIVkO0urao4XABK0=
X-Google-Smtp-Source: ABdhPJwboV1TGFxIIGBi3s/hW3dp1m2lOIuAsgVUPvl+0z020fuy2IBc7Cj+b94pMptbUYjBRG/RHA==
X-Received: by 2002:a05:600c:1da3:b0:389:8afb:2ff0 with SMTP id
 p35-20020a05600c1da300b003898afb2ff0mr1482886wms.171.1646422837679; 
 Fri, 04 Mar 2022 11:40:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm5227524wrq.33.2022.03.04.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 11:40:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 20:40:02 +0100
Message-Id: <20220304194002.4028347-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/faketime: bump to version
 0.9.10
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

https://github.com/wolfcw/libfaketime/releases/tag/v0.9.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/faketime/faketime.hash | 2 +-
 package/faketime/faketime.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index 0628ff9ae6..a7d8d62dba 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57d0181150361c0a9b5c8eef05b11392f6134ada2c2d998e92e63daed639647c  faketime-0.9.9.tar.gz
+sha256  729ad33b9c750a50d9c68e97b90499680a74afd1568d859c574c0fe56fe7947f  faketime-0.9.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 355477ba3b..6fc684f852 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.9
+FAKETIME_VERSION = 0.9.10
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
