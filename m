Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2754606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oK0GlknU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsv0toud
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEC06076C;
	Mon,  2 Nov 2026 08:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W98N0omd9Uq6; Mon,  2 Nov 2026 08:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 22EF460778
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793609679;
	b=bT6JfifQtEs8XYKbFIoQzjlBZu+0YUp+ZctB8phAnk2TZxM6j/HUZ9H9INDHH+OYP2ns
	 DBxMLW5QXpNAO2EMi8BfqsetLaTSJV0BQAY5jO6Rm/YGNaIJVAGzhj2dkC/WJaw9HGF9k
	 LmT+J6DXUbBRlTe/AP3alz3Hfimakos/so856l/uIOH29+URsyVIUS8orv06RuVJwpsBF
	 gU84DxjHpRkgoADK6ufhIxlQvYXVLs/arQofdxPRgtQcAKa6/pxUxQbcvawdHVRZTAlK9
	 j0N5dXSf0Vw5DakLIM2NkjQcoZF+46NNu+Wt39cf/MTL6r20vi7OEQ58uZ8m8NN0aeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793609679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=18Qn3mSUtB735q7sBu2Q9ndZfSnmQUJHyooPGv7SVHE=;
	b=g3qa0ir91PZGxZHmTwPD/1W2Ykz4ry6xzq2OkmpBgLmfwbgRX9n3hNuGODXLt09aZkEr
	 tRMG3L3wmkqUULQ6S8cvuSlnyHyhjnA9yMuegRDOGVgf6CYWqeIphPwIPgSpEq3LV3G2k
	 Hm6BwdmiXrI+8d4IKZvq9d6hFtB1Xsa86Tzt402GZygxu8UiReRACPG0m0GvG8fauGKP1
	 j6T/fDKGQiZnKinx5SQ7ggD9BiPU8iMdoC0qETsg15hJX3SKhbc3qFEUvhKiVze7pjz0Y
	 9lm4ZZkwC+hJCEEVHqECw8959yxGzqYX+f07evRpvbp0FDLSpZTdQaD6uAX9t5n0t9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793609679;
	bh=18Qn3mSUtB735q7sBu2Q9ndZfSnmQUJHyooPGv7SVHE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oK0GlknUs7mXYXyNFsHQrvcs10oeOuuz1cWKCtJuUMkzT0EHoPFaPqPiWCWNl1m2R
	 ucbZd3qwQ78U6pXiLj1/+4p9hBBYg4YF+UVzwaaWxaeKtTafQxOgu+WzWR2sivSkdI
	 7feKiPBKF+w9WvVT9aJEZ79vh8SIbX/+59k9CjyEzL4VSTFZ9cOlnOSAR4seMg0ybf
	 P3SWubzfULjKsTOhiwfFWUdUMO4q2bYY+PaUO9KpMjfC+6j7woNZFQXBIrtxJgilOM
	 205snA+YqwrQ92DyGbKicKvgnPlIh7nk+7SwRf7U+G39NNRkOcBwV9pVnGknYWhvXD
	 I3ZuYWTuNNyKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EF460778;
	Mon,  2 Nov 2026 08:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3468E323
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B1E80DD6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIodFa43m3R8 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 08:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62F3880F07
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793609674;
 b=lai343YZlztOjrR1wDgo+jUsKU9PcXZKJ51m2lKFaFxgLZmq/DBYBCnKqDMXx/BO/m7H
 qDdyrr0elSJlj5ZxF5MP5Cz63Kaw10yTJ/zRD8iy86DNJUOQG8zqk9ppiJ/HBQ/Hj+r6n
 eET/qcx8tjqnNG+KsyepoMABCSEVbXwZHZC3OkEyYnEvC3cgR52SRVephnSO2PtfA1JvJ
 +iqv4xUnrDXS9Q5CcW6yzm3fPrjGcHajEETTuFXZN3A3v7vfEn0Jo+pL3+WlYYqMg3WPK
 ZP9hrtgIntOfbHFTi0cNUmUN1jjJLanDWw8Imdlux3uIIzeHfZj1VgyYrW1d9OhflQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793609674;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6H0YCHxfCPkhcaf9WkxGvdRqubmsG4DZr7Ki/FCqUjs=;
 b=UqgsZLO9CnJR/9q64tTX5+1VyVr9hLxrBgIuig84wWLnz813c8PCh8DOEQlhureSSyKT
 YOXErUM0ZT83V1kDAjQR9UF9yoj7EDamK14M+YlIrJpSD24nYy5gCy2zC/kpGdV5iedCI
 J/68Kt3Frmifm0CSI8IyADI7h0fT1t/nnj+G2/VgWskeWw6EiyXmshfI32A47J57oRU2E
 70HhRwyeViOos9oLyb2Y/Sj4qwrHwR+8IK2CCNG5dkCfRTah5xi7571tIKkiT6IwXAyVk
 z1Nt7iNw1PqSssXWp3cjfViE0GNqKCto8d+VCf89+P2h587h2Ef2HNy50LAz9NefXPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Qsv0toud; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Qsv0toud
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F3880F07
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e47347279so1550448f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793609670; x=1794214470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6H0YCHxfCPkhcaf9WkxGvdRqubmsG4DZr7Ki/FCqUjs=;
 b=Qsv0toudPhSfng9Kz/zvcbTl5+SJHmZdQ6HiiPMLNTnxR+osn33ZzjN6GyNGMiaaL3
 9YsgxnRFJefQDBnkIyXXL8ujnnUSSSJ+za3ZbedYWMhCGpmRhWf9ioMI+M78gzwl444l
 NWWcQOjQ6K6XVvcKqao+Pu9VQpVFDzce0VpnwoE7Qiytt+mn2a746eJhfqPHo+qSV+yK
 FvNZOV+PJ/ihcnxxN0oFmtA53VxefVSDrVHbOXtu1Z0Gn0qV/LrZ9pH/kk510BT9Dppe
 5yokG5bVZj79y4VwMHl/ZiNq384NJRSoowFX6/jVrWgBTlzalzY5cfYeJaWCSF8kQxLn
 RZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793609670; x=1794214470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6H0YCHxfCPkhcaf9WkxGvdRqubmsG4DZr7Ki/FCqUjs=;
 b=x/0lPSpoKfM3FRwWn6KFOQ5/zKfERi0wB2GbuvnwXjXxWcoHxnLX5a05/3kTGD5+HM
 i94MkTCZk9j4xBUJuPEiw/ikEldigccXylDvqlklVL2rmNFaKMe2obr3Q/uBk7sfbQ3l
 8wzJQSaLuFhPqpSCNnKaPNovA/nr//G93f42QFAitf61godmLcHMCRE7DH3FvYPV4wL8
 ANPnFQGXvy9PEAkCHw+R+cJXgKCauyD5GdjImB2dvjDProP3IjXiNY18Raeep32oPi2b
 d4x+pLUSRrT46AxQcHK9nbImDs5hrySh+dRbBMfWt3U5gtDzfxahbRBbDDgxLRbxm4H0
 lcDg==
