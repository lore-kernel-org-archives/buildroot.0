Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43D606A322
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L+NHpu9c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=TMNCkOn9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C9D60A7D;
	Thu, 29 Oct 2026 20:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4L13nKoYqHq; Thu, 29 Oct 2026 20:50:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9A83C60755
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793307017;
	b=l9xSJ86BjLyps7p7rrknUY2225jRozOCJw662TgybF3UhhNeF9+yJSwl0A7rRmg5GWt9
	 P3CMT1VXfR46d2sPWhf93MHWbVgL49ezMb5CIWvL2bMHgcGGOlCvMwFUPKmuy0CfYNjpJ
	 0oJ1YyEyAixgqzFQSg3qAH34J4IQDOEW0VukkzLowQvc0oDLNGfXdDabjcr3bojc8GxvC
	 2e0pelkQ1FlXPfEo73fM78bADZ+VLrmcviNmKOwj3xO3Fbj3PBBtUXCqfuL8UiPcjEeI8
	 Uuhh98467pSdH+M74M0v1XteTExra/cJQEjOx0Vnfi2vWj/6FmfewG44hqtZeHXVuNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793307017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RjTcbs6Daho4F34PfyGzIMW85qohLDaagUCxeteREEQ=;
	b=atDdpBrhSP3382+GqP5eUzvtykZpo5NooADZAAc1DOs4qokBfNJZXe8Yunewv2bWejdu
	 WFt2/DwWVuBCbLfEdJytTIpkURW6dhYiSxbt4LASaDTTlqUalMt7WenN5kWKYA90afYPg
	 mjEfQy4hD4VZx+d4OhBcby4y2oHirQ7yvoRA66k0lY2wgBsjdWo/x3psbygrCdTRpMSYI
	 4dwAKM696Ar/VVFjMcX2am7xcAGr4SEhMZFU1fXi5TLXbh8k0NuuhT/eBtI0DTcGyPsas
	 9PqpjL9qH+sBPE3LzfyljkL8ASgD8+T1G91q/BkKUXy9GblEXhhCuobMezwRW9qb0aA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793307017;
	bh=RjTcbs6Daho4F34PfyGzIMW85qohLDaagUCxeteREEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L+NHpu9cYOfxE7Yy+C67LYnnJxW+fQTbtaGiAWC/GwblD5w6wMvg0/urxnplVBaeX
	 90AtrdcjMKOQoY1vfLPyqaUyK+/jkt/jDa3foFPdN2RBS/Fw2lFiLTa19zDKw3jKGq
	 u/Lidce6EgXDJYY0V1QnX35XgvkyKGt+XlolZWFHY/syrjAnHzB+bxowyk/xyUWXpt
	 2V4iIM9idmQOjZNyLjesyf+WMyxT9jybB7S20YPpbGVbV7L89udAPGmOkhSGc+dO6t
	 CmvL/myoKsigd+p1RYlyDAHwVvzTi1OJ1u7Nhb8mZCxlWTDI22O3lV3RhLyiAN962n
	 dHnRnAX7OZAsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A83C60755;
	Thu, 29 Oct 2026 20:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB5D972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 614314050C
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vQn_e9YdzpW for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C02FE40506
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793307014;
 b=NGDr1J4WlxQt2ibyr4W5nuV/1IkTr07YyabYpjItVkOmiVNTJUWOaZq9NXmyHcSoAf02
 +IdlbQYoQP8SJX+tXtebcDdkXoReJuiUweYy2Cs9Xkob6zyo4iDLpOIM6Bu8nbObBN+o7
 P/Zk875xWHiPp8W3asdmlc3YgEsAjaYoefs14QNoJ3PLVFbu38VptSvFamGww52rFs0u/
 PMUmVy2pX5Rh2I8VUEU2htbIaw+HCJ5Xs1E8vOwvxQZFdSaVzjP7AMkLT8mDrD9mZZ8xs
 AgBt2Bu3UlnZ90VthGoiy57n1zh0SSWRMWcRI9j8xteogYVLbYHzlwEy9MIzb4+kaYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793307014;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=A0gpROQJUtwYVIZAilvLmc02zp0Je+weLdMnrMzELdU=;
 b=nEQM4fePb98ujLt0ZLlNRrL7gviBCejOtJJOjXMOtX75lYxxYnPSaAo6Kf6Hoyx/u4+1
 ACLLogp5fBlClJGXEVCsbmY6eUY8sOcp1MYkre7gCNieEWrNWXrvg2BmY47rbUP/7Sg2o
 JqZtBk55HDtNBi3vsoJpCZIqCkNY6ncCzi9Z3Euyp6IisRcM3iDmln7OEzWn89/v6rcM9
 dyDm79+QdFi1cBRXFB/2daIcEbcsDf18DGdrHlxV1dg6B6j3+DWynYb4mxswxNnQD1cCi
 jtAWZbIdd7yH0Pr3vWlooHCkqcrV9P48F2dKgOStjrw6o7CGLKF0P3aRxUZzGJmyCvg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TMNCkOn9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TMNCkOn9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C02FE40506
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793306995;
 bh=A0gpROQJUtwYVIZAilvLmc02zp0Je+weLdMnrMzELdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TMNCkOn9Ldyl+eMxrQRdS/upxZV2+J6I84kVWciFZxjlnQqhatGHnVqNKbgEclzkN
 o74WOusn+mDmH8AZpPbFHeMeVPGLEU2TvJyW3g08wcEE203eKJNDnaB/QdrMQ9zqsV
 rqpiKfZyx3JcnE5/s0LFbch+t9cJ9n3oAbeEIW/ZT+z1GWRRFMXBcofBASrFlld1dz
 ld409IPD0M47JGkuMyfsJf6rFK5XS1vXm/5Cr+ySg6hr8w8kSV9Amu8VxKeKe1JqD1
 flzkhwyusRPFZSuYYeyCdHUeqdZgdggHcdBMpXLto6zL0k4T6i0ge6IVRY5ZYlMYCn
 sdsDge6bur4FA==
