Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840EAC433FE
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1932F4021B;
	Mon, 29 Nov 2021 22:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LENeqrUQt5wr; Mon, 29 Nov 2021 22:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AEC5401BD;
	Mon, 29 Nov 2021 22:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3125F1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BB3D401BD
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVMQjK096NYk for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:37:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EBA4400D4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:37:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j3so40110085wrp.1
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHugIGHT4FPBJIMYkmLcs+u1FgEb9mSIaPqvXaNIhI8=;
 b=jXwvI5rkguGwmKm2cHQehFnPW6eulg+5898CbWIN1YEEcqQW7b0ZmsesGj//dzd5bk
 QlM6/MR+wUl5ziZC4r4C7b4caPeBlBc3udtyJOZDFeBimslZuU5+TbcG1426qy9y8FTF
 WbjdSNy62JKZ++Q8RX63b+d1fgAb/4fpSqLuvUzRYfOw2D0UYaSpf0XiimNZmEDfK+t9
 JW4Z+YlEOe9fTTdFZ+dCjyJPSpivaNg6hFa657Fa9sH3B/JrdGrXnJ2L5woAUpkuQ6Bd
 6oQba6d45WMX5MwSgdo3jJIvPF9HqDshnSQRLiKYjD0eWvt0frz1PwV4sXwprIsblN5O
 xm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHugIGHT4FPBJIMYkmLcs+u1FgEb9mSIaPqvXaNIhI8=;
 b=t/YS4v66JzqWSP2Sx1msXJVSa2vObj/RdrUBqea6pSy9s9OHWiRcpUkJf+hGiH9J5u
 Tn1sWEv3UAeFOhVHateDLyGALl5ErsqYPCEHhv6UFg1vCscplHwFmMn7GJFvQsJgx7IE
 VuluaYSmDHLqpX5+wKib5DZgySNgcfy3/q6KLGfyxBcJilRA0/5FxZUOzJzKWMAT2N7G
 Wj0Qzb5b/umeHVhy+SmyO7EtLW2Ch4aoQtd9r2u2Vg0sxWwM+CbSrjQ8efkyu8NzAWHq
 Vu5gh0nLV5I3tnyYvIhS5aZ7lH+EEuyISqqx27IFatchb/FE2h1wD5FGthTHtGwOnCoH
 w6Gw==
X-Gm-Message-State: AOAM5310DBHJOJzNoI1nbn7BB6Kf71zM3Zz1RPg3THJFWGd3hYEP3e6w
 kO994EnfCBGHBIIC/N22VnKyU1QPt4s=
X-Google-Smtp-Source: ABdhPJzURxLRWVXowyZPN1hQvCCuhU2SOc9uTq63iPDZwzYFp0CUWusJhhsHA2DJ+Q8uM781pdzpxg==
X-Received: by 2002:adf:f602:: with SMTP id t2mr37199498wrp.539.1638225463457; 
 Mon, 29 Nov 2021 14:37:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id w4sm15552150wrs.88.2021.11.29.14.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:37:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:35:09 +0100
Message-Id: <20211129223509.2186450-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: drop spurious space
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
f9e359d7653f4af32a491e2baf4b6e524554174b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ghostscript/ghostscript.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index ca24c61678..d502d19206 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -71,7 +71,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 GHOSTSCRIPT_DEPENDENCIES += cups
-GHOSTSCRIPT_CONF_OPTS  += \
+GHOSTSCRIPT_CONF_OPTS += \
 	CUPSCONFIG=$(STAGING_DIR)/usr/bin/cups-config \
 	--enable-cups
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
