Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0803606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CUkID/nr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91ED2405AD;
	Thu, 29 Oct 2026 08:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRo_LIZRkyUp; Thu, 29 Oct 2026 08:13:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 86CDF405B5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793261598;
	b=Z9D1BhoI+tynTExnCHiqjS8674Q1JmsP9f+UAhXa2TbJykiBoCJbyuVCoewkcKRa3mQO
	 41g6jM3OvFwJyLEJmHaFib6Vz99tS03vH6UIVMZHdMGFqpQyFLjNMC0lWuPG+XXCjTdfA
	 MHRxeHwkoIyZtLQVy8eOB0T7XJydeJ7sbDeRJnvGMpp/FpNz8Wu9HHdqKuaGGrjCzKsYa
	 1T8Lqeq6XqRRnrKK8jn/+1Mr4mQNNaJh+P1L66zf0F6mm28JaHe1OAPFqRmQNGMOiQuBs
	 tPRuU0cAvrGPynHuvk4EZ5AmzdT/tpgWs0L8PR1EdB/Ga4FwutnaHJqR2AKrSV2blVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793261598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gdoXN69lFacTBZrG3l/TyTRCuXo5pT0zOPOTPGn93to=;
	b=pOE1Ba10i4fnXi/x7fMqgCVlaj9cxu1cIza5aDYtqtqbwxSIskunqLjZbRaQpcaPMraz
	 FiZ2aJu0+e449rY0O49xLcfWlWcVr6fWcUR2C+my5Jufg3+x5Hb0sNl23eFAILvrTVgfG
	 gswvzRvBCNR/mdyZwBDCXM9jXlUavJLB/PvVOsdWX6FD68DzyrsoZ0LK/67uSTUTKKXnn
	 zk8vZl6jm/deAMt+T2Zv7/DeY7lgf5aN67FhNkPdHGYXKbh1gA58kCD8m77Y1dE7WwbUU
	 Wt94RKBN+7wsgWl3nd6PZTcAEDfQcFDaGGrTHdhkV9I92pfcuejyxNuyk6OHXpi6eqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793261598;
	bh=gdoXN69lFacTBZrG3l/TyTRCuXo5pT0zOPOTPGn93to=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUkID/nrWoVNTkA4amAJDHB7egSeeXu5xIREmMv3vDs+iNPd9Nz89OqaFbx7RnqG8
	 DHweLaKbEKUv5c+Hg/XvwJrmUTIxLJi9eJDWrkUHvhXQjM80lcYdJk+jjFp2KMedWY
	 5DnN6VURVmQacI9sYQH4sbPlOQZfKOsnKkqnpYb1oGSyDfLcy2gk3gE6g3zpncaTo5
	 hYR64uQpJx42Vu6AKJYWbr7Ro+/q8ZVO7n33Uipqnf6xGhLHcMITN91LWeSv1ym+u3
	 Z8j8V+VgDzqBDyug7XsfsiR0lxaxeAaUsE3PUQpSC0d01b1i58C2ALNcPpbKOd8oyy
	 FZaUEt2Wd10Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CDF405B5;
	Thu, 29 Oct 2026 08:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1B3472
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 08:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10C924032E
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 08:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FRouLb3ejuE for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 08:13:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D298E40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793261596;
 b=V5mzfu+9Mnk39eigoAKPzQ/2S33T8lRWJMc1CMn9s+ahpPMQd1OXLNHpg/vH+4Sek7uq
 Y753EkQ/AJbE9MSHSfa24WKotbntV0haaKduqZNjxDz/fKUZ+YiVYW0+6mZLoJHRay4Y/
 DxX4gg3Pw0iGtww2hnT+8QvphpQQX6q9iwX/y+AVbDDbP8chYRr4gTAjc2KxvIqA2fy6J
 lZmIeEZpGn87p7SKkn4tIKy/BAZ0Sm35/iBZU4rzo3u1fD5LO+9fkyPLJaAVB0RH+/efN
 sB162Sj0WLdKHOsWfsv7g5VQrgGaPq5zDEIfigB1z/D+7YyEvy+Do81pVqlIdDcdi2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793261596;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XXn3lsWaMPtzIyv9WHGc+zgde2ry4g57H5FMbDlXpwM=;
 b=WDw2jHtlV0OksivK31dHQohIzr9fP5I4bpdvmdW370ZHCsZogsh3r4VTT8RlOCGlYHhr
 odi/ybmTu4gbHjj/YOdWUuEUvHWvP9qoe80zFcfH6fGWM4zgqFM+yemKrB6DRD0l3s+It
 WGZIL9Isd8KnZ5vC3dHN3mAsc5eLIOTEOst7dTjW59H5DK7sNxILJzj66mj1d7gLgmpLE
 wvvh48Wn1FopNP/wkDCxH37xDoj6MRqeJcMzinFtJTIPk08REnx5dU94YIGYDFxiNZZMJ
 KZOD4DLvLZCjz6exRSNN2+e/bCBs0uJy6Ra1MdHFYggAIcO0XbL65YeXuUKd7gv8KpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=gfJkpOpR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D298E40024
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 08:13:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso2779626a12.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 01:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793261593; x=1793866393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XXn3lsWaMPtzIyv9WHGc+zgde2ry4g57H5FMbDlXpwM=;
 b=MeeVMJAJ9IYKAug8ZuD46kPOQdV+DjHmjG290ZbjRiHF8Z+PcNABq0dnYq2npMLx1V
 8lShzp9+rqFHjymdr7V57+R+gYKLkWgaOWYwXg270Mvfrlh9R0pIH614FS+cxNP1iJY7
 hK0ptYKheV8hlJ0SEN9ZvKhqTtlaBD5H4ehZnfuHbwNBSi7szHY6ZuowU20QaXBYZXPB
 bMAnmp9RLpig5iWHeBoLDtZbkmJ/rMFfmctBoCP9OzxN/4DuUmJXSbPwTB9gVc/Lv1D8
 f/B4Zv6q84VAdXzL1WxKrNzq6svkx0yCWLBPtZqHinmVr3qc+3dbSUZDxF3W8YnKmpB3
 R+ZQ==
