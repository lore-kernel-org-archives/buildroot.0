Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE02CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A9A4097F;
	Sat, 10 Oct 2026 12:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHLzl7iHsBoS; Sat, 10 Oct 2026 12:11:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5AD374097E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634273;
	b=Q9GvVkCX0iUZYwXpOc/yoKZJTxYVi2CAoJKCB21yD1vjEsFD94FKYC52HFCBpjC7jg0V
	 NiQDOkC/lhwTjK7QzquwbuWezwIv3BhXXDcDTvKVgzzumt/Nqx1SoGDavwLJbZDKEmlWO
	 V6a+6G505/M6fKGjgwQAhfAnGnDFIPpe13OPXyMFk+J5S/nh9DpB4Jmb4tCkY51irFIka
	 Qu0L8TQomXZOkAUwfSFHtLroJMBSthBXFstwKm/ur5VqtOCiI/n15pwu/tuha1i7A/kbT
	 P/CjB8yqitNRgWf6jdc/M2kqZHvk33f+sWqB9NyYUalhLG/Ii4AkBRG336Q3bo/Egdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TXBtOdvwtd/DPjjKbkxSTosntvQNn29s66/VrBjYqLo=;
	b=tV+V4ZWZqnmLqAQVLE9AkQEX3iFmaYOWueJvDzq+LB6anbANilQnXFgh9Q6zbcAkbt5T
	 VnU8LKNVaZNDnab/HA6CgDcLOJWGNJ8YSgL71z+wfHtw/5ZEKip0XmSgRPKBg7snKW8fz
	 NFY3sENAvtOF2hpgrzeq9eKIMUQgrDKyji+M8/p/GmYRUJPR7hNcFFqaJ1ynoqnQULv6H
	 eMvdM7uvf39NMMsPDiy+Ayol6XcbBXU716mgMZv0DiHPujNvaR06dWUJfTgyArhs3yhPd
	 T8BQb3RPevcUa06sGHOpHVULrwxdyStgPbVJ34njXapp6W+YDn8QYq9B4rKCGbt2yrQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634273;
	bh=TXBtOdvwtd/DPjjKbkxSTosntvQNn29s66/VrBjYqLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iK2mEHx/riluNWQ3UuqVWrywibap0UkgUr+kDtfJDTVBhU3hdDFvs5jePgy34sAhd
	 nqQVl6Is1OpjXk1G2Rj0GEr3oX9geU7+8BAvYj95QZWfngfpi6bFgFLtIdYYWM7VYn
	 tECz1QYWgk2m5mTQMj+Rh7uWJnM6eDCIcULpIRLNHnKcZjK4WDg9T5abrLzTCPToa6
	 g8/lUjSLvBNNb4DiD/3oE4e5+oRPoxJeNZiUuHvZH/XQNY7zjRNKAscxN7eqEczw6j
	 agQtVJSLpX3y1VwkCfFsG6FTzoOzi8lcfKHt0V0l2Xkq7K3dH2tmwjVgIvu9zfafnB
	 YiHP2ak8B41ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD374097E;
	Sat, 10 Oct 2026 12:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15D0C9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07AFB40884
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5_0_fUOD6cV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3580B40945
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=YEX8R6yKbFwGo8Jyb3ZTnNTAM05mg3j14cDGwpPc0nBCuw8DfwKWBx4ywOYAxxyetWrH
 rXTyA2Z7uJ1vByLogq7GExNOYJMOowK3Vh+kyOBRtSztYDQ4byJnmivHOCBWuKnOlNUPl
 Eb9kBQLOB8T/0DQl+wJdwTPXvhOgYJbE8bslGLJCT7oy071s4LtB533fUcF4wo/EEMU8A
 n3MJX3CQVNLXjEZvjBVyBOvRu4rM7KiY8fRjs64xr6x+OvigZshIAzoeL2eR/VFM5Qj3I
 euDkspjIxiK92Pontm7ljfCbE8BIPJp49HrA1AvtdjsRDykOVko98KXFHZJP6t6X/qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SCKlFMB8PlDNyq9R4H/f9Yb+ZphCDOvWMq6DCyS0Dxk=;
 b=qCSQiHs7qstewLL0vVVWbZV3xTA2djp9JJ7zmalT1LLyr6B5grC5mIkIryjWvWiNmZ+7
 fSth8F2q5DyVzvVtDdXWONIsqfP/fLrs05E1h2NuSmPbqjuFHChlHiwgRdb+IcEibcMgW
 OLy0jfpvmXxWQ/1HmO+YuAkGcr33hGJxfbu20Y2ofhco9yqk8wjPMPOtLfkHY7ECkzrUu
 uCdnVmtMS6L3UnMip1cQGDF3P/UXUPY8BBfhqlq7UsV31tq2/quuVVjTK0pTufeiwiPJl
 imlgsSx9zd43F6gKLdIRTsQROm055FM+Si0bmnynbwasnBUL6ejUx8RbTKYbxXnnACg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3580B40945
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6BE691A66; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80fc1472e69671759eb6d047b3b9b1a1388710e4
X-Git-Newrev: 0dadf9c38e3d4646f3bcc6fd965fde71b6dcc95d
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.E6BE691A66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.40.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0dadf9c38e3d4646f3bcc6fd965fde71b6dcc95d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the python-opentelemetry-api runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/Config.in                   | 1 +
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
index 88bc8326b5..155cd2fdd5 100644
--- a/package/python-google-api-core/Config.in
+++ b/package/python-google-api-core/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-google-auth -> python-cryptography
 	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_OPENTELEMETRY_API # runtime
 	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index c080165c33..c99105cd6d 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  0b8a8deefc55775475642b4a6799e912  google_api_core-2.39.0.tar.gz
-sha256  824ee414a10adefefae33fc5e2ba28dc6f0f7089d011c9cc98ea9178e61299e9  google_api_core-2.39.0.tar.gz
+md5  96fb3d02ea327ff1051fe3a7a212b9f1  google_api_core-2.40.0.tar.gz
+sha256  ebee7d1b138b5362beecec260e6e8988ac97346562c7382ccb6f0ad8435c599f  google_api_core-2.40.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 3aed7f06b6..0da2f694f3 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.39.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.40.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/44/8d/cbdc715cdfb7acd7ccf1ce2869b103734c6a3cf124afd021f56c10c17522
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/23/f7/0fb8c3618c783ad49da1aaf97f93a4bb9e4ed522135516b44d129a7f85bb
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
