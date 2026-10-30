Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8A606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UTfUPbe+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=of1meXtJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22658606B0;
	Fri, 30 Oct 2026 09:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDSQITcghUgU; Fri, 30 Oct 2026 09:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B8946062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793351754;
	b=YSYgXRW/kseS4fvyJDbZDLk4rgoNDT7dJ1fScOOY2oQxFABlFnK4H0n1xuFLcXjNwcQ8
	 WmW6AF9Q+WhBgt8lwFzqdGX7NohUCAfaapGC41zOmWTXHBLB1Ii/iRE6GLoJ8A9Zi44PV
	 rSV8Dv4Ux7zuheMQBEUl4W0I6QvvhoXFXbtlMCohoWX2aX0EPkM3pT8kvGQYgnspLYaAc
	 aes00it5hp6rxXe9vGNTEQoozRB7D9BOmCIOAatmHUSZAg5tLlTFHxAk48Oz/N4V7SR0K
	 +5aQ+YT4V5QAFzFbIqbCKmkQzFff/0aCfa4VCKz/+KFwp26wOMu3hbD52zp9kiTOkiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793351754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=U2hgK4R02x73GPjq7S0vhYjGCnaT+Jh+osRYbMo5MsQ=;
	b=OtkBEBpI/L3eMENfiV8elcwupiEz7rFleocOhlEtCdl6ToxNHrZb6CWUhPvxlFD1pA5i
	 8rcsJj8RjWIEbU3llLg0ektWPZdb3+xd4+BEPS2e/xV5d/50eYSTEBQvJx8ANsSj61A8F
	 vp5j/eyUGyyCx/TmKZefCsAyi/4ARxksV2w2et15msY2qD7kM/EiQLecG9JkZWvLsTbHL
	 yltMSWfzm3xOFsTeNd5AdzvnEIPeVmCCWZWeShYU4zXgyj1QHRRT5VJwwJbNENG2929/w
	 V5cygQjfrKMmi0RLe5Tkk3ZkOhS7wt2lAz3D/Vq1QMXEJfZVcJuYH2OBtzIKEW2Wf8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793351754;
	bh=U2hgK4R02x73GPjq7S0vhYjGCnaT+Jh+osRYbMo5MsQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTfUPbe+ciC1zPB1cwpRyioyei2jmPcQ37lIHfCHxgr4AGc1UC/c5M32WV8u7D/MP
	 j/nOrIwUyDIq5FqLSKf4PUREEdDCYzKpCEfbnbkvZL7g9ffOJk+rdyh6ayivmWH9Ih
	 VCK19TdLbCxokT9qAtX6QQYcK5szav4egxFVm/PfLFyaytO6T9vHQBOkts63TWMWab
	 f6Uc8wPJYRnDGYKJfz5F4tlmQGdtdm+76ex4XCqofZDrfemYNV8pQBB3DxcaDup9po
	 +J+2W0w0Vo/vI/025Hg+R1KcQQLwCgmJRY+8n8REVATqZ742kaupsdfcUyo9JMuwxU
	 Mw/SScVkTrmuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8946062C;
	Fri, 30 Oct 2026 09:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5A1529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A14F0810EA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rt5d4MrCxISQ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B985810E3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793351748;
 b=VSOxkjZUYy50NaD/WikjQu2w+Jiv0MRE2V9yXv4QDNOUYv3F8DrshsVuU4M58DQYyi2a
 iT5WeablWQQoz9GTgwbhn4xhFmwIxYAUF9K1jrhAzLm0PthQhHnxgNmjRXL8NKZJp9Ilw
 rjBQzdNZD5xRiFDbb2Zus8T+XKJqHkFMX9DVmTA/5SY0Ura/9BlMmgR3VGZPMZVqN29zq
 sV7BU+aZ8YtGAGfNWV/3WuVwq4euWRzyj9VwysDbgKSUG2k2Uh1jrJPNZyPs5YY+/HOOi
 b4LSh/8AurZlOV8thPx3phLISPGIiqRdMlUMl5rC2FbUXl7MZttXaXYXxg8CAvPF9Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793351748;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YA3HCUuyednwx6HtAlZw3tU1nWKlJRmcinlYyE+aNis=;
 b=ZJGThqx20ykH7FxwSiNIDZR+igBSbCuU7fbNlroj5E4TB5D9B0qPAtHzPVgS3mwxI+Wd
 B3eZ+2cNHOKp98vfKzm7nhmlToN7YaBLQ8gToS+68frd/b/cWnsfJjjOw7cZNmkJT2Y1P
 0nzUz3qCldDZybMzWvz1UQUD3myOVGil4RxEzqlgW4Ih1kTA6pVaAM5V6Jd6Ezcudg1ih
 adL8YTYf6PTLmosPRgxoOaOUU1gjnHKYpvnncacf66l1nv7zjFewqQb90uj5XJ1p9xkKR
 SaTmVfTXIjeytP88N48cThnICfGE2SpIqucCIwPZmi7AJ0Zx5NWY3qMam0g0cJ0qtZw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=of1meXtJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=of1meXtJ
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B985810E3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so217715f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793351746; x=1793956546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YA3HCUuyednwx6HtAlZw3tU1nWKlJRmcinlYyE+aNis=;
 b=of1meXtJZKHfZ3ZmVCl66eYawzmoafgmNY06Bwg0nvuPrK24ofBWfN3vl55iX4YtQu
 BzqK0LSd0ewoGOn2j5o8AttPilylxd85aunFNVyveqe/AdJSeKR2rEoWKDWhWz6bQPJ8
 UNtJuQaFVkmTBYGAvEHjziNxhuqyCrz6UN4bRN0mTSnz7+TvRvCH7qxeIEV77yFjYSCP
 QhUbzopuULXs15MdLyVLUMY160PsMh0Zn/23aNux+FmnGi0EN5DQ448g6ShRvUWBx2nD
 m/4yIkSPKIumpjOyEk+iX5ElLZVA8sgLb7ffQ8ek3sJyWbaz/GneqQxPmh1AVDkq4nfV
 qnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793351746; x=1793956546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YA3HCUuyednwx6HtAlZw3tU1nWKlJRmcinlYyE+aNis=;
 b=dbqaYHqLzA1MR7jPmTRTCYEsl/9zQOTpyyLMgWDDUd2fOvfqLCzmEyhOi062xLZJnu
 RqLMGsm/qBHL9YGGoBWNfhGptBbY6le90FrxJ4fbdy0ycNMyz+bSuIM0v8rr4vQJvEuZ
 96xegNeNCD6a+6QCD5RI8mhX8/43SfxZZV9egnkoAZXWt+IT6uaOVHjsFAEeQRIxdC7C
 SAzPcItZAnkOtSa/IfNKp6bHYYpmsk6jUUGhFTdxhmgc8obvHvbj7QNtRMXdRyGWN8ui
 cx9v+XgVz61/A1SkrS+3gzTaRpW78JPjBoK2+XSpo1HLSCKss+/I1kub+tzIWLLu2x8O
 c2Pw==