X-Gm-Message-State: AFq9FYLHme9TNYo+QetrQ3SIOi0p3f5P8VkEiRkRHiqkYHkMhDTMkGH9
 aO2lESiP+GoyExP7mBYDfg0IehR5CBEq1J5ZGxxaz73F0cCPVfkA5GsEZfuoLg==
X-Gm-Gg: AYBFou3Ur0cATqrfY5KTlQXUDEwKPYoH53232O0Slk14vPPHM7pe+rFfdOhxMGVMMdn
 Fj7TK2xhDciAMWnCRM7+Agzxv+DOqQKquWFi7zH6mX2LUTCZ4o6cRWFfBQcm3ttYE/3jv/bJjgQ
 TCCUt3MSyQ11umPY0q0av5i7o4EP0hBlBM4UNnChyOSv61JifoffAr2v9U8gBhQLKN5A3ZVioOM
 oFyuQZQco5GZG5GdvU6fAyUmfd3G61T1NWUO0r8L2iC1DdyF3v7hOIazVJgGsAYbti/dmUxynuc
 pOhEF9EjtnacqUf26UZM/UB0xduDYf9V88VBGfahGWy10zIeJccmaFnT/VMCA1cgFOBSIu2Ahzd
 96bH33gS5qIjo6OkQm07tNSV/hQJHNvggxDuoBymp3hYmIXKY1ft2NMpGer6Sx+Sq8BPbYoLv/m
 dyvsFQSnZHzpfeUpvfC20/lSny6lVoQOCoP2NrkZFFIt0wY/cG5gvf6PWLV5ir7c5vB+1PnoOzx
 ZYGwikcmQY8bMMpl2PQQGrwZVMCALedNUvB50Pf3iSRXhY2N/rybbJFds3hLzzGqXNkvrv4flrn
 ym0hIBUUcMIWwARF4Ns6vs+fcP2+3o1F2oHOxsVo36DxhoQsCrSmXS9CMzloZP71GAVPsH20LEc
 pTGwg3uV/dQ==
X-Received: by 2002:aa7:c2cc:0:b0:6b1:bbbf:c8da with SMTP id
 4fb4d7f45d1cf-6b49cbec0b6mr2286710a12.17.1793261592983; 
 Thu, 29 Oct 2026 01:13:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b49809df6esm2359494a12.20.2026.10.29.01.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 01:13:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 09:13:12 +0100
Message-Id: <20261029081312.523050-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/usb_modeswitch: fix static build with
 jimtcl's zlib or openssl support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With BR2_STATIC_LIBS, the usb_modeswitch static dispatcher fails to link
