Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF57606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ItY4XVEE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rR/o7i4d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7367180E33;
	Fri, 30 Oct 2026 13:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7fAIFBox769; Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6CD9E80E50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368765;
	b=DH5AgPqWeDZ9SC7p+W3msMOkgPf33kQj4wLzSyf+w3FMGIzh+gmjHfpDsFQxREutP7T+
	 3Q1KNwW/902Z0I6/CY1rEm0A0wp4zTVvvpfqY4Zdsfueg75Qr8o2oBTSEN6/37NJ0H1Lt
	 B3R/Iz169r5/U77IJzYON3olye/+wQN3RR0/DBt95aYWeAq3Zk40a0T69uwbhMFFmGBxM
	 zwuRh0JzNw6qo1UssduNWC7f67HvwWDP/WnCenetFuYpxut9SKdPRHr0fI7ywJUXGjKN3
	 SkGCWXdg6IX1c7hunHETpVcHu1ANDhRAKx7kOSGuGQdaL7Qul/rYBunfvt6rtrtLT+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Odq2K8000QpLw7dqvUlEHLgkiyWhDiLp4MJRaqjnLDM=;
	b=LKuPFAVQwoykbkSwEje0MF8qceD7/K1vlMI5jIbvvdsCahsDAECLm/pBk87yen1+teA5
	 VBJnAZ0s8Tv20SLq+KELQHE1vmyHRBjsACdphWwmxVKSOE3vC0WRXgib2vlc4rPaWM457
	 iOwaJl91ys8foqQ8p5E9qOdwEptBn9qv1J8KmBypNrV/kOWlt9fOq+CqhebadsCSMOJe/
	 G+os+VM4wlvdQ9Rxk2WmY9eYKTFqDIpUxq+iN8+9+LUvWEWhGb6gQDprDTqd35Mv8idXo
	 13/cjV29LVXzBbpiJgZRG8M1Yfu7qevi+wPY+OLh4vEqyX51miJOujSXRFP7GDZ/mKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368765;
	bh=Odq2K8000QpLw7dqvUlEHLgkiyWhDiLp4MJRaqjnLDM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ItY4XVEEGLibdPQ1aCOMTWILwWW8NG9nKc9bay2JLTGO4Df0M2DvdIdHa0zDZ/oIj
	 lpC75kdEaCtMrrfqNwY5t/Mi3oZNw0L0yCxsXuDwP1E05sUKAxbXABqByVhMkcJn9c
	 rFDHcGzWbJDCXKQxfswk2NrV1mVd/iC3ZdZM13m+tZmSraULB9e7m9ElZCsZ38SvdB
	 nUp3ujZAaiKSAq94QpgWW+tixSFiokNdpZTViYOJPKl2tesWv13y3V71cSNy4VZfob
	 WOeurZcvkoHR2UXdQjriFcnNIrDgBWXKeHOeGv6aZiOIRGkguW/N59zcNC1jE7Uynl
	 sEQ3QYsfkWUOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD9E80E50;
	Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E445B529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA2DA40713
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCoS0QlPcI8Y for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C67F406EC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368763;
 b=TO+4VhLlmGiOy6/pyzQCGaHbFFrxCjoYGABK+MKUPixevcNQX5e35GvJI5mB7lAud1//
 /QRslFyiAvBaS1IEVUFwvLtctzu3VGiE5bc36+vin/IJ1Q4iKV7HA+380oCo4/Mc+AYcj
 5JCYRTNPY9XOhvYcYJdgQNqSHu0K1ik63xugOb6yIawP1qoNp3yRzosCxmgaocLbhUJ1X
 042r9JjM8iQ/C2Mmmj7Q3jHa95HX+3H62suPSN6LqU3doh0d7OsCDKO0Od+z3Mqytj9o3
 WcdYRaDXJL95YXqIxjFfW45FqHFZLLFaDjkePwt0iEOCurMmEupQmTO5LG8SoUE2fPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368763;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=q2a+G58AMoQZ/R8qu3BDqY601UhyNFOfp6Qb/+mqWmZQsc6LPY+oUjGnW8e/c4R0ULD4
 vmxv9DoERdu9KUXPZrcMqAgWrHkSdjFR1+cHsQP/7gfh2VJyGfqdVVx4usvsTWS6d0GlO
 R2ditedCJFF4REzZrIfLY6Bb7tRtYBMuyUwlhViYFHr7U4YibzcuFDKOAzL0GR26Am5WZ
 ZYNeZ1oE5L8fI6exlkqE2ftcWfdPnXJFVRxKOEQwNaqSkpcbmniSEvxEXwEIMcROD6m9A
 43sEZiuhuGY8VgOyLPQSHzMolh+HC+phPFY7KqAU/IPMn/CQGK10mtpSbgU7v4Sr4fA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="rR/o7i4d"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=rR/o7i4d
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C67F406EC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e6eb21a8fso307051f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368760; x=1793973560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=rR/o7i4dgtv/zDdZhrQMdSEa5v0/MysYaWmJlgFAjKfeMEWzP77+oNVV8vFrC3YqzN
 laE6j9GPQwmX8xW9qoXvXO6aj8ZQudYmYKwxsQE7rLvBDNeGSt/Nbz6F/LMjhNEV7Xyu
 UX9gGcZnyeCYLO3sT3FMt8gsgeAyOBszCpjF51uIawBE11rIM2IosSeIoTBw5l9G8r0j
 u2k0iarzQDVaSjkPFLSVEM7R1tpz8mZeEJkkM+SwoLIWvWbXx7vip1zibKZOIsCKmbLr
 L6RyI/uQBzuIABUZnoTCXksoQjlMqkonCB99SY3IyazFeunumAE8kwHuNk3Y+Ay8dezn
 ZMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368760; x=1793973560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=mw78q4xHoiHyBwvqDtHorKL+xMxWKKvqyj043/zbQXtsTP0HxUlv9Mm4kENE7oK+jn
 CSCrA7Og+dtgU1OPJFHFCWZ/hfEnUaVuqamJlyQ1KomioL5/Cz2fCnVmv8ppnOzUGJIY
 MnDxZtZzC2p++mX/l9uj0uHkUjl60n9efajQT/Njo/qtWNXhXqrNzu/q0VZut9qI04kZ
 ElAoUhe0qF/hRByg1G4UB5DTp/gZbG77T0QUg8UgZzHCrrpJnYjWpPK5CXKtPrs1weU7
 kmVKVw1yD4Jdu25rTzSotwEa8iFJbiiKJS42c42nGzj0zdP5QklZdo9zeVztmXgdoBCv
 /Vgg==
