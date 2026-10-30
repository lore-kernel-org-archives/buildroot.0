Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mm7mkXT7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBxTXysT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E183A40ABE;
	Fri, 30 Oct 2026 09:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZZFrTcfB-Md; Fri, 30 Oct 2026 09:15:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C62A540AA9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793351757;
	b=G+WB+7xxv9MvQ+xpk5JP7FnemmVJ8ZAhDkAy7X2iv6DO/xj9WpWXb39232Id6VYW1mnN
	 KASGHotWXaRKzm0f+SdtzrHPqkH4j9Yt/DMSaeC2n2MMfuCzFtvMTj/AwSIz4W3+5udlG
	 scfNN1rdy151LwLr1zQHFdcEIlCqcHRUhjwNJAjOkLi9k0soipcQOC2B9hZgCwU2tMLn8
	 vfSd81lOm5RUzE/QIgAoDuAKs9Uqo62bECuf4KJlwMzD2Fj2xkDMjs0XkpY3zAK4AqWYM
	 zO1xDGvoxe8UYqi+8J1vxSqxQq4tMnjfULfWh+cNRCdHsZgvr8CMpb3lS0hLbXgbPNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793351757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pfqpKuvFIhRs3N6tc9gMBCl+mlyIP7D5ZCnPT5WsDHg=;
	b=gpDN4tdr6D6SQiB7Gs7LFYc11RO4czfPAaFa2t5F07CmXfy2e1OzS2aWTK0OSFfQz9s7
	 W0CuUm0ak20H51L6SJXe0tVFkAeENKiraMTeokrHDMcEFEcHKCWdVXq8PG2m9zP8srYKn
	 O04PztLxLBsnKxqGd64U7scIEaeJ+YgA+4s5tfJwSK8RJGN1MQygGhS9To+oyNorFvexG
	 mepbmk4MQDv4mK2dQkgW107YKA86sWSbm0PK3W4ti2d7NkFlZc60VEgMO096KJ6anLGDK
	 98bE/i9+INGb7Fv+f5zLlVadyYv3vLV0mo66MAMQfrh1W8pLlGFXtXSMeCJlvgOg4pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793351757;
	bh=pfqpKuvFIhRs3N6tc9gMBCl+mlyIP7D5ZCnPT5WsDHg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mm7mkXT7SGIKXQpN5FHPO3CUBx4pp+EhXNh8XCVYr3tOcCTGIEZYbmk2SpWFE4qG/
	 7+lYSkJ3NzCAB/0qoVN3+LgS0ta2QZimPyteXlG5bLWQjIneOjhsv8PkqvdTmGZN9T
	 824e0TNi9ZLfRs7kl7+PKPQMkMSfXFijVdJtEHxzvoLn8EglMlzd5E8GKXpdFGIZsF
	 FNkAxZG3UkFXe1e6B5CdF/SVIN5oA5bhibgHoaODivztzfR2IUwQ3i+/7mJZFeHbEL
	 BAB3Xky4HCwnYuG+sl/KF8oJ4USkFf6uZzyipgCg/5VFI1vCF8JpethweJ67kQ3sBw
	 Tdutfz/oHi+BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62A540AA9;
	Fri, 30 Oct 2026 09:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A62632C7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C3CF810E3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyF3cyH0XeRF for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 09:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18502810EA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793351750;
 b=FWvR1DJTDjbSRIb1lyQLw+pwcVvJLRQgZfs+G9STk0pFDmiQqyR3prNuVGFbgKG7QKQB
 q7VCJ5DwhrnsTc2OmS+ZOfMrNL7jFh5XM2AAD5SM5DLXvkay2Efcjmw2VveABh8ltJ0GK
 ZQYq5//PamWGfpNNaxId6IPC+EfrVjlFJNspn+ofQZsEIH87qOBZdAkAxlzdsJnHSRAzG
 Ano4if4gXp5rcnQbsxVNKIB7451jyRjknK2HzHWeKNYTh13qDdbE+HXR2/ytPTV/BDrdn
 JP0egHhm0Xss9H4hTFeubk+pZ2uGK9brWrxXZlJLCrKD9tURhsHtxrG1Q9AjEDrtcxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793351750;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=RoShtaKzTX7HwMc5AwS2DiGhoReWP0B0td3eaDqJL6E=;
 b=HluwwPtHVoOsNueuU4VISQSXYtwy9RbuIJBJ5V3VX4dwI2TM7A/mxDkWMfBzee4vnEbu
 SToFSl5TAQX7ya6sJuRyWwEJL9cV3hdKWEPQaFwIWSPSPK0ycJBtkzdFJB8XtWTmbH4nF
 pL5b1nv4BwLNfrO8wnqnu4b+/7L9uAhLTcJsYxmjyToQLJWASgRvk/HzV19seC1If1RFP
 OmclVzI9QD32u0fGU9bxmJqhcYAp/4gIElXm85A1HfrQu87zE+nbc2AM3wthpJU1gUHs8
 W4XtnJc+R9qyJdiv4NtcA/Ht6wImn+DHCfDP3eiUFQOTxkrMKljkeLIQlYyfqHdVgCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=HBxTXysT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=HBxTXysT
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18502810EA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so401912f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793351748; x=1793956548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RoShtaKzTX7HwMc5AwS2DiGhoReWP0B0td3eaDqJL6E=;
 b=HBxTXysTbpMe+SL5+2U1pQqEWNrgDGfCo3amnzKmFRuCKSP/GyFKLo/1Hwkd7mRA+0
 zOuuWhB9aXlUk60gfBlYqKsVEerU7V/E+Bnb2R15PYodgaO95Q5xGvjOezJdByV0E8LS
 88ns0wo8s297oDlDgNiqncLtwi4nDvJ+0ce97KdLB6VWymYlH5sCrLSFwS/jAh0qtzhi
 6lv85v/z9OICVUSl5vVq8xZ8+mHyvZKx7cjYNRo74GXsEh+2NSI/xVkF8z/lJ71ijOGO
 oyjdzEoznCk9IjruUsYDnv68eErQCMYwBQsRP15F/qCKNDzXez17g4i1UXXEZ7DsFXfe
 IXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793351748; x=1793956548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RoShtaKzTX7HwMc5AwS2DiGhoReWP0B0td3eaDqJL6E=;
 b=C31bK7rZiC77Ww9RgCCrj/P0quwvzNuXPf5mexxtNYLu7U7SMvOMJdXAkh7K9tnh0b
 kgm18Inl3NcW8hEXPhpBqkLYdDe7rL0cR6pMTGWETi0aPcWI01fjyGZpfdFjxviRqnEN
 HKY3oj0apb7WD29ffGs8PVWHJD6to+iYsIwtTOrqjibPiHW5KNYv7bjM35ocBWzB7d8z
 pP+HCI9pRNFABRUEHExj3ZyZs/CQpGNBh+6rT68QGb7saMev+faq+ymteCNDxlDbFPcc
 iewE2PtautiWp389Fb371hMuTjThQW2A6oU9TOSTWS5Ok1frpLbrOqlbCTJBItQSZbKH
 Aj1g==
