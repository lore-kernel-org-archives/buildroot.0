Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA6606A32C
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GDKvMtTm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF34C40807;
	Thu, 19 Nov 2026 12:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyzEShYGjlDO; Thu, 19 Nov 2026 12:35:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B483340810
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795091740;
	b=RL1la8TuNeneBEFXHfOeLKpeMIKP1q6SPUpPpABqguoxl22Ny55f+0kvqcJt+mlMIsfs
	 cKIQ2ZO3Fq/2hLctGGdRBZ8XMDyscEIwy9Jm+qYAqHapq7BivgwGAByWcmKcIq/cgR1iQ
	 +YUsoZBUpIT2ZdD7g9PI2fctf6UkP5aPg8aR3bFpvpF6KecW3vbe/YtUkUB4aRFGTGHIo
	 9SHppv/v3PMlrN56g8+qu74XwuoARmtJVpcuzXuxOqQMCYAyC9lDunmA3WZcUeEiT4T1k
	 A9TB+Acdr/x1/VoBILuhoZHVfPa63H848tV/CRf2iz3wDlW0zdYnlDgzlZkARqgD2mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795091740;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/u0GVZv9AaBPekJbVlKZT/CNO1+vmZD4OBC9c6dZtnU=;
	b=L3vQ1G/sH7OmY2EJqPFve2OI+TGP9RDvqUehbNm73R6Lj8/wq2yw00XcNg5/Y4ANoMAz
	 6AUa2/IeE70arYbGR+OxUKi73ZdFyrRYF3A51rQ2Mj1c3/gL+2zbeMDnO1ag4A/V0Oo2K
	 285ngWaT3rEzGsWfddtfApoTtwDJlqwoWNP5sR9QwcRuJgW+hQYDtXw196Po5TUaDLBWX
	 4ZX+4vd/afIpeqKGuFiNgXm8DL5tHpoPGiYzTqIUb7ysMWIBSL8NyC5rfDRwLmkVhLARS
	 zrHaPpcKmwp9nwwZ6Kbla0tMFM0T++d7KnYxEGzugFjz4tQA81vUCU8wL22BjRP03Lg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795091740;
	bh=/u0GVZv9AaBPekJbVlKZT/CNO1+vmZD4OBC9c6dZtnU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GDKvMtTmW3UnZ3hbLA3YeEieKKsUbw29spxZUjfiWsRXju0MceVq61LolXpOpgWcX
	 MO0EaryFZ+bSJUsYPIZa9pzLNzDRRzLvVHJ94ks4AnGSFjG6yNqToUR7gRMauHIZdM
	 gWcPHkInEccP0+3DuMZI9+dJc3LvsW5lF21CL4NpWRvdpOv4lUvfK76U5nqjkavHsD
	 1MF8tMtb15UU8RPtOX6uVYyOOUX4vqk0K5lbvocPIo7xtIcOerygzxFp4dydSs8Z4K
	 RWy4uqhgQDLcXBHoeVgPyyEdpsHz05CEQh9CPhzvkhGDtKzM0xOdp0jKaZchOwQRhE
	 WDIezRyODzeQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B483340810;
	Thu, 19 Nov 2026 12:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 337FE1C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A8540526
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFBxrPyfAz-g for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 12:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CFF61404FC
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.221.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.42;
 helo=mail-wr1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFF61404FC
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:38 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-49a92144733so1041814f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795091736; x=1795696536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u084ED8JjIwW2u9KpjdJG6MiBQXiebrk5lqayvz/2Hc=;
 b=XLNAzTjAC2lhJI4xpTinVJggjjzh5yptLi0JfwamdGwSBGPe/XMBsI+lrkvtBOlO3k
 vBvx+NSk6KQ5DWn9LSx8nASMS9YqarEdCLiWvC1BSIHuCk4lLX58jajlW/2nxNI1vwDt
 DyBEwYqn+Q8tq2vN7YO7mstPtuliKHZ7fOcZIxywxxblwO1vu5Qr/DBggHOenKxsCLGx
 MGv9Xt7D8pg0RY8k78sHs0XevlG+vvJJ0Rx6ZxxmASIaol/0HJG1ACnzdj+7UTuDxusZ
 665J2M+RFBlIlh7upGh5jKS2oF6GvKv6k3KqrK6vGZKoaAqIEcdPqC7b8dWdnKeRPULM
 LdTg==
X-Gm-Message-State: APuU4Z9Ub06KgoIk5tregCuMOOBCkxQDnwZSSSHDMmP64TcVMlsrIjty
 Py4vl63QS3YVsRa48x7DiVblfdzPVl2/yyJO9sw2rW7Pa13sqqfKafNYF1dRe08v
