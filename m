Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E02606D835
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WiaHLNFb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94FC81223;
	Fri,  6 Nov 2026 13:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj1OOWtZh5PY; Fri,  6 Nov 2026 13:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F661811B4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793972750;
	b=YZyizSnf7QRdNSGmrtoWcsKidWI9RQ1/L726w/X9SEihPBfGh7uNTUbrzrQWXD0YntId
	 ZR0F8KrqfDuVayK1DaTGsBSlmrZWevtFEr8Io1wQCXarCSjsytRXNmHdesF/UF9Cr/Dqv
	 spe23/uYqYWwKcxxynXrJVIUgLKYPi7pLb1I36PoGBsJ/Tx1UwlSLcnoxHgV4t599UyQd
	 dvso737uYa2189BNrBgfDW3nwmQqYaxrY3Oa6dnkHYtQmTHaccJzE3Ojij4MEOBRjqm0g
	 zmGDCcRHsocwEDVQuZriOMD47EAWtmD0PJp70Omv5tAYYGe0ueKe3kw8vz0RDKL/tUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793972750;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x1SQZ1ZOBVgkWyj+yRIaeI3PUO1CdWpVnmcdZhO/ews=;
	b=nzQQDfpnx8dJLQgkic/UFqrxS7OQ4WqZcaZbZOk5CObHYBSNj9vNtfaIz7GH4OmUOopN
	 lt1lRSpKJw9CyWqqYMx0z3TQ0NBs81WmU2anYZFn59nqnXCf/+F59xml1Ybf+N/x8mKYl
	 LAHHDvv6deNNCA+x0ZEZXUKOyKnfcPE467rkWTspW19i4NW2eGhjmt4oHd2LPnu76E0CC
	 cTSmeHfOJQHfoC1qR+TDXHKpPb2x3ocJSMdbYlhGkXWjlEosazvArm06oHWRoI0vYyBHn
	 8Ua+6AkmOHwUKEVroPFUrDGmqpG1Hj8vyT0D6Mai4ouhYfNefgv7az+39ERQrgChqxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793972750;
	bh=x1SQZ1ZOBVgkWyj+yRIaeI3PUO1CdWpVnmcdZhO/ews=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WiaHLNFbDBNXKqOBnmnQlrfF8dFVuZ+4hbLqRadil3h/meWISpgmx/iylhXNlpVOv
	 5KrtFDZvja0qTxo+kNpQhp1GJ37bO7iCQRwI33/DnGDvZyq9gQZCyRkhmB0fW53lGq
	 aA05LM3C1oShl2ooDjH6dKwbEPz68RhJ+4r5fCjdmRHZEZ28jdPI5DuiGJXwVm1I6c
	 oXx2H2Hp4s44LK4cx3Ls0IaYW6vUzF3q28IJXsohXSaFM2Ki/ZB8FfqpmN6NUo0gYs
	 JPV9Y53t1C8orMkbn+8/b1U8xfuvLlM2vHOYa3BovjionNNgUgReTLLe+UvUw4ppvt
	 RVygrR9kjNSGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F661811B4;
	Fri,  6 Nov 2026 13:45:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A48402AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A6C36085F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhpnWJPHTAAy for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 13:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D6E5607BB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D6E5607BB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:45:46 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b566cf56c1so664268a12.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 05:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793972745; x=1794577545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fqzUtDgda4/GMhGeoJVkFsK8q/Q4IXbRuNzbXGnb1uw=;
 b=yXfCPYeg7IBEhdO7/42abR6DTWTi9GpmbIOQgYe5DWLwADmOouhxy7O8ljQ7NhrZJS
 DbbjflgGFs1SvfRG/8BGfkFkE04Qb+1a4axerz5qKzNaGs84NTKFS0ui9TUrArJB3/Cm
 Jk+6FosGoBfJXF/eN2e3mt6lFSYjJItGLYJDQou1AQSqq/9TbNiW/zIkmH9yRal8Y1pU
 jHRkqOOR/rQ8ADqrcqk6NPVZPwLx8ELE0Pw3jEOjykwVEj3oeBcs/rvJ07vFYZjy8HDb
 BDr/92zH0prWIte4+mAtzxZo/sAhInnXpeflgSTZEsI5cJdk3meSxaRXNXsPU4pTcUi2
 tfAw==
X-Gm-Message-State: APuU4Z8VO2AQ+zwXfMvMHrIorfpziDrk0HDazK03+yIoduHp9jyKpJLo
 GpFn43PZaVOJg4HN/TWDsXK/AyAw/ye7hjtLyxo1THPkmu21tLVwW5yPQnWNzw==
