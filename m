Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A99606A335
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GkotYmUS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C94A6064F;
	Thu, 19 Nov 2026 12:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNIw9MHMNYY4; Thu, 19 Nov 2026 12:35:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D5C7606A8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795091743;
	b=B7GDmyBUmvGWLJ0tDhXuuCZWZpjFDvWKhJmbnTh1ycBN0UTJ8t28J9lNQy5LiJfyFAGS
	 Dofo64GIlAQyy5Xb4FTM76Y4314TjjL9cSW44kw7/8xuu3h5g8yoUL21e+7BYScu1vG7W
	 TjMw5R/JU/BiOvoVmOjqWaCspNWwkYtm/3UXm1giOFtGPukmX/vTGJBtoRykB4gd0ICDe
	 H8YUmwOhnTpoya6pzN9ZjfmYlwcZrQXW+fzIQ4jvMQ2RRjcXRHIseILTJrvcyObBtaoBm
	 UBWEx/ffXV7Ei1SZp0rjDsWT8AC6jK95FgsWrmy9vIEYU2nyMwN3oHdsAKW1Gkz0zZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795091743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PzKs3WVOLTyYPiiaafSmN7Q9kUSDJS7LsqClRacv8I0=;
	b=HO4Q1cZ6d1d12o1p5ewv40qAe8lK2LfG0xm0XLWMUmg9kuy0sujraYR422vnJ5ZaHacS
	 qobQIjymuXfa5DiujaY6WhjxAYjZ/qzTDvjTdDB2ZuA9DF8IsCxBl6YgTkzSsGh3jc+oL
	 fiMSJ+THQK8LjT1awAggrdIGXLfytIUs5xi+OFQDxC8eGBZZUOjAXNCpOQJ4rKuz4YCm1
	 z42H20zOiVcH4jMiynbL/nHw/P63n8Qiu4AKHnZz2E/TO1AJPpnCQXuGTkovC4pZFXlMx
	 mD8RoFvC3agyd958+XGIk7vkYEKbFsM0MHfQqLWWCZj1Yvh8aAeznsw3YPg4ZJiK4BQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795091743;
	bh=PzKs3WVOLTyYPiiaafSmN7Q9kUSDJS7LsqClRacv8I0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GkotYmUSI0JDv6GT12VmIVxtb5rc45+iMZZsvg2zqPqODYl3QDOKllH4P3M98den4
	 uYbtHRJsQKzvvPOWPuBbxp/8ecQZMdtKnkMOjeJjqJXah643AP6gh9uEgpU5hQiBT3
	 YN41AgtR+pkMFBRS6ThfNoOZ6isxBGKgGczod+wlL2q9PqUF45gfu1V3lf2VG3DlEa
	 WKrUnPngz8P522CrKo+clRB83E/76svoBhvBbbKNcnX0ugnp+tiKGeOpnIGJajdsl5
	 HWykc+h97DBdm0kXe+RKv/YxwGIVw+5Bc2L6klgvd8tnbmqr93nGDupFVMC7cdPDEi
	 LZYM6WYERereQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5C7606A8;
	Thu, 19 Nov 2026 12:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D01172FB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDB9F606A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7pcAfHQ5phv for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 12:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7FA2B6064F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.221.49
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.49;
 helo=mail-wr1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FA2B6064F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4a2f4ca0dcfso1095427f8f.1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795091738; x=1795696538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J5TTqes811lpJV7M2ueND27HIRUUV2zyikpfK7B84ek=;
 b=NkNbSSbRau+CBib5hxcrKdAq/MjGs7mUSmLm51nEnt/8m57RhaNF9W141fCIRhTkYn
 Pp/KIWYkS73HV63DOQIGtYnQZUTHJwPEWTpFfP8fsyxlA//uFJm3F80hTY2uO9xwPfJK
 Zdzi0J89y/2MNLIuPjD7dd3gW/8jv/cKfoESf3vIAkmX6YXzon84YpaY+yUzGZHObDOR
 Cmu0JRJSmspcWJMV+TlgwCAg3cWrhIzJzz3nBExEC97EhOre1JI1g3VrGXGcFAUivs8a
 SuohTfFGx7JuMnILmYVS8Z1mh9kUWc6psccQfR0PH8iv66IWuaAfTBySsEMWH3BhWfFZ
 /1eQ==
X-Gm-Message-State: APuU4Z/OUu7BTxwvjxbscQjSiWWnH2lsyRqUvxSDmsMKdUcLREj8DwLY
 WE0XNoD5tYSSx5pPy9a/7p28JRG4xXgg46ghxNmu+zTaaGTF37LEzqOdZ410Iue3
