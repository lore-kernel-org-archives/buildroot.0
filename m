Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFA91077612
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94654174A;
	Wed, 18 Mar 2026 20:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwgWCTZRmYnT; Wed, 18 Mar 2026 20:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B034174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865950;
	bh=/VCo+VY0kBaUsnsRn1hS6jPWLiBDYvHJ8AwJBrjt1LU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pi491vaYTfakwD57ja/LTs4AHr7Hpl6ahzy5fwvQHS3xAO2PvjdkAYG2KWhDcrQuH
	 xeUOPoSeEJO7V783tBHkAFGFWi64boChFsw960oVeaESACmtSGyT3dH4CaGtVPsn0q
	 TvhxvYuKVSPViCEDlc4wi3Qlqhd1CxAdXd1Qf3BlCF1JeKJBsyNBkG2KCGPpwaM17Z
	 s+NLA+mWnzsR8GsYi4TpWThVm5YxTi+g+Mgfwb6skKja3A4FZIByXHHBGRVi4y3euY
	 3O2JKqz7920fuPt8tEFIEpow+7I6y7TzD25QitD/lAtvk82fFd/4r26zKQ5q4kHjQ9
	 bsTO0mksVtn8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B034174B;
	Wed, 18 Mar 2026 20:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A8421B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40BDC8372B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHv-D-4X3_-2 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6172A834B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6172A834B9
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7780484AC0; Wed, 18 Mar 2026 20:32:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 21:30:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256490256badc5040ab2ba09b25ea1cf04aa71ec
X-Git-Newrev: 79cef8416ed67d50dc4bd30a64f712122195c7a6
X-Patchwork-Hint: ignore
Message-Id: <20260318203226.7780484AC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daq3: bump version to 3.0.25
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79cef8416ed67d50dc4bd30a64f712122195c7a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/snort3/libdaq/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 4a24f98173..524c0eb868 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c0e8535533720a6df05ab884b7c8f5fb4222f3aac12bdc11829e08c79716d338  daq3-3.0.9.tar.gz
+sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index bab957e052..ec3f4ba670 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.9
+DAQ3_VERSION = 3.0.25
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
