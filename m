Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F41EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 12:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A755660B9D;
	Sun, 25 Jun 2023 12:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A755660B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKH1rZ9csiJ0; Sun, 25 Jun 2023 12:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C49CF607AA;
	Sun, 25 Jun 2023 12:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C49CF607AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E69E71BF870
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA5C440489
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA5C440489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZrxQHUELNmx for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 12:33:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23317400BA
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23317400BA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:33:30 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 1B42EA0582
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:33:28 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 00E908014F
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:33:28 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id C4FAFA0253
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:33:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 14:33:26 +0200
Message-ID: <5686076.DvuYhMxLoT@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2647
X-purgate-ID: 154282::1687696407-C3715647-11B7D8BA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1687696408;
 bh=yBeR890aDJfupuBvNKB5rM7aC3GBSVy3MuMyB+QUdKQ=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=1PVvPLc9+KirGs23AHm656yqX7qe6VRgfhwnplrMk2CDtUSoJA2trzN5D4WfKnNH9
 nrKyamFpxes3IIJS0Ptl2B7FIlvfZEAZOzduZF1KZ87nbzkgRIG2dfcDdWgv0cVuLt
 4J18MQnOGZ+yyG0ds6WAatbM15nvUFFDVGNlgeezkbako7UGZBCIlfcn98iEwXt+AZ
 4dkjzJwj31LmLqIxrrxvjEjkfjKLYCD/vlN/eh1OQMP+b11qb9IiwPZHP/XfwF973f
 sB1P1t11rlYHEGh9T1MqfKX6EufVZVN4eC4MeTriZKpaaQybKE0YWprfAzkicMINM/
 RGOgitmcWxawA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=1PVvPLc9
Subject: [Buildroot] Problem: Setting Uboot custom version does not apply
 defconfig
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am having issues using the custom uboot version feature: When setting a 
custom uboot version value and a particular uboot defconfig, buildroot seems to 
NOT apply the uboot defconfig properly, i.e. there is no .config in the uboot 
build folder. This is the error I get (further below my settings):


>>> uboot 2023.07-rc4 Patching
for p in  ; do if test -d $p ; then PATH=/home/zinnecker/buildroot-test/
buildroot/output/host/bin:$PATH support/scripts/apply-patches.sh  /home/
zinnecker/buildroot-test/buildroot/output/build/uboot-2023.07-rc4 $p \*.patch 
|| exit 1 ; els
e PATH=/home/zinnecker/buildroot-test/buildroot/output/host/bin:$PATH support/
scripts/apply-patches.sh  /home/zinnecker/buildroot-test/buildroot/output/
build/uboot-2023.07-rc4 `dirname $p` `basename $p` || exit 1; fi done
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
  LEX     scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
make[5]: *** [scripts/kconfig/Makefile:75: syncconfig] Error 1
make[4]: *** [Makefile:576: syncconfig] Error 2
make[3]: *** No rule to make target 'include/config/auto.conf', needed by 
'include/config/uboot.release'.  Stop.
make[2]: *** [Makefile:558: __build_one_by_one] Error 2
make[1]: *** [boot/uboot/uboot.mk:553: /home/zinnecker/buildroot-test/
buildroot/output/build/uboot-2023.07-rc4/.stamp_dotconfig] Error 2
make: *** [Makefile:82: _all] Error 2


What I did: I want to use a fairly new uboot ("2023.07-rc4") because it 
features a defconfig for a particular board ("rock5b-rk3588_defconfig"). I 
therefore use the following settings in my buildroot board defconfig / .config:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
BR2_TARGET_UBOOT_USE_DEFCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"

The particular version of uboot features the particular defconfig. Also, with 
theses settings the uboot version 2023.07-rc4 is downloaded and the rock5b-
rk3588_defconfig is present in buildroot/output/build/uboot-2023.07-rc4/
configs/. However, as said previously, it seems like the rock5b-rk3588_defconfig 
is not applied. I don't know whether I am doing something wrong here, or 
whether it is a bug. I appreciate all help.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
