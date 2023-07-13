Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4EC001DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 16:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3510A83EAA;
	Thu, 13 Jul 2023 16:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3510A83EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96GIseP7NblP; Thu, 13 Jul 2023 16:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 598A183D3F;
	Thu, 13 Jul 2023 16:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598A183D3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 826351BF3BF
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 16:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B7DB83D3F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 16:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7DB83D3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtgoL3u-W0Fr for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 16:12:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CF983CAF
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1CF983CAF
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 16:12:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b70404a5a0so13803361fa.2
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 09:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689264723; x=1691856723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UTgd28Srm+GpaOLmjHuu4p6fsu/A/hzu0SOM51APZA=;
 b=MaocK+PH+bEOhguDdyt6QDbDiY+D3UYes2KjavegzXN8s8bCAOSeCEcVSMax26W823
 rwX9QP0it4Sh6hGzIRIZ/yl6RZReTD4M0kDeA/I4AP1U42r9MMZfqAnYaZdRHnqnynMt
 PpVXwuHi2uCOZJo+TyoXPj/pYgMPyt1/WVKCSCrPSmpUVfDUsWw9kEb17ljaO46jVKSt
 hKs24j9LfraeAEaf3PE/Ce9O6ZqMRe3sQVZZV8TX/v9Xkhy3+fy8qyrcCQozm9lM6qeK
 4U2Uy6+g6IPKzBtdS6DnHQOMawo53iJGuWs+zhp83cbLat/8+Gkw50WYrDy/2kf9LpJk
 1CRQ==
X-Gm-Message-State: ABy/qLaK6Je1COndBBkIbfOezr5DrI6Z7o2ozu+jXfUDV66Q/ZpjPqf0
 f7SZ66GXrWaOc1aIhg7LNFuGuEbp4P88X+NVhcDwWg==
X-Google-Smtp-Source: APBJJlHB+S6npv8pOZcYe8Wv2kj7peqWeZZBRvXEpH/Z/tXq5tq+o1+th5Z7B9TMBlgHJf6NBzlV6A==
X-Received: by 2002:a2e:97c7:0:b0:2b6:e0b5:b76d with SMTP id
 m7-20020a2e97c7000000b002b6e0b5b76dmr1784793ljj.45.1689264722849; 
 Thu, 13 Jul 2023 09:12:02 -0700 (PDT)
Received: from wintermute.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id
 gr19-20020a170906e2d300b0098e2eaec394sm4236968ejb.101.2023.07.13.09.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:12:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 18:11:39 +0200
Message-Id: <20230713161139.182388-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1689264723; x=1691856723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7UTgd28Srm+GpaOLmjHuu4p6fsu/A/hzu0SOM51APZA=;
 b=FaLiUOY0+zu4wtq6UFFUVVrlFYc+I206PYYEafJWYIjsmTobIa1cmscWSWt38V65Bf
 l1jMGFgYq8rNwB9zjHCMDtRFiQ7I2EHtHrzWYCNtTG67LXhiH7TGgw+RJaz2pLyVq4C7
 8o6cuF+eZJttq5dtLPB1kjOpnEaq32GTLVTv5VETD4QUphCK1w4DDdGLzvbwYkuoybXB
 CswD1ifzYaG2RAfp4uWoBcK2UiMDB5NyVIJqZlWynS7kyygML3twR4APtjl2bOsZjnwe
 4gsL3ka8/sbD2oYP7alJOdXhoC98TTxMhuL8DgV/pVqgog0vdxCe9E9YrylgHg/Ouo5l
 NWrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FaLiUOY0
Subject: [Buildroot] [PATCH 2023.02.x] package/libmodsecurity: backport
 security fix for CVE-2023-28882
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
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following issue:
- CVE-2023-28882: Trustwave ModSecurity 3.0.5 through 3.0.8 before 3.0.9 allows
  a denial of service (worker crash and unresponsiveness) because some inputs
  cause a segfault in the Transaction class for some configurations.

  https://security-tracker.debian.org/tracker/CVE-2023-28882

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 ...-variable-inits-in-Transaction-class.patch | 48 +++++++++++++++++++
 package/libmodsecurity/libmodsecurity.mk      |  3 ++
 2 files changed, 51 insertions(+)
 create mode 100644 package/libmodsecurity/0005-Add-some-member-variable-inits-in-Transaction-class.patch

diff --git a/package/libmodsecurity/0005-Add-some-member-variable-inits-in-Transaction-class.patch b/package/libmodsecurity/0005-Add-some-member-variable-inits-in-Transaction-class.patch
new file mode 100644
index 0000000000..5415d74f36
--- /dev/null
+++ b/package/libmodsecurity/0005-Add-some-member-variable-inits-in-Transaction-class.patch
@@ -0,0 +1,48 @@
+From 686612ceca3ec5bf8a64aa4a3dbf24e95f9017a3 Mon Sep 17 00:00:00 2001
+From: Martin Vierula <martin.vierula@trustwave.com>
+Date: Fri, 31 Mar 2023 08:27:35 -0700
+Subject: [PATCH] Add some member varialbe inits in Transaction class
+
+Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
+Upstream: https://github.com/SpiderLabs/ModSecurity/pull/2886
+---
+ src/transaction.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/transaction.cc b/src/transaction.cc
+index bc28abe0..051568ce 100644
+--- a/src/transaction.cc
++++ b/src/transaction.cc
+@@ -101,11 +101,11 @@ namespace modsecurity {
+  */
+ Transaction::Transaction(ModSecurity *ms, RulesSet *rules, void *logCbData)
+     : m_creationTimeStamp(utils::cpu_seconds()),
+-    /* m_clientIpAddress(nullptr), */
++     m_clientIpAddress(std::make_shared<std::string>("")),
+     m_httpVersion(""),
+-    /* m_serverIpAddress(""), */
++    m_serverIpAddress(std::make_shared<std::string>("")),
+     m_uri(""),
+-    /* m_uri_no_query_string_decoded(""), */
++    m_uri_no_query_string_decoded(std::make_shared<std::string>("")),
+     m_ARGScombinedSizeDouble(0),
+     m_clientPort(0),
+     m_highestSeverityAction(255),
+@@ -175,11 +175,11 @@ Transaction::Transaction(ModSecurity *ms, RulesSet *rules, void *logCbData)
+ 
+ Transaction::Transaction(ModSecurity *ms, RulesSet *rules, char *id, void *logCbData)
+     : m_creationTimeStamp(utils::cpu_seconds()),
+-    /* m_clientIpAddress(""), */
++    m_clientIpAddress(std::make_shared<std::string>("")),
+     m_httpVersion(""),
+-    /* m_serverIpAddress(""), */
++    m_serverIpAddress(std::make_shared<std::string>("")),
+     m_uri(""),
+-    /* m_uri_no_query_string_decoded(""), */
++    m_uri_no_query_string_decoded(std::make_shared<std::string>("")),
+     m_ARGScombinedSizeDouble(0),
+     m_clientPort(0),
+     m_highestSeverityAction(255),
+-- 
+2.39.2
+
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index e83fda895f..3680840f76 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -15,6 +15,9 @@ LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 # We're patching build/libmaxmind.m4 and build/pcre.m4
 LIBMODSECURITY_AUTORECONF = YES
 
+# 0005-Add-some-member-variable-inits-in-Transaction-class.patch
+LIBMODSECURITY_IGNORE_CVES += CVE-2023-28882
+
 LIBMODSECURITY_DEPENDENCIES = pcre2
 LIBMODSECURITY_CONF_OPTS = \
 	--without-pcre \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
