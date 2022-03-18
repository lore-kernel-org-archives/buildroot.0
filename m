Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0085C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB2B83332;
	Fri, 18 Mar 2022 20:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBtUaJgaJAGN; Fri, 18 Mar 2022 20:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA648315C;
	Fri, 18 Mar 2022 20:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945C31BF2C6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90BED60A69
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK3cM29qRYfG for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 820AF60757
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647634846;
 bh=LiGsuu00yPNMomUnb4IcFT5SP/AHw7b2OOwEAn8TaRM=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ix5cTdG6Sjrv8FR4jQ7pa8bUkA/e1/LX7sS6f6vj3CdJJAOC8IKye4HOTcMctBaJ0
 t3dMhV1d0jU4+r/Hd+6MBgYifCQ3vSFWwxeEnN4IKTCfR++hu5pQiYdPN6QccwGACw
 2XV5diw/iauh4bVDxVbLvchvTW4NfAa+7w3hHo5I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.106]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MFKGP-1nKYWC3ce9-00Fi5o for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 21:20:45 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 21:20:42 +0100
Message-Id: <20220318202044.10413-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318202044.10413-1-ps.report@gmx.net>
References: <20220318202044.10413-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:b4y0Zrlb77cwROsDGWrxJI31ms3i6vtp0yCNl1l7BTmKneTrTeG
 OBYS8mG6XmFsIGnGLAdEEZqCUOzNh4uzl0QrHYBGXrgUmZhKc4Mq1jNdFCMNVmoxduXaYR/
 SEgJWmZrs+IL726UlCHnueqzMlUCK8PIvtHzxxco4u95/o1z1Q0/LFJ+ZOx9Ngt30fTVqSz
 kYSuoZBs0vs7P4BWPKlrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/tkCvbHN8HI=:9bvkfo2TBskw4CWIZ8xgdO
 rZP7A9g3nDaGcS/tXAhZwuz8PYRQ01YE4kdpeko7FKfyOSSLbDoImNRIfgxuWoLaWbDQ8Y6L0
 w+b+0K6tdAU3wFA/L2dbuOilR9mzlK+QFJAXTsyJgMAkBClC8m7+op2EDCSXFVrBsMWaePj53
 ujtJiA9E66M3Dry1CA699wAVrmjaHHuniOywsbTV8dN6KVQx59e6F0ucus7BXImirJtpW4rnN
 VD5dyUkw9/BvSI5MkaUKKl+F0SPInzaPJMONN0ZWzFyK+hc3N8FXAeYTKVm93QJLPl/+P999h
 +obQCnjNvF1bFSd7Oxw0MLiAELdXPyvONCIWe8x6xsqwrM8oWwnD0wh1wdMVUtv/lw8FIXenU
 37UnwRw/quRDEoiH4hvHhLuqf/v762JKeve0SEUCF+lo1WXYx7pfblBTszwyhvrSL5HtHRw2P
 l2GQM7DA/neQOEadxNg1FDn766IyyLey3NagvSBJGFeczb+rsSFI83qE5PDBJl8FLfybD2jRT
 T8MjwIAf+C2BuR+fwsD2dacD+4pB+YL4vhjCJ0CIZyfTu5kc+ftdElkQck01pnTJSJDFIHmCI
 9J0vVZ1zWh+Nw6ztd87lU2Dye0PJQlsRd8JF2qN2jgEhJDaZthDhGd5h1x0P95f7tOvJkYCAL
 luRamuV3ZZJeiqEUDFwEXF583Q4PlItOO6vOqoXRJMs8SceUtv/wJtRf428e7XU2EteBYMOn5
 FNvT58xQhFdZfZHmiC3tyoJbmEcv/GRQczEQCpmF9OssuVGQk43hhVkjiKb3E8hT7GTAn2bxu
 fd3S5V3uE7nAG4aEWiQbRKssKdbp5Tt3cSucV0ijRPr3CHrZdJSPa4rp4T4LCQB0lHN/kXuUf
 bjrzllqebhYP8W3eGhnuMm5b5yYMmImOosOHy8E8PiUNBIbuuchc5BLTg/WNWaYFyjOY11hRn
 rCwt+MIi03pfG/KA2A85Ye0nDfsxX12ZnnbjtspNIxIrzKm2bXo0AEMLCxBlGySrWY/LIcdPp
 9S2sEC7gB/HF8MmX7CyN1hL82d/RksuNB8CzYwV9dioLnhoONd3tIaauYIJucalpo0X25dQCm
 dmIMZBAPirjgwk=
Subject: [Buildroot] [PATCH v2 3/5] package/wget: add optional libpsl
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add optional libpsl dependency

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 7fda36f1f5..d0556e323c 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -21,6 +21,13 @@ WGET_CONF_OPTS = \
 	--disable-valgrind-tests \
 	--disable-assert
 
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+WGET_CONF_OPTS += --with-libpsl
+WGET_DEPENDENCIES += libpsl
+else
+WGET_CONF_OPTS += --without-libpsl
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