X-Gm-Message-State: AFq9FYJxaFJeR2KORggaPWCQ8njzLogD04zJQMvoMvjB/ZgVZ3qLOIkY
 i2/bTJa0a5SJfDJnHvOVYkQOYBnt6ftGhiSlZddcTZDcA94GSVRFe8x9a4EXfg==
X-Gm-Gg: AYBFou04UyzPVwvAJGSc4QZNJqlgvBN136F3PklF28FsRzCQyHYDs2zpyaEv3jcgZuj
 XgVovSTe5xROaMqlb0eQs4H+CPMuayIo3GL5MhVz9/ZMaeuGC0BRphpDMWTucKehUKdRix4qgXE
 FAwRd3b7FRplqvmekXVHwvZWpFnXxr7LKkHCEQdfT1L00yCpyQm25Qo3SKXG3NqJP+VufKo7byq
 HUyR1UY7pfzraqsa6eDUh3ORTHvxcEBZuFroyUtIk0mb2ed5bpPEUE9oIcgYtFeFencT/qeKvsv
 b6zlGcHD3iog6GU8Ci90fNr6GTqErM7ApblU+gNhXT120+De115n65WUBqjQ21Cix0z9JFOMRtt
 vZOrJZkke73c5uIk0bnzXVFhm5Hismg6ASAnX9LNbclGH1/S+dhd3SmTf87GmEHYHvq46dxLy6M
 J7ULR/Xo0ww0gqXJRWYCpOR7xaMusmBRhjugLTyf58UvIdugMpF13LNKcCT4fg8vH9vqe+zSpIl
 cXbPigIOeVij4Kn3dfKPWTjDcUPIcwO4poISoHQMZ2MyI59LXhBst6LXwrY8pAjNuTFv0bQ9LjE
 08ZmqsdBvFiqhE3s4GeDYOG69Fhdo+64sXw+gh3NIACOBjeWYdSNfg==
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id
 ffacd0b85a97d-48e6e4fca93mr5498480f8f.51.1793368759810; 
 Fri, 30 Oct 2026 06:59:19 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:19 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:08 +0100
Message-Id: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/9] package/uthash: new package
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uthash is a set of C macros implementing hash tables, linked lists,
dynamic arrays and other data structures, provided as headers only.

It is needed by falcosecurity-libs, which otherwise downloads uthash.h
at build time.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/sysdig/Config.in   |  2 +-
 package/uthash/Config.in   |  8 ++++++++
 package/uthash/uthash.hash |  3 +++
 package/uthash/uthash.mk   | 19 +++++++++++++++++++
 6 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/uthash/Config.in
 create mode 100644 package/uthash/uthash.hash
 create mode 100644 package/uthash/uthash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..8ca72bec84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -261,6 +261,7 @@ F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
+F:	package/uthash/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..02932e5ac1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2323,6 +2323,7 @@ endif
 	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/uthash/Config.in"
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 73ac03e240..038a9734aa 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/uthash/Config.in b/package/uthash/Config.in
new file mode 100644
index 0000000000..e19c277abd
--- /dev/null
+++ b/package/uthash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UTHASH
+	bool "uthash"
+	help
+	  uthash is a set of C macros implementing hash tables, linked
+	  lists, dynamic arrays and other data structures, provided as
+	  headers only.
+
+	  https://troydhanson.github.io/uthash/
diff --git a/package/uthash/uthash.hash b/package/uthash/uthash.hash
new file mode 100644
index 0000000000..37a5a66aba
--- /dev/null
+++ b/package/uthash/uthash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  387ba027946d7c64e9aa19cc53b2edcd714f8f9dca9fa8e3aaef17e0e8e3d736  uthash-2.4.0.tar.gz
+sha256  40f48f89e1d0095bf1c5fb4d00affd74959c3ff77463b672cf7fac547d1d6465  LICENSE
diff --git a/package/uthash/uthash.mk b/package/uthash/uthash.mk
new file mode 100644
index 0000000000..2107a90d56
--- /dev/null
+++ b/package/uthash/uthash.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# uthash
+#
+################################################################################
+
+UTHASH_VERSION = 2.4.0
+UTHASH_SITE = $(call github,troydhanson,uthash,v$(UTHASH_VERSION))
+UTHASH_LICENSE = BSD-1-Clause
+UTHASH_LICENSE_FILES = LICENSE
+UTHASH_INSTALL_STAGING = YES
+UTHASH_INSTALL_TARGET = NO
+
+define UTHASH_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 $(@D)/src/*.h $(STAGING_DIR)/usr/include
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
