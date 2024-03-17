Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE7BC54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 12:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F485605F6;
	Sun, 17 Mar 2024 12:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9Jus7q0YCri; Sun, 17 Mar 2024 12:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ABEF605DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ABEF605DF;
	Sun, 17 Mar 2024 12:56:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377001BF301
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 12:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D45605DF
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 12:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLPyTPeZTjLS for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 12:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8125605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8125605DE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8125605DE
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 12:56:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so3200929f8f.1
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 05:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710680202; x=1711285002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjccMrSSHIGn29BvQPqB5L/lagNlmVPvbc2YJ9OgpWQ=;
 b=ndi00ScQGTlTRUgynfP7LnmlDQQQg5OTsdKPgoO5Wp9aGgUspQKE6dOyQXdhQhbYIp
 HlPK7J4zo0omBwqOFn4bGZch0JgJ+1yCnATXO82eLPmXlw6yeyKt8bX2xXDlAk5LIp0N
 P/x8OxFAzuZS4ohpq1fretN+lWYf0qCqLIgLbtvXjqiosHtbc21erDoAtObnqoFxBGf2
 xUvrYgSHRD6QxqHvtSmaILVeZiDeRWBN1ySjipgQZkKL73PqSS7H84LNCSgKVpAJbKSX
 2lsaHcbkqo9NtPmA8MKdvwkuezu9alRbNX1Tngr3IPT5C6OUHLl8vq2hGXoCbXDL1/eF
 0Sbg==
X-Gm-Message-State: AOJu0Yw/pRFgLfiaFewPInvpvMstp13YDPFAVRZ7dnJIJOZJ2jV+4510
 0mmjex0pAR+SYWwnLKSso/qGygHXNpCBUO+Lb0LztIWV0H1z2SUNEq6+GmxL
X-Google-Smtp-Source: AGHT+IF8WzvF761pEaIXzatdwBQBRqozI6xWfGIKv1ZeAM2mOulyoJtle7J64A9MzELif8GhLVU/SA==
X-Received: by 2002:a5d:670f:0:b0:33e:7e86:1ade with SMTP id
 o15-20020a5d670f000000b0033e7e861ademr6460274wru.10.1710680201782; 
 Sun, 17 Mar 2024 05:56:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fm13-20020a05600c0c0d00b004140a13f998sm3164591wmb.11.2024.03.17.05.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 05:56:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 13:56:31 +0100
Message-ID: <20240317125631.365694-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710680202; x=1711285002; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjccMrSSHIGn29BvQPqB5L/lagNlmVPvbc2YJ9OgpWQ=;
 b=U0q6DM+oSg32TvvsjU4QDgO5xpYSlnPmrHsegZolNCus4uH9rk9Zfgznl6YiM4cJZY
 d0JdGDoe/DPGbcwHX+KHUlmYH/yrd4Bc4pgKsfwtaC0X+ZZBhZ5LUGvgzPUbqv6FYYuM
 nbnCL0wXT1cNuxmaH4xyrQr97Bdb6mdZaDFM0N//137GBNfVIq6QE3FrsEEC45uDtPv5
 pDyHt+lzYthcpfWPpkoXR10EeyR8K0Pp0CarUyqDYwVRURhX/2iv7R4PsCQSHyQ/1u7H
 SbPzt6klDy+xzNKPKSDJ8M8X7olqFnYlnqXGo6RUt3mX00+ry6lZ8SehP8nrk2UNH4Ab
 7Mlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U0q6DM+o
Subject: [Buildroot] [PATCH v2,
 1/1] package/squid: fix build with host gcc 10
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass -std=c++17 to fix the following build failure with host gcc 10
raised since bump to version 6.6 in commit
c13199c9326fa2daa574f08ec8fc063a48d0eb06:

/usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
  268 |                     auto &newEntry = entries.emplace_back(name);
      |                                                               ^

Fixes:
 - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
 - https://bugs.buildroot.org/show_bug.cgi?id=15997

Reported-by: Roland Franke
Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Seiderer):
 - Add Reported-by and Suggested-by

 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3a9edac71e..6a2b522336 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
 	BUILDCXX="$(HOSTCXX)" \
-	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
+	BUILDCXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
 	--enable-linux-netfilter \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
