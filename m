Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1995C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87D241974;
	Tue,  9 Jan 2024 08:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87D241974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35RCm1vxLsBL; Tue,  9 Jan 2024 08:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95594194E;
	Tue,  9 Jan 2024 08:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95594194E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A32481BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C22460E27
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C22460E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYo5c0MdJ4jX for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:42:39 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9865360BEC
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9865360BEC
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3606f8417beso10426105ab.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789758; x=1705394558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YoUTIEt65asTuJDspRdQCpB/II0hlvw3B8XAzXvjmM=;
 b=F7ul52UCxh2XaaJ2eFoSrlhmhxIkZP4hzNFaBlGGXjjmdA9HbedxPKioCF+pEPczg1
 We0d2iwCgZsJ95G902z5nadzVrXRUdA4mPjOCoQJ7QIpnJTilJ/HHSfGjjYu/56e4p7v
 oNhxk07bGpKkKTICncig2kBCjNS4FIbinVj5JDRmxFlnfJGIItqLpRndKTsgUH04/lyi
 RUtnCltPG1gNrGBNy1V68fmBtiy8VHby48YOEajRb5gUlVuln8XlEtmYmMu4YoQ89IwQ
 x+a/tVhFowK8Jkfz3VBgYesBczgLFTHfIRb99Ab5gTBdzYTbteUsxtpR4I2stzm/1IVy
 I8jg==
X-Gm-Message-State: AOJu0Yyav92YBRR660j++GjAVrmymE4G4dHLTdNN2/1hgkufgJxWQhRv
 a22pms4nynlg7nq3CUwWJVhc8LmE9n+IVw==
X-Google-Smtp-Source: AGHT+IG4F/LzSvvCwqc4l4aNhp3FTu8yeU7rSUlecefTpyjzHWseiy2wggRvu1y6oJFo8WNlukK7gA==
X-Received: by 2002:a05:6e02:1564:b0:35f:d180:7081 with SMTP id
 k4-20020a056e02156400b0035fd1807081mr369502ilu.3.1704789758099; 
 Tue, 09 Jan 2024 00:42:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bt15-20020a056e02248f00b003608dcfeaa2sm499991ilb.23.2024.01.09.00.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:42:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:42:36 -0700
Message-Id: <20240109084236.4087932-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704789758; x=1705394558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0YoUTIEt65asTuJDspRdQCpB/II0hlvw3B8XAzXvjmM=;
 b=PY8ErQNtzpdt+i9VmF29ntgXO+lQ4hBEVnAdV3koyoa0QotmWrvXQRZCTDCIMUcQt+
 CK9xb0fMpDYYAjiI0E8JwS15bwBZplxY/CQRk8HkR9t0p7UWzlghpuv6UczPqza6spCm
 8feIQMOedYLu5GeDY/dhKSt5oNpufAWx45A258NeH7n1zQ1rwu0bZAGJ4ms3dWc85t02
 QU01TNkjolZU8J2L1iLxQ+YheszXipmoyPfWD0zA3quXLBi31lI/+I/Fn3hj4xBXjzSF
 9GnPXMeSk2qZZPUNHESr1JYibsunjVDL3AmYleaHESo2dJXiPESSdPASAgcjERyIFjYG
 0Axg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PY8ErQNt
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to version
 4.20.0
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
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index f421b8a48b..645a6657fe 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  8bf5f0a2342dc4c8390c28a99be555e7  jsonschema-4.19.2.tar.gz
-sha256  c9ff4d7447eed9592c23a12ccee508baf0dd0d59650615e847feb6cdca74f392  jsonschema-4.19.2.tar.gz
+md5  e758f0f6a8f3f59d754e7e35ea9f0792  jsonschema-4.20.0.tar.gz
+sha256  4f614fd46d8d61258610998997743ec5492a648b33cf478c1ddc23ed4598a5fa  jsonschema-4.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index dee87e8f9d..512c92aa77 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.19.2
+PYTHON_JSONSCHEMA_VERSION = 4.20.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/95/18/618159fb2efbe3fb2cd32b16c40278954cde94744957734ef0482286a052
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/a8/74/77bf12d3dd32b764692a71d4200f03429c41eee2e8a9225d344d91c03aff
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
