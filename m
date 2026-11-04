Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5E606B3AF
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sELX3aZq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2D160870;
	Wed,  4 Nov 2026 22:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiiyfbE6mhxA; Wed,  4 Nov 2026 22:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5223D60844
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830827;
	b=cLMneQhDplTWEDXPvltlGS9n/x3nhw1Blwi+O52yKpMwqgwluBAUXBjrLcWk+/eFRQ06
	 8p8PleA09Cd+9Q5X7g53it2ovLzxeck1CIi6Mbc10+zkJO7QcQi9YsYJ7yq7UNZSYVs3q
	 1Q2tP9u9LrCF8lOzGBnImYTiBcM/vPG3Bm9tjdohKLFfTPpEBJGKuhdCU48NmOFvFNrai
	 cQGc8Hand0MWatKI8TqWJxIdxvnIAywoLJSoGhasZkEOLzbsMELveEyYjwPqmqx6F2JeH
	 nDhkX5+ZOTSVbOIA3xZKMDoLP7SsjfkqrbypIA6afvGmsuowsVH2lTKViKFRTA6JTEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WnuB6qFFDa3bVbz3ZBqtt5yGvdoSU0KRs4XCryH/MVs=;
	b=DiTu/RK0ds3KYJA6pMvKWvEFMEJ0sBsa7/2jtY58OYNcpX6bIbIEFzy3xMOKcDKPN1Lo
	 YKT1Cprpd2T/2O5HuhXbx4L0n/YNbApmfLZX5FE793daYv6ZZgQMt5Z51UssghquFouPY
	 oGrUcV6qP9NtDQR1OdzrW6iNDU/0YVp2hmBtZxRqDdNHTqjtvAJc65jw86cISfP0opWt0
	 9Z39qXuPEq6hULLGqF4bQjPyp87Wbxve0d6d6I+tI0GhylIUXdvJQ4vPbJe+/6gOApVyS
	 /0yDUQB73uTH6jgwJsDdGBDuM0Vp7QBSMm/UVUZz6ycfrq/aOvGW3whIaYVspU00rgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830827;
	bh=WnuB6qFFDa3bVbz3ZBqtt5yGvdoSU0KRs4XCryH/MVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sELX3aZqxLoo0bevM8glF9iV2K5lMtVXW5Ecgx2+vRQmICdDqLgizZHgPiWg6Grvh
	 YPPofTrcLy1fPsBt1ECKAE+ARaJ2pE2zWDR2Xt41GH8smHxoEUIBbbeUcL8W4pvuWb
	 kbtSXCkvYlFRlh/B/HfNGhZrexZ6oqdtrJm+CeR+fcESYgrIVVxEhGLorE+QB7AmSu
	 Ujo0J2UQhJnP/LcH3R14qRGoXze8cV8xdfGkTyT4hqJL8RE97cryXjpw1++kwWHyGn
	 vargK/Hg3T5kYy7bKifgko8U6zYYxQeFzaLCAXGuuOpx7AMFm9oG2+eWCQENH3sCvg
	 V55QxmoEDJRjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5223D60844;
	Wed,  4 Nov 2026 22:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5D1177E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11A38119D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PywUeqmRDmai for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F21C280F81
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F21C280F81
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D7639DE54; Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:19:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 347b18995975e4e857e940aae5f8c8f8f993ab37
X-Git-Newrev: 784356284c4b73a98db76e9d257631f649305bdd
X-Patchwork-Hint: ignore
Message-Id: <20261104221853.0D7639DE54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/784356284c4b73a98db76e9d257631f649305bdd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 23d9a832b6..125da449ba 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  37a3116e73ac0870c9e58bea5bc0aae9  cachetools-7.2.7.tar.gz
-sha256  e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e  cachetools-7.2.7.tar.gz
+md5  07b2d6da1fe4690c42c2580076ac0cbc  cachetools-7.2.8.tar.gz
+sha256  3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075  cachetools-7.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 6f75963bc3..e059b3f9d6 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.7
+PYTHON_CACHETOOLS_VERSION = 7.2.8
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/40/3a/bce69b9ecf4658dcd3599abe5122a9031386f8f94bd85c6525fca9109db7
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/93/6f/faa5e0606769105e70e0478031a8f9a6b729e329f42ce2462585c6d9aa52
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
