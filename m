Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA71606A326
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OFIoUMgo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CF960D86;
	Thu, 19 Nov 2026 14:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jh0n-P3APeXF; Thu, 19 Nov 2026 14:02:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BDDB60D7C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795096954;
	b=BBEgR0CzQ2GnuoMvcMky5Pr09BFbT39V0bp0jrpbgVFk7Gwnjq5AIYMr5NUjn1qR/f7U
	 cCVNs+cStpeJbCPZCj59TILUlhSo56RhTo0kvvG+QkqK3M6n76gbv0LqGbgXfFfwtzaSu
	 6k+7iOvyA2Q/lHcXoA26HquXUggQ5KiQkzrnW7NuvVyPo5Dcow7SfL2WrIAjDM3MTI/mK
	 OE+2jcs0nGxQl8lePl8ovGcELSPgCMdBm/3I+A00IhHGpH41NSXQV33/0qPD2NdyD+gzd
	 myPq8oAI+1lPR5pKE6gUo/YccwlxIcAJ2w2ArARmUUg5ym7UKtQ3ym7yxqfhJabmZkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795096954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dITJkesUkcabMmQZZJGO4LgTH2n6O6KPpBa8VWgUw2Y=;
	b=P2iErh2FNM/cVzjDh81LsavQg0wYt3PdnwahZX5lO4QEfJayyxF+96ZblVlfNpFSn5m9
	 f0uGvmU/iRqKPoz2d38JucsyYtQwdMCns6OXp8a/SdbUmbO8xPNRUcKt7rDh5WTSQl2Gs
	 /a+9Xk77Vpphpfl9x7kWsVhMQIaAORwDObiAwOCxq8N8u8PVLfwL2rqBQlrMsXDvizGmF
	 gxm5F+qsFSffOXnyAKPjh6lQYR+OPHWD3L1GbLPmr0C+i2ZOquNzu1Z8RewEJlR5qzpQD
	 48L9ctrLX1O+s5hDCT382FKEPUnKNZeCzvgtYKZhRIBKc/QXIuiRQustladHgsPGmGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795096954;
	bh=dITJkesUkcabMmQZZJGO4LgTH2n6O6KPpBa8VWgUw2Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFIoUMgoar0pbL7SedbeE5tXvHFV6uiySBfmk67ZIsK0Sfdgb7y+dILyYzFfxbb9G
	 pTl1ukMMpWq7NH7fCEnecgBukEKyMgA5CvCEcgMjyvesw0wemSlREqNK6MhDP4F5Rt
	 ghmEFMiZmofJgMHkeb5qFfAVxqfZtzwlD+j4TOa3yfNyOjYJwWl5JanvtJoFlselqa
	 Ukn5F5xYWkUHp+SOcqoaarVaDL73X/QpDQJptUKpp/zuwtRv0IA81mxcApFx0HlEew
	 LTFJ+S/7TwSmllHa2BesPO9o1Z1Jy7IO1398f9Njpu7Yk+MdUtJoheP8baYSyA+d3y
	 b4dF1E9bG2NOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDDB60D7C;
	Thu, 19 Nov 2026 14:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB1791C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCFE04052F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp7P8k_8EDws for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6A2FC40540
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.221.45
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.45;
 helo=mail-wr1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A2FC40540
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4a3e706b5dfso1456128f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795096948; x=1795701748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ympmRnsvQiopn5H1qJ+VwqroMmVZiJYVTDMU/9owQsM=;
 b=W5/h48EX/rpeQV9QPeajbCUHGgLlOGVWm7vrmYTg3/KTGd+5k2sgIxnD79MBdQp/7y
 wmLH1c2fG22wFVAn4AiRly53mW7EDLXhlb+oT9a/ZSC9yDUZ0RO0e1h549KtmeYUgrzC
 8hyU6xq8lvwjGJoSMxfltyiFRajG1GV6qcq0c02o6iJ0EzZZOgt908puhrmIHoHXs8m/
 ae4gN8Q0fK6pjnqfQj2X7as9Tnz+pYkijVHKoJMxUh/RtcqLqBhXCMdOiB4QYTeJO7+p
 /Xt1AyJ7pwBp94mBA+UOwEduz8KydNqxWYBc0nrZ/pnlfBW+p3qaJn1T1lHGJi0KwMZp
 RCnA==
X-Gm-Message-State: APuU4Z9cTwLuaGQE1fZIBIaR5Rp1YTveilUbvTBAECnfgoMNpohG/4gw
 R701ulGqY1KjbNV7/kfsdZNk4kqF1PbP8IR+Wke+B50BOqWA9n5KjtnH
