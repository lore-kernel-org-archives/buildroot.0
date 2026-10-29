Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF5606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UZM0+44S
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1EF406AF;
	Thu, 29 Oct 2026 07:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PT7dUBD91y-X; Thu, 29 Oct 2026 07:28:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0EEFD40755
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793258931;
	b=FNd8hpT6OhK8zE1CREzgwP2lyYVDjZaF+2zrAfwVL9ACRCZa2MaiZMdSUtzBwyNZPvvT
	 6zP7PZeb2jnvyhWFUw1mchdCZ7nAfjsCHeR1PTvLovDR3puKaXiERqZvCzxREGIA9OVA9
	 HoqGYNf5mYMNwguKLdk/m6zNFYOuHJ6iBVEvlz6yWTIGjfjotY/dz+6xZa7miqODxL90+
	 rMRP16Iq97gTcAu+LQhQ0M6XbUWbGLRoEbZe1xplLpbf0xapSBZdwMVeuI8CytqHjNo5v
	 AwdyQPAhqz37BUGY4Fhx0cvGN1983gkbLRZnlMvBko54M6eeUuEBxWaoPn5gGWHMsdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793258931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xmLiChG4ObXLMXr0P4hp8ejTNte4wX/b6uu1t6D47QY=;
	b=ZLf+WB6P8ajr2us2BCnDyZRlVl2rrk3YdzkSK0ytDq0LzLh2jap6eWxYJxxnuGAcYH09
	 J5KWBJdb1tzHKat/ihZoajpdFiz/8fJvSwliFtm2PkaoF5VaE93bsYVyXgUyNHPGYLh0i
	 P2zBWIEkbAGSlqHIbJcWfVK+nlJyO/MKjMlITFbNKORQGZn2RPQ9kmWXnQo5P1PQ001OB
	 Lc765Wl2olqqbv+1XzLOQZz9OvBDJ8z0j+Q8BtsG0rEbxk/4isRj1ak4KoTVI2aiObzF8
	 WPXbgP7Lfe3N/RyopqjQu+ERd2XpGK2B3QnbG+6qfGgk5qLDzE+j9GdzsYouRwx2IkQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793258931;
	bh=xmLiChG4ObXLMXr0P4hp8ejTNte4wX/b6uu1t6D47QY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UZM0+44Sgx//feQ5CLig7qIhAxviFuiSEz3jO24RVIjw2u3bTXsNSPA8/I7oUgcCj
	 ZDZ7WuMZ6HQRceAj1eBVY1RvLj+YeLicrWKS0Z6wwIybdzssLAXnP8m0mWgfkk3LPR
	 TlhmazuedpMjVLwQgZFJDqFV89BDYvodken55pJyiINzWbZxz6EAPUi5c0BiLgp2Uw
	 LrzQ6HdjPirf+kNMqCXaAwctv5t/ZbJ1oW5TsGzge/HmQe+Z8vVn5PZq8iXzZivxY8
	 poE75ZQkR3XeAkTQx3/3uQ2//szm0s+4Ig8MZWQ7VkHXrMxliHwbnrcoAW6ahKyS3W
	 XTPfiFbfaRj6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEFD40755;
	Thu, 29 Oct 2026 07:28:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92F242FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DBB40176
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTFjaU_HzosW for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 07:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 41BBF40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793258929;
 b=Ox5aLDKTcnm4nVt8zjJBOhsKqLJTyJzjzHiPdFtNVcVVG8GhkmO85Mgtv8G++0aQExAT
 kb8rAQnHicZMkvh2tdyoLlU3i+ymZRLy44NpoVChXN5PAnaXu5Wh5h9SKNMQWQUZp1MyU
 Zm4DDSYu6wCRLaxmPi4lNapySlCUBT+S1GWAGpFgJWGTdZBPBigW98iHEJrVSJbvFreNr
 sIC3N/s9Tr5fOOs+NkjqbHGJiG0x+Ct0ZeE6kCH0EffQ8QwsP9lDyQI6enWkKn8rhSRf1
 lEDVyTuKmAJkq8yUHHPM//vmtLcHov9frRzIV1hvWQuT5XyjzTAEDntpxm/ILebIWSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793258929;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=eBMBo4Kc4hFyIg9htnzERR7i2EbT8jObxZ/ZPJfoquU=;
 b=HUj1hbai+yKQGqIrsuPmjoKbSztrNvr2itYNrR8f7ojrl3oTr5tuAtgAilbtOFMNcVSu
 11SNyEIIQQzW3c814LdEmA/ymsfJ6HXt07mjHeEgDoe6htjJq9vVdrMD0fH/dnwt1LJk1
 tcsW60mv4cAoRf8ZG+3jAbp5VA/CjiXAvDXSLjEPYw4GNlcqT+ZKc2nZiIj15ff7Ppz8P
 Kbtk298kfF3MiUjwH7NMP+EshTi8NpJ5fU+SYF5fWpmNj1TNQlClwEUqG8EIaUZf//Yjp
 DwCO046mN95u/eaQuHKksTFliKHFcqXCOBCd/0/8OZpXSBvM1d9gLewb59Tmc4vgHeA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=Vhn4a7ec; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41BBF40080
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:28:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso2195663a12.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 00:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793258927; x=1793863727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eBMBo4Kc4hFyIg9htnzERR7i2EbT8jObxZ/ZPJfoquU=;
 b=dtCHjP+zd7QFc4wPdQlrnJ80gSQsgl9OtX5efPZR0Yo5x53EWv9XqAAdLuZyEVsxvI
 ylJW4eEoKd0lCBVLcStXCzubhIz8BN++NoxisGaQTImtVFsWz/bePl7HRym98uTn75S8
 0pQ3f+LZ/wSDM6IqMDY3PIct6h51heaTMry8IWXhOaJCy7Iiku3fThpR8shqIoh9aqhe
 hAHG3o5cva58dYkufaswIAT5aCtQeC1uG+T8TFFIKS+q0y3r495Bj4HjlEbSGJGwp2I2
 A7h8C8lAcUpxiydtXvziMyqpj6bTHJzouStqYn80jK03ddJh3wUl6Hf8UZsNhEVnZW/I
 5V2Q==
