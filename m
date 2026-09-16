Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A44C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B537406E6;
	Wed, 16 Sep 2026 20:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4gaRjmb9SvA; Wed, 16 Sep 2026 20:26:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1B49E406D4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789590416;
	b=gcNNEb3Kwiynt1bx0Qq3lP2TLsgj/kbfamVTvbdduJNUh71y2XHg+Xv8OOI7cWpY4YcW
	 pptaheFej21yutZsG2rFpqWXXCJoXXoORNNVGJCUnKk36UV7rl6VwsI7D0lo1TCIgaBvn
	 AXzGyTXCpVcS+OAAkvRYeh52wtjsAQDpy6aET2Sn/YQQRRH87huwP7ytuk/yji4hhdEX/
	 Qh6SrppwnGnQAtqDFWdeCs0gqGVoivz8AsvCMRlAu5f7YooZcaqLnGCwKUrnvUFqSai0s
	 hkiEtk4bAblX7irBBCLqTXGoQPU0XSSxKhGy1E9rQah8RmOXchxbBj31IBFegl7VLbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789590416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pFcvNLbojOT0Gj+wTxpfxG5sxiM/hwTc77yBiaGeCm0=;
	b=Gx0wj6+e1MFooNd8RaHyUEK3dWYD2vKptpKHOqbPOfMIAHKdv3t8beB6zxPnNnRMQJn5
	 6KU2gqvm6AvgXTFDkmIhUgX+AkE774kb0sfYhz1bMU1k4zzNukronv6e19saEM+rxbUUk
	 GLh2fcAf4VsOQ8R3nXmgv8keCN62sabEqxpH6MH1b6q0OrhHiIQc+qZJgEQrwT9pelNOk
	 sCLBoBVs47z9/UNS52gK1Qa0k6TDRTIebNMTL8XtFKlN6uAJdcmnjtF+X4mAvxzW2ubdT
	 47naY/rOsJAHxRlTMOZDyorMoQT0pfq78dUmJsFj7sTiVz2tTSvjGRdye241fE911pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789590416;
	bh=pFcvNLbojOT0Gj+wTxpfxG5sxiM/hwTc77yBiaGeCm0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=buN/OMlj5jP4oMcnM4GJYkjFVGmZp9b5yC8mBKQZMU39yENy3rz5Rw4v1i0nJWeVw
	 jgP03wRNnbr+kDhtNLXN1kMhxWk6dm+xaCfQqABLrRkzd65sWpqRz1m9nb7MSlDwwn
	 TLe3A4TVNQFVIgWA8CLXpD2AFjj3gP4V8rWUpcwhNQ25ZXnqtDfnC4i2K9NZbKvZiY
	 f5wILdQY/On01qp4SdjRhAWMfAuAdnzyaBkd5DFjK8O9Q+Mx5Ta4d111DOMV3xuBcm
	 KCLetPJHwok/eL6WvddAsI+DH3X2+IU63ueUWoauYckzTtuh8jjY+BNTBP/FARgE4n
	 GX26v8x0Ubj/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B49E406D4;
	Wed, 16 Sep 2026 20:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 474C524D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 356C1400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4e3339ds26P for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5C5F5400B0
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789590414;
 b=QknOPewfh2lOmz22KFbmB+uWv0Mq6jxj+uaf0V3OSaRStkg+ZFiPnIHXpUxMa754IKSM
 wiZyX4u0HUNM4XNNTTXPPnqA2LaBwQshvLLMxI0kblgcoeNuZUTG7eSzwo8u4IyBRDcY2
 JFdKRv0iU8W+vzsdCL1A8lcd2ftEJuCiN+SAYuCWcMxZwBEckQvqT7i6IMO/cYfs0MoM6
 caVcOMH4z0M2NmZp9G5VBs636F2yeAClQ0+4fwOQZLvJ2mqyqlaYou/Cho54osN9J//bp
 KU9qBVVIfeOGTdH9yWapVvHlxajlRBGWAmKLrds66YxyvilwX7lTG7h+dfbJuSIsHng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789590414;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Kj+CNsQ3JVB+T8CwsuPA50dQwPOm5qICqpP1BqhLomo=;
 b=g+CCqHJcYnzX7Oo4LcEzhC2EEiLLmxtSs+9dK0T5C69NodYsE0nEUmgoE+yWSUMopKHL
 akens9rZbp9XGiwtsoagWu13pddGOwKji5h4PFhGaaHY1ff2vkBPjzRyKdtyDzyt5VWkK
 fgM6Fw2fGOfy6AAt+15S7qs4F6XfE4XMkaKwenvdI6hlN9KSQQ0/RYCUGHK5vg7ZGsyXe
 CVHjla8PW/9Yfk6SphAjEmAmzwL7AhngkkfTEd1WwmTkDa3W5SoGUs070haXj3YOqgdSz
 J+IZQLI2HZoaYiulC8kCz0lm6NG2Vs5mYRIhyL3Bmu7NsCjdQs4VVDFbdrfKhfq0Xsw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Un1XpCcF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Un1XpCcF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C5F5400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789590410;
 bh=Kj+CNsQ3JVB+T8CwsuPA50dQwPOm5qICqpP1BqhLomo=;
 h=From:To:Cc:Subject:Date:From;
 b=Un1XpCcFjmNKbzFSCIdPu7Qk408dX4w9fo6DcsqfSkBto7H6Qq6uE2hQuYBjBUB0s
 q75qo1Rcgla1E2cp6r/6U5bXDoT/yZgfpDRFrxFchbt/LLOL5eGzvajNmqk7ck96BB
 8SeudExZYWozh6EQio1RwYtlF/njVzyA0XGzxSC2Y+V2wGwW3XqBIfclRr0H4pPWR7
 uNxLn7no6OfSsfyF60kxuOlX4cznIRQ/+dHinj/IL/DMoiIQZ2sVkxwP6S4ygYzdPR
 U61TQ4tncWsyOFhbYafkqZq3yBHIjso0nYevCXI4oyFYnxGgh25kBG3CP+rd05EJKE
 MZirrzem9vcbw==
