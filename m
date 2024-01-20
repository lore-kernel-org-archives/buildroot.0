Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC3C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A82160F15;
	Sat, 20 Jan 2024 20:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A82160F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqYAwI32NBgm; Sat, 20 Jan 2024 20:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B32960EEB;
	Sat, 20 Jan 2024 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B32960EEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 878591BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60CE360EEB
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CE360EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNLRjw6GgFkT for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:11:22 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2124460AF1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2124460AF1
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ea5653f6bso8496275e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705781479; x=1706386279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiXvDgBks4/C2B61FE5M/IEqNxmwFfRGYOX8Vz6Ijgo=;
 b=p49HdGwOWC0NAoyuPJc6m0LXYhlfLuEAPH3hbtj2Qiyk0iNH73+w6Rq4bs5jMUu61Y
 G7F52nJzoTNoKEC0rHX5B04KyWK4p46x0Zssjkd7x9NVuA0m0JkyuIHxvDUmfBDDze/D
 BV5gn9B2E5AlzspInJNEq4nxVlu8vpjTxsZLVcZCXJ50BCf7DYLT7KFW71ziz0zVC77d
 7uHSwIQL2wBf+/2ds6FK/cMXof6h85N9r7wvNc9l+piTnuYFDGIXIIWvVjujM8Fc/dYH
 dfRmDuSDodMnI7paKqyJpML0wMMKZSZFpn4jsH8hOb/Nli0LTxnTnFsvtKdDtozhLFEA
 KTlQ==
X-Gm-Message-State: AOJu0YysGLTOU5dhDMYfMsH+4baJXrQ50fBUy7hTrvu/Se+VKbIOr0XA
 3T74EFgJSICoiEwb+/pmgYa3tOcfO8dxx95kRXRHZh1JINav30jllGvgMCMj
X-Google-Smtp-Source: AGHT+IHJq9o5vwTYPxehhDWjHWdXNySfsVtUsTL+Ns0QiFWwpsDVOM6z/D38deVg+gfKL4/dAwPYlQ==
X-Received: by 2002:a1c:6a02:0:b0:40e:6a93:1c57 with SMTP id
 f2-20020a1c6a02000000b0040e6a931c57mr1012497wmc.103.1705781479398; 
 Sat, 20 Jan 2024 12:11:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0040e76b60235sm22445762wmq.8.2024.01.20.12.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:11:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:11:16 +0100
Message-ID: <20240120201116.48735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705781479; x=1706386279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IiXvDgBks4/C2B61FE5M/IEqNxmwFfRGYOX8Vz6Ijgo=;
 b=dr/HqG0h+I6hl7s0cud66wK66zeEIBP2jkcpncEysUNHyaE3JFiZu44z35DIwvuTh0
 JNltpwM2YJeS2YKjxIgfurNSs5dJk3qVJVrvHV8a0n/iQBMmwlkjjBnCjse7iN5PJy7g
 Jr4gehJkECLZcaAM+2X5CjZSQHSzuihAUgIrSbbu05i+Ml7zZiD5npd6wt186S9NU39Y
 eepWGIK1RccO4XohPrhq1XrOeVRuc4JOQXyL7IX6hVqroQkyg1fvjglwbhSCRWewSRQO
 rtX6lyoRzumGYRkSOz5ZjctdxwO7rrq3PixbwOrQCGyTELAjxSreVtGp6Esam8HTaLi3
 h5lA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dr/HqG0h
Subject: [Buildroot] [PATCH 1/1] package/python-sqlparse: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:sqlparse_project:sqlparse is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/BB69AE3A-3268-4EDF-95AF-A05BB61B686F

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-sqlparse/python-sqlparse.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 23b1338e49..48b1a24822 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -10,5 +10,7 @@ PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b6
 PYTHON_SQLPARSE_SETUP_TYPE = setuptools
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
+PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
+PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
