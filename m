Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A39DC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 13:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C75D408FB;
	Sun,  4 Feb 2024 13:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C75D408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhftHt7DsLjl; Sun,  4 Feb 2024 13:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A48E4060C;
	Sun,  4 Feb 2024 13:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A48E4060C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02FD1BF48C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D650F850F7
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D650F850F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhEe9E_rwr00 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 13:36:14 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 295C5850F2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 13:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 295C5850F2
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso29482745e9.0
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 05:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707053771; x=1707658571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jukjK/pBB+IIqV7hEczonuBinKyDKzmkJ2b1rKkucOc=;
 b=GclK/jy0E2M2Mt47q3dZjnlzjCz/I+MNnv5lSnZRw3lwEKgCCDCOLbaX969OpK4g8g
 FbseVpaNnZ4fs9pFVMV4wRdIn/skLTzfxXDPlYBpYfy5A6mwQQQkII8BtGkf1dzo8lyQ
 K4m2kAjKwoXe9vCT5SfWVrWktm9SocJS8hynG/ZWPdfIYJxyrzsqXQGro6iAoj3Xc/3U
 HdUnTqR+y37QQ6/6SmMSXje3QeO5FAGKiVfAcIBObdk4aI6HVB2BLL3h6zhYYJNyyhMA
 bFY01OH7HE8+tFlCmiPei0EpkCnIr7nhuESKiy9eqg7CIg1gKRF31pauiaeZkvDEKF+i
 cn7A==
X-Gm-Message-State: AOJu0YxpImyyBr/+WN6lQebWyMWgN33cLByWzmLlvtY6v8dsi6XJA0Pi
 ehizdHqnSCigFVV7wDSHyXJxg9O2yafZ4KL853e4BsfG7ha/8pxoX2GvAGcxQ34=
X-Google-Smtp-Source: AGHT+IEivlSPYjSAQyRshCs3lNiIMVlnRBJIrtVpYL9dzDRgYWfr4FeMBQoWibxztY7AQQvnqJrQ2g==
X-Received: by 2002:a05:600c:4eca:b0:40f:d0a9:1c5b with SMTP id
 g10-20020a05600c4eca00b0040fd0a91c5bmr2142271wmq.23.1707053771514; 
 Sun, 04 Feb 2024 05:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUDTD7wVUNQHQAC8MuwsnSPgi3RkcYMTz1QMYkJHe7LCAna/HBkK51/LcHy9MTRo9kz99qbXgfVH9CHuY6s7dFiqyGu3RoXK4AgL8w5AAN1z/Yof6Y/eG+uX+Vc2K+52ZhSqg686ItUb4b282vwFlqFAdkQKR9GnpFUfPJBZoilyY4=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0040d8ff79fd8sm5750125wmq.7.2024.02.04.05.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 05:36:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 14:35:56 +0100
Message-ID: <20240204133557.1512951-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
References: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707053771; x=1707658571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jukjK/pBB+IIqV7hEczonuBinKyDKzmkJ2b1rKkucOc=;
 b=C0Bv/+D01P7n0DRrbi4N6Lasl4fcQmII/l55If3tNIrZ/VryRwYyupyLRRVdBcpIQd
 sffJYGxjhWc/JVVErIfn11N6MlioLWFSXmxoSCnK7Yz+uVVSTholbDUFg1azxfckpZk8
 WXP/W+iCb+7SIPuo5RDpnbTz9hiiHsFAtmDR0cOInc01UYwi1sgGGu/SIu+PPgH0I1wV
 dtACn0xTYTCpUPg2wlrQYqCVN2TbwaBe3JFwB8CKatk/a4jhNOtRVCe7PrMaHsrBQ+HO
 mlqsDxYj6SFb8xVozNX5ekze2S8uPVF6vnwnM6IPTodS7xfVNK5FsX0jtT1ON9UZ/yfw
 UKBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C0Bv/+D0
Subject: [Buildroot] [PATCH 2/3] package/libcurl: drop LIBCURL_CPE_ID_PRODUCT
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Christian Stewart <christian@aperture.us>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
LIBCURL_CPE_ID_PRODUCT will be set to the package name
(i.e. libcurl) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3ecc587a52..83845b8e87 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
-LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