X-KAS-Sym: v3:f51bdf72230551df:c4629r8Pn2ZdpjbQ8YLptVU1pUVQYg98YzLKEc0eC9cw5
 qKI2FJLEzWjjcZFHJxPhS0cNbSQxl+2aU57phSULUFaprM11ab7BueekHefAxsFf1uND+F6daut
 zJQSX9Sr49kk2UvongHFgFj9a4o4RkSBHSO0aFPQ0j59UBK4uyeUO/6Ov6ECGiQaraep71CGE7e
 hPeGOervrSoQQtowuIPQyd0L0RBRYelWVO3kbFbgs56nRfHyXgVMheTjyJMK8FQsXkyYkfoWFZj
 /q/OeWL/j6r0wPIR5+ptpA4dohe3N/bnod72m6k7qrUOga+sguVFyFbFDp6/za/G/VQX5Pqg==:
 YwZgOEf525+Nq18mYhYh2f4Mw6mpJIKkeFrtAmU2AZFT1K77k0TGLPIjztDu26zofjbqPJz7G2G
 vqHRT+5a0onfJ5S01iezB+lthlb1vckS3YHbMyOnkZg/+MdNkEUmWAdE7/MWIsHqQS0uxtx+LKr
 MJhBK35ydlUzhCYMDdIL+XZ4Vhz/AHFzOgQwYcZq9+D80mDaW9l+VNkdS8Anv4PWPiqLxh5HVyl
 E9vW7Iiib+khn/hrTI0rvycW+B7TNJ3U6ycn6UsJWEN9wZ96CGkv6Hpv0ktsdJ283iTHY1ks6N9
 kdoTfs4mu32e2ap+FAJ+aGq+ZUsqDkvDU88oFYLFqWklSNTx49rwbEcIYkDn1Pd0+GUsMsc3t6E
 mGtakQ6kX+SmtZec+sde1AMfu6wqEyLJal9gYRuTS1uxV7HqHG+wWw85nu860u5ck4yE/oFtm2Z
 epbgRKZ3kqLOeD+7ND5HRhWq23d9lpP2k2M2ne5B7nBc1mPd4cjps+MRp5pw0hxlGsIzYodT0DJ
 UDIGOEUbg4LN3JRAw32su9ka0k6et9FY0lyfcKQE1sJAHmMVLDUXXtd8PfvkdRVoLfwNY+ExWU6
 Lg5fcSu+ropvl2HLEl5Fs2b0e3JSk/8utHW/IY6vIobtFGgw6XH7nlOsI2iTx2FDVbXMkGbtpbw
 bb6RxNhVoFuyo+mtEMVgqCiqAxUNIIxhexPGvJQj1tZXhp8Tc1S67IZIviEk=
