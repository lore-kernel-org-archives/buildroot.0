Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEC8606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=srb3f6OI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mzLFWvlH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CDD4084B;
	Wed, 25 Nov 2026 16:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEf2Oa7Quq_q; Wed, 25 Nov 2026 16:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74DB240847
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623277;
	b=ZJFlQd4EDDItfh9XlB8oydptteFQ19/gfDRrvRsPO6G+f+AWuVW+k6bQ/cUNmK9pPqnZ
	 bk8wIEc39rB3AwqEdU2SthC0qWYW3iyt2Xo1d7KV93X619fGNIKShsjH9usKnDCDSAEkC
	 BqcX46TesD01VFbMl07oj6SBeLzMzye3aAqw9KqW01INUB/5ehOdxBk3d/U/IfoG5/VBe
	 AdCyBjVoI32xEQ6jP227Rcm+TljiFGyjDPzelGPEvt2WCMZqOeWzW32C3Fa0CawyCFfb6
	 kzbhS7rv1/T10BNneFx8WyDP2ftRSkUUdDYnmTpKU9ny0LparXJX8MdNKkSOlAAuiNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4NVtpFgfQYIDZMrjGSdBfj8C8uEl0zszyd8sUyVGF24=;
	b=IOGRJgj95BWWP968VVF0nVHWL0e3r9oQzV49a+PNsEfIK21XznDROl9rUNVAZVAiuxfq
	 dsW1TfcqgR7ajtampx4PW0y83OmXMOntOHnpfkaKFJoAycBABgPZgnbbU54+6zkQAbwfL
	 sWO/zRrVF0pS8pmg7Cubz6YVr0TIiWbLRA2RY/Cyk3uoXiVC0DsbeFhSKRKvc6LLmRNBB
	 9bhAxhx2B4/QpPADqr2gvY3z6xD66JPGmj0EkdfCh1iwRvBXK0zs36a8gTt3lWoRgDAbw
	 +KeTY1inTg4d5Np2rOL2Sqxxa9lpo6hG83vrur+J+rDJ3bBi+ChhSQNq+y/WkuOBGNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623277;
	bh=4NVtpFgfQYIDZMrjGSdBfj8C8uEl0zszyd8sUyVGF24=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srb3f6OIxD2vrvktyaKXAvhNvxjpn5WU8Nr9jKm61//kb/F6wxcH2AKMaXHRYrIy1
	 i2EXIW/zA3/EjfwJAs9FtZpxIKlFBzzLwBhyv8xTRzS2ZQpeI8kMdjJIpGDr6G7joF
	 uMWCD3Q8tI6EILbpVxX77R0WEV3xWA/hVLJzEB7rPSnLx5FC359StlBvf7lmawuYMD
	 rtFhBk11cbJkdjkzJNjc9IXUyJX8ZiB2a6uH3bzk8dCGbpKYC9+n3ydQyvHk5eHfDv
	 iHXIaFz17wcelyWDFBGHc1NGV1BCq5MRnmmp9F6TbaTA2rwFhpYSf7qt1FA/7amOdN
	 nA2S1dGZwQfvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74DB240847;
	Wed, 25 Nov 2026 16:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1AC26D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D4580C38
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPLaa6ZvgQxP for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0185780C0C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mzLFWvlH
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0185780C0C
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4bb61185057so38848525e9.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623269; x=1796228069;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+yZJzKxLUpvnEnlTh3Bv5x42z4qxATYR6aGl7ez4qO4=;
 b=mzLFWvlHD5npy30nqzYvWg3yY7mSc1yvRCStE3AM8eE+lbpm8n5UeMSQ8PKHhV7Xph
 LWiwrWf5QGr2lICoGaItvlNUCdKYjP2H+9oIar5iR9n5xsKoNuis/VwXx0FhXCZf6BBA
 //d0Xuc/0iCctT50tXPYJ/3QfgHPMmzqThOcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623269; x=1796228069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+yZJzKxLUpvnEnlTh3Bv5x42z4qxATYR6aGl7ez4qO4=;
 b=cgpyAcKdYfDtw65FQcxZeebJiAmCxU/ewxmypXtuaUKXIL6L/rRlSg/X5pJEF8NL09
 kZJ6nCuRiTQZK+sIycVZox86LG/79uMABeY+5kqyz8GWN/RKT+UfwURo8k5UnNSGJnjn
 EHhx4DubqnAWGRpJ5SGqTLK7NSYrLbWpFzCgVkP0UmG/TvRTE3Aw+rJ/R1NrUMwHw7Hv
 LL4nRDR2OJ9caBYirFx7mO/mg1/yeq1GdMO16Ux5aVv0kOXwo1Et+DoTCW/JItSqFsmy
 M3Yzxzth2uzy7ukzcRC0StyVDwSmd1EYRPFYaFCEonX95NP8N/o82/RdhkchstOzav8o
 Zchg==
