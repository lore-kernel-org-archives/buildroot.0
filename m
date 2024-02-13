Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73675C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BDA8223F;
	Tue, 13 Feb 2024 21:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4C-TJlyWo9Y; Tue, 13 Feb 2024 21:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7709B822AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7709B822AB;
	Tue, 13 Feb 2024 21:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 556231BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42B9B407A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCCr17F-WkRJ for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16817400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16817400DC
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16817400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7bc332d49f6so238149839f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858936; x=1708463736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pk775/ZaaVN9ADxVx/hCPwESWxY6/+NNGqqoPU3MN9A=;
 b=gGQ0RbdrcG8RLR7Q1Qmi4OrmOVVwEYQ+Vn8Jkdyo5QbKtGUSsQBT2hwDyUzjAeKz22
 3b0y+YewgA0eWUAQVNGJ0LcrzwQuRts1FIre+7OKIRLCe2BbWEP90+CL9f3gthU75B7s
 W3odZjSdxsWtdCZcXusxFedNIU2ZeEJA1PXZxCRlWokCZYLn8czGHrf6QHXNRMO5FT99
 ExQvtfC3i2sEOWqm2vYDN4XMwqI057PGmVDntylCVi8faTCt3LCZztsFtow+vlPQXVlf
 dT3sQu1PIM3Of7zankTALc/L9A+mbXmIjy+g7OK2La8GdejeTSxTdViJxfKHTX+VeZkg
 WzNA==
X-Gm-Message-State: AOJu0YxAvMpMRjBs2Jnd1JV3NLir2j0z04XsNDNZ5f75GLQ4WODGDfbp
 dq5H5IRphIu1UThj4Ww/gK4jaOu1sNFA56uHbm5MOwPvjeS0mieWQfmCknHBMSdWOQ==
X-Google-Smtp-Source: AGHT+IGPQEt6dA7HYhR9sAn3qvCJe4uQ9O/hrJtzCROTc0LewNdnZFF+LTUtSXeYDTPQeETwIiBdeg==
X-Received: by 2002:a5e:9207:0:b0:7c3:f162:670f with SMTP id
 y7-20020a5e9207000000b007c3f162670fmr908536iop.15.1707858936428; 
 Tue, 13 Feb 2024 13:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWRzRF3NKMyR1B18PH/pJdcQIl74Zp9R+++5WSo04u8ZeCk6UP6opD4L+q+WPVhg5VrFv+rPxNRlW7cobqKpknM2ugo8rsDvaZoRBWv3pmXjdllO3PlWp44DwupQO+HxmJwIJ9UbmZmR7BmmoOPJPPirFEJaDoVeBwNuunD19YRV43R8uxt73Sku7w5VMligCsyPBspMVEeYmzz0kvvq6TwPen+3MIUkQ6ocTMbZTfqHYFlf2YTJX7ST+/mpNf/zcaRESCgC4zx/iY7MvCi2z98X7HeY0+1iUrh7kDSFB7KaewH4F3aJksAA2gDcDomfyHucTO6KTZIEdsSCKH7BUDOjQFJBFh9yd5z+5qHlKG2o6bA8dntNu663Qjd3WXif/93U2r6AoeECQ36eOLy3sAAgJZEfHM9BtNLn5fhLsXttK0z5FgvRatdJ8IKhgx5oHhq/B73mxllFIREqKJCTFGIaj7FUFVGzqCjMPJUeBeH+RcKnr2wiHVz3I09kZ81ploj+kC6LRvBZKs3stURM2A3DiuV0HbSebRKU37ySB2BdlcY9V+FlR92+Q2OTDERWO58eD4mEXaBhhH3/omTTF1nDUJGVP5lRsDRPuj82i4XI+6BZV+mFVKtVHAKvmGPBEm5K7q0ockmriL5WkPLqDrJ2bOiMDSA+9Iu+/6MXV+A3WscQr5MKp40asm6x6ZRCojuOJdwK3zOrasCs2Mzluh/b5xx6DZ+9WPKOZSea0kvRo9yxSyA0g==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:53 -0700
Message-Id: <20240213211512.3918044-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858936; x=1708463736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk775/ZaaVN9ADxVx/hCPwESWxY6/+NNGqqoPU3MN9A=;
 b=g1TrJow2MexLDn6GtIikLBl7ERKRiIW1Cly8eAFd2OyRBJ8QvNLG4G4mFdlnwa1kU5
 oKio3n2crL2Tu/LvknOFNK51hJ1Gy8sgSKFv/sh5b5R27m/l2LlL3VuXHENtv7kMk3lu
 LXsZ2bpWtwLnY3ipKWkWR8v8r1C27NTrWlpEzrHXh6zULDuT55WjaHpd+ABsWRpqHgEQ
 WmU7m4DING6a8qlKOmP3okFrc163XGtumNDhrG5wtBUrexuBIuZrki5qCKFmXGCmHESj
 IrPg8e9fWCquyFhXpDNKFRjN3meICf8qFEIhzxwdxFWAyyLVspXl+42KQYSMq4HURowB
 9DAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g1TrJow2
Subject: [Buildroot] [PATCH v8 07/26] package/python-aiologstash: migrate to
 flit build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to add a patch which selects the correct flit build
backend.

As flit is configured as the pep517 build backend for aiologstash
we need to migrate from setuptools to flit prior to migrating
setuptools to pep517 as the frontend will not fall back to using
setuptools once migrated.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Fix-flit_core-build-requires-backend.patch | 31 +++++++++++++++++++
 .../python-aiologstash/python-aiologstash.mk  |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch

diff --git a/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
new file mode 100644
index 0000000000..99a150a344
--- /dev/null
+++ b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
@@ -0,0 +1,31 @@
+From 3c4d1203eb9ee3dbe79b096d587c9baaf8b802ed Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 11 Mar 2022 13:26:31 -0700
+Subject: [PATCH] Fix flit_core build requires/backend.
+
+Only flit_core should be required by pyproject.toml, the regular flit
+package is the pep517 frontend which is not what should be set for the
+build system.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/aio-libs/aiologstash/pull/258
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 7bdaebb..252a660 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+-requires = ["flit"]
+-build-backend = "flit.buildapi"
++requires = ["flit_core"]
++build-backend = "flit_core.buildapi"
+ 
+ [tool.flit.metadata]
+ module = "aiologstash"
+-- 
+2.34.1
+
diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
index de0ed820a0..bcf60a72e9 100644
--- a/package/python-aiologstash/python-aiologstash.mk
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOLOGSTASH_VERSION = 2.0.0
 PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
 PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
-PYTHON_AIOLOGSTASH_SETUP_TYPE = setuptools
+PYTHON_AIOLOGSTASH_SETUP_TYPE = flit
 PYTHON_AIOLOGSTASH_LICENSE = MIT
 PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
