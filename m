Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3F606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nj/YFFM1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PGXkt8u9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB8A811A8;
	Thu, 26 Nov 2026 15:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBkI1G0UB3Bc; Thu, 26 Nov 2026 15:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EC00811AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795705595;
	b=Y4Cct31FMfLjYMcLLNbPk8hrXn8m+D59L0DkmS9j/0YPeoqtulF1P2eAqd257lyBVIps
	 g+oGgQRzMTPOS4tpxRNIeZ1BFE8jCO74NZAcUBYHP31nDz6i9Ze13i0+cIBAhdeH4EGDZ
	 kcswbD8sThZLC5brarr2dLQfC8nU6o+JaaDQSi4nzTfBzXQULgPAlJyX78Hr8DlXqGVmQ
	 pxE9bWmgUWBFmfcnrZdIVLMoZlK91jfKyypaV9h9Fo5vd5IXsnlOLOe+40xCl1vx046Gq
	 zAr2Zn3tk+kT1aT2onTz64QUFPaG/WlJRKS1augbe+o3idHn6k2ihbygdqGOiEOEHJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795705595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mDVFcTHv9ayEq16QOg03xzu9Q55Ez0LTO74fSHhnXNc=;
	b=qASlF5FoaHMrgoK66niQW0Tv5vwEaAQtiuX0gmwv9N5OvQMghuEo5Wfyb55iD4IaGHz5
	 XljKzVVAWxzlPoIbLevrJpudXxZglHIQmZL9+7XuAMDJV535edaGbX7vsazsfH4Y8p0lp
	 zwJVDC8/ZvJMQDhM+BDPa3xeCcLrHZ+qNgyRtgThDqj+sYPLjcnnXzhcYjSoDEcqLuD66
	 qogwZQptGAN/nT3BZtCLbEgjvRWjeDH+2yTewyuXeRn9KseMEbhT74A58eF6ivbpPSNtt
	 7oa73BpAwlE45fx6dGIxN4cEfYQD1TU2cYayQjova0v/ld4j4jfOZ7UKRZH0/J8OYag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PGXkt8u9;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795705595;
	bh=mDVFcTHv9ayEq16QOg03xzu9Q55Ez0LTO74fSHhnXNc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nj/YFFM1iMIzGTJoNKlSvN2qC10/JSmwyVVa5gjWz1ZtLa7ePy7VPwYnYuk6KuYTP
	 P5iUDpwEaZ0TlPlV0uYkvwLepZRpJrFyYMH6HrFU5UX9LN/jOVGzICa6w/PzITM31v
	 E1+y0BA8jxPBLz87EX9cdWfZ8dCJ1SeTgZL6ZdTKB/WvVlKvJCf46PTAC0tXLSIJTn
	 iUBqKzedl8yT379YkTsBk/jyaraQQiFtv589NHll6sSPZH386SughKgBlGWxX0ZqE6
	 aXS+/hyx9vxYy0skvMrj6LUtA6wQn+Zl/vJz/zwx8+2E7GWgjgORjRTOkl8O6rwazg
	 ml+knTiy5siNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC00811AD;
	Thu, 26 Nov 2026 15:06:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8259D32D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73DC6811AD
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDtEM2L4WFov for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EE6D9811A8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PGXkt8u9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE6D9811A8
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:06:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb77a462c6so58977485e9.1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795705590; x=1796310390;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ClTEqBu2kdjTTCHKZ5iXP8KTaSoHJZxao8cYzIZd3PE=;
 b=PGXkt8u9hxBa8WUhaUCtGUd2h3awiFMY39Muu7xFNJ3Bpswi3vxYmI42AHLD64UgEr
 YOoPEUND4FJF+aMoYe79QVzWo616oUqYxVTD07GiAgRM4gZsOtLnc05t1nfK/JTYZsnB
 piq9wOUK7K+EVI1gORLGE3k2//ZzBuD4DWkQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795705590; x=1796310390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ClTEqBu2kdjTTCHKZ5iXP8KTaSoHJZxao8cYzIZd3PE=;
 b=moi1sTANSHLwHJYxlmOtWrrTusp7LmPZeXzgzEqPL/9oLQ4NPmA9gOUG1C9Uv5NJLQ
 Fp26+9z7a7loMNsthL6oOj/AYGLGrsYKxVL1nVNjhvrW72HtMt3go6Mldzkk7dEpmf5d
 tBXiH9GgdlgvtdgM4uVl0U/04GMTTMcJsAwtK3Ib9zmbIWk35NHYkDMoKOnBRz/RQxwz
 g0In3BUFs27QNrtbVq96MlpjkgHaPzuTeFbc1O5VWHU/yFOWnkOt/+NJsrJ+2QVNWQ23
 oD2LpvS3ZfjxhuuYWOCMnvh99RoJ/28eRsfGAN5kFucIb24cmDoWRq5KzE8nb6SeUNK2
 u4aw==
