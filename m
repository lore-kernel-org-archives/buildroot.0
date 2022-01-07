Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCEEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 018A660AF1;
	Fri,  7 Jan 2022 20:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jslX3c29dhUd; Fri,  7 Jan 2022 20:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7836460AEB;
	Fri,  7 Jan 2022 20:54:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 470E21BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4137A40019
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YI-eoe5W7kYT for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D13240010
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:54:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q8so13220462wra.12
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuYiUEleXN1WfkjE08tNLfimnA11bWVR8yiuE787BpI=;
 b=PFUzHWfro1YZsqDfS6/vXngRoh1cPCp4F4DLNGPI1wLdxIQWh/VA+/qmUpDreTKSeD
 Pf11mBS+ndmgv+/dUsMqOes0nBz6iyTclItRK0O3tyBdiCkXiSXCDJThVlTVKruaSzTr
 eeVe9tg3Qqqjrk0vuvRO0SlvyZEIyUcQ4De1dNOkiZ83nqWYcFEPJC2LV49LZLJ2w48Y
 f9ZcqWbPUhsLD0AKh+WlvcMlBV+fGtNG4qDCfcEC+8xuAwWD9+H+xBdLS0Fpukv65KlV
 T/V/SrNwix0fkiF6Q66v9YVhWKYnJ3uFGYBYPYsHIOQ3wx1egKIQmgJ/2BCLgBA0xZHk
 zXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuYiUEleXN1WfkjE08tNLfimnA11bWVR8yiuE787BpI=;
 b=ppzYp/LPlC5cwzVwxayzQhZcBgaU5pcGqoylYq0jfv9Y8aN/lUQ4su0dMAtpQqLoN/
 aBWTce6QQOYHdaHF2GBu8OLmDwldfkCmx7yY3wD2ygiF8K3jWciQgaZ+uB30qm8KJGHB
 IqZRiSjLzpUQAFwMV6D2AEbY4r0bMpBYQA8HWvL3PpMS6s8PpjdGJZhn1piqGBQo77i3
 tGlC605BzGV4MVpUgmi8eq6vxD7FNi+ZZeCwK2QYeJoDbtCLxhJQeyG7uRkj2tyj+hc5
 BlKV0thkAyjso4V2fcy7LYGe2ihd6BjyL7KTNVdpU7gxs8G4Zrl+dJ95ioqHtmwVPu0f
 LsXQ==
X-Gm-Message-State: AOAM530kP5bo+mBAAuX5hwGu2k0V3RVsObe3dV0Uvb5VTXHTlJcgKjoB
 J8NRd4LIQJFyI1OC3DYqajmf6UaP7pc=
X-Google-Smtp-Source: ABdhPJyudXjiZqg9jnKFrlGada2T9AOe5T2XDJKdL/cA7UiD9cZBlR+1cHIe5flH8A/8grNJlzplbw==
X-Received: by 2002:a5d:584f:: with SMTP id i15mr58279533wrf.542.1641588866622; 
 Fri, 07 Jan 2022 12:54:26 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d18sm3642017wrn.102.2022.01.07.12.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:54:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:53:14 +0100
Message-Id: <20220107205314.1470071-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix comment
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1bf512e9fff9fef1eb5f58c3279ca007cbabd0ab wrongly added that
BR2_USE_WCHAR is due to flac dependency but flac is optional so remove
this comment and add boost instead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 89c53f60fa..473ac31fb1 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # flac
+	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
