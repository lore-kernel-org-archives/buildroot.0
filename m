Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fol2r4fU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VwZ8o8md
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29BB60608;
	Sun, 25 Oct 2026 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKJwyzK5I4R4; Sun, 25 Oct 2026 17:27:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8747060600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949223;
	b=d92uZXfQW5KIBz1jUBdknUUxEXyE8JD40s9XGnBn8f4/PxHsgGL/AwnfLprfAxsvhcFu
	 dYox3vJWlAea8RJJggEZE5L3npt6IR1/kw73UaFr9jDFdVPQVAp3dFOYhYl6pghFN4DLs
	 1806wI8suFNqghCIAjO2/3c3mWrXdf9coonmUxYNNagTjiUl9c56sSszrF4KZxQ7JZczF
	 Ny76EZI01J5POW9Fe8Q6PaLuDVEku67dOD5+NUq2QwpP4WTAKAYeBd20/ApJAjB0Fkioq
	 xB3XKuAuK/LF6JbLhaKnSyqHm3iZGH9llCN/cfjYmgiXOuSJ8mttI1frNqgwypbMi3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=06WHCidd/QItse/VAce569wZ7jHARqgptnKrqqSgHY0=;
	b=n5y56lpeC/6ALuj7hYrIEZSiNGmgLWr7tiIBjPpY4m7Q+mehzbPpOdBapFDdPB7rvi9E
	 Zfire3kw3rYdkAj6Oje9lQ61J2l0BEMwNvfl9Ogh6jFZtkhVnZRGvKeiHGLomNDn054ij
	 6QucP8ffb9zXRtCgQsTLWk8EA306dh4+JKwotgx9ibTO3XdDTGuJVS71mCUG4IcubUvd6
	 RidyZGrW3u4cZtGThJV/gk+XA7fljTSaHqbLqr6OhkwRn6y+h5gFcT5DucFEpVQ5UyK+D
	 u6rP0TkP34TWEXds1FhWls2A7KbHNMkcBp6RXMWp6VN40aUETBBekqGFMF1tmSRz0hw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949223;
	bh=06WHCidd/QItse/VAce569wZ7jHARqgptnKrqqSgHY0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fol2r4fU+/+TbvgM/8sBfYRz9ijelxK4hz5DKX6zuPkLqS9JCkpNNk9YpEtV/B4ae
	 tCsSHlruPuE7NZflDrregVWleib+xf2hVFKX06k4hCSQExmcsFTeFuZoww2nDbBwEE
	 ivLag3QbVOz7OezgxW/4DbbEyRl9iUIzYBdio9KVWsnoxD+jMsUTrd+OgEaCRQLE5D
	 0v8cnn4K/CTz+wfgbyT1ATI+cAASrNzhCgJAL2mDbasoecyzDE6VitTwuSUPdNlqcn
	 5MaIknZjMu3eXD+8aqmNSigdbGO/unjvTVEBbXwMR+8T80AjN/5YZWn9gaf/fBSTmR
	 FFcKriWm+8t3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8747060600;
	Sun, 25 Oct 2026 17:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EACA79F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C55680D97
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFiV_J-qrEYl for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9448480D96
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949221;
 b=UXSfbCoaFpCpfpQpOK1Un4f/KsC888b5OGH6ZcM9CdJ32tdIoefLvtK2SKrGYwlcI8lo
 x8OlyVJacH8U7vEFdqoPnN/XYPhaZpVAGYQVNZKWp05HUq7Z62JRfHUrLPLijylfx4klh
 se6bDe99LAnxFkbmw7igdAQUlThoX9lLQ/GEveqQPg0RDnpFrrd5T78d4oX46btSyWhxD
 0OaAEu9O1J69p/2WqiPjvuv6AJlkvNm/f0bPLNNr6mI/tOpffCcGP9Qb6PRHRxuY4j8EE
 NFmYHgeSA3JFSV4xKFH3pcxmDwEGO3XodwNziVOImz1VqU3vyDB53q24wi95nnJ85zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949221;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/ewb9K/LFTwmsJB7n1H5x3kmfu0EWwF8TORftUIuFwQ=;
 b=Ry5aSJ/G46sEeECKUJTbw2gxPvEO2ZwUzujLJ0umLPuIICHvBQP7bbNgT+/jWebdiVvO
 kh8JiIUMG/cxSMmGBLvuzl8EOiQSPJdnH9hFJIFnUeWF5W1a8yraspgjBIMjbtGnFTfP4
 Q5fxTogPoTxxJjkuLBcBnM/AX70+NJXhA60HA0bL+vzhpw39ghbhuA7QywVpPOcErhyUl
 11WiaxnjOAoxh9BBPEYIh10MD1tbQc0TvxP59MV7ZOmp+BkXIpUWzav0yeoBZY9NrUrGy
 mfDVG/bUD3NRvR2gS6Z35xfhTPSmamF7Yr3ze06emXrqDyXiFgHj/qJHTh/d+uoDmng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VwZ8o8md; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VwZ8o8md
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9448480D96
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792949216;
 bh=/ewb9K/LFTwmsJB7n1H5x3kmfu0EWwF8TORftUIuFwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VwZ8o8mdSMrdGr1OgdHEEjcPrzS6Uu7kfNCJYoIDp3hh0SJoeR7kUyd3ckocrkhXX
 oM5u6ZJUA8mmRB3pJEIaO6btcNuSIuVlhCl6LqwsJLIvg6xb0Vydkbb3LSYDr9LQ9S
 knP9c97nuIQdcAr3i4I5BVf1TyhFA5K7d5Ao43tiF8xn1yxim2JNlOVIseL4xg//RB
 Pu3AkH/YQyYUGKaaiSdJHhZyHQUC0SUqn5fWMDps1SdxVBJ1vMHnEqipQ7P4M2QIO/
 W9owLbcp88UUaQu2xCyV4Th6XFZQDhyDKPjuNp00WRf15leoy8kUEVVGa1QEfZ0xEu
 +L+uXUZmprwqw==
