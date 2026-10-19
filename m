Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D0606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lgmdTsmA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A54560729;
	Mon, 19 Oct 2026 20:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbansts6ei_k; Mon, 19 Oct 2026 20:06:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1EFC606F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792440405;
	b=kIwzG8MlnYYVNyvpCXZ//8Z/vb5GtaxSoC8Rm3zizldX6Ru/mTMTFGtLmkQmy6njgiuW
	 V4lEZ2V1Nk7A27T1XTZ4+AovJeVMGx7q7C5iEsLDPRzSzaCrToESvh4r4Oo3G7guZk+mu
	 4W3N2paVR2lr3Vwj82EMrjGIPv6asEb2zTzeCcLtTvf4GBJxV/+18XY+X6n2zE9k73KNT
	 GpKciuRODjrt67joXof9MdlqTl5m35f/bL0N4DoYCUwIQXPdCEBab87AE8A65vWlhO8Ls
	 bDr5j1lCS+ZK97UOtL1vxzC8iYaaN57Whh0mMNL+PY+ZUV1PmZawjLzPz2FCv9BnD6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792440405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PWGiw5uvUJtC8/EQ1un3qZ8eochEvj8awLJdvD7cbyY=;
	b=JRBB7MJiHs2uS/V9/rQp4e2sdyv40Q+b2PNPaJyJfqXDigtQguf1Hl/bA8wDLoxb/Ozc
	 huxOn3p72NXneYNXnDTxO86A7OgjqsC5SLCW2Tq/xo6dERWWFmqeN3ktec8k6gVLLQeXY
	 70O1uqhhy3hVrv01NP8/14zM3DjcGja3va/kvPS3NDg3rMOHgr3kZfWJbOrpK+kMPA+O3
	 fFDIEIBfc55+jWtT7XXG2gfmNJZbldz1gXNVgLtVJJgerUDXkmWJ677YLYQJU0p+9x9XK
	 DDHvNQu+dMJhpP5YyZTaH+V6PtVy2Yc53jMG4d6X5nVqTgkK8Ud1ipcI0sh8FVDaq+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792440405;
	bh=PWGiw5uvUJtC8/EQ1un3qZ8eochEvj8awLJdvD7cbyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lgmdTsmAPrKgVQbVUHYRjZuk2zIR6kKSJgEK+4203TUC9hqBzDbNzylhA9xf/zLzp
	 JMP0fJ3mmqGX5W5Bb3jZq4GbUOHSdPOnLSFm5hbLbQARE6jhUXzDcqmZe42ljW0QE0
	 OkPiTJOi9jHc7UDqx/CGKC33ZiPhVAsP45I0YmTXSVlC5pCPJnmi3MHX1QjUWxsmEg
	 uSsU4RX4Dr5InXHEsvuMnUo/6oP1xQoFla3KcCQkt0FpB/VrN3fzyt9Pb76VyR0KlF
	 dcqg64ZpkC+jsLAILERPZkB4GxgQDYa0+8veEe/RpR7jka0wZYkb9QqD/HQQ/IoGry
	 pmsALZICU+Mew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1EFC606F2;
	Mon, 19 Oct 2026 20:06:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64C6711CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5680480E44
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbAhxxU9zwVv for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79216809F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792440401;
 b=NSaGbbBpt6OnEaLPodsx8yeFQ7a3RoyhMqDP+Xzq8SaNp2EJDKBgPFlBzH0w4nwNs97K
 yhM3tDjffkGj55PeKfBVf8g9dENYzvmeZFsI2xBkDhMhzuIJIVoJL9oI2bRg7pIxx6UiS
 K16Kad8shK72qJj8el4LHx6uzBD8zT5IIzW9TmsojwW6GXHYxK9LX6kFM1t28ZphmYkou
 goGC+0/4QqeYdPAsJRi7VnVYvHyNsJUb7ABDEXgZ+uU32yaH0KUdRQWICKMOlQWPgT7BF
 o9cchEAZ1d7QBE8xoCDmVaK8dFQItKlbjqCDzuZW/8k3U63/zkxTk5zIVqP6ohtGLDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792440401;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JnULuO5NTfFrmYXDvii+uKozU9ar2HnUlpGoCG3vKoI=;
 b=Wcys0yNhg7zvgv2SMEStTHfpwyNyIRzroZLjLhDwWl1m+GmJFRpqZlJq0kMeZUJbH97G
 puJgLKrQSIPnqnryX4KG2hWYgs0zEVwZKLSkJLY/sUmYhHHSkLqlpZ+GANV0DIs2jn0qW
 lPvva8lOIdhKRFQ8j16pxWfvBCWDz7+LdzWdS3sTtCLexIAn/msrZQtA48JcqhAl7e0ie
 WcYmKTEeyYBLznIsyHxmLqwr3LpmA6e1dqn+R9SlF0/y4MqlvsPDulqAno+jemXIA0kr3
 usaFN93MmuwOw83VOX8A02kl2HwfLCG880U5w2xtEbb5bkaosKvzsEAg/7i7/zP5RAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79216809F8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCE3B995D7; Mon, 19 Oct 2026 20:05:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 22:06:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12276a959024366a41bcfadfda6a8b192cbd6394
X-Git-Newrev: 2a40ba95b1e28d7b080a5f6f2d632c7f063ad618
X-Patchwork-Hint: ignore
Message-Id: <20261019200518.BCE3B995D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump to version 3.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a40ba95b1e28d7b080a5f6f2d632c7f063ad618
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the uv-build build backend.

Skip dependency checks to ignore the upper version bound on uv-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bleak/python-bleak.hash | 6 +++---
 package/python-bleak/python-bleak.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index abc75d6917..9bb610e9a3 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  513384cf6ed28ebcad27ed829c4ad3a2  bleak-3.0.1.tar.gz
-sha256  c8ff077519f8c30a972fd0d22f47a54b981184b2f2a0886d02e55acadbc1045d  bleak-3.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bleak/3.0.2/json
+md5  0e9fc5ca42eaa90f0aa99f6d2b941533  bleak-3.0.2.tar.gz
+sha256  c2229cb8238d5876b4bd05c74bf7a1aea1f88da39d2e51ac9dfd5cc319d5265f  bleak-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index e873d1234f..fdbb7dc86d 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 3.0.1
+PYTHON_BLEAK_VERSION = 3.0.2
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/9f/dd19d92309e4a37823210827f0f42460e69603254309b99499622b511294
-PYTHON_BLEAK_SETUP_TYPE = poetry
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/16/df/05a3f80ca8e3f7f5b0dba68a9e618147c909ccdba1468f07487dc8d72a9d
+PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
+PYTHON_BLEAK_DEPENDENCIES = host-python-uv-build
+PYTHON_BLEAK_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
