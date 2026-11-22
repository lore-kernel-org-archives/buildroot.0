Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87936606A330
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ipra+4of;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=sowhnADN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F2F405ED;
	Sun, 22 Nov 2026 22:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7UX8B-yAl8O; Sun, 22 Nov 2026 22:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B7BA405EE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385653;
	b=JlYvKOLtbu+wI4obpu+VNimdvy25Md0ZSsBmnW3ecs0CmH6NDK0vF/ruB24P+KmwY4Kx
	 RsBobhyWZIrZD0fkn3rPps0BRTeSpoRVwFbYXBqAGC99uyUyic024npnEMaJJob532vIA
	 zUbxj6V6uE4J1wKaokqKSHRi97Cal3+VyIZpuNcwtvcXG/28ap4ZGcB7VcfZVi2Pn8ucp
	 UggFNQqYFqFqRkRhNLP8HIsQwUh4aQqccGLa9JJCOcTUbCLEfwGvlE+J7IWppShQwtRRM
	 7jxYTEKZ0EMVbscXal8WW5lbPWjY44fFYt6USKTT/Dvlc1WroBrax4Sy2eWOTub1FEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRVUJA6oaNu+m1TNMZfQ3ZyURcUd61NuLi5uGZcvfao=;
	b=IB7abF+Q8wWIDY9OPYpMHVrB+CzGXm9upoVd+17SE6d0VAmV0EMD6c09PnfXpi1OHVVV
	 9mAqfRIS4DPzz0ya/4a2T+dXZMyeJEHev8pvP0BdUaniSW87TSnLwLTcFK/YUi3IJYKNR
	 ln0l9jU0dbGhp2eunz4XPksqF+9V9t06Lhxl8upAwA8Y2XjR//Fxqpez9L0uo13+MhCEh
	 gWNAf5rBiavPBHaGKAmWsUauzBT9E2vXLa5Pa2ULvEUH3a88kHvyojckn2mYEQNEGLpmw
	 V3ay3CjKEjBHlwnThVLtq+mrNW3Trb5mb0arsQSkE/g5akV+DwFllqLS+uCBsJKalvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385653;
	bh=DRVUJA6oaNu+m1TNMZfQ3ZyURcUd61NuLi5uGZcvfao=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ipra+4ofp78cvTE4s6VFTaLnxr7q9wLUJh+TuWv+DHrwFLYE26USzgoOn6Zxt/JrH
	 5/y5qOYHuQeWMCuLn5PuZZvzKMgDH+b41YniPdSoGGSjsnIUZn4cuolVgFdYxDee4a
	 48/UjSO1B/6STwdqQT+8H+095VfLQO4qnXHPehfMyg/CgYSlROTGkchaDmrdXX2J+t
	 3dWWzx1CJmI/kQ032LK3Cy7NKUz2n3/KgPK20qgsY8xvOasJGHh1NNQWo7H0t21Ts4
	 bIfQn/huMCECDNb8teR3SvsnQf619/nFI73x1c08iusZQY3bDqeaR1FhajFvyvztTz
	 bD44bw0LcNaiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7BA405EE;
	Sun, 22 Nov 2026 22:14:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D12461AB
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C327780CCA
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quTKTCjYxzjl for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 102BF80CA2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sowhnADN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 102BF80CA2
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385465;
 bh=uR4UxGUXgBMAfzLGt1F7PaA6K5cRhwoYeyAg/NV5bSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sowhnADNX+mmhbGjB1BZtYi5RTIq9f46QBwOusgpoFui1wk3lNwpJA9dY7+LEY0c0
 kGuFOTBomrEk5ezAg33VrdWTBNEdOunPhnt3jyKFLPXnAr6gHTYbvtFLpm6UnSdwyW
 5n8eycihNVraWUFNlw7Y9ro7E2xtq0YtOK9wdIS2LP4DLO3KqGVLL2M6o7TLoQnQCu
 4XFUwZ9pLfQos7I7OuBqu+uVNhJWL+xtxELYcWJSXVZgE6YLJYEa+9nHyJlDKj1Zax
 v16e1ZD0DlDoo7v0UlsuP6nNH35APB/vbDRFY0YeVCUkNrrf1er6qLoW9Hb3kD0YWx
 ZByTag8t2FPBQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 xf4cBzzzGZQtX6mJhUXc5D3JCN8zRwy7puMG+p7p1+hxiNIGiDUmR3MkWeLIdGdE9hSZLS9Dv+t
 +62+BbY+meYJvZsMHsyZOUKH/xqFFmeZSdzRLgjuupHeoVRNRcqhR9F6K/rayQj3dXcbGMObrq3
 sS72RAWtaGSUOYgvo9wwMsTK8xpKBiofIDCEHJalSXIy7J6PlKCLubhUoQTmB0AAnEl9JtdCORR
 6iWDHWyYQPtT/Rp90qfGAG2uMl1+ef4bEuA+mwdoxWj7+AoWZdCzLOyYyp722kkRNfETW2UTByz
 jdmFasE9c3M06ElmK8RmnkR4oWLF5JNWbEO1i6RBk2mlCYpD2p5XLD4A4Rtd+NMOqH05p+sF4P7
 N+JtuR1sQak9SuATYlUI/7XxF20rhNYq1uuXTsCZOTiZ+4z2rxCKFrQe8FYpTujjkAUB4TicNAc
 Dibz1us49TB7c5YSWJHEz/dahQeIYTMqE5B799AOGmMQx7aEFSX0edBTM2sMuIJPCUbCTVlZhUZ
 PZgvi3YeNq81fFI6v1CyGE7KBFnxYfSjNr/OeyG2jO2dmrrtZoNuME4T1lCVlZqgU6nyCBt7Bo8
 Dj1f4WNesr73bYNu2VuV4Dg9wM5Y5AkaIsY1BG+9CcRsoOI=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E62EAA4C4EB6;
 Sun, 22 Nov 2026 23:11:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlK-0000000014Y-2iVZ;
 Sun, 22 Nov 2026 22:10:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:12 +0100
