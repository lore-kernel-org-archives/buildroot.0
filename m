Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45740827D2;
	Sat,  5 Feb 2022 14:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhR9mKZEs2aQ; Sat,  5 Feb 2022 14:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0B0827B5;
	Sat,  5 Feb 2022 14:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2B2D1BF45A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D7EA404B6
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MdoRuOfObQ1e for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:17:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7A2040474
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:17:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c19so1819768wrb.10
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y7GbrrTiHmGnGX/jhXL9YOrgqHsQxw4JD/x35nkSJjI=;
 b=Q999ARH8ZFVdXuvboAxmFkCKAVWSyz1CuRGhiWz8tng7uOfDb5iLsG3lgA1Y0Ud3w2
 eg+4+92igsTTHm+gXoMlO5+MYewPYKZVqeesNdTP/EdjBgp+A0KixdRq9TqWWMQZpfQN
 SjieCeZZS9cmCcfl3/Um1Rk3zUEN0UV7CCPYVnvBxh/4uVaNa+sBmTzGLn4+xcQaxMoB
 XMpAl5z4f9diX10i/e7hAPxTyS2SVqxDmC8ipn1ksXKdHwCoD21FcMLOfTgyqCJBVEvn
 JPqEwiPecew1YImvQRWLqWlokn/NvxcPlJKhw0k8Rl6y3lTd2MS7/KOWeU1VMl/R0h1K
 WQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y7GbrrTiHmGnGX/jhXL9YOrgqHsQxw4JD/x35nkSJjI=;
 b=zgkEtmWUh42rWQLSoa8+5pOnDRP923dn2PYJTAk23AHHpFeLSPiXsXqkQKpCR7cqW7
 1RidXXh96Aw1YRpXLwQK8dwHtVpEqHZaNputnA7v7idP3//XgbDBIWkEpOr4keEBW96d
 BkPCwsckpi7Sj4UWXIRHg1oddphBUnDTE/35nvrwv6UjhHifKbUmnOlWqGVyVwAKlWdS
 FVkORO78jNV0SUVCenErbb/uxxhH5KQj9FhUTna3HUX1IXyAO7v3yGxPjDmsUuP6fE8z
 S7fW3HTr6BusBt1Jez87O/ntkIjOfFBwDd2P7sgr6xnDL2xvmqImh+rgqIYamZy6o42W
 nfcA==
X-Gm-Message-State: AOAM531IBYpXhvSdjW53tedobaDm4/2pGoemdvrJzZy+VRk8T11E77e2
 364ucUPjOmlwR+vHvXPoUxNInsPaElI=
X-Google-Smtp-Source: ABdhPJwYl3xdwblJmPuqNCj1k72P9zwR+sB8HgMxDE+EW37ZjybRYEf3HoknoUQ5Dv6j1KZWJ7wM1w==
X-Received: by 2002:a5d:6486:: with SMTP id o6mr3021302wri.454.1644070635770; 
 Sat, 05 Feb 2022 06:17:15 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 11sm5567552wrb.30.2022.02.05.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:17:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:14:48 +0100
Message-Id: <20220205141448.420553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tiff: fix CVE-2022-22844
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

LibTIFF 4.3.0 has an out-of-bounds read in _TIFFmemcpy in tif_unix.c in
certain situations involving a custom tag and 0x0200 as the second word
of the DE field.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lobal-buffer-overflow-for-ASCII-tags.patch | 43 +++++++++++++++++++
 package/tiff/tiff.mk                          |  4 ++
 2 files changed, 47 insertions(+)
 create mode 100644 package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch

diff --git a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
new file mode 100644
index 0000000000..ba1487782e
--- /dev/null
+++ b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
@@ -0,0 +1,43 @@
+From 03047a26952a82daaa0792957ce211e0aa51bc64 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
+ count is required (fixes #355)
+
+[Retrieved from:
+https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/tiffset.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffset.c b/tools/tiffset.c
+index 8c9e23c5..e7a88c09 100644
+--- a/tools/tiffset.c
++++ b/tools/tiffset.c
+@@ -146,9 +146,19 @@ main(int argc, char* argv[])
+ 
+             arg_index++;
+             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
+-                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
+-                    fprintf( stderr, "Failed to set %s=%s\n",
+-                             TIFFFieldName(fip), argv[arg_index] );
++                if(TIFFFieldPassCount( fip )) {
++                    size_t len;
++                    len = strlen(argv[arg_index]) + 1;
++                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
++                            (uint16_t)len, argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                } else {
++                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
++                            argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                }
+             } else if (TIFFFieldWriteCount(fip) > 0
+ 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
+                 int     ret = 1;
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f6c6de12c5..f80ab7ac55 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -11,6 +11,10 @@ TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
+
+# 0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
+TIFF_IGNORE_CVES += CVE-2022-22844
+
 TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
