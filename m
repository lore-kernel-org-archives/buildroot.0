Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B5C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B57A605EB;
	Sat, 15 Jun 2024 18:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtSa85zGIlZE; Sat, 15 Jun 2024 18:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63925607BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63925607BB;
	Sat, 15 Jun 2024 18:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8B61BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66B6F4032B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_6MxYtZRmj5 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26CA44026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CA44026F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26CA44026F
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:49:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so26519835e9.3
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718477346; x=1719082146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4vHDkzpzVduNjqzhUpUbA+POaBj03SoWgE1SIhrIXic=;
 b=DuuVp0MmCu5lzs1gdZsZYzu4jJxia7DOqvMRWgLbT7ae6kNDt3rZIMuAeZqxAs9ppt
 ouJWgJmEg/cMfDPjlOFwMyRwKkvlHHQ5fLtVnrADDaVmDxD+roa7e4E9V7o1C9mqLkxE
 jUu5rebs8Z+ujvRuiwNWrG+YyzWDA3j7GWjbFmC5EW7x52lP17KFqzkUf9D1IFRMMcBf
 KWn3Bvnyr+fmrarNk6zv1zpQ3N756yI9SAiPRZOcqj36Crf6feET3VpEbGbnsBGcgq9d
 YNj3p0yoFwNF+ZtCbMBmBbDJTJEpQSvztSbDhZvTA0M2TNyt409/2iZnj7Itt2zyhlu5
 zSsA==
X-Gm-Message-State: AOJu0YyaREjb5oe8oz3Val+V9W2rPXridhAbq5Hw+80esNV5xw1roHN6
 C2zP3l0gOh96WFO28cuV4RptnKTXncB9tNJ8dSnQgUcZJ/0Ve5rbvFGEVA==
X-Google-Smtp-Source: AGHT+IFHoe5rY8obBOjrRAfVG+2e3SidnRoZS0okP0L+PHvFQl3YKqqanU+Sdgv5rNti03fHMaudGA==
X-Received: by 2002:adf:e70f:0:b0:35f:1e3b:3f37 with SMTP id
 ffacd0b85a97d-3607a75cadbmr3216245f8f.32.1718477346448; 
 Sat, 15 Jun 2024 11:49:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36087457258sm3148800f8f.89.2024.06.15.11.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 11:49:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:49:03 +0200
Message-ID: <20240615184903.2981842-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718477346; x=1719082146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4vHDkzpzVduNjqzhUpUbA+POaBj03SoWgE1SIhrIXic=;
 b=l00EBrgHtHvZ7Baoppz/cpJuoa+aYtAgfSyuVIQoFv1HG+ddfRqsP+7QDtX757ynKH
 qJmOn5FM7CbGYZOxfiKQIGOP7G8XmIj4Le4ZFNHG/GXSi7KvmhAlCc+dawCUZOdWQYMt
 +WzBkY2l6Xwbdh1D2rILzcnyBjz7AQE03gHyTjyTMffGln5wEJZf4ndmUgX4fe9BIWPi
 GPRZe1nexJ/t4U/rpnNU76pne49QKIrtNQDSM1GIRUfoF0p4W5D4nyiPDfPLhMXR0H4h
 EksVQWCZCcu/RAlRlrQN21gNlYijtnhTZV0KQeORnyR/IRRzmWD0aNJlI+ZaaHBLde0o
 eNVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l00EBrgH
Subject: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.7.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/slimm609/checksec.sh/blob/2.7.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checksec/checksec.hash | 2 +-
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index a29866ba07..856662b193 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39d4158f96bdc7533ad6595703375c0046951fe4f6367b831ef92d9c66c1a307  checksec-2.6.0.tar.gz
+sha256  eba0616f4033385d6093608a2a2aad3c2debb847d6778c87346f89c80946684f  checksec-2.7.1.tar.gz
 sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index ed9846ac2d..c1170e822e 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.6.0
+CHECKSEC_VERSION = 2.7.1
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