X-KAS-Sym: v3:f51bdf72230551df:qLhY+/BinJ16ilpvUpazdvogT7qFXGlcPSIDG40r6K1AF
 GdE9ixYw+o6sSjHjdmxBhVPGal8sF8f0GyeYelQFlhWdh4DrsDZKlxSqjxQ4UROEkRypUKVZoy4
 EmgzQcTODe1C/dGeq53NvcTXcwp6Y9jPTxzXN618CIuZ2J1FvHLSGtUIlrSMZTL1DMnM8sdwNmH
 fylkUdghMB04dkbRSCrh4javpp5GT+ytXo5w+MewCSv6YpA1Tx8soTUaqKAXNSzo+ZsDw0CQv2v
 EG3g8HRzuHjhzTLdVffw9pI/hZ8kSipYrIybU1H/MAZwtTjS76RGsrwQoTSe/uwlemEDTq+Q==:
 xlYCPxapUXFPJwCBkSqaIeVHv3NLl06fbvHMpoRjfMknBWtgy1EK9ucJ5UnJGw8BAIWofPp/II4
 51HmpHfPVyMSPfCRLAR9DPqyeKOlC8wT1NHjsKMYg8hXhPF5aITR9HBF1ZIl/n0ipvI/o34q2uf
 oW7uPrWbb+cAuus77RkWkD8qR8hoV8/V9UvF2x2F2ZI45H4Q6cMtdLFSPwnC3nTqBbxFr4Halyk
 SoB+9/GH+KRn4Zd81lPZrQU3D0Y3xGnbdBRR/al7fO8d78DERf7asQZNTy9NKG7tWZLEZlVI3dk
 KsgSIIpawu9gUwWa85iF6uzT0INE6JYaf0rffLqAkVjgeL+Usb5XYh68bVNVedPEZfr/vAgr55B
 izzuX+s8u+hjd+eUJhGvbVDKaEQojmTgqB7SX6ZbzxzcbFAYelWKhoVhrc2yAiBxUrWBmaj6eoS
 M9YcOQ1Et5WLZo6Tcl9Efx7PayZasLrFL7l9fpvwXL6p5jMKewRc0aR94GCFhy7MzCVm+IoPDJD
 BVMavtMg58/zFHnC15fYouhp3omwzfwpDvmQvSB1+hstQ/4OSaSs12w0XJWNTeVEUh2IdgY855p
 x2SuMWfNCZnXNO0yE5MAhvZs3Tl8tKs5UTFYe64f11u0
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C969CA4C69B3;
 Sun, 25 Oct 2026 18:26:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39910)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL1zk-000000002lt-2lvk;
 Sun, 25 Oct 2026 17:26:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 25 Oct 2026 18:26:56 +0100
