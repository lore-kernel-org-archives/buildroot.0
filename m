Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF04C77B73
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 04:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D334090D;
	Tue,  6 Jun 2023 04:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D334090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsWEnnGQHbg0; Tue,  6 Jun 2023 04:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D41F40902;
	Tue,  6 Jun 2023 04:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D41F40902
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 473181BF3F9
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 04:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19A1140902
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 04:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A1140902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIsuUaDjRXDE for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 04:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D55402B8
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15D55402B8
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 04:18:22 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33b204f0ca0so28678015ab.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 21:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686025102; x=1688617102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4Jf7BYqrpa86O6N5hONPugkGN2Brd1mM1AzOxzRMn0=;
 b=BRuENfd3u0ZmkA06yuB9N0APR7ljFRIKo2k9JBPPpQA1V9T+QJYN5jjUu52zD9Pk93
 oPbf1G3yumRyKvLucQDIybWtfDfA9P8BI6mf69ZmuyHQyd1gQdWFbNLlxCZ7DxAQ5R3G
 XqJGy5Ylxyu9z5Uk9o4eII9KVJh6y7OWszfxfRSbK4QvFWJqKfGTyJFmgsQbKHrivJQp
 H1DkpDKYIKjDJMgyBfr13tTA7wjpMZaf1+FuH7yZRMW2dhb8VAWHF12wzUlopFPtfzrX
 nL6caYbraV4HaVxGIkWtFuXg7Z45MnkAM8ZiDCg8DzYsZnhm1UBHSKmROuRaJeT5IydZ
 ivBQ==
X-Gm-Message-State: AC+VfDyJlbJo05uHoXnLyfdQXjQn54ENWjIh9h55JfLaJQ+5RP4LhP7A
 vmzEOIt5HCSQWTQsdG6VRPXRtpEmJvhzZQ==
X-Google-Smtp-Source: ACHHUZ613Rity/Pn0/4jYRXQpg7ajTUKcHHwQDL+TjzQYXOTdFEANyXb4VM/m7dLUs2JKHb3Zlancw==
X-Received: by 2002:a92:d811:0:b0:33d:4110:bb47 with SMTP id
 y17-20020a92d811000000b0033d4110bb47mr1663469ilm.2.1686025101818; 
 Mon, 05 Jun 2023 21:18:21 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 y14-20020a92d20e000000b0033d29f0a735sm2813030ily.54.2023.06.05.21.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 21:18:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 22:18:19 -0600
Message-Id: <20230606041819.2785554-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686025102; x=1688617102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q4Jf7BYqrpa86O6N5hONPugkGN2Brd1mM1AzOxzRMn0=;
 b=c2bDdTuQqW2bAzaxP2v6xs5lK00LzZR948n+DL+lvf4iXohPmRB9+vRKTTsqB+13ys
 NOh321Ctfnn9GTS3BqBHkt1qOE6EaFZpE4d1lFEgEWcWgeMkvqp8+GPY5e+8sMLW/nZ1
 +9ORvOqNN7gpwYZdQSNoXO/NCWQghDtvFSY1btsNK3lWdrCPqys1C7woR6+z0XyOM1Xa
 x4mPlPn9iRuTBPl7z4x6RmwjzWcB77tQLXUEuogS73zKVWFQrkMzlrmtH6p+dITim5F5
 7GOuoGcGDBiS0LLoFLloiXjYqNLWAfadQNdzPVmHnWGrC06pXJ4SJrkYR1EjJpp7JNHZ
 dCLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c2bDdTuQ
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/zxing-cpp/zxing-cpp.hash | 2 +-
 package/zxing-cpp/zxing-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index 5457ede44a..4018e95fde 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  126767bb56f8a1f25ae84d233db2e9b9be50d71f5776092d0e170ca0f0ed1862  zxing-cpp-1.4.0.tar.gz
+sha256  12b76b7005c30d34265fc20356d340da179b0b4d43d2c1b35bcca86776069f76  zxing-cpp-2.0.0.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 1051376808..b11814d114 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 1.4.0
+ZXING_CPP_VERSION = 2.0.0
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
