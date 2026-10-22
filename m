Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFF606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GYTUcegp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38BD40879;
	Thu, 22 Oct 2026 08:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCNdw9Be1uRG; Thu, 22 Oct 2026 08:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80F69407A3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658246;
	b=HJVwvmR2IKXGgs02xenbeMWkpntyos85tx44BboPOj4hV2/+z8Rpk5epVqjmT3CD6/6j
	 cTC4Q0YOlu0JeG4qo7g5WZ9HneuaOmO6jk+VtGQIcT+WnNbrD+/m/hGkYyXNu1E2Mkmgt
	 U5Sbx36caCAXkad8U46Tn0BfiSn5sfirUiOIY0GJMH7graA/Vsl+FexRldsq2+qKtrk3i
	 H4X110DMT80BRJbEClwOkGdyLUgyj8kjsEECd6YEzoJDwqVNFbAb3PJB1OHjF97XMSoYG
	 9pVC8adW0oqFKkplPEdObayfRju60sY7OzPX5qRnFZSFQjfj7o7mINevTGzNZmZJTcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IrclcdlR7TkNPKql8w4yHZWWVtmqAKv827IdpywKHrk=;
	b=ALHAQ9uhqf+QBasOsdEoVgxQcZTqVXJAueI4S7H9OeBgypDxzxOE4f9XfqW8LVriFSpe
	 w2I5KxRPOBba9Q/JWQupVzA+DpihpV/HPqeTZmJNIDVc8FgixF+sWf1rxL7dDbsojJ+u8
	 vai6oUaZezYLSAupXAd2SGSWSkaTXOynuQdjStXp8xbsayIVTKU6aW7aqua9ElJL6k0c5
	 VcGrJkV99EIgbOFCZXeZe3QNaYHQgDN3odkcD04xOzgVME6E5D7yktDgDUE3oHJMJqL/Y
	 vkvJJL6rfdnEInOxEXFC5xAVc2lAJ8RgQFIkSzgu4gVYXE9mUEkz4l1EskNTqzDwvBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658246;
	bh=IrclcdlR7TkNPKql8w4yHZWWVtmqAKv827IdpywKHrk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GYTUcegpg1yyX76VlSbJDyT9yGuf1PXy9/plbsSaGZF25yPfMHQt+r1OQfhiDE2bg
	 R2eGFQQWY2u8odlKMieGhv1cn1xmPT/dm/JiZZ8kQ29l/4yMPR6DhihOCm23bk8VZ6
	 kvpZjJgdRIKHy6KTgjM/RBAKVVFY/qzqDj4po8w1K2+xxUK+5ydP7yd5jGTi8sDyF+
	 CdxIVrS2/fI/j12aaj/TOL+CLv4+w7lO6YrF537psG1ADyzdzFtePvbQNc2B5fN1Dg
	 FYhjarxFvenIaTMwu4d9/E+YKzbczUbAdGaJQj98WXmEm0ThQ//zu0nX767u6GVeHl
	 WLoK4b9WxULmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F69407A3;
	Thu, 22 Oct 2026 08:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3D9235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0814E407AD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4t5y4oFfn6d for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFDFA407A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658244;
 b=pW4uJ9Stpkah5vtUhwNOwrDh0PdcjvdqUDVx69l1OPymhcHj9KuCeh421BvObwk+v3JU
 hIYGsx0j2+k8b1nbqwFKhh+/S8sCl+V7jbUebsUEzAMQj7WwKI71l5DXEgSNa8mp2s2QB
 io4m57VeIOpDwSki+V4H8HAPk09uWHRou2FOX1uir9fOFz7KApNOPCfCrfY0bBx3/vP+D
 VoP3DXyheOZ/dmdCesd+zVIg5MbHmPaWwgQ0rq2kzMWoZpZlZyOz7pCEkM1xKxlSxn5MO
 CZ0jAUtf9R2LbeQVuR+nMyvo6zSMS+5h6sIKKq+4NOC99+pKaD0AOP8ZWPxb1O1gXMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658244;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=7JZxuJos2Ciu7Sngs4Z1aR80CUZYS+2J6FNxTbpelJk=;
 b=Ps1I/AWmUWO9BKdFkkuirYg29v4bc3er+2A+wANDXlY5wBi/Klam9kSswCAlEvSGV3/3
 gWtVfPc4ETbqbrW13dcsF+7TnSBomPoaUkAUQv6MiJOZGY7biKfOJYJkul2HeWFWF1aoS
 aEE1VojCOdc0rBB4XlWtIaTwEr8Eskjj8fWJkNG4OfrKsnUp4ii4fP5yxgI84b+SHTUI8
 1bjKKlk5OrzzOLkcLu7wlvKwig9JzIdi8aRjWuFcq6DtXe3dMO6i9YQR8ag1lDGJJHGoj
 ESyriZydxZrYgrJx1VrioAkMPMCDJA7D+qoxxVApC/nmN5RPtAXRmx28BQFQd2GEB0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="L/wnufFb"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFDFA407A3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:37:23 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c315869241fso195980166b.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 01:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792658241; x=1793263041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7JZxuJos2Ciu7Sngs4Z1aR80CUZYS+2J6FNxTbpelJk=;
 b=SZnH4w+yMEgMtuKc51Nnpglga4t2E4zMOOjmwsEpXV9Ts0BBTP5rerrlwuZjA1motP
 Pnp9nKeNsbLj4RuPx4pc0A3UVVnMOUl43BfjVzBCOOx2fspQO4X7AesKtR4H60DVEBZZ
 3qxPW+iCcTh7TkJU00tXBRY8lZLA+vDuMAmhxFsCm5C3Y1LfUklTBjpwexO8x/TeH5b9
 692wO9fBI37FWFZmnT96MWmEHPeZh+sD2j5hb+AzXstEme/o58lLwsmI4GuUON5SAZ+q
 Sr8HECoi1JPFsC3pwbKhpM+in+FGEwYWz2OmgV82dJcPBieFz7fXiF8bRrbbVISbXyOA
 ZBqA==
