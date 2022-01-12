Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57554C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 21:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1FF0404CA;
	Wed, 12 Jan 2022 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXZA_G6C606Z; Wed, 12 Jan 2022 21:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76C66404B5;
	Wed, 12 Jan 2022 21:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC91C1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB58784BE2
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnAbmcP508Wt for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 21:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA34E84BCB
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:30:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s1so6582923wra.6
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2xDn7Z6JkY3gbWLvCRdRGHjUmjY+XgcraRJYBXVVzHk=;
 b=DHKYj94YH0mhcabfxKeqO7fxgkdcG87y/+H4MRiJoT3iyKEk8/GfzfW3zuK+pGMMnc
 CwGpAMFp1/WGmyDCv+QCrKfxegFPvVdFDswfA3OVn5mNf8B87Ve1uG7J1J1tGn3sUcgD
 wJ9X7dB36c2NNt6HHYjpQgqmxDkZzkWDtiiQfC0fNrMyqfn3Xy09Dc93NUUgR1/wZF9+
 6RZEB3QwPiji5dogkkplf5+amr4hV1GHLvZCLHgUFUg9W3EA9YIZaUyy0fscQF+oNTXA
 XPZ/K4C0fKwD3rC9QgQTZ7lZHzdQohnMplDmUB2IEHaVdxy0EDSjrJI1FpHbLKLJcvCW
 SizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2xDn7Z6JkY3gbWLvCRdRGHjUmjY+XgcraRJYBXVVzHk=;
 b=BqZbSZfQYWbJg3aSE1/tnvWzrXcW3HDM9apmk7EYs9Bd5+vcQK47bjEqtnw16WDjai
 1uuZg64I40PO2aUKQOLThaA3XXepIggcBFfBjtdsILU+IZ9MJYHAqHoDPZYr9Fhb4Dps
 9JlIpCwavJx4HN5CAsCCWdWxjR6nUckvEQxP+y/ek4LYEpMpVo+Xb68ZLJFfjH3zpiqA
 Toj25O98E+5v+ksBL8FSbcL1ke7vbMLOeqbPKR5tGohaIshBZc2zV0fWWxZGOdyVf1oj
 Y2vG5AzAUhd+61/uabU40I/3n+bgVuZVdeMwKE4xWFFjmHktq4cz4RsBqrSIEImCZ8Bs
 pt3g==
X-Gm-Message-State: AOAM533H1Wvvavgdy+Z/uHrslgDXO6cfdrz29uOSlBecMHkPZ5kdelgJ
 gRG1/CtuAZ+JleEpv2DZ5ETqSrBtjqs=
X-Google-Smtp-Source: ABdhPJyRbEkDtIIhQye2QPun3nT3QgVU36SxfDhwn44XwpeZO9e8l++y0OpL5M2EnMw4bpSy5UGheQ==
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr1379415wrg.592.1642023018892; 
 Wed, 12 Jan 2022 13:30:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id v13sm725654wmh.45.2022.01.12.13.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:30:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 22:28:45 +0100
Message-Id: <20220112212847.3166081-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-h2: bump to version 4.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site in Config.in
- Reorder select
- python 2.7 support has been dropped since version 4.0.0

https://github.com/python-hyper/h2/blob/v4.1.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-h2/Config.in      | 5 +++--
 package/python-h2/python-h2.hash | 6 +++---
 package/python-h2/python-h2.mk   | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-h2/Config.in b/package/python-h2/Config.in
index dccee9b909..d88ad36761 100644
--- a/package/python-h2/Config.in
+++ b/package/python-h2/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_H2
 	bool "python-h2"
-	select BR2_PACKAGE_PYTHON_HYPERFRAME # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_HPACK # runtime
+	select BR2_PACKAGE_PYTHON_HYPERFRAME # runtime
 	help
 	  HTTP/2 State-Machine based protocol implementation.
 
-	  http://hyper.rtfd.org
+	  https://github.com/python-hyper/h2
diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 4193567d37..2f9c8f647f 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  197a99c09f344a0dd987fab9801dc8d0  h2-3.2.0.tar.gz
-sha256  875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14  h2-3.2.0.tar.gz
+md5  4274f9619c0a43bb4ae01b6b02bf0c99  h2-4.1.0.tar.gz
+sha256  a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb  h2-4.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  LICENSE
+sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 81397bbb10..699e8baece 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 3.2.0
+PYTHON_H2_VERSION = 4.1.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/08/0a/033df0fc05fe94f72517ccd393dd9ff99b1773fd198307638e6d3568a518
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/2a/32/fec683ddd10629ea4ea46d206752a95a2d8a48c22521edd70b142488efe1
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
