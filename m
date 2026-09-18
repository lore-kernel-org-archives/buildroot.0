Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4C9C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A621C40C8C;
	Fri, 18 Sep 2026 17:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8sXt6PUO6yQ; Fri, 18 Sep 2026 17:53:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 56A3640BCD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789753999;
	b=KfNb0WBauGFid7axsDigRMeJIvOGg/vz5pl6KXCOBWejEMfXVcocQJ0hYHDsO2rkKIAb
	 kRVIjy/QVMbvdSsBuxiEOeWrmjJN8Yw/hgoKAQhaq6i7IObB+dsmU01YUjZpzUWXAf/KJ
	 cLSHOsCGpxf1NgKy7qgLBLLrxvWiy1NSyBmTfFdvz3zA7oz4wj0+7pxXF+HZsN02f24Vw
	 JUsDRk3zVf/Lh2vMmGNLXvIq40a7/BeS3NBzXhE2IzoQGQfy5VQpj4/qF5nqnurZg4txd
	 75cNf/gJ8gSc+tq0Y6tbY48Vo0ffNHZFuoD3jJFbTabUBnTDMNyKJKHc1UhbJbkAMTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789753999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lA24Dxz4OmWHlNWnLohwoONftoqM8vgfLgYADGtU44E=;
	b=HD3h2TfieMZ3bQJWv9gmelyVbjH88Mf4i1+Vg3IFBVloAJ64ZAvT8c35jrSWDOBNpCMW
	 DGXzfXJ4J6KprQZUHL9BLN46oL5UCz6peimO9Y5TNmrQJ7p7gUhNmWJGtHe+a9DpMf3gX
	 4FNZS8qBCFg6f5xeLnj3s2HgvyTFPB+GUUW5LLctgxS49V4tiFx9bhCxmEpc+C2XcMfqY
	 7rKlX8VFjPPVx8U2EgVBEiUEApxXiVu3S8hIELqfl8FjRxcRfsOiPWue2imoSnjSGf+Md
	 Q7ohXFLH56POkRaL3PxI3iRhEjFqisfgjSaZUgx/3sQNNH1RBSr7odFWhzNwwv6p6Pg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789753999;
	bh=lA24Dxz4OmWHlNWnLohwoONftoqM8vgfLgYADGtU44E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mCsFGn5x4y6pNY4/+mEd21GrdKBzLlL5BexKJztRFsiWudmKPkhpGdqBgMRBOEF3Q
	 vtM1pOu0nxFCbf2z2JOzHDN7P89iCGmAN5sVxX3oii445ruHJt10mFZWBTmP/3V7jC
	 5ydlZi/JZlmtN4zMxMqcwZtq4ryNGYUb3OaW3uXoR7YNv61wRd3/HZCnZl5saKfCef
	 ww8O7dxPwY3sxecb+VgMp8M7GnDd/AA3j3Y4Z7m/Hww50g+fmwO3N7DGiItyrPnY2c
	 lXPwllNSps11cOukwJLYVU97qDtSCyTFk8abpxm3AcBA+zEftWo64EykWXS2RxEaQf
	 l84uKdtmDQDNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A3640BCD;
	Fri, 18 Sep 2026 17:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9573A42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F7B81303
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FS5tdKec2xvn for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:53:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 843F0812FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789753995;
 b=RkrKtfCM54PEjAEht5MsQUUDD0Q1hs1dUf2KWTN3bzcPfg26CgAVp7i2HcmK3H/yTbwp
 NtFfspm/To988j2k74bkw/91wGDxjcsXKYc6CeHcw/NKGspDzi3OVsTaQKfEkrj+44jtF
 +CMi+uMOG40zhYaPP5uJ0S7nmB3N0zd8VIg6CiRbkVTyJi6OjeKXZ/PC2//c9XLwU7ulT
 IxC1hLwp+QJCkE6ac6YwgNvxVV0Jz/NhhrEBtB+tcB9YA+wcerzz1R7OwD2E8vMTtAFvz
 r8yTKGRlp/mCAzh6eyTqzQWNMBBXXn3h7lFNA8CtdOUH183WXNhUsd+WgQHbxesPs6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789753995;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Yn+1mdMz2d9mpibljI4IT+2bQwB5QeJrH+jKFhAL3VE=;
 b=AXoaSzfkTkb39F5MDuOoaTSJ0ieo+9eaXUc8x086QBFITap9drRn7GBMu8wvje+H5ZQ2
 HAxnM87m+tayJvdI9T9t7e3VAs2fpmBXP1XMq5HNmbqTUCKIKDdbVnMN0HfFiZQfQPD7S
 7/kVqVt+ALu3HJskWIhMeBtqhBc29qd6atDPTnzkMlEWkuTHZbYBNYe6ALcUbrU6J4N++
 RxOK3QujxQ7zUQc97xcoYsXgKhPmBhs9kJrnZs8YnvAGoxFxvCoRaXdWtvtB7seppePCU
 EClKj5yuPdMBkqACqivkAU80Rz6DJDbDqRAhvHYJEdjmmygCDl7s+NHktDydbaeN2qg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 843F0812FF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC0297694; Fri, 18 Sep 2026 17:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 19:41:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 098be4f99a33b9ca67e2edfc92c517a66097fb2a
X-Git-Newrev: d24f5fcc20c3ac2b63a75835050559c3f43ceaa6
X-Patchwork-Hint: ignore
Message-Id: <20260918175208.1DC0297694@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to 1.4.85
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d24f5fcc20c3ac2b63a75835050559c3f43ceaa6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for changes:
https://www.lighttpd.net/2026/07/08/1.4.85/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index d0ee0a5da9..2e7bf87409 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha512sum
-sha512  47d3e802093822f5aa42b9b3324a95668d305c2e2074366b12be9bc812291ba423576e08b2a163a5f752b110139a76c7973086fbc01051f8f639998d8146ed00  lighttpd-1.4.84.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha256sum
-sha256  076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70  lighttpd-1.4.84.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.85.sha512sum
+sha512  b5fb0039d0f3a54eda55229f762868db4a5941532448036a83a12de3065f6fcbe04f57f8be030a25ad6a82cabc014474449ebb01f0a23d08c23bb729737783a9  lighttpd-1.4.85.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.85.sha256sum
+sha256  18de51b393bac4a6827879e1a7ff377c169e414bae92cd245091d80fc2601d13  lighttpd-1.4.85.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 613715b889..a7fe074824 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).84
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).85
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
