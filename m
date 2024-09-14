Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBB9C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85AB40454;
	Sat, 14 Sep 2024 10:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfPr1JxeWpfV; Sat, 14 Sep 2024 10:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D849403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D849403C9;
	Sat, 14 Sep 2024 10:15:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D371BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41DC0408BF
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJGnrSjFuQEI for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 315FE408BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315FE408BD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 315FE408BD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:15:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id CA13240002;
 Sat, 14 Sep 2024 10:15:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:15:26 +0200
Message-ID: <20240914101527.31256-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726308934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/bZqwTybUrsUsZV2noyYke8aiVtSMLfqhrOVIGZSBug=;
 b=oL+gVVkH90hJgVrpm9W2QzYSJS7oGaGICVU5aoO7VVrNMJPxwyBelYJQK9AxBfSWf1I/vt
 psgLSpmuwZyvANolLVNdKTjEWOif2YV8dUxx6XdW+h2ht0tWUExbxkWWPmG9U6M9Q2ayJ+
 vQFnsKGpS+ZzxxPM/QZkb+duSkvplQWHEFxPQLOfmJfEShvH5oIaCtZVpcKkmBIR3WX9ff
 MR7ZPipv+koptwG5muc/LnezpwKCdSehz9RKlnUo2Bx5+Z7PXCo2dCl00rJAkaKyhC07/1
 71uYzNdEGZ8PKh5BpDmXw3n05qtejFjtx5Rpy7tv4VbndI8G+kgtCaOEEAA+ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oL+gVVkH
Subject: [Buildroot] [PATCH] DEVELOPERS: drop Samuel Martin
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

Samuel Martin has not been around in the Buildroot community for many,
many years. His last posting on the mailing list was on July 2018. So
let's not pretend those packages are actually maintained, and let's
stop spamming Samuel with lots of patches and autobuilder failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 479ebeed37..c9f805a82c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2898,20 +2898,6 @@ F:	package/zoxide/
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
-N:	Samuel Martin <s.martin49@gmail.com>
-F:	package/armadillo/
-F:	package/cwiid/
-F:	package/flite/
-F:	package/nginx/
-F:	package/opencv3/
-F:	package/openobex/
-F:	package/pkg-cmake.mk
-F:	package/python-numpy/
-F:	package/scrub/
-F:	package/urg/
-F:	package/ussp-push/
-F:	support/misc/toolchainfile.cmake.in
-
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
