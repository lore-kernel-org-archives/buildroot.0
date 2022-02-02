Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E988C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B5160B2C;
	Wed,  2 Feb 2022 03:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWO1pl-o0QMS; Wed,  2 Feb 2022 03:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE9660AD5;
	Wed,  2 Feb 2022 03:20:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA351BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C2C440153
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzDmLg2EEn8p for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2D3B4011C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:20:28 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id z18so7170836ilp.3
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qh4p7urec6oA8RGh8sxETc5wDy4G8AiVYm4cFuIIeII=;
 b=kN5srWprs4XAgJOgO4j0F+im9o0Q5B/jjb7MEfdIWqS0bQwohTNm0fP/HhqbHvyUA0
 kUz0H5PCEnSAYQ6qhex/aVk6DPXbpN8Ru+N6lrHptiRt5PFOIqrlMDSOM/Vskfgi+eHu
 TnbQ3m1+pqTIkf8Fhtoa4Xv9gsA2wQNBzjzFBh11zju7rEnUxxVFq0CpRDujsRuK6n3V
 Vza8F/YcrPLa6QBsMSr67wZ4YtZET+JY+0/STjMsSZ2oyi413Dt71RlAjZeqAfTf55gB
 D2bXAyNQuyPHgWNHipqfGrlTTZmGM9uJKYrBenyMF6sbJcxipNSUCQAaCFUd+HuH3sDC
 KMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qh4p7urec6oA8RGh8sxETc5wDy4G8AiVYm4cFuIIeII=;
 b=u2i3bko+fneoyr3nVj3dcnjPgX1QIG6Yby68ttmF9qp4NIOf5I8O6gkWmzQE7rNbDQ
 LOswUAn97F9mOUv24FX4c18L7RUky0LJKPjGn6ojdg1y3qTKSleh8kfv2M+Rkz4jFirV
 q8k0EGtcXCyqnYcM/nsw5zcQTTLqW8eFUp5ArbqdR0foeog9LXBoMG6AVPehvuM5e1sH
 n5IvsFneBWNamh2LwyKftvetoBialxeioN8A+pFr0g62V1ri3zLZOnOwF6tvlMcTL5kk
 5NpBfb59POK3ifSxFAEzY3JZQxrddyMltJlMfmlfrpzLqTizHpF/8syEnXOAfYXXUkzX
 ZIUA==
X-Gm-Message-State: AOAM531JNVe9xXNn5UBgch5FEY/vC6IkGu2jx+LQ5BMgJt0BX63psokT
 n3GorRugG9/yNA2/FzTXLzfdV/WA5/g=
X-Google-Smtp-Source: ABdhPJx/kvgQ1vQ74iFeJpM4Cl02YdmWZfEd+WLbmWWtWAS+VuDCsGO7VTbXF7dhHBHC1n71N+/SwQ==
X-Received: by 2002:a92:190f:: with SMTP id 15mr17228189ilz.82.1643772027818; 
 Tue, 01 Feb 2022 19:20:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id u26sm15402814ior.52.2022.02.01.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:20:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:20:25 -0700
Message-Id: <20220202032025.2182903-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 2.0.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index eb3b67598b..3c6e58a616 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  eaed8aaf95d7e3bc2daefcd8d0f03458  charset-normalizer-2.0.10.tar.gz
-sha256  876d180e9d7432c5d1dfd4c5d26b72f099d503e8fcc0feb7532c9289be60fcbd  charset-normalizer-2.0.10.tar.gz
+md5  2abe3754fef25c99799a518cb83a81ae  charset-normalizer-2.0.11.tar.gz
+sha256  98398a9d69ee80548c762ba991a4728bfc3836768ed226b3945908d1a688371c  charset-normalizer-2.0.11.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 33f2e132de..0a96a6b078 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.10
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.11
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/48/44/76b179e0d1afe6e6a91fd5661c284f60238987f3b42b676d141d01cd5b97
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e8/e8/b6cfd28fb430b2ec9923ad0147025bf8bbdf304b1eb3039b69f1ce44ed6e
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
