Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF315C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61378418C2;
	Tue,  9 Jan 2024 07:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61378418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsiZNmDrxZ34; Tue,  9 Jan 2024 07:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC3E3418AF;
	Tue,  9 Jan 2024 07:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC3E3418AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 361CD1BF59C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B50B418AF
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B50B418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60KG9gM4VkvL for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:54:42 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5555418AD
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5555418AD
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-36091f4d8easo6352055ab.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786880; x=1705391680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=piOOCAZ3DSRFKylRoNXwul7IjLuMM+v1kRSApcBqMTg=;
 b=hEXCsDVgDGJcQ24QDbAJPC+y5STSeq0hRI5RDfyha8UJJ/N8C8VwKzw5V6U917v6jj
 inr+X4tZYQgwFZuYRZGzFL6YF2i8K4Xa5DgHvZVuXOG56Kw3uB/CSrl71bB+Nnf7EVRL
 w8ozfHn/w5UUMXxuV5bCeku9Nsude1HZrRNdMW+obctBURSW1uclawee0QJjeCSGPov9
 CFj0fzdzsfWIWOiTHntnm0SZHkwD32yV5I8VG6OFLq7Ui83xhWe4wx4F2xiNHyoIYTRt
 ZvbNdjoVmRan86clNpFtnVjq2rrzyP2khC3nj/CwK9W4uPnXhFDcxhcbBbHBf6H1aoTD
 hQug==
X-Gm-Message-State: AOJu0YxYYU5IaMOzkVuaxHi40ACWexAQB7N1mM7PgSmayZbPOfNwqtt9
 4W9e4k8RmP1B0vaartIY7K2wkE5Og9+2Cw==
X-Google-Smtp-Source: AGHT+IFWrEnBK/tFPKfomuuXkeODFUQ8wPGGE8UdPlzqCNcmu1tov0l2ooRyfZA7tt9AeZStV55B4A==
X-Received: by 2002:a05:6e02:2387:b0:360:7403:3cca with SMTP id
 bq7-20020a056e02238700b0036074033ccamr6703370ilb.51.1704786880536; 
 Mon, 08 Jan 2024 23:54:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y66-20020a029548000000b0046e139ad407sm496021jah.71.2024.01.08.23.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:54:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:54:33 -0700
Message-Id: <20240109075433.4054341-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786880; x=1705391680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=piOOCAZ3DSRFKylRoNXwul7IjLuMM+v1kRSApcBqMTg=;
 b=W1e+bU/rc6gAE51s9A/gSPQgBZZPwxARJ4gSRKbYXP1tM/aRpB5Rinh98/QDoMqwZZ
 Ls2n85UWTyUjy3jm0K4rXC76d329KXRPVc19kVOftZ8+eXrGC4XqVuCs38Gd9C8LBq7L
 xjBZfWUQyaX+CzzMKX9RLdCzXzDxzA5Rsz8YtJniv//FO0UoTNRD0jy6PV0y1vKbWR3v
 UFEsQR6M6d/rP1ZEdaMiqPuAE6UjYKaBcsOIqGw+fjsJ2wGzW9wATe8/Ig0ZsanS/tFC
 J6x5rbv3uU09vhNVEXleMA1iKiKQB5/vul3vDExlFCzZxWpsQprjxgVFgEpX84pDpzSd
 6NeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W1e+bU/r
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.26.1
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
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 2f965edc91..9c201391f4 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  40413bc699c6e02d7732e7e09e8cec0c  google-auth-2.25.2.tar.gz
-sha256  42f707937feb4f5e5a39e6c4f343a17300a459aaf03141457ba505812841cc40  google-auth-2.25.2.tar.gz
+md5  718e1a2c55baf3b019e9a42524812113  google-auth-2.26.1.tar.gz
+sha256  54385acca5c0fbdda510cd8585ba6f3fcb06eeecf8a6ecca39d3ee148b092590  google-auth-2.26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 8638a2ca46..02c8c1164f 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.25.2
+PYTHON_GOOGLE_AUTH_VERSION = 2.26.1
 PYTHON_GOOGLE_AUTH_SOURCE = google-auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/05/77/84608894384e02f3b0b2621b09ecb0b85e57ba368f13eecbbc43cd1b8719
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/bc/c0/b5119831db4888e703b2adaa912709931181678ae3a50ca08d51a3904765
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
