Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38672606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lbuoVxid
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C6280DFF;
	Sat, 24 Oct 2026 11:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxkDp_rq4NRO; Sat, 24 Oct 2026 11:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C2DA80E01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842836;
	b=eUsnj+z7LgkXWC5x4xye4B7XNwy9lOu9cW1YSq3Bw4ALu2w2f6aaAWEb4HjoSGElWaxx
	 H5N9uvq1yA6RfBgrgJLZDk/3g8E3z4XsDf9HlwJJE/iFozRCSiRUWaVO2ufo08/KXK5J9
	 P8mRmE9/li7ur9pLAfQRgWiOi26kVVCTkkHxFenN4VXM82UoJtiIN/bAiRn1KvRwbyUMd
	 xRYeqY7U8WoIrQNwuRkhFQ4BA7llRuNmnqQJJkSdMscGj2IOa1sHEABTyzl4elzHwATE2
	 Fysh7+dqLPJhbMDYeTF3HkFaMuGI0ixcoC1r8FI+OCbfTWxYgbFCklTHQ4IQT4wvh/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bRrTh9TK4yaJlRuxfhsq+wG6hPK/WA9UUb7TJ7Ux30o=;
	b=eoTbInjurn0xO0A24rbzwRpOkAkmzxcMaTTq4nMDsTmRnObC0IJ6nnG1TkzfihDM56PI
	 RybhsLntm8KQPVtfsFYtRBc/C8pMf1m+LsT6/02HA0hFmdLVYog+NESoMAigIL486+nNY
	 i+C0R+1aMB4DMiUnWvaEDpHw6SiT3wbqbhm02oCP2e9xrbsV5Bk43GtMJnukMr1WVXdMt
	 HtgJVFsr1gAP/XqE4tqDBGYqlAFyc+eImdDX8PB8ssbWHsVvkkCxO9PDJvE8c/73Tst+c
	 b9Cetty7JxvraTSrRmK2JBiLzfq7xkoysmjms6bF/nH+6Ov+o7OhLBf9yjDbELyQAqQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842836;
	bh=bRrTh9TK4yaJlRuxfhsq+wG6hPK/WA9UUb7TJ7Ux30o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lbuoVxid+p0NpfaBHKZxHEpZCbQd+kl4pm4o3c+pWb53v/Rw7yFeWVVxvUI8g+5z8
	 ErwZWAJUnGS83lYC+ewEKLlUt04ePvEPeKj9QVD8oB99o4LhRpCwxsSV3w/s55bUbi
	 YWWKsZdnhCXCgkcmG8eXmZmlgwFwc9O1+krYKwFmB/WslInSlFtscSJ5JhxPhBu8wW
	 UIPzs7dMe0JSf3MdpBR0jyqyf1OqQj2aO1lnDDGVk7VfbLtd39ELNGI/BhwmBs9Vzt
	 WHFYdln20wSgWVR39pEYlDE3ZdXcZjYdI6lciMU60+j4OTq/UJFAHMoxaOjtoEi4wW
	 M9TENoAcoCfkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2DA80E01;
	Sat, 24 Oct 2026 11:53:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D35AC356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C509780DFF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWxE4m0Y6Taj for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 181EC80E01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=QSxDESXPkPU0oSlVYIjrchA1Cik5qTb6eT5hsFxcI6+Nr7/R3rU5EOtA53yetvCE4I8D
 4qZt0YcqgFxodVDHYhDcEn1h7rYyLoseXwoCO0Vs5CN3sWLsXgpUCyvmV97spzvavWzlc
 +ggXBZdKLBHWOYitscyPpPdtZqWPumnot5BrQqd7ZA1oVwsVPCiiEcVvMwxcTHLw420pc
 jw/CkdvFnny3oIeneq6ouxwqiX2d/Th7PQfVWNQIvnMOQPWtNITZ6jS5qZFotB0X1Rg/V
 l+I2i1aBT23NsKJhJf0jsAAbsma5MJflujC+fqCxD4MQySEtv56sDhyShgJmLni4vBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ju8Xy29xCVUaoeH5WBx/rkJzwgj0wil79NPPJST/tes=;
 b=i/cmh52GS2ucqCkBk3an7U5aVh3f4Rl8RBoH0bnBBw7Krpuh3iq0lZ94CWiEWruwkpaE
 6kR6s2GQv7rih9Wh6luvDfeB5TCjpLIMrbT4CWJ5aaqD36lTXxFdhb6vDpS3rWd+dlRya
 tBI3zABJyEYYqaNnJx6uzjO5onqEvM8bcuVoOtu81MIVE1qzR3ORwNGI+h/0QYyo+jFer
 Y4ofxj8n5G5hEnKY9Qvi35YVofYmVv7Pm4TEKDkONQfjSsIA+MEWK1xQq3oWJYXr6Sdm2
 IECVaTJkVnmW/qJ4EVfVsUoX7rURadzfB0l1Kae1OmzSt+6zZ8OCK1r1SKcY5+BsHig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181EC80E01
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A07F9C7A7; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:07:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b7d1219a93f5c8b8fce996a3a2c0bf14e5141d0
X-Git-Newrev: cc5acfc230e004e8e5d40dba418776039edeba54
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.2A07F9C7A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer: bump to version
 0.27.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc5acfc230e004e8e5d40dba418776039edeba54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typer/python-typer.hash | 6 +++---
 package/python-typer/python-typer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
index aac74ce2bb..463df2bf86 100644
--- a/package/python-typer/python-typer.hash
+++ b/package/python-typer/python-typer.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/typer/0.27.2/json
-md5  2d81e72fd4c60a94c9d1b6ade7142f65  typer-0.27.2.tar.gz
-sha256  269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945  typer-0.27.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typer/0.27.3/json
+md5  d1883b55e7e3f5f7b5891513352483f2  typer-0.27.3.tar.gz
+sha256  d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901  typer-0.27.3.tar.gz
 # Locally computed sha256 checksums
 sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index ca0d1c6ee7..14d4be771d 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPER_VERSION = 0.27.2
+PYTHON_TYPER_VERSION = 0.27.3
 PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
-PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/16/f7/57713ba479fd405eb76de31404b2c744c289e336b2d999511ebf51e496f7
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/03/51/d33db42cc72ffd8c30777547b42d01f0cbf9d95a770457698d0174b3ed71
 PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
