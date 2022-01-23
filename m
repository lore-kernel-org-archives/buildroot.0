Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D0EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BB804011F;
	Sun, 23 Jan 2022 22:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3MFFYf-VfI9; Sun, 23 Jan 2022 22:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4063740636;
	Sun, 23 Jan 2022 22:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9034A1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEE940613
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vanQuRbPB4bP for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C5940616
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:15:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso23091780wmf.1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0FtcOxqb+9urubVbqKJeSEvhjjxXycMBeS/NZWRhRo=;
 b=B7d/izLmS3UF9PqelZDF3UeNiw4hATp16Jq7U9YCDWCOxytQ+E9hhn2Fy63SgjxVWF
 FFfp3WSxx3IJ6KhpfUpMTChJVjGF33tq38v5GWoxD+sAD9U5PThaRNw2EbczzhZkhrBh
 18AJy5HS6KPh9KZgKWe4dX1zSkhA/03Sks+FxF9/+UAmyW1ltQMnaNfVK7WpFSBpa7XF
 0bx77kAnlR7HRvXQkY6FH8Cid12ln7nPRsPzLOgcIWyRHToCODDvEEQTNknJot5Vl6Rx
 X5yo3K6KXzaav7rQKUyf/20lfc3aKb/qIa2ZgqfrYOGbE4bXX0S9I4dgKJIEIICqNzbJ
 U23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0FtcOxqb+9urubVbqKJeSEvhjjxXycMBeS/NZWRhRo=;
 b=Bvl/Fx+3lqxxV5jLwttYN6tr+leQCEUlKc0NpfZOBEPuvdtW3mVNqwwiIRcDvEGTKy
 V2F0/oKoN84yhzMIWmvwCNzW1PC+kQ63qRL1WauwoFWXOOA7kC76fnYs0CEa8XRfdhvg
 kWz6gyUTdoPYC0jX/RRd0XRS+RroKV6nVev9fb8/GDrs2J1gd8HxIEYcJgg7CLqbVJXW
 0t/ZZPRKjvK8a5OTw6laee25V3nSiSP3BPMEFmGBfab2JA6+SZbr+qtNUNKd8PP3Wg1T
 tOfnF6NbGYXZkPCv0mViHXP7ToZkMe1XLuBa6bymX2XDgPdzw+RqRmz/pDhbqWK3XgZY
 O0BQ==
X-Gm-Message-State: AOAM531FxXEKTNkPHlZaVA+WZd0FyMcffeywGjshrFXYskwCfz4LsnRn
 WxNrjAkGzQiZStaFDeLwmLu4Mixj4Yg=
X-Google-Smtp-Source: ABdhPJzTVCKS2Og5gkP6+f6wCEQoCFww3eiOYi5K67g2J6Nbo/I1zLhnrxdGWBadPTuEF2kYofvTlQ==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr9304761wmr.174.1642976139424; 
 Sun, 23 Jan 2022 14:15:39 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u7sm11476686wmc.11.2022.01.23.14.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:15:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:14:02 +0100
Message-Id: <20220123221402.787958-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyftpdlib: bump to version
 1.5.6
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

- Update hash of LICENSE file (license updated to make it recognizable
  by github:
  https://github.com/giampaolo/pyftpdlib/commit/a3016e7d694c226cae6a2b7672c6c5196124cd7a)
- Update indentation in hash file (two spaces)

https://github.com/giampaolo/pyftpdlib/blob/release-1.5.6/HISTORY.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 6 +++---
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 7f8da95550..abbb1261b2 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5	7f8089520d60171bee5dab2b721e8d00  pyftpdlib-1.5.5.tar.gz
-sha256	1adf1c03d1508749e7c2f26dc9850ec0ef834318d725b7ae5ac91698f5c86752  pyftpdlib-1.5.5.tar.gz
+md5  459dd3e685c4b7dfcf574ca05e5586eb  pyftpdlib-1.5.6.tar.gz
+sha256  fda655d81f29af52885ca2f8a2704134baed540f16d66a0b26e8fdfafd12db5e  pyftpdlib-1.5.6.tar.gz
 # Locally computed sha256 checksums
-sha256	18a4ff1ddf890838e36504b307581e3eb42c890a7272ce28b18b3ce1205b7ea8  LICENSE
+sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index dbbb9e2842..931e2dad06 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.5
+PYTHON_PYFTPDLIB_VERSION = 1.5.6
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/27/64/06a574350c79873e908fa9f48b617e7961de50fc468acc0a05d76771bce9
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/31/61/63ef60aca6de07eba1639d9d47f3f8e29462e8bb49d6a8dce9aeff240646
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
