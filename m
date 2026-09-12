Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C561AC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 06:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F7C407CD;
	Sat, 12 Sep 2026 06:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeqFPFCqoKrG; Sat, 12 Sep 2026 06:31:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2DF2F407A1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789194694;
	b=ArNZUSaX+UOHqVSZGQVnrZ6Lwd/m3ad/vUWIbe4VCHEyBn8sr7IWH5oADOWd9UzOotDX
	 G3r5qiWoLr3flaWMJuXR4H0oyA+fhSTjh35dGbBc2LxS0WY3+XaR0jn2NOXCu41vgq0U0
	 X15RWyfe/1cKCIvHhRknqOdsfjQA/igtWbAMBzi201yTw5vVcm2lmplGVc/YGK6GOI1us
	 9hgwiAAgxcVTR0QeiQx1r4AVfDNW+o/OkxzfL4v8HjGRzAG+m1rvcnDtcQoXEi+aJ7Yyc
	 9emIMLIJDcTOSShII33Nc+GR0M3YGCQJocF0d29O/xeXkOLZ65GddI3iBvMYL0yhfLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789194694;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Date:To:Message-ID:Feedback-ID:X-Pm-Message-ID:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Aken9WVQ8a4nvNuBGemulBaRAmDjnn7n+Ul9ive/mwQ=;
	b=jqSzkI7/nCUKRHfiWt5JgBAc7cVxUy1xISFf4/2r3HtJf59xsoH+REQJmjteqtd44QMl
	 bRU9feRk0ZwJmlQ10b/SYfpdZ1Gai3ySveY/IH6GNTyA4Kx1EmcuVnPhHJS/MDcbGDN2a
	 yRRgJ/MQBHuCFPrq/9HzTsYR1MlNCU+4iqH9tLs7yH4mtmoyKJMHBEZTAZz6lxj7eybPi
	 na4ZNb9wX039RhjEqiDOGGZojZJfHNevC1ErgIPbDVmlh8Sqk3fSni34bwp/mHXTokdeS
	 tLpPu1H5G9Ei+e+/oWxEQmEb/NJd9OOrWa2FnDjleBkiZGFAQaT1SGriDSFMdq7AR0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789194694;
	bh=Aken9WVQ8a4nvNuBGemulBaRAmDjnn7n+Ul9ive/mwQ=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jJ+yhLUYDUzUn0equ6ajPzWVjhNfxUqowERDkGPsL865m5944skSOA3el0IIhGJif
	 cEVAjJL//T3wMTtBIg6FROFEt3KRzBJXe5zQWDBMOA+rnK4TnsI1gnFmT43G4Vecq+
	 vD10QrC7zt/pI5dv+wK1xNxA62xtxaGVcD/f+BvC0lMLjtH/5GP3uujRjQEy4JJi5n
	 iEJsnsk245mK2Ce9UiPFN5J1n/zPmWVwqCheIjtXzo+eBHR3QxksJVKViKEYJ+GNbA
	 N6qoaca962O39VQ0/mLRVbZpW/aoB7ydIWsm9FNFxtCIwu46MYsrLnhKqOjN3RO37c
	 7lC2RKbAbtPKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF2F407A1;
	Sat, 12 Sep 2026 06:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6679701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 06:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB73680EC6
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 06:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TgfBl7dsQ6E for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 06:31:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9E3BA80E3F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789194690;
 b=UpFtra9L6f6nQZZAT21bM4zUcKAw8yNzD2828Y4ej+coGkqhkRfeANS35Jvuk1oLwkyc
 v86bh+hKhdzkH6HmB1+C0Sppv+GDGlf0F4o1OmP/FYYg7Hs1Lk7+n7xoXgOPwgHTcHuuk
 0qj+MMWg+2HOfTea5Z1mN6tNBeng1WyAF6Aq6xwI3nFm8sXtCBkbKXiNBX+NLucDQXhTa
 i+/gznob9X5HTp48AGf8zVPPhUdaEN4NAuxZt3eCNJDWnVyeSR6oxJ1MZO6Rwxf+gr202
 OU1Dg88d7qq52PUS8USP1Y602u7Y3nQINWm5LugreEvU1qrjdsYeDbozg7C2w07MiZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789194690;
 h=X-Greylist:Received-SPF:DKIM-Signature:Date:To:From:Subject:
 Message-ID:Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=jxr631ThYlw8C1Y8v9aN8+WL9somgWiv+AtuYM3T3VI=;
 b=gdQHkhUJuEhH5BIGETinRHlQYjfZJxvnO6FuvZug9O+ImS0+Uyk+b3jYjHHO5m8dg2dS
 1lCb7ZKfRrhK6FQ5nBVa1xqY5shZljfXaWjcfgnSW4b3SMaZkLyMQFL0dxFIGKzsdzF/K
 E+azT/nRot+CGEIFw/APaaqsBFsDYSYNn4SlwE/YhQ15qyvI5A0bWeUYn7G2Qf07ABKtK
 YYB5KAzbH5NeAaIeyGqbx4Zq1wP9RPhmSLTIpx4e5A4ew559uApySJhmXc4arLfyw+GMJ
 uy8hXcya0EVzka+k/DGF1rcrq6qiBw0LWccCG2eF3Hvsoy+MpkHlgub1FI67ngNh+tQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bitheadtech.com; 
 dkim=pass header.d=bitheadtech.com header.i=@bitheadtech.com
 header.a=rsa-sha256 header.s=protonmail2 header.b=hYh1lSmu; 
 arc=none smtp.remote-ip=185.70.43.20
X-Greylist: delayed 56291 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 12 Sep 2026 06:31:28 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.20;
 helo=mail-4320.protonmail.ch; envelope-from=darryln@bitheadtech.com;
 receiver=<UNKNOWN> 
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E3BA80E3F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 06:31:28 +0000 (UTC)
Date: Sat, 12 Sep 2026 06:31:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <AHK_6fFknkWnG3Iz8WZKEwD9_rVgqsUOgjqu-wpOl5DtVm_vQCm5eS4SILy34w4HfScRe8KDAWio4n1XGnID82uMrtIrQeNPK1HPWE68Beo=@bitheadtech.com>
Feedback-ID: 33277121:user:proton
X-Pm-Message-ID: d15f6cb103688e6b26032f3907e3d49406a6a553
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/am33x-cm3: fix gcc c23 keyword error,
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


From 8a1c59ebfd9ac455c2c72f6fad2af90e60877417 Mon Sep 17 00:00:00 2001
From: Darryl N <darryln@bitheadtech.com>
Date: Sat, 12 Sep 2026 02:15:23 -0400
Subject: [PATCH] package/am33x-cm3: fix gcc c23 keyword error, update TI git repo url

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
