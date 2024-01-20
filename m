Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C8C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8057641B14;
	Sat, 20 Jan 2024 20:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8057641B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Q9c33cC44ZC; Sat, 20 Jan 2024 20:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8707417A4;
	Sat, 20 Jan 2024 20:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8707417A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCC21BF2AF
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148ED417A4
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148ED417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYYa2k34Vlzh for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:58:43 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F6654179E
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F6654179E
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-339231c062bso1091886f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705784321; x=1706389121;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdDny4MR4Jin9cp/u0YhySkrt2km5VM9Yptz3qlWeFo=;
 b=E3pWkTvMxFHgALVDBwXzTJ1VBzDhO7ASbno85FPeoDxgHdDTphBuRrcMMZJr0lZGFO
 amPYP5Z01EgK8c7cRXMPmFjYVhjj/4RuLD216z0EAzqCOVoiOztWK3DomhsvSjnpRBvF
 RllxMgFc2A19ZhKgXBxxAfxqzXmo32itzDY8c7GRD5lQ03gTlqKtNClJ24eCCQbgTjNL
 F4CJlVRHyXAFxvpUFVvCv0n+1BS56xRPHEuSTwEWJCnqv/ys60LmlbPFkvYU97N4+1v9
 sQ9a1klrpycwUp4+ojcOF7chLbSEvNXqt5Qy+zcb7qLmgm4CS0pEl7MKacuPm3kXpVFq
 DwKA==
X-Gm-Message-State: AOJu0YzuY9XAWpXREAhb7jLWSp1nqH9/q+luCSkqMwbbHmsh78Kk4vLH
 KD+B2zny/ALnQu8xCA9QIqY6mS8DyhQUWLBkiVcsUQ6mT5d4UQtQixRo3X2q
X-Google-Smtp-Source: AGHT+IEr/SO61rFIc5awsxDm2I1fY/u/NyeDsTegmo18vKR6R1kI+NIIKabYNkHdzjC51ysoH+6M5g==
X-Received: by 2002:a05:600c:a39e:b0:40e:4a2c:c894 with SMTP id
 hn30-20020a05600ca39e00b0040e4a2cc894mr957660wmb.124.1705784320691; 
 Sat, 20 Jan 2024 12:58:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ek15-20020a05600c3ecf00b0040e8e358f82sm10727210wmb.19.2024.01.20.12.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:58:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:58:38 +0100
Message-ID: <20240120205838.76973-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705784321; x=1706389121; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OdDny4MR4Jin9cp/u0YhySkrt2km5VM9Yptz3qlWeFo=;
 b=UKQOq+mDvMdoWfFn5N4hXmWPSua+60OoEi5sju7ux69/R/7UV2/B+f7UpR/4OR0d0O
 v/dcsrVBz1YHZ4E8B3NoIBnkzB54di3nAK2z9rsXfex3wzp578T0sWm3Iwr9JcYCbRbG
 jlxvr4n8hoqw1uMWYW37SShDn4mw0oY3nEXiwi/Z4hPDCOn6aDrsBxYt4U/rjMrsnuR3
 Xyhe55T43IGJmY00bfLcXhv2JUBB+p+k1EUxsgVbZ4OQ8lRFiengFipO7/+VYLqyj8Qh
 Czeewzsf07veRTZ4U3+7kK8Wz7sHc6yIxQO8n61BTE9tPD896SlFURwLlh2Mo5TmUA4e
 a+bQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UKQOq+mD
Subject: [Buildroot] [PATCH 1/1] package/python-html5lib: add CPE variables
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

cpe:2.3:a:html5lib:html5lib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/97A353CC-7402-4606-93CA-111308296748

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-html5lib/python-html5lib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 84229eabd0..320ef01c7a 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -10,5 +10,7 @@ PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools
+PYTHON_HTML5LIB_CPE_ID_VENDOR = html5lib
+PYTHON_HTML5LIB_CPE_ID_PRODUCT = html5lib
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
