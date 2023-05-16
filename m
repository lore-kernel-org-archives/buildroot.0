Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A582FC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B81418EB;
	Tue, 16 May 2023 08:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B81418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehSCm81hHbt6; Tue, 16 May 2023 08:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3429B418B6;
	Tue, 16 May 2023 08:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3429B418B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 805881BF2CF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66CED81BC6
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66CED81BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsmcH5058QTr for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:23:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538FF81BC0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 538FF81BC0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:23:56 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac7ac8a4ffso144249721fa.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225434; x=1686817434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gniYRd/pkW1M3yZqgLqJ+7zOs3qM5aIofci/TZO3370=;
 b=h0aq0JVv+c3HQEISyTKVHXjWU353b8CyJ/QNSxTgDGE/D9G0V7/R2BZjiUFTBzZCqr
 XOhDiFzeEgYWIFXVx5VR+0vij4nigG+h/yAWIHOPdlEATzuacZ7CMnAzaKWPB3tMOGyp
 ci5C+3P7jxBwAWDS22suQzBx0e0LwjhOrGm2ru8QwVU0yzeRm58EOIaroBSpC+w3i83w
 bvwLA6k+UyLo1ZxIxXhoT/O/iTMPY53gjN89NvJpgBP3dv/aBjT3a2QUmVhFU2/ntaCu
 beX1vt4fr3N2TGiq8K/xKHwqYxK77CTT71FfMnWwBancTxyqCzo+XANdzgQHzxigA2dh
 0F2A==
X-Gm-Message-State: AC+VfDx8XNbcT6zn2r9GxPFZEYYMaRMeEwQofJIJElw3kkzt1NoPWKN6
 9sbeQLbh09pjO8tMwulM5vOukxnGWKA=
X-Google-Smtp-Source: ACHHUZ40hjhK509l6hyA00I2ddsGiJPfg0mrbkeQuniyo2Tl96wfVEFk4T9PcrBiM64Hb4UPCmRb4g==
X-Received: by 2002:ac2:5ddc:0:b0:4eb:2d47:602 with SMTP id
 x28-20020ac25ddc000000b004eb2d470602mr6618199lfq.59.1684225432978; 
 Tue, 16 May 2023 01:23:52 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
 by smtp.googlemail.com with ESMTPSA id
 w18-20020ac254b2000000b004edc6067affsm2880809lfk.8.2023.05.16.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:23:52 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 11:23:39 +0300
Message-Id: <20230516082340.1375834-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684225434; x=1686817434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gniYRd/pkW1M3yZqgLqJ+7zOs3qM5aIofci/TZO3370=;
 b=M6iCcL9pWKXzMkACrAx1e4ibf2MVzhmcc0HVAhsscjhCCsHq7M0IsmXQmLJeytR62b
 GNc57VMBzkayDOQBGjUQW1n/i9QyAa4Qjde92t1syrvzBRF0FklNHKmWFT4nuPu4ew21
 tRf23V4Di24OaHx01Ylhwa7KL6zMrW8OAmqf+1tfVM7E+G24ZoHjxOyJjm/qhkdpPhXa
 z4yT6d28U97HRefpMe651O3NQLphJfa/Mbggr+k2v9I0QNrFHg6NFdE39OIuS6grVScb
 grMPFRjx5quPy4pNr0umorCkShFHo6etAkfqtofxrbT8VC/88PqGPOdlXegsLJWioY1T
 BlJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=M6iCcL9p
Subject: [Buildroot] [PATCH v1 1/2] package/fio: bump to version 3.34
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 891ca4e40e..7f7e12f948 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  859dca5241e5494d86c4aa1531a984cc556789c78e56b30d6070acfbdd193a8c  fio-3.28.tar.gz
+sha256  49f340ef51dbb7942d598abd2b8ad93ce7934ca709f73ba13519568556f9089f  fio-3.34.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 13818b60fd..90ec407207 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.28
+FIO_VERSION = 3.34
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
