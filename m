Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C77606A33D
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EHN9gDNW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A409F407F4;
	Wed, 11 Nov 2026 14:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF0hMwXZZPCP; Wed, 11 Nov 2026 14:01:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A076D40778
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794405680;
	b=lsRGXYQBLaCytUIPf8vlTj3Xjylt87py/y4a7EcRv5MohPxroUfFYq9tVl23HIFGChia
	 nNNnz8KXr6D4kze3bZo6pnFqrvcGumOjDtLVFjxXcH5a/tOWxhTdrnG5GgyL4LPfR0G/M
	 jOnaCiNk6PJIzrua3PVCys4+NBPHaonxNbkgnUa8fV6atDzGvxHZF6/fsFKjZ42QJrg9Q
	 kSqZMruDw6BLg4hw2mmq7LrvC0LsjpwEtGEVf5HngEDxqygLF8TNL2miEsxqhGhru3E8o
	 cgFhsb7sR7tHN16N2CxliYOk3WIBJY8m2TOGhIb7fw1i21rxOyK/T9vLV1dPUnOkkAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794405680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=844cJMCLy9ctjERAq3GooHfKFxzyU6RSB5lNl4wlYDk=;
	b=B5jUJGkNangCGfyD/agyaCq7RFq3MVQmt88WZOkw4MHEVdgVngABr33RtWidlj+DiU2N
	 FSRVwOE0reTHCq8fV11Z4X8P3Uwv5o/YxzPjFPrmT3GPffvv/KaoBXE+4T9ki2pnyND6m
	 FACgsiBzT8ysopaROIRmtY4NHyPE/aoFowY2olJd/7aP1Ok1ezJLCcGaPJSzfR+TVaNDP
	 /kdZD3TDcF1frABWy3mlScwvkrhHJElBfz4VRJ35Jf9jJecclhfX5pEneiIRKjDsftBT+
	 F/hmcXfur3JgZlo4Kt/7o2gEUJCS/V/KSv4l6HMnMWBy60nvpNgDqlevxXhmSt56rCg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794405680;
	bh=844cJMCLy9ctjERAq3GooHfKFxzyU6RSB5lNl4wlYDk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EHN9gDNWKx5BStuY9UnlpO8NH1603sVBvcWvlpm4BjMUWQamfQgm9Kn+maAHMxJsI
	 +NnmF+OvMkCTz/MK6/GYklYHZecLizV4DHmsrQGXVx1cGy+KojaQZvfEWgoE5EO8WX
	 z4cT4RMxs1a+z/m3ozhocFqNP/41TBO1lkHzEJDy7U7Ka2ZIZq3U3xdWh/UH0cIJIn
	 QaTWCpYv7j5jy+UYIxXf+CjA0J71d+TTRaCn9KhlWM96l3IsdvuvE0CkDdGM1w1hNM
	 /U4XbTCDw++TPUslSpz59ahoiLwi3STmI7M3vk3DvxF1Yr70OlBpiFJTYgoC+WMYbf
	 YhFQz6qW74nlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A076D40778;
	Wed, 11 Nov 2026 14:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F6017CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F2578139F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEj9f14AVnYk for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 14:01:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 42B85811FB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42B85811FB
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:01:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c4d28f75d62so434091866b.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 06:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794405676; x=1795010476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NCaviexf0xtFtDvvofoxZ01m0oJ5whoMszGoAXwQqkQ=;
 b=cF8FQxVLmEOOYGaimZWGS4/gqe4FdkAyx+mpQti1UkIKFZSYwu9He1VVmUJwxUkOdM
 uCT60mdazMcMLsEzzHPIrmXLp9Kz0skeTyRJ9L573xYBV2mpSBIsKSTvOlfSEsXDd4Ug
 8SCp83Nyu03qg5moGsjnwThAOPffw7gJDWfFDy5jaqlYjpABRIDY9VoP8EdQSVtYX6Ms
 VUZKJdyM/GY/y+nmXy7l/n8aYaFAXgEkfazQd4WxJd/h3+P5dGstW/GZLlfFPuK3z1Fj
 El8gdOpcvzf5kuI/f3Via50PEWlVRIsB42b5Vl4f6qvsYGJpAriRwu+/xRYqPsfkcHDX
 cL6Q==
X-Gm-Message-State: APuU4Z+DWXyXCd4cpJu44knKZIjHH7dzoOEpkaSK0rUR+jO5a68fEQj9
 LQZFC86FP9nBwgTvOgapwAcZWVHh2rDdEou0Fsohv5dz3ZPqiNIVm8u25hlF5g==
