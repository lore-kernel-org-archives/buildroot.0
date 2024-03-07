Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D616FC54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 16:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AEB41BB0;
	Thu,  7 Mar 2024 16:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWWHl4yvX1lK; Thu,  7 Mar 2024 16:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADFB441BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFB441BA1;
	Thu,  7 Mar 2024 16:52:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 666701BF5AA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA6F82969
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MNuHxuza7OK for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 16:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB60F82998
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB60F82998
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB60F82998
 for <buildroot@busybox.net>; Thu,  7 Mar 2024 16:52:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MCKFk-1rZzWL3md8-009P9e; Thu, 07 Mar 2024 17:52:19 +0100
To: buildroot@busybox.net
Date: Thu,  7 Mar 2024 17:52:17 +0100
Message-ID: <20240307165218.10027-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307165218.10027-1-ps.report@gmx.net>
References: <20240307165218.10027-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oObgG97yCJalWwRUGpT7PknRu8IpKmQoSRwpz5GGwvXCvctXqZC
 I9kL4Aoo9Z/d0g6lzUuC84WJz77eFP5OLYJW9UCmJvGJWv9Cdt0uBrEbszzF1N0sTehYOvn
 eM1N8pOpoclWJCQakoaZixHHYH3uvY/o840A0IffMAqapXc3mua3EqNeoMlKfD/mB5hK/Pw
 6kfglRqjPvSFubgk8z/0Q==
UI-OutboundReport: notjunk:1;M01:P0:bWr/5UtiM20=;M3eIfQfGpbNoLX/GfJ+c+4Ic2ou
 zFnAkkq4txahEYjZJgyfwCAI/6v9uAIf0Bhqngg7imRzhe0zFy6HMfUZOywmDRpZ8URLnKB/K
 2I/Ibyp+KhSNnv9KS9u/dTp7i9OLb64E12b74wLX2iYnhfYnCD9w0LAEx2vaiAwsErbtRXqoY
 iHMdcluXp1+HWc9jV9x8J0AVNZM9Pm0K5socWGeSvI/qQ+oZxZ6tb8Gn/9q91a6b8hasLDFvs
 QIeU6R8UTO9dg0VQb4pEZM+CITBU7hjrp+hEX/ZVzssti3MprjU4nOulmifiel7NNRfSfkQ4V
 hVVyMJKq2czNWHj3nMrc6jImvDOciRQSU7W2S+wmRbwQzEsglyxC8GDa9KvTy/8jY1hLWtRHv
 x7HOkq5KmXGaES63JKYGqqQhKK/XTFHFCGYqiXfhIYxdDZUb7GV7TRq8d9TCriByQWJa8J6fk
 zsnhB9/bpYOcf1HxdvFvQsecX3PUYQb38MQ3jku9FLyKOGdPrgGJgFN0V1i2UFX6AGvm9vN/Q
 U2fScfFkz/61VgYMq8xoMN3PZdu2T2YlR7g3D/8oXGJrmB0m1MHJZwZAO7atCS1is98ayBC1u
 RzGwDdq56ptGDLmARcG/+u+ueA92+d3pWlq21/zeXyiPDWZ0gpsxznE0qNVFe52Wu8EvWmQdn
 vfoYLUvPgeYpx4CKN1nBELRpfzg4voC5D0zhZ1/k1fqIABi77rRiKk2E4aNClGSEanIZUKbOV
 fFwvLS5Hp3e9amjfJY6LkrrlJwlhuNslp2y2qoQ6JHcZXnlfdbCGi7XlekL6Sj8fY1R3ovZRY
 n4d/YlkjItBM5P156bfR5R8VvEhzAsNP0SxKP0yrJovrw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1709830340; x=1710435140; i=ps.report@gmx.net;
 bh=rmJ17Cf6lSr9JiN0vBqUgdbZ5Nuyf4KPkM8Keq0ZMUE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=fkpJH6is0uIic5eXbOpyrzHo56dBVkIcyemqSUnt7JMGHcJ83KeLhjxK+SGpF1Wa
 NSnY0JSf8rZavRyezwx52v++l3d0dMhgb62ea4TaZFxevWQ81KV60ONA1gTyeeDJk
 Csezz6wEF60K49oCGZBfZTTmr4gqBNyPyM/ZcQwOz0z9NxvrJgWHRLUAq5M59Yd7o
 tL2xOsoZu96fG+i9J0OssItz66WH9gxFemE0ZqsEwl5KA7s8T6b+amTEypeQaE49G
 7Lid+OKogPZHD+l61s1q3hG22xOzZ8GuuYbjwAl1WXhCbknjsFfAyFdnqJR7S8vWD
 cmN3ypzwV5vZ/Ylf4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=fkpJH6is
Subject: [Buildroot] [RFC v1 3/4] package/xz: enable year2038 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

- From autoconf-2.72 release notes ([1]):
  *** Support for ensuring time_t is Y2038-safe
  configure can now ensure that time_t can represent moments in time
  after 18 January 2038, i.e. 2**31 - 1 seconds after the Unix epoch.
  On most 64-bit systems this is true by default; the new feature
  is detection of systems where time_t is a 32-bit signed integer by
  default, *and* there is an alternative mode in which it is larger,
  in which case that mode will be enabled.

  In this release, all configure scripts that use AC_SYS_LARGEFILE
  gain a new command line option --enable-year2038.  When this option
  is used, the configure script will check for and enable support for
  a large time_t.

  This release also adds two new macros, AC_SYS_YEAR2038 and
  AC_SYS_YEAR2038_RECOMMENDED.  Both have all the effects of
  AC_SYS_LARGEFILE.  (This is because it is not possible to enlarge
  time_t without also enlarging off_t, on any system we are aware of.)

  AC_SYS_YEAR2038 additionally flips the default for --enable-year2038;
  a configure script that uses this macro will check for and enable
  support for a large time_t by default, but this can be turned off by
  using --disable-year2038.  AC_SYS_YEAR2038_RECOMMENDED goes even
  further, and makes the configure script fail on systems that do not
  seem to support timestamps after 18 January 2038 at all.  This
  failure can be suppressed by using --disable-year2038.

  Changing the size of time_t can change a library`s ABI.  Therefore,
  application and library builders should take care that all packages
  are configured with consistent use of --enable-year2038 or
  --disable-year2038, to ensure binary compatibility.  This is similar
  to longstanding consistency requirements with --enable-largefile and
  --disable-largefile.

  In this release, these macros only know how to enlarge time_t on two
  classes of systems: 32-bit MinGW, and any system where time_t can be
  enlarged by defining the preprocessor macro _TIME_BITS with the
  value 64.  At the time this NEWS entry was written, only GNU libc
  (version 2.34 and later) supported the latter macro.  Authors of
  other C libraries with a 32-bit time_t are encouraged to adopt
  _TIME_BITS, rather than inventing a different way to enlarge time_t.

- In buildroot there is already the BR2_TIME_BITS_64 config option
  ('Build Y2038-ready code'), which enables a system wide
  '-D_TIME_BITS=64' compile flag (and maybe should additional set
  '--enable-year2039' configure option for the autotools-packages?).
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index a9e33bd3df..64dbec8b2e 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -40,7 +40,7 @@ XZ_CONF_OPTS = \
 	--enable-unaligned-access=auto \
 	--disable-unsafe-type-punning \
 	--disable-werror \
-	--disable-year2038
+	--enable-year2038
 
 HOST_XZ_CONF_OPTS = \
 	$(XZ_CONF_OPTS) \
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
