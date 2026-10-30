Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034A606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j9ETc0zO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVVmte7h
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34756087F;
	Fri, 30 Oct 2026 15:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luOYlqPHeHuc; Fri, 30 Oct 2026 15:24:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95D3360A90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373892;
	b=e2s0+ZyN7saWcKvfraJjUUS3ygRhgrXh7ExBE4iB3MDi4yQuNsPA+pIHHGlHMvz6UMhB
	 yTsWTCx09G6mfDKk7QLxoMxOibUqhQBKYHMByEkCoOZDhD9SdZ6sior8ZTNAsTPD3WuF1
	 vHxHMKjtemglR3Mqz7qkOlLoUx+Aar5X/mToi4JpbFGN1yifAGBVDn3XsFsUdvIi2Pfxk
	 ZPioV/9E4qDfiFLAJBoBg2GOxxEVNWgUB4/0gEVQQBSnn/7efx4SPyxv7wqQmeE9yrO+e
	 jWTRHbKzZ5dnWB7xdz3hyW25uu2JGqt/O6BimEpwEMUO0qBHxTEi9CchslvBOUpQZrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373892;
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
	b=hy7fvXDV4FznMIDvyqP60oB0GP2aG10zmQ/O3OaGZM690gyt/oWdEWuPJbCU7LzEZWGx
	 2zAPi0WC4hwc8YY/7pEmudcYhUEozqvCpnkCqyd/F6D3binkyFI22MoKW9l6/ozQxh8Hu
	 aALT6Am5zefX1CFtDkS9Sqi0js6tJahpXb0NfELBGkD6XBVC9C1N6/ybCwhZVHeJqyX2F
	 SWYxUWvcNQodTe3C4y4aBFQ9Ewfx085yH3al2lwjxWNXSXbv56v2k86mAT5toY68q1vzz
	 F2XEtLtWAdHgWmRbzhIYMB9Igo6amBo3nZ0sxXy/IeuoASS/aHKes6yGRr9OZweQmXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373892;
	bh=Ymc18u4nbhYlHAuSiNdbr1Avm2RFUG3cxOgtU0ggDKs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9ETc0zOApNxAUXh1NkjARxV/pPHHb3vQAw0HMGEWUmBL7Xs0tec8XPIEj8H8ltDo
	 7h2F+yR1ibzol7oRFv6Fbr3NjTw1CS2J2+Yra+3kN7tSnWh/CjYLOfoimqH6FU3vxH
	 yUmpfBqCGH/MMFo/pIBgS5LwMsGv4/rwzRF/50Gs2go2dBZCuDriqL9LB9DWVazbH/
	 LuiXr3bFfg8++AQSQW+aHjCSANBpGmpQuFgugUSSf6gVG38I08MKTpZUlCE3abWWAG
	 QzMv6e0U/YXvouVIEFA2QCgHISf8M8U5MzfvfwbI9oVn00Ghb5M4ZTabaI7Y8DrWfV
	 Uwwe4jPhTGJUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D3360A90;
	Fri, 30 Oct 2026 15:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB553AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30CED40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk_IVn4awKLW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BBDE540211
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373886;
 b=QF5q32D5AE6CYue4/KTNt11YWqr92FBQNDj7JcNbTX3ZTsaem1E2ElSpwIMKBNp6Atbi
 ROKmDaPAxw6lmML9GGSXKRw4nvi+otRRKv6+0azSCCE0xcHsSF8n0fOAzhKy0xvnrTx1i
 bAMuvNxOenkXplHeen+0n0HM7qFvVOic5ZL4qmNFsqBWCHyrkjpQkqKmrn7QAyp8jq3hh
 657hUbz26T+tzK5HQJ5oiOm4aIyT+CtT+0UbdiKBBc47GQsokTVdgY9wlJWNlACJBEZz+
 gxvNnXN6ZFpv6vSoUbFDQfKOUCU5mxu7XYGl7nVntBYMQBbVmjWZQWUoR1gcGPP7ezg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373886;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=Qm8tX0Vy2IDFFv4wduV0SDOSlnzSfqcISCdh8Uy9gQzx0jAext6Hi874VE0KbIaUtEUh
 IpPx9a0km6CijYtNU0cGa3veqwjEztk+XRyYoC8Tb/b7OmIelivJvesDVnAAobcd9ZFKy
 3HKJddX3iJhRaG0iTO6JBZau11xnNZH6/MenxyxxRsKCnFUTkEcwyGVjtYADv3GCeCo6L
 pEGhlf0Et3uH4ijssYVbo5Z8oCpSlueNPHeYp0jt55BBJkxYauzvvzFv8lUTzbqDT3PjS
 8i7jyDDvjIO9i4kJJltrz24uEqfnIdi/FCU7/nzozzHOGPhWLSXbYMJdRHB1ccY6j9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=cVVmte7h; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=cVVmte7h
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBDE540211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so719665f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373883; x=1793978683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=cVVmte7hUgzIP65S/XnJHn/vghTK7/HyT6q00ZxN3vxENuy4x3rZLJznDOeIN6FHu+
 HNpWRqYEO2iHQAsg7xYjK/sjjVSgidtl39OI7Sc6Zx3EnOs17WeGlmBtIJsutHz9nlbg
 mUeR8HYGh0xUVSlnxurxR0d3hmLvWrYxHkXyNCTtZxLp05tyKdJzl29i/8qCF3k94rQh
 mUVCZhs71TqZlm2YENKYqTfuArpyJlZ6v6y+EPEPqTdC1HOscEqrYDhRf6sop4GVRfIT
 8db1Bnx6iZ41Jq5pP1Fo+5NWeh699MrcZxZUjNqFRzgRghKt/YRzdCfIFB8T6z1k3vKx
 9tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373883; x=1793978683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pAC9FIy2HzYSBijyCsCo5z8td8UhdDzrOzh+xU0PdaI=;
 b=CLQLHo3regVon2GPUL0PecEzX6pFucChAwdy4XO4x0XXyX3rl4Op7zWP7nEM6BU5aK
 W8jto81nZrntQ2S68eFXNFdoHq+b5iK7Sy6nbvuiigrLC8+hUECTiip73ikm/SQUPmw8
 yRBD3vm1D5kFCO4U9V8ckmOGKWhRueWNzpzmC7YC+6peYzes+2roS6uoum2TjtSWyUnE
 2uAgCfiqOhEziOF03LjRVrLtlz8hMfOqtTxE7dZ3Yz1t81K6CkISlh3Qk/QlMY0a3boh
 h43IH9h4QEbuqcSZxXPJFelU2uFgH5wRmn9Jk6yQLOMm8/c0lVPp2sSCP9KyJDtzZFla
 6k5A==
