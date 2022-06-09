Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD73241B5F;
	Thu,  9 Jun 2022 21:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RC7qWDqYR8J; Thu,  9 Jun 2022 21:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D9241B44;
	Thu,  9 Jun 2022 21:27:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF681BF340
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97E3284269
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id git3RPXHlW0Q for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 21:27:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63EAD84245
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 21:27:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z9so6245708wmf.3
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L4qeVBIrY516caovohxub1YJ6hewNTyxiO7CoJN2GtY=;
 b=UWZahhbLEDBaE3vqffLK9vcT1uW2Mii4jB5grAP555h8Y6aIJvFJszhoqovLYyGGNG
 bMmSnPenzBQTfZCiWvMD5Qdwc28DlFLD/5NhAHxFgXA4RoLN1tA7+PBLxDuarI1C5l1d
 3qN/QvwJZI1ZvK4ky74jFfhWBaTHc02qXyAnmMnf8tlEgcqMtZmQtkaQj5f+oMiNz+mI
 h1MAAg2WLSfKkgnrmvfQrNqLjIYq0r7icNfbeaX9SMtXvNtSpw7X03UG5y2IWFURHNgs
 0i6eBhYtHLi9tXAfPH2dnOTvbiCsD71zNy2DOlBclwGkxTpIcee0ODex3RHBZPObRSh2
 YOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L4qeVBIrY516caovohxub1YJ6hewNTyxiO7CoJN2GtY=;
 b=2awpcU4LsAE5la+psdRTm//xn3x6sJM1uNGo9u/Q86CNy1T8agadix2e6zk1L5PT4C
 4z36da52y3cgIBV+RUJiMd91lQf2hoOVaJvO7o9xxS4iCZFBvu3h+QTqYkY6UxkebYQH
 am2fRSKtsm5JOx/G2uYAhJaKxe4/Iq+ffuyhnxt+y6hEDtxAUeXkdOWfgQy8z0/UmH+1
 QfPH4s4qQIhOPcL7eKzcJ0d25ETJs7NLCUoAts7WIq+sGvFm1XcYREfPqINwXSzUoBP8
 HYC/tbIo7VaJK0ieBHbvyTRpBV/sautwWD48WrtGMJmznXMHjLbL9QODQSRn0eXzYBgm
 UoDg==
X-Gm-Message-State: AOAM531Mg50QbRVrEOawxwNZW4es+z9siqWVg/UHKYazZir+7dbsXPti
 baHy86bO+KlcHBEqy/4970wSO7Veh0E=
X-Google-Smtp-Source: ABdhPJx1QQ7iWeWkDsTJ2Uz0d2N8xm/PjMyXA0z4+BOPnrwqK+mzfan6kYjaLNHtKttag6rQZ+a97A==
X-Received: by 2002:a1c:cc07:0:b0:397:b2f:ac59 with SMTP id
 h7-20020a1ccc07000000b003970b2fac59mr5213305wmb.157.1654810062449; 
 Thu, 09 Jun 2022 14:27:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i65-20020a1c3b44000000b0039c5a765388sm470696wma.28.2022.06.09.14.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:27:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 23:25:10 +0200
Message-Id: <20220609212510.2942019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/noip: fix static build
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

Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
LDFLAGS is not supported) to fix the following static build failure
(e.g. with musl):

/home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `__gthread_once':
/home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700: undefined reference to `pthread_once'

While at it, alsp pass TARGET_{C,CPP}FLAGS through LIBS as suggested by Thomas
Petazzoni

Fixes:
 - http://autobuild.buildroot.org/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Pass TARGET_{C,CPP}FLAGS through LIBS

 package/noip/noip.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index b7fcc84e2f..1bf4524a51 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -10,10 +10,13 @@ NOIP_SOURCE = noip-duc-linux.tar.gz
 NOIP_LICENSE = GPL-2.0+
 NOIP_LICENSE_FILES = COPYING
 
+# Pass TARGET_{C,CPP,LD}FLAGS through LIBS as noip doesn't rely on implicit
+# make rules
 define NOIP_BUILD_CMDS
 	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
+		LIBS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)" \
+		PREFIX=/usr CONFDIR=/etc
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
