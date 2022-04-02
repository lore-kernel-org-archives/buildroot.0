Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E65EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 08:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928D541936;
	Sat,  2 Apr 2022 08:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-2e2c2UXENr; Sat,  2 Apr 2022 08:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6C4417FC;
	Sat,  2 Apr 2022 08:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 926DF1BF42C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809BE417FC
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2MyIKE8EC0u for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 08:21:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A0C4155B
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 08:21:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r7so2991640wmq.2
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oEqa2rOagFQtBgqGyTNmM6yIxXhb85llAFgY5ErY3M=;
 b=Lb61RzCxNoao1A2LoehnMOjnEPZR3lzX+mWciYu81bIskU1gNTmtaDowC5mzrm1ZEr
 cMn6vB0QtgWs8HcCbtnjcH7iMIUnumXkyBCJeiM903TIahC0CaMzhxs1TzHoHZDkakDH
 uzK0QxnpaltGcb8IWQTyoGuW0kgSI2jevuZyyJ8Nt1T2hm3K5gffThULN0fyrCU+J+Xo
 6l95s1iBMAum500pJ80qTE7DW3XGUi65PM/5BmLNp3Ypgo7FCEmvlz8F5QOdyW1uxJ1Y
 iZb92EzPmE2KoAUs/pVyzkYpcdWcduPeMx3J9mskjXfy/048UZQruEICluaAwik1eJbJ
 B2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oEqa2rOagFQtBgqGyTNmM6yIxXhb85llAFgY5ErY3M=;
 b=JoJ0ZuB6/G8NR7PGnj8aSHZmybuuJTn438b+nxYG8Dha2kbqwSljFyv9ZonTLnZkgn
 eHGPmkC+A3SNXBcXMCUBaGS4GmX4lU/QsIlmXt/6tRtxPXt6Qrj2E0TJowPVhhgOm21p
 Wddy/rJiLlrUvONgnK5a0xERbruazyFR8c3CAH1NMg932JHtXDqtSZz6WVQxQ5LgrY0O
 lDoLsMQyqdTwzno2R7tODI9DxyrZ46V5ChHKMFU3JJGpRLo+HgpRM7rGkOaC7l2Mkx3H
 hWHzduv/a5NUEJDqykJxhjJnCQm2b6ZBzEECjWGe2cZmVUl2iy3CO5AhkZdHWUp0kIjp
 eWjA==
X-Gm-Message-State: AOAM532nX7y19KDuBFC5Hp7NGJau+prmZwOopqNqOR/FtL+bE2pQdwCn
 z5navw8x+lMZhKqqA5PqNnFA3OJSQPQ=
X-Google-Smtp-Source: ABdhPJy4kym2w4qgOYP6EtzFEUIttQ1MJ6nkiK80RLpJItDU+oJ/rozcUM4fUszK2E5JFrOw012U4Q==
X-Received: by 2002:a05:600c:3789:b0:38c:bd93:77d6 with SMTP id
 o9-20020a05600c378900b0038cbd9377d6mr11865038wmr.12.1648887707118; 
 Sat, 02 Apr 2022 01:21:47 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b0038cafe3d47dsm4177966wmq.42.2022.04.02.01.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 01:21:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 10:19:53 +0200
Message-Id: <20220402081954.1466025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ipmiutil: drop dead code
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ipmiutil depends on dynamic library since commit
670095b4739c898a8f270b003ee19294206d91f6 so test on BR2_STATIC_LIBS
added by commit 9f31cd14d01e306e6475b750c30554043c57491a is not needed
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 4c9de26583..fdafde24d1 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -17,15 +17,12 @@ define IPMIUTIL_TOUCH_CONFIG_H_IN
 endef
 IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
 
-# forgets to link against libcrypto dependencies breaking static link
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
 IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2 -DSSL11"
 IPMIUTIL_DEPENDENCIES += openssl
-else
-IPMIUTIL_CONF_OPTS += --disable-lanplus
 endif
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
