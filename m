Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AA8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F2760B5D;
	Sun, 13 Feb 2022 11:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AwSF8s16RVB; Sun, 13 Feb 2022 11:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2C560A9C;
	Sun, 13 Feb 2022 11:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B784C1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE69818CD
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WZkNWmoZfs2 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9186F8148D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:33:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v12so22558354wrv.2
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3Wp9jelUAWccQSKP8uHZtH41ONl2J+djb6wNy4O2TU=;
 b=JUZdW/8ITPtTLHG2mee1SBb55nQBTKRQErqKtNF9cXdH7apaeLwmSQDfP+Z2JUprzr
 XRKBdj6nIdrFpAbeAzkYoNcWcgOU8OzaZ2+cHz3eh4KQ0ZZuXWTwG6x1pFqUvmDCiihQ
 br1Y8urlzsMf7jPoOyu34CWk9HOy7Iu+l74aEbrhMw14Fmj4C6cEycPuKWzdx0ZgB2KW
 qliKCaJJI2zhVDSqjMR7GjRHWSYDF3KlF0VbvnViBsU3fl2IO4XDmTLplkNb72DLmZfo
 suF61w3Ayw3hSxsIjY+5mbVjNUf4XipM666nqDekVhuzTJtDwbQ3Teb02tu4DH1ehZAa
 2V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3Wp9jelUAWccQSKP8uHZtH41ONl2J+djb6wNy4O2TU=;
 b=HASaZNOirRxBSkSFlecuqygywjpvKvZ2JEF85uw+51dqyI5vER0bcj0w/g80hr0A2p
 OPtO2FsD0R3Y0IJf6sVrr7nFdXqqotrUckEF/P1wZdLe0nsm6C6YX/Tp4pHmtNmK69G4
 /iCBhsWGLSEvSmlGV3P4b+igVCTIB3+lT6qVwZI4UFGiOC71QZafdfM0wcAihYJcctvD
 29v8MrWlns9D3hlhEIIVsU/P9IhTurEyaIGoKTVIu+dnu1QnKT+fWYu8ucHxK89CzIOF
 mVEGKoqFoq/i7aJTdmV9gAwyqNe9aj+qKloPoUYXKInbB66g9mYBhXq9nftl4AeofLyl
 qAHg==
X-Gm-Message-State: AOAM533tNcfHLT9QxvDK5ld7vJWxPyt8LAnpWkW4cjd3H0FlMjyK7Myj
 QIdOabKUjYOHQQpha6UTQ1tZmyrX86I=
X-Google-Smtp-Source: ABdhPJxpshBh/3mQWmll21735z5uL1WrHQdTxCvZ4vdKAh+P8t8+geY1S52IgwAM3THV75orDOITdA==
X-Received: by 2002:adf:fb50:: with SMTP id c16mr8060874wrs.101.1644751989554; 
 Sun, 13 Feb 2022 03:33:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm30013905wrd.111.2022.02.13.03.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 03:33:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:33:32 +0100
Message-Id: <20220213113332.1056370-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.5
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
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed a vulnerability in the EAP client implementation that was caused
by incorrectly handling early EAP-Success messages. It may allow to
bypass the client and in some scenarios even the server authentication,
or could lead to a denial-of-service attack. This vulnerability has been
registered as CVE-2021-45079:
https://www.strongswan.org/blog/2022/01/24/strongswan-vulnerability-(cve-2021-45079).html

https://github.com/strongswan/strongswan/releases/tag/5.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 69b3547f91..aca7ddf5cd 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
-md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.5.tar.bz2.md5
+md5  53005324e3cba8592f1fb958b1c2d0e5  strongswan-5.9.5.tar.bz2
 # Calculated based on the hash above
-sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
+sha256  983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd  strongswan-5.9.5.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2891e5aa5e..95079aceb3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.4
+STRONGSWAN_VERSION = 5.9.5
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