X-Gm-Message-State: AFq9FYIkA2JnQHrFivuLQ2n80++biL1DLU47HSBRVL9lejZDYdM6e4VE
 SW7s07+RnP+NOMjpOubeiKopterTXltvFw6b6dbhO0ZgB9nuZ1o+jJB1i/pHUQ==
X-Gm-Gg: AYBFou2O3muHB563+GAly4dKm1R+uWc0Vm/VJZApkk63luizdV+6vkjg+WxY1T/aohX
 lSh8lyPb57uw2qE2DKLvQmuqzxHqbO0bZ0l5v3o1pGolEa9jwTp+03Ox/MR9zetW6rSi4WR1TCi
 4lbsotukROY+pZQxCu3qgKc1jgLUL64mJMYmslnh5SUfvrOckxLcTBKTByvZMIyDTdjBr2Sd1XG
 LPQhyUq9TODYfst1/Z1UgO2EHvNRiYSsSmcMrX+ygUzmOM4UazuQ8hLsQyoiUh5wBjr2NSXU2dI
 sH7N9+oUGOuQWT7K66+tqO66WLVt0OJAeCImK7zw1SDX3iWS94zeVCKKhupwIs7XMqEgQuvV0UP
 eScQZ9LyCHQ2pE3ud2sJgu39Rz2x0X7UiCgxTVpvZsq0czf+T9UviGIU+xGvyRgffpVc+steJLF
 svM7mhhqJe15JsTn5g5Gdi3l8Nu7UfZNQa8SjRB4WDeR14kMIXlWPQ/87faibSrZzMpz+6vDI7K
 YUbAlmZW6dOYyruYMbb9rKtQ2K9FnLiK4cJbgw0pCSLD2ILZPYHg//snYTIi5fbvL2i3oArCmjr
 jxG1lVhlU6F+ruBsCL0SyfK9vpuEEV3wC9g=
X-Received: by 2002:a17:907:9345:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c467920d805mr453489666b.7.1792658240944; 
 Thu, 22 Oct 2026 01:37:20 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a5dfbccsm82773066b.67.2026.10.22.01.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 01:37:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:37:20 +0200