X-Gm-Message-State: APuU4Z9n+EPP7cBDcSIMHz9qVoYs8TDGILiDTz05EC7KvgMuGmVpaVyn
 54+bIsq3f6/JnzkIao3CH/tvYxYGTK9XFZCDfBzvf3JUVQmkinjD1MLbypUgkw==
X-Gm-Gg: AYBFou1/ApJmQAA24pFA2OaLxUmsokA4BNtOB1xYyh5n5I8hCcT6SQG2ToZgHTKN3Gf
 ZOlk0wSVyJv7upn1vxTON3g83hlkBAWFHebdlpwwBgsoWdtQTY+chWj7AEHnilx64HfblgF+J+b
 Wh31GOqEOTnIq9OGYCgR5Vfkw5YtxZdbr1rffo/DrSd1zcJPC7wiMwH2MRYSQWuihUkQ/TViICc
 e8OaN/il+4UoLY5TC1LN+ZFo0qjxXMGagq41sa54YqTMAh3n1ULOdzg659XZFLFHtmuzV+1Veq1
 j5L2ji4Kj+3Xdf2KtboKSUcEczCEBKki8kbw4KU9rsIdur5RywGpGuk25m/z77+SiiVutnoUPfC
 1rEb9zgRSiiyrdCcdOJErDiw+p6yF9ihSOsI7YVKOFcWFE929haGnWKGwselSUpUJ/tg2aFK+Tn
 GiQ7F2Uhmzmpt7QR2FhMt827jM5bDHgVDUMOByclT63K9Q/m4ET8wG4VsQhFROotbSyW/ZKMjl+
 BlFd5gO+V0/fyICrPV9cJZ3j67roagNK02KGoge6/xE2OC/uxhtVJrhjQvGMIYNSFHylz5az1nP
 S0KProcxEvPigj4D7zW1YCk+ZBpQuYjA+v4HpLtXx5Co8ZWWHopFzm/XwKc+vMFSPGJND/HI3Uc
 =
X-Received: by 2002:a05:6000:40d9:b0:48e:202:6718 with SMTP id
 ffacd0b85a97d-48e6e3042camr21825025f8f.25.1793609670198; 
 Mon, 02 Nov 2026 00:54:30 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba53d7sm24041304f8f.53.2026.11.02.00.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:54:29 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 09:54:25 +0100
Message-Id: <20261102085425.2117520-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102085425.2117520-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261102085425.2117520-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/sysdig: bump to version 0.41.4
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

lua, which runs the chisels, is now a direct dependency. The chisels
use luaL_setfuncs(), so luajit or lua >= 5.3 is needed: lua 5.1 is not
supported anymore.

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
Changes v1 -> v2:
  - move the lua dependency change here from the falcosecurity-libs
    bump [Thomas]
  - require luajit or lua >= 5.3, lua 5.1 lacks luaL_setfuncs()
---
 ...llow-to-disable-the-container-plugin.patch | 37 ++++++++++++++++
 ...-only-include-zlib-with-the-bundled-.patch | 43 +++++++++++++++++++
 package/sysdig/Config.in                      |  9 ++--
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      | 32 +++++++-------
 5 files changed, 101 insertions(+), 22 deletions(-)
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
index 2c72431d94..b50741aeed 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -9,7 +9,8 @@ config BR2_PACKAGE_SYSDIG
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # falcosecurity-libs
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
-	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
+	# chisels, luaL_setfuncs() is not available in lua 5.1
+	depends on BR2_PACKAGE_LUAJIT || (BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1)
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -21,13 +22,13 @@ config BR2_PACKAGE_SYSDIG
 	  Think of it as strace + tcpdump + lsof + awesome sauce.
 	  With a little Lua cherry on top.
 
-	  https://github.com/draios/sysdig/wiki
+	  https://github.com/draios/sysdig
 
-comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua >= 5.3 to be built"
 	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR \
 		|| BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_UCLIBC \
-		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+		|| !(BR2_PACKAGE_LUAJIT || (BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1))
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