X-Gm-Message-State: AFq9FYKqQEVc+BZxqLmvCgv3xsPgDj0dj6ug+hNxSgwvGn4w4bssZF2i
 1/lxP/VKsOrrCG0mbaIviL6/dA9d2xmPBjowD+gTGguvQA2PGxjwLFMEheqFXg==
X-Gm-Gg: AYBFou1iAdZjvuTnP7CezuB8TBu+Kix33B0JtVDqukpx6o2uyycOXW0WueJRrusWG3n
 ho6zJWbZCe/g5wrw/G9qxt21FHwHVwEOq7pfsFakOpYWd2PvgyMh3UUgaLcqlM/cgyLh/Dn87T0
 UxxCGlO1Ube+RkFKpG1gC/1RTYqtp5Xtp86SXalQgK8yl8QdHLkj856vG5VtXJrj6dHqYYOgky1
 FtVv+wOBYq7ioJThIy1Bi7w85/t8Rmoaa6X5Xt27+Fo8peyG0vtcvJ9ojTmqUsBgmd7h6H1FjG9
 yvfIIHmRKBY13OtMjlKfAqqPR0Zw1oPxh/CkegpgL0pm67YpdCqMcUh6xJ4pvWC1EXGTaucgxcW
 hPC1oEjtKalk4WIJ5WuopOFw8VpJp3JlU6QNi8yuh6bdf56Zkrb0vKFTc5KLXA+ZUNulZ7RkuaO
 n48pFwiDbQ5xOXpUXMEXeTE3dNGu90vf2tvHQ6AO3f3NevWuSpf9O+wDGDxehAY3jocmTijDBba
 2iIooCSRcsX/o0btpKyVQYuX1CVa6bvDlmXMFXCXE3y4PBQghnIBx9/iO/dfHHxayrKIGnHg2t8
 wf2JHl/aBGWTBOdnWAUpz8ewo4tsQt1iXHt0gW0I8ykUQXhn2ZjWiMJb70Z9GQPewAXBG0yGh84
 =
