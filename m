Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09D606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KXOi4oLS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A4D60A9D;
	Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9olz7rTx4o3l; Fri,  6 Nov 2026 21:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D48C60ACA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999715;
	b=XEFC8mxdUhIGXi3xcyeI6VE1l86mri2RBQ4rAVppUHjuJsObKmBUi6edJjBpjr7qGq+D
	 LR1Kj2nL5sRz2LucTxt/VNHMqvpEi8x0fdPZ09aqRHqLxKbNVZ9qFHB2OVVvomqwXBKmV
	 oCeuiA4UDBvwb5/sdKmGlrgcX3+Bf43fPs3AIQ0bbOGILWj2N0SuwnQUhGSZObKBQdUF6
	 9KThf+nlKaSBA9FiQw8wJ3aNmUctoPf2WsVDUG+wNyVh6np+xx9a4xColyiCR9HYCCv+z
	 R22ujRTuhjP74UTGqGzpdMAa7w9ryCAgRhmLUVnWi0Y5FHXFuEtme1DPM2ZZkXDw5TQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B395bYuHWe8Bbf9pQRMInaSpsDVrYN6+slxTTw18WCg=;
	b=HqLchEaodKLxoJ5L1krHeaieUUChlQnZ4iCf+WBe2i6omksblDtCO4QyrSNu6JjhThaQ
	 URZB6FzX9mspFa+ZMURjn/iI7K98WT3yrbZkxVqdQ+vnNAO+cfkAvpaMhiTxGjlh62qJC
	 S8/3/EYNJjQpMNU8nSn3HPV5Tb1G6zA97F/Y8rLLxbLDlXLv3eV5SiTsGPwrgZoUGLQoP
	 U+ifTlas1XzOwMiCr6JRLwkd4uwKNQyz3JwzrI/BqLKRvLdSv4i/sbjjxvNBptzRGnUZ9
	 2FZKdsaESAzG74/rBVo+R0NclF/sS6gDBOL2yKJUdDNT39hk+0W2rqvfdRinkgyOl8g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999715;
	bh=B395bYuHWe8Bbf9pQRMInaSpsDVrYN6+slxTTw18WCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KXOi4oLSv//RzhQolRxa8e4uo/b4gx3NuaNGoGkZSY0FfuNhQ1TrTeAcPh52lLv4n
	 d+yJ05M9+x0D1XUMeYcQzW/2ZfCW7O73m8amJm1P4u/6CGBwqsgCtVNmL5g4ohp1Yo
	 4HT5oCDMKbgO7uEpXQvRW3sPU/mHTmj7Kj8GROOMzX6sGxLEX6U8HVbI6dmRWA6SIo
	 jOUKSLEEQ7nJ91Fh1nOq3PDtXMKzqubJj9fB5lcCUhltTjb0hJyKM/ad2lznUuqWzt
	 tvt7l7XA7hUQGyxbwxvGuvBfZta3jcMibYXte9x6+eHB6rdW/AjGN4YkqxxoDvaTuH
	 xLO+7kUl93QMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D48C60ACA;
	Fri,  6 Nov 2026 21:15:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA24D36
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CD2A403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW48UpuSLbfB for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 959A740403
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 959A740403
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1CCE9E08A; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34a242b3bd82ff78dfb2b0f54db25c76c2d2ff8a
X-Git-Newrev: b38ce14eff8a2edc4925230336c111720f56fafe
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.B1CCE9E08A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspection: bump to
 version 0.4.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b38ce14eff8a2edc4925230336c111720f56fafe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typing-inspection/python-typing-inspection.hash | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index ba13d7b128..bdfb5698c2 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  9eb41f5bca1969b126f61febeb516a51  typing_inspection-0.4.4.tar.gz
-sha256  547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47  typing_inspection-0.4.4.tar.gz
+md5  17283fba012873d79df87ee889caeb9d  typing_inspection-0.4.5.tar.gz
+sha256  7f16c411e7930dc79596d42ab44672a3fe5f60eb34b781a1647e7872363120c7  typing_inspection-0.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index 74db189565..a10529290f 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.4
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.5
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/a3/26/b09b8010994eccc3c09092e6b34058f36a460eea2d4c3e8b910c695975a0
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/ff/50/0195198eb1d75bab716bb0a813abea4cc394bfa17a92a189f021a34859af
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
