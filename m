Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F70BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13A7404CF;
	Sat, 14 May 2022 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6QVI-qgSJXG; Sat, 14 May 2022 19:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7092402A4;
	Sat, 14 May 2022 19:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64D1B1BF20B
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5991D815AC
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOgRtFTE18NJ for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 19:57:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 659ED814B4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 19:57:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so15628591wrg.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNZy704+WicYsIyTD2UTwpuYFOMXYlPC/k+C3xbQFPs=;
 b=AXuaWtdkWqmsF1/RYgfd12G0Zmc+hNalyVosoc4uw8Z5sb68lmaw14WkVLP9Kl9AKB
 5HP8NPZmlRw19a4tVYoFuNglT6RocMBnVfQDqjAXv5xoa/0hEKGvdMD4zQTwau5vYVl2
 Dkasaed6S21siSbYWdqBjvnnNimIBzX5FnDHUrfVsxavzwHqlTHVnjygJGRNkaqjQH+N
 daTrUrCQKNWF7/4pyoFhhZeoKwTNZHuHZoLqivYen5fsMFPcsd+3eFTMT+DPhn4ah17+
 VJcFgi1Qib0UpUzjzjSGgoc8v1ktK9/6ZWi90DxjueQnwvbibqU34x6ydjQIJMYvmdzq
 JsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNZy704+WicYsIyTD2UTwpuYFOMXYlPC/k+C3xbQFPs=;
 b=Xx7dpanbi0wP+z6IyRCi8m/BQhuzKZ5FlzDI40Nx+ajMFc5xL8sxIUUdSl8SEFAKjj
 4PL1LMpgFJxnDXadRrCoCyGdekVR1dsTfKL/MhT4JU2u+dr+0Qg1V7XQ1YrXA4jYWje0
 K4sPMHhFGTC8SKF2kFTa1SsePTi+HEccPlcdNraysZjN/i1q7jGn2uZ9lwya/Ub4/+uR
 7qivt5fUN6ig0NXeveFreUrNYqWRh2UBQsMqaWpjliVW69m4Zzov1PImOPmRah2mDels
 AVjt7k5yQOuYEkHQeVYUh3vKng+7yGwXsqUcqytZvBl2w5D6PAChfjubUdkbBXXQnheT
 O5cQ==
X-Gm-Message-State: AOAM530en2q+l1L1koww5kvkp3xwPr+k/sSNfPpwwjIQGwW56eZXnylf
 T9KQrtssuQl7391rKH49NKwH/5dn/+8=
X-Google-Smtp-Source: ABdhPJwDC+HWOsmY8kkTTOlQf5LM4uxF7LiLkZKmRM9sPInic3tcEzpgk1PgZubSu5txOznHqfyJJA==
X-Received: by 2002:a05:6000:1702:b0:20d:21:11c1 with SMTP id
 n2-20020a056000170200b0020d002111c1mr2317500wrc.323.1652558236386; 
 Sat, 14 May 2022 12:57:16 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a1c7303000000b003942a244ee6sm5950055wmb.43.2022.05.14.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 12:57:15 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 21:57:11 +0200
Message-Id: <20220514195711.169277-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-avro: don't refer to avro-c
 version variable
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Like for other packages sharing the same version number, we
can't rely on Make variable expansion. It's working by chance
since avro-c is sorted before python-avro by the Buildroot
main Makefile [1].

[1] https://git.buildroot.net/buildroot/tree/Makefile?h=2022.02.1#n533

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/avro-c/avro-c.mk           | 1 +
 package/python-avro/python-avro.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 262a0fee5f..f55c579656 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update python-avro
 AVRO_C_VERSION = 1.11.0
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 0c4c431777..973107979c 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AVRO_VERSION = $(AVRO_C_VERSION)
+# Not possible to directly refer to avro-c variables, because of
+# first/second expansion trickery...
+PYTHON_AVRO_VERSION = 1.11.0
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
