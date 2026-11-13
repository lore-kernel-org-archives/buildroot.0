Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40517606A323
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dPiJtlCQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F76260665;
	Fri, 13 Nov 2026 14:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FASqh_DGte7r; Fri, 13 Nov 2026 14:54:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05CCD606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581667;
	b=etD+v36m2pg79n5ajyZyZeP0fiYucGlMOmkX1y7wI6BcfECy2F3trhwKUGHutlujApaQ
	 EumVm8XnLmrFnR0an4J2dw0k4/qB5I3+nqCY5fSBTT/91DtdwUueaYireKIVSmzl2WMZc
	 87phZ1AbO4i3PixSHEH693kuHHUs/RzTIPJ5AfRY6R0R4BLlg6y4vkXHpvA+FqxUP/HOR
	 +vRK2SVAvO1QRE+L9PibryoOGdtAoLjx0w08eL14Qbef2oQXDM62U5Q2c7GIUvRBhH4Y5
	 kcHS/RaNzHALprI3RGtdkw7d1AIMZHFcPpOd2gHUJ0IDFmLl3ke4EJ4DR97LCa6DAcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=En8rOIQwF0KPIweNOnumm1xthW7US8Q8wL/UxMhNeik=;
	b=BX1K0pRATLIg04tqS8ne9W9LbDROUZK7yeDgGJ0YlBnbAhCGuj7HeUg0O7DDPJbCvYMG
	 2BUeBZ6dqGO8pfDsP9xAuuILea6pOxplhFMbGxm4UGk6tCQujkI+hJ/v8OHBUQ23tpfGZ
	 ZHcKKclUv7BzpWlIsb0l6FGZy5w3msnR+C9fvYvrdwM+uhRPU75UUKSO3BpGkSybKGhMA
	 auSg/t0e7wfht5d/JNZgAtyesFcU37owI33CEi7YUyt/70XyCJfrnU8Nvl8BKTcggMcdm
	 Z3XgMny5s3P2L0cSipYIl4QZKLLgd7zutHPs5N/rvqrb2Iw/1Ma715wCF3XJkf/lRGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581667;
	bh=En8rOIQwF0KPIweNOnumm1xthW7US8Q8wL/UxMhNeik=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPiJtlCQw0DmL8KDbi67XuXkm2vFjM7DyDzfSbILJlPU+Beuzfs223ay58V8pBV7K
	 5h+shWe9uMc0UVPxv/R4hiLAyxiHE2vbr6u89GMXiHQY2lDdFd2+tOtc44f6IR/5In
	 GNMDgQwOEJE7XO4NXxKLhwMKYVyEREvi+9qgVzho51HuOciBT5tx2Ci2yomvDjhTZb
	 jE1EjW9lDJgquAPUg3lv/9LYNAuPYFeYuycGYfM4YEPtzqDMKALrgP7s/DQerZc+D1
	 JitIpeZ8q/DAJ3rfVd8PosrjJyd+wvo7EDYhdtuT2+HM4sti7eBvTqJLq0O9BnbDnq
	 Loh96RKn6HA2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CCD606A3;
	Fri, 13 Nov 2026 14:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F311B28C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4F93813CE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rttcqKqMnppC for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 248C1814BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=77.87.242.242
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp1.osuosl.org (Postfix) with ESMTP id 248C1814BF
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:24 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [193.179.247.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id CE49E1800A2;
 Fri, 13 Nov 2026 15:52:23 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>
Date: Fri, 13 Nov 2026 15:51:56 +0100
Message-ID: <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
References: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/5] package/hidapi: allow building without
 udev
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
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_SOFTFAIL,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series allows to use hidapi (libhidapi-libusb) on systems without
udev, by making the hidraw backend optional.

To do so, the package is converted to cmake, which allows to select the
backends to build. Before that, the bogus libgudev dependency is
replaced by the udev one, as hidapi only uses libudev; libmanette, which
relied on hidapi to get libgudev, now selects it directly.

Existing configurations keep building the same hidapi libraries: the
hidraw backend is enabled by default when udev is available.
libmanette, the only in-tree user that requires hidapi-hidraw, now
selects it.

The last patch adds me to DEVELOPERS for hidapi, as we use it in
production on systems without udev and I'm happy to look after it.
Feel free to drop it if not wanted.

Changes v1 -> v2:
 - rebased on top of commit 74def2cdd4 ("package/hidapi: propagate
   dependencies of libgudev")
 - split into four patches (libmanette: select libgudev, libgudev ->
   udev, cmake conversion, optional hidraw backend)
 - libmanette: select BR2_PACKAGE_HIDAPI_HIDRAW, as it only looks up
   hidapi-hidraw.pc
 - new patch: libmanette selects libgudev, which it used to get
   through hidapi
 - new patch: add myself to DEVELOPERS for hidapi
 - drop HIDAPI_SUPPORTS_IN_SOURCE_BUILD = NO, not needed
 - Config.in: use the usual "needs udev /dev management" comment,
   simplify the default of the hidraw option

Tested with utils/test-pkg (default toolchain set):
 - BR2_PACKAGE_HIDAPI=y (no udev): all OK, armv7m-uclibc skipped
   (no NPTL)
 - with eudev and the hidraw backend: OK, except bootlin-armv5-uclibc,
   which fails because wcsdup() is not declared by that toolchain's
   uClibc-ng headers; the same failure happens on master without this
   series (fixed in Buildroot's own uClibc by
   package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch)
 - BR2_PACKAGE_LIBSIGROK=y and BR2_PACKAGE_AVRDUDE=y with hidapi, no
   udev, on bootlin-armv7-glibc: OK (both use hidapi-libusb)

Tomas Mudrunka (5):
  package/libmanette: select libgudev
  package/hidapi: depend on udev instead of libgudev
  package/hidapi: convert to cmake-package
  package/hidapi: make the hidraw backend optional
  DEVELOPERS: add Tomas Mudrunka for hidapi

 DEVELOPERS                       |  3 +++
 package/hidapi/Config.in         | 26 +++++++++++++++++++-------
 package/hidapi/hidapi.mk         | 19 ++++++++++++++-----
 package/libmanette/Config.in     |  4 +++-
 package/libmanette/libmanette.mk |  9 ++-------
 5 files changed, 41 insertions(+), 20 deletions(-)

-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
