Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D71C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49CBA410B5;
	Fri, 10 Jun 2022 21:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jlto6d_1hKnG; Fri, 10 Jun 2022 21:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C817409C6;
	Fri, 10 Jun 2022 21:08:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78B2E1BF3E0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EDA411DF
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZIdrEyYQYXI for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 21:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8676840D33
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 21:08:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k16so101624wrg.7
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNBO9GpA0mxOwDUr40H0RPfG4CHTCQNhwHqxbiUG7hQ=;
 b=Luo1UK8QIwJTczRpIIHwYMnwei18dt5Js7eX9rrSPljy56rxgX7sTOsKKW1sE8tAdD
 I3P2L0xBmGQDzbMAHyt8XsvfcJoGlcHUiogtg4CgydocybS1B1bXNElZPQxVNZov/Exz
 Wkb7ZOtKXt1xyS97CfsrQEMKG+ptd4oLjylArPZVOV+QyFGQoGoEEBPfv3sTvymG17ek
 Fhnr4kstPuHp1DodBjTpOhNdDwaV+y77HHsrAfMl6FWzZ6HGyBS/jYD1yEcIWVcGE6ni
 GwdWFwBb4RPhmAXseQcV0VZWmtbsmuoyXTCWmab6KIQKy7THK5+e6AHR0/h0JOLPxsDP
 j7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNBO9GpA0mxOwDUr40H0RPfG4CHTCQNhwHqxbiUG7hQ=;
 b=zFY0Yw8WMR3ZL7fv3ZFISpUdtl1BCerRKLfLxMLyydqeNwdHtAObSmUvZyEdlNlfz/
 Ud2Dbww8ETMzwWIKPD5mfBVCq3OZB0aP/tnyn5pwy+w7u7P8ixvlFH7O+imoXzMooU5e
 WVZamyQMohnGV/JvkdLloeI65zbrgN0ezxSytw04AzMlDlTbGPXEXb2EweIcqJvuQYYh
 FIWA/fgIELwOlgk1tIF9HVZgtw6TUkGaBI1T60ND3jno4sNwuyRUi8Lw3lYECjYZkBgo
 wmKW4XSul13Z4gZiDJvMvhWSooi0iPvPwqeeakI+S+n7Uie2TYj8zgYFLvwUvDp6i3lq
 KNRA==
X-Gm-Message-State: AOAM531Fr+whRyu8wlkIVYzOUm1rV1785V/+uNly9rHp7r1L/0hc+lWb
 yuFpGYUxiKSjOC8ovIS+j+HSetb71T4=
X-Google-Smtp-Source: ABdhPJz/3Zdnts0530RwZu6BDULmtWyCHXdv0GsRiW2k3+Dh0VAyRaRhfnGQ+vt2hAHoDn5rlyPKvw==
X-Received: by 2002:a5d:4ed1:0:b0:219:ea8d:c07e with SMTP id
 s17-20020a5d4ed1000000b00219ea8dc07emr3668006wrv.174.1654895304452; 
 Fri, 10 Jun 2022 14:08:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003942a244f47sm4379449wmq.32.2022.06.10.14.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 14:08:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 23:05:41 +0200
Message-Id: <20220610210541.3643416-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
References: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/dmalloc: disable stack-protector
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with stack-protector:

/home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld -shared --whole-archive -soname libdmallocth.so -o libdmallocth.so.t libdmallocth.a
/home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld: libdmallocth.a(append.o): in function `append_long':
append.c:(.text+0x115): undefined reference to `__stack_chk_fail_local'

Fixes:
 - http://autobuild.buildroot.org/results/f808885dcbbe4322631fa57f72af23009babcb26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmalloc/dmalloc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 81ac467277..f0a05412c1 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -12,7 +12,11 @@ DMALLOC_LICENSE = ISC
 DMALLOC_LICENSE_FILES = LICENSE.txt
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CFLAGS = $(TARGET_CFLAGS)
+# dmalloc must be compiled with no stack protection as it builds its shared
+# library from its static library through --whole-archive, so forcefully pass
+# -fno-stack-protector to override what Buildroot may have in TARGET_CFLAGS if
+# BR2_SSP_* support is enabled.
+DMALLOC_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DMALLOC_CONF_OPTS += --disable-shlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