X-KAS-Sym: v3:f51bdf72230551df:Owh8yZ0U3rXNoIXg/eqey2QIQKL7+GRiujl0ywddeXx2du7EtsLI+QSBtq6e9s1mYnn+TmFRCqdrhKh30oeoZp7JPtAugnC/y6txvmZX+LyZ267TC+lF1BK6egaqm85Dn1KX1pFhzJX7vRXLoeJMDsPGnzmXVIry77kyMAYoGmJeVtG6HpBInEOZvrEdiE3GMW2SeUeOTA5a65QjkUCCJpiz2cZNFk4hdKgnOu2YDgH/Aa3ozjG+uI6XOJN7b2ozzYHvqj9cwRClWiR6pepV5xPzRS4W0Dp0mJTF7VhnZOHxt6NQOYDwcZKY6xK70PgN5e/ys5guFK3v0cVBLPhSQA==:/gcNOXwnOLreTWTZe4HgyKUH40MPk4neQ8JLiEOt5+5OElSA1bbW3LWehXzmU29G2j9Nd0ypKaGTjS5syPII7IAMs++C22/On2NzEG0rn0i8JYRSSsvFSY4ELEU9xG6CyVhN0753CFkmhGvWsR2+hv8iAhUbbxEgLRL0ZlqlrSIQP7Txexfk5yfKnEOFdXeZoW3aIPl/lgMUyjSc1Gzp8FGJ61EmRQKtkvZSiCVbSSqzwaGEqThK/XOL8eI97pxfgTqwrnS01iRSg7l1DxAK/qRFFpNvEu7SanXbT4IIj5+DQ8R/ydUXc2+6sYNd6bX3T0t+Em9SrOdnDb732UAfsSLts3F9lFzYALHZEfrplmyxmetTHVHAEz+yfU9/2amq9wAT/62Xlr/iboiaGOOJ7+A3A/coWKm7GARe6z0lYOlW6hFbvdYZ/HY5GoYXHqI8WdwXGT2SQaIaSdZtcj/Xnr8Hfxi5YYTDtQR2kE5k2IrXfbJAiTI4BMAdltOl9Rg0dBZEPbl+tl7GPWmmVs+pYmO3PdLfzmHQfrUgSD9TZCteA7pLNdp0K6VjMOQI24Pc/TcjexlOl/CmjeQBrnmv/fXCJm7LAd8lj+XfWFY+rmgRr5
 T4d+rc6Uhs3yJKJHGtubrN
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7ECE8A4C3BD0;
 Wed, 16 Sep 2026 22:26:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35750)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6wDR-000000005hn-36le;
 Wed, 16 Sep 2026 20:26:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 16 Sep 2026 22:26:50 +0200
