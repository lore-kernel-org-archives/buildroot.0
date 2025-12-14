Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B7D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7310409F4;
	Sun, 14 Dec 2025 17:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omDXdEScz0s5; Sun, 14 Dec 2025 17:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4431409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734489;
	bh=7C5D9/OMxOS5IDetVOy9F/fEhmihZcG0hkO2CEsc/+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kDlZ5YeQrTtfyOW6mFmi1BgpJwJHJTKFikMDJnyjli6O0e0C33ICiNT5adDY3Qi+I
	 4QN1bmZdA1I2pO6rM5MTM0T8oHxWREkQnXdcsjwizMDypJHYLaB1B3Djx6b8G5vdP3
	 HayZjzHOvea1hQxBDLnVb8q5oBxaT+Q5HGrKBOqfYE/hoj+qw32o9Ljy6iLon8axWb
	 WAktCk0EsX1HhnPfoQcTipDnxQEeUrGmY8fssIwn98Nd1df8hBaS5oag1+CnSVggvr
	 oB0xr/EzKcpN8eqXJ6UIRXcB7siJWA6Xu3C+gdZHLH3Gx0b3g6o7Vl6mbfad8mKa8w
	 OJpJQVrKVQA8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4431409F1;
	Sun, 14 Dec 2025 17:48:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1ECC117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE413406AA
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_AkhhxqcKaO for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F20406C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F20406C0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2199586E95; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da1b964828b69faba732b3e02747efa74088057f
X-Git-Newrev: 730f4093791b75e31ea8aab7a5e46573e16d7871
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.2199586E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump version to
 1.42.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=730f4093791b75e31ea8aab7a5e46573e16d7871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/boto/boto3/blob/1.42.5/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6a90235be8..f8816bdf1f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  087797c051098511747e710a15f1ff5f  boto3-1.40.50.tar.gz
-sha256  ae34363e8f34a49ab130d10c507a611926c1101d5d14d70be5598ca308e13266  boto3-1.40.50.tar.gz
+md5  2dd524bffeeac5d9ee37f8ca136558fc  boto3-1.42.5.tar.gz
+sha256  e3b7be255e5e29272b6424af4417005384f5a3f1caf6ca3352258ee1d9b8551a  boto3-1.42.5.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e343126e23..e3da232e51 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.40.50
+PYTHON_BOTO3_VERSION = 1.42.5
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/ba/41/d4d73f55b367899ee377cd77c228748c18698ea3507c2a95b328f9152017
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/8b/91/c00b45b5ca95184f7ab6140f586ba7d23074168ee3feae3eaf6954cc11c3
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
