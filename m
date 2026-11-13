Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BFD606A327
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jUFVoi9c
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D4BE607F7;
	Fri, 13 Nov 2026 14:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXMDHznE7Off; Fri, 13 Nov 2026 14:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34918606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581681;
	b=C0ks+jCtHfa9Sr56GQ+ogl0ZItC4KoZ8X89cIqa4fZiy9OSUodCjPJorSEwQiDBT2JgE
	 auMytYI0FJ919jmKuB29LczYZOcB63cyxN9xx/95chvVGemx8WU14hCK7hH1I0xKovLj9
	 icgEbCZ8FJ7EulI5Fq7GHTjbPVp3rB3cw9EONK0qVNgvfuDrs0j2sP3fAZW1s1edbpQDk
	 cHh4H9JXr/xpjAacrqUj89wq2zxaUVmo0wu1KOkCFdRh01MagRoh51538pMk96Z/yfESf
	 pPi5JuDpWFDT02qu/xyzkQs24/6icLXvcWn2Ux8RC8RvTnocJNpf7+nZ0L5mt6KcUUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=k+zLrZJBjKqceEovr2zV+aqKJfHI0mI/wCYpb6+iZZ8=;
	b=POZPEb+iGu9ST6PJNQzW0FW0pTebODGGtuqLe1undzYpOd1ObAqo3Wm8M2pdIchWZ+Vf
	 O+bL1DMNtdquoj4FH8kCP6MTj2lrpU9kpiVz+Hzgysz4MmGtFWthohMMprWK7xP9s3Wm4
	 3sBHk1BqaF6AYIIureZ/htE5Mc4PVBlSKpeZtX2famr9MxphhdxsLongsFIYA0Px7Ebeb
	 drCr/2zwpn+GYxNJfBC6zFYgNNMZbJS2p05DjxIDnbW9jx7BdsdkyujOwOeI76j5yOyBi
	 +B2jPgNNwTfDzM30wzWJrTSzXYnnxABGn+26mxdifr8Tf7mHhUW0ls3jAsCmqfqvcIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581681;
	bh=k+zLrZJBjKqceEovr2zV+aqKJfHI0mI/wCYpb6+iZZ8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUFVoi9cImLDpcxrR34IeNz1Z0GyJcT2RuR1TcxkvbaYAYuTK5/eIw+YrGGwIGy4H
	 IfaZ5Z9VMWfYe9TqARUiDXZGIBcdm0mP9+QXgMyL+6ksKNrLe4GRkLk7xEwOUc80eK
	 9Ya3cAMAn7QAVVxj54qebKpDFTJnlnMXjmJjT9fs4hMbqwgqApXmyqqQ9L0Geq08wF
	 fWqnCXP/tiRQDabJJY7RV1sCS5Ek5lNtRBMNB6cCza29HmzKw5zf74s97YrODB8A0U
	 Yw8saJzS/8qVuVHEFkZrtcytpCrXyM2wgBcFqF+6/CCJJ0ElETmjpVOMQeR7IDJTIa
	 XZa3dGrkRC7Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34918606A3;
	Fri, 13 Nov 2026 14:54:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73F5C28C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A3B840116
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-6kAJkOuTFZ for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42F904009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=77.87.242.242
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F904009F
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:38 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [193.179.247.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id 4401718403C;
 Fri, 13 Nov 2026 15:52:28 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>
Date: Fri, 13 Nov 2026 15:51:59 +0100
Message-ID: <20261113145201.2357363-4-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
References: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
 <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/5] package/hidapi: convert to cmake-package
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream considers the autotools build system deprecated and going to
be obsolete, and recommends using CMake instead (see BUILD.autotools.md
and BUILD.md). The CMake build system also allows to select which
backends are built (see the HIDAPI_WITH_* options), and avoids the
need to autoreconf the package.

Both backends (hidraw and libusb) are still built, so the installed
shared libraries (with the same libhidapi-*.so.0 SONAME), headers and
pkg-config files are unchanged; the .pc files are generated from the
same pc/*.pc.in templates.

The LIBS="-liconv" workaround is no longer needed: the libusb backend
uses find_package(Iconv) and links against libiconv when the C library
does not provide iconv.

As usual with cmake-package, only shared libraries are built when
BR2_SHARED_STATIC_LIBS=y, while the autotools build also installed the
static ones. No in-tree package links statically against hidapi in
that configuration.

The hidtest program and unit tests default to ON only for Debug
builds; disable them explicitly so they are never built.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 package/hidapi/hidapi.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 7e202f0eb5..5f0c482a95 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -7,16 +7,19 @@
 HIDAPI_VERSION = 0.15.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
-# No configure provided, so we need to autoreconf.
-HIDAPI_AUTORECONF = YES
 HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
 HIDAPI_DEPENDENCIES = libusb udev
 
+HIDAPI_CONF_OPTS = \
+	-DHIDAPI_WITH_HIDRAW=ON \
+	-DHIDAPI_WITH_LIBUSB=ON \
+	-DHIDAPI_WITH_TESTS=OFF \
+	-DHIDAPI_BUILD_HIDTEST=OFF
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 HIDAPI_DEPENDENCIES += libiconv
-HIDAPI_CONF_ENV += LIBS="-liconv"
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
