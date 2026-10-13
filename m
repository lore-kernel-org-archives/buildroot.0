Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC6CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 04:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C7D80C1A;
	Tue, 13 Oct 2026 04:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbp5AMksiEK0; Tue, 13 Oct 2026 04:26:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9215380C11
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791865580;
	b=JaQnwEDFxfqgoT4LODQm1OudAHDjDuGHr3ntt2v+/QeD79Y0zPDbiFre2RP4uMy7b2wP
	 BI7kQPfdl3ObfFk9PBP2SmMpxHkc+VUA96mO//qpDmR5Z5Om04aXZ7vFryZtx4tUFijo4
	 fyu1iKns3KMT1XJzqJgK4QKrPJS1P+Y1HMjaMUFmjdZ3wTAKX/iGPH2mXXHYwGlCbROKe
	 PdyKQjTuHFVlEpw4XvpV6/ZJsXE8jbAD6klVzXb66+Xs3g5t5aya6kCUD91pNqe7otztv
	 r6n1LHZSGNYVdUl9KuD89tUMQmL2ZQtqK4YtobDljkxi2xdmlJyGdibAFpXxZUKEPLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791865580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HBy6Gpmd0t5XKOtwWwUPb30lUD9/DrB2bewXxBLK6E=;
	b=ENG6RKrQztd5Xicz65rAK6gsYZhV3XHnYPLiDJmbAMzIuBVrDQ43IQ00pZYxITm17JQ8
	 zZ76Kb1cVqJF/VocmW532P9nQJs2LCJCbq0V/Uan7hFXcUuJHqg60JFYyKrAlo/MNi8t8
	 bNDbt/LFOnwYaFUWMryypt0nq9puKbrwMLPA/0HN3dHqdC/T/2Howh7W8QAsmpt0cJdOV
	 V0nj659Prcf1SRMLyFWH7Vz3c5lQIY7ZDQLNKKBPmnR+glMFYoJxCUYU/13oXsVaiI9rx
	 nFkW2AqMEQZUk4u6wrRR7mcfgcqmNzcy0nJ3mjp/qV2Ydf3wK8IjVYcQ4/DX+NNVYEg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791865580;
	bh=7HBy6Gpmd0t5XKOtwWwUPb30lUD9/DrB2bewXxBLK6E=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lhdhH0bPDTMyvRW+xp/TBXfWXHQ23pScTJyt+MZumaR00oYo7sAF3go9pRs+y9pob
	 euXykx8wqomXwbDTGqzJX4o+GKAC2JV6/PI5x0oT3zrkj17/sNtGRRgvy9sfeqQ6GO
	 v/FeX/sFz1q5ZkIq0a+hleeDXhjOWtXUrwB06s5egVgZOhYEC5duJ+ettDNlPaDW0+
	 KPQg36+KYUnB/UhGv4VplKqq7GykdoK6s7UdPE+kapDCQiNLhrl8XLQ0Gc0nUsbgZ7
	 yQR5srG1bQgvZOhYrHl1EmAe3yt4dPwsPzsvS+qGVPdbt6dYUP7lqn/QjlBUT2ixzK
	 YgNUBTcoBmGdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9215380C11;
	Tue, 13 Oct 2026 04:26:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC9A44DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2DEB606A7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIMNeMLaW41b for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 04:26:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9074760643
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791865578;
 b=Reh5BBDthAayej9yg7+jTwmh5ZHSPxnsucMazBf6EoLW5C8WhsnQDIMHmjee3F0r4VxK
 oBzuiVU4Es2eP+/XOGHK2J5giDcwzxe+YsDKTrqoNrAjiZ9vNPZEBSC2uZAKjvD1GFgXc
 RSf33Hz0z6bZMzC8tf70viyxNrTwMlCzyJRr20GTny0VwBiHPIz14uSaXbkj/WrPXsVrd
 rB6HbM5pUHKjcYCW+FxciHJ978/8FWpSOZge29ZpHs3d5Vbp7Dlp5A8STOlkIMuPO6/IX
 keHJh4LSNDD9cEgbBg0/iU44Wa8Knw9B/Y3iow704mtR9NRQ4Mw/wdHVfGkn2Dit2dA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791865578;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=tq9LgAD9bqsBAwFlNURItWZKnOJinq5lv4lCB0/TAoE=;
 b=BxJWebLC4fL8AJBkDE6Inst6WDvDZfnM/zrsBCzUNVI+EHjvNL7Jq7Qdz1+xsb9DkjmW
 oqto44j9O0BK8240cjdLwvjxCctYBa/3Fg1rInqw3fI+KeeTes7hmmZP3oqRgIQhAqvd6
 00/y4/WJ36dgheNtvSti7oLqFGOVNeIh6VUuLluoqcy7iARM5TeFvxvQ4h+uT110gzInd
 aEoRQyP8pjHonDlXe5ssQ5wHdRYw2ITY+CdHQcuzFWp6EEVNt6NF0SoqsdMactQi04laG
 AXWL4aIcROY8qsNm/DWRvptWiAGX6rlg3FB+lReARjzr3kHvdayBPLGMXLGsgBGW4jw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9074760643
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791865575; bh=817ZNLpJRhTWLsHJZCYkO3hQd51XheszLPqtAj4hwjg=;
 h=Date:From:To:Subject:From;
 b=REurtf7/jh4xKFDyar0V6nN114Ktx0y8Fa3e5YiQz3wV1E7S5Elhsm6My5Z9Ll9KG
 TPzXyxTyKcAdmwcO0kRnG9Xl8n6OVVSKjk8wKwJsyvG58SL0ttCRPGiuaY87QXqIdX
 Qhz7E+Ev9ebSMkuIHhdpk+RUewnrNSZKCdjtNOuQ8HaOLDtb4qhdIS+GJssynd74mJ
 nl1y35ZQjMWW00P5EMYpXkWJYQo9VACYZHxiw8HaxKI0HU2ObK+v6SJhW63VOyFOcH
 pAnshsHH8e50sKjh0ng93G9R6qr1gCI6dk1OFz3rycuKWaw15wiO2AUeabjxHwaXB4
 eHPIkXPPU6J3w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D033131E09D6; Tue, 13 Oct 2026 06:26:15 +0200 (CEST)
