Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A29606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K5vbbr0R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 325D1608E6;
	Fri,  6 Nov 2026 21:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkW_28CZnkZp; Fri,  6 Nov 2026 21:14:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 351AB60A5C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999686;
	b=RcJANnaOaJGaXZJoVr78uqYhgIzTX5mwa6GwEMfAP8JM4UhPErwrtCTAm++ZrALsnQzJ
	 wjRTLYXSd2K9l/4gL1tfFw3WSi+VIje8tLtV4QU/HZP4IOq0lFNmPyHI1/6nFExMzriI8
	 waAkMmdN6Xq1tbunj1PRCIlwOhgroILPxtf7Z6jfqq+GrqyDhoIOIoovt+mgS6HxZEepZ
	 HCW/9wyFkqt3LhZTbCpPnaA0qDyL/2VfFyk1I1MjCYTB7aNxkxzrrSVB4LAIBeTLhRlc8
	 hifdBfp//jEiOtiRhNXbUNSqnmzoQVCEBjG6wPpr/vtqk3eosX4m0OYN2ErSJEYT6Kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999686;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3YTgAVR/8S381uayf3wi7Ywdk5mKJpVmFvUfCVnT8fI=;
	b=ckS8A1Dcnt7y8nkdwltjKIdL/HkU7qPc2U2OXCTdknO/vKwimZxTPNWTq9n/J+o3uIWS
	 MdLJ48xOqE2lJtlDOvd7rCWkm9DGvpsSMUqou9gEgC7RKZ4wHZ3nAdP33OZ8dNbx6yIQW
	 VNQRu/P3TX5i/Uveqgca4kfVxrtibSfKXLyl60HKCodfDwYelFMFB6RtqjOPLZHqBq3Um
	 ZeEH1sa9PjHPihO150LEHn9r5bXgNUfe7oMpDMG2rP4Vmom6gwXbbd2oDFGS71VgUiLLc
	 brF99l1TxPwG/BLDzBW7WgBapvoyMNQg1clj3zAI22Cssx89NTiMPwHA2M3mlX53RxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999686;
	bh=3YTgAVR/8S381uayf3wi7Ywdk5mKJpVmFvUfCVnT8fI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K5vbbr0Re8nepv0914DGmA8UvcUprXMvlfzFfvcOSBwHVKQbCTr/WhueBu5Ewv5HE
	 tXUVuUp0zRidSKpNgjTYS+lG6vvBve2ukYCF7KFkGBmhQwWhWYfD4VxjxkEio4FJkp
	 2/HtNDI4tcvcChs8zP4xL4ZlMpDlTilAGnRNRKspHNuz/mPRTRPQLIwge5M+DTSu06
	 GevxB3TofcdrTpmxQeca0DGUGEzneBe7OzGi2ZzgWUY4oIdcKgDMdWWGdOnQT4yNni
	 o2DGNzTYQUH0A7NSXdTofAwnghf82uXHAqPS3+2SgxY10XihryL6+2/agz2eXLZ7lA
	 guHdJsSsm+onA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351AB60A5C;
	Fri,  6 Nov 2026 21:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F01532A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 904E240907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAPj7IOniJXw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF90B409A5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF90B409A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0888B9E0FA; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d01b689f39d8a432366701c966e41c30297ee53
X-Git-Newrev: b6685ef8b86098c03648f7c4163d7fadd5cfab60
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.0888B9E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy-extensions: bump to
 version 1.2.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6685ef8b86098c03648f7c4163d7fadd5cfab60
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mypy-extensions/python-mypy-extensions.hash | 4 ++--
 package/python-mypy-extensions/python-mypy-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index 10e7b74a9e..d8d7561171 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy-extensions/json
-md5  f59bfd7f9dca73f36c8feed12f9e8eba  mypy_extensions-1.1.0.tar.gz
-sha256  52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558  mypy_extensions-1.1.0.tar.gz
+md5  25d0c46efc1c271fd976944f6e66a3e2  mypy_extensions-1.2.0.tar.gz
+sha256  c6e275a07f1c2fc096b62940452d0eaa3f3af7de45d704787866240a7c6d5a51  mypy_extensions-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index cf0f7c681c..594037ff68 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_EXTENSIONS_VERSION = 1.1.0
+PYTHON_MYPY_EXTENSIONS_VERSION = 1.2.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/a2/6e/371856a3fb9d31ca8dac321cda606860fa4548858c0cc45d9d1d4ca2628b
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/d0/6f/43edf3be2748d0e40974a5ee046a8bb4c9961a4bdd3e7d5c6dcbf32d1af6
 PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
