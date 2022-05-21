Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3CBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4E740B07;
	Sat, 21 May 2022 12:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUscQwVLqYxf; Sat, 21 May 2022 12:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D25140B20;
	Sat, 21 May 2022 12:42:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0942E1BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC5F3844F4
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxFz8D2d4k1Q for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:42:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF44844EB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:42:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f2so14725916wrc.0
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwWADx2hY03J5SPN8v2xlhODEUO4c/SZLnsbPTj3VVc=;
 b=bQDUYvwBltrH3t3h8UIbPpAbZNeoq5fNHbB2CUCPERQ/Vp5WfBBAJWYgsT2Zbja+24
 q4cmAj/Lcti1kWRsdMh3Ot56FHliLYQPZO+WXKApTAtKSmQSFeXDQOK4sDl55p4qAlxo
 F0tTEsqgGKhaRdruRjaAC29yPoRumcfTp8ILe05p2eBucNMa9egWhYg7QeL7RWnI2Hht
 wrpGkl6KKUO9zn/xdAKKSp53M6ko/lCY+OV+XioyvMox7XwN24ngrOw50ozAC72HfZOv
 UNC8dqDs3/4HqNa7R77a1cj26GBVVsdry8YCW08kubol7RSh1sFNrS1eEeYzDc8vvczs
 EdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwWADx2hY03J5SPN8v2xlhODEUO4c/SZLnsbPTj3VVc=;
 b=HXQ1vykmCbZycW4y7VYvmp8SMoenCGbwujnqfjQQlMhdC7Mw6PTgbl5clexOfn+UO+
 C+5I2w0A2RS1ACFgpjfqiTfAdSmDcewz2eXmSVyEKgXYEhCkRlVm/qJPNMiXyWbhMY45
 NMk56F3fzox2gNFaEkCE8qPyqjnxb9bBm2562wej91gWDW796it3Z/hV9ZGjL9uBmtqy
 dsmD94mOFtr1EDIBO9HmLlqTk6fBeAoQbGqygIpitYwxD5T3HE0HKqXfXULuVCfFxSfU
 rddBl75XovJ/zF8O4FlrTDySIuBhh+Z97k6w6TeoaEGV7AeZKAFZ7zbg+twWZT0wWL0M
 wSTQ==
X-Gm-Message-State: AOAM530rP/0b7Rlna5N0IQOnQKPyuhTW90YFYiiJRFvgBTNmhNlkJEb1
 mlAPBJAjhfVOT+ZXg0zO2x7nB48xwyQ=
X-Google-Smtp-Source: ABdhPJyHb7Vljs5y5zZVOiL2ATlUuzJZcDO8Qc6WX3vTKFx6Jw/Ect7QuErSmdh+H2f7/CaMlJpyyw==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr8699462wrc.632.1653136972685; 
 Sat, 21 May 2022 05:42:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfca0f000000b0020c5253d8edsm5117464wrh.57.2022.05.21.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:42:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:40:33 +0200
Message-Id: <20220521124033.209309-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unrar: security bump to version
 6.1.7
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

Fix CVE-2022-30333: RARLAB UnRAR before 6.12 on Linux and UNIX allows
directory traversal to write to files during an extract (aka unpack)
operation, as demonstrated by creating a ~/.ssh/authorized_keys file.

6.12 application version corresponds to 6.1.7 source version:
https://github.com/debian-calibre/unrar-nonfree/compare/upstream/6.1.6...upstream/6.1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index e354753bb2..40e05a1a32 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d05022442009202a792e588bec58921c123ff046fc755f7f2272871a5bd79636  unrarsrc-6.1.3.tar.gz
+sha256  de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed  unrarsrc-6.1.7.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 6923660153..fee9fb753b 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.1.3
+UNRAR_VERSION = 6.1.7
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