X-Gm-Message-State: AFq9FYICxQtnPwrQJU+4x+ZVndDXFK/GZkGUpkCp8yEceXT4thbB57PH
 B7xLxuVXoD4jCZI+ceMDcdUjkZAc8cZnUFiuEYXCXU/ie3qYv8tY9RJUrRrhZA==
X-Gm-Gg: AYBFou2LjntgC7ugPqkOHcxxjukn4EnL3h2W2QmJ6Yr5gzgt+2dop9mswK0PJVrnj+c
 1iaK6vTTM+MBY4kqbEL8P0F/OgB6rB8ROgWFgwCQpPtP6weDSX/VwXslMtF9M1p40a/odn67xt6
 tXF5mRNgAgdCOV9Nt32J1Gu8nbZKFHGd+AuIKVz1suI8Unkaglyph2weLwSoAoFLMmYQGPlF78M
 ucV5lTdgHXSyKjzQs6I+byzf0eTcwUyvXF5QeswEdfwLeyMHN9GqK8LZ9ZQGOZc9kpOslY4BjAj
 6osXzsJbgb292RbXczVlY90RK0Yc6LGu6w7RXDaOQzcmajKpkQ8Z5yz/cFW55O3QHqXGHfcIlq2
 rrIK5pbXjXURxOBXRJsIZoTkfQE/IXg0jhKhWkM9B6GYpCDEKBlrOilGjelbzQSr95am2B5o6IP
 5kPoxPT0vQrCiT1GvLUrL8MuBzQsgIKFx3prG/Xm+GnPUxA9xWtsKW/t9B0SyBWYHsSGB4eliDb
 dnR1LTTnfbxEWkmolgostrlwTsIFchM0sv6lHDzXgfCVlibx+almRvKmri698JWV7ay3AoFMN00
 LgnPu+tA4dPNOPuv9lVXW8EOygn3RYrE+8d+Hghet8H2cuzaEUW2gVLYdptFT4dsZDyaa8FmZds
 1qd/1fm9D
X-Received: by 2002:aa7:c957:0:b0:6b4:746a:1dcf with SMTP id
 4fb4d7f45d1cf-6b49cc2044fmr2356256a12.43.1793258926449; 
 Thu, 29 Oct 2026 00:28:46 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4964601f2sm2382343a12.37.2026.10.29.00.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 00:28:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 08:28:44 +0100
Message-Id: <20261029072844.511701-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/valgrind: fix build on mips64 n32 for
 non-R2 CPUs
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When Valgrind's configure detects the MIPS64 n32 ABI, it
unconditionally sets FLAG_M64 to "-march=mips64r2 -mabi=n32" and
prepends it to the compiler flags. Buildroot appends
-march=$(GCC_TARGET_ARCH) to CFLAGS to build Valgrind for the right
ISA, so for any CPU other than mips64r2 (here mips64), GCC is given two
conflicting ISAs and the build fails:

  mips64el-linux-gcc ... -march=mips64r2 -mabi=n32 ... -march=mips64 -c -o priv/libvex_mips64_linux_a-main_globals.o priv/main_globals.c
  cc1: error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor

