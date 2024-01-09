Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F403C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DACF41E2F;
	Tue,  9 Jan 2024 07:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DACF41E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MutzU7eonNqP; Tue,  9 Jan 2024 07:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7056B415CE;
	Tue,  9 Jan 2024 07:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7056B415CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D810A1BF59C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFBE082430
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBE082430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_8HU0WNRKZs for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:52:32 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D84A682400
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84A682400
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7bed8fee278so19014839f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786750; x=1705391550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqYXKyR/0uz09MPZdmRvWBHLVHh6tVDqf1a5q3ckUlc=;
 b=O0hFtyituFa2EHMG5Xme9WhLjcp3TE0+oI21hTlME3ZVsS71X/h09ET3zOfw4gFuCX
 dySWfyOPpJBWo/TpI8nKwP6CbVBwKbNb3VaRp5pT2La3LK/HX74bkMYxwFbGuLKDZENH
 aa4iksuwFAz0hBRedfddmUfbm8BfDhTrwR+C3bpevjgELl/DDZvYogdjoD9/VIBqTEqQ
 3rNiP7EyUS62m1IvRUVP3oYplVbq9yg1wrXAKnfoFPEU/gvKxPi/SbuasKCVI7yceibp
 jXipYtfZgfIhifQonKRLG1CSJb9yQsWI8eUX1ncZfrffmVVTMAESGpQEcn4x5jOWPDpF
 dPKA==
X-Gm-Message-State: AOJu0Yyvb+lIZE6F7DdANcc4glHJxJ7qUw8Jk4NZkxJN1qGHL5SAIFLb
 otZK5papLOhTl6VwzaHiME4HEQHhY/JB9Q==
X-Google-Smtp-Source: AGHT+IFn2fCBgKOfy9wc3Fz866F+tJqpGtWC5BXjw72UXvxhB3SYk6mLVdH6XuQuG/cwlRtu3FlqFQ==
X-Received: by 2002:a05:6e02:5:b0:35f:9f2f:d67a with SMTP id
 bb5-20020a056e02000500b0035f9f2fd67amr7250774ilb.44.1704786750489; 
 Mon, 08 Jan 2024 23:52:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bm6-20020a056e02330600b00360a0fa3f65sm3478ilb.77.2024.01.08.23.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:52:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:52:28 -0700
Message-Id: <20240109075228.4051839-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786750; x=1705391550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eqYXKyR/0uz09MPZdmRvWBHLVHh6tVDqf1a5q3ckUlc=;
 b=V5cRPTjYRpkOrNhvqnlAdCqHdPYEfagKOsOrjoyheLp6rAmACdkyN6xJ71Uz2Dgx1o
 FfUFwboCbpQKyKcIiQGEA+1fkjehuYz3+gDw5zwgZDPejw86LYqYtg4DWH3Ldj2MxNAT
 H8hcXfp0chy7mxqtPjC9lNPG1bJFE/5Tn3hJjFzyZM4lCXDQJFSWifru7/oBSUjdc4Ns
 KcstwoYra6e+oM9gTk07Ikbj1x+qKtudsnqGr8mRvu4fZ+GI84reIVlPo4E/xiLartye
 FsSz67HLVQBIA1oB0ILS6Y7XfxwXzO6hDC7BIxcA8v0cCOhcFsTbCwpnoACQonUu+qnm
 8Kkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V5cRPTjY
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.2
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gnupg/python-gnupg.hash | 7 ++-----
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index d52b634b8d..4a194ad41e 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,8 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-# also checked PGP signature from:
-# https://bitbucket.org/vinay.sajip/python-gnupg/downloads/python-gnupg-0.5.1.tar.gz.asc
-# with key: 9147B477339A9B86
-md5  c5d99c5f0456f8cbf69324ec5e6acaff  python-gnupg-0.5.1.tar.gz
-sha256  5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8  python-gnupg-0.5.1.tar.gz
+md5  b263ea268692cfe687d29d52daab4770  python-gnupg-0.5.2.tar.gz
+sha256  01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c  python-gnupg-0.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index f582f4cdb7..ddf2287f9b 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.1
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/62/7737485f44bd4d7d904f4094372f4119195865b29f119fa51a98e121a13a
+PYTHON_GNUPG_VERSION = 0.5.2
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/5d/4425390ad81d22b330a1b0df204c4d39fb3cb7c39e081d51e9f7426ce716
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
