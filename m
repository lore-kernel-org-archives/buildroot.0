Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A258C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB0DE40B59;
	Tue, 26 Apr 2022 17:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3uhsj_B7fKC; Tue, 26 Apr 2022 17:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF51940B60;
	Tue, 26 Apr 2022 17:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB5A31BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A69610FD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtaayH74Jazk for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:18:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8301F60EBA
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:18:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so2013853wmn.1
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qk6aV3LJODNXYxi/U2D/xxvaqMnJI1fw6bCPT8rswIc=;
 b=PIfWnevohXAGFiusgIWAq0N246Qz5tMSHk4vT563ubYEMD6O2NqKEYnrNgk4cpCdhn
 o+2EcWuj5sfzh9BJVp5kPu669WUhom+40v3CMAOcNqgSrjmVgwRZSkJmfXLXfdXMRo57
 3iWRh3XQANK6S0Olc6xsYfyer1MpJIKf1bsDX2Jg8DnWQnUrWD48rRBMU+JNKp/IAa2l
 BMsKvY0Ty6sTW+VSzP/5D/+dQ71CvyyO7GNzbnaAMLxUE8orb+cwvSARO0ytrBNGwZtD
 dZBdObh9xuoswtgXIz1sFmMZYP1xbAo7lihYq2VHbDDRbnTssjkIskVM1h2h8YVz53je
 IbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qk6aV3LJODNXYxi/U2D/xxvaqMnJI1fw6bCPT8rswIc=;
 b=ZeU8ZjHj42FzcYoOOC5SqA4ckEKiov48UZVka86mBOof2qKbAltOeCTZ2L+yKJDqz0
 W1BYOuwy58uPkXQFunXXtu0OBGuviy0FDv089IyroL2cbXzUQ2gAkoj9kBPxC9X/8NWz
 PDPsn0ONNc0T4ecxwKPXdUElGNwnlSK/wbz0YMyX7ootvD8w0xBRKHCAHzshublVfB07
 zBlgVrou+fiEz7p39qFtdItd06Gynpf7athsjvt9zjN+1hNtPFUOI9hNvCu8qPlk0W8a
 GLddX6EEOs/vlJF2ECEf0vC/WHMLwY7KSksdChMXoceuqREjKFKrwBpEuh5v5BTSEa9j
 FAwQ==
X-Gm-Message-State: AOAM531fUheq/9ytPPPu2Kb7l3+YA+frVIFxFOPxNDb9d8hOdUNhkq8J
 2/msnfQJ7htnF8w0xThQfbxMiltSLoU=
X-Google-Smtp-Source: ABdhPJxlr+PB5AB8f043TLYJyO+e4frXMRMaH0hhEOVTG+z4Do4pGWwT1sy9JnBiwrTQwnbd9XA7NA==
X-Received: by 2002:a1c:38c6:0:b0:392:a4f2:20b1 with SMTP id
 f189-20020a1c38c6000000b00392a4f220b1mr22378843wma.7.1650993513450; 
 Tue, 26 Apr 2022 10:18:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm12582352wrf.10.2022.04.26.10.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:18:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 19:16:00 +0200
Message-Id: <20220426171600.2552919-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
References: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libpri: bump to version 1.6.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

http://downloads.asterisk.org/pub/telephony/libpri/releases/libpri-1.6.0-summary.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpri/libpri.hash | 4 ++--
 package/libpri/libpri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpri/libpri.hash b/package/libpri/libpri.hash
index 47c4a00307..77985df96a 100644
--- a/package/libpri/libpri.hash
+++ b/package/libpri/libpri.hash
@@ -1,6 +1,6 @@
 # sha1 and sha256 from http://downloads.asterisk.org/pub/telephony/libpri/releases/
-sha1    63536f3300fb007dfd5fe8064406992ca938bd9a                          libpri-1.5.0.tar.gz
-sha256  ee224bc4aa65c54546bd09675c3f0b71817ce9e277332bce86989d8dcd556a24  libpri-1.5.0.tar.gz
+sha1  8440007477ebf131020afb00f57672b108b4db2c  libpri-1.6.0.tar.gz
+sha256  7225ea7ec334a115f9dc08e71f55589c38cb4e00b13964cd2f08cc4e6123e3f6  libpri-1.6.0.tar.gz
 
 # License files, locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index 34d84393c4..48a1019210 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPRI_VERSION = 1.5.0
+LIBPRI_VERSION = 1.6.0
 LIBPRI_SITE = http://downloads.asterisk.org/pub/telephony/libpri/releases
 
 LIBPRI_LICENSE = GPL-2.0 with OpenH323 exception
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