The same failure was reported for n64 in
https://bugs.kde.org/show_bug.cgi?id=400975 and fixed upstream in
Valgrind 3.15.0 by commit e61d13087 ("mips: if revision is specified,
use it for compilation"), which makes configure skip its own -march
when CFLAGS already contains one. That fix only covered o32 and n64,
though, and the n32 code paths still hardcode -march=mips64r2.

Add a patch doing the same for n32, so only -mabi=n32 is added and
Buildroot's -march is used. As the patch touches configure.ac,
autoreconf the package.

This issue has been present since commit 1172a68ae888 ("valgrind: bump
version to 3.14.0"), which brought in Valgrind's n32 support with the
hardcoded -march=mips64r2, conflicting with the -march added by commit
4fc3a6fd7472 ("valgrind: build for the right MIPS ISA revision level").
It therefore affects 2018.11 and later, including all current
maintenance branches (2025.02.x and later).

Fixes:
https://autobuild.buildroot.org/results/c562eef960c049f1523ed1c6a30c0d5eacf905ea

Fixes: 1172a68ae88849834dcb1b6adddc06c836aa7109 ("valgrind: bump version to 3.14.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...c-don-t-override-march-on-mips64-n32.patch | 57 +++++++++++++++++++
 package/valgrind/valgrind.mk                  |  2 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/valgrind/0004-configure.ac-don-t-override-march-on-mips64-n32.patch

diff --git a/package/valgrind/0004-configure.ac-don-t-override-march-on-mips64-n32.patch b/package/valgrind/0004-configure.ac-don-t-override-march-on-mips64-n32.patch
new file mode 100644
index 0000000000..5ba01fa30c
--- /dev/null
+++ b/package/valgrind/0004-configure.ac-don-t-override-march-on-mips64-n32.patch
@@ -0,0 +1,57 @@
+From 170ac7684d52f44ddbb40e38c1887e870319526d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 28 Oct 2026 12:45:25 +0100
+Subject: [PATCH] configure.ac: don't override -march on mips64 n32
+
+When building for the MIPS64 n32 ABI, configure unconditionally sets
+FLAG_M64 to "-march=mips64r2 -mabi=n32", even if the user already
+selected an ISA through CFLAGS. For o32 and n64 the -march/-mips probe
+is skipped in that case, but not for n32.
+
+As FLAG_M64 comes first on the compiler command line and the user's
+CFLAGS come later, a build with e.g. CFLAGS="-march=mips64" ends up
+with two different ISAs, which GCC rejects:
+
+  cc1: error: '-mips64r2' conflicts with the other architecture
+  options, which specify a mips64 processor
+
+Only add -march=mips64r2 to FLAG_M64 for n32 when no -march/-mips
+option was found in CFLAGS, as is already done for o32 and n64 since
+commit e61d13087 ("mips: if revision is specified, use it for
+compilation"), which fixed the same issue for n64 (bug 400975).
+
+Upstream: https://bugs.kde.org/show_bug.cgi?id=527958
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 54f9d31..ca777fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2661,7 +2661,11 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #endif
+ ]])], [
+ VGCONF_ABI=N32
+-FLAG_M64="-march=mips64r2 -mabi=n32"
++# Don't override the ISA if the user already set one in CFLAGS.
++FLAG_M64="-mabi=n32"
++if test -z "$ARCH"; then
++  FLAG_M64="-march=mips64r2 $FLAG_M64"
++fi
+ AC_MSG_RESULT([yes])
+ ], [
+ AC_MSG_RESULT([no])
+@@ -2708,7 +2712,10 @@ if test "$ARCH_MAX" = "mips64" -a "x$VGCONF_ABI" = "x"; then
+         return 0;
+     ]])], [
+     VGCONF_ABI=N32
+-    FLAG_M64="-march=mips64r2 -mabi=n32"
++    FLAG_M64="-mabi=n32"
++    if test -z "$ARCH"; then
++      FLAG_M64="-march=mips64r2 $FLAG_M64"
++    fi
+     AC_MSG_RESULT([yes])
+     ], [
+     AC_MSG_RESULT([no])
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 6dca6252d9..c118bb7286 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -14,6 +14,8 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
+# 0004-configure.ac-don-t-override-march-on-mips64-n32.patch
+VALGRIND_AUTORECONF = YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
