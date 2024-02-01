Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962EFC4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 22:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032384EDEC;
	Thu,  1 Feb 2024 22:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032384EDEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kgd1NiF8EKsd; Thu,  1 Feb 2024 22:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467114EE09;
	Thu,  1 Feb 2024 22:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 467114EE09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8E9A1BF358
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 22:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5877052D
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 22:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5877052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUdnoCtAJqgj for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 22:17:04 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A0BC704B0
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 22:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0BC704B0
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso6741585e9.1
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 14:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706825822; x=1707430622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZJqXqPSqKZ5MrHs+TOAfi7slo8c52pIP+8kVQnlQFIo=;
 b=Q74n0py3EnA+zdLATOddOqoy1GoDqW4nb9loI+QRuBHTI5XI9G0A24T0u6NZGlwvM9
 6Z9fWBj2NN/BLVRmqeGkJqCljT7BC1MMnucUUPcxJqXT94XfCC6VmhdujFoM9304jehf
 uO6knL+X9WxqOIBF0DZf/9OUb2Kv+TkHZ/F1znk6JtruSVjL0zmg0QmVBbchvtQTcLno
 q5FZVMjS0UW5Ug8omEGOhs10D4MdCalI9Fuy389b0fXdRwgAwIhmS9I94WYWuJdD+Mq1
 fTGGSYhg/MMH9L6dXApM2hEUZB4Cq62mvkfOXHYjKhQK2O/SjqWNCQnjW7NvEcIaRyBN
 32pg==
X-Gm-Message-State: AOJu0YyNepB/49a53hPtqLcIEbWrtZVx7P+z19Flx+hI7BYIIDdIEQLh
 VRiJzNOY408NWTQyEWBxKp4rOhKnH2KFeaIlmduys1vYrYvN6vnIL6oRwpXUjTI=
X-Google-Smtp-Source: AGHT+IHCLw/aX+xA5JIv3KLdHPdQOPvSBgBOUSyDM6UIjF9POZi6L/tvt0fsmQwyVlEzxaieuk6udw==
X-Received: by 2002:a5d:4287:0:b0:33a:f90c:2a25 with SMTP id
 k7-20020a5d4287000000b0033af90c2a25mr4166794wrq.22.1706825821745; 
 Thu, 01 Feb 2024 14:17:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g9-20020a5d46c9000000b0033af4848124sm439945wrs.109.2024.02.01.14.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 14:17:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 23:16:59 +0100
Message-ID: <20240201221659.320957-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706825822; x=1707430622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJqXqPSqKZ5MrHs+TOAfi7slo8c52pIP+8kVQnlQFIo=;
 b=KZuBxziSizVrT85uLl75sr/6w8XWsUy3eWOKgViWl7ogVE6dub6GZDYnb5e6RizRYW
 Si4AjfbmKxOgVGzdD/5zsz6HYGyb+tG2LQFjV7C88YUX5IX/dNrhBoXeYRf1IBV3il6J
 SHjF2hLUPKXZCkzLLzFxbHuYGy004+FtHiGgrDMc09u6M9z7oHwcRinVUJdaVb0SYB07
 nI4pCLAL70R/UPzI3miyPXaWrymlmYOBOPxRNY6clImgNV82xNQsbSoav1EKr/Iz5wUF
 +dVLymblbSaKHilBM8JbqY2FOUXfSnSz0RJqENcuGjVSXOG0giFSfc6RxK4gYHXBhAtn
 eJqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KZuBxziS
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix CPE variables
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

cpe:2.3:a:minizip_project:minizip added by commit
425339dcdfb2d4fa16ee11231752a5cc8250e78f is not a valid CPE identifier
for this package, cpe:2.3:a:zlib-ng:minizip-ng is the correct one:

  https://nvd.nist.gov/products/cpe/detail/64E392F1-65DD-42E5-B618-AD893BA37FB3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 5a4d920369..819b33b701 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -14,7 +14,8 @@ MINIZIP_CONF_OPTS = \
 	-DMZ_FETCH_LIBS=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
-MINIZIP_CPE_ID_VENDOR = minizip_project
+MINIZIP_CPE_ID_VENDOR = zlib-ng
+MINIZIP_CPE_ID_PRODUCT = minizip-ng
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 MINIZIP_DEPENDENCIES += bzip2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
