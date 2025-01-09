Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BC6E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544C840202;
	Thu,  9 Jan 2025 19:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO2obg5vWB0Z; Thu,  9 Jan 2025 19:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D96C40548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D96C40548;
	Thu,  9 Jan 2025 19:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E119076C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE70040926
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iy7odv7IRBx2 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F711405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F711405D1
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F711405D1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:10:52 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3ce301bc718so8910665ab.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 11:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736449851; x=1737054651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1sFBt1yWGhO4yyTzIQD5MZq87UQmwMIQofiIuWOpaY=;
 b=eGnWlFX1SU9WyjaYfOi2g4UVDvOcE+PsUtGY6S1BxAj0DYsmyoQiM40EV2ndsrmqup
 kNL2jr2m+NDjEmVxY45wrLxTq1tWNLcmIbh8RlhInmA64HghSjhbyrjJDU/WR8UDl4F+
 jbgMofTCI0k/EXWi53HBI39IGYOFlUUK3cFiBYCJocNuqkH3tEVcGxnxtYofmqLAduYo
 rfxne3F0mnaEC4gyt1wCcrtoRO2Uy5w70o38BpcAkVmO0FFZ0E0kMvZER+VUop9Gx030
 4n3v5pZ8e9zE7HsCo0inhdnsiKJYXUujLrp5rWvvf9WQnp8Hu8im2Tq+XtY2hB61mudK
 sDlw==
X-Gm-Message-State: AOJu0YwB4kIUtFwnqcn0pMvSWFytDeTigD8LDUHQulXQ8C4eUfelGcEc
 GHppRpFvW3aIbNWy4+tUCIBD+8fAP3th9HwgCzrQMhCXGf5ComXyhdPWnOTvUA0=
X-Gm-Gg: ASbGncuoASnwPBtC+jbwM02ToHl4P9Biku/ULQc2GRedkIRkfocgWTeLJEtydMOn8io
 6tUKbRYZEYdhunuDoeGPd2H+EHohEFYEjbuBz9AHLS1qi0S16D8EHaoz6+KYySqdic7Xsxbgqsv
 ey1dIKO9rfMomI2h/dUpNe8DK+CQ5hGIsMX2WiPGwz42n2yyncAVgKCvQMGWbdm2UeysSRMPyNe
 llKyNxjhFIXW4v7mDWgMFJClYynYsDtL4sBSGrIHk3mP+7v0KgNhiP/kqkRO3/kELdv5ZSe8t5T
 ib+sLvz7No11CtqitJb4dJverU+FdLk=
X-Google-Smtp-Source: AGHT+IHmgmezutusXQ4I9mMzwVRfPZ/shks7enu9zeWUKEdjfIO5ZO2ZIa0//hh+JutPu4kEh/Ntbg==
X-Received: by 2002:a92:c548:0:b0:3a7:e8e1:cbc9 with SMTP id
 e9e14a558f8ab-3ce3a8f2809mr50138965ab.22.1736449851242; 
 Thu, 09 Jan 2025 11:10:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7177f0sm452905173.101.2025.01.09.11.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 11:10:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 12:10:49 -0700
Message-Id: <20250109191049.2355223-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736449851; x=1737054651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I1sFBt1yWGhO4yyTzIQD5MZq87UQmwMIQofiIuWOpaY=;
 b=j2ALeeKwGlUB4+t1/nk6UqVBbXvuTjBq9NOG66McL3P+CR53puLL2sqxpTW1n4vd5X
 khZmqeXZyruwIslxngN2lfFgoB+ylyGQg1getLidTUwpU/PV9s3w1Y9d2498T2O8Zm0j
 YFhoE11G3ALBpTxZcdNgbX9fjyDUwtd+9GpmFSbbQswSTv+fXq7phFo/ZQQpf2YEZsjC
 cjq5NdedlNZvmbTxT/BeLD8WRUQWpMBTT3iOZGFPW4QESE1Gt1E19gom/flUe8kqVPAv
 zsoluLMS+PZyAeHlEv+4SeJhaV+jqxseH3/FU3KU331ajjLXr+Zx8180Fk/hPLE3501A
 TrCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j2ALeeKw
Subject: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 7bfbb5a9b0..ecf9b56954 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  89f6b8186a8772dcfc54aade5e3495e1  apispec-6.8.0.tar.gz
-sha256  861cca82bbc0652ca9acea896921b254944580342fde849f86f6dac1acc6ca96  apispec-6.8.0.tar.gz
+md5  aaec05af7368f2e19f562a63f00e2e74  apispec-6.8.1.tar.gz
+sha256  f4916cbb7be156963b18f5929a0e42bd2349135834b680a81b12432bcfaa9a39  apispec-6.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index a02a1cb8a8..3b87ccdced 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.8.0
+PYTHON_APISPEC_VERSION = 6.8.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/12/66/81f6f31feafb0ee2f6c649ba33f4c768f837bbabef279f12053d00a7099d
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/74/38/62499ad75cf085f5268458c09ae97007082ed85aec1a9cd9e38f7685fbb0
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