X-Received: by 2002:a05:6000:260f:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e6e2fafd7mr4206012f8f.34.1793351747682; 
 Fri, 30 Oct 2026 02:15:47 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm2106312f8f.22.2026.10.30.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:15:46 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 10:15:35 +0100
Message-Id: <20261030091538.1773417-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/5] package/libcupsfilters: new package
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

Since version 2.0, cups-filters has been split into several projects.
libcupsfilters contains the library and the filter functions that were
part of cups-filters 1.x, which the remaining cups-filters executables
are now thin wrappers around.

Since version 2.2.0, libcupsfilters is written only in C: qpdf and
Poppler have been replaced by PDFio, and the pdftoraster filter
function runs Poppler's pdftoppm executable.

The required dependencies are cups, lcms2 and pdfio. All the other
features are optional and enabled by default by the configure script,
so they are explicitly enabled or disabled depending on the
configuration. Ghostscript, mutool and pdftoppm are only called at
runtime, through their executables, so they are not build dependencies.

BUILT_SOURCES is emptied, as it is only used to generate an input file
for the tests, by running a program built for the target, which fails
when cross-compiling.

The CPE vendor is openprinting, as shown by CVE-2024-47076 and
CVE-2025-64503.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - bump to version 2.2.1 (fixes CVE-2025-64503) and use the tar.xz
    archive
  - use pdfio instead of qpdf and Poppler, as required by 2.2.x: this
    drops the gcc >= 10 and atomic dependencies coming from qpdf
  - fix the license: Apache-2.0 with GPL-2.0/LGPL-2.0 exception
  - select cups instead of depending on it, document where each
    toolchain dependency comes from [Thomas]
  - drop freetype and glib2, not used by libcupsfilters, and the wchar
    and dynamic library dependencies coming from glib2 [Thomas]
  - make jpeg and fontconfig optional [Thomas]
  - explicitly handle all the optional features: libjxl, texttopdf,
    ghostscript and mutool [Thomas]
  - drop the cups-filters 1.x options that libcupsfilters doesn't
    support: avahi, ijs, foomatic, braille, ...
  - use the openprinting CPE vendor, as in CVE-2024-47076 [Thomas]
  - don't install the cups-browsed init script, now in the new
    cups-browsed package [Thomas]
  - empty BUILT_SOURCES, which runs a target program to generate a file
    only used by the tests
  - add a Config.in comment, update the help text and URL
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/libcupsfilters/Config.in           | 19 +++++
 package/libcupsfilters/libcupsfilters.hash |  4 +
 package/libcupsfilters/libcupsfilters.mk   | 89 ++++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index db405749d9..ee74a3768b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -238,6 +238,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libcupsfilters/
 F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
