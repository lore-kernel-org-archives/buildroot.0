Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88205606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T4ReBHfn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8n1m4nc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BCD605E9;
	Fri, 30 Oct 2026 13:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ3yub4JqsTp; Fri, 30 Oct 2026 13:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5661560AB4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368774;
	b=c68UJE2GB/f6Uz4aFhrsFXRih28ewtEn9o2hfIZghjhEb0ZEomiDGkJCTzA/Fxo7V7/g
	 ljHSkIi7QdH5lehFKjyVGi8/Hw8Ox9Wk8U753nVGnz2BJXi/P3c4TqKr+X/iMCbTs1vfx
	 /j9trI6MACLj4LTddOX7noE4SXgar+5rIXe3IPSPw6Edu8gVjz+K4omJ+5Uw92IMpP194
	 +V0c0on3xFg7R7+kdDfPDSLgHVO35/1+UiJLdifYTdddG0NGKDQ6M1eXArSqcg71GSr6K
	 3OSJye0sdzH/kwFHW83uYljhGb8aXp1HWLk3Y6qn8AQ815Tqf8jovSJj+588diV5PyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Ymc18u4nbhYlHAuSiNdbr1Avm2RFUG3cxOgtU0ggDKs=;
	b=PhfMabHh2MRtGYmnyHe8tFc5Jk172egHIUDN5nIzgCwVjYzUayCXt8yUY2t8k3ijpSV/
	 7KwXhtVvxWwKOyYpCxMTkU1oaimsH318DpG1CKKEjzsVrRJK9k2zKRul3Sfme5z3UWH+c
	 fq+yA/aALFpfXzw3PffE0xRFzrRc9hd3KOnQ/oIdENa6cDbdWsZSTySEKewUAnO5X6a18
	 JETKp+EMRpSPlxlBaD92InkgXcOn9GIcl8mBFg2ih8JUj8RwCRnOPRFtGTbgYMF6d8CBd
	 x5MenSKJUaOvRDq0E699ae/DKZsBw8bQEDSfZHVG/y8Gs2xIf+KUm58r0zxSGSPhTmw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368774;
	bh=Ymc18u4nbhYlHAuSiNdbr1Avm2RFUG3cxOgtU0ggDKs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4ReBHfn9N+yHGE6MmRwi02jPZzqpCIewqyVIPcoMnMTway/n7BVkotW4che2dpXm
	 yyN3DVXQSC6nXsvbRW3gJoGKNV2ymPDhDywraOfrVH/I2OIGxPhdH62zxGpd8dmG9X
	 riIn7OHbbSVihHsIKpvwExaIlFEWdFzQZitfmJWZNPZLrbIKgOv7CMq6NSc1CBdcYp
	 AiuUbxAPss6ZLnDq8jA/fmuG52iey027T0AewexT4eNNVQcf82VMEUMvzceGGnIScA
	 vaqyCZuJ/1+JQ6lS4TvyYUm+adui9O6vfOF3BFauzi2IumTOxeI5cYP7dk3TZLOZnl
	 nvFjAc7In7PIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5661560AB4;
	Fri, 30 Oct 2026 13:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8A84BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B9B40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pk8n0HuLcUUO for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1C81A400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368769;
 b=OypUTCa9unPuE+I089683ugI6bN86AWF/12DBsIUlbT4EdyECcNXjbqNVC7enux8EQKm
 wtZB/9NqvYVtGxArjlyoGiDT012u8c5+tH1gisnoMuKjp+aM3Wgdf9Zrtof+obpSj/GmE
 Ez7o10OeSogB/CUfX1ZZw0Qgf9jQ5QfzeO/RAD5nR1kW1He8z+ciJrXtq7Nb2YnjwdeLG
 vEPH2S5B1IAL11nkRYs/u4RcY73jOpDhDIDhA8uHQFq/SVskih8QP4ByJoV/2tLfszmjG
 p5gOaGgsEaPdquB6ErtVbwhNuGtEokUamsVJ77cGDPo0TAk20mroMLfYk+r1TeQ5pIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368769;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=IeY6Cb84TWA37KhKvSKU06d2yNV+nANEZyTP45Qm4wLbeZrEe424UX2tUTfbgm9/2s5k
 ZiEs0B8wAxreAf9ZGBg1rxc6y/H8lJO2JgSlNft+P9MUiGBqOB9BdnGmhZ3WSbmWyvDMT
 Cx4NgGf8Myzt0vXXuRGSrehIOCPiRwQiAzLjH/LTYwe1qx2iM+2csnYqm3044GIBAUMaf
 mzUexPeAyVgeKd73O9WP1GVBV02yfAUGb7AeDmmmp1ewr3xE1n0LnjqqeGsFG+loxift4
 MD5ENpybwYv3cvF7aPjgBsH2JN3Gm6PhTEzBWT7ZSR74RO4fJFd0MYGLo4z9jYLGisw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=I8n1m4nc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=I8n1m4nc
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C81A400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so7527645e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368766; x=1793973566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=I8n1m4ncVW2FA+8W30CsdJDu3eWuVi9zfuPqsPV+mdJdWhZvEhqO+ZvJN2MuwHeMV4
 nVJAc5cTVFS+gNMq3fJgixIwGvKsSJVO9DJCz3rM7I7lc+83d7GHnakIsaZMgDQq2vfw
 xkryzT+8uZzTw9GoLlb9Ei5Gi6iypLZZllC0XmAH8iIgfj8ytaAGmYYc83uZc0By1tsT
 tAdT99M5Scv2JBqeSRsyIQ2cEUcarmAbWkjKmvIC+jEFSxr9mDyr8V0nELwvgG7t+wW3
 S16X/LhqcFY+7TXoeTG3v29omZWb6Be9a063hUcHtoEjONS6TxBPB34LYPkZE7JlsZ2+
 HlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368766; x=1793973566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=v8vP+c1e97LapuPrh9zQZMBSUtuFz0GDbjdy47s6eauek80vyZYv2pWC7sqXw5nCb2
 z1ozDn3V0GqQXBhhSTkIUe7+MEodHqsohea9oIv0TJM3b7qbsUv8vJ27uMmTCSMHBY02
 zON6o7ExLyo3IrPLxip48jpFJEjZ88DRz6m2cEdE1m9YP9rJnhyirtJzVTaeuXc0sqFg
 xW2Mrl4KF0Ysylp79TVLSPnokp1DKkG/SZQDUdpIknYmEMKDqnZ11xJ8G7WUUOlWjxNo
 jeVzxemHpyvGMhpCftIh9enGxtgd1Ac59Ztf/azAZwMtOG8bU5l4+tqcuqCyZzHB3Wod
 xv7w==
