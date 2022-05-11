Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DFAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 00:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CD68319F;
	Wed, 11 May 2022 00:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z13h2n6VIDzv; Wed, 11 May 2022 00:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94DFC8139D;
	Wed, 11 May 2022 00:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC25A1BF2F2
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B23F341866
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igS2XPQhtQnr for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 00:19:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA0234179A
 for <buildroot@buildroot.org>; Wed, 11 May 2022 00:19:50 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id x12so352336pgj.7
 for <buildroot@buildroot.org>; Tue, 10 May 2022 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdm118g7SuJWyyMoIlr/9Wr34ALK1mCQbom18/9QsUE=;
 b=EPzBaqwhXp5FHdlOeLgrKa17hcU2z5R4KMdN2sJxQyN5zCx0rj9PwqJX+TIdrNvwgY
 MZ56IUrC8y7RMgC9XXi6ON2hLwxWjRdqw6SO4XsqNPAs3t9T9DzgjkcDYCJ9M+H3ijV2
 IygDg+ORQsyv6A1wKoQYQ/gFVQRMZW4ZkD+i8qwg5XF6zYW/kzJmTHjg3MNDYUzWzJUh
 rFzTgjHGywbrhH0bgg6cvGQXYKCon+8PLX2WTQhF3aoJ3VTD3O1Z+B7tTWMwFqvVgWrd
 LqO9L4TObQ4NoWuIenl1a4qehuD/Bk1lxhOvSjB96ayhtDC2MU2s/ZBsN/KaMyjdr56L
 jf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdm118g7SuJWyyMoIlr/9Wr34ALK1mCQbom18/9QsUE=;
 b=g+MDstjHtYNhr6bY4iCiCrF4Og317HAAoAYAB527sMzWniTpuIwux/dWd+GLjFXRY+
 dO8Frgr+fgcsH55lCOr/Dg+qxFW5mU/DsTjoBioks0Anau1usFJdlZo0Mx57kwOk6Y8z
 OJKzhJKdwfW8t3FtTh4/F2Lz0wsw6NWKLr6z2RAztAIOdgmQ3JHUtkopzTYQOMzXT6E/
 kPgquLyk/DsRq+OWsRPCf6e3vunzVSVbwCsr9yGrjl6deUIPrREnFWa7YCVhaE35jLcl
 zDoDDGWwSnjGJx7ckFbqnEtiv8qWQi36SrOSxywBAZJwKECzGNtTnTqHgPVLexfp5ApA
 T9EA==
X-Gm-Message-State: AOAM533EWP0MES6owA+0HGOe9cnHh3COhG4cy6fWuaRDyrzaGBJ7qsvp
 MEqEsUs6ivxMHqdOyrGvd2JlSnxSxog=
X-Google-Smtp-Source: ABdhPJxjrVYnE+2WFH86Hn8u1Z/QS+7oNpPQ0Vo1EhS9kFzMZAnWbQTkcskJ7P6lMrBvb21SzDPOhQ==
X-Received: by 2002:a63:e155:0:b0:3c6:7514:6c0d with SMTP id
 h21-20020a63e155000000b003c675146c0dmr14764188pgk.249.1652228389749; 
 Tue, 10 May 2022 17:19:49 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 ha18-20020a17090af3d200b001cd8e9ea22asm2460389pjb.52.2022.05.10.17.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 17:19:49 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 17:19:47 -0700
Message-Id: <20220511001947.2112747-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cpulimit: Disable build on OpenRISC
 with musl-libc
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in the following autobuild report:

http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/

cpulimit does not build due to a lack of definition for elf_gregset_t
which is not currently provided in the or1k musl-libc port. While this
is being worked on, disable the build for or1k and musl-libc.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Fixes: 9e8e80d1e335 ("package: Add cpulimit")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/cpulimit/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index 7cab152fc0ea..cca74afc9955 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,7 +1,12 @@
+comment "cpulimit needs a toolchain w/ threads, does not build open openrisc with musl"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || (BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
+
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