X-Gm-Gg: AYBFou0EsaSohbPEYq1GHuy/kHGu+/AXwpTl1vDsVEzl2104agggYP4anNvO0FXdvD1
 PXDS2kHLBhtu8TyR9NVCy8Vd5jLSm3SMZnkLIrG7LBxIIvkZYgWtwXBQy/ZtRH0YHwHoVry3e0H
 sK1OZWgFD3mg0dvzhwLuSUzdqrfIl5iHouKB6QRXl7nx/lJL4bfxzW8Q+LJNlzG7mUFXZO6iUXA
 +bOVh1v8gZomgXefEmQOvAbduYlTkXhCwzOOiu/jklgGQ3Xn0oWSYyvAkHyZ8zecrnqxCZQXRHj
 WiFBHKFmmeoSbmDQQ+P0LmyNT/NXwpD7e+1ZQkUjiNfvEy7wABdEHWVBEy88qaHEFq9gOBbiVmK
 aKUx+naqHd3B/1jE7oTRpMz9IupKOPBhyDw72USjhFafolE5hToZNXOOFJms/ae8hVcawgQGBWc
 Gf89yS2lsPss6iyHp/CXm1pAx9k+hcrpS3Do1s+0PEM0tCBEA4NM6cw+gQSlmf29X/E2sY95TMd
 O1WtXLqNbXuQFWE5VbG38oznKd6RDBSmIld8GRC4M+ajIksGKctyKIGAYhT6jP5Z8pCGbxgn+eO
 OY1ZUCMjvNK+Baa7KFqhgEM39Z8fJRVSy+EeiV9PtjZEAWIHYUQDP4d1qs64IX9JIdV1ahyznj1
 z9cJY13ic
X-Received: by 2002:a05:6402:548f:b0:6b5:87cb:d8ce with SMTP id
 4fb4d7f45d1cf-6b59783213amr2045848a12.41.1793972744408; 
 Fri, 06 Nov 2026 05:45:44 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b664ae54edsm808899a12.15.2026.11.06.05.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 05:45:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:45:43 +0100
Message-Id: <20261106134543.2997704-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-iwlib: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

python-iwlib is unmaintained upstream: the last commit dates back to
December 2019 [1] and the last release (1.7.0) has not been followed
by any other.

It also fails to cross-compile: it uses the deprecated cffi verify()
mode, which builds the C extension with the target compiler and then
imports it into the host Python, which fails as soon as the target
differs from the host:

  ImportError: .../build/python-iwlib-1.7.0/iwlib/__pycache__/_cffi__x89ce3654x8235dda6.cpython-314-x86_64-linux-gnu.so: wrong ELF class: ELFCLASS32

So drop the package and add a legacy entry.

[1] https://github.com/nhoad/python-iwlib/commits/master/

Fixes:
https://autobuild.buildroot.org/results/c5553cd71935d29fd8ca52e1392b1ec9a540ed56

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                       |  7 +++++++
 package/Config.in                      |  1 -
 package/python-iwlib/Config.in         |  9 ---------
 package/python-iwlib/python-iwlib.hash |  5 -----
 package/python-iwlib/python-iwlib.mk   | 15 ---------------
 5 files changed, 7 insertions(+), 30 deletions(-)
 delete mode 100644 package/python-iwlib/Config.in
 delete mode 100644 package/python-iwlib/python-iwlib.hash
 delete mode 100644 package/python-iwlib/python-iwlib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..d2e31fb82a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PYTHON_IWLIB
+	bool "python-iwlib has been removed"
+	select BR2_LEGACY
+	help
+	  python-iwlib is unmaintained upstream (no commit since 2019)
+	  and was not cross-compilation friendly.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a24c73c2ca..dfeb73113b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1205,7 +1205,6 @@ menu "External python modules"
 	source "package/python-isodate/Config.in"
 	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
-	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-collections/Config.in"
diff --git a/package/python-iwlib/Config.in b/package/python-iwlib/Config.in
deleted file mode 100644
index e15ae38025..0000000000
--- a/package/python-iwlib/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_IWLIB
-	bool "python-iwlib"
-	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	help
-	  python-iwlib is a package for interfacing with iwlib,
-	  providing an implementation to the wireless tools in Linux.
-
-	  https://github.com/nhoad/python-iwlib
diff --git a/package/python-iwlib/python-iwlib.hash b/package/python-iwlib/python-iwlib.hash
deleted file mode 100644
index d1848e0bd7..0000000000
--- a/package/python-iwlib/python-iwlib.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/iwlib/json
-md5  66016f4f7f53128525d1f9d9de7a6fed  iwlib-1.7.0.tar.gz
-sha256  a805f6597a70ee3001aba8f039fb7b2dcb75dc15c4e7852f5594fd6379196da1  iwlib-1.7.0.tar.gz
-# Locally computed sha256 checksums
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
deleted file mode 100644
index 7a4fee7fc9..0000000000
--- a/package/python-iwlib/python-iwlib.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-iwlib
-#
-################################################################################
-
-PYTHON_IWLIB_VERSION = 1.7.0
-PYTHON_IWLIB_SOURCE = iwlib-$(PYTHON_IWLIB_VERSION).tar.gz
-PYTHON_IWLIB_SITE = https://files.pythonhosted.org/packages/59/44/fd72c0a7094baeb448dc9e87b3d579da98e2b8593c3fe05c5f9dd20dc6bc
-PYTHON_IWLIB_LICENSE = GPL-2.0
-PYTHON_IWLIB_LICENSE_FILES = COPYING
-PYTHON_IWLIB_SETUP_TYPE = setuptools
-PYTHON_IWLIB_DEPENDENCIES = host-python-cffi wireless_tools
-
-$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