X-Gm-Gg: AYBFou1zJfnBLukMky0PrbSxE1MnfGWlzMwC1o+HYka8Yg1/mjPlJ1oy6lvNysC3LS0
 +iXrZT7uKSDfzbOmQ6mINmbyyg8etgegHxhG90RoNbBT025vCX4kky5+ij0rftjH3uht2S83Nm4
 h4vbt07JFlIyXx6xE/bLtEcxfBDDkiPmRUkT7n7NmatIKY53ljFJAqs7BuDxurcKytty3mzAxFw
 Hye2FRGv7H8BtsTHlU8Yg+30BK+qyvmxv0EECHg7JOuqEQO6AbYBY2sPVG1zNJbrA9UWP0Q72Jg
 igwmTJi8rUFH+TZiAVIPziTyzwFzceVIYvQujVFNoXyY0+y/Kof4IWv6wmsT0eao95rltf3klBb
 08/IcbIGLO1ZkEri/C0uXtcEjXK0YS2FuL9ZgRgRlN4mlPYttB6qv3+2o1Ul+ATbvJgMy5rCIsR
 FedTfhqLVgwbYra3BJL7fypBzyNPX6vKQTFVuDvQ20HTUEG0pHVI/qlfEUESrDzPPQtzK7dgSkY
 3m9dT37xotXUeuTN+rS27S+vK6IFuQ2CNBGJc7ytyHyhp6y/U3Qd+dVInLCsdNlCAJeMF0O3Ogw
 gzWwc7/WNa3qTKlSei0c9G3Pz0e+L9cwZqlXzl5zZDFmcCcQwScWBKxblkJ3JIHEdYmvn+AhveL
 5eWBrlIUNTg==
X-Received: by 2002:a17:907:3e1c:b0:c26:19e3:e98d with SMTP id
 a640c23a62f3a-c5066d1a636mr192059666b.45.1794405675280; 
 Wed, 11 Nov 2026 06:01:15 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a595fe7sm236235366b.37.2026.11.11.06.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 06:01:14 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 15:01:14 +0100
Message-Id: <20261111140114.1786053-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openntpd: fix static build with
 uClibc-ng and GCC >= 14
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

The configure check for __progname calls printf() without including
<stdio.h>. Since GCC 14, implicit function declarations are an error,
so the check always fails and compat/progname.c defines its own
__progname. With BR2_STATIC_LIBS=y, this clashes with the definition
in uClibc-ng's libc.a:

ld: .../sysroot/usr/lib/../lib64/libc.a(__uClibc_main.os):(.data.rel.local+0x8): multiple definition of `__progname'; ../compat/.libs/libcompat.a(progname.o):(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status

Backport upstream commit 8e4fdc1c2794 ("fix incompatible check for libc
compat"), which adds the missing include. OPENNTPD_AUTORECONF is
already set, so the fixed m4 macro is picked up.

This issue has been present since commit 5eb0203cb05c ("package/gcc:
add version 14.x"), which made GCC 14 available and thus turned the
missing declaration into a failing configure check. It therefore
affects 2024.05 and later, including the 2025.02.x, 2025.11.x and
2026.02.x maintenance branches.

Fixes:
https://autobuild.buildroot.org/results/bfcd46dc8d0b6799c7408845ba05737f039cddc0

Fixes: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27 ("package/gcc: add version 14.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...x-incompatible-check-for-libc-compat.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/openntpd/0001-fix-incompatible-check-for-libc-compat.patch

diff --git a/package/openntpd/0001-fix-incompatible-check-for-libc-compat.patch b/package/openntpd/0001-fix-incompatible-check-for-libc-compat.patch
new file mode 100644
index 0000000000..2a0bce7bec
--- /dev/null
+++ b/package/openntpd/0001-fix-incompatible-check-for-libc-compat.patch
@@ -0,0 +1,29 @@
+From 8e4fdc1c2794e861cd026864607fa6b04c5237cb Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz93@gmail.com>
+Date: Tue, 21 May 2024 16:10:45 -0400
+Subject: [PATCH] fix incompatible check for libc compat
+
+It relied on implicit function declarations, which are banned starting
+in c99. Result: the check always failed.
+
+See: https://wiki.gentoo.org/wiki/Modern_C_porting#How_do_I_reproduce_these_bugs.3F
+Bug: https://bugs.gentoo.org/900296
+
+Upstream: https://github.com/openntpd-portable/openntpd-portable/commit/8e4fdc1c2794e861cd026864607fa6b04c5237cb
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ m4/check-libc-compat.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/check-libc-compat.m4 b/m4/check-libc-compat.m4
+index a806cbe..3bb859a 100644
+--- a/m4/check-libc-compat.m4
++++ b/m4/check-libc-compat.m4
+@@ -1,6 +1,6 @@
+ AC_DEFUN([CHECK_PROGNAME], [
+ AC_CACHE_CHECK([if libc defines __progname], ac_cv_libc_defines___progname, [
+-       AC_LINK_IFELSE([AC_LANG_PROGRAM([[]],
++       AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdio.h>]],
+                 [[ extern char *__progname; printf("%s", __progname); ]])],
+         [ ac_cv_libc_defines___progname="yes" ],
+         [ ac_cv_libc_defines___progname="no"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
