Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E15C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BF283ED6;
	Sat,  2 Apr 2022 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfG-5fu0mHmZ; Sat,  2 Apr 2022 21:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F2083EB0;
	Sat,  2 Apr 2022 21:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9FF1BF329
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 21:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7100040117
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 21:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ar6UxhywwP4x for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 21:26:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53F1F400FB
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 21:26:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u16so8973335wru.4
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YXgh3nrf+/Qu/KqlxqllVvnfyAh6HylNpeepOz8P6c=;
 b=gfW/mvDGsPElVKgKaleUsS1lUIlFbD45HosAQbpTgEYLe8vggXLNCsjQd9op+KzY5h
 PHHx1iq1y9u8lyeC2TyovnIWrSYNes/oND2VUwjvkbQ1zYU3m9V+9MB6V1RQXGGegfmP
 Oejk/GWqBeBX3GSUO+u6u0N2vrtA9/kyG4CaBoS1eeXv0GIWqwpZ2YGEPLJ7ZCAqGL/j
 URAAtsm77Z0N0Hc6nwdQvgy0ov1UaW4suI/+9NINCOVKFiEMRzsgGB+z4SdzJgeGykvd
 QEHKLaC9VDqwEeqC9VXKsMC84Ie6pS+gXdtdfK1KMqUtuWCcL2opFiFeJTq7JZl0pJpE
 prvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YXgh3nrf+/Qu/KqlxqllVvnfyAh6HylNpeepOz8P6c=;
 b=2EaAd1lZhVoiZMmwyk16TfiLAhWkrvUAzC8Yx1Ufs8jWX3YlccXMx8CKRh6aO9hp3w
 RkcWXlNATJpiGaUSbFVs7uHAag8d73r0eONjmc+sxqWKd9qCQBwvmUmLf8UFfZ+yJKpJ
 v/vtBJn3Ai3vIeTQxiJFTVFxdROY2sFf89Zjd5tg1u++RPg/zgrtN5vTH6XpVpFLL8X0
 KBYbno5pMczm+HC/BzXjCb3ka72K3Ic/5Tn2Oyf9u8gqyziwOGk5kc61PdkxavVoW9Db
 ghNKKVIfIsJE/q8dXgPyDHhuUXSoasXtktdRcDp39A8ROJUzhwZisVcW5vbZTdVWfPAK
 5qzQ==
X-Gm-Message-State: AOAM532VSaYVTZYSNjBmLoqztKagXHnsrqFpN0/2xoOW71v6WveqWU1k
 r2Cf/YiHRetFPI4Pu4itMx+23NY9rv4=
X-Google-Smtp-Source: ABdhPJyl9NnKYatWfgDMEKSG5p3WFOrj31juE+j5ER6HedOZekVKCkSNI260NL4cKjUDxveuZytilg==
X-Received: by 2002:adf:aa04:0:b0:205:de62:da4a with SMTP id
 p4-20020adfaa04000000b00205de62da4amr12214482wrd.636.1648934787314; 
 Sat, 02 Apr 2022 14:26:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm6425322wrz.29.2022.04.02.14.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 14:26:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 23:24:44 +0200
Message-Id: <20220402212444.1892632-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: disable cpp test
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

Disable cpp test to avoid the following build failure without C++ raised
since the addition of the package in commit
826ef33bedc0f2f39a38622f066978cd9cc05226 and
https://github.com/python-greenlet/greenlet/commit/d9cb12af26da2abbabe9f05101564866f25a74e2:

powerpc64-buildroot-linux-gnu-gcc.br_real: error: src/greenlet/tests/_test_extension_cpp.cpp: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/1140463b8b2407c2a28b9a955efab6037ee7dbeb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-greenlet/python-greenlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 3b1ef7e314..72d2747970 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -10,6 +10,7 @@ PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
+PYTHON_GREENLET_ENV = GREENLET_TEST_CPP=no
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
