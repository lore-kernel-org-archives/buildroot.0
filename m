Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171F606A32C
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eS13ZTtK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF67605E4;
	Mon, 23 Nov 2026 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lykalOIMaTqF; Mon, 23 Nov 2026 14:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA3FF606B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795442503;
	b=q1xx5jbs00SgUlIfd6rWiKEytUBf13SVDEka3RUXfqRfG2o7jUs+rSr86F42DiRKpehg
	 jml0nyx+b1AcydRp/820jUe5HHJBuw6s+Jy4qdJeOY8fl3KgwDPZ7MWoHDMR308Xlv8Gm
	 M0kmdhH/T7IdTMY25vksQQdEBldTUNRSYHkzkGFGGyfGHLlQ0tYIP9pSXBZ3LgvyT+Bdj
	 54DMl22S2YrcbUm/duYSDG/V8/yt9XVrSIRODLCDMCBkyPcOrjllwmwL5nEewVC+9+5Vb
	 PSRVJUtKD/BzD69JbmY2d+bmuKuO76BaVa7C3hK5788PCQKOgWLl/b3CyXQSjwGrh+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795442503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=agAKMq1gUA95Bj/beUFIUVBMirJOghnIGhZUze1zyoU=;
	b=FPFAiSieppwY1Nw9NBIrT4XQC40jbym13PocVFZdZsDW0pUAaIa6wWFFvw7OHAHCOYO8
	 e0rcQMHwt8KpYTf0QA2fZs2/l3UFZYChzSe83w6sFV0mOz0zTE6MSXok19g5Ryx+pgZh0
	 ETRHWjBzEij883CosLmQsplR/8FJr3i/KZZhzNvxAnuLTb45W6e7SCuPBreMJdhmLPh6r
	 uo0o610mkrr9JIWixTTopjnRRJaXYR/CDxlmvu3KTf1MHxWPH6WZtlsBLUVXELDsXLSg6
	 tI3O8n1VcBhCt+/h/aBMasKFB2g6K3gokdZZEDLcCxwByFP8NaazNfUqZ9k+PuZgp3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795442502;
	bh=agAKMq1gUA95Bj/beUFIUVBMirJOghnIGhZUze1zyoU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eS13ZTtKjmvD4F1GsdWL/hO/T5mxlOEP68Fg/jvYKnADoerVN03NaNegijUDwYzhN
	 SrN3CUZzhE1qxa31E3L5H0IfboLvxP3chpOnZcqn/6tknzqcd1aZglFKh46VAEzpuP
	 EaFxFSJpF0q0O88+ZCnGyDEs2p6efHND7AQ7Xg9mDPeYg3hOEapbuZ/xFH/AxrwLr0
	 jyrQ4lB1wk+uEGHuDKP2DjLcndq6+gtxmBS9tvLL4QYGHpCwmebjf+Mq6DVzb6pvHF
	 hgsXyai4kyES2C49DOMXckpQzmFi8g6iR9VwCcX6jl9YZ4L5nzwCrJhDRlVHvUmB4b
	 IIMVuezbUOvnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3FF606B1;
	Mon, 23 Nov 2026 14:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB803A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D07504022A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9x-0WlTMK-1 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 14:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95EA9400BD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95EA9400BD
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:01:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4ac109a8a12so1891051f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 06:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795442497; x=1796047297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DdRoDut6FIlMIE5ZRQegt3MEBwUpwZIUtngIsThesgU=;
 b=fhlLnNTsV6pt0gyuuDvb7MbsbhOY10b33bh7k0LWOUPLDo849kZ4mw3Y0l0KszirU5
 iCpFSnC95Ax1atMIN7kJInA8E4hd26Ihk/I6ng+Bne3t/4/4yeRp/jbvUGz1ypxvcfWr
 3kTfFAQ2e0UHoIvEz8z+siO/K0bdK/jBAB4XLFRVkMqMrVBHY3GIJHSvOyA+dnGFIciZ
 HeEbLm4F/TX5mZPqtS5jLmjAhhigOEVYep4LLtEZxutN1lGNpvgCqY/ykfAXBdTSJOof
 TOrnhAK0bbvz8XYTKWgwllYG5F3cRMJUW1PYjmoT0trVqRDa+Le6wLC1bx7na8XIWjAo
 UReg==
X-Gm-Message-State: APuU4Z+Lty7tVj+lzl27t+Ca6kWIJDnVcHDOC1kt06VDKbmZDiQHVGLu
 V31N6TWonYXxCCV5jP+uPfuRv2ojD14Ea3C/2WoQz5CDBUXIBNP4h+wvftAnZUspAoos8/zq/46
 eUPQ9