X-Gm-Gg: AZFdTZcSg2RkrnR5BfbRHkcqMenl5wH7jsLZD7890l/T211T1HzKdnMPSjuixaRFCMh
 7SoMMRL/w8CpsU6IXzDv4VNg56d47/4dWPvuC/WE+R97+u/TEf610Wq9zbcGUZ+0Cd4sppi0J5n
 WUyeJqSSxt0Rfzb+NbJU+dwj3qi3wph0/gKrgBDq7ZiFfOTm/FZvYzTu62zGSO/h2TaB6uGV19b
 SgS3WlFQhl61Ai5PN1kAOlJk9B6mlc0jHdVEOZlKeh38inuQ6yffoz7pWbEjQze15ffUJkIJnO5
 s6q7Er+cfVtfHebbL04W2q78hnhslft4RZBJGn3Zz6R8A84EOt9R0BNohWBMPA7ArJH/DLBUvBj
 rWtAtqJVGJCYyrl7BCsJQZRM4IxI2uZ8WhTgzH55zfi9p5tlbzYHpMyeeyE+BEkgl0r3ZYq5xJ+
 4Th8SwmHPY3NMk2rl7QEDWgpHxvSp3x9IT0oiMFw2ZZoZ/xAjjmAh+FN6GQlqNaHfI7PiNO7rfT
 SLMx7TDveEK1c/HXs3meBKEU6RR6xXQB01zpCV5XhA4E+yLfGmZpZYqjoan3BXlL9xn1LxXcMJB
 y9gN1EAeYvXB04Aaf0l3w/OFe6FKhdtknbu5Gcjani5ETXw2MPSEo7O+36/YeYbcvja0m/oFMN+
 xA0DkEP7vu7GaFgNAEFHk2IS43Oh2/gUSIhSbLGoSUyaXGZ7LkXMdHu53qH6ntlEHff9SrLPeMG
 zd0h5YRc5qHQ==
X-Received: by 2002:a05:6000:460c:b0:4a3:976e:27a2 with SMTP id
 ffacd0b85a97d-4a63cb246e2mr12856026f8f.34.1795096947688; 
 Thu, 19 Nov 2026 06:02:27 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4ab5539af30sm2696f8f.41.2026.11.19.06.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:02:27 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Thu, 19 Nov 2026 15:02:22 +0100
Message-ID: <20261119140223.1968045-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119140223.1968045-1-thomas@devoogdt.com>
References: <20261119123532.1749442-3-thomas@devoogdt.com>
 <20261119140223.1968045-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk{-bin}: security bump
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

Temurin does not provide a glibc AArch64 JDK for this security release,
so use the matching Amazon Corretto archive on those hosts.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
- Restore AArch64 host support with the matching Corretto archive because
  Temurin does not provide a glibc AArch64 JDK for this release:
  https://corretto.aws/downloads/resources/21.0.13.1.2/amazon-corretto-21.0.13.1.2-linux-aarch64.tar.gz
- Cite the Corretto GitHub release page in the hash file:
  https://github.com/corretto/corretto-21/releases/tag/21.0.13.1.2
- Cite the exact Temurin JDK checksum sidecar:
  https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz.sha256.txt

 .checkpackageignore                                      | 2 +-
 package/openjdk-bin/21.0.10_7/openjdk-bin.hash           | 7 -------
 package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash         | 9 +++++++++
 package/openjdk-bin/openjdk-bin.mk                       | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch  | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch  | 0
 ...onf-libraries-drop-the-need-for-X11-in-headless.patch | 0
 package/openjdk/openjdk.hash                             | 2 +-
 package/openjdk/openjdk.mk                               | 4 ++--
 9 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 package/openjdk-bin/21.0.10_7/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
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
diff --git a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
deleted file mode 100644
index 8d9efacba1f..00000000000
--- a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://github.com/adoptium/temurin21-binaries/releases
-sha256  ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4  OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz
-sha256  357fee29fb0d5c079f6730db98b28942df13a6eed426f6c61cd4ad703ab27b9a  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.10_7.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
new file mode 100644
index 00000000000..f2b6e8f4fc1
--- /dev/null
+++ b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz.sha256.txt
+sha256  bb8a93f9ae6e7a693b2b721e85dbeff26ae1a77447985a8d7afcdd9c7cf6222e  OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz
+
+# From https://github.com/corretto/corretto-21/releases/tag/21.0.13.1.2
+sha256  55751c47c7e3be3b33af43ccdcf3a6f4814d308390b7400477594d421bd16a53  amazon-corretto-21.0.13.1.2-linux-aarch64.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index a0206010f46..2da773d2e8b 100644
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
