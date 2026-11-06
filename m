Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C725606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JFbDWXuh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2533960904;
	Fri,  6 Nov 2026 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scWAjAoSpUBz; Fri,  6 Nov 2026 21:14:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C5D6E60A46
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999680;
	b=Ju5oWU5hVvvro9HF4WL++MECALpypCKwXCXsUuEEI2CUtfQ4lUvuaOHj0kYjbZTHeqnD
	 vCvD7F9+Q+A0kyGQux3G7IDCK4K9jZKI+FPdX4h1CCALFtME+E2fJ6zwfGcnA9N3cI1bm
	 leiLTi9RxbTc07T9gbRo1OI9cQDus7oDZ60TFImwkjV9u+ur8l4R10wG0QGkIj3yZ32Q5
	 rYyOVNlQWnmJeOrbjP65RTW/9PyMQE4ZcFMn17ENToiDQrDzGAZD8oF5HT0Fm+zpr7lGP
	 cqbmu2yZY6zsyzqHIW7FtRuhpKJre39NzGI7dx6fWQgU/cyMr5qZo0yh5g47L8MP8uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H9zWFikCtcTJv373xUyhqKxOm3fxfnATktrF4FlYzVc=;
	b=dffmVNLe3Awytg9DOYHB9nrW07x6EZmKflIz78cyMD9x/ps6+bDHW5vlc2wf64uz1i23
	 zlrBVqFfI9NkxzwNOdmiPRXujoA9XPt0091NG+oSaXAv7Ul846Erf0/PTwLmY38R8Kbll
	 kNIoukq1VXIIxLlTCMY77vRadm+NmKqnaVN4Z0lCY9VQ2MlenRnToBibtqYcANtWr4SBG
	 bFDqkusiGYwdeyban4gNJl/NE0V6VFWFdtkNXYqU3i6o0zAx689TR+onURhRmqXEzMruC
	 8FONCxRI5qoDJcK7qVpL/Rlrb1YdPnJyslM7m0LDH4NuMBTgs7gsRaja26EAX8pcUxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999680;
	bh=H9zWFikCtcTJv373xUyhqKxOm3fxfnATktrF4FlYzVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JFbDWXuhjvrxu0Vgylx0sunMbzYkBGn6YFcvrmlWPmtIFHRUEISOoZlW8EiNeGWH6
	 f+14BoooUuyuDZHZKfm+m6m1wDkEnGbpD8sKBaB5HPIW9CFQqxA+VljEc8HH5Q+fWo
	 x8H4Xal43FJA3KakAp3YRuMPh9oKXZJqDLUNEfUW/zGiy1U1Ijd8HOic9o0zXMqGh3
	 nUPhs8dUl9GLxhggn4iI4VP5V0+T5CfWAX/RXSir57RGQl1X2v6MPRMmOKyg1g9mM1
	 T4tirvudGRLqCVaAw7RzAHkRmKRhl1xLnBERZ2xvk/JZyJSTBobM8Lj5Mg+xL2m0Qg
	 Hsrge4ZUgFdjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D6E60A46;
	Fri,  6 Nov 2026 21:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 853774B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 773BB608A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BojuE0uveDbr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF202608BB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF202608BB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCFB69ABB8; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6de3342839dfb2d7b80ee3d15c2f04b348d5d695
X-Git-Newrev: 52d30f93fee0715ae43582cfc15b4242726c8f3c
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.BCFB69ABB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.44.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52d30f93fee0715ae43582cfc15b4242726c8f3c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index be09a0a49d..3d9ae90a5a 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  ca991e5ca3103553a8798db83c30be5d  google_api_core-2.43.2.tar.gz
-sha256  5dfc5e9d52982bcc03bd6af380a893365b5fdf907dc527f63d3a372833c33329  google_api_core-2.43.2.tar.gz
+md5  224eee0f680689c74b802dbc612358c3  google_api_core-2.44.0.tar.gz
+sha256  5ab9a396965c1227d7dea4581e562b7018aa2bca96d2de0be5eb70dc9c8ab3a1  google_api_core-2.44.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 9d58e498e1..56d83df8df 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.43.2
+PYTHON_GOOGLE_API_CORE_VERSION = 2.44.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/a4/74/307919972c4dc84598f4128a8d6ae05ac3d9e6ca73fe60a7bb93c670931c
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/72/ef/63d89cb580f3a42c51db53b3d151352aa61b9c87ea8cfdd8d24ee6caa09d
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
