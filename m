Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C544C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 21:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F87C81467;
	Mon, 21 Feb 2022 21:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dXlR4vKyqfR; Mon, 21 Feb 2022 21:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75908141D;
	Mon, 21 Feb 2022 21:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B11C1BF3AB
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 21:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0925B60BF2
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 21:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJJ4Htb60jVS for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 21:57:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C6B060BD3
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 21:57:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j17so2635068wrc.0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 13:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csrHbhQFV1N7fML6M5PLXnsOr06rBjseA3Dvwfc3/s8=;
 b=jpifPgDeRxxg4LpevCIsqFxSZ8lTVKzyDuFUYqauyoba4T5gyLu/govsAOAI0uxDSe
 MbtOPo7GTY9QGrpUdKY2PlgWGs1+dEIh1++uVRgaob2cWzGk4MtICpS7WR9UD6N4V1FM
 Xl8jDMO0CSUeB/THMXjvU2rpLAunO+VWPKIJbGK2DnZSRX2uOI3xvB1XeoRudyVnJSmN
 GDNTwSQvORGnXQyd1zOvSWE5kpHRhGcSSky5ZsTQYSWOD49WlpsS45lu0HEGIPnkN2gf
 VBl/mta0uHnXPq3m9aJjV4IZST+THjxhs9mwAafjJ+ji6ido6ROpGYk3sZfKok6yeDSN
 jUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csrHbhQFV1N7fML6M5PLXnsOr06rBjseA3Dvwfc3/s8=;
 b=tSixjFtmyUAEF383VNTv8LSbNVv2+edrsVqfE2zfANwcPiiDBX0J8WNOK7Un9v/WzD
 kD+vAlC72A5+rsmK5fdWje/TMSuSbBqIjWN7FF0l8QAtX2ThArK8pinJqsUxDYpo+W3Z
 9XykGNiUr+7inqmJv792bzaJSgHqGbZUbfofwjIxUw3wxktgIhH3H66LizK0JPHsuFO4
 piGn3gT4tBpmsw3BvaRK/UYUZfPy3TsGAflzD66fKhO1DXENooMf6iqNm0SX59ZaI4rv
 GirGXBJHg5j/aPG2XP94PvV1NXObT9oVHbxNZ61A+y1SnmncfYeD1LmIWBSssRQSK9XG
 CAGA==
X-Gm-Message-State: AOAM531wNQnOWvkhqGJh3lZ347z2mtMg9OYYAMVZK+RY1jFGlWsCV6go
 +QjWe12qbtHWoQGCdU+9Ay19GONECh0=
X-Google-Smtp-Source: ABdhPJxphmXja6PL7HyXpK7IkdtaI8YzULzu3SETPZps+V/Ynl79OCoTlMAq6ltrfZNCnpqytH+OHQ==
X-Received: by 2002:a5d:4b48:0:b0:1e6:309b:f1f9 with SMTP id
 w8-20020a5d4b48000000b001e6309bf1f9mr17150031wrs.501.1645480627191; 
 Mon, 21 Feb 2022 13:57:07 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id k19sm482991wmo.8.2022.02.21.13.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 13:57:06 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 22:57:02 +0100
Message-Id: <20220221215702.8461-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-twisted: add missing python
 typing extensions runtime dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 # python sample_python_txtorcon.py
 Traceback (most recent call last):
   File "/root/sample_python_txtorcon.py", line 1, in <module>
     import txtorcon  # noqa
   File "/usr/lib/python3.10/site-packages/txtorcon/__init__.py", line 11, in <module>
   File "/usr/lib/python3.10/site-packages/txtorcon/router.py", line 10, in <module>
   File "/usr/lib/python3.10/site-packages/txtorcon/util.py", line 17, in <module>
   File "/usr/lib/python3.10/site-packages/twisted/internet/defer.py", line 42, in <module>
 ModuleNotFoundError: No module named 'typing_extensions'

python typing_extensions is required since python-twisted 22.1.0 [1]

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202537

[1] https://github.com/twisted/twisted/commit/6e768da0a10c8ab42a57a1c0fa505ebe2d8bfb30

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-twisted/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 49a21c4204..8596025e9c 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_PYHAMCREST # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Twisted is an event-driven networking engine written in
 	  Python.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
