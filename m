Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE18CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 213A8409B4;
	Mon, 18 May 2026 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsJtXOdboG5y; Mon, 18 May 2026 20:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB144073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779136505;
	bh=Whwn1ChHLd5eqfhmDZJEJ0QlYjrkmAEXgqC9FG88olc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eWTwqVkaqwja9mBDEzKQkTNQVtd3iRtKdEaVB7cztQL/TXOdyH8ErrXCQo/R6J2Nf
	 CAe2ZJw39yMkm6LuHU33gLPgtkPuFMmu0DEr4QY0S7lxCF2pF44/ED8sIaKmKee5xY
	 7xepkIT9AGsFdY0WREd9Vf+0QBUeTGKBJMyTXSdH80KkrcbsqH3/wmDUNJ6iXKgwYl
	 7BwFAGO7EwGN7fQDhE2RCNsRrq/uv5EpAXFRzZBtR4EzNeSynedL9K6eUOJgcLNTGy
	 18rmvw5b0V+hSvmew8W1phFP7l9IbN1MsRB37Gj/kIoAukrC7LE/IruAd+8GwIYI/m
	 7XFp0/SuSMJAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB144073A;
	Mon, 18 May 2026 20:35:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 724AE282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5824080F6E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNc5iPkrp7nf for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2568A80F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2568A80F75
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2568A80F75
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:35:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1xOhhj3rLE-00ssAk for
 <buildroot@buildroot.org>; Mon, 18 May 2026 22:34:59 +0200
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:34:49 +0000
Message-ID: <20260518203449.10591-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+Xko5aTPq0GBzCBzBudkMLDApLdoDyMaIFJMJRvWHeylgQMiYKy
 ZzAgOcbixbcn++4f3jxlBsDke9lICQEC9DUj181a19OvA+txszLAd2ByBi3sS8xtxMshCSI
 s+V4AeofGk+RWWiGSqMn7ZhMT/3LH/RQEnnfnMz7YscRPkR5cFSIylzdDxeUm/3atYS7Yx3
 e52bn1pU6/gN6AMszTsCQ==
UI-OutboundReport: notjunk:1;M01:P0:M0FJJyZIrXI=;fXV7QdhqFlsTH1nR567yk5amvIG
 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
 JneS3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779136500; x=1779741300; i=and@gmx.li;
 bh=305JAarzO2YNMHm+P+1fWm7o5sgCvaEgoB818VEPucg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZSNzCx1V4dP4Jbp/1BV2WvLkQNwAwTdtzG3m7gyxw3vbs6zl1e21ALm4XDNFwcvk
 Hu+gWfxCN0y4ut/xh7m/DaBWF/TO/+x4wSBIMm7ydjMThsiUQ5L3bDXw1pHQ0T/Cw
 oJybliZH5nbC4ZGaO6lhZlVl76lsx0wemu7XotftGHSw8++dc+DEQyHjGUR68gliB
 cGr61ofq3dsqUh4IEyQvSSnn5RG17p0skIjRtEeV13+qNdJzVVBXHsrizxxwWBbiV
 MbMVNdk//LGeC84YhsPyClfBEc7De3mMU9bEqcb1vi4l+zrsn74klkqwLEMIEEj4U
 XZHqJdNYulXMeuujyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=ZSNzCx1V
Subject: [Buildroot] [PATCH 1/1] package/lvm2: enable static build for
 device mapper
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add static build support for device mapper

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/lvm2/Config.in | 9 ++++++---
 package/lvm2/lvm2.mk   | 9 +++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index ddb398d1..922766e3 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
-	depends on !BR2_STATIC_LIBS # It fails to build statically
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -26,13 +25,17 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
+	depends on !BR2_STATIC_LIBS # It fails to build statically
 	select BR2_PACKAGE_LIBAIO
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
+comment "lvm2 standard install needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
-comment "lvm2 needs a toolchain w/ threads, dynamic library"
+comment "lvm2 needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a1dded5..465d3200 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -48,6 +48,15 @@ else
 LVM2_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# configure: error: --enable-cmdlib requires dynamic linking.
+LVM2_CONF_OPTS += --disable-cmdlib
+# configure: error: --enable-dmeventd requires --enable-cmdlib to be used as well
+LVM2_CONF_OPTS += --disable-dmeventd
+# install static version of the device mapper library
+LVM2_CONF_OPTS += --enable-static_link
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
