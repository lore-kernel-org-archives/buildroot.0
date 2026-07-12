Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A23C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC403811EB;
	Sun, 12 Jul 2026 15:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHQ4683o2C2E; Sun, 12 Jul 2026 15:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0545681265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783869505;
	bh=1o0i3Fidqc0TeBYnJmxkPRJHnpPJPgXaDlnR83csiTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=IPYe3PTRFzE7k9LFWenJKvaj6ZwdsDfE//c4V2mJEeaZ7VGH70y4QsI227fjQOH8j
	 a82lSUY+0EEVQ4cdiFhy4C2vhTB6AoIZOcpT4ZOdGqT4qWcjMxBYVmzNvxM6ZuQpkw
	 h4vq7u2mTCUCWuhJsxZ4Oubw9MWXg8sMeyJM++gLNp28ewmrt+8QPjmtkMXGyJfMNQ
	 AWsCYi77KMD+YyI8xbPptD/aVv2J32PAIqiktG47UQ6zckVxAwn4Uu39/wn5Pgtih/
	 KkK4sZHfnZTZcm6+7T3X1wA4X4+c2x0yEb5NT8keqTlOvF2m3PxsDX8FTT3Di91rI3
	 dmTdX6uR52UXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0545681265;
	Sun, 12 Jul 2026 15:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FFA1359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BE5740211
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAUsFMlyXL3x for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9189240108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9189240108
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9189240108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1xAKke0QIW-016LPR; Sun, 12
 Jul 2026 17:18:16 +0200
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 17:17:54 +0200
Message-ID: <20260712151755.599427-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:8ycNHM9dsaGubn+LeMRyiYcdRAT2ciyq+6tQ70Cg7ZykROyvY/Y
 rRneJqbNHYBS20nqT5mM4P5AMRaxYmyzejm8Rm/aC3wWlPfOdI14bbYlA25bbxnrvwtu5nX
 Wd40GoAq/SpmDscaD0B2Oep44a+ZrPGWzOJnvJr9utgUXLI6/0Mc1SU4lXq+fINid7v6SlH
 7/EjJsg29FqKpdxRVHckQ==
UI-OutboundReport: notjunk:1;M01:P0:m3dI3gnL+g4=;/zhjG3mPj3w9eNSy38sHY2lapQg
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783869496; x=1784474296; i=fiona.klute@gmx.de;
 bh=waHIRW3XJAgHg+usbJykerve0SEIHBbxRBWK2+ui1+8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fr0WDceF9bOhnUMBHcN7niGfb7c198m9BYydWe1aI/Q5atxVWJYgu1tiOVWE4z8B
 wkwn6p9Io+RL8XH6DhJ0IGloaX6VPf5WywwDPeLXtYcvU2WYp+XKBgfaPOQGQZNUR
 0VnBTaoHQaXOmtz7/2mDWkiPTrOni8Oo5NS/74qxTdvnxUGZMTHJVS0vhxTbZdI1S
 mdDYWnKl/sQuMRR4Sz1WYYGPGBV4Cx9lvG9MDT2ZVTDzM+QYF0IIpQPOTNx4Fyw7h
 iemCRY6d6FzKS2ECz/+P/ZA7VKsCPsDJZBkkwtz0l/n9VhgsmMQtRkS6n5ML4V3z7
 emyL5vwtC8fb2m5ulg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fr0WDceF
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: bump to version 2.1.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The source archive does not contain a pre-build configure script any
more, so enable autoreconf. Fakeroot also contains an experimental
Meson build definition since 2.1, but Buildroot should keep using
autotools until the Meson build is stable.

Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
not support before v2.0 [2]. This update allows updating btrfs-progs
past v6.10 without breaking build of btrfs rootfs images.

Upstream changes:
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
[2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* commit message: explicitly state why Buildroot should keep using
  autotools for now
* add comment explaining why autoreconf is needed

 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 9 ++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 82a6214380..0c330b7792 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
-sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
+# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
+sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
+sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 12d7f1c4a1..8354f994ee 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 2.1.4
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,4 +18,7 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
+# source archive does not contain pre-generated configure script
+FAKEROOT_AUTORECONF = YES
+
 $(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
