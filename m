Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A80606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qxk60Oay
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B63760A70;
	Fri,  6 Nov 2026 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdMVEplwZOF0; Fri,  6 Nov 2026 21:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20B9160ABA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999709;
	b=FZA4k7uCqxbAo8FJo7f1sOXLgeTTLdGWX4+AmYuP4Wq6HMeECiuXHu9CzWHJ1f43Uj+W
	 EpWXqkHguI5PZZYCdU/fF4mcznqqpqOGW3pZ43iS+eI7xEZLW2OML5A8F2FBDDd2tEcPA
	 79E72Zp9YDv4R0vcIjJWIKSd84Sy3vw7nREcXJVCcR3ixccWo30lY8ljgNUk/q1fokqHl
	 ewno/XdYv5/Thd2tYr+6qr9K6gHLaAZT+oc0FSv9cqjaZwH3vO0KMSpw34LLXqwVaiRIN
	 Xf4EWivKBj/oEmtwYIixdrXGDZTerr3UTjt4y2k/fBelrZpUgOt07+Nu3K+XHqosIPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zdo6d1E7w69r8MIcHXuliloIzbFFUOjStxIKompKepU=;
	b=U7wq4+k2a2Sr6sBMBuz+BmpA+/JJ8uXsISIE2mvIOsARbnFuWoVk1SpXOcKcBl713jtr
	 n+3/WR1CscPjCVMjTn4rIDT15/s6EKAI81cm1fqkJbk2AjSSUi9MZd5yuplVJANBUSuyF
	 RIjpiXDxYLkq/GFG14+q9x1/Tmldbho5vxRJygaBo+eOiJEioeCTZJ2pM/oh8qbz9vBCE
	 T5zIZcITwkYo6u43SkiGCHZ0P6HSDtClcIM8z0WKLexAXZnjvB33WN15dlaSvqBHO5CUK
	 8W/aGqKsRN6Z7G1F/2qJcaVEyYt3MlPIVaKAJctqDc4PalNtRnS3TeIC3mF4Lf65KTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999709;
	bh=zdo6d1E7w69r8MIcHXuliloIzbFFUOjStxIKompKepU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qxk60Oay69/uFhvCSQqMEt7aNKghfIMEtqtrTfyyAJlUsBeckTpsqf89VJRFega+p
	 ragLKZC/f4kPTU9wa/qLK4BhBzqvqBuSYscVujlRSsxTgzda1w+dLC9EzEQsv5S/W3
	 Vzu3Vkn8Xb1rNKrAiPK0b56/yr8VxuCEVyxV6NLx30WU+FoJReCLj5P+fI+O78m5Vc
	 xtprLMcHQnvGeVA1a8SkTK7fo7xpiK3O9FYDMtASeiAFGLMolLw0MguHMez4do229c
	 U2rIi9LOukibfYcEEv4YFLk3a4YUrMLus+6kXPVSTG/h2QeAmz+Wt193pdzCkqeYdy
	 9YhhOhFwuktrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B9160ABA;
	Fri,  6 Nov 2026 21:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B5731F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A5281230
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAqquSR2MAlz for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A42E281250
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A42E281250
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C083B9DFB9; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38ce14eff8a2edc4925230336c111720f56fafe
X-Git-Newrev: 364094d2456cdad77150cff9eb19e979c233b176
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.C083B9DFB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 6.1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/364094d2456cdad77150cff9eb19e979c233b176
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 0d5fff4145..14b1159f4e 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  0821265a819a657e8b9fc5147e4cb3b7  ujson-6.0.0.tar.gz
-sha256  80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae  ujson-6.0.0.tar.gz
+md5  b6e936a6267ceba1ee44a40358f34cef  ujson-6.1.0.tar.gz
+sha256  aef7ea4cd9e2e9f8a35c4538a9780d58c80d76c5da66a8dad269b4cc6d930c29  ujson-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 11059ef2eb..8769cede36 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 6.0.0
+PYTHON_UJSON_VERSION = 6.1.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/64/7c/e1fa3fb70b53192436d751b5cb671f0ee960baa188b8351a7fec735223d3
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/e0/60/ad782f70ce03d12ec23288292a17549ca537f9d188227340ac0d082421b3
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