X-Gm-Message-State: AFq9FYJp6ATl7kUxPinrtbmuiUC+pCbdymSugdmPkWKwZp47P9OcUXrO
 o69ndjdNoEzD0QAOXHYoxCez0ZgIXi7U+zcU7CN/XpckLMPHQtnQMME6vT7/Ew==
X-Gm-Gg: AYBFou3vbt724Iy1I+z7Bi6OuddXuQ7KcCuVx+oD8LqLk9gzKn8JPwCFo4A7BKyGneu
 JQW7PxkJKJwj7fuQUQcmRc8GZ1KxsMUuDQxlUZ6Sg9PIljZfZshwyyzSyK03vla3nSh3zZOSRXx
 e34dTbLwgTF4Iom9kG0oj7epWSjW0uaF0N8RyVd8i/+3TcVY2gUbwmNrEgqRLn1sqiKEzmBGoUV
 9VnSxx03LkeZYQRMzGTNyCwD1grgU5vyBYRYSk7pZVqpHbNpwrQzdGFkVuIeJd1cbMXZV/I9h0E
 mq7SSWqlomF/JKOAlfBlPDr3jxxpJZu3pcn/jyhUP/hzX4/Z6JIVAHuViqNpvSkRxzP/iXH3+Q9
 ZlABFhgtMiUi3d9/l57BZlbIAPocDzbLsJCNDIpkchP1hb1pDzWgi6tOnFRKyazf1cVbz6JU8zZ
 Xiu9DsVctYR820bzOQ9SjJvp4t515PcZLg+i9S5wLo3IZVKVwDfuNZfiNYENFrI9ezLW7fGReku
 wRLidMXfWeYbYEkdoRgDVL7tw3dkIm8spj+e2BVkXiGv1+dnpvD2RoIru0CbueytfjskxvEDuXt
 +pNg30s7g0XGULL6X63SDT2Z29g1pNz8AuVmIs6CtK4Vl1UjPcxeAQ==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id
 5b1f17b1804b1-4ac17b2cde9mr59143595e9.7.1793368766312; 
 Fri, 30 Oct 2026 06:59:26 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:25 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:12 +0100
Message-Id: <20261030135916.3599219-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/9] package/sysdig: bump to version 0.41.4
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sysdig 0.41.4 needs falcosecurity-libs 0.21.0 (whose driver is the same
as the 8.1.0+driver one sysdig requires), and links to libsinsp through
pkg-config, as supported upstream since sysdig 0.40.0, with all the
bundled dependencies disabled.

lua, which runs the chisels, is now a direct dependency.

Patches:
- allow to disable the container plugin, which is either downloaded as
  a prebuilt binary or built with Go; it can be provided by a separate
  package in a following patch
- only include the zlib CMake module with the bundled falcosecurity
  libs, as it comes from them

Release notes:
https://github.com/draios/sysdig/releases/tag/0.41.4

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...llow-to-disable-the-container-plugin.patch | 37 ++++++++++++++++
 ...-only-include-zlib-with-the-bundled-.patch | 43 +++++++++++++++++++
 package/sysdig/Config.in                      |  2 +-
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      | 32 +++++++-------
 5 files changed, 97 insertions(+), 19 deletions(-)
 create mode 100644 package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
 create mode 100644 package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch

