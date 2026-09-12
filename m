Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5C2C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FAE14068E;
	Sat, 12 Sep 2026 21:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mp4VzWtxc0Ah; Sat, 12 Sep 2026 21:13:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 006D340698
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789247624;
	b=BHY9lDytjZR2RyWGDtMXCpA74nmVokyjvzm3RfHacYByefETaQckPWgJfT7ZMnNJp3U3
	 KS5z5RbD9kWBdziV2koO2PI2mhD9XNVSlyJNbwL1HpUT4n2uWbuEI/1ZOiq0CsziTlPyZ
	 MbPl+Dl+8EC0eYdTdj68puobQ46aUp+ckCnYWeaNsl+nq/bg0vCPPH8E1xZcCDDGPr0aw
	 gPoAdE0IhkQAHPwhhpqB0v8Ey9zI8euAxDJBd5pQgS7N9XxCcjyfMi56QiwMcQs+vG/4X
	 A7U38MguPa6JuCPFQaPTx+4FxwSUngMSLgTwpHlFzo2E0W/yoFE2ek7jOTF5Kpd6Yiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789247624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Date:To:Message-ID:In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VMg80vYZjeilR3sD9SIvX2j5GmdY1jjyTd+62mGeqxg=;
	b=kjjAXIM5yrY5KP+JxV8Xz+WnSzSln9crcxEry9Qk43RVGfTNaWucXLzKFy0rDmes/OM8
	 OJosRUd2a1jE/D7+WofNokNk+z1RNVJE9KhXP9o1m2Sx2RmEhV894RsoeObbUIXIT8H0/
	 9uJ5tlp/SWvkT9QqQ6r4OJW8VsKUx1H9FkoNXvXpxWNQd62/FNOai/XkIoHgka0xprBeT
	 7EZ+BcDHYdYcbu451ykXewA9WbqIP7YLiSyGmZ7IZetttMymbIDI40On81zQJRGcMqd3s
	 pbXBlcMh6lNIrRUWwqiFewvBab4zs3NXQr4mX/AOmVbQRwU6a0Y2U8ss8oyqdhM6Ahw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789247624;
	bh=VMg80vYZjeilR3sD9SIvX2j5GmdY1jjyTd+62mGeqxg=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LS6rW/MvsuyfrjYKmKpce8vDeJN3AUlPPDn+JDYB26lJCc8DNvmGQywrimm9atp4W
	 cHkjZS2Om7Oc5+yb5OoFwrdzQWFYgV/dCWQi8GNoZ16J77HhxxXzapgd0+RVZoMdt5
	 T7m4JTmTtdQ7FSWB9+qhlADECu7gWhRbH0HEdhYisF/gA0c4wSuG6E0OGIWvofxPro
	 Ybz1Z6liZp9UZgATfXSNk01v4+yhYLg1rmKMJi6bIBklmc2BGOXXothYMw6/roQU94
	 FC9CZmuA8WPS2Vi1DlVnZocmfRJ296mev98j/roWe2swQ8EYpZwCKNDWIP4ax9F6cI
	 qLuH1XYmylEVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 006D340698;
	Sat, 12 Sep 2026 21:13:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3E3823F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F15D260607
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFIIn81aVDGr for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C12960601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789247621;
 b=ixVlW1AD/qoSvOf62vp7bryg3whOPa0gbjasrfX8f7Rqc3m8tiNCBOiPJm/F1Wyf2wV3
 oEAvLcKMH3RtTuYoYS/6t8mfoMnRm5gp+mReKBKIjsWsLR7JZzTPOTllvRbfVnkSaNfvp
 oPFTXtpRhdYlMuqA1SZXUFsc+MrIwDfR8q9p1+xke/8BsJp8W4NrR3qK3WkJ97d03nltr
 I9n9ENtGPWFqSeDP9UfK793LCXNHJTOiF1mPDN5gbKhvnXJEg9CPj0lgPYPUgZN2JteqK
 qetm9z3ve/rAKFAOE5MvLtjikZFIFpc3ekaYujbvVx47oMYdgeqgW4/38cE+ndB5Sdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789247621;
 h=X-Greylist:Received-SPF:DKIM-Signature:Date:To:From:Subject:
 Message-ID:In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=fQgBZjebnMX9ylKxsv1nBtKUkYoRqxRbYGVJx2A4kLM=;
 b=peGHuJ3z+hwFzY7JkfyC/uZGxKjretW+HO6LHQhPviTbOp41FAWU1QGMxBJ+Wpc5bVoo
 IlrkB2W8fLgAuWl5Q4ZS+tm9syHLAeOXxdbh70quyb1DXFWXuq+Pcc3vla94VlTHQMdDW
 yXsWbXylemmABQPKsFMUtIy5ts+xeKbWI1LhPBWRKYO0v0sB3kQVnSD/LIojmo9irQ9mB
 BMoi7ATDvSDbu+swf9L5sKYmKRpgX4WsJhMvETKFVLFuRUdYS42w4V8M00FBcjhNGBMEJ
 /uJQFDavyGjfR4auYn6FokVxrfQc4BEeIJkWO4nOWEbPboyEd/R7atiDU9EGaS1Aw6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bitheadtech.com; 
 dkim=pass header.d=bitheadtech.com header.i=@bitheadtech.com
 header.a=rsa-sha256 header.s=protonmail2 header.b=lpUTKAPW; 
 arc=none smtp.remote-ip=57.129.93.249