X-Gm-Gg: AZFdTZe9EI+mpjcBcCwD8Jxxf1ZVtlwxnzDTtnsqiZr9Gva6+bJ7QAbT5IWS5UKKJdI
 ttR0m93FU3MV4bOEkrAp2xrRAznbJbb8HLKCWQWFMNjaMyRDLR6cE3RV1lVVjuuH85qPt1PKF16
 SyN90e5T1r8Jz/JBU4jw5CaAT9gJpHidpCimAX2d2kjcx3eB1q7NGyPj12BrDcA+KLV+YaJtSbO
 BKgTEH9B4Qhj19sb84yqR3qk/rnytlPIxuBPaS8L5XW5ve4c26zyEjBJbO1a7eWs5eUozyyYh24
 VOplNEbdVuHemA6VVIk9dt0mMGApzPhkWkKxNCtG8UQyhK4yRc/cl2pJPZxGxI/Hwv554PUTvdI
 MT9+IvPwufQW/8IBX6gDcNwV5L4feU+cj8pnGC5wMc3WE/+krdZGZ+2xXTFiH8sMcS4woQjJnjU
 +p3oVkQecXqLsirTpbuKeGmi5w3X7cllLECBgYrQHuH4erVbcwl3+USFaeoX4nrJBRo54RGI+r3
 bnvuDQfm0ie36HKRMhEssmcGdunspxWk6PFvw7ysPgJJ3B/MdFHKOkQx0bcA40/1QAkIRvZ1yvl
 sAwJ3N1nkL0Ok4mBfQgoqHMLPhG1oLr60t0VdxDS1BKEDzMrxoOi9fVMItvitCOoRpJ/QXBcNw1
 PfYHQNegvqUiBPRQJD28OBofHqHzuZqWTl+1g4J2ZYu4szG2Fs+nkyjIGAJ7Fj6TCWpGeih9w2W
 03u7P9et44JA==
X-Received: by 2002:a5d:5d01:0:b0:48e:720a:ccaf with SMTP id
 ffacd0b85a97d-4a63658254amr12828467f8f.5.1795091737894; 
 Thu, 19 Nov 2026 04:35:37 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4a656b1cfdfsm10659156f8f.47.2026.11.19.04.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 04:35:37 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Nov 2026 13:35:31 +0100
Message-ID: <20261119123532.1749442-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119123532.1749442-1-thomas@devoogdt.com>
References: <20261119123532.1749442-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/3] package/openjdk{-bin}: security bump
 21.x to version 21.0.13.1+2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix CVE-2026-114938, a heap-based buffer overflow in the HotSpot
compiler which may result in takeover of affected Java runtimes.

This also includes security fixes from the OpenJDK advisories published
on 2026-04-21, 2026-07-21, 2026-08-18, 2026-10-20, 2026-10-21,
2026-10-24, and 2026-11-17.

Other relevant changes include certificate and cryptographic hardening,
updates to libpng 1.6.59, FreeType 2.15.0 and tzdata2026f, and fixes
for TLS, HTTP, Kerberos, JMX, JFR, and HotSpot.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 .checkpackageignore                                           | 2 +-
 .../openjdk-bin/{21.0.10_7 => 21.0.13.1_2}/openjdk-bin.hash   | 3 +--
 package/openjdk-bin/openjdk-bin.mk                            | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch       | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch       | 0
 ...autoconf-libraries-drop-the-need-for-X11-in-headless.patch | 0
 package/openjdk/openjdk.hash                                  | 2 +-
 package/openjdk/openjdk.mk                                    | 4 ++--
 8 files changed, 7 insertions(+), 8 deletions(-)
 rename package/openjdk-bin/{21.0.10_7 => 21.0.13.1_2}/openjdk-bin.hash (53%)
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b5ad45705a0..c875aa796be 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -658,7 +658,7 @@ package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
diff --git a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/21.0.10_7/openjdk-bin.hash
rename to package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
index 8d9efacba1f..68bb8b65957 100644
--- a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
+++ b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
@@ -1,6 +1,5 @@
 # From https://github.com/adoptium/temurin21-binaries/releases
-sha256  ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4  OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz
-sha256  357fee29fb0d5c079f6730db98b28942df13a6eed426f6c61cd4ad703ab27b9a  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.10_7.tar.gz
+sha256  bb8a93f9ae6e7a693b2b721e85dbeff26ae1a77447985a8d7afcdd9c7cf6222e  OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e2f771bdb22..f56d96504d8 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -10,8 +10,8 @@ HOST_OPENJDK_BIN_VERSION_MINOR = 0.2
 HOST_OPENJDK_BIN_VERSION_BUILD = 10
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
-HOST_OPENJDK_BIN_VERSION_BUILD = 7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.13.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.21.1
diff --git a/package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.13.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/21.0.13.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.13.1+2/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
rename to package/openjdk/21.0.13.1+2/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 40879824ad7..33124c17a8c 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
 sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
-sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
+sha256  2f00670ffe781881c6fdb60f49ecdfd12a6c0f5e2943b94d17b1f4bc714397f9  openjdk-21.0.13.1+2.tar.gz
 sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 25fa001d840..94e96e4924a 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -10,8 +10,8 @@ OPENJDK_VERSION_MINOR = 0.2
 OPENJDK_VERSION_BUILD = 10
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.10
-OPENJDK_VERSION_BUILD = 7
+OPENJDK_VERSION_MINOR = 0.13.1
+OPENJDK_VERSION_BUILD = 2
 else
 OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.21.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