Message-ID: <20261122221014.3945599-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 19/20] support/testing: boost: add boost-test
 dependency to runtime tests when needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in                     | 14 ++++++++++----
 support/testing/tests/package/test_boost.py |  7 ++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d8656b5387..3bcefdfb1c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -157,7 +157,7 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-serialization
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread, boost-serialization
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
@@ -227,7 +227,7 @@ config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-serialization
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread, boost-serialization
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
@@ -315,14 +315,20 @@ config BR2_PACKAGE_BOOST_REGEX
 
 config BR2_PACKAGE_BOOST_SERIALIZATION
 	bool "boost-serialization"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-threads
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Serialization for persistence and marshalling.
 
+comment "boost-serialization needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
 	depends on !BR2_STATIC_LIBS
@@ -402,7 +408,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-serialization
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread, boost-serialization
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
diff --git a/support/testing/tests/package/test_boost.py b/support/testing/tests/package/test_boost.py
index 3954aa5dec..55cc89e06d 100644
--- a/support/testing/tests/package/test_boost.py
+++ b/support/testing/tests/package/test_boost.py
@@ -122,13 +122,13 @@ class TestBoostFilesystem(TestBoostBase):
 class TestBoostGraph(TestBoostBase):
     __test__ = True
     lib = "graph"
-    config = boost_config(lib)
+    config = boost_config(lib, "BR2_PACKAGE_BOOST_TEST=y\n")
 
 
 class TestBoostIostreams(TestBoostBase):
     __test__ = True
     lib = "iostreams"
-    config = boost_config(lib)
+    config = boost_config(lib, "BR2_PACKAGE_BOOST_TEST=y\n")
     expected_output = ["iostreams: gzip and bzip2 round trip OK"]
 
 
@@ -173,7 +173,8 @@ class TestBoostProgramOptions(TestBoostBase):
 class TestBoostPython(TestBoostBase):
     __test__ = True
     lib = "python"
-    config = boost_config(lib, "BR2_PACKAGE_PYTHON3=y\n")
+    config = boost_config(lib, "BR2_PACKAGE_PYTHON3=y\n"
+                               "BR2_PACKAGE_BOOST_TEST=y\n")
 
     def check(self):
         cmd = "python3 -c 'import boost_python_test as m; c = m.Counter(); " \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
