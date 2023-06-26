Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B56EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB837418CA;
	Mon, 26 Jun 2023 18:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB837418CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWFptRmu1LHE; Mon, 26 Jun 2023 18:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62A0418B8;
	Mon, 26 Jun 2023 18:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B62A0418B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 841C31BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4F2418B8
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4F2418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8skSRTwqAJKd for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F55409DB
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38F55409DB
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:15:39 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-78363328c04so34450739f.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803338; x=1690395338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzXiTnPswNqVW1u/Y3v1fYxXD5MmCnYhYJ4kfQ+oD7s=;
 b=GE87jy+f6PmEgAxNFDB4qr3VzQT/Bg8cFidc1Hjtr5eDjEE67HYnni8t+fsAmEaKNT
 9RPd+LynB7iRjbv8xrz5FLbFd/xpUy6zbiHCWMbDpFqIM4nyBuDXCXPhJ3BMTwRnyXwE
 4P//ZfqxZGREB7bOZU+Oz+LkmNgvXZ+v1srHUU1UmCs51eRHPZQfPKE/Z6k+/FHIFTPB
 O1MHug7/RvQRUbntwz+LuxZH3z6IhdiiqzOUSBe5olUaXGNVcqenKCe3citKR7j7DWer
 EdQHWkQuyC+iDDUfbpRAnxKILowxdlBuBT9m7uLrJCFxrP2rNTuUY8E95rxolEXW/QWH
 FyKw==
X-Gm-Message-State: AC+VfDwc0cEgX8BHZbY6N1W7HUSmoSWMpi1OsR3BhcaLSXTOujugylE2
 410gq9j1dL216P0S0KdMqvvihlKG+Js=
X-Google-Smtp-Source: ACHHUZ7HCPyxDqBR3fdPtpdN7nYxysybBw+pAFWiPbvgqqSq+o2VuC+HY0zd5hpskUz//PnsKSgdrw==
X-Received: by 2002:a05:6602:2206:b0:783:36d7:342a with SMTP id
 n6-20020a056602220600b0078336d7342amr8359259ion.1.1687803337891; 
 Mon, 26 Jun 2023 11:15:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 z24-20020a029f18000000b004269bbd4586sm1867653jal.77.2023.06.26.11.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 11:15:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 12:15:28 -0600
Message-Id: <20230626181531.2312002-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626181531.2312002-1-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687803338; x=1690395338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzXiTnPswNqVW1u/Y3v1fYxXD5MmCnYhYJ4kfQ+oD7s=;
 b=GqAFSSrh1wyGTaWJvaHXmNql/IxC7bcsJVp++3SqSUsPd4ek9ei7ZCzP/jnI734fyq
 mhHp/gJ7TV9LKMG22wbuvSGWCTrc3JpR9kFd/7evA4mqKKc+OqKnsDDTruKcI62xBJy6
 UDitpgORNpZzXLo7sLAbbW1P1D5P36n0FHBB1N/quc8RdBEcBka+6NwdbkIR4/F5ibBH
 EpKTex0Bdu3yAPaGWwcfISQkt28iXXWwmenG5XMGh6KOW7GZHfVO2Kxwacmgq1d/KqPF
 /2HppNaEi4pJ90GwPvO435xNXGvZ1/Le7vSkguIhTpsEZQutWazfpCVk/Pl56sjzqyfk
 VYxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GqAFSSrh
Subject: [Buildroot] [PATCH 2/5] package/python-pythran: bump to version
 0.13.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 08348a5ccf..2dfc445b2f 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  d2961ece35b4b9f44a84ef31df1b21ff  pythran-0.12.0.tar.gz
-sha256  eff3dd0d3eebe57372f0d14f82985525e9bcdfb5b1d1010e1932cf9207060f9f  pythran-0.12.0.tar.gz
+md5  3090288af50566af75cb058d1878aaad  pythran-0.13.1.tar.gz
+sha256  8aad08162f010e5425a7b254dd68d83311b430bb29f9252dce2eff3ba39497dd  pythran-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 0d946be28a..25735ad95a 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.12.0
+PYTHON_PYTHRAN_VERSION = 0.13.1
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/99/e0/ed0e81de05cfa4ecbcbceec6603d175387d8bc7a6332cbfd155d09958ccf
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/8d/d8/b27e8dc3f3a03dcd317d40d9df0ae07ebbd85444585973ceba07716934d0
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