X-Gm-Message-State: APuU4Z8JOkibvNNs+DjNxzPhBN3m2c2NUJwMCZxB3KwCfFrvcLMelJgs
 tNg4SXmuGdXCL6N7+0YFVcclS9H1Q6szUMELk7C8A9NpP1eKm4Bdnhmt8ygNMdl1OXhkk3g3g5l
 eJa29
X-Gm-Gg: AZFdTZeq/HrKBi7+NFvQ+6EYUkHdc3otKZ6LcwQ6/itQdBJ+uZCDCQO5pGEDEYq+Zi3
 mdvAYEIkE8Wwck7WqoWnL/dla8KVexdM3TAm/LRTz/MQlSJYXrbAkbxuTLkbu2cRS3EZcBOgRKL
 GKHzFpIuSMvFel3RAGVHKnuy3IKD5TusoKPj5SloOgIK+i2H7KF408ZWiHCB7/K21qzIOImttaz
 iNciZ+IP0b1uD9fpzFi2Hs+lOaX3iLP5iLMFeIenCUnPzzHhLtTqqNz2e1J99G7II+f5L+omF8h
 cDuCv+n9vuM1YAAjxx4qdyJo3kKwWJsgAJGNCmrWl4fS544tLXR1IbmDAxDjGvPxy0U5h0Dl2Eg
 9fIcqUYcEkZ6rMfzMmrkWJ59tp5ga6NhJ43Gjo4TzfShTsG5ej+k8YixoLN7FLxAzKd5wfDOuFL
 IG1g7PlNfn89734hP7n+ySxDjM8vysHJlfdA8fAMVIRCoCp2tZ2gyK/B3ASOLapAVzxIG/LoQWs
 ZD8eCINN3bIGCfNwUFkCXujOw08gmArtuBT2i79LU8nIE0OYwbwCld0+XNPAB/EYSYiqM0kNDQa
 rKRwW5QtfMIOFdiat4LMsJwScyvSw9aCNE91jvqxgc6fQn45aJ/xD19IuBNrP428qWthgN+MCz3
 hP7ztsXGt2ryxLQxWuy/gNI897tVnkFVhDS8HO0ixsGSki6Wkb3Szohf5OE3GyHTe869/uhev87
 tjZ+UCrpRCVvy6kIpHkbp8
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id
 5b1f17b1804b1-4bb8880f621mr393762845e9.17.1795623268917; 
 Wed, 25 Nov 2026 08:14:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:14:03 +0100
Message-ID: <20261125161404.859000-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 4/5] package/canvenient: new package
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

CANvenient is an abstraction layer for multiple CAN APIs on Windows and
Linux. It provides a unified interface for CAN communication, allowing
developers to write code that is portable across different platforms and
CAN hardware.

Project page: https://github.com/CANopenTerm/CANvenient

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++++++
 package/canvenient/Config.in                  | 13 ++++++
 package/canvenient/canvenient.hash            |  3 ++
 package/canvenient/canvenient.mk              | 14 ++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch
 create mode 100644 package/canvenient/Config.in
 create mode 100644 package/canvenient/canvenient.hash
 create mode 100644 package/canvenient/canvenient.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b98c85996f97..88d5ff1b7080 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -828,6 +828,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/bc/
+F:	package/canvenient/
 F:	package/cmocka/
 F:	package/connman/
 F:	package/drogon/