X-Gm-Message-State: AFq9FYLTLh9XJbSYjaaSG6yp96wvyDE1Uw666oiM5TBUO4K+Vsa3y7yT
 niF/kwRYSInGw9nFdg4VnRpu8Y6zewv/4t7ysKpj9Y3R3sMkJPdiPyl2vve4PA==
X-Gm-Gg: AYBFou3+idPErbQmn9fOybw3CsdQAXz5LUJbchuriftIxYMa62cMY7jlWQcneu8H3fv
 Z42sc7MLWuGwXj3PsFKuLTon8rl/l2t3mVc13NRWyGPcgwUAbYDPQbKanEFEXuDe3hO2UXwFj1c
 tlCOPJdYNNj0gEz3SnW9PgEAF2agSKEI5NhHHDfKgwUrjcf9t7PDimE2G1qEwUvjZVqOsFYuhg2
 AXONPnUKpv/eZfzZs3SY2KGvGdEikz+keQILHbd2UcOdvkhCHFK0CQ4qwUGBExj8boF9mVEw1rr
 LTS4KpXayFB6U1+df+/RDqLprKDVPpwUcyHeMQbu8yxh7kGRRvwir8QY/gP4gTSADHwpunWEKLd
 9GxJIaRq+XHx/Iq8IQ0sHwWJbBA+poj/RiXzGamApQdMYJy4R7mWrn4rKhrB6yA3Ee8hhNHGAvA
 Oe7LhEgZxotf8P53fw/nA2TtpfIO/ajvkGbXcLWuKWwvxhbr1TOmyqPXHPLqCJDK+3EwxcFZl5M
 DgQsJYxZOaOmGU6whSD1+RPgwxEPh/qNKaaJ/9pIkeQOr6xszqXA+u4XDWccT899NaCbNRpS9uQ
 0PD0cDOErZCi7wfB2VZ5IeuZyNeE3dXBvozp8abSalNElGoOWsdAow==