when jimtcl is built with its zlib extension or ssl support:

  [...]/sysroot/usr/lib/../lib64/libjim.a(jim-zlib.o): in function `Jim_Compress':
  jim-zlib.c:(.text+0x3d8): undefined reference to `deflateInit2_'
  [...]
  make[1]: *** [Makefile:41: dispatcher-statlink] Error 1

The dispatcher is linked with -l:libjim.a only, not with the libraries
libjim.a depends on.

Add a patch, sent upstream, adding the libraries listed by jimtcl's
pkg-config file for static linking, and add the missing host-pkgconf
dependency, as the Makefile uses pkg-config.

Since commit 283821fc31c4 ("package/jimtcl: bump to version 0.83"),
jimtcl enables its zlib extension and ssl support when zlib and openssl
are found, so this failed whenever they happened to be built before
jimtcl. Since commit a416a8ef0972 ("package/jimtcl: fix optional
openssl and zlib dependencies"), which made them proper dependencies of
jimtcl, it fails every time zlib or openssl is enabled. The issue
therefore affects 2025.11 and later (randomly), and fails consistently
on master.

Fixes:
https://autobuild.buildroot.org/results/40e1490b9b64f96b5574bd8cd1ceaa4e6d50b7ca

Fixes: a416a8ef097250ad6acb9b073880ed2a44f7df62 ("package/jimtcl: fix optional openssl and zlib dependencies")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...e-static-dispatcher-with-jimtcl-s-de.patch | 47 +++++++++++++++++++
 package/usb_modeswitch/usb_modeswitch.mk      |  2 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/usb_modeswitch/0002-Makefile-link-the-static-dispatcher-with-jimtcl-s-de.patch

diff --git a/package/usb_modeswitch/0002-Makefile-link-the-static-dispatcher-with-jimtcl-s-de.patch b/package/usb_modeswitch/0002-Makefile-link-the-static-dispatcher-with-jimtcl-s-de.patch
new file mode 100644
index 0000000000..df63117048
--- /dev/null
+++ b/package/usb_modeswitch/0002-Makefile-link-the-static-dispatcher-with-jimtcl-s-de.patch
@@ -0,0 +1,47 @@
+From 10fa184cd0f5cb347fbb60d92ca0cb9834db0103 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 09:36:18 +0100
+Subject: [PATCH] Makefile: link the static dispatcher with jimtcl's
+ dependencies
+
+The static dispatcher links libjim.a with -l:libjim.a, but not with the
+libraries it depends on. When jimtcl is built with optional features
+using external libraries, such as its zlib extension or ssl support in
+the aio extension, the link then fails:
+
+  jim-zlib.c:(.text+0xcf): undefined reference to `inflateInit2_'
+
+Add the libraries listed by jimtcl's pkg-config file for static linking.
+If pkg-config doesn't know jimtcl, nothing is added, as before.
+
+Upstream: sent to Josua Dietze <usb_admin@draisberghof.de> on 2026-10-29
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fc2c0cd..41a15e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,6 +3,7 @@ VERS        = 2.6.1
+ CC          ?= gcc
+ CFLAGS      += -Wall -Wno-deprecated-declarations
+ LIBS        = `pkg-config --libs --cflags libusb-1.0`
++JIMLIBS     = `pkg-config --static --libs jimtcl 2>/dev/null`
+ RM          = /bin/rm -f
+ OBJS        = usb_modeswitch.c
+ PREFIX      = $(DESTDIR)/usr
+@@ -38,7 +39,7 @@ dispatcher-dynlink: dispatcher.c dispatcher.h
+ 
+ dispatcher-statlink: dispatcher.c dispatcher.h
+ 	DISPATCH=dispatcher-statlink
+-	$(CC) dispatcher.c $(LDFLAGS) -l:libjim.a -ldl -Ijim -o usb_modeswitch_dispatcher $(CFLAGS)
++	$(CC) dispatcher.c $(LDFLAGS) -l:libjim.a $(JIMLIBS) -ldl -Ijim -o usb_modeswitch_dispatcher $(CFLAGS)
+ 
+ dispatcher.h: usb_modeswitch_dispatcher.tcl
+ 	./make_string.sh usb_modeswitch_dispatcher.tcl > $@
+-- 
+2.34.1
+
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index aa5646adee..08c29fe58c 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -7,7 +7,7 @@
 USB_MODESWITCH_VERSION = 2.6.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
-USB_MODESWITCH_DEPENDENCIES = libusb
+USB_MODESWITCH_DEPENDENCIES = host-pkgconf libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+, BSD-2-Clause
 USB_MODESWITCH_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
