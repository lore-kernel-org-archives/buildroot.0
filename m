Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF6AD4053F;
	Mon, 24 Jan 2022 17:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJzJ4OeAWBdd; Mon, 24 Jan 2022 17:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD45E40510;
	Mon, 24 Jan 2022 17:25:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFA6B1BF296
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B97BF401CA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0ED6h2kUaIC for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:25:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6380400E9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:25:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a203-20020a1c98d4000000b0034d2956eb04so350395wme.5
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jdOxy0eNElnD6R+7huGF6anJ8Wn6X0+gPzCg/yFtiP4=;
 b=V/oj6WPll8QK2ajt1GqNBXsalGKNHB7TmkyXFz5IgkIyBR6EupNrpJ1iCJrDmEGKAO
 U57EfQFIMEjKberRLXp+K2cOiX7b8ok/c1J+w5vgnx34FAoimipJgN2oKBOiUHNMFxo+
 1NKax+ORX1L3pcVAEccC9sESGMQM92r7taiG9Usj/1wooJB1NUPJhBxY74/MkKgBvziq
 HhPRHTra+MXCwoEpj3jKHJVABht/qI1zIW7+xsEPaGS9iUOGDFB1vWNnBAObp5UgYXyv
 L3uZo+TpIRS7eUqJ+HiyGVYrXB7m9p30vn/pEZeJhLVuM6u/TB/KXYRW8GrWBJthGUF6
 DTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jdOxy0eNElnD6R+7huGF6anJ8Wn6X0+gPzCg/yFtiP4=;
 b=8PkND1EY3Zz8wugwmioOZhveLr/8gqBolpfyMTV8YNLFSc4VBF+2GBKv7SkzrxSdvp
 ESkPR2gTghpSFCuUa0A7hdaWUEth3h0O5fcslfWxMDnaV8HRVO6i5KCVs3K1Ub/a9QYI
 if8J8qGF2bf7KS4S33LgTaMcUsBVq/qYZhKYjWDKi8Acvx+3aAUnTAup8h6jupZZWL+V
 LgBX+x0+vXcHA0Qecbk8eOR0ua9H4RdC6+UZUAQGeIA8g9+A+2nCQznohpTTKym8ce45
 MDHUaSCfAMcK59ntjWc1krg0r047i2BS+7VbMmc1NgzcpM8WQ+CttLnN/3sa/DeAT64f
 wBnw==
X-Gm-Message-State: AOAM530EBLMisabrGRTkKfvLfstXKjfqEV6zdFvyE0s89QYPx5kQkmo0
 nYS+Ypmx3wp3MNKpmFQXGCv1KCaW3P8=
X-Google-Smtp-Source: ABdhPJyxR23zAe6ncjs+W6SQPhflyWdyOb409ymXYKvTHOGFR4HP0sIFbN+o4rROjD2/fLwQuQZqKw==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr2754812wmm.37.1643045110786; 
 Mon, 24 Jan 2022 09:25:10 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r2sm21773837wrz.99.2022.01.24.09.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:25:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:23:22 +0100
Message-Id: <20220124172322.2302364-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124172322.2302364-1-fontaine.fabrice@gmail.com>
References: <20220124172322.2302364-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/tinyxml: fix CVE-2021-42260
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

TinyXML through 2.6.2 has an infinite loop in TiXmlParsingData::Stamp in
tinyxmlparser.cpp via the TIXML_UTF_LEAD_0 case. It can be triggered by
a crafted XML message and leads to a denial of service.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...always-advance-the-pointer-if-p-0xef.patch | 37 +++++++++++++++++++
 package/tinyxml/tinyxml.mk                    |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch

diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
new file mode 100644
index 0000000000..ea0f6476c8
--- /dev/null
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -0,0 +1,37 @@
+From f7ca0035d17a663f55668e662b840afce7b86112 Mon Sep 17 00:00:00 2001
+From: Christian Voegl <cvoegl@suse.com>
+Date: Wed, 27 Oct 2021 11:25:18 +0200
+Subject: [PATCH] In stamp always advance the pointer if *p= 0xef
+
+The current implementation only advanced if 0xef is followed
+by two non-zero bytes. In case of malformed input (0xef should be
+the start byte of a three byte character) this leads to an infinite
+loop. (CVE-2021-42260)
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/tinyxml/git/merge-requests/1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tinyxmlparser.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/tinyxmlparser.cpp b/src/tinyxmlparser.cpp
+index 81b7eae..8aa0dfa 100755
+--- a/src/tinyxmlparser.cpp
++++ b/src/tinyxmlparser.cpp
+@@ -274,6 +274,12 @@ void TiXmlParsingData::Stamp( const char* now, TiXmlEncoding encoding )
+ 						else
+ 							{ p +=3; ++col; }	// A normal character.
+ 					}
++					else
++					{
++						// TIXML_UTF_LEAD_0 (239) is the start character of a 3 byte sequence, so
++						// there is something wrong here. Just advance the pointer to evade infinite loops
++						++p;
++					}
+ 				}
+ 				else
+ 				{
+-- 
+2.34.1
+
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index b8b8e43c05..d173254e31 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -14,4 +14,7 @@ TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
 TINYXML_CPE_ID_VENDOT = tinyxml_project
 
+# 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+TINYXML_IGNORE_CVES += CVE-2021-42260
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
