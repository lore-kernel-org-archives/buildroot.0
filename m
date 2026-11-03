Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BD606A31B
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 22:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MeNw/6Hg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F81280D74;
	Tue,  3 Nov 2026 22:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YN8_zim8saZB; Tue,  3 Nov 2026 22:49:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 61A9E80D4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793746192;
	b=kqmZJH9ieW6UbbXMwEShO2BRQYtMmyGCCWz0EKKES9w4BzG7veE/bZlkJCFivxpzHb+0
	 DCIoHVN9gxpYAM6Z2VTHtHMob7xs87feICdiCIc41BwIepj6Jhd0SvzAwuoDcjGZtH7vA
	 BSVNcNVigIsxgvJlO5/MExWpA/iOoGZvHZw6OUzI2BpwCtGBFrORcbEnPhFON/KDZ/RfN
	 UM2rH5lPx1GHtpMfpWD+K0Eesxuo267J25fjBOBIYQTPwo3NQEFqer0+YOXtBwHiWb66h
	 jSUSXT8+oAq719BWPjpNJSIUj5hu9j8KYqngGnpSkUyRpC2Avj/PyqQZOnBq8wMVuqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793746192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zmg7MDM0+3VVp0JTm1K2pHeFgvx3v/yo7mZfM322bhA=;
	b=A0/dKdgJ2Db97qPSRFM/x0VFBgoD0KRdwrzHe4m6MPBmurNjASV8yJ4E+PczBzimFIwG
	 XSVcR/xnQ7/iDZz+1cbkOiVFwH4psdEbBf+MeLK7E0y+rX4q5Vp2LfSKimYXnx14Apxlf
	 7kdOjpb+v/Vny3H+ReRAFX8eOWReYXuopkGIXEN0rj2YfWq2Ea3RZkaRV4ZCmgUDlYq8K
	 MQyaSOlQ4jq8WK3mxyKG2EZfcXAJsIU1qkzGoBBAfZjAvZFkhAAP716pF61tM9jU7amdF
	 IYferPVkuxVU3Ra2pMu1oIcR25UPaZ/AzxfSv6fNbnIn/uSSeIwDFrxuddi5Dtr6dqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793746192;
	bh=Zmg7MDM0+3VVp0JTm1K2pHeFgvx3v/yo7mZfM322bhA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MeNw/6HgLXkhTK1F0UCxpGx5yOUzcA+KqjP+3IRLxvzmPoIYVr6ZbWDXZZe9+xjcC
	 IxQDk85e6Xl0YVNs4wda3Nh6RvLRSB89GC38QMSFeL9GzKzgIdvTeqeudmCo5gquBh
	 bMdO1EVLXlk1FOfCXmDoC7U31+15KFXz04vCTHKQIO4Gd0b7LGmrNO9pl0y9kAauLs
	 Z9TzfXlj3GXoYuCDHPgMjg5DUQhBGDawkWNRIt9yROrARHnOVgiGD3JzhZncgQ6SeA
	 zJSGq7SoIKIV+iCqjUs2NPCkavwNUYMBLw66qw/O3cQIWcWlw37Q9jHtfCscZ6EI5q
	 KKOsi5CwGhTpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A9E80D4A;
	Tue,  3 Nov 2026 22:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CADEF37B
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 22:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC9704008A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 22:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UkJOTHw_r9O for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 22:49:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 672AD40048
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793746190;
 b=e17FBTstShx33Rl1s6OkJzPYuAzyA6VRKdhNXMgXz+rJrndf6iUQIYTw4BZ50J1ziR29
 j8vtE4N1VM/mDsfUu6Yu3uigyfLEmdCQ9x09ZZtwZIjSIbR39aSM2hP7daUaRyn82VP8T
 X25BpAlj/pQiyA4+45AmkpEEBxaiUdP7JOEzGNqApMwOJx9SYQW2j6VexEgtj50g+l6k7
 TA8GdUS5wDrANY9zWed+WpjPg2aGHWEFzL6SBKX/xSfJetKyPdk9AlPnzupF/I/BXA2EB
 Y4aeBBN+SB9j2KEbTWDvN5ZeWDGAb4hxCCtlN+izXyWI7fieNasqCSTysiHaqOJoUIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793746190;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yK5zwHx8fJnxU4TGBG/mz5IfVHf08Uo7WAvTWV+sknU=;
 b=fYy3lJ8Fkrlxyjvm1hBHi9I46noAUP8lbk80WQb5l5DE3IoCkOVpMa98XCTlRDVZ9StG
 6xo+yDjtLVzPEOeV2N7c/o2qKhHAQgEs5SZ2C/QXBWXQvLCc18OtAbNAIuu86CIGUZrzU
 2MszCn94EAubQNQwfxh5A+CGa+IRvGAw1V8B/rIl9IZUyucT02e2NvZ5HU8AbgedFELi4
 PjeQlGVfiEh4DA6qpaB2MtdVXlLnAm8rvpYFkb9Jhwtih3Z7hZgvYt8vN3Bg0LtH2GgCA
 jhVoESqJGj42Sq4/Tb5uX160a1r72kOXdkqhGn3Qziby169uBl9LJKYbzWOsw5KOhhg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=QqKkdG4L; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 672AD40048
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 22:49:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso20347766b.1
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 14:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793746188; x=1794350988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yK5zwHx8fJnxU4TGBG/mz5IfVHf08Uo7WAvTWV+sknU=;
 b=ARzKUOS2mV2/bSCatsKnBqvgwb+lm6n62xidc/P7JlZP7QoAoxgfNwv3AYOk6RmGcw
 1VPHTrP8m5Sl7uahqlnPq4mvhnXOMnHh3AGVoiZrQl1a98WorNfMhrFhOI3w9YB3/PvD
 L+yQvxvy4Cz6VJAGaaJxY0IAGw5HeRW9ISKxuBLHWWhPMuawrtyswLdjmo7sKbxN+spP
 pJiTL2+YdHJ+tmSmt48ECjlXXQcTqswLj3gHweGCXMwpzAC5cfZ1nkRPfowbqjGp8B8t
 HV2vB9X2puuhQnJbWY/fISIP1WhnHxDhshPITWKGCQVxrFe4hidnIds9GtWj23Q3vPn2
 CmcA==
