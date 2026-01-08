Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE9AD1D480
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727BF60DEB;
	Thu,  8 Jan 2026 17:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lg5ocPvt6vpv; Thu,  8 Jan 2026 17:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAAE60DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767892798;
	bh=i9nLtggcxsrRqzmKQ61KVqGj5UXmtNCoYhoXmlmcZlQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=P80+1cuvThFeO9eFLNDz0eLkAKe4iKHzSjUovX7IRd1IkEKKnpgPxAxoDljHWBGGZ
	 VqysG2qf+vrt7nWbuOr90CpMV8E8mSbmX2gJ1Ix2V5/srDmLotEORc+Xk0WWVB4u7e
	 2vRkamMXYkbshN7SpYKaj3YbU06j/G2Yr5RrbvHZ9d+kmv1+lxKZS9+ARoe9zLjsh1
	 jBvOizVtNg/Szeopl2wwv/Rgn7AY1VQMUaDSZbhXmWVvSSIcgRpdpM+vcdrxJyDcj/
	 gXI7PMJd5szT/tW+hVLTiHtyDqwwrJUPq3zqGIoaTKd2gMTFyw/tWd7YcQyIgyURIa
	 RdkmlmHxYqVow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAAE60DEE;
	Thu,  8 Jan 2026 17:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23A8C2C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CF983046
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubh6LPw5BOR4 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A70B81137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A70B81137
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A70B81137
 for <buildroot@busybox.net>; Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso14410525e9.2
 for <buildroot@busybox.net>; Thu, 08 Jan 2026 09:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767892789; x=1768497589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LR267+pb45X5GtO3/N8IIreHbpZ2n4FPufIiVUthRlQ=;
 b=FFfmGC9toBonAzc6vMl8gIn9LAYtVww6I0cSzjS8mHWdTuTo1O2027BvBFiO4OooE5
 orWJuVLcgYYnDusyytiDaJQbG8IV2NSX0/0Qj4vhRDpxAmzlH41LVpfq8fy4Ju3LiPKN
 0EFmNKgmDQVohXmCZ078uxcWv8p0OTxNDaU95MuLTkA8OGlTMyGa2n1E21GbJykAUu73
 hAuzpmPodbf9JYjyjMrNM1l7tTP8vUQSRTaVi/51xZ6y0wZEARsQ2Y7O3nfpqJWXJg8A
 vXHbMMHBMSj0aUanH5v3nwjFnsjiRrFcgAUBZrXQQ+aTOk3Tv0oD+LbeBLSMwLPG9KnK
 SEjg==
X-Gm-Message-State: AOJu0YyjSZ9EpnPqmBn3nfbNDnoSggaIy/l65kvPIqSazD/6jdieoQTO
 Wt6o+dWgNmyGQqPmOFTV+/r4fFFVQAldMyru7eLjl0MG7PUCAnW9w4LEogIlSq6JLhfYgqYzOrm
 OqDFmaQ==
X-Gm-Gg: AY/fxX6xaliS9tnH9E5Hn7tD0RbWOppLgBVNWVhx0PNFtOgqvBVdWR9PdFazoTHilj/
 QnofEjca8ySjXaiIwcy4MbtfF+72DAHXYmY9SoY4AfQ0ow0LxM8f+mXeTEbQE8OH5d4503Gvfn7
 LqaSkUqIBdYfh2acZba5byNLS7niar6rfb6LzTiGwlu3P09IN/7lgW+0SOXR497OAzHqWMR/9AS
 6uJ9TVPT+j/XLvY66h6G09ezus0zvRWA5FEEC5VE75jaq3eHenYzg10El+aKa9X4G6RjFqY2rM7
 23gKa1udP5oRHPW7/UoibzNeaIuTPwM6K3/K4ozay0r7SxsIVQ7ie+YU2Qqmu0an6ILDmQU+WJg
 rD9Bu433F1fxP/vPBjAPCn8prkAbUlgUNrt+uYbI8qvUi19i6tGH9H4HKyPRgEC+2ajZ1smHmrU
 MnYrCSjaYA9+DJ5G0qdXJs+rf5pWH2FP4ddYM=
X-Google-Smtp-Source: AGHT+IGQkrnarwykr14lWTDm/yWM/CwuLag9vGfWvVBZLnX2KwmljZa4KqPSl2PHhZ0LEwpMpxtQ1g==
X-Received: by 2002:a05:600c:8b57:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-47d849bdfa7mr76776565e9.0.1767892789248; 
 Thu, 08 Jan 2026 09:19:49 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c78sm172329995e9.11.2026.01.08.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 09:19:48 -0800 (PST)
