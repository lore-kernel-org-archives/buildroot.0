Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3DFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B9B40AA6;
	Tue, 10 May 2022 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2W-Hs0sK2Px; Tue, 10 May 2022 13:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9D140327;
	Tue, 10 May 2022 13:02:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5701F1BF255
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 13:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 450EC60FAF
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 13:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhS76O1Yb0mU for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 13:02:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B2CF60FA5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 13:02:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l18so32767852ejc.7
 for <buildroot@buildroot.org>; Tue, 10 May 2022 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=bfhhAL4Dyfmr4b6GIRaxtqHTchOA03vZdScpmivVza4=;
 b=QDsL2CXfsfZUaO2GXHzaKR3kFyA9Pa68IRlRc7gIryMq9yL9bBIUnkgueL2Xl8746K
 v5l1Zl9X60CQs7xkxHGzu/yJBPOg2GAoWl1UqEZJnpuBt/ly+dNsFyTwp3hOmQgn7r21
 rqt/5tswllfAEg6utWjesuop9NjQABdUE/pfGiBZB9ahkE9WJjDJOa4j473mGHJH+cvf
 W/oovapVBD8lcCRep+eKxPUJyegvq9Kvxd+OvedtNQbI/V+Md0RhhtLgC57siYqRXuSH
 9xuA/5deFUNXyAwgDjwWISItlxD1LqHnCIvRPKkKriTsfNt05FbhQjHvO8KD5Wf3NfbT
 tYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bfhhAL4Dyfmr4b6GIRaxtqHTchOA03vZdScpmivVza4=;
 b=NPkiyG5Thgi1e+52dZtt6upxG+cRlyF89Tyn2nqIFV8zlFjHFAgtzIbsM8iHP6cZ3h
 znklJjoZI7/dicxJqDuigog7Q/6AGKqpPoXNVu8GDBIZ6obd60zEtxXkEpRn4GITYNbE
 KGbcHIAkvN65i9oxrwu9wnleV6vhg+OEMzBhiavCy96LAON8GlqXW6iiC6rXpODMvNb2
 US2eGZaMYkKb0DQNtgEW0Az3Txi9fVSsKyVduEyNIwz0RR4SxXl4uPBTr/7zA7JOYJR3
 zJpo/KlOT6he4rslkHc682JZggJOX1N50WuDeeo2JUVl19pdNGdZdxidwA3TVZkpe6Q7
 cpKg==
X-Gm-Message-State: AOAM530Yqs7ZxbxvYv5QQ6LzUuvgkrYRBq28eptlrcUBEBOljcOuEnbx
 Dn4hA5DPTLfHeie9OCBidikCWV0gk6k=
X-Google-Smtp-Source: ABdhPJzIy6j0YRL4q67BLfMI46dL24l4pw+JKZ5zfya5W25s1qF5J5/lszk3TcAksFtEttm5CfrWug==
X-Received: by 2002:a17:907:1c25:b0:6f4:342f:51e6 with SMTP id
 nc37-20020a1709071c2500b006f4342f51e6mr19492608ejc.740.1652187772853; 
 Tue, 10 May 2022 06:02:52 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 l17-20020aa7cad1000000b0042617ba63bfsm7613366edt.73.2022.05.10.06.02.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 06:02:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 15:02:48 +0200
Message-Id: <20220510130248.10966-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-pyrsistent: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-pyrsistent/Config.in              |  6 ++++++
 package/python-pyrsistent/python-pyrsistent.hash |  5 +++++
 package/python-pyrsistent/python-pyrsistent.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pyrsistent/Config.in
 create mode 100644 package/python-pyrsistent/python-pyrsistent.hash
 create mode 100644 package/python-pyrsistent/python-pyrsistent.mk

diff --git a/package/Config.in b/package/Config.in
index 90357240b6..9bc32c4f9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1178,6 +1178,7 @@ menu "External python modules"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
+	source "package/python-pyrsistent/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysftp/Config.in"
 	source "package/python-pysmb/Config.in"
diff --git a/package/python-pyrsistent/Config.in b/package/python-pyrsistent/Config.in
new file mode 100644
index 0000000000..49f97a00d9
--- /dev/null
+++ b/package/python-pyrsistent/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYRSISTENT
+	bool "python-pyrsistent"
+	help
+	  Persistent/Functional/Immutable data structures.
+
+	  http://github.com/tobgu/pyrsistent/
diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
new file mode 100644
index 0000000000..70d1cc6fa2
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyrsistent/json
+md5  cef3da08455664bf917dcf8cd00d49a4  pyrsistent-0.18.1.tar.gz
+sha256  d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96  pyrsistent-0.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
new file mode 100644
index 0000000000..27ec41028f
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyrsistent
+#
+################################################################################
+
+PYTHON_PYRSISTENT_VERSION = 0.18.1
+PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/42/ac/455fdc7294acc4d4154b904e80d964cc9aae75b087bbf486be04df9f2abd
+PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
+PYTHON_PYRSISTENT_LICENSE = MIT
+PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