diff --git a/package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch b/package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
new file mode 100644
index 0000000000..e13ed4bb65
--- /dev/null
+++ b/package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
@@ -0,0 +1,37 @@
+From 64f286b765da1335369c3d27fad298f0b3f525c5 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Fri, 30 Oct 2026 10:15:11 +0100
+Subject: [PATCH] CMakeLists.txt: allow to disable the container plugin
+
+The container plugin is either downloaded as a prebuilt binary, for the
+build host architecture, or built from sources using Go, and both can't
+be done when cross-compiling or without network access.
+
+As the container plugin is only loaded when available, add an option to
+not download nor build it.
+
+Upstream: https://github.com/draios/sysdig/pull/2191
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 68344a3..9ef0f9a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -163,7 +163,10 @@ endif()
+ include(falcosecurity-libs)
+ include(yaml-cpp)
+ include(nlohmann-json)
+-include(container_plugin)
++option(BUILD_SYSDIG_CONTAINER_PLUGIN "Download or build the container plugin" ON)
++if(BUILD_SYSDIG_CONTAINER_PLUGIN)
++	include(container_plugin)
++endif()
+ 
+ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	if(NOT DEFINED DRIVER_VERSION)
+-- 
+2.34.1
+
diff --git a/package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch b/package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch
new file mode 100644
index 0000000000..e4f580dbd5
--- /dev/null
+++ b/package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch
@@ -0,0 +1,43 @@
+From f61de224af8121847cd3aa9b1745b87fce52e351 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Fri, 30 Oct 2026 11:05:48 +0100
+Subject: [PATCH] userspace/sysdig: only include zlib with the bundled
+ falcosecurity libs
+
+When building with shared falcosecurity libs, the falcosecurity libs
+CMake modules are not added to CMAKE_MODULE_PATH, so including the zlib
+module fails:
+
+  include could not find requested file:
+
+    zlib
+
+sysdig doesn't use zlib directly, the module is only needed to build the
+bundled falcosecurity libs, so only include it in that case.
+
+Upstream: https://github.com/draios/sysdig/pull/2190
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ userspace/sysdig/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/userspace/sysdig/CMakeLists.txt b/userspace/sysdig/CMakeLists.txt
+index 4acbb030..416b8f83 100644
+--- a/userspace/sysdig/CMakeLists.txt
++++ b/userspace/sysdig/CMakeLists.txt
+@@ -20,7 +20,11 @@ if(NOT WIN32)
+ 	include(ncurses)
+ endif() # NOT WIN32
+ 
+-include(zlib)
++# zlib is only needed to build the bundled falcosecurity libs, and its
++# CMake module comes from them.
++if(USE_BUNDLED_FALCOSECURITY_LIBS)
++	include(zlib)
++endif()
+ include(luajit)
+ 
+ include_directories("${PROJECT_BINARY_DIR}/userspace/sinspui")
+-- 
+2.34.1
+
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3c96bda73e..5dff37251a 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_SYSDIG
 	  Think of it as strace + tcpdump + lsof + awesome sauce.
 	  With a little Lua cherry on top.
 
-	  https://github.com/draios/sysdig/wiki
+	  https://github.com/draios/sysdig
 
 comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index cda3de5e7c..4a55afe1da 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
+sha256  36daa6a06705569fcc9b0579992e2457494003aea0065eabf54b3e16d67511f7  sysdig-0.41.4.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index bafe534a16..d04f67a97b 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,35 +4,33 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.29.3
+SYSDIG_VERSION = 0.41.4
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CPE_ID_VENDOR = sysdig
-SYSDIG_CONF_OPTS = \
-	-DENABLE_DKMS=OFF \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DCREATE_TEST_TARGETS=OFF
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 SYSDIG_DEPENDENCIES = \
 	falcosecurity-libs \
-	ncurses \
+	host-pkgconf \
 	json-for-modern-cpp \
+	luainterpreter \
+	ncurses \
 	yaml-cpp
 
-# Don't build the driver as part of the 'standard' procedure, it has been built
-# by falcosecurity-libs.mk.
-# grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
-# one there.
-SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
-	-DBUILD_DRIVER=OFF \
-	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
-	-DENABLE_DKMS=OFF \
+# The driver is built by falcosecurity-libs, which only supports the
+# kernel module.
+SYSDIG_CONF_OPTS = \
 	-DUSE_BUNDLED_DEPS=OFF \
-	-DWITH_CHISEL=ON \
-	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_SYSDIG_MODERN_BPF=OFF \
 	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
 
+# 0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
+# The container plugin is either downloaded as a prebuilt binary or
+# built with Go, so it is disabled. It can be provided by a separate
+# package in a following patch.
+SYSDIG_CONF_OPTS += -DBUILD_SYSDIG_CONTAINER_PLUGIN=OFF
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
