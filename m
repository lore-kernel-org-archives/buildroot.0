Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E8C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A059B40A44;
	Mon,  5 Feb 2024 16:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A059B40A44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHywKeSMZOv4; Mon,  5 Feb 2024 16:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3CB408BD;
	Mon,  5 Feb 2024 16:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3CB408BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8986E1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 626AC60B97
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626AC60B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Syv-Y48mRnaG for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:46:22 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94EC360AF0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94EC360AF0
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7c3e01a7fe0so42889139f.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707151581; x=1707756381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7HBlYJKD+W1lIpYa/kI65Lmi5s/se4Q5NczbQxebeiI=;
 b=TaPlJVITnNPdKZmWXwg8iFHBMdl26FZ3tyFqwofn0qdlfe6jVsLD4o+QPl3dqnscrp
 ZgzaefWoOZfrePA/iC2Vgm7V/3VB9JAIguzTGFM1EwRCuurYr0FVQM3V2lJPIHHXiy0d
 vE32zu6r+qCU1TO35qxubVW0UnAEbsmwpq8RWxg4Y1HE+Rofg5pBJ49pdHyBqY79/r5y
 0LLY8hC/eCajdMovFcw8/TvndAXMx02NccuzM54uc968FAsW2HUFx0uP7nnzzctN3QwO
 euLiMGs5c68Q953HSFbu+mqOD2kfnt1n2T1NzgX9F/7TnzBkaLumt+8VdStO1mANDPN1
 gPwQ==
X-Gm-Message-State: AOJu0YwkE1zJFdgU8rpGRaoLtPyaRMAEpBHEhAQyQXmdAcs6wrkIlCnv
 quO6iyCmh86V5KmWW3Gd7RU0Y9IjcMLB7heVDyGdHg0mL4ZOUAe6evtJvoWl
X-Google-Smtp-Source: AGHT+IGfkcvc2fU5+Dp76LJPunpK3tGURZErjzJdQodtTesSXGH/L//uSBbNqQMENuN4mwYIK5cCYQ==
X-Received: by 2002:a6b:6f0b:0:b0:7c3:e006:8719 with SMTP id
 k11-20020a6b6f0b000000b007c3e0068719mr177389ioc.10.1707151580836; 
 Mon, 05 Feb 2024 08:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWwnjnHrt6d611yLHDOeViEeotQcJ5j7i7gfME9/3vcmx5AlrfHoIlH2UVs86QPUmv7jg5YxqkaLa4W8O4jWtrzheoIrbfSDu0HkIzwKUWHv/OZQzNRj9aDRu33Yw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 dp40-20020a0566381ca800b00470ef7f3ec1sm36573jab.1.2024.02.05.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:46:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 09:46:14 -0700
Message-Id: <20240205164615.510688-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707151581; x=1707756381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7HBlYJKD+W1lIpYa/kI65Lmi5s/se4Q5NczbQxebeiI=;
 b=N0XwzSEjaC2RJrQjg1WgOi7/fnf3TZ19x5/455262CIRaxGqUdkft6EAqJI6o+aBe2
 Iow0BU10eZ+sVmTGM5yumz8tYmMD3FKZmCagoPFzB/hQ3mSldwqth8KGW5FpJ72sFbVg
 IdvlkK0iKq1YqMufFwHKngg5KKs3e7B5+Bgu3LKbKuqXqcl0IMnPa3ZE5m7NNDCikanv
 PKXgzNkeEWGr8HTD0RNH1QLDYPssGp/Dt0G1lyB+itBf9dboVLJIcdL5Qpj9u86BNfW4
 t9BW/eq9XgzRklaBVRWqzhsRF1rtGi9uXTIZftGPWcygwo+qftdhul7BF0ZJJYoBedFW
 9z6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N0XwzSEj
Subject: [Buildroot] [PATCH 1/2] package/python-starlette: bump to version
 0.36.3
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 820026b70b..03d77cf5be 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  2ef2fc635691fd4a1823564218292dce  starlette-0.34.0.tar.gz
-sha256  ed050aaf3896945bfaae93bdf337e53ef3f29115a9d9c153e402985115cd9c8e  starlette-0.34.0.tar.gz
+md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
+sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 07f9d6be5e..9d137f5f5a 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.34.0
+PYTHON_STARLETTE_VERSION = 0.36.3
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/4f/36/168ba6d56a28382f3b081b23b0cc431de35786e120b94c1f372708ed3059
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
