Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E96606A332
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mHhLI6+1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B88A6064B;
	Fri, 23 Oct 2026 08:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfA2MloAlpcl; Fri, 23 Oct 2026 08:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3224A6065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792745972;
	b=sMmak/x+RuZOXUyZtOmd72FsbsZKRKxit4ypFsbfRJZ6w1m/y+XsIZ4FiRzpgxy1SY7u
	 vNhtlQOZys61/14qAgvJDHqmNvMYIol4wsyY8rDEVJNFI98bhGf6DhWZ3pZxhkOlJRkm1
	 SWw+vXFxOEm6PNntEFdpCZiOcBqzBWkeURAXLMUaLKPgQjbEUXtxdiXzs7faZ9zL9we4Y
	 8NZ8ZHA8t8OxZxlvHJAuBmlaOtZbE/K+Z6yec6hE02a3Oc0TV6s1Ywe56AeTbwNMnRUDd
	 /tuwl797h+CttL39NeslFo7RhmZpRFenYC2e3VbJVomddQvnY+QkELYLhTSEHmJp9Xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792745972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9olQELFaPClGFpL1G2500f1skvulWZSQWUhyS0kxVQQ=;
	b=QkB4GpiuShMXRlvr8Lw9iHOIvpXCWEnA5250VSE2RBILypnAr2CQlf5emD6sfmeQSr0F
	 OXk8lsPa5xrjjA96ST1xyz4RaTvHggDVA5EwvYuOG++x2PiI97qCYO3Qlx78n3ExsiEQx
	 0Yt3XlZDwLsfkCAzmfEYYes3CtNGpDGh3b2ekxKLVC0Ha5BjQECq+Fu7vMhlRNx6ae6WQ
	 5NqpxMxd8sFe0sH2o39HquWDbRVr/QMR41bKLkFLln+ACJg8c+W9eSAyuaL4XYflovGMk
	 cXi/c/WWLhpcDhgsP4Bh6BO4IbTOOmmk/5Wj3+p4GAgL/p4VJd/c0d0z046lHLGUlTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792745972;
	bh=9olQELFaPClGFpL1G2500f1skvulWZSQWUhyS0kxVQQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mHhLI6+1dFVHHuGL0OzlecG4c2u3jKtGxuiQpAOleC5OLe41VzfJBwsP2cX1EvL8D
	 ydCTHuKreEIiPeN4PJ+QubPiaPhW6uFa1P1K+i9bJzR1mH4CVuzVhBtR8vmyO/xhAA
	 hhQO7Wk3f8kqsbEYQJVxypWjttMZC5uFpsWOwnI55QuHUUXCRIUCG5FVy3sUQln08B
	 qc5WLYG7+rqhMATo4Si4FG9h2kZMM2PBimy5l2IDpd01ftLzkUYXgtMd7fTA0OxGdP
	 k7ngrS68gjTErCjxuAmGuKiHiJZDaO3gJDI6vgMFCVppHLu5vCgvGJvtP3Za0g5eDu
	 H0bLIbE+15ugg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3224A6065A;
	Fri, 23 Oct 2026 08:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DE9149D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FBB3400B5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzBUrFTzJL06 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 08:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4CF7B4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792745969;
 b=KALbWCu9f52aF3JoaaR4eDZQb8RRXjXcUGnDibnhUhfaqM/O5goG1ePBE39i8E4jLXge
 0IoFAsq6PFHCPgkD2W4NeWYFvjbhNbaUKwTz67mt5bV1nfAtvYE6f6vVp+hSMqytlx7Gc
 4hNGYJofXkyJFo7dWMrOVEruIpuL/+JE5wcxiD2FThCwKQOFX6i7aV/V98XIt2lwXiIlA
 qZSV0Y1nzsoMIartkrkc/yMNkr9NUVB42kUF+WQ7kaKTyOwl4W6JlYDywZ1NJNcxXCEEH
 XjRwu2vA8ujSFzRGhKAOBuiPoPVpqVfQGEgRL+BAnAANb1MIiXAxFM4ofKWoBacFyMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792745969;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=9vFtXQL1mbD/+ivQDVRk2PEr4iZHl8JAUwD0fMDNJh0=;
 b=hkDLqkDE1UlUTAZJPeZGEQJbXpESY/XrYsUmCNwhAa2EBtZrw19FlXsMQ4T0hMg9u+1F
 ym9SP59JPLYdBZbmr0/dskFnYHMCDSPU0bNOYEmG0nPsyENxW1yLOPtmrTt/NbipnZLhm
 ADHfPLgV1vBbx9YZ1qfUNHxHjNN8Cx69eg47aeCSITUjfEo4CUuHc5/AAulYFWoBZlmUN
 A44O2bRqmIFomr/HyiKEn9gjfNen0XQXHu/9PPCrCnU/+jHeG9P5YZ9ZqMDlt3xcrkDqH
 wgD3dx30BG8gLbXpHncnFvaEo077BfV7vK4B71MSEWgfL+f1SukHEPpjQxRLSGgh9IQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=QJ6IL6EO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CF7B4008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:59:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa27963eso2576288a12.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 01:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792745967; x=1793350767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9vFtXQL1mbD/+ivQDVRk2PEr4iZHl8JAUwD0fMDNJh0=;
 b=jmLjlKCJoRCUxKamqfnVPMSi611IuyOPbjyo52pbc1k0XnnRiqXCYka/zCHOxGGm2V
 V20TaUtMfkdZjeR9Qe1/dAGlLm8jJQZZBvLf2CJ++76Mr3tjKVab1UKHLk72n7u+/V8H
 TWcd5StSHpGUmsZ/QXjXQSo3idw5aXNCdDKDbcWvuSOeCKzbYqxXv1ZWGjUtmHDf0SsI
 //MYS5FsYm4OQblKyQOuEh65zeKCExQQDlJ4ks2yqbQQgkmcGuVFoDwhk6/VkcgyPD/5
 LnoUQDqCFjo2VzI8AvcLXNgteJgR6pZimBZ4fP9c+QcUO4xzAWmdc4kha6dpMpwnsyYX
 tPmw==