X-Greylist: delayed 109216 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 12 Sep 2026 21:13:40 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=57.129.93.249;
 helo=mail-08.mail-europe.com; envelope-from=darryln@bitheadtech.com;
 receiver=<UNKNOWN> 
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com
 [57.129.93.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C12960601
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:13:39 +0000 (UTC)
Date: Sat, 12 Sep 2026 21:13:24 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <TV5v93tJCMkWFuWyn705bhWk7crBvzx_nfamsgBJ5NOB2dAHEFWHakr42UbVthz5n8IwvqFfjVt0m151cIIC3QGtG36zCFsO59sc-a0qw1o=@bitheadtech.com>
In-Reply-To: <AHK_6fFknkWnG3Iz8WZKEwD9_rVgqsUOgjqu-wpOl5DtVm_vQCm5eS4SILy34w4HfScRe8KDAWio4n1XGnID82uMrtIrQeNPK1HPWE68Beo=@bitheadtech.com>
References: <AHK_6fFknkWnG3Iz8WZKEwD9_rVgqsUOgjqu-wpOl5DtVm_vQCm5eS4SILy34w4HfScRe8KDAWio4n1XGnID82uMrtIrQeNPK1HPWE68Beo=@bitheadtech.com>
Feedback-ID: 33277121:user:proton
X-Pm-Message-ID: 4d00fc5b3e2c342d3410cab1f9fa30572d1c1578
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/am33x-cm3: fix gcc c23 keyword error,
 update TI git repo url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Darryl Newberry via buildroot <buildroot@buildroot.org>
Reply-To: Darryl Newberry <darryln@bitheadtech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Darryl Newberry <darryln@bitheadtech.com>
Date: Sat, 12 Sep 2026 02:15:23 -0400
Subject: [PATCH v2] package/am33x-cm3: fix gcc c23 keyword error, update TI git repo url

gcc now defaults to c23, where bool values are keywords, which breaks on typedefs in headers. Add -std=gnu11 to restore earlier behavior and allow the typedefs. 

Update Config.in to show upstream url.

Tested build with beaglebone_defconfig. 

Signed-off-by: Darryl Newberry <darryln@bitheadtech.com>
---
 .../0005-Makefile-add-std-gnu11.patch         | 25 +++++++++++++++++++
 package/am33x-cm3/Config.in                   |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 package/am33x-cm3/0005-Makefile-add-std-gnu11.patch

diff --git a/package/am33x-cm3/0005-Makefile-add-std-gnu11.patch b/package/am33x-cm3/0005-Makefile-add-std-gnu11.patch
new file mode 100644
index 0000000000..ce007a8f33
--- /dev/null
+++ b/package/am33x-cm3/0005-Makefile-add-std-gnu11.patch
@@ -0,0 +1,25 @@
+From 9a205026596690853bdefe1ca48d84900965c5aa Mon Sep 17 00:00:00 2001
+From: Darryl N <darryln@bitheadtech.com>
+Date: Sat, 12 Sep 2026 01:13:12 -0400
+Subject: [PATCH] patch
+
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b4869c494593..602d53c4b82d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -W
+ -Werror-implicit-function-declaration -Wstrict-prototypes \
+ -Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ -Wempty-body -fno-strict-overflow -fno-stack-protector \
+- -fno-pie -fno-builtin -g -I$(INCLUDES) -O2 -MD
++ -fno-pie -fno-builtin -std=gnu11 -g -I$(INCLUDES) -O2 -MD
+ LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
+
+ EXECUTABLE=am335x-pm-firmware.elf
+--
+2.47.3
+
diff --git a/package/am33x-cm3/Config.in b/package/am33x-cm3/Config.in
index d33dfaa613..d4adc9eb9d 100644
--- a/package/am33x-cm3/Config.in
+++ b/package/am33x-cm3/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_AM33X_CM3
  help
   Cortex-M3 binary blob for suspend-resume on am335x

-  http://arago-project.org/git/projects/am33x-cm3.git
+  https://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git
--
2.47.3   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
