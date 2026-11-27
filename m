Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48240606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GnTbWAhI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0A660AC8;
	Fri, 27 Nov 2026 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1_R2wat5fGu; Fri, 27 Nov 2026 11:55:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3353960AAF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795780554;
	b=cvNSEp2+tGmiyveqoTwUeZXP+cwnzfc86IvQtRxP3Wz1kPfUnGc4DdEJcQa8soEz7IUt
	 P3CcHvS3tYhGXL5CXWs0t9hb6dYsy6LJXBZsk9mciqVctd3jg0H58wV0pC9r6ha9aXwIe
	 gRED+DvOnGuCPMdnnoKxjUo1+MdppKms3ZRSg2QdPY0w7C/U7GhMHr/rOrvZscSuXgaFq
	 I+ib+OCFzIPacIGvdx87LrjKKWtAcR82teXsP1sRkn3HX/P7zUfHsY3NGmnEdmxmdbFqb
	 OKje5q3zrDxrQM5XYF/3A+FHKu9GAZlHES/01+q+TiIxKyNuGEq85QSzjKiX50W8NkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795780554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gfxmdmqQhyZWK0eN4zY5wAI0Lahe2j4xQn4GRbkn6BI=;
	b=B2Vy3bo3Xvj9rZJTaBt5hgUEac5X4/ZwdTEVpXULz/C93k0GH1ZJVeC6qaBTbq/H7IOu
	 Va5kcW8J1rX1C8hsDx5qKy1EiLOdGgX+SXHhmwZQjhi+DIBceFyEXq8qy++x/D7UhPQSg
	 ci1Oqe3BrqbdzA9cXKQJGKSNly8zvZFDoBdeMlnxm6LkE3hsv9ad2lEbR2vsfkoMz8GYc
	 CzktIFPgBK6Ztckd9W61FWVEiejws2M4x0qawI51DzOwl0C7106h7H1uaozn/nhn3RRWw
	 dIRU6vCL3FKUDzwqFO2vrGeOoqHrVfDGNWG1frstFcuhhyOHCjv3n+8Q4v3OGPcffpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795780554;
	bh=gfxmdmqQhyZWK0eN4zY5wAI0Lahe2j4xQn4GRbkn6BI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=GnTbWAhIN9pd/SzzQL3WAXTh7Y7a/kFB3dVS6u2uSQSIIWTkil7S1lcNajz6WqWwu
	 lpoG3NeVQFcrsw9A+QmAYaqTZa2wSupWCTCD9Ftv3NKY37bwzK7/0VabYxobbM9HRo
	 OH7jO5pb+mAGYqtP2NAIUvNc5D5q1GcpsxiAQO1+u8aZCmqpxlvyijOq1kuWZl8AQT
	 wy+4CwlM+BAsRBxXdH55tnnCMYrR7b5qLe/wnjoC6B3SkIjplflUhVekfqvSXBZYUc
	 fkAIVjNFBqFCIx+y96bOyl80nwKxgAwWd8tN83wQvQzwaFW2cp6V5tLaS6zWHK+bwI
	 Xe3lHdqSAdDlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3353960AAF;
	Fri, 27 Nov 2026 11:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 340DB266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C9E811F0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5Ew8E4bW4G0 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BD10811EF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BD10811EF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:55:51 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c40e30c26a4so1623161566b.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795780550; x=1796385350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+DfaCOA1AX6h0TUvBQBNs2hEx0EvMXj3RNfMUrykHJ0=;
 b=qmjpFYLjs+nvfXRxFMpkqhKLkQ+yLl4GZUq57Y8xLkfcWoXXc90kNA7QQvfSmt+3KK
 ChGCZJngEFllfXL4u2W7tAAzIaEZWql/YsJaBdCbZb4z55G69Xm6o3NhiRi76xVUabMx
 0NehhIyKP3lASt2qA1YgUcnOAgdKAQsBZEfRc8ULK54PbAdAxtzSKsgzYcF3hmrjJwIL
 WYMQV7kSFqsj7TtwszA4yfR61gj3cZAwvGKjcJh0V0GdcHFnRY2sd5kr/ix7X5/Mrxuq
 WV/3D0LUwXeeMVcbrxJeKdg2jEy6/C5NonQ+VMheDaLYLZdg7ztKgWOyZ2ZM4JxM3Esq
 D3dg==
