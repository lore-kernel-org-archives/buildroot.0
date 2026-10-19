Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7827606A326
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 20:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a+/rjfXY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09406072A;
	Mon, 19 Oct 2026 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQjMLjar4Xj6; Mon, 19 Oct 2026 20:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 136D8606C5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792440404;
	b=TBsms8o78Ua0YMpoE0dMEggBCnLkZIlX0p3JESZsSsKGmABkRRWLzYBJLhBiYG5o898l
	 HPNgn2b16bcFhb49WKDmh8PVX4Cazc4b2vtKGshzvlXRfMSKprM9N9VuQuMkQky0GAQD1
	 95iEUooxjNq/TvpSOmnGDAvtmj1f2nRe/WiWGxFc9ArUniAb4twFQgUd+8v8auLHK/6Ya
	 SSdYtuHOviSXpRBCvVUEahvFhWjfsgH5lW4/16vJxxbnjHkBSnD9RnIwITeIV3PGIwhXS
	 wS0Fm2j1fRIZ+UORp6umZpqFD1rV3tUTXQraCEKITNgvod8IEHaf+40jWay7tZjo+Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792440404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JQmBkA2K81WafU74KswOh/mv/9uIevVfByHk20VswJI=;
	b=bzCoLyD0mRIbKDSdyaUXcRn9u30QQ306XWfacvWLm5qQQcf6BLGGWxN6kKa46r2n3FZH
	 OGAVZ5IUb3tuXn0SWYgDKMW7GJ6OR8xRzWeJ6tDE9qtd1bD+JhOXxQQxPXHTOIM+32Hce
	 8PUY2ElcEBRUSWb85doHwaI5UUTy5ZyMlhiYRVbeKfRuv1t0cTaWBDo7kW+0DPZHSOkgG
	 X8qj6SVIBZhNbmqJX7/TfrYukLrz772ji/bVrFVKsNYgBdSATdSeniIBsiOrX2I5EhZCj
	 vjAUqwKfqMVzALTpObVMYnnUYA+t+tvsLu59vo1dq+Lz/suX68RvaxaSyDnHyQdpFOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792440404;
	bh=JQmBkA2K81WafU74KswOh/mv/9uIevVfByHk20VswJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a+/rjfXYIpTWMTkszj59O+lh2ZNjieQMQVe4CoQ1WbNUDX+k4t3D1VGeMPTGbhRb5
	 8DJSr5fKCDFL6OcTQFWUDtSzKCLnSycG/99A5IRYrMwFqvtjDM6xJ75c3mRbhuclRH
	 aeNyAK5J6abbGUyeYlBVrfumkGnKpvyfAyINsUPduTN+jqAw9CMO8n8hOpTw+n/bq/
	 UBEQx47mcVWuBk0ZChdNPgUl2O4xIMfhPCtN8Py0IRtz/yTr6cOgFnCMVDWgaAsWY1
	 6rPeNE6Di3rDhZPmnQI+W1LMvT5nk2USA9pP5MahKlqJ6+Nzz3A/79ibER+6vRxBwR
	 MdJoSLPdtw0Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136D8606C5;
	Mon, 19 Oct 2026 20:06:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A34A279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57EDB606DC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDHUgQVvG7Lp for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70F42606CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792440401;
 b=mBrJXMJBfPdrrwIKWq8WLaAyQQNupouCAK6oo5m4mUGoRK2L4bx3wp6ZQx28mYjFHkj7
 YQ+l+M36TfHoC0KffBShhGOOExXaByv3EqswocRuRnWg0+XeLcqTxI1ZZIaRLZj3aDsqO
 zLZlAe0RflEXZlTKD33Mdd5KTAYQMEeR+kT/x9bJhTB7nshlmEogs1AJwkGERRoFMeEKB
 XS1ZKEANCLIATlHo+Ef5AntshviA1pEQa/WB6Z3jZCOl8cjK1iYMsMrMPwnx5DpFeLy7T
 1IQnVCW6yTijih1Yyb34arjSKy3Gdx0Um18/qt476HUMWtJuzs0bbKbgRcN6p213+Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792440401;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cdljyD9So6Q3ktkrRMiSiru03AmWm6xTLI7Gd0iooFA=;
 b=h6XOR3kVfgJ4g92357JoeHNEZTaq6NecHMM03QlkITcLlV5T1txQ60ZsEdNGze3wLQHj
 tlKLW+a1HB5XFMGu43fpij2rdQaNiuc97d/itco1jGAESaI+Cpben7wlWSyv+jNTq0Bk7
 cBSfKoyRq2XKW5bJMCL9N0zBIjb+oN+LB8ESNZ/2uj8q0YJKf94KExHYiT5zhMlihXoz3
 1FcxM55kEE2rQbvuGQjLpbwsBxS3wtW4EGihCHTUX6XCeVq9vUK8lcqofczzgyqZSxYq8
 UQ4LH6PtxgIuGOI5c0KfkQbnhp02DhEn/OcNXTzxbP10IPfffTGcA1/E2EdJmNfKmcw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70F42606CC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0DE6995D6; Mon, 19 Oct 2026 20:05:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 22:06:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ffe8dbee5ead58c29fcee1d4e8304b80c836c43
X-Git-Newrev: 12276a959024366a41bcfadfda6a8b192cbd6394
X-Patchwork-Hint: ignore
Message-Id: <20261019200518.B0DE6995D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bidict: bump to version
 0.24.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12276a959024366a41bcfadfda6a8b192cbd6394
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the uv-build build backend.

Skip dependency checks to ignore the upper version bound on uv-build.

Update license hash due to copyright year update:
https://github.com/jab/bidict/commit/02408d0024696156568c9ede7f587e97090ac752

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bidict/python-bidict.hash | 8 ++++----
 package/python-bidict/python-bidict.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index 5fe425c3aa..48f4919cda 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  561cd7fd5c3036bbfa2c5185531e7b19  bidict-0.23.1.tar.gz
-sha256  03069d763bc387bbd20e7d49914e75fc4132a41937fa3405417e1a5a2d006d71  bidict-0.23.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bidict/0.24.1/json
+md5  e7cf785588cc0e90422def264ee195a6  bidict-0.24.1.tar.gz
+sha256  4dca6c17f0b01700e9f24359daa5ebabf7be022d99f4cb2a257b6af2a5076c88  bidict-0.24.1.tar.gz
 # Locally computed sha256 checksums
-sha256  f3f53adcecaa48d73a66e238fa5ba906cb41876783b45d28a1346b3142eebd9a  LICENSE
+sha256  099b9dcb04485b32cf93aba82b303e099bcf98ab2476fae716d22c930fd6b915  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index 9181195d23..aa5441564a 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.23.1
+PYTHON_BIDICT_VERSION = 0.24.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/9a/6e/026678aa5a830e07cd9498a05d3e7e650a4f56a42f267a53d22bcda1bdc9
-PYTHON_BIDICT_SETUP_TYPE = setuptools
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/a8/f2/8d2dd8276ca05e1f5157b6a0d34efb2f585f47a0fbed61e8aad04b221f0b
+PYTHON_BIDICT_SETUP_TYPE = pep517
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
+PYTHON_BIDICT_DEPENDENCIES = host-python-uv-build
+PYTHON_BIDICT_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
