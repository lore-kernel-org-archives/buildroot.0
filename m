Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947ECD172A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643B8606BA;
	Sun,  1 Feb 2026 20:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCpv0BCCpBCK; Sun,  1 Feb 2026 20:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF5F606C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978460;
	bh=uf3XnlwdZAA9Myts/ZROjiZfhZzgH1PXvPy11ZZUzBc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VIwcMF2hJ3Dx9gZZVjHqh8Ws2XigXPQ13SldmhO5JeqUvjo+MnEnpjX7ANC1cwo+C
	 eNSW1eIeVA3lV8bu6ro9IAzzgokb3CIGLTkSIiMqIymQiluhE19vTauUzZfd2BfgHd
	 /m1oIHD0S6RmaWF1zhBG+7IwlOHILAskAQ5i7/Z8xm0ybnieow+pars2j/hGk/BZD8
	 EKuTVJvY0VShoLFkHhkOQtJt9eHSEjutKhLqcckLk2mBLN/QmbjusGLjwyGhq3TpRR
	 FZMJy+lcfjlxDBFmUy/YQ11H3Iw3wcr4SyUtIaU+I/EzAXGYNLBs+xY+yvEzZ0ozDV
	 KbaENjFX6nyVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF5F606C5;
	Sun,  1 Feb 2026 20:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D6323E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 834FC606A7
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoFg1Wj_yUbn for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACFF760669
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACFF760669
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 960C8846FE; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:30:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3689f70f9ec9e5b14e7c26c6d81efdf24e5bbef
X-Git-Newrev: cd45f51c5ff4bfb366c9169d96b75a9b597c1147
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.960C8846FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usb_modeswitch_data: bump to
 version 20251207
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd45f51c5ff4bfb366c9169d96b75a9b597c1147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch_data/usb_modeswitch_data.hash | 4 ++--
 package/usb_modeswitch_data/usb_modeswitch_data.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 9071a72490..5175f3ede5 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,5 +1,5 @@
 # From http://www.draisberghof.de/usb_modeswitch/
-md5  e8fce7eb949cbe16c61fb71bade4cc17  usb-modeswitch-data-20191128.tar.bz2
+md5  4f91387d0f5e9c2e49cae82b0c9afedc  usb-modeswitch-data-20191128.tar.bz2
 # Locally calculated
-sha256  3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9  usb-modeswitch-data-20191128.tar.bz2
+sha256  0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66  usb-modeswitch-data-20251207.tar.bz2
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a3a98ad7e7..6d9997131e 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20191128
+USB_MODESWITCH_DATA_VERSION = 20251207
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