Message-ID: <20260916202650.2343897-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: Remove unneeded patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added the configure option --enable-tests with commit
https://github.com/lttng/lttng-tools/commit/6ba949601d077c90e736fcce4e722487c56a09cb
which was first released in version 2.15.0.

While bumping the package from 2.14.0 to 2.16.0 with buildroot commit
edd3a015cd90441291d2b5513c71e2eabf682e24 this new option was not taken
into consideration. We can therefore now remove our own patch to
implement this configure option.

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b7c99f05bdcd68a68902f468a01347eb2e4b90ba

 ...nel-memory-types.hpp-fails-to-build.patch} |  0
 .../0001-configure.ac-add-disable-tests.patch | 38 -------------------
 package/lttng-tools/lttng-tools.mk            |  2 -
 3 files changed, 40 deletions(-)
 rename package/lttng-tools/{0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch => 0001-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch} (100%)
 delete mode 100644 package/lttng-tools/0001-configure.ac-add-disable-tests.patch

diff --git a/package/lttng-tools/0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch b/package/lttng-tools/0001-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch
similarity index 100%
rename from package/lttng-tools/0002-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch
rename to package/lttng-tools/0001-Fix-sessiond-channel-memory-types.hpp-fails-to-build.patch
diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
deleted file mode 100644
index bdf621b4ec..0000000000
--- a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8c3a5d0921090e2fc3c4e2561509d23eb9ffa6dd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Apr 2021 21:07:07 +0200
-Subject: [PATCH] configure.ac: add --disable-tests
-
-Allow the user to explicitly disable tests
-
-Upstream: https://github.com/lttng/lttng-tools/pull/162 (rejected)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 04f9cef4..372cdf3d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -862,6 +862,8 @@ AC_ARG_ENABLE([bin-lttng-sessiond], AS_HELP_STRING([--disable-bin-lttng-sessiond
- 	      [Disable the build of lttng-sessiond binaries]))
- AC_ARG_ENABLE([extras], AS_HELP_STRING([--disable-extras],
- 	      [Disable the build of the extra components]))
-+AC_ARG_ENABLE([tests], AS_HELP_STRING([--disable-tests],
-+	      [Disable the build of the test components]))
- 
- 
- build_lib_consumer=no
-@@ -1013,6 +1015,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
- 
- # Export the tests and extras build conditions.
- AS_IF([\
-+test "x$enable_tests" != "xno" && \
- test "x$enable_bin_lttng" != "xno" && \
- test "x$enable_bin_lttng_consumerd" != "xno" && \
- test "x$enable_bin_lttng_crash" != "xno" && \
--- 
-2.30.2
-
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 6f6cdedb43..e2eaed5824 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -17,8 +17,6 @@ LTTNG_TOOLS_LICENSE_FILES = \
 	LICENSES/LGPL-2.1-only.txt \
 	LICENSES/MIT.txt
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
-# We're patching configure.ac
-LTTNG_TOOLS_AUTORECONF = YES
 LTTNG_TOOLS_CONF_OPTS = \
 	--disable-man-pages \
 	--disable-tests \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
