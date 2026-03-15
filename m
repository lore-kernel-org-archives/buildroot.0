Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34904F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1B8612B2;
	Sun, 15 Mar 2026 22:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U367tkdKF9mt; Sun, 15 Mar 2026 22:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002EE612B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613125;
	bh=/No2Jk4PlbYYmvGdlmRMiCr481M+24K+Yjw8D3ki2ho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hnW9rcUQkPR4kR9KBM6r6Yud0XS1cfMqzjBNSVaLW3NlV+8fBFZb/w3GLQn1ocTvL
	 O9u1EAtK+v50b74IKkiLu+UczEvX5srpaOQswsva4JaSlf3ppEvy+xEBfovTiTuXnc
	 rnyjiTTm2oI2RrRwoUwy/IQvVemha0nqwULWo8Zy15GvS4U+7/jsH4A4AcCGv30PM4
	 72gHT+kUdR4/ZqWEfUcvua3/bDcJrTVgXqpMckmXzyqeFzS4nKE/aqwlSsflvDD6gz
	 ZO727gzS9jpORuUSbz510VNeI1iABKsEZik09n0GbxkAhDt3yME85eqPmIUCYh0mTS
	 4b17Hoeri8gqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002EE612B3;
	Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01AD81B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1584A610D4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsJ92aL_4xhS for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D631610A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D631610A8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D04E583F4D; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c28208d6940a2b85a5fdbce15a9af055eed29cff
X-Git-Newrev: 8afd0f7f14aaf21b3b83bceebf10fc95a8abd0cf
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.D04E583F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psygnal: bump version to
 0.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8afd0f7f14aaf21b3b83bceebf10fc95a8abd0cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pyapp-kit/psygnal/blob/v0.15.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index 7903fcff26..29493977c8 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  9d1939a916e54ddd9324a623fb360bc8  psygnal-0.15.0.tar.gz
-sha256  5534f18e2d1536675e181c6f81cf04f4177b25a9e60fdcf724a25ce5cc195765  psygnal-0.15.0.tar.gz
+md5  209e3e54ae0b019d43486e8abf9edfba  psygnal-0.15.1.tar.gz
+sha256  f64f62dee2306fc1c22050a59b6c6cdad126e04b0cf50e393ff858a1da719096  psygnal-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index 2708931f1e..e68497fbcb 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.15.0
+PYTHON_PSYGNAL_VERSION = 0.15.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/5a/20/70430999aa609adb0601ec0f72bd23790a6e51a80ae6e7dc6621e6c5ee2a
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/4e/79/20c3e23e75272e9ddf018097cf872ab088bccba978888472656629efa4a3
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