diff --git a/package/Config.in b/package/Config.in
index f38179c3c7..fee866748c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -347,6 +347,7 @@ comment "Graphic libraries"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libcupsfilters/Config.in"
 	source "package/libglvnd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
diff --git a/package/libcupsfilters/Config.in b/package/libcupsfilters/Config.in
new file mode 100644
index 0000000000..89d1d6e6bb
--- /dev/null
+++ b/package/libcupsfilters/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBCUPSFILTERS
+	bool "libcupsfilters"
+	depends on BR2_USE_MMU # cups, fork()
+	depends on BR2_INSTALL_LIBSTDCPP # cups
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cups
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_PDFIO
+	help
+	  libcupsfilters contains the code of the filters of the former
+	  cups-filters package as library functions, the so-called
+	  filter functions, as well as other printing related
+	  functions.
+
+	  https://github.com/OpenPrinting/libcupsfilters
+
+comment "libcupsfilters needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcupsfilters/libcupsfilters.hash b/package/libcupsfilters/libcupsfilters.hash
new file mode 100644
index 0000000000..6957e416e5
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860  libcupsfilters-2.2.1.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  e03a505494f245983c77a0f682fd900799f373ef738d3aa93ff32a3d61096b05  NOTICE
diff --git a/package/libcupsfilters/libcupsfilters.mk b/package/libcupsfilters/libcupsfilters.mk
new file mode 100644
index 0000000000..cd7d53cd00
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.mk
@@ -0,0 +1,89 @@
+################################################################################
+#
+# libcupsfilters
+#
+################################################################################
+
+LIBCUPSFILTERS_VERSION = 2.2.1
+LIBCUPSFILTERS_SOURCE = libcupsfilters-$(LIBCUPSFILTERS_VERSION).tar.xz
+LIBCUPSFILTERS_SITE = https://github.com/OpenPrinting/libcupsfilters/releases/download/$(LIBCUPSFILTERS_VERSION)
+LIBCUPSFILTERS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBCUPSFILTERS_LICENSE_FILES = LICENSE NOTICE
+LIBCUPSFILTERS_CPE_ID_VENDOR = openprinting
+LIBCUPSFILTERS_INSTALL_STAGING = YES
+LIBCUPSFILTERS_DEPENDENCIES = host-pkgconf cups lcms2 pdfio
+
+LIBCUPSFILTERS_CONF_OPTS = \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
+
+# BUILT_SOURCES is only used to generate a file for the tests, by
+# running a program built for the target.
+LIBCUPSFILTERS_MAKE_OPTS = BUILT_SOURCES=
+LIBCUPSFILTERS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install BUILT_SOURCES=
+LIBCUPSFILTERS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install BUILT_SOURCES=
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-jpeg
+LIBCUPSFILTERS_DEPENDENCIES += jpeg
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-png
+LIBCUPSFILTERS_DEPENDENCIES += libpng
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-tiff
+LIBCUPSFILTERS_DEPENDENCIES += tiff
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-jpegxl
+LIBCUPSFILTERS_DEPENDENCIES += libjxl
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-jpegxl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-exif
+LIBCUPSFILTERS_DEPENDENCIES += libexif
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-exif
+endif
+
+# fontconfig is only used by the texttopdf filter
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-fontconfig --enable-texttopdf
+LIBCUPSFILTERS_DEPENDENCIES += fontconfig
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-fontconfig --disable-texttopdf
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-dbus
+LIBCUPSFILTERS_DEPENDENCIES += dbus
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-dbus
+endif
+
+# Ghostscript and mutool are only used at runtime, through their
+# executables, as is Poppler's pdftoppm, always enabled.
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-ghostscript
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_MUPDF),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-mutool
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-mutool
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