Date: Tue, 13 Oct 2026 06:26:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <as2y5-1HltXrXKyP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: add missing sys/auxv.h for
 static builds
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

getauxval() works fine for static builds. This was already fixed
a while ago, see the commit message of the patch for more details.

Fixes:
 - https://autobuild.buildroot.net/results/f03/f03380ef48cea232e4958084eae419d5516f4ef4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...l-sys-auxv.h-for-static-builds-again.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch

diff --git a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
new file mode 100644
index 0000000000..74d14b5501
--- /dev/null
+++ b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
@@ -0,0 +1,57 @@
+From 6dc9f06a0330f11171f76f4b831724c02642f11f Mon Sep 17 00:00:00 2001
+From: ramin <lordrasmus@gmail.com>
+Date: Mon, 12 Oct 2026 16:30:56 +0200
+Subject: [PATCH] buildsys: install sys/auxv.h for static builds again
+
+getauxval() has not needed ld.so since 227b7c825 and 737a0edf4 ("Make
+getauxval work with static linking", "Support non-cached entries in
+getauxval", v1.0.52): _dl_auxvt and _dl_auxv_start are defined in
+libc/misc/elf/dl-support.c for the static libc, and __uClibc_main calls
+_dl_aux_init() on that path too.  The static libc.a carries getauxval,
+__getauxval, _dl_aux_init, _dl_auxvt and _dl_auxv_start.
+
+Its header is still withheld, though.  df81bd1e2 ("getauxval: remove
+header for static builds") put sys/auxv.h next to dlfcn.h in the
+HEADERS_RM line that applies when HAVE_SHARED is unset, as a way around
+the link error of the day -- a package that probed for getauxval would
+not find a declaration and would take its fallback path.  That error is
+gone and the workaround outlived it: a static sysroot installs 70 of the
+71 headers in include/sys, and the one missing is auxv.h.
+
+So a static configuration of, say, openssl fails with "sys/auxv.h: No
+such file or directory", which reads like a missing feature rather than
+a withheld declaration.
+
+Measured on riscv64 with a static configuration and gcc 10.5.0: with the
+header installed, a
+statically linked program answers AT_PAGESZ as 4096, matching
+sysconf(_SC_PAGESIZE), returns every entry of /proc/self/auxv unchanged,
+and reports ENOENT for a type that was not passed -- both for a type
+inside the cached range and for one above it, which takes the search
+over the whole vector.
+
+dlfcn.h and bits/dlfcn.h stay removed.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/6dc9f06a0330f11171f76f4b831724c02642f11f
+Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3b28fbf60..72865863d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -257,7 +257,7 @@ HEADERS_RM- := \
+ ifeq ($(UCLIBC_STRICT_HEADERS),y)
+ HEADERS_RM- += sgtty.h
+ endif
+-HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h sys/auxv.h
++HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
+ HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
+ HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
+ HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