X-Gm-Gg: AZFdTZdrGVj/M1TRkwG7yXo5TRnsbeYA8wbW07Uul6EI1w8BsozfFm7V+iK5g5F4/CH
 J521pvCHkvRhGtJE/tEgQIl+iY4j6Q2PfbaoSG66Y0N2Gm+1W1eeHJVcjcjRojMjqODDXparGId
 Nltou7wIVuwWVB8xfOQTwuVyrARHm/+235C+HLxYGZbf8v8aGgKJOjE7xpPGbR5CKrQ65cTO9bn
 NIaaaS1wnUy6dzExjQhQSKwIH9moNWIVupg7IiLdklYlHGpFU5zE07CR91iE/vU4YphU172V3cB
 MFpeSwEiGgtGLFmzcjzPk2gN5hI+RLqMFkUUxw+KDxJZyypFJn/vO0gmuEE8tcr5DvwcbPFDHph
 v6AeykswUwS3mufR9ty+YlBWPkHqvGm04jH6wxV24i8pVK7oaByl/NNFXeUsdj7ZoEa3j9t2mUq
 SBlpGNeIb21EKj41eUhDr2kfyY3g2iXJjRhAp/ylvwF4h6uwhdPAnnYc8Fmr56sRXhHsQnyp0PT
 lQCrMDsyV/RwPBQRA2InR3xc2vQi+uvXySpqc2Pm4zFLKJGAsKmx3hKU+JO772s/XP095pbycjN
 qUZc1xTb6yyVeOdRdNVjl3Mcug==
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id
 5b1f17b1804b1-4bb88824b18mr243887695e9.33.1795442497423; 
 Mon, 23 Nov 2026 06:01:37 -0800 (PST)
Received: from mindpad ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865b1sm346664805e9.5.2026.11.23.06.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 06:01:36 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 23 Nov 2026 15:01:36 +0100
Message-ID: <20261123140136.360593-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/libmspack: patch
 CVE-2026-110602
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes the following vulnerability:

- CVE-2026-110602:
    libmspack through 0.11alpha contains an uninitialized pointer free
    vulnerability in kwajd_open() in mspack/kwajd.c that frees unzeroed
    filename and extra pointers on header read errors. Attackers can
    supply a truncated, empty, or wrong-signature KWAJ file to crash the
    process or obtain an arbitrary-free memory corruption primitive.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-110602
 - https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f

(alternative to commit fdcee66f200951adad776dbde5d095521e972564)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-pointers-before-returning-any-error.patch | 42 +++++++++++++++++++
 package/libmspack/libmspack.mk                |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/libmspack/0001-kwajd_read_headers-initialise-pointers-before-returning-any-error.patch

diff --git a/package/libmspack/0001-kwajd_read_headers-initialise-pointers-before-returning-any-error.patch b/package/libmspack/0001-kwajd_read_headers-initialise-pointers-before-returning-any-error.patch
new file mode 100644
index 00000000000..980bee6adfd
--- /dev/null
+++ b/package/libmspack/0001-kwajd_read_headers-initialise-pointers-before-returning-any-error.patch
@@ -0,0 +1,42 @@
+From 4d868504114346aa767d435fbb89a8b76603493f Mon Sep 17 00:00:00 2001
+From: Stuart Caie <kyzer@cabextract.org.uk>
+Date: Mon, 15 Jun 2026 16:33:33 +0000
+Subject: [PATCH] kwajd_read_headers(): initialise pointers before returning
+ any error
+
+CVE: CVE-2026-110602
+Upstream: https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f
+[thomas: drop ChangeLog, tests and backport context]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mspack/kwajd.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mspack/kwajd.c b/mspack/kwajd.c
+index 490778c..0d9a732 100644
+--- a/mspack/kwajd.c
++++ b/mspack/kwajd.c
+@@ -155,6 +155,11 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     unsigned char buf[16];
+     int i;
+ 
++
++    /* initialise pointers */
++    hdr->filename = NULL;
++    hdr->extra    = NULL;
++
+     /* read in the header */
+     if (sys->read(fh, &buf[0], kwajh_SIZEOF) != kwajh_SIZEOF) {
+         return MSPACK_ERR_READ;
+@@ -172,8 +177,6 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     hdr->data_offset  = EndGetI16(&buf[kwajh_DataOffset]);
+     hdr->headers      = EndGetI16(&buf[kwajh_Flags]);
+     hdr->length       = 0;
+-    hdr->filename     = NULL;
+-    hdr->extra        = NULL;
+     hdr->extra_length = 0;
+ 
+     /* optional headers */
+-- 
+2.53.0
+
diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
index f806192eec6..a8c37d60f11 100644
--- a/package/libmspack/libmspack.mk
+++ b/package/libmspack/libmspack.mk
@@ -15,4 +15,7 @@ LIBMSPACK_CPE_ID_VERSION = $(LIBMSPACK_VERSION_MAJOR)
 LIBMSPACK_CPE_ID_UPDATE = $(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_INSTALL_STAGING = YES
 
+# 0001-kwajd_read_headers-initialise-pointers-before-returning-any-error.patch
+LIBMSPACK_IGNORE_CVES += CVE-2026-110602
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
