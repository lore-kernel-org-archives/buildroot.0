Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41C9C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F44F60821;
	Tue, 22 Sep 2026 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oYBfCpzpYaT; Tue, 22 Sep 2026 21:05:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF74C6081D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790111101;
	b=eiU/mDLGpZvdctc18ofC+U1deWFGjSldDASHRqqTcfT6atBmsRPOFXJUAWRw6wooe6MC
	 PlLJ4Q8iIpQOlVVzR2pTRZe+Tb2bli+7CgU+eo+dSjZEC6fTD/Ii4CxesQZ7y/bECmAwT
	 sP8k8MIjWre7Zb6cuw4jhaFGXgsCMU14bwqjLBxjsUSF+o0DvamU4JETwhs0XQqBKYH3o
	 lomMogAQJl68l+4Owyg8w+CzGEbGOjHcCa96aB2vBkOGPZaPu6oAQDoXUayhoTRn35/pq
	 MpbO/2kK2XI6J27qtonuzMYqJNFluaj5kDhjyizuLJ7ZKxinWjMts4dcjCtAlK/ttxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790111101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pItXS+gxgvtKi1zv8N5uLC/PqYkK6Y4RYTG397grsLU=;
	b=HDRU4ouWWUtGym0ZQcySoUKTwLcWqCm/MeT0Nk2FiO9IJQwmbI4kUWRS6dLtO8BVUHDq
	 FItu5RLgZWcPJhfzyPL1+pJMRIEF5hWJ+SKY89bm1OXv2fF1h5wI6UF6GAE1h7vUwU72T
	 LrxCl672yKEzfvdivfJH0+VKR0ed/IIJEm44kqEg4d4mAjXnTm8nvibhws7a7hp362O3H
	 8A8v1JoyDibHGn/9pARyHn+JdcIlueu6GySEvCO571Kc3CC8qSrclNMkaPPfvOhUo3skI
	 9qnTla6SK6ys4VvVpuEGFBbrW5GeZ6vR38M9zitxfrwwAVDgR8HUumsDkjNIB34UsCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790111101;
	bh=pItXS+gxgvtKi1zv8N5uLC/PqYkK6Y4RYTG397grsLU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q95HCIV0+yX83psKAGsvXX6jNseCnYrErfF2mfXm7taWwn3Y85f/6AF/iHR+C2rOb
	 xk0yTp8zdCUvU6v8efDytY+a0kdQIX4rQYB7aTzpzAAHxeU14AUq6nR1wZSnOQT0xh
	 qhB/sUbyoedcz6TPiSj7/lkw2rAgYZEPgY4jhq5W/no75bV9j++mhONBk/JY+uZs8a
	 abrGd9tPsLgPiGhHAvbiD1j9GhBospuUSlSi2pB+cpksgRwHujbWKOtAPblQqYTnUa
	 pI/fjqBVUNR7GY5msqKEKghzCLm31ZDQZqis00zSNmOprNEd3Huhtz5DU6hCGA4myU
	 UuiLqaZr4OTgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF74C6081D;
	Tue, 22 Sep 2026 21:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 104573A9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA5E34073B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0jkVUHATQkw for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 21:04:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7732940740
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790111096;
 b=N6eFBvaeBpw0kEm4TGVOJd44tNs8lUvYHxmeL1r8ez8oq6n9klLQenrLpt8pHMo8ABdB
 evtkQQPQXLgraXZSp6tspWXnNx+Q/8Kpepu54V9vLNd65YBxXOdDolaUDZ8v92291jPzE
 3xOC8EDgz79ibQrrXwP2g9JccaZd0lDKjxpHwyhND1SI0l4kVF9Xouo042QcxalwKtEFc
 nk2iZxHpObK9RiEuyYODcH6cXg/vC1H0lotcYJGbp/FZvABH2zfh2hfIEBEQzZ7ANR9gR
 6L3fvRCOcZaR3fQ/WKUkAYLHGDPmHav6yvu69+rKitCSxLWV3y2IG44XGl0cMTvDS8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790111096;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1JF7enzSJEGjDyfqV8lXznsqPkFPeonOLa2yvbfOqwY=;
 b=tbscdogsTTGv2pKYY1kyM3GRSobo42N7CQ3Hc0cd6APhEpMNK2W9dbl9W8E+dn0RyAvz
 o8oG2MkfnkvvKuWQcnegccqiOfa8Cdwd8bd02+qBbJvi5pdLAyX8KoOFNVaa7kAMNyNW+
 Ep6pYIYFed0vrxDuSqYw+YCynybKrXR1rtRSLprrg3huvc7imr+19vjnJyYrk629xNvbC
 jauFDJWvS+qfOjgOPrWcvRyVmeG10Ts03h/wZOZB3glgeDnIl4JtaZcFUcbCcDEzW33IP
 V0FV3CR0zuzlkeYgCvh/miqiPEKWDtNgG2woIJSXXGj/no5K+UO7nICII3RR+PVXKIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZPN77ysv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZPN77ysv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7732940740
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790111091;
 bh=1JF7enzSJEGjDyfqV8lXznsqPkFPeonOLa2yvbfOqwY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZPN77ysvIkGuxNWHipxtFvGtLfy/8NnOr08l7y6OcjD0YKApQFCVZxUCYbbF0VEoe
 MThofSwogQZzdsFM4I5SQsVTtVRYeCg+7I2vHsWDSJvGGgSeliszYKTIvB9Cwy5Mxk
 qe9LTHVL+RbHISJeJZlbfnLJCpdv9kLIrSR8Vu29rhohDniDa+zbjkfJiju5BxMFYh
 J8iJy4kpngxcdsw+fHWeHct/x1j+YT5xCHEkzHyfLaGiaxbMAGva81NH/EA5F2/ypu
 d0gnP54QKxp47DE73alZlDGUqFgw8TYcHJA87Qf804VIi34HW41fg0Ogf6uHF5dfTv
 8e3kfvqiPsfbQ==
