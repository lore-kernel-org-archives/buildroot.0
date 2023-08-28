Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865CC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 21:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFA2F40436;
	Mon, 28 Aug 2023 21:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA2F40436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpNoAti3q2wS; Mon, 28 Aug 2023 21:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 108B140AF9;
	Mon, 28 Aug 2023 21:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108B140AF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90CB91BF95F
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A22981EE7
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A22981EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJJ6m5kVERxn for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 21:22:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAB5E8179A
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 21:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB5E8179A
Received: by mail.gandi.net (Postfix) with ESMTPA id B15EE20002;
 Mon, 28 Aug 2023 21:22:26 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Mon, 28 Aug 2023 23:22:19 +0200
Message-ID: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693257747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfUY6AAjm67AfTAgHD2+gQCmsuYvQmkSbnMzmqJQaB0=;
 b=jpsn6w9VUUMcE18/zhLvPuSL5z7NGxokxzjExVawZb8E5jAH+VhGPj3O8OdHTwmxVY9FXX
 KVeX3cUoD3hRAN+JkQekGhOSgFSiKysKK0oeBAysffrScXq5fW3aOLom9/+uCFt/W1aPCy
 DHZHlOKzc6f1XWPj86dC583Bsv8ir7wByLwFZYGXM1NwYgbbcwEBn9Zt90+7dPntdH4law
 v4q/BmRhYGawmO42Rw2B3TJzGSkU/1qNUnQugO5CzrGJwQsBapPcaHD9tGichGvLVxSpbE
 xNDzt64iqRzM4I9qhJs1zc/OcsSHNb7RIZYBWGruNSP+cekKLP1R02cPICt7Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jpsn6w9V
Subject: [Buildroot] [PATCH 1/2] package/heirloom-mailx: fix comment about
 ignore CVE-2014-7844
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
15972770cf34ed0b0ba330e3cc42c04f1c80c3c8 ("package/heirloom-mailx:
security bump to version 12.5-5 from Debian"), we added CVE-2014-7844
in HEIRLOOM_MAILX_IGNORE_CVES, but with the wrong comment about it: it
is a different patch in the Debian stack of patches that fixes
it. Indeed the description of patch
0011-outof-Introduce-expandaddr-flag.patch is:

=====================================================================
Subject: [PATCH 1/4] outof: Introduce expandaddr flag

Document that address expansion is disabled unless the expandaddr
binary option is set.

This has been assigned CVE-2014-7844 for BSD mailx, but it is not
a vulnerability in Heirloom mailx because this feature was documented.
=====================================================================

See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index d3b8ad437a..bb2e1f48de 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -12,7 +12,7 @@ HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssap
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
-# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch in the Debian patches
+# 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