X-Gm-Message-State: APuU4Z9Rb2ZeeqsmGlLrAtJmYCW9FIs2zLbv1jvqguEQq5Xnz2rEJ4UZ
 M01d/1IdhXW6EPNDIaGPRp6F9Hs7pQC8hMf4tLzRAuaoJKKbq7mQZiczn9ujPg==
X-Gm-Gg: AYBFou35JTP9j3HHgQnwNCdofJ7Up5dpwd3rlAO//AyTxhw9imt2H4KqAOTIJAz6Koh
 N1vlhhWR6gKldn6nDM8MSqBZZKKGIk4dcWioZ3gMtOZMdOCKiKveCRW25uvLLCPLejST1MPywe+
 zfBtMSoGbFbTRcRzSsMDOaJQb0L+VyGYAIr0W9RUo5OVRnDfcfNyjktCY5QpTeDCq+Cs4yuyOGG
 /VXs14LNf2SBqKmz/K/lyesqv0+iTwUMXo6gcf1d6UmtsCnK3lXGrH6ow7BcM64jmdKQhG1H+8/
 brj6rLVlKK3ltlHx5CqKf0XAoL+QdX86k6/4xyAfuCjE+AwoJ7CNXD33BszxzXelhzyxlliln3F
 UmeJr7PgbiFP+U0ItS2xXYqNwmbrfe62GSr2jAVxoMA4yNdQvDXoxDbVAQ6J/N+RefRAFTxEJOl
 rgjb4muwYWt+ilBZ/Tq9VwYZffp5QfGoasrCNR4QLXgnS1ACTdT2upkM4h/7Sad+xb9dQluS7PI
 t1mJiVtIFaHibqnN0AzOj2GUoWSVKynKEG8waTyHpj0VgpjR5SCsf7ozm8/eioZrxxJ+FCiGSC8
 CfQh+M9mmFfhoDk9rcjF+sbK3lD3ghRnXeEuMYzbBA/DW+wICtSS+FHU0T9dJkgNKOOWjoVzKjl
 QMoyvWeVpv7KgGnUC9vRmSdLVRKDutQ==