X-KAS-Sym: v3:f51bdf72230551df:UYr1VKEP/tcKXzcG+3RCs2G/NTsm0w+KzyqyieC0zW2vu
 T0pNO1BGZhrFna9nH54EMTyRXc9Ks3GmoTQ6VhceMLn+FNCTXcOWgpAEhuNMe+D7xXubjnS49O0
 pZUGzWHt45Wc7K922E6CnbkQKsM7bVEDxvZcSO0Dtcri2W65NJSqP9kHugomUmvpRJcUDUhk7yM
 vt40Q4e5inzg7nzBSu63In4Wwd/SMbz90617+71SNM9InBVTIGxFySb9c8snhijTuvSdtzydDuu
 HGWadEVBXhRyVLxafokBkp1wjizVVBVn3IvqnoI9Z+uZQIg41kaN7Ghbf8M2vYc4d5AHdkJw==:
 v0cIfVq1G3NNqZMB7pksINyc+6j3foLK7Ftzl73vs/984Yo7uMPa2YVYWfN6XvJe/91TxTgkc84
 Ao6xtO+J9Vw+w/iYoquA6fOnmIsUSBYWAZ1vjr41CGyIoZnLnCkoXb3rpx/RkyVLf1fWdSqYuLI
 UMgFt0Qs4YINNT6Wg47PVUyWGx3uwPy8pWk4ZIYzBLkSoZAGgkQ+g7P34RXsWwBOLOi8+469rmf
 js3keEOq3Jj96ZcxdXO3NxxaYJzboSkS7FvrDVXmDeO5Qnnf/dmxSmpJUIIlDMbiW2dqZSuGKHD
 rEuhuNl3rvCD3M+/lgoTNcFyiL8AgePdji2vEwfOyaYDM6ZnjFC0F3oFhmO57GM5ThWkXJYK6q5
 kcDhcKFdkctDcMpnHHZj5jhmPWl1QwWb7enoDK4e+FPBTHha3ARBHo1rc9MB9UN7uvt+uFE1aBt
 UjGWWnu365D2D7ysSwM4rOACCF2PAswD//2cDl2Tqc6abUBUvlvMv7ch0M3CgQtxZMrbcT+cDTR
 1uxSJlWNXRG5IRSEl4MGRARNrFfHkbp/2WVSD9ARUQ6BGfESSFdQKL6uMvWawOKDJJXGhwlsgVL
 g9DjSQ==
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEC90A4C33E5;
 Tue, 22 Sep 2026 23:04:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39448)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x97fW-000000003HI-2QsU;
 Tue, 22 Sep 2026 21:04:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 22 Sep 2026 23:04:50 +0200
Message-ID: <20260922210450.2669612-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/flutter-engine: fix build with
 pango >= 1.58.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit c3aa6774563d20901fd1370f51ef105180665b54 bumped pango
to 1.58.0 causing a build error with flutter-engine

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:9:1:
 error: redefinition of 'glib_autoptr_clear_PangoContext'
    9 | G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:60:3:
 error: 'cleanup' argument is not a function
   60 |   g_autoptr(PangoContext) context = get_pango_context(self);

with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_LIBGTK3=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0005-Fix-building-on-Pango-1.58.0.patch   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch

diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
new file mode 100644
index 0000000000..9bb475187b
--- /dev/null
+++ b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
@@ -0,0 +1,33 @@
+From f1c316430713ae7d526f8abc1621b09958aef281 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 21 Sep 2026 22:06:06 +0200
+Subject: [PATCH] Fix building on Pango 1.58.0
+
+This version added the autoptr macros which we no longer need to define.
+
+Upstream: https://github.com/flutter/flutter/pull/193119
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../flutter/shell/platform/linux/fl_accessible_text_field.cc  | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+index e99b123bbfd..f7955a32f07 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+@@ -6,7 +6,11 @@
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_standard_message_codec.h"
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_value.h"
+ 
++// PangoContext g_autoptr macro weren't added until 1.58.0. Add them manually.
++// https://gitlab.gnome.org/GNOME/pango/-/commit/223b147
++#if !PANGO_VERSION_CHECK(1, 58, 0)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
++#endif
+ // PangoLayout g_autoptr macro weren't added until 1.49.4. Add them manually.
+ // https://gitlab.gnome.org/GNOME/pango/-/commit/0b84e14
+ #if !PANGO_VERSION_CHECK(1, 49, 4)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
