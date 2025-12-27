Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFEBE92710
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA31D80DA0;
	Sat, 27 Dec 2025 18:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NnPzMZ7ko98; Sat, 27 Dec 2025 18:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF4E80DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766861609;
	bh=pCZy57AO/0fa4g5HqELQAZtZhKJk13ZV4UZpRuIFxGw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YjFUg6HPYj3UIQ/JPhmEGJPulqFOPNLo+DjBu0PAW3zxfj+OjoxjcYHSk+KfRRcIj
	 OKEpOTag+XdyUooVBHWxdUR+JWStSOKUSgwXkVfT+8K3eZMWi6DlnA6oD9gB7BU/Vw
	 Hsdtdg+nqSEYUNyHbu55dfa/DFBNFi2XX1a+L/j+kOFfHibFE9QmkffHUS5cvn8nNZ
	 Qu/ScdvMYpgbrRbPqN4owrIXOi++jrBGj7jgpjRrjonBWT05jsUXEvmlQj0C40Q5HI
	 Gu43AqXHmB17P5GG4BPo3laJySLTwHrVpjBOZY9PKmZVpHH5FblnAHH94L/OrZLDul
	 14C+uui3BpEdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF4E80DA1;
	Sat, 27 Dec 2025 18:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D2E7D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F2A060656
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6rMKtJDGkQW for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E83D60629
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E83D60629
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A2F2877EA; Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 19:42:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e859686460a30af0868d68810645c2208562039f
X-Git-Newrev: 38f485d2164828bc039dba4e1091b4dab2d36a28
X-Patchwork-Hint: ignore
Message-Id: <20251227185326.6A2F2877EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpl: bump version to 2.16.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38f485d2164828bc039dba4e1091b4dab2d36a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/libvpl/releases/tag/v2.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 3c60fe960e..08b2de31fc 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7218c3b8206b123204c3827ce0cf7c008d5c693c1f58ab461958d05fe6f847b3  libvpl-2.15.0.tar.gz
+sha256  d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6  libvpl-2.16.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 5b71b9bc92..4e3c4807cd 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.15.0
+LIBVPL_VERSION = 2.16.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
