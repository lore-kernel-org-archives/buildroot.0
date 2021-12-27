Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0499FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 15:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B1A94099C;
	Mon, 27 Dec 2021 15:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbxg4vvcr3Do; Mon, 27 Dec 2021 15:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A858E40933;
	Mon, 27 Dec 2021 15:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D08C1BF487
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475CE40933
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYWtzJ5TxbyB for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 15:23:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 180BC40283
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 15:23:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e5so32915863wrc.5
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6jmWiyCG6H8/7x8cmDs2OlaGh3YzemNZRRcbUYjGRY=;
 b=aUye2V0jDgdkBpWpiKadwaw6d9By3H8V+R+LmuOPfhnudOdYnT7t2uxJsf9BztRZiy
 WlZY2Q9emAoZABxy4pirvn3RqXYRzykaG/VuH5Y95orwZ+ON4/ojtBMlcC212papibJy
 5n9diaduZ2yYv6B99Vfk1K1mZPH3ttK3wIOKF8jMKdC5Zsz+FkYEAGHiTULylGX9xJMZ
 OXTuIsDD43OmpbmWDRIPvlc3gyZKFXpxX8BMWo/U+5wDQHozeHSnWstCEaJu75E4llkg
 E0NL6fpLgD8y0C01DxB05n/33kbAQAaE9R8z0Kd1dTUxAqt09k3Jcv3axbRckxwsTOFc
 zozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6jmWiyCG6H8/7x8cmDs2OlaGh3YzemNZRRcbUYjGRY=;
 b=2naJPWAQUcwcj34Ck/Cz57jlMYlnVDTPCsV4eJVR3y6wO6oGx5r4ZeZD2ev6Ljhuiq
 56lmM1zj1S+t7lkCoCPTEO15SvMolSa3n3cjqNYnHBuI2vjIOcTfM5H1cVtMUQVNLwO2
 4Gdut2H1L3IjqugD0Z5bub2QjXND8ApRcaYMoLLHYq4ZyozzQ348vUrc3pjlyZRjvUf3
 YN1ZKeCHBbedB3h/SqOi/ELw81VOjOg41fIqzHzpUVH0nB07g9mwUMGvbS68urL98iT0
 LnNCuQpWiE4dr4onGV/I9HWL5qTv2bwKaSAo6GUbZdFgM9mwyvqDgRCiRn7k/YVQDOx3
 qfuA==
X-Gm-Message-State: AOAM532A2vmxcaYysVKTVErNHwt3dc6YV6jY9E7hMU09mVubSym3lQXk
 4Qlp5/Ntk6rny265ERHkvxAd+FNiiicL6g==
X-Google-Smtp-Source: ABdhPJwqNKxZiPdbqUsvFbgZWr/fs2iA9rxs54v7II2PdQ43N6jtLjwMJYsgoYPID5JJs5uFbw78SQ==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr13408585wru.36.1640618598178; 
 Mon, 27 Dec 2021 07:23:18 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n17sm13418560wmc.32.2021.12.27.07.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:23:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 16:22:39 +0100
Message-Id: <20211227152239.2067545-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linuxconsoletools: bump to version
 1.7.1
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://sourceforge.net/p/linuxconsole/code/ci/release-1.7.1/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linuxconsoletools/linuxconsoletools.hash | 4 ++--
 package/linuxconsoletools/linuxconsoletools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
index caacf70e45..889f6d1d6c 100644
--- a/package/linuxconsoletools/linuxconsoletools.hash
+++ b/package/linuxconsoletools/linuxconsoletools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34	linuxconsoletools-1.7.0.tar.bz2
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547  linuxconsoletools-1.7.1.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
index f26d874d96..306a5b1fa0 100644
--- a/package/linuxconsoletools/linuxconsoletools.mk
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXCONSOLETOOLS_VERSION = 1.7.0
+LINUXCONSOLETOOLS_VERSION = 1.7.1
 LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
 LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
 LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