Message-Id: <20261022083720.2682440-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831160420.2415569-1-yegorslists@googlemail.com>
References: <20260831160420.2415569-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/attr: don't rely on kernel headers
 for struct xattr_args
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
getxattrat() and setxattrat() syscall numbers can be defined
independently of the kernel headers: musl libc, for example, defines
them in <bits/syscall.h> for all kernel header versions.  Building
against kernel headers older than 6.13 with such a libc fails:

  libmisc/xattrat.c:35:16: error: variable 'uargs' has initializer but
  incomplete type
     35 |         struct xattr_args uargs = {

Stop including <linux/xattr.h> and use our own definition of this fixed
part of the kernel ABI instead, so that the build no longer depends on
the kernel headers version.  The struct layout is identical to the
kernel definition (size 16, members at offsets 0, 8 and 12) on 32-bit
and 64-bit architectures.

Upstream: https://lists.nongnu.org/archive/html/acl-devel/2026-08/msg00000.html

This issue has been present since commit c804ebff5502 ("package/attr:
security bump version to 2.6.0"), as libmisc/xattrat.c and its
getxattrat()/setxattrat() wrappers were introduced in attr 2.6.0. It
therefore affects 2026.08 and later. The maintenance branches up to
2026.05.x, including the 2026.02.x LTS, still use attr 2.5.2 and are
not affected.

Fixes:
https://autobuild.buildroot.org/results/10926ccaf3d3212d8816f5156ae2405b469195aa

Fixes: c804ebff5502eac6e7d84129bfb2becc400898c6 ("package/attr: security bump version to 2.6.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3:
  - describe since when the issue has been present and add a Fixes:
    tag for the culprit commit

Changes v1 -> v2:
  - add upstream URL

 ...ly-on-kernel-headers-for-struct-xatt.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch

diff --git a/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
new file mode 100644
index 0000000000..9ab7a99891
--- /dev/null
+++ b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
@@ -0,0 +1,85 @@
+From 9755020b815066732677d6107d40af12a58d1a0d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 28 Aug 2026 23:43:48 +0200
+Subject: [PATCH] libmisc: don't rely on kernel headers for struct xattr_args
+
+struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
+getxattrat() and setxattrat() syscall numbers can be defined
+independently of the kernel headers: musl libc, for example, defines
+them in <bits/syscall.h> for all kernel header versions.  Building
+against kernel headers older than 6.13 with such a libc fails:
+
+  libmisc/xattrat.c:35:16: error: variable 'uargs' has initializer but
+  incomplete type
+     35 |         struct xattr_args uargs = {
+
+Stop including <linux/xattr.h> and use our own definition of this fixed
+part of the kernel ABI instead, so that the build no longer depends on
+the kernel headers version.  The struct layout is identical to the
+kernel definition (size 16, members at offsets 0, 8 and 12) on 32-bit
+and 64-bit architectures.
+
+Upstream: https://lists.nongnu.org/archive/html/acl-devel/2026-08/msg00000.html
+
+Assisted-by: Claude:claude-opus-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ libmisc/xattrat.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/libmisc/xattrat.c b/libmisc/xattrat.c
+index 5f6212c..c07c04d 100644
+--- a/libmisc/xattrat.c
++++ b/libmisc/xattrat.c
+@@ -18,7 +18,7 @@
+ */
+ 
+ #include "config.h"
+-#include <linux/xattr.h>
++#include <stdint.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ #include <errno.h>
+@@ -27,13 +27,26 @@
+ 
+ #pragma GCC diagnostic ignored "-Wunused-parameter"
+ 
++/*
++ * struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
++ * syscall numbers can be defined independently of the kernel headers (musl
++ * libc defines them in <bits/syscall.h>, for example), so we cannot rely on
++ * the kernel headers to define the struct.  Use our own definition of this
++ * fixed part of the kernel ABI instead.
++ */
++struct attr_xattr_args {
++	uint64_t value __attribute__((aligned(8)));
++	uint32_t size;
++	uint32_t flags;
++};
++
+ ssize_t
+ getxattrat(int dirfd, const char *path, int at_flags, const char *name,
+ 	   void *value, size_t size)
+ {
+ #ifdef __NR_getxattrat
+-	struct xattr_args uargs = {
+-		.value = (unsigned long)value,
++	struct attr_xattr_args uargs = {
++		.value = (uintptr_t)value,
+ 		.size = size,
+ 	};
+ 
+@@ -50,8 +63,8 @@ setxattrat(int dirfd, const char *path, int at_flags, const char *name,
+ 	   const void *value, size_t size, int flags)
+ {
+ #ifdef __NR_setxattrat
+-	struct xattr_args uargs = {
+-		.value = (unsigned long)value,
++	struct attr_xattr_args uargs = {
++		.value = (uintptr_t)value,
+ 		.size = size,
+ 		.flags = flags,
+ 	};
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