diff --git a/package/Config.in b/package/Config.in
index 03267168a667..76d2743430ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2013,6 +2013,7 @@ menu "Networking"
 	source "package/batman-adv/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
+	source "package/canvenient/Config.in"
 	source "package/cni-plugins/Config.in"
 	source "package/cpp-httplib/Config.in"
 	source "package/cppzmq/Config.in"
diff --git a/package/canvenient/0001-Fix-build-with-musl.patch b/package/canvenient/0001-Fix-build-with-musl.patch
new file mode 100644
index 000000000000..cc8c7cfa0c55
--- /dev/null
+++ b/package/canvenient/0001-Fix-build-with-musl.patch
@@ -0,0 +1,43 @@
+From 46ac90d46b7773a804cd0bbaf71fa487bcc4cca8 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 22 Aug 2026 17:38:47 +0200
+Subject: [PATCH] Fix build with musl
+
+This was exposed while integrating the package into Buildroot and
+testing its compilation with a musl-based toolchain:
+
+  CANvenient_SocketCAN.c: In function 'socketcan_open':
+  CANvenient_SocketCAN.c:186:24: error: storage size of 'tv' isn't known
+    186 |         struct timeval tv;
+        |                        ^~
+  CANvenient_SocketCAN.c: In function 'socketcan_recv':
+  CANvenient_SocketCAN.c:364:36: error: invalid application of 'sizeof' to incomplete type 'struct timeval'
+    364 |     char ctrlmsg[CMSG_SPACE(sizeof(struct timeval))];
+        |                                    ^~~~~~
+  CANvenient_SocketCAN.c:406:28: error: invalid use of undefined type 'const struct timeval'
+    406 |             *timestamp = tv->tv_sec * 1000000ULL + tv->tv_usec;
+        |                            ^~
+
+Include <sys/time.h> to fix the build.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/CANopenTerm/CANvenient/commit/46ac90d46b7773a804cd0bbaf71fa487bcc4cca8
+---
+ src/drivers/CANvenient_SocketCAN.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/drivers/CANvenient_SocketCAN.c b/src/drivers/CANvenient_SocketCAN.c
+index d4db584ff51d..fb356b8f227f 100644
+--- a/src/drivers/CANvenient_SocketCAN.c
++++ b/src/drivers/CANvenient_SocketCAN.c
+@@ -20,6 +20,7 @@ void socketcan_close(int index);
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <sys/time.h>
+ #include <net/if.h>
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
+-- 
+2.43.0
+
diff --git a/package/canvenient/Config.in b/package/canvenient/Config.in
new file mode 100644
index 000000000000..6989bf496ef3
--- /dev/null
+++ b/package/canvenient/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_CANVENIENT
+	bool "canvenient"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSOCKETCAN
+	help
+	  CANvenient is a portable CAN abstraction library
+	  supporting several driver backends. On Linux it is
+	  implemented on top of SocketCAN.
+
+	  https://github.com/CANopenTerm/CANvenient
+
+comment "canvenient needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/canvenient/canvenient.hash b/package/canvenient/canvenient.hash
new file mode 100644
index 000000000000..32b5559d3503
--- /dev/null
+++ b/package/canvenient/canvenient.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dae4c0a4b6a2b62220341466509a57d9a10ee5cc60be5a2def42d0afd345dc41  canvenient-1.02.tar.gz
+sha256  877e5e09cf4243583c7b0593d1453343f6e8d67977e3e4e97ed001dd0856a334  LICENSE.md
diff --git a/package/canvenient/canvenient.mk b/package/canvenient/canvenient.mk
new file mode 100644
index 000000000000..68b5af3dcc4d
--- /dev/null
+++ b/package/canvenient/canvenient.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# canvenient
+#
+################################################################################
+
+CANVENIENT_VERSION = 1.02
+CANVENIENT_SITE = $(call github,CANopenTerm,CANvenient,v$(CANVENIENT_VERSION))
+CANVENIENT_LICENSE = MIT
+CANVENIENT_LICENSE_FILES = LICENSE.md
+CANVENIENT_INSTALL_STAGING = YES
+CANVENIENT_DEPENDENCIES = libsocketcan
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
