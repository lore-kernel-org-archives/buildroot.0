Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D383606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lHlCw8mz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6DD80FA1;
	Tue, 27 Oct 2026 16:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxH3OdAhn0M1; Tue, 27 Oct 2026 16:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 046EB80F91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117167;
	b=rtTe0AIDzv/qfSJuxbQqfU68E0maxPgRvFb057A1Y//T0z+4EbjDdJQm9J8uCU4Y6OaZ
	 CxyAPtmZYB5FnBCoZxplK/2by59ra/a4tUSsbYVOd1JkiABUtqGTlpOwbsT1kGuzuUD5/
	 IQDWFrax3A+pNwTUY6AtdZiFyrXN4kBfcYzdW9vxF89ubhzryDgJgEy2n0hMsPO3NmcfV
	 5Mam4V67mEf8SzlUqf9PCbGGyiBtNW66l9EwUGPOxbFd7cPNlM45jhhgNzNu7xqml32x8
	 h9WHp+8RDyGsAQnv0zrOsOWe+TIRKDObqIJpc+PdRA0o5ywQAuP12pdoboKyicJ2iew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fy0SvqmmcMZXLichjOm4ZNSW83RIKTrhiJMJNGjW7lw=;
	b=a+7jqvARgJPzGG8/dLj+6ph20O0c9mT5CuR4HGSozxpuBEoVvJZbCdGCNKvg3udePB2P
	 K8cNeDGjvPkexc+YK4SbnMP2sUiQTfNX6F+OL5360xY26ju+ZXTzqPEaG+uoUui9huDSQ
	 wWc6H0LyBfGvuFTHfJFbLNXhjGrC8BDyIUfTUJBtw4rB+hT5fehRx2OmhswI/MH8P61Dc
	 g/JTpWUhO1hBcm35oYL49ml8CarThV/TG5vZRNhT/m7L1sszj5erb/nbzQnhuTy2jtv/f
	 kz5KgbOBt+XvRb44i/Ks0BY5b6GatgKWxNIbgwxUp+totSVDuw5FwADK94Jb3QfESoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117167;
	bh=Fy0SvqmmcMZXLichjOm4ZNSW83RIKTrhiJMJNGjW7lw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lHlCw8mzwYEbnHVTnR2g048JdHQftm05YY/LO5Kml+HXE9aC3tDRc/Ur0Z/QeCAzl
	 6ZqrNC4p/2otvZ6QiT47recG0SKdDLQBL19PHbRL4c4aEUcvA8N1CmlZYsQW4IeAmn
	 T01dihFQrhjm+TFVNjStezloliHqLBCS/qBK9hUE63hH0FJMaEF4qusgtUJjEx+4Ad
	 PEdODzVY2/XvfI0vyU7pfM3we+Lj0DzlCirHku9oIzkXv7tENWf4whYMtm1ugN1m1O
	 JVlrsGsEclDo+jHuMF/UUWEye3Fa5vraDoHhcskmjF1CVu6HCtNapnMjWDSjOjlLCA
	 besQAl9PcAahQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 046EB80F91;
	Tue, 27 Oct 2026 16:06:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB04D279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC906407E5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuTTCxnvsXHA for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 20CBF404D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117165;
 b=RUeH9b78/SpEtcLTjAN5LWHmOoa4XJC/7fL8BdC0rdNjfjfm7eLu2tON7aH9kVTMT4tD
 IrTcFL3dIap4tsooOyuJWAKsgT9dx5DGqEthgcYHQdp48gVbi73Rhp/omJseT1/Xgs+cW
 IUKFiXozCgUMtxrhPx9XayPGFg22i7Q1HgTe97+d1gmbp3x7u1BiA0ck04fBkRcwSAbiF
 IeakrtAQB084NjJBvTUJfpEwQiQ7yxFHuucNioUdKCya16rduM/AMv31Eg9iqg7Ww4ljC
 zGxnMvTIyVtJ+zM50YV00ovsPgfjsv/+VZrtiHFMJt8c5YMkha1BNThe7GQMMf7kDqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HEb8DBi79G9E0EwdAw3KrI9JOwz0vOZlIMVFCMTNr+g=;
 b=il7Rv4i0lbHIZGBrMbNifiiPFVTUvLwfLEF081+cTb9R39ZewwY2GAwZub+VprmE9ZfF
 BwzM7LhVoUkqgHhHe7Fv5wgQj8g2yQXpwD8u1lWWTVXFGeljImBGJVBeC+fNmA95W0gUj
 rcTaDS7KfJUjSk1L87ouZv6WQk1N48SdmxrxiehVmfq3+RbZHxEvAsi8Jiqpz+AglwII3
 XoGvIF4xPi0hx+3iarJAZHxbH3aC9k8t7fPPlZVnKMgcKfpFWM2UIqnlut4Mr9UPDXltg
 dnYVHMlRvM0zpaxxGQwdLwsm0vzlz87JeDXgZ3j6yeMwZMs9JbgJ3j6y7eTFwHvo3/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20CBF404D0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94BA19D0B2; Tue, 27 Oct 2026 16:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:05:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99c3aee78f537afa3ccf5820c68857b2c10e9351
X-Git-Newrev: 40a535a386aa3caef0e4f7da4c1f11619b912b5b
X-Patchwork-Hint: ignore
Message-Id: <20261027160438.94BA19D0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix build failure using
 gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40a535a386aa3caef0e4f7da4c1f11619b912b5b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8188eu/rtl8188eu.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..cc4651ed3b 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -8,7 +8,12 @@ RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+RTL8188EU_EXTRA_CFLAGS = -Wno-error
+
+RTL8188EU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8188EU=m \
+	USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
 
 define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