To: buildroot@busybox.net
Date: Thu,  8 Jan 2026 18:19:28 +0100
Message-ID: <20260108171928.669166-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108171928.669166-1-francois.perrad@gadz.org>
References: <20260108171928.669166-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767892789; x=1768497589; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LR267+pb45X5GtO3/N8IIreHbpZ2n4FPufIiVUthRlQ=;
 b=MvZhvR9KnwMJZqhGEbSpwnyQ/QtgrSRyiCBVPv84JtCZxlalT7JZd+yafBfCRniGo4
 4+WXpAgtMjLEruCr8NOPiq+EmBzRfS+CzEPlDA9YiMlfzGUkg7i1HL005jPqzLkuEPVE
 lKEdVnurDgmP7qjtDiNK1akZaTPvU+8s9dpMmKgIfzVm2EdMQVZRvSEwVPb2A8ugosfi
 VLtWlvp1JxS+X8RHKmHqSshOCEgDOuAFs073LUiZ3WbJngETsoWCNY8XSHQAZj++ZqFw
 jHdq3Hnh9mPgAZArGCQ1YiLvvKyfxqOhI+02CeiCIDoXqoLO5AKH4dr7ZXXgO5duATsC
 rSng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MvZhvR9K
Subject: [Buildroot] [PATCH v2 3/3] package/janet-spork: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  5 +++
 package/janet-spork/Config.in                 |  6 +++
 package/janet-spork/janet-spork.hash          |  3 ++
 package/janet-spork/janet-spork.mk            | 39 +++++++++++++++++++
 .../testing/tests/package/test_janet_spork.py | 26 +++++++++++++
 6 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 package/janet-spork/Config.in
 create mode 100644 package/janet-spork/janet-spork.hash
 create mode 100644 package/janet-spork/janet-spork.mk
 create mode 100644 support/testing/tests/package/test_janet_spork.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b538465f5..50f4cd664 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1166,7 +1166,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/janet/
+F:	package/janet*
 F:	package/jpm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0..c2ade1f09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -693,6 +693,11 @@ endif
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/janet/Config.in"
+if BR2_PACKAGE_JANET
+menu "Janet libraries/modules"
+	source "package/janet-spork/Config.in"
+endmenu
+endif
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
diff --git a/package/janet-spork/Config.in b/package/janet-spork/Config.in
new file mode 100644
index 000000000..9a7261e26
--- /dev/null
+++ b/package/janet-spork/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JANET_SPORK
+	bool "janet-spork"
+	help
+	  Various Janet utility modules - the official "Contrib" library.
+
+	  https://github.com/janet-lang/spork
diff --git a/package/janet-spork/janet-spork.hash b/package/janet-spork/janet-spork.hash
new file mode 100644
index 000000000..5c4d0358f
--- /dev/null
+++ b/package/janet-spork/janet-spork.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0d3ae19b252997be1f1e0f5285a1340df53771f6c7ceb5d4bd9cb3501d6b3f25  janet-spork-1.1.1.tar.gz
+sha256  c92ff452e04f8c6f6c3727afc841fa85f92214a0214b41522d16a4b8143487f3  LICENSE
diff --git a/package/janet-spork/janet-spork.mk b/package/janet-spork/janet-spork.mk
new file mode 100644
index 000000000..05c183b5e
--- /dev/null
+++ b/package/janet-spork/janet-spork.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# janet-spork
+#
+################################################################################
+
+JANET_SPORK_VERSION = 1.1.1
+JANET_SPORK_SITE = $(call github,janet-lang,spork,v$(JANET_SPORK_VERSION))
+JANET_SPORK_LICENSE = MIT
+JANET_SPORK_LICENSE_FILES = LICENSE
+JANET_SPORK_DEPENDENCIES += host-jpm janet
+
+define JANET_SPORK_BUILD_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/bin/jpm build --verbose \
+			--ar=$(TARGET_AR) \
+			--c++=$(TARGET_CPP) \
+			--c++-link=$(TARGET_CPP) \
+			--cc=$(TARGET_CC) \
+			--cc-link=$(TARGET_CC) \
+			--cflags="$(TARGET_CFLAGS)" \
+			--cppflags="$(TARGET_CPPFLAGS)" \
+			--headerpath="$(STAGING_DIR)/usr/include" \
+			--ldflags=$(TARGET_LDFLAGS) \
+			--libpath="$(STAGING_DIR)/usr/lib" \
+			--modpath="$(STAGING_DIR)/usr/lib/janet" \
+			--offline)
+endef
+
+define JANET_SPORK_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/bin/jpm install --verbose \
+			--binpath="$(TARGET_DIR)/usr/bin" \
+			--manpath="$(TARGET_DIR)/usr/share/man/man1" \
+			--modpath="$(TARGET_DIR)/usr/lib/janet" \
+			--offline)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_janet_spork.py b/support/testing/tests/package/test_janet_spork.py
new file mode 100644
index 000000000..59a8380b3
--- /dev/null
+++ b/support/testing/tests/package/test_janet_spork.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestJanetSpork(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_JANET=y
+        BR2_PACKAGE_JANET_SPORK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("janet --version")
+        self.assertRunOk("janet -l spork/version -e '(print text)'")  # spork/version.janet
+        self.assertRunOk("janet -l spork/zip -e '(compress :test)'")  # spork/zip.so
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
