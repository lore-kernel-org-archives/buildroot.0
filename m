Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93215606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YaSGj5Fz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E94B8137E;
	Fri,  6 Nov 2026 21:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNRvMZRhLu1S; Fri,  6 Nov 2026 21:14:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FF58812E1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999682;
	b=Xwod5rnAMilc4foSu1XVIc6iXxTDrzzSwXPD5+3lev6sCxLce0dMvxVLnj0vFYUmLX2W
	 t1W79koOPYYyffWLpBTgx4Yh1HUionQHyURqzdSUDoO5PqVOiCEoyDILw6emikMVr2hPm
	 /AKxvlwTWO0jfQkm8gd0W1gs2FQHyiSfHmUYVjjug4Ud9KFlR0VtA8TGoT0nI2P4kbhXG
	 RgQ/o2uVEFlDCJhliEKNBFdm0tCxpPdM4AyyMqwZM/L6ghfYb2feQY4P8Rt+rKt81n+Ed
	 nT9oS/hs7RTbh91IeWD//qZzXbh8YdkLynIeAvWYiaUU06UOcgc+jy/q68k0wViASlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rZKZYXLjzNcuKBW9huTxZXSaghPyaR5SYB9xQ0FdB1A=;
	b=i5dKK75nez10LrGRN0mmEyXkBuQxv6W3yVFgMtvHaYBqsJ7t5VIgGuSbDyLPuO2exUHa
	 bZPxsHhetFrhMp37mZZdzbel+3FU//XBpm1zK8E31Cofb9qz88kcr+InFyBAjAlCSal/J
	 auD2Fo2IRyRKwcnAZiK7h4+Um3ou+U0TbmExQrIMuqVY2G3syDyYoAffvgNu9P71L/rhq
	 lJPEBFCOSZucKS0ehIC3/Z/uO7uLJ12kq8K3XiBgVk5vBQpC0ARlwTksIFv8GG6OnSwQ8
	 qAkD4oT3daNDCd/vgSXRQ4NaOh24J4qokWyUi+2yxJfkbBML0zjkeZhTTG0xZxKh67A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999682;
	bh=rZKZYXLjzNcuKBW9huTxZXSaghPyaR5SYB9xQ0FdB1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YaSGj5FzRsPf0HZsQwet3Z9OyK9lfzBqg0FRrBb84jfqD84Usai2BkPuw0FJzKuj0
	 HI1gSzcX3dwd+t/iittyTHz4f9ULIqlLTCZOFKISBi3qP2ifwaZvgvUscGy2Ff75vp
	 Jy26R4afLecAATwxdZTTyM1KFh2Zrk3GYWKCgGjrtBLgBZ7K1SnpaLud/EpWoUUz6j
	 kPUHQp48NWvUloxPHAEMardDCiTBC8mDDbkH9Uqz0pwf9KLtOPfH/p/NjxhTFQ1mc+
	 EHZ42d4q4/xbhNWdWhgHvYgxFcOVHL0yxVrfV5YsTxcWetMJznvAv1C/Oiq68kGh5M
	 +N2N9kG29GMCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF58812E1;
	Fri,  6 Nov 2026 21:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86956A64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7856A40907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuwCDlBI73h2 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BDC8540990
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC8540990
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAD6C9E103; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9db99661f47076e65044c1e19ae1e4d1e77cb1f8
X-Git-Newrev: 8f9a8a07482c41b0cb3bc8b302f541f1adc50ed2
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.DAD6C9E103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iniparse: bump to version
 0.5.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f9a8a07482c41b0cb3bc8b302f541f1adc50ed2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-iniparse/python-iniparse.hash | 4 ++--
 package/python-iniparse/python-iniparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index a64cc17495..cfce25f258 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/iniparse/json
-md5  229454c1e6c5a36a3e8f1c9330f97a4e  iniparse-0.5.2.tar.gz
-sha256  4f4fd009d49e4290a721e9bc5716719e9a767c9c7fdc3d7ebc403ef3379d6129  iniparse-0.5.2.tar.gz
+md5  c06438d5c3900d910da312ff8db6ba2b  iniparse-0.5.3.tar.gz
+sha256  9cadfd7dfa551aed58f91f333321753a4d7df6ff765651fda5affefface33fe8  iniparse-0.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 4b62405bd2..5b1efc10bb 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INIPARSE_VERSION = 0.5.2
+PYTHON_INIPARSE_VERSION = 0.5.3
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/9a/5b/f8b3a923142f9e4cfeafce9b8f7343ead2feb71929365486ce96b5372335
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/95/2f/d7637e3cbbeb7ca2fddaf0c5986284d5a086c437139523f4bcea95a9f1d0
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
