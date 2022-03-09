Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C801C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B144052E;
	Wed,  9 Mar 2022 22:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcM2cTaDOrCs; Wed,  9 Mar 2022 22:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE03940148;
	Wed,  9 Mar 2022 22:01:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F291BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CB484342
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uq7Js3GTVIEV for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F248C84355
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:01:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h15so5100878wrc.6
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 14:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KqskY26WUknPzy8YG0Bq4G32uefg9AYXIVfdb/HupQ=;
 b=UTdsufTByUREFkR1Z4VON9yi9NZDHPU2uO37dcH4C+gPBYhxtbO741m0EvOwYJzMds
 C/dvtpd04BdSt+OXkx/Sobxnt3uPLE9XoM6VaBlfbk0C5T7s1W4qz6zhF0R76eThBfIx
 sXRGn/VZtRiipwobOGvl69dkYZAxw+IvZfCma6TOZr9OISgXNnMacB715e2TQl7Hw6Ik
 7YvubnYuCmxK60bk2aPykGivfJWL1zhRnPoeFrFSqPvjlyAKCgP9sUJbucecBwGdNRAD
 aMudHuQH7frQdS3uNd9u15gsduCjKAYE4mWloacPQ1cBJhs+fZnid5KKkQUvJUI/ghxm
 pgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KqskY26WUknPzy8YG0Bq4G32uefg9AYXIVfdb/HupQ=;
 b=DWMUbhy07J/G8dveLbnygSHjl+4IHlcOQoqIQce/8hzUvn3rpysrlYfj8t/dC/Fm9v
 zRB3HZmDjfnAm0FH0mUTQOPmlEC+RhGc4XuvjbuxNIhD+be2bddFJHbf67IO0L/uwr7E
 gfejLmCPVmyw3/+ktwmqKksr6Hnml8VMtf9AC+jzctTUO3/xy4Ird+yog7iGhQuUA7Zu
 FGZT0E05uqs606AYC6iPoVkWHCH0ascOk+oSkOOtM1isGQdENaXatR0yUdzyXek2dXP7
 ItUEYldfWYhmUxT8VwektdDu9OW1MUyWF18tVeGTaLpSMfHJ3rPgAe1g4d27dR6beQMs
 cTag==
X-Gm-Message-State: AOAM533D8MS7RQrgsyKUozQZ6ye8KNxnvmbiL8sm+29EvPU3WKiNgOHq
 i4/4sZha/WoL1fyXB97QPAKA9V5/bl0=
X-Google-Smtp-Source: ABdhPJwKIL2aMtUBuNdEl5nv2oVw5vK2cPToSg550L8iIacbnlIsE/NWBHsn2pIeichf6Ddqbm2SVg==
X-Received: by 2002:a5d:628d:0:b0:1f1:d81d:c954 with SMTP id
 k13-20020a5d628d000000b001f1d81dc954mr1220665wru.273.1646863266001; 
 Wed, 09 Mar 2022 14:01:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm2553128wrw.57.2022.03.09.14.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:01:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 23:00:17 +0100
Message-Id: <20220309220018.786891-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
References: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/3] support/dependencies: requires cmake >= 3.18
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gerbera requires cmake 3.18 since version 1.10.0 and
https://github.com/gerbera/gerbera/commit/ac05976dda335ce1c28a5cc78e4e009a145e3559

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index dfc252e919..5760e4ded1 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.16 or higher, depending on the highest minimum
+# Set this to either 3.18 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.16
+BR2_CMAKE_VERSION_MIN = 3.18
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
