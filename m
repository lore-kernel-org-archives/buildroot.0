Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB633C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9960A807F7;
	Thu, 17 Sep 2026 07:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RrOhHItsHIm; Thu, 17 Sep 2026 07:52:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEBE780806
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631556;
	b=PBgM4cBXwT+XTxXq0TTvGzPDxhBzjI6zgvG4Tbd/uuaZfO83CG9fPqAY/9EG/0aTWd/y
	 MWleaYP1sPi0Kl2Im5Ql59yR9RUzEGBzRB553HIsTB4sx/bxu/9mfnli+mFLz4GdzbUtA
	 x+uMmk14Do/QrEVEAoWRzj5C5uCWRHTrrq1/C/1Z7AduEE9aIvqtO46w+TDpXAQteCzJu
	 3HNQA8uhk4pNd4+Y2lHsJPN4FqWAZzyhhVfjN4IQ0JOQiBSDtHkvPB6PNSukFSEm6rZ4f
	 VkIFuoAqnyvdJmRiI4tgClrKvvloPX3mhO8T6EIcoIaIPugO9qQ8dNFzK7cr3O5aX2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OaTwyt+gnMBBiwRWlaeKGZ/TAzX2oOo9GvFi3Zw7hIE=;
	b=QM8qMg+NNc1azaN/0G1X1ZkB1NmEo+j4rJuSxtcdjFAGerjTsZlBjgsNHBLAO8LY3z91
	 sVR6rM5GHI+g2+b7Y+Dx1UUELjx+bbmVc3DbjWNTalqZM0JopZnwjNV+ArPgumanAIdKu
	 EJOE3MXiFSRHJ7Mh8/iGKbX/YE77xFKNkzV6bLTGMyWYJSdtB0UnseDmpIDS9x0pwz4+k
	 Km2WKL+PjQ3frMUeKCskh1Gv3NES78HFTYNuRm/ZALwV2pkcch6yXHZMvTW9oarElYpq2
	 vVtc2DvVDyH8h9PB4MNPCzBYDmhPTQcV9PL9/OyOmj6RagadVDQSknV6vSf15aSf5Fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631556;
	bh=OaTwyt+gnMBBiwRWlaeKGZ/TAzX2oOo9GvFi3Zw7hIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HX6ODSF/niGwSTQiKbUVMzahMtL/DCcX+OWIQDnndKLjwPclxEE2uq7dnjauiTccR
	 MDYe1ftAiNCuxBUQyABOsI6DISfc8oQ3k+QniiXfLlWJJkyheIzIN1M5o2gAvPAVFa
	 2sLSUUvz7R7u6/KJHB1Dw+kXqBhrBspUWYzV7pO5ERSkfufE6bfGtdkZzRtkZOB2XH
	 9qF5FHB4zOVUdVlYwPWzDYjBBa+t4zrhsCU+QdwyrL4ruoYqrJro7FW5s1i6o0By07
	 Xoa39Z0D21j+4ufSfgidlyJt9cBVs5KW8pz3lz5n4DHsHBwfiYWOWJZ15aPUTSYZOp
	 XmBqj2ncEFVAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBE780806;
	Thu, 17 Sep 2026 07:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 915B129B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EC4E40483
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRKnWiZYkTwe for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DD14640445
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631554;
 b=DP2EoTL8lQu2ztLXHnqZ7i/KC1YFtTHuxQInJ7QKhbfUpQZbJWXW4qQNCcWkPKdD6B97
 3fxB9aF86ZgmS/WhpjymU+AfUFG+PXm48D0JjMDp6cNJ06qi2WFMcIMxaan4sBfwANW6s
 4d2SgAAFgambKp80j9fPdZfWfVWO0e4Al27OwTaUWO4LVKuPzk4BBQPGuNy8Aij2a5qH0
 ozV8YimkYg+CoobYqWTdXpQvfRbvGHd/carVFcB4AijQenr+npVoYaUmqapJodnQioAlY
 DT6XLNyydcSjNAnapeXeG18qS4wWOsct2ZR0dZN+WMMoQcJdJHmrqTGJ56q2aY3yn+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631554;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QSiRWoV+UAAecubMTBNrVTg1IGywYM+CAJvqyXzUBhk=;
 b=PxTDF81IEhGgnlk2BYw2f9LN+1eiyFKH861JPW2aVGxUAD+VQhX9FiHfY9W9iW2Cr867
 8mh8ErlPZLs2QRDFnnZXt3N5cTeh4huF73WRQng19R3JoRrQhx0dlcTN3HmYAQPqSrM0g
 HEmLe4M4z/JaAAFgos+jhT21rxpH6gHWE1RjoStNkBYOhbI0T+Vi58NSCdSbMGDQ2vmIf
 qbueECEIyIHPsvge1QCa2zITntxv/wW5vnvRTNsqk3p4dh14HQA52C8E+W1Z5FT9NnWGm
 0uRlba9M03oS+G78ZjJJ0SJha5EBDiUJzXfSOlGdVuRRj/FzsyNQnPxwz8cvkP53x0Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD14640445
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 210AB96AE1; Thu, 17 Sep 2026 07:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:45:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdf4dc05c55b2e578125ed8ab5ee0b440272bd16
X-Git-Newrev: feb628adb03c6df435753a1dc84a336ff7ff9ec8
X-Patchwork-Hint: ignore
Message-Id: <20260917075128.210AB96AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-tools: remove unneeded patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/feb628adb03c6df435753a1dc84a336ff7ff9ec8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream added the configure option --enable-tests with commit
https://github.com/lttng/lttng-tools/commit/6ba949601d077c90e736fcce4e722487c56a09cb
which was first released in version 2.15.0.

While bumping the package from 2.14.0 to 2.16.0 with buildroot commit
edd3a015cd90441291d2b5513c71e2eabf682e24 this new option was not taken
into consideration. We can therefore now remove our own patch to
implement this configure option.

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-channel-memory-types.hpp-fails-to-build.patch} |  0
 .../0001-configure.ac-add-disable-tests.patch      | 38 ----------------------
 package/lttng-tools/lttng-tools.mk                 |  2 --
 3 files changed, 40 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
