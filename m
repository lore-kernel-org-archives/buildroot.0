Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B6C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A66540459;
	Mon,  5 Feb 2024 16:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A66540459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOxbehpRdL5w; Mon,  5 Feb 2024 16:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106D740528;
	Mon,  5 Feb 2024 16:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106D740528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF521BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03006408BF
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03006408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ej7wgcKjHAj1 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:58:53 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07067408BD
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07067408BD
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-363c5ad8a1eso4086555ab.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707152331; x=1707757131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLULAyigDavtzB+jJNUzmNbsoP6qWhUck6dWCzz4m+Y=;
 b=ln86F/MFt4wz8afXxNvhFWb5ZIIFS+ZAz9SpFZkNvMts9WyZ6KVhgR9Z+LwydxawBW
 b0YMGTzhrLzMf066EkrW3H1dioM6aBiWpEgo9hKc5CFutk+RGTKAwPf6zJmAURittqrq
 +dFrhjoveGCAnga9kRbn528XGA3aFZEgrnPRQHLjICh31yV/j52cmDZgCPGNFnxU+ISr
 90YSFdOdTE4XLQ6rU2bRRnrcEho3sCsj9+K2hSlgX1/JBjy1+fWRCldVL7yDciwEAS8q
 Z+c08ZHZK2aTj72ksXF9qe+7d+sLsO5opqnko8eyXnuevw6U/Wgef23CKSt6ydw8tgzp
 slNA==
X-Gm-Message-State: AOJu0YyNbdn7GcfHed7FpAB5KejqDLFNZsrLrLfaB8mb2CygxJw9Zm6e
 sC7qK9wAtpWuQCdvV66GGgfjTHB1NIxBJydO6hkVh79+LdYfbaosbM9ujJCd
X-Google-Smtp-Source: AGHT+IE49Uom9wcNCjcP/KhiIPXn+0yqAUe2ozyPXYLV77+HNuEvamK4GeLNetYKTAjleiZllIQANA==
X-Received: by 2002:a05:6e02:1a61:b0:363:86dd:b35 with SMTP id
 w1-20020a056e021a6100b0036386dd0b35mr232481ilv.10.1707152331512; 
 Mon, 05 Feb 2024 08:58:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUfcJrMYsXUPRDgzJrtZMgtHrAjS44gSNGarIQp0eLkGPIy2GOp+X1YSevH+kp1m1ndVi1hBvtfRJ34QLPZSR0FoGkFWXTmwwRvMPoFLaZpbrPy2sit/hKIUT6ZnHW+fi6XmF4HOGHRx2eM1cKCMwTIjvDalH5ci0o=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 v6-20020a02cba6000000b0046ef8c433basm42394jap.145.2024.02.05.08.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:58:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 09:58:48 -0700
Message-Id: <20240205165848.519437-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707152331; x=1707757131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FLULAyigDavtzB+jJNUzmNbsoP6qWhUck6dWCzz4m+Y=;
 b=m2+XEueDMffFH4Uri8DO5DA+5UeHqYGS5CHjPAmYsCaJmS/jY44DKsaiZghWl6wb9l
 TQPBMRhiQS6Qq8vPSHWUme8tctyyFifwNykk02ckdCM7O1stI94ln1A/LCSAjo0eG7dU
 keP6Tz+EvNeLZRFr3p5g+i+pwYqyET24RldeUTGgVMVIturWM+IMvenFKvvsyNuvKdk9
 kK1BOkJggHzY3CDA0lq9qqHJuq2EFXeEE2A6nlsdJf/ZL0okskGuKMOqV8WujNXrwfo+
 Ao9UlWrUb3i5PN2R8lsino1FTv5fsFUT3FyMLuXiHvucEIpCQ++BZQwDdhmeIYhkU83T
 l/zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m2+XEueD
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.6.4
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year range update:
https://github.com/pymodbus-dev/pymodbus/commit/131d30391efd9c64f1fec857ae0372746374e6d2

Drop no longer required python-six runtime dependency.

Drop no longer required python-serial runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/Config.in            | 6 ++----
 package/python-pymodbus/python-pymodbus.hash | 6 +++---
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 0ba6fb88f0..dac6716b87 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
-	  Pymodbus is a full Modbus protocol implementation.
+	  A fully featured modbus protocol stack in python.
 
-	  https://github.com/riptideio/pymodbus
+	  https://github.com/pymodbus-dev/pymodbus/
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index d9337ffe84..2e9e87148a 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  89da6585b27b8c4b3887eb9f7d1e950b  pymodbus-3.0.2.tar.gz
-sha256  704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201  pymodbus-3.0.2.tar.gz
+md5  977e0f1fa05dc5b07fd151544c508675  pymodbus-3.6.4.tar.gz
+sha256  6eee2c7eedb794317784c967096fa1fe42200357e9b5a349d838ee9159624fe2  pymodbus-3.6.4.tar.gz
 # Locally computed sha256 checksums
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
+sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 54879d38e9..c1c17ae799 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.0.2
+PYTHON_PYMODBUS_VERSION = 3.6.4
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/94/f7/6149a1b107fa54378a7adec83db7cd3679bf02216a6f5c83b37f55335897
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/5b/7f/51eb8704092417ef8ab1d883ad793c27f7f34d67468efe36ca03c6c7863d
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
