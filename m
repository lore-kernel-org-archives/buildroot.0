Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58465C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D377C608D1;
	Mon,  6 May 2024 14:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 647b-iUAPG6Y; Mon,  6 May 2024 14:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC886608DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC886608DA;
	Mon,  6 May 2024 14:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54BF11BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 343C08202C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckvZg8dfrhYL for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CDA481DEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDA481DEA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CDA481DEA
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU4s-1se9IW0vZc-00aTAE
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:45 +0200
Message-ID: <20240506144555.31709-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SSLeaJ4AT8m2MY+jbpHKT7U92CyVlWZBjRCwhliXIwfnzht/Thp
 XOunkpLmWpGzk00qprQ8EtWS+W1uchPFuYO7skY+yIDqBW1OE5tuO6c8jqJExGaHm5ehfAU
 gSbKVfx+1qjP/wvx8U/D5OeB1ZR3vixjAP31idOg2ykLIF68x26stjlzNXES9ZHNgv4vDdy
 2G4FvhA+49gvdiOC00jjA==
UI-OutboundReport: notjunk:1;M01:P0:DU0XXKi77i4=;Lwwp1tK0MXal40uocGOSwtpRNdj
 h1IJnhieFrSvQrFYDYRgq2kBseDwVyNB2I8W05y3AW5ATmQ/VuKVdaTaPdikvhZPzeTGcX39j
 x8yYqnRyPZmIDRa08y4J6ADvNt5A66nQad3I94rMpxOSWEJlyc543tQW20ackyVrmG2FaHJes
 QBo2XY2Ai3At8uKejK1oHxQ8EUClPBMhuIM3Llm0Ma3U+x9Vgr1JlA5Av3OfgiTwXy5OvP2yX
 jnlqQ4CCrOtHv6AbMqB9aIjWwrcrRWzurRpJF/V5j9dn/vPoRz0Y1X8/YMihylS62T9C5sP3u
 Xf9y+MjArj2R052Xhznjho6l+FdMAgBG1qxaZ/04GNy1P3Taegm20yPA8po2iiPP/C405JB2+
 TpxUfHYBAl6gTCaD+g/ZEVj5tHVD3XgOsJkn9Axe7uK2sxPGS9bXZuqEgFyhVtHBx8Z5Zq23F
 0bPCbLG2S44yY/XsE/MtPJQrOgMGw3Ps2GfX8vWe1vT7wNqMfPq1gtKQBpWtj6M2xJvfI40rw
 541ELK/t2EfZAaxJExw6pjfbEwB9dYnbmyfgQim8gm4s4lmf8e6F4YMw+FzBuBoK7wWpnNTYc
 Yfp2KiqBrVCK8YZ5jHTrdxrwCBiMxLG43IY7NAMtvmNEaV+VTioucsF1nMgZ8yU8n4FPfVyLo
 ZSYAMZQXhl4xlPWxNg1kHLawy6BfoNnhYrQmEGj8RzeMo7pwoBe0vzyYIXKpPPucTBq9JCPQz
 uux/5+NacDpnaLIsLoD9C7hkOAC9GhH7qKFOIYm7QaIMz4JQf40bGTmoUAGrZZLhyzOxVNHNY
 Z7JldEU41RQHUyKwURM3pZ9C6S8ENWFuH5AxblNIEPuw4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006756; x=1715611556; i=ps.report@gmx.net;
 bh=V9McQtN0hTEeX8a4JMWo0hgcw5XPKcoz1SUAPcz8qBE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eqbZ2Asjo85s9j+EiNG66YInSNHeHJPj9bp64pgtJXZ2c7TN3//oPzP10kMSyO7q
 ZiXE4RwkVOQk2qrP5qlB4+0TGxy4Mt3qlpfowm44lIuDaB8pVHo1jgIGEHUDZIfnw
 t4UqC4/N/CshAaxPfobLmivgwpbasqbCOJ5ujsZdkpg9eXeHeAdAVWtQzmS4hjwo5
 RE1/+Q7N9PG1TUk8dD3PS39MFhxE6UP+sNBn1s2e512fkuaHFJekEI+lcrG50JnNX
 Jhy/EXokIY9AcF6Q4eSFnQqBQDrx2FIbqZP0MIN7yVltwgB07QjUa+yGvQEHKqgIE
 EyLD/4DaZA5qZDr8AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=eqbZ2Asj
Subject: [Buildroot] [PATCH v1 2/8] package/cmocka/Config.in: bool argument
 needs quotation marks
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/cmocka/Config.in:2: syntax error
  package/cmocka/Config.in:2: invalid statement
  package/cmocka/Config.in:3: invalid statement
  package/cmocka/Config.in:4: invalid statement
  [...]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/cmocka/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
index cf49d0f6be..80e29778d3 100644
--- a/package/cmocka/Config.in
+++ b/package/cmocka/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_CMOCKA
-	bool cmocka
+	bool "cmocka"
 	depends on !BR2_STATIC_LIBS
 	help
 	  cmocka is an elegant unit testing framework for C with support
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