Received: from fli4l.lan.fli4l (p5b3a01b5.dip0.t-ipconnect.de [91.58.1.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1798A4C71AB;
 Thu, 29 Oct 2026 21:49:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50336)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMX4M-000000006rx-2wFx;
 Thu, 29 Oct 2026 20:49:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:49:53 +0100
Message-ID: <20261029204953.1447140-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029204953.1447140-1-bernd@kuhls.net>
References: <20261029204953.1447140-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.python.org/downloads/release/python-3150/
https://www.python.org/downloads/release/python-3151/
https://www.python.org/downloads/release/python-3152/

Rebased patches using --zero-commit option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch | 14 ++---
 .../0002-Add-an-option-to-disable-pydoc.patch | 24 ++++----
 .../0003-Add-an-option-to-disable-IDLE.patch  | 18 +++---
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch | 10 ++--
 ...option-to-disable-the-sqlite3-module.patch | 16 +++---
 ...d-an-option-to-disable-the-tk-module.patch | 18 +++---
 ...-option-to-disable-the-curses-module.patch | 14 ++---
 .../0008-Add-an-option-to-disable-expat.patch | 14 ++---
 ...ac-detect-unusable-termio-operations.patch | 18 +++---
 ...mpilation-of-Modules-_remote_debuggi.patch | 55 -------------------
 package/python3/python3.hash                  |  4 +-
 package/python3/python3.mk                    |  4 +-
 12 files changed, 77 insertions(+), 132 deletions(-)
 delete mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index dbc3c60d87..8c0d1821d7 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 52bb6f2a3ef352cda16d95a588a0356da562de8e Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,7 +15,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 2 ++
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 08ad5f4921d..486a35ed99b 100644
+index 95fefcc3a75..ee1f8b0c125 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2812,6 +2812,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2923,6 +2923,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -34,7 +34,7 @@ index 08ad5f4921d..486a35ed99b 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2821,6 +2822,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2932,6 +2933,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -43,10 +43,10 @@ index 08ad5f4921d..486a35ed99b 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index bd4446e9488..ad0781f9ee6 100644
+index 99238054b9a..6ba882a7fe5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1533,6 +1533,13 @@ fi
+@@ -1573,6 +1573,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 294520f815..2116894daf 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 8ba9dc9a12687d37454dd949409599f108f1ce44 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -18,7 +18,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -26,10 +26,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 486a35ed99b..c3732bedb30 100644
+index ee1f8b0c125..f0a14641a10 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2513,7 +2513,9 @@ bininstall: commoninstall altbininstall
+@@ -2590,7 +2590,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -39,15 +39,15 @@ index 486a35ed99b..c3732bedb30 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2564,7 +2566,6 @@ LIBSUBDIRS=	asyncio \
- 		logging \
- 		multiprocessing multiprocessing/dummy \
- 		pathlib \
+@@ -2650,7 +2652,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/live_collector \
+ 		profiling/sampling/_vendor/d3/7.8.5 \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
 -		pydoc_data \
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2731,6 +2732,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2842,6 +2843,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -58,7 +58,7 @@ index 486a35ed99b..c3732bedb30 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2959,7 +2964,9 @@ libainstall: all scripts
+@@ -3073,7 +3078,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -69,10 +69,10 @@ index 486a35ed99b..c3732bedb30 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index ad0781f9ee6..00d2b54ead5 100644
+index 6ba882a7fe5..4a7a6670554 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4789,6 +4789,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4980,6 +4980,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index 3a386b7a29..42c4b670fe 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 463c64020b288b8ddfd32a63c4a23ab7369b9669 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -17,7 +17,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -25,10 +25,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c3732bedb30..2197bb18434 100644
+index f0a14641a10..c994e44f46e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2511,7 +2511,9 @@ bininstall: commoninstall altbininstall
+@@ -2588,7 +2588,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -38,7 +38,7 @@ index c3732bedb30..2197bb18434 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2560,7 +2562,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2637,7 +2639,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -46,7 +46,7 @@ index c3732bedb30..2197bb18434 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2736,6 +2737,10 @@ ifeq (@PYDOC@,yes)
+@@ -2847,6 +2848,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -57,7 +57,7 @@ index c3732bedb30..2197bb18434 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2963,7 +2968,9 @@ libainstall: all scripts
+@@ -3077,7 +3082,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -68,10 +68,10 @@ index c3732bedb30..2197bb18434 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 00d2b54ead5..5395e82384b 100644
+index 4a7a6670554..e5c6ef48f7e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8189,6 +8189,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -8657,6 +8657,12 @@ AC_SUBST([JIT_SHIM_BUILD_O])
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index faf990430c..8978239298 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 930c4763ac46d180880615eceeb68698e9b35e85 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -11,17 +11,17 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 13 ++++++-------
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5395e82384b..ec9a24c5311 100644
+index e5c6ef48f7e..1ad30f4a929 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
+@@ -101,6 +101,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
    AS_VAR_POPDEF([py_libs])
  ])
  
