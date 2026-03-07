Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0968CFC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 873D4819ED;
	Sat,  7 Mar 2026 10:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzkFUgEOyFLs; Sat,  7 Mar 2026 10:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 908D0818E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878053;
	bh=4bDLTu8QumiboSyroUXSYp1Zobo+OONOQEqef+vudYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qMwceQIAxw2k0/5PrvrLCMbHMA428gV7kx3Fr7Ewq4vJESwfF6R8f9o3dypeZng81
	 fiV78XG2c5kkyNZ531Jy/da70qQj9UWoQP3NizVtPSVoJkWClo6YOHcXCsRlssNfzh
	 0nwJo8Xmg705MjAZCFvjsEakupRDP5IiqbuZBY6reGvTRTel9fW6yOQEaCezY6UWDN
	 XBYMy/rKvd4tvvaovBsNRaseNINUWmS2G2iG5YaglRNZSLBFE5S5e2BvE0GrV3t5ir
	 UIs7vKZMryV8ErSVMUB0J1mVeRphoNsfya4n1CLhGg19aYHhB7nOrerqVrYZgTVVVF
	 fIq1JcwHKQzug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908D0818E8;
	Sat,  7 Mar 2026 10:07:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C79782F8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B994A614E5
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaBehcjViniO for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B99B4614E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B99B4614E0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1B9B86208; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d62b605c1aac355c6aae79a13d75f0ba8ce7ecd7
X-Git-Newrev: b9c60c567587dc7a9957e5ec29fe2558b76e75e7
X-Patchwork-Hint: ignore
Message-Id: <20260307100729.C1B9B86208@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiodns: bump to version
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9c60c567587dc7a9957e5ec29fe2558b76e75e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index a4a242670a..4cde1c4b1d 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
-sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
+md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
+sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 7476c76b72..6befbff203 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.6.1
+PYTHON_AIODNS_VERSION = 4.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