X-Gm-Message-State: APuU4Z+KhTE9f8njmz3c5HQdJv+7r8eRdna6jceZwKtDYzG4AgzzaKLA
 fRKIdmZ4XY4t5de02xJkngqx1dgsbfSzn+z8h3KpVbctit8ySzoifWOm6IupBg==
X-Gm-Gg: AZFdTZcgblCRNluxYgU2MjCKhqcUkXeFnXnMy6JSF8wLncu+aaNSgm8A6A+avcwgGKo
 EBt3kK5IdnhfXRCkQuWnBk/l9HqJemB1vxx/O3CzESoHzLUlE4bPBgF3ZRGcVgeqMqdi/H7bl5n
 Ba8QKcP1IlqdSQvNqblvBb3M5bC+Ea8M+Xgepm6pKs2F2zDO/rUGtfWb6q2czN/UULBPmCXNjmd
 pD4aDTw3Kc/2G8j8rcV32+gla+WuHO3mKySeMxL2DoG+BYvP9k6UPwvbiBxkpY6NuyyGqvt7vZi
 wlpC029TJyNjDQdM7MQ1tPmoTTb6CA/H0ghn6zGObjw2J/+dIKpa8aDC6CRLnQVZGSFebCaIKZ0
 CqhX3VexBxxTrjxqc3HtgCUKb3d4APoOA1PuPivMRh178s52wTUFg5EUHxkBfJZyz1pev7eO08F
 V9yJPsLESDCgKDtrIBvqQzrz58MUDiWpQTMVPQBkFRSUbw+IZaUHrQHDMChhM85KMT71ZlT0lo8
 oSM+8zS7hD6gEQvwNadCA2+ifn38mQVYSr08qPEXKUH2WS0ictp8Shq/QEFrIx/dl4NkmxPVOyC
 oikZeHcyhqJpbr9ZzHnc/KlzRkNqAxkKeW6mJEFDkOouCuFytsUp0yJAE0Z2K2mlxGrYb08xsHA
 GGGksSq5YXtUTBHU7ngjuLl1lAuQl6A==
X-Received: by 2002:a17:907:3f18:b0:c46:9711:e30e with SMTP id
 a640c23a62f3a-c5131a1601amr2057135366b.29.1795780549748; 
 Fri, 27 Nov 2026 03:55:49 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm853844066b.27.2026.11.27.03.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:55:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 27 Nov 2026 12:55:48 +0100
Message-Id: <20261127115548.2130705-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mtd: UBIFS utils need a toolchain w/
 threads
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mtd-utils 2.3.x, the UBIFS utils (mkfs.ubifs and the new
fsck.ubifs) share the UBIFS code imported from the kernel, which
implements spinlocks, mutexes and rw semaphores with pthread and is
linked with -lpthread. The build therefore fails with toolchains
without threads support:

  ./ubifs-utils/common/spinlock.h:5:10: fatal error: pthread.h: No such file or directory

Add a dependency on BR2_TOOLCHAIN_HAS_THREADS to mkfs.ubifs,
fsck.ubifs and the hidden option they select.

This issue has been present since commit 1124bc4b836a ("package/mtd:
bump to version 2.3.1"), as 2.2.1 did not use pthread in the UBIFS
utils. It therefore affects 2026.05 and later, and the 2026.05.x and
2026.08.x branches.

Fixes:
https://autobuild.buildroot.org/results/f88b2b560b9a19b0f369dcd5fba034814dd79bde

Fixes: 1124bc4b836a0f16ce46088f0dd7e595a4d1b2ab ("package/mtd: bump to version 2.3.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mtd/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 1054106f81..d913a18d46 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -60,8 +61,12 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 
 config BR2_PACKAGE_MTD_FSCKUBIFS
 	bool "fsck.ubifs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MTD_UBIFS_UTILS
 
+comment "fsck.ubifs needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 
@@ -81,8 +86,12 @@ config BR2_PACKAGE_MTD_MKFSJFFS2
 
 config BR2_PACKAGE_MTD_MKFSUBIFS
 	bool "mkfs.ubifs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MTD_UBIFS_UTILS
 
+comment "mkfs.ubifs needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