X-Gm-Message-State: AFq9FYLV4Nus/1Sh50jeNF56h4fevB9yXSs6OXES3CwsEyTkk0M6lYMe
 KA9VhqACCobh8radMOMosBdJN9e/aj/Mi8bnowdVj6Guaqu0I1IikujPAOUsvA==
X-Gm-Gg: AYBFou1+kv+8G5bh5GjKKieiZnN3/lN0iP+JR0lwvBwIIVHl2n7nyLdY3G5j4jAL66t
 TkySMK6p+pxjOrXvB9qkIekJZt8wOCsS7jVgoaCK7t1c+KyxCZB7lMJNVLx8BgBQrEWVEbuzHyO
 ftmi5bwSjzJaS24ch4PZNbQWyvqy3un450e2Ob2uat+qZuP/52yUcMoEDicbAyyiayBXldrjnBw
 5HqwKSYccFbwtFc/Y6B8x8Aq95C8pSBx4Hggbpv2TKTMzHiXrcsSEzSau38JO6f3MQXIUi8/V2f
 JPgEl5T5vCqVanhppb0aT8XA9ElLhi3QKtWXJ++tx64PLMG+ieFGA1B8GI8YzVdL1WfVO/t2s5L
 CStXaTI8bwZwQv013GjKmCKJeMS8pyHYoAZrwz3CqkYeb/6yXr1htQ1zznMwnKOPYLY9+V1Ki2G
 N/hfqToZaIkwAopXDQrmy1cnDKbPHcQBDL3M59QW/R99Oai8chADp121RhtZdhu4VIdx4azSmuI
 nj7CGhrmWDi2vOI7qP0LYf50mc2wehM858L7yVrr/+8FZYCvMnYTWS0nbFmgZXtAWuX4Ws8asEx
 QEjCj076uBjWrQWQozqLhQp5tevy+k4juXYRfTccCpUTwiLxWYRhZKM47/0T5V4hGeDeTQTY1RQ
 =
X-Received: by 2002:a05:6000:160b:b0:48e:7476:9205 with SMTP id
 ffacd0b85a97d-48e74769219mr1685838f8f.31.1793373883327; 
 Fri, 30 Oct 2026 08:24:43 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:42 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:30 +0100
Message-Id: <20261030152434.3738285-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
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
