Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B67C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BD2849D5;
	Fri, 14 Feb 2025 17:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkTwaR4k0Ehc; Fri, 14 Feb 2025 17:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9E4849D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9E4849D9;
	Fri, 14 Feb 2025 17:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A31DE1E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 922894023C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6tVveyQRm7e for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 17:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 686EF4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 686EF4013C
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 686EF4013C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:00 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id E44142038C;
 Fri, 14 Feb 2025 11:43:59 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:43:57 -0600
Message-Id: <20250214174357.2080209-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1739555039; bh=dWRzdK0U2rqaBQDdvZWY85YDC/iiHGQW3calvFG2EyY=;
 h=From:To:Cc:Subject:Date:From;
 b=xeHEfWgaH8ZTalA283UlkMLAO/wKXn1mVWfY52qIdWTm2ZA3Giw+bqO9sJK05BHoK
 n3X0Aqds10wW4Ikak8/bVxkXtmdpxp1sZeOoe4UNQ2PHg+mfMMtUcHp1d5zlcjQCOP
 mVS6UB736KHvZ0KBAfmYxVJUJ4Vr4sDPGYiS0QLg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=xeHEfWga
Subject: [Buildroot] [PATCH] package/python-evdev: bump to version 1.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream 3ff9816e08be95b331ea9dadc18fc17f1e04e272 fixes issues when
building wheels.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index d31e236989..733c0c9cda 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  a38ac9e2297940430bb27cea41be964e  evdev-1.8.0.tar.gz
-sha256  45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75  evdev-1.8.0.tar.gz
+md5  c1440732b435dad5796bbb8e91d0340b  evdev-1.9.0.tar.gz
+sha256  38218bc95507cad756bc621a5fe7a77a41eb8d9c1213855de8e4ba0aba28e79f  evdev-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index f465aff933..d24974a037 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.8.0
+PYTHON_EVDEV_VERSION = 1.9.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/4c/eb/b8900082a13a47bb9f69f415174d03cbf12ce95d07345722e1f4ef0e2093
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/8c/bf/0fe4d372ee62fe5aec06aae2e97c0603d131b8e3cbaffa2329e0bd763a98
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