X-Gm-Message-State: AFq9FYJQ47Loh4/ILmPGeXPadFBWGBgP6btqzd7xc5YHXZGNWWJPTq30
 PF/ZALAQLJw6ZO/y4MQt5SKKAhbS7ryhCxwg9j10F5AE5Ni/zfO/ZbZautmtag==
X-Gm-Gg: AYBFou1cXZ7wQKYP7XNoC7QKrulZ1Y8EnhYzKCwOxa5t8BRnFujH9qjhiUOiogR2gGV
 pLMwV0083kEQF9VQ2p7INECKTIDnWyX6anhcekxnrnTg4noNhH1R+D9neHABebNJS0BpHZH1Pv/
 qPULHjysMZ69ec7jUJ3bqV2iUL05q3KdU/qpjAf5BjWuSNp2uspPrV4ehpIN2ZLWbR4GwsWtc+S
 dD0235gWHmWxjAYB55zG7mZCSou78cJNeU45qSLIpP8lE/JL+MZyfsf+Q5veDTi1xQ7K0fBC3AC
 4Jt8nmlrFWc8P703VLNjEDbZbPZ5O4adwaQcOBMzuOHhLI0lJTJRQFO5txxwaeIZ7z0O+gX/T44
 BeYj+MzWF7+DT+/tBqApQoG65RAqwcEAp1OHz+/Wwk+Peb9GQeC9OQvU6iufkIiVtngUVvexybQ
 cVQsaiI5UgxwU5Ss7lZXoB4iBGa8t3NWeKvwqF3KE20wVGG4teRBzOZrp5azjqSM/k6YtJz47zR
 ikg7e7uyHGhel/ZkpBzn8irGOcdxqSmv5svyuVIBR+BQFbxiwQ8UkrCnZzzaU2XMECG7wIeyR5u
 Xk4e8jt2bRiPflk5hJbon0dzn9PLNp0Bltg=
X-Received: by 2002:a17:907:3fa6:b0:c3e:d0ca:d30a with SMTP id
 a640c23a62f3a-c46a909e89bmr233484766b.4.1792745966622; 
 Fri, 23 Oct 2026 01:59:26 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46a5c4cef1sm78378166b.28.2026.10.23.01.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 01:59:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 10:59:25 +0200
Message-Id: <20261023085925.1104974-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/parted: security bump to version 3.8
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- CVE-2026-89085
- CVE-2026-89088

Other changes in 3.7 and 3.8 include ExFAT detection support, several
libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
fix. See the NEWS file for details:
https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8

Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
which is included in this release.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...CH-parted-fix-do_version-declaration.patch | 44 -------------------
 package/parted/parted.hash                    |  2 +-
 package/parted/parted.mk                      |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
deleted file mode 100644
index 78709e07ad..0000000000
--- a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 12:22:22 +0000
-Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
-
-With gcc 15-20241117 compile fails with the below error, update the
-do_version declaration to match the header in command.h
-
-../../parted/parted.c: In function '_init_commands':
-../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
- 2469 |         do_version,
-      |         ^~~~~~~~~~
-      |         |
-      |         int (*)(void)
-In file included from ../../parted/parted.c:28:
-../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
-   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
-      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- parted/parted.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/parted.c b/parted/parted.c
-index 3abb52f..fc2aeba 100644
---- a/parted/parted.c
-+++ b/parted/parted.c
-@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
- }
- 
- static int
--do_version ()
-+do_version (PedDevice** dev, PedDisk** diskp)
- {
-     printf ("\n%s\n%s",
-             prog_name,
--- 
-2.34.1
-
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 6643ba9fbe..9218deb39b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
+sha256  a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63  parted-3.8.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 5b55a9f21e..314bd0d3c4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.6
+PARTED_VERSION = 3.8
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
