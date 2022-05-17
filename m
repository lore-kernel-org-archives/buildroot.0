Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42577C433FE
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 22:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF78A60E07;
	Tue, 17 May 2022 22:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6WXeTo3lExG; Tue, 17 May 2022 22:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1DC61120;
	Tue, 17 May 2022 22:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0642D1BF20B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01FBD40399
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akJlfSL9RNqt for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2782240191
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id o190so285439iof.10
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TyRjDqxieu2AG3iYTZYxhMIJpZ0jlQQzsOqtNgRmwfg=;
 b=L4lPtrkYdzaC4yRlSQLkPryJPY78sitM9niIhhaqcuRePJOSzR5KaJ/dj1Fb6dayWz
 axlfhmu9j9bH6Ug4civ+nnZejbxj4dqQGwQfuPpob7mvOMQ7pKXfbO7Uzeexjue5Kp2W
 qmN2mdWqlrFsSmjh5eoQ/sa61J23LE7l2pUAk7y/KIJuyHfzjCnGKdrOGifA5pYK+M9B
 04OXF8bybXVEwEvSAZditjHhbDS31tnuwJ3mW8Li0bGNkSi2E4plxxNatswAPuGNdLxX
 SOjApSClP1wLekF4ZmYWOp9ZxQSyPLZt/oX7diCLzIQXagca4BIVdJOgBEZbFyB49ldN
 /1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyRjDqxieu2AG3iYTZYxhMIJpZ0jlQQzsOqtNgRmwfg=;
 b=vnUXclYcPUfkhQZPSiIyJk4XzV4eKuHN/qsrduQQIy2lw8iFEX+a/r7pP+l5tY5FOj
 M6S+Z0Cg3AFIIVr2GeJCBJZoAt3tpBR+uhetS9xsQRIs6K09O8a4x1F87vzRsYzaQLNL
 EJVK6oavZO96q39QRzxQmPr8fuSsrTouq8a9GqiteHE+F45T9KSg/GTIa++sQP+/yAtF
 o4Uxc+1Nmw54r33+ippAh9U4sDogFz7fV9jIT1KCUahDIEkOPE496abAtkR11yYy4KHr
 lV41YVDJW/RYCzF5BRGBErf94xpTm4Iw2Cs+WFdwzMx+q2q7pzKN0AKooMXuQHFtuaKQ
 wJgg==
X-Gm-Message-State: AOAM530USyTqCdFgVDC1K4XHiiULLMnw81H+t0A/d+KALynaT1Zz9Zvk
 cSd0ZjOyed6exbv4am1t2BGcXNXM9hs=
X-Google-Smtp-Source: ABdhPJyj5Yt1CB3RZrwvJ9UdpziXvYUpm7uPXN+Zy8+HsWX6Gqo3nW0Zfa35DFNwZBWmTCsBgu4Dzw==
X-Received: by 2002:a05:6602:2b87:b0:645:db81:a5ab with SMTP id
 r7-20020a0566022b8700b00645db81a5abmr11361510iov.71.1652824778132; 
 Tue, 17 May 2022 14:59:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 j13-20020a02cb0d000000b0032e262428d1sm67354jap.143.2022.05.17.14.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:59:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 15:59:32 -0600
Message-Id: <20220517215933.1553086-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517215933.1553086-1-james.hilliard1@gmail.com>
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/python-typing-inspect: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-typing-inspect/Config.in            |  7 +++++++
 .../python-typing-inspect.hash                     |  5 +++++
 .../python-typing-inspect/python-typing-inspect.mk | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-typing-inspect/Config.in
 create mode 100644 package/python-typing-inspect/python-typing-inspect.hash
 create mode 100644 package/python-typing-inspect/python-typing-inspect.mk

diff --git a/package/Config.in b/package/Config.in
index aeb48945be..1f383fb02a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1268,6 +1268,7 @@ menu "External python modules"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing-extensions/Config.in"
+	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
diff --git a/package/python-typing-inspect/Config.in b/package/python-typing-inspect/Config.in
new file mode 100644
index 0000000000..dda057a19c
--- /dev/null
+++ b/package/python-typing-inspect/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPING_INSPECT
+	bool "python-typing-inspect"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	help
+	  Runtime inspection utilities for typing module.
+
+	  https://github.com/ilevkivskyi/typing_inspect
diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
new file mode 100644
index 0000000000..f3ff6b642b
--- /dev/null
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing-inspect/json
+md5  1444feceb8213bd94cfece3c6d4ffc5c  typing_inspect-0.7.1.tar.gz
+sha256  047d4097d9b17f46531bf6f014356111a1b6fb821a24fe7ac909853ca2a782aa  typing_inspect-0.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
new file mode 100644
index 0000000000..eef1f0b586
--- /dev/null
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing-inspect
+#
+################################################################################
+
+PYTHON_TYPING_INSPECT_VERSION = 0.7.1
+PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/c3/da/864ce66818e308b38209d4b1ef0585921d28eb07621ba7d905a0e96bcc80
+PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
+PYTHON_TYPING_INSPECT_LICENSE = MIT
+PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
