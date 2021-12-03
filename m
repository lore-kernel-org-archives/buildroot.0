Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B19C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F26405C3;
	Fri,  3 Dec 2021 23:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMzU2i8xkw0o; Fri,  3 Dec 2021 23:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F94040292;
	Fri,  3 Dec 2021 23:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4ADB1BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 913BD40292
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZuIe82r6WGm for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:05:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99A444010E
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:05:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so6040834wme.0
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VEAseU5WSkKlP3TfFw/khzmNlmPorCGkDKk6+6vmUI=;
 b=oxfhduSZbypsAayozP3PegHiuY1KLzfF+mkFcafd7WM5pdOwkQdReizENTARQoGC01
 Wp8kqQGFGR/oq1eekm2jJR8psfXsJwkJkaRlYCtjHQbgKdatPXNxvT8iZA9wkItXFuYu
 ttPdpcXYApbJbDBjq8t/9C0gWRNDABnJ6W3phFb24358ePZY9xjZ8Nv7cyWO4JsLojQL
 M/I2zJY7bBkOi5t0q89tHvLWOxlTN0QSf2etHiGTCHMORhZRC1k2ghDTWEZHka1T1hVT
 RQDPe/0Hc9wVAtu2h8dYlV8EFtSg9zg4JX83BJwyuAkAAar1Cc07tsOZhKDehaMjpDqg
 zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VEAseU5WSkKlP3TfFw/khzmNlmPorCGkDKk6+6vmUI=;
 b=4Oqr0WjrGrsSqY52QYW/a5nmNTL/0mWNkj05v8fSsgkr3hvIINtcqGeUq8HiYm48Wa
 gEt0Xm33NG6tbFS8hxkfSd9hxO6kwC7jroMSkf0I5/t1irQsnMIKYhDUksgz64YVTfNp
 AbEjq2Ntdn/3C5vQQHT5dd+uk0qEyZHzJLwNsIsGOimQ4Z0vYJLrXRSUVyAp5DqMY5p1
 CT9qJ+ua3yGaAfv6MtKcEdmuHDvE8aAs3wqgc6PmwiJTHGHLoedIY/BBApGLVFI9P/P6
 ItxxOvvxHdsoXXTZMwRypcoX7pNB4WMmUmLSe9uh0AemyfonKm9b5LcoZsJ/sC5iQD9M
 2P1A==
X-Gm-Message-State: AOAM531roenH/d2r6ABI4hZY+a87XgWOU/CUl1PHDx/yVxfo7HWW+aPO
 N5sbBMXonTrhM+ijGW7el30L5GOPuIkWEA==
X-Google-Smtp-Source: ABdhPJx+F8HSKw5YtorrQw1BnYZHdv6pmTvXapIqEKMzfWRvU6T9ZCb28hEjzlKQab6uu+MmIjWN3w==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr18614736wmj.115.1638572745673; 
 Fri, 03 Dec 2021 15:05:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id v8sm3704850wrd.84.2021.12.03.15.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:05:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:05:55 +0100
Message-Id: <20211203230555.1928626-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbson: add LIBBSON_CPE_ID_VENDOR
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mongodb:libbson is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amongodb%3Alibbson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbson/libbson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
index 931df333ca..1ac7202830 100644
--- a/package/libbson/libbson.mk
+++ b/package/libbson/libbson.mk
@@ -8,6 +8,7 @@ LIBBSON_VERSION = 1.9.5
 LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
 LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
 LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
+LIBBSON_CPE_ID_VENDOR = mongodb
 LIBBSON_CONF_OPTS = \
 	--disable-tests \
 	--disable-examples \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
