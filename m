Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E054DCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 20:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A182461AE8;
	Sun, 24 Aug 2025 20:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DN-7Vg2OndgE; Sun, 24 Aug 2025 20:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C078D61AE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C078D61AE0;
	Sun, 24 Aug 2025 20:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A18B519C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E1F416B3
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vt2sOgCte4wq for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 20:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4104C40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4104C40104
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4104C40104
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:40:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from thinkpad ([213.147.165.25]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwUw-1uXeA40StA-00trvC for
 <buildroot@buildroot.org>; Sun, 24 Aug 2025 22:40:04 +0200
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 22:39:03 +0200
Message-ID: <20250824203903.988923-2-dalang@gmx.at>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mEqgmTHe2P+/zP2Gd8xyDxi3JkT2T7+a19NR3WzOlG9DLWA0LF4
 ApDUA5NTIXTuVq67J3rmq3Bnn4hvuWILnRPOM2iNOuy19s1V404eKOFxKF3kG1rqTstTWyW
 AEsnoIH2302xWCY3mNdaVDBTQCFjt6l9HoYoXG4PpgbUWdgzcgqXgrY8Qh1+Al/QTeqYrKi
 FilNX4RoZtX8g+vwLu4ig==
UI-OutboundReport: notjunk:1;M01:P0:P+XoWsGBF1w=;Ajp3gdGvXFkYIWAPucISBy0Utv3
 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
 nLHruSWqhM5zV8MoghXNRWU2PKMc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1756068004; x=1756672804; i=dalang@gmx.at;
 bh=yKbhps1d6yw2AWLpQ3vcaHFMQQ5k2dPh05w0oYSFfos=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=U0/gxB9LwIbxrKjpcLOpxYKIEwxuPfHyLTKtpeO0w1yeDuO6LDgkqFmQi6zhTfsc
 gJWL0EdNAvykoaBWeZgqFt45nToHcTcfA9nmiWMs9eHh/v23ETu5KmddaPvxyBmus
 pu3XvHyGJAZpqu5CNO7Y9bRfh/gwWDJLP/1SPfh0fTpP3iRhumlgTdmGn/CyclqBH
 gO7fxBhEGgj9HLhvl7bs1stTkr45SxK7lGQShUg7pEiuBWwe6M3KU6krvKQQybCKF
 yFo+F/umXLDhxm+Oxj86fx4lFljLIKAXniUYSGFbAycGMPHZbKNLTddGDUf9bvOUh
 f7FEOcnysaaEsFr4WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=U0/gxB9L
Subject: [Buildroot] [PATCH v3] package/vim: security bump to version
 9.1.1684
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:
- CVE-2024-41957
- CVE-2024-41965
- CVE-2024-45306
- CVE-2024-47814
- CVE-2025-1215
- CVE-2025-22134
- CVE-2025-24014
- CVE-2025-26603
- CVE-2025-29768
- CVE-2025-53905
- CVE-2025-53906

README.txt got updated three times since the last bump:
- [0] updated some wording regarding who the developers are.
- [1] updated the link to the release archives
- [2] updated the goals of the project

netrw (the builtin file explorer of vim) changed maintainer and was
subsequently restructured [3]. Therefore we need to run installpack,
otherwise we run into this on startup (reported by Julien, thanks!):

Error detected while processing
/usr/share/vim/vim91/plugin/netrwPlugin.vim:
line    7:
E919: Directory not found in 'packpath': "pack/*/opt/netrw"
Press ENTER or type command to continue

[0]: https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
[1]: https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
[2]: https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2
[3]: https://github.com/vim/vim/commit/9cfdabb074feefc9848e9f7a4538f201e28c7f06

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v2 -> v3:
- update version number in commit message

v1 -> v2:
- update to 9.1.1684
- add installpack to fix issue reported by Julien
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 194bcb4378..ae909aaeac 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
+sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
+sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7d51a6ddab..4297bdd198 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.0145
+VIM_VERSION = 9.1.1684
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
@@ -49,6 +49,7 @@ endif
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
 endef
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