X-Gm-Message-State: APuU4Z/s8ki+Uly4ktWRyaNtTu+izC2wCjuqvPDjCaMzAaa+ERLAlLzH
 bGtvTrOkCOR8Z1tHra5l3WLhdnDmNdUWnqQlchC1ZUaiMpqXR9O4vljPnm/Q5/k470fK4ilbWTb
 gzn1b
X-Gm-Gg: AZFdTZduhm75NXLVHh7kQV+ksu4/jagssLRuKHIRJw68DNOK+GeiAG3lfpX4mBufeuz
 BeioFtt1W5XgUkbIz1x+2pZcJfxbobyEdaC05Tz4+/M/WG/V5sA19X+jQdztD6wwYjKd1SEhgrA
 jQCV81ldV8pe3ykvRl4Ir73ovmy4bta/oa62RTmSF6xUoAbMvnKu7nyYNUScBrtzpHYGKaj4nzv
 Di91LM7gSycD3aGc46OOzNLzF77YMzGPRQqa8+nOVqaZy21eg0amU4D3fjE/JUDfMDYc/Gac+1E
 Qk1sgg2D0oMFpuYTr32yKqpH7PlTnjs5La6CU6LfyLdwkGT0KZ8yR+90ZWrReY3/GolP1U3i9AC
 wX6snRU14UrfMEFSOeoqL3itBDhP+QF5atO/T8q0mXPOWuIqwNCVKxfo78VnbPCGSFoKIFSPqQ9
 /lzfmTn7LEDBOI49+kzR46+WyXhlgO+9NaZdSRAa5I7OMfyG25FXwSdJOF0qCMMObqSWUs8mfRE
 noMkWyfGe+ZmqIYgfyFNLtLMQ7tENafJ1NKPHKcxNHurUe3Wv9jDcK6Zbqxb5C8jrUoS1p9OZuO
 vgpL1ySVNq/NjOb6AUL4GqtppbFjALeYTZ2ZcWuR6pj+dZHBtD71HmtdnxVHjgbKnXxo5MVzVPz
 GAimlPK+vo3AEEJ5d9Xcp6aYFgP5YVqZJsqz1nLHxXbgwTnsvEQuPcXXHyYDHXZe5YEiqsq6piS
 T7ox5jVlXGfjdQxhqtzx/DCGdQrrbmau0rmV5Q6GYnmg==
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4bb887fb678mr404099645e9.4.1795705590535; 
 Thu, 26 Nov 2026 07:06:30 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a1e8bsm506570595e9.9.2026.11.26.07.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 07:06:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 26 Nov 2026 16:06:12 +0100
Message-ID: <20261126150612.1183651-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2026.08.x] package/drogon: fix CVE patch
 application on 1.9.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 884806c1361a ("package/drogon: fix CVE-2023-26137 and
CVE-2023-26138") was cherry-picked from master, where drogon is at
version 1.9.14. This branch ships version 1.9.13, whose list of unit
tests in lib/tests/CMakeLists.txt differs, so the patch does not
apply.

  Applying 0001-Fix-CVE-2023-26137-CVE-2023-26138.patch using patch:
  [...]
  patching file lib/tests/CMakeLists.txt
  Hunk #1 FAILED at 13.
  1 out of 1 hunk FAILED -- saving rejects to file lib/tests/CMakeLists.txt.rej

Refresh the patch against version 1.9.13 and renumber it, as 0001 is
already used by another patch on this branch.

Fixes: https://autobuild.buildroot.org/results/754d40eb11cdfe1521c6ca391e2965afdd7974a4/
Fixes: 884806c1361a ("package/drogon: fix CVE-2023-26137 and CVE-2023-26138")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...3-Fix-CVE-2023-26137-CVE-2023-26138.patch} | 25 ++++++++++---------
 package/drogon/drogon.mk                      |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)
 rename package/drogon/{0001-Fix-CVE-2023-26137-CVE-2023-26138.patch => 0003-Fix-CVE-2023-26137-CVE-2023-26138.patch} (94%)