X-Received: by 2002:a05:6000:4210:b0:48d:f984:4a7f with SMTP id
 ffacd0b85a97d-48e6e2f7356mr4489884f8f.24.1793351746173; 
 Fri, 30 Oct 2026 02:15:46 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm2106312f8f.22.2026.10.30.02.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:15:45 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 10:15:34 +0100
Message-Id: <20261030091538.1773417-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/5] package/pdfio: new package
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PDFio is a simple C library for reading and writing PDF files, needed
by libcupsfilters since version 2.2.0, where it replaces qpdf and
Poppler.

zlib is mandatory, libpng is optional.

The CPE vendor is msweet, as in the NVD CPE dictionary.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch: needed by libcupsfilters 2.2.x
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/pdfio/Config.in  |  8 ++++++++
 package/pdfio/pdfio.hash |  4 ++++
 package/pdfio/pdfio.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/pdfio/Config.in
 create mode 100644 package/pdfio/pdfio.hash
 create mode 100644 package/pdfio/pdfio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..db405749d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -245,6 +245,7 @@ F:	package/mono/
 F:	package/mono-gtksharp3/
 F:	package/monolite/
 F:	package/openjpeg/
+F:	package/pdfio/
 F:	package/python-can/
 F:	package/python-minimalmodbus/
 F:	package/python-pillow/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..f38179c3c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1830,6 +1830,7 @@ menu "Graphics"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
 	source "package/pangomm2_46/Config.in"
+	source "package/pdfio/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pdfio/Config.in b/package/pdfio/Config.in
new file mode 100644
index 0000000000..ab59fe1b08
--- /dev/null
+++ b/package/pdfio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PDFIO
+	bool "pdfio"
+	select BR2_PACKAGE_ZLIB
+	help
+	  PDFio is a simple C library for reading and writing PDF
+	  files.
+
+	  https://www.msweet.org/pdfio
diff --git a/package/pdfio/pdfio.hash b/package/pdfio/pdfio.hash
new file mode 100644
index 0000000000..3a8942568e
--- /dev/null
+++ b/package/pdfio/pdfio.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  be9790ff2e9f0b7052fca8e96f2fdb6ebac903910e7ed8e2d1de4b1e55a40a23  pdfio-1.6.6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  7f08e9e1433efb261a0828e73ef59cb5950e8d5ff7d325ca5f7d81cc1d610ba4  NOTICE
diff --git a/package/pdfio/pdfio.mk b/package/pdfio/pdfio.mk
new file mode 100644
index 0000000000..416834b86c
--- /dev/null
+++ b/package/pdfio/pdfio.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# pdfio
+#
+################################################################################
+
+PDFIO_VERSION = 1.6.6
+PDFIO_SITE = https://github.com/michaelrsweet/pdfio/releases/download/v$(PDFIO_VERSION)
+PDFIO_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+PDFIO_LICENSE_FILES = LICENSE NOTICE
+PDFIO_CPE_ID_VENDOR = msweet
+PDFIO_INSTALL_STAGING = YES
+PDFIO_DEPENDENCIES = host-pkgconf zlib
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+PDFIO_CONF_OPTS += --enable-libpng
+PDFIO_DEPENDENCIES += libpng
+else
+PDFIO_CONF_OPTS += --disable-libpng
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