Message-ID: <20261025172656.2241739-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: fix build on i686
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

The patch set used to bump openvmtools from 11.3.5 to 13.1.0 contained a
patch which is not needed anymore due to upstream fix
https://github.com/vmware/open-vm-tools/commit/36eea633611e678f3ea17a913c0990f319135c48
available since version 12.1.0.

The patch causes build errors on i686:

hgfsUtil.c: In function 'HgfsConvertFromNtTimeNsec':
hgfsUtil.c:135:49: error: 'sec64' undeclared (first use in this function)
hgfsUtil.c:135:57: error: 'nsec' undeclared (first use in this function)

To fix the problem we remove patch 0010 and renumber the remaining
patches.

Fixes:
https://autobuild.buildroot.net/results/d37/d37be203b0b4d46c052427ea2c469c624b26504e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch | 51 -------------------
 ...n-discards-const-qualifier-from-poi.patch} |  0
 ...GLib-g_free-macro-redefinition-erro.patch} |  0
 4 files changed, 52 deletions(-)
 delete mode 100644 package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 rename package/openvmtools/{0011-fix-initialization-discards-const-qualifier-from-poi.patch => 0010-fix-initialization-discards-const-qualifier-from-poi.patch} (100%)
 rename package/openvmtools/{0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch => 0011-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index c7558ac8c4..60516b3098 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -686,7 +686,6 @@ package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch lib_pa
 package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch lib_patch.Upstream
 package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch lib_patch.Upstream
 package/openvmtools/0009-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch lib_patch.Upstream
-package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch lib_patch.Upstream
 package/openvmtools/shutdown Shellcheck
 package/openvpn/S60openvpn Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/oprofile/0001-musl.patch lib_patch.Upstream
diff --git a/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
deleted file mode 100644
index df69be32d6..0000000000
--- a/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From bedbcfcf347ff1a11d1a54f8f780f560e4b241a4 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Tue, 5 Sep 2023 15:03:56 +0200
-Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
-
-I verified that this function behaves as expected on x86_64, i386 with
-32-bit time_t, and i386 with 64-bit time_t for the following values of
-ntTtime:
-
-UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
-UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
-
-I did not verify whether the use of Div643264 is optimal, performance
-wise.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[rebased against stable-12.3.0]
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-[Bernd: rebased against stable-13.0.10]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/hgfs/hgfsUtil.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/lib/hgfs/hgfsUtil.c b/lib/hgfs/hgfsUtil.c
-index fcd7fb726..f86061562 100644
---- a/lib/hgfs/hgfsUtil.c
-+++ b/lib/hgfs/hgfsUtil.c
-@@ -131,13 +131,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
-       Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
-       unixTime->tv_sec = sec;
-       unixTime->tv_nsec = nsec * 100;
--
--      return 0;
-+   } else {
-+      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
-+      unixTime->tv_sec = sec64;
-+      unixTime->tv_nsec = nsec * 100;
-    }
--#endif
--
-+#else
-    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
-    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
-+#endif // __i386__
- 
-    return 0;
- }
--- 
-2.47.3
-
diff --git a/package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch b/package/openvmtools/0010-fix-initialization-discards-const-qualifier-from-poi.patch
similarity index 100%
rename from package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch
rename to package/openvmtools/0010-fix-initialization-discards-const-qualifier-from-poi.patch
diff --git a/package/openvmtools/0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch b/package/openvmtools/0011-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
similarity index 100%
rename from package/openvmtools/0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
rename to package/openvmtools/0011-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