diff --git a/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch b/package/drogon/0003-Fix-CVE-2023-26137-CVE-2023-26138.patch
similarity index 94%
rename from package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
rename to package/drogon/0003-Fix-CVE-2023-26137-CVE-2023-26138.patch
index 0b8e93df8731..e1f6aba70792 100644
--- a/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
+++ b/package/drogon/0003-Fix-CVE-2023-26137-CVE-2023-26138.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Fix CVE 2023 26137 CVE 2023 26138 (#2630)
 CVE: CVE-2023-26137
 CVE: CVE-2023-26138
 Upstream: https://github.com/drogonframework/drogon/commit/3c068bd888c332b9a155ba45a102d5faba643211
+[Dario: adapt lib/tests/CMakeLists.txt to version 1.9.13]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  lib/inc/drogon/HttpRequest.h          |  5 +++-
@@ -70,10 +71,10 @@ index f949bd0b033f..e0b1c1678b52 100644
      virtual void addCookie(Cookie &&cookie) = 0;
  
 diff --git a/lib/src/HttpRequestImpl.h b/lib/src/HttpRequestImpl.h
-index 1b397b7f12fc..39fb868739d4 100644
+index 2d956df79992..bd15105e7d03 100644
 --- a/lib/src/HttpRequestImpl.h
 +++ b/lib/src/HttpRequestImpl.h
-@@ -462,6 +462,8 @@ class HttpRequestImpl : public HttpRequest
+@@ -458,6 +458,8 @@ class HttpRequestImpl : public HttpRequest
  
      void addHeader(std::string field, const std::string &value) override
      {
@@ -82,7 +83,7 @@ index 1b397b7f12fc..39fb868739d4 100644
          transform(field.begin(),
                    field.end(),
                    field.begin(),
-@@ -471,6 +473,8 @@ class HttpRequestImpl : public HttpRequest
+@@ -467,6 +469,8 @@ class HttpRequestImpl : public HttpRequest
  
      void addHeader(std::string field, std::string &&value) override
      {
@@ -91,7 +92,7 @@ index 1b397b7f12fc..39fb868739d4 100644
          transform(field.begin(),
                    field.end(),
                    field.begin(),
-@@ -480,6 +484,8 @@ class HttpRequestImpl : public HttpRequest
+@@ -476,6 +480,8 @@ class HttpRequestImpl : public HttpRequest
  
      void addCookie(std::string key, std::string value) override
      {
@@ -101,10 +102,10 @@ index 1b397b7f12fc..39fb868739d4 100644
      }
  
 diff --git a/lib/src/HttpResponseImpl.h b/lib/src/HttpResponseImpl.h
-index beebe7fa8db2..f28d43b338b9 100644
+index aa8018cb73ab..8d473f10ee06 100644
 --- a/lib/src/HttpResponseImpl.h
 +++ b/lib/src/HttpResponseImpl.h
-@@ -193,6 +193,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+@@ -157,6 +157,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
  
      void addHeader(std::string field, const std::string &value) override
      {
@@ -113,7 +114,7 @@ index beebe7fa8db2..f28d43b338b9 100644
          fullHeaderString_.reset();
          transform(field.begin(),
                    field.end(),
-@@ -203,6 +205,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+@@ -167,6 +169,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
  
      void addHeader(std::string field, std::string &&value) override
      {
@@ -122,7 +123,7 @@ index beebe7fa8db2..f28d43b338b9 100644
          fullHeaderString_.reset();
          transform(field.begin(),
                    field.end(),
-@@ -215,16 +219,22 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+@@ -179,16 +183,22 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
  
      void addCookie(const std::string &key, const std::string &value) override
      {
@@ -236,17 +237,17 @@ index 16a6c21732d2..53f2c13cff53 100644
      const std::string_view &contentType)
  {
 diff --git a/lib/tests/CMakeLists.txt b/lib/tests/CMakeLists.txt
-index 10f42ede1693..514e8692e74e 100644
+index c8249b41abf1..71f39b50e0eb 100644
 --- a/lib/tests/CMakeLists.txt
 +++ b/lib/tests/CMakeLists.txt
-@@ -13,6 +13,7 @@ set(UNITTEST_SOURCES
+@@ -12,6 +12,7 @@ set(UNITTEST_SOURCES
      unittests/ClassNameTest.cc
      unittests/HttpDateTest.cc
      unittests/HttpHeaderTest.cc
 +    unittests/HttpUtilsTest.cc
-     unittests/HttpResponseSwapTest.cc
-     unittests/HttpClientTimeoutTest.cc
      unittests/MD5Test.cc
+     unittests/MsgBufferTest.cc
+     unittests/OStringStreamTest.cc
 diff --git a/lib/tests/unittests/HttpHeaderTest.cc b/lib/tests/unittests/HttpHeaderTest.cc
 index d10c8887e5f1..940622989b07 100644
 --- a/lib/tests/unittests/HttpHeaderTest.cc
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index e675ace98fe7..7a2f6d6aade2 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -12,7 +12,7 @@ DROGON_LICENSE = MIT
 DROGON_LICENSE_FILES = LICENSE
 DROGON_INSTALL_STAGING = YES
 
-# 0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
+# 0003-Fix-CVE-2023-26137-CVE-2023-26138.patch
 DROGON_IGNORE_CVES += CVE-2023-26137 CVE-2023-26138
 
 DROGON_DEPENDENCIES = jsoncpp util-linux zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