X-Gm-Gg: AZFdTZdT21DolQdXX6tQUFTnuWPlXDasZPny7QWhxdlE6YDrDlLX5RTU49ByN0A02fy
 PuQ25QkEQenaN4u1g1ewE9FCmj/5NhutBGlIGN+hrAPAVPQ9FHIYEBtdN+VTfIuvW5aX1c3hlEl
 twz25nC/wX0JxEaV68XXGar4830OgYWCGJCfnMqN7tKwHmNTZFQE/0SvxMCLbVqNOWknUn6T6ov
 BAofK+lJgOxRIj/ZUOJPgvzTpMDDrgUTzdcnMJ7WwUq3rguwYgvz5HjAaWQiQdqCDb0JqNi1jg9
 6YLVl1WeGZHNoTe+n3JDU/zBANTas6pKwBoOy6Y1ghULIRJa4YDpRZ84q+3a40Ta2aObfhVgKeb
 QJ+kWZo4vpnNBRMRtdONZpl8A7oX0wWg+6AdISRd62BTAspmsEk8PqQIqJxiWUrRomLbJzx9H9y
 RxWmg5K3eG3xM1hLBdSoUNGeMpuREKVCmy1UFGFt7Dim+aqWx3U0OqLV0ei+i/lA3y/LBxd4cU/
 7eUFAHOvm/ILsRabD5Lt3JseR3HA00DW6Cn68CXr9m61FXXOpYyMgEKbGetKVFe7r4Tyu9fTuIU
 aRTpz4a0JyblyanYbUx7UoAt+FqOb81EhcghImEbJaqe9aiuybOEMNEzKDjLGX43NEDJGs1NcP3
 2eBTRekDbaeb8ffIANwcPT6oKa0/IBqVAPnqoS4iMdATlPu7SztzQWGzDZT+j0uCaPLxL9Pj16e
 73Idt5q1twSg==
X-Received: by 2002:a05:6000:288e:b0:4aa:ba0f:c1a with SMTP id
 ffacd0b85a97d-4aaba0f0e16mr1580828f8f.40.1795091736165; 
 Thu, 19 Nov 2026 04:35:36 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4a656b1cfdfsm10659156f8f.47.2026.11.19.04.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 04:35:35 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Nov 2026 13:35:30 +0100
Message-ID: <20261119123532.1749442-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/3] package/openjdk{-bin}: security bump
 17.x to version 17.0.21.1+2
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
 .../openjdk-bin/{17.0.18_8 => 17.0.21.1_2}/openjdk-bin.hash   | 3 +--
 package/openjdk-bin/openjdk-bin.mk                            | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch       | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch       | 0
 package/openjdk/openjdk.hash                                  | 2 +-
 package/openjdk/openjdk.mk                                    | 4 ++--
 7 files changed, 7 insertions(+), 8 deletions(-)
 rename package/openjdk-bin/{17.0.18_8 => 17.0.21.1_2}/openjdk-bin.hash (53%)
 rename package/openjdk/{17.0.18+8 => 17.0.21.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{17.0.18+8 => 17.0.21.1+2}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db542..b5ad45705a0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -657,7 +657,7 @@ package/olsr/0006-build-patch-for-gpsd-3-25.patch lib_patch.Upstream
 package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
-package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
diff --git a/package/openjdk-bin/17.0.18_8/openjdk-bin.hash b/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/17.0.18_8/openjdk-bin.hash
rename to package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
index c2169350c17..74bae4f9dab 100644
--- a/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
+++ b/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
@@ -1,6 +1,5 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  0c94cbb54325c40dcf026143eb621562017db5525727f2d9131a11250f72c450  OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
-sha256  592a6702b3a07a0e0b82cb38aaab149bfce1b0c24d6b57ddb410bd9009333095  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.18_8.tar.gz
+sha256  0b0ac5eab6db6abaec68c9913bcddb31321e5da411c45073d520d9c125e6f7b4  OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 4a21cbb4601..e2f771bdb22 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -14,8 +14,8 @@ HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
 HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.18
-HOST_OPENJDK_BIN_VERSION_BUILD = 8
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.21.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.21.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/17.0.21.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 3f83ab48f89..40879824ad7 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
 sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
 sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
-sha256  7ebfcc2aafd514c23df3fe5280e1a34630b9b1d429c65a80dd5a4b6e7f177bc3  openjdk-17.0.18+8.tar.gz
+sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e1d68e9a458..25fa001d840 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -14,8 +14,8 @@ OPENJDK_VERSION_MINOR = 0.10
 OPENJDK_VERSION_BUILD = 7
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.18
-OPENJDK_VERSION_BUILD = 8
+OPENJDK_VERSION_MINOR = 0.21.1
+OPENJDK_VERSION_BUILD = 2
 endif
 
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
