Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4218BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F252041ECB;
	Sat, 18 Dec 2021 22:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6--1drlgtxI; Sat, 18 Dec 2021 22:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 804E541EF5;
	Sat, 18 Dec 2021 22:35:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7774A1BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6663284DD9
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMMks7-EyQOA for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:35:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0F784DB1
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:35:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j18so11547528wrd.2
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rHwozoMeJcGvi5/k5oW9CHZ2iH5FL3xsLNJUK2+C2Y=;
 b=QVzV6unY0eZlQrU4Gqs4mXz3psdKpzIwhKkgyzQdCmbZOBSKdY9NAZ1WZ5KVl/1HtU
 tSbb6hfOeD10oqzJwPwh2NXuvUwM0OKLD/4dNJ5fKSn77pk348Yp7NKSNOSNXU0Di7mO
 NIrck7Kk4GSnfrA5KrTg+A2xOxoZtoNPdXty2S6BCw8f0s/AZNwLhIwQgI8DlN5scPpd
 OoaPAVpAsnQc8b4ChV34uXSi+ICk0m/bZkLo6CWpJCWMMK9C2ydGMGemnkemVwXI8htW
 cyANR36zhF7O72TJYKjRvwuMUrqCTVJTUHeMXlMzqeENubKmo+ONRQ7Kv2k7AzLIgsTr
 TaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rHwozoMeJcGvi5/k5oW9CHZ2iH5FL3xsLNJUK2+C2Y=;
 b=ZoYNlzXvtZU6uau9Y/Kn6Y3VuPqSmafFunwnIyqmd24aW4aXM7mLrUgC1TEFjThgZV
 ZZx1A782MICs9jtkMued639hUc07MM38KDmKffk2OjftyWirJpJe+Qvo5+kzOnlpK+vQ
 rbq1BEkhiYFcfF94TOfG2DJxVpdsIDTF3tmUWMYofQXjbL88rAPratwm64WAsRBB4sn2
 PwJegL9iewbPpAh1kEcqBhxdWBmguH8xxLX+4Hh2RWO+/+Cw/4czEHFN49yQ/Dyjo2EP
 h1ITSV+o4kALpsytcoUQ3NlLAah6NW2tmg0WmwJGlTdfe6/cU7mcVx2WDdVoFOExQ9bn
 REEQ==
X-Gm-Message-State: AOAM531ZEBeLpH3HfNOpLATqbzYobniEXYfKfeTCwwQhFwD/57G7xuUm
 8unB9osU/r+lDewyULqlanmhKOXQwL4T5Q==
X-Google-Smtp-Source: ABdhPJwKCglVLP2qGof/3c3Ce+m4rZGw4VqJ5AD8rnwJK56ZIK79cmadwHckikgcqTxTM2U7tOSvJQ==
X-Received: by 2002:adf:cd8e:: with SMTP id q14mr5859938wrj.712.1639866902904; 
 Sat, 18 Dec 2021 14:35:02 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id c2sm1603125wri.50.2021.12.18.14.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 14:35:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:34:30 +0100
Message-Id: <20211218223430.577974-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: fix empty line
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following warning added by commit
3ba8e88e396f216ac8486580b8817aac92ae93b2:

package/bluez-alsa/bluez-alsa.mk:79: consecutive empty lines

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez-alsa/bluez-alsa.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index a1e550ab6c..f5e3aa1245 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -76,5 +76,4 @@ else
 BLUEZ_ALSA_CONF_OPTS += --without-libopenaptx --disable-aptx --disable-aptx-hd
 endif
 
-
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
