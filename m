Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D167EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 08:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06ED04256A;
	Wed, 20 Apr 2022 08:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNGHoIJbxLP2; Wed, 20 Apr 2022 08:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBA74250A;
	Wed, 20 Apr 2022 08:39:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298E61BF319
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17A7B410D3
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_tbE551aTnr for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 08:39:33 +0000 (UTC)
X-Greylist: delayed 23:17:30 by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA56E40103
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 08:39:32 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8549E0010;
 Wed, 20 Apr 2022 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650443969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yZWsEoNaRdO2mwAvd0GISZOkos/tSSBYYb21thPkfxk=;
 b=U4YXuo2Qqr7gq9HRLBAkBtZ51Xiffabs8ossdAywn6S35zGpl0220BV3YbK1N/zdj0/7/U
 pLdc73kEY00eC8pND6riF+jwiia9YI7ClLv7QozTFUuU/BLiyBUTjhW8cwBFhvPHiRB823
 NZ7nokNPEEuT+c58GjgI1L3vqCz6Ybqv1TWJCsWdu7iyQxQFSe70BGfqEn7P8YLmW45fKC
 g3ZSIs2uPskLiiLorpqy9przEUoinukbN9f9KrxffEXxgN8KFbvfopaE9L72XcqtQrysIg
 eI9EVLk9IG2MAN57DXs6b0Yvr8la+Tmd/VUmX5yIFmERdTTDUBJ5mPkAUK0HNg==
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 10:39:22 +0200
Message-Id: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/byacc: new package
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a Berkeley LALR Yacc parser generator that has been use
by i.MX Code Signing tool.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---

Changes v2:
- Remove Config.in.host
- Add a trailing slash
- Add a comment about HOST_BYACC_CONF_OPTS

 DEVELOPERS               |  3 +++
 package/byacc/byacc.hash |  3 +++
 package/byacc/byacc.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/byacc/byacc.hash
 create mode 100644 package/byacc/byacc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58fec..6e49334dcc42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2765,6 +2765,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/

+N:	Thomas Perrot <thomas.perrot@bootlin.com>
+F:	package/byacc/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
new file mode 100644
index 000000000000..d2ad441df39f
--- /dev/null
+++ b/package/byacc/byacc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
+sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
new file mode 100644
index 000000000000..648dc9a040ca
--- /dev/null
+++ b/package/byacc/byacc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# byacc
+#
+################################################################################
+
+BYACC_SITE = https://invisible-mirror.net/archives/byacc
+BYACC_VERSION = 20220128
+BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
+BYACC_LICENSE = Public Domain
+BYACC_LICENSE_FILES = LICENSE
+
+# To name byacc instead of yacc the binary built.
+HOST_BYACC_CONF_OPTS = --program-transform-name='s,^,b,'
+
+$(eval $(host-autotools-package))
--
2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