X-Received: by 2002:a17:907:d91:b0:c41:44f2:f7d2 with SMTP id
 a640c23a62f3a-c4ca7a4ff1amr1192037166b.24.1793746187480; 
 Tue, 03 Nov 2026 14:49:47 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4902f7sm6864566b.74.2026.11.03.14.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 14:49:46 -0800 (PST)
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue,  3 Nov 2026 23:49:46 +0100
Message-Id: <20261103224946.2883070-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fio: fix build with libnfs and without
 gnutls
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 3.42, fio's configure script requires gnutls as soon as
libnfs >= 6.0.0 is found, and fails otherwise:

  ERROR: User requested feature gnutls
  ERROR: That feature needs gnutls (required for libnfs >= 6.0.0) installed
  ERROR: configure was not able to find it

However, gnutls is an optional dependency of libnfs, only needed when
libnfs is built with TLS support, and libnfs 7.0.1 already lists it in
the Libs of its pkg-config file in that case. Without BR2_PACKAGE_GNUTLS,
libnfs does not use gnutls at all.

Add a patch, submitted upstream, that keeps linking with gnutls when
it is available, but no longer fails without it.

This issue has been present since commit 215133c0fc28 ("package/fio:
bump version to 3.41"), as fio 3.41 started passing gnutls to
pkg-config together with libnfs: without gnutls, it got no libnfs
flags at all and failed to link with undefined references to the nfs_*
functions. fio 3.42, from commit 722c2f30ac4e ("package/fio: bump
version to 3.42"), turned this into the configure error above. It
therefore affects 2025.11 and later: 2026.08.x has fio 3.42 and the
configure error, while 2025.11.x, 2026.02.x and 2026.05.x have fio
3.41 and the link failure.

Fixes:
https://autobuild.buildroot.org/results/dcab5079f960434a8f54ff991aa879a6dd0e4b3c

Fixes: 215133c0fc2819f059fbb35071ab2e0987f5107d ("package/fio: bump version to 3.41")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...gure-don-t-require-gnutls-for-libnfs.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/fio/0002-configure-don-t-require-gnutls-for-libnfs.patch

diff --git a/package/fio/0002-configure-don-t-require-gnutls-for-libnfs.patch b/package/fio/0002-configure-don-t-require-gnutls-for-libnfs.patch
new file mode 100644
index 0000000000..2bd7b5951b
--- /dev/null
+++ b/package/fio/0002-configure-don-t-require-gnutls-for-libnfs.patch
@@ -0,0 +1,55 @@
+From ddade033ec8e5376d63275194836c2d0fe535321 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 3 Nov 2026 23:34:39 +0100
+Subject: [PATCH] configure: don't require gnutls for libnfs
+
+gnutls is an optional dependency of libnfs >= 6.0.0, only needed when
+libnfs is built with TLS support. Since commit ceadd925 ("configure:
+conditionally add gnutls for libnfs >= 6.0.0"), configure fails when
+libnfs is found but gnutls is not, although such a libnfs does not use
+gnutls at all:
+
+  ERROR: User requested feature gnutls
+  ERROR: That feature needs gnutls (required for libnfs >= 6.0.0) installed
+  ERROR: configure was not able to find it
+
+Recent libnfs versions already list gnutls in the Libs of their
+pkg-config file when built with TLS support. Keep adding gnutls when
+it is available, for libnfs versions that do not, but don't fail or
+disable the NFS engine without it.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/axboe/fio/pull/2173
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 664ce299..1a09fa46 100755
+--- a/configure
++++ b/configure
+@@ -2396,7 +2396,9 @@ if test "$libnfs" != "no" ; then
+     libnfs_cflags=$(pkg-config --cflags libnfs)
+     libnfs_libs=$(pkg-config --libs libnfs)
+ 
+-    # libnfs >= 6.0.0 requires gnutls for TLS support
++    # libnfs >= 6.0.0 may be built with TLS support using gnutls,
++    # but gnutls is optional, and some libnfs versions do not list it in
++    # their pkg-config file. Link with gnutls if it is available.
+     libnfs_version=$(pkg-config --modversion libnfs 2>/dev/null)
+     if test -n "$libnfs_version" ; then
+       libnfs_major=$(echo $libnfs_version | cut -d. -f1)
+@@ -2404,9 +2406,6 @@ if test "$libnfs" != "no" ; then
+         if $(pkg-config gnutls > /dev/null 2>&1); then
+           libnfs_cflags="$libnfs_cflags $(pkg-config --cflags gnutls)"
+           libnfs_libs="$libnfs_libs $(pkg-config --libs gnutls)"
+-        else
+-          feature_not_found "gnutls" "gnutls (required for libnfs >= 6.0.0)"
+-          libnfs="no"
+         fi
+       fi
+     fi
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