@@ -34,7 +34,7 @@ index 5395e82384b..ec9a24c5311 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7701,13 +7707,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
+@@ -8105,13 +8111,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
  fi
  AC_SUBST([_PYTHREAD_NAME_MAXLEN])
  
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index 77c2f22bc5..4a0aee7daf 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From 8f6beca556599479705444af7cc7c49b2b964af8 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -14,7 +14,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -22,18 +22,18 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2197bb18434..c8f7ab1e6a9 100644
+index c994e44f46e..6ddced5a68d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2569,7 +2569,6 @@ LIBSUBDIRS=	asyncio \
- 		pathlib \
+@@ -2655,7 +2655,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
  		re \
  		site-packages \
 -		sqlite3 \
  		string \
  		sysconfig \
  		tkinter \
-@@ -2741,6 +2740,10 @@ ifeq (@IDLE@,yes)
+@@ -2852,6 +2851,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -45,10 +45,10 @@ index 2197bb18434..c8f7ab1e6a9 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index ec9a24c5311..e8e201206bc 100644
+index 1ad30f4a929..f9381b83b37 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4795,6 +4795,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4986,6 +4986,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index b928cd9435..60e6b95463 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From b53a2758ac431bc2493a460e6c886561e2397518 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -11,7 +11,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
@@ -25,10 +25,10 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c8f7ab1e6a9..2c91d0dda71 100644
+index 6ddced5a68d..c1e78f2a3dc 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2571,7 +2571,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2657,7 +2657,6 @@ LIBSUBDIRS=	asyncio \
  		site-packages \
  		string \
  		sysconfig \
@@ -36,7 +36,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2681,7 +2680,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2791,7 +2790,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pyrepl \
  		test/test_string \
  		test/test_sqlite3 \
@@ -44,7 +44,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2703,7 +2701,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2814,7 +2812,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
@@ -52,7 +52,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_unittest \
  		test/test_unittest/namespace_test_pkg \
  		test/test_unittest/namespace_test_pkg/bar \
-@@ -2730,6 +2727,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2841,6 +2838,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index e8e201206bc..840976ec1bd 100644
+index f9381b83b37..fa4b3492987 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4808,6 +4808,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4999,6 +4999,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 729cb5d624..60f4bd4a5b 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From baef276faa676d1b0faf64a91fa627b5f8fcc5e0 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,7 +13,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -21,10 +21,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2c91d0dda71..fb11e416731 100644
+index c1e78f2a3dc..55c9ca5f02c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2555,7 +2555,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2632,7 +2632,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures concurrent/interpreters \
  		csv \
  		ctypes ctypes/macholib \
@@ -32,7 +32,7 @@ index 2c91d0dda71..fb11e416731 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2732,6 +2731,10 @@ LIBSUBDIRS += tkinter
+@@ -2843,6 +2842,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -44,10 +44,10 @@ index 2c91d0dda71..fb11e416731 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 840976ec1bd..1d7ba91ccc9 100644
+index fa4b3492987..3c88f407672 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4802,6 +4802,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4993,6 +4993,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 4093d6fa76..14c8360790 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 2a7412e43554830ffbc831454de8df903e765b73 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -19,7 +19,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in |  5 ++++-
@@ -27,10 +27,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fb11e416731..c261b3f9cd7 100644
+index 55c9ca5f02c..40ae1c38076 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2576,7 +2576,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2662,7 +2662,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -38,7 +38,7 @@ index fb11e416731..c261b3f9cd7 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2749,6 +2748,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2860,6 +2859,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -50,10 +50,10 @@ index fb11e416731..c261b3f9cd7 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 1d7ba91ccc9..3980548b253 100644
+index 3c88f407672..1e4c14b9e15 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4065,17 +4065,19 @@ LIBS="$withval $LIBS"
+@@ -4265,17 +4265,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
diff --git a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
index 78c0fe057c..0833eff46f 100644
--- a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
+++ b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
@@ -1,4 +1,4 @@
-From 2d336d1fedb692350a1e4f131246f60a1195cd93 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 7 Dec 2025 13:57:06 +0100
 Subject: [PATCH] configure.ac: detect unusable termio operations
