Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCEBC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A55160FAE;
	Tue,  2 Jan 2024 18:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A55160FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHO7D1bh5uip; Tue,  2 Jan 2024 18:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F96960FA3;
	Tue,  2 Jan 2024 18:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F96960FA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34EC71BF2C4
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A9E660FA3
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 18:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9E660FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVUtEeCF4If1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 18:02:25 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD16960AF1
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 18:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD16960AF1
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso8774303f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 10:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704218542; x=1704823342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cw4ZnoXhzEd8ZUeO/Yi1q0Mfs/4VVXFnG8/QfyR+9YM=;
 b=NTqZ6niA0PqOG5Ati5j19tw4nVh6ZIkpNn/oh3VFh0kTMgR7Lad1thmArS5jcTTNQ5
 G52wMDUXQRrtp7cLczAm14SJsL6CjY5w0hGwFyv5IeDVQITNFqhbU3yluIPipOwY5yxe
 FpLvVZAlIpVT4ARVtGOIU4QEYLdVEx4g0BIgytFidJCzYU179cO5JV5ZguHNCBqswy+t
 J+P8afHvlWSz+h4OAdNZLURJOFLO8eYZ7zgJCo+/zEp56PulyHGD95VM0/WRkfWKSWs0
 i5TuTfQl6QhtHvwxOXQjRIuxa882f/FsOfgQTkv9JfHHIBIX9DI+215koqOg+VkAP3O+
 5l7Q==
X-Gm-Message-State: AOJu0YzT6PhTN8X0BCErK92uh/0nJZ5kGRUIchXeV75Q8NUg//AO9yCj
 YepmNiN+QsOJ8YZbHErbXj+uA156ZsQ=
X-Google-Smtp-Source: AGHT+IFYjIrquqRlEkoXCWWjFaV56Pt52o8IAmkG76BjSQVRcwtyDFU/bHqdUKOID5X1ntmr033byA==
X-Received: by 2002:a5d:494c:0:b0:337:3624:ff1e with SMTP id
 r12-20020a5d494c000000b003373624ff1emr2511391wrs.95.1704218542372; 
 Tue, 02 Jan 2024 10:02:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cg10-20020a5d5cca000000b00336c120855dsm21479782wrb.84.2024.01.02.10.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 10:02:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 19:02:20 +0100
Message-ID: <20240102180220.1038939-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704218542; x=1704823342; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cw4ZnoXhzEd8ZUeO/Yi1q0Mfs/4VVXFnG8/QfyR+9YM=;
 b=a2smgoM8JaCiKP4BO9+yDMuiZGE2IHgO06xZ2M11gLDEiWoO/mSY6XI93oP9f60uRj
 IJTi9v3sc33hH23qvPvP2AXHEDg76msgyhX56qDrWah3tyx02Bvd9R0NUUkpOYGmHnJM
 jr2u+TTlZkamEOqYhktv5zRXWtfrXSdgYdJ3ZlD9EtDUNH3Ec6m4/8ebnwme0SXGJRt+
 FXgdIx/nLDPzJwTMHLUxCmQNzwjdt1vKWdvuNiIZGv6dEEJyhkj9FpHm1f8LjoxuQZJX
 QpmETVDJQgPeiXG9FzNnOi4MjeEfT/nqKVcRuEJ9A4aBB3G4XA9EKAQ/q1SvacA/AfSk
 kiqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a2smgoM8
Subject: [Buildroot] [PATCH 1/1] package/matio: bump to version 1.5.26
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use xz tarball
- Use https as http is translated to https due to HSTS
- Update hash of COPYING (update in year:
  https://github.com/tbeu/matio/commit/47a7a3340ed3bbedd3c456f8254f9c5441a11127)

https://github.com/tbeu/matio/blob/v1.5.26/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matio/matio.hash | 6 +++---
 package/matio/matio.mk   | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 94e0e48f69..976e9f03e8 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.23/
-sha512  e125278dcb25695affb7c576d0e2a86c0eff4225aa866b81536c9e4d7b2aea2c554f5389e96d534a8b559f5554b6cbecff4b44fe8915173cd64b2da6d1dc2629  matio-1.5.23.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.26/
+sha512  725f5287a1bb9367828ede5071da82892327fb8edd51f5a21d1370614d9ea81034c3bb4d16c87e80dc9e800086800ce14e3c4ad636255ea45b7741453e6cbb4c  matio-1.5.26.tar.xz
 # Locally computed
-sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
+sha256  b3da766592f242fd5cdd4dfd15ac5e6119e88fd6844c3c0e7acb8ad3178280a3  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 2ba9c8f568..d8268a109f 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.23
-MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
+MATIO_VERSION = 1.5.26
+MATIO_SOURCE = matio-$(MATIO_VERSION).tar.xz
+MATIO_SITE = \
+	https://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
 MATIO_CPE_ID_VENDOR = matio_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
