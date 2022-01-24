Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6DDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DEFB605C9;
	Mon, 24 Jan 2022 09:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJeFAr7fIhXW; Mon, 24 Jan 2022 09:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C8960C2A;
	Mon, 24 Jan 2022 09:30:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0231BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED3E60B9F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aK3p8oRrv9VD for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:29:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77A11605C9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:29:53 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id n17so2821660iod.4
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 01:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfeDrIOBmg3uNsoFFEvyqfAe2JuDbb2T/x+QY8Ob/zw=;
 b=oGoVEF6drG1AcywF2EQT7LI3w+oPbsUB0hSZYi/OiJRVd7//vykvIWFyuts29N9c+/
 MRUERMKNj/EGkZYWSF368vVqrnOJ4ESrAet29QMtHwSCjnQCxTjp23eisM21+RyLkUix
 lTJRERM5boT0v9N7+dxO7zlf+0o2l6qr8YRGFeUtMirWe6dB0k9apY49HT1kfuxQzp3p
 QBMUB2xfjjXyRAzw0p/TxuSxPxvraqzyJ0BfFRwIM7mRCnN/1TlFg55iw9+jXi/R0fYj
 nf4XOXK6Pq8Tr2z7VhFY3Oic9DRmHf76CNTucJ1EGA3afcljJchwTdsN+A68iGt0e5pn
 ZQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfeDrIOBmg3uNsoFFEvyqfAe2JuDbb2T/x+QY8Ob/zw=;
 b=N27pWWUVxRskmnyyuz2g1G+FTOEvDrzhRSzquKemHXdWybzAhCLeC2HBCZC7Yx5e6S
 QQpVHgrbizJQscrMO1oXgf5avrYW7N0P6hZhy6BJH5KWTT9FY5bL+23JX63anjypKlNT
 qtPIjYtuytDlQbxmkE383/aiXwj7BzaHTe45RZCKfu0NfS+kg75Ki5L6vuxLIsRq2Vi/
 OiFCeoM6q385YiDPEsuXMQ9gpIGn2sR/0/sM8cDAtxNkqrTJdzkK0apHVYlmGuHjFlOF
 nAbH8TXFubPi9ExbwESBRw+aA0nM3YxdGNnZjRC3Ewprr2kto2xKrl7W4jr27QfpVRGl
 NFRg==
X-Gm-Message-State: AOAM532rywU3Zq5rd6AQEE8EHr6rjL5R4FDYceRTegHbWBb0/Lvwl8ZI
 yZDp5hirmc34/ekyDdtwCVRP0nEDwRU=
X-Google-Smtp-Source: ABdhPJw50VrUjPs3v0bzMwdAtuvz/BYPJqtAkDi+78ahlt0GDYyyBE3gYHFD8DS//FQe82z28cQ9wg==
X-Received: by 2002:a05:6602:2e88:: with SMTP id
 m8mr7468818iow.16.1643016592316; 
 Mon, 24 Jan 2022 01:29:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id v6sm7050520ilu.60.2022.01.24.01.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:29:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 02:29:49 -0700
Message-Id: <20220124092949.137812-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 2d9943fc0d..789a6ec59f 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  e28b9592289597b232f09e5cc3857f32  multidict-5.2.0.tar.gz
-sha256  0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce  multidict-5.2.0.tar.gz
+md5  c9a6ee3d39df11616cfe0c89abd5134b  multidict-6.0.1.tar.gz
+sha256  d40616f3f9326a18e1f2fa7c7e8e0e04a7e5228bfa2bd62c1e0d68fbc259b09b  multidict-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2619cad2ee..ff8fbcd053 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.2.0
+PYTHON_MULTIDICT_VERSION = 6.0.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8e/7c/e12a69795b7b7d5071614af2c691c97fbf16a2a513c66ec52dd7d0a115bb
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/78/91/db40f5e6bd2b5d2f3fff0f5edee05035513c11fff09c565368f22129240a
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