@@ -15,7 +15,7 @@ done using a new m4 macro PY_CHECK_IOCTL.
 
 Upstream: https://github.com/python/cpython/pull/142380
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Modules/termios.c |  8 ++++----
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index efb5fcc17fa..3177cb0747a 100644
+index 38743e176f0..a2defe4b270 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
-@@ -1115,7 +1115,7 @@ static struct constant {
+@@ -1122,7 +1122,7 @@ static struct constant {
  #ifdef TCFLSH
      {"TCFLSH", TCFLSH},
  #endif
@@ -35,7 +35,7 @@ index efb5fcc17fa..3177cb0747a 100644
      {"TCGETA", TCGETA},
  #endif
  #ifdef TCGETS
-@@ -1127,13 +1127,13 @@ static struct constant {
+@@ -1134,13 +1134,13 @@ static struct constant {
  #ifdef TCSBRKP
      {"TCSBRKP", TCSBRKP},
  #endif
@@ -53,10 +53,10 @@ index efb5fcc17fa..3177cb0747a 100644
  #endif
  #ifdef TCSETS
 diff --git a/configure.ac b/configure.ac
-index 3980548b253..48604024fcf 100644
+index 1e4c14b9e15..f3048cda3c6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -101,6 +101,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
+@@ -107,6 +107,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
      AS_VAR_SET([py_cv_module_]mod, [n/a])])
  ])
  
@@ -83,7 +83,7 @@ index 3980548b253..48604024fcf 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -8217,6 +8237,12 @@ AC_ARG_ENABLE(idle3,
+@@ -8685,6 +8705,12 @@ AC_ARG_ENABLE(idle3,
  	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
  	[ IDLE="${enableval}" ], [ IDLE=yes ])
  
@@ -97,5 +97,5 @@ index 3980548b253..48604024fcf 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.51.1
+2.47.3
 
diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
deleted file mode 100644
index 833bcc9cc8..0000000000
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 528429e329047ee572248da0e1212f7cc1ef7d11 Mon Sep 17 00:00:00 2001
-From: Pablo Galindo Salgado <Pablogsal@gmail.com>
-Date: Thu, 25 Sep 2025 00:16:44 +0100
-Subject: [PATCH] gh-139275: Fix compilation of
- Modules/_remote_debugging_module.c when the system doesn't have
- process_vm_readv (#139307)
-
-Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
-
-[ Bernd Kuhls: ported to Python 3.14.7]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
- Modules/_remote_debugging_module.c                              | 2 +-
- Python/remote_debug.h                                           | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-
-diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-new file mode 100644
-index 00000000000..8cb4b972ad6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-@@ -0,0 +1,2 @@
-+Fix compilation problems in ``_remote_debugging_module.c`` when the system
-+doesn't have ``process_vm_readv``. Patch by Pablo Galindo
-diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_module.c
-index b46538b76df..e86a27d5812 100644
---- a/Modules/_remote_debugging_module.c
-+++ b/Modules/_remote_debugging_module.c
-@@ -1329,7 +1329,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for asyncio debug in executable or DLL
-     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
-     if (address == 0) {
-diff --git a/Python/remote_debug.h b/Python/remote_debug.h
-index 8f9b6cd4c49..b7d17a0f345 100644
---- a/Python/remote_debug.h
-+++ b/Python/remote_debug.h
-@@ -1174,7 +1174,7 @@
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for 'python' in executable or DLL
-     address = search_linux_map_for_section(handle, "PyRuntime", "python",
-                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
--- 
-2.47.3
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7272555258..89e7ba06e7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-31410/
-sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
+# From https://www.python.org/downloads/release/python-3152/
+sha256  8b5536d280142ecf6cdfe15d12a21ba1c65e300bbf7b28a8d0cdb849575797de  Python-3.15.2.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c24020af9b..7b8562cd36 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION_MAJOR = 3.15
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
