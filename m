Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEDEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3094C60706;
	Wed, 27 Jul 2022 18:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3094C60706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAKr0oNPbkmj; Wed, 27 Jul 2022 18:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56DA4607F1;
	Wed, 27 Jul 2022 18:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56DA4607F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 668371BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41127812C1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41127812C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEplUTDZsCLh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEEA8125B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CEEA8125B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:48:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 367E060003;
 Wed, 27 Jul 2022 18:48:54 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 27 Jul 2022 20:48:48 +0200
Message-Id: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658947734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uyl106ror9OI1Xq1PZAJUiLQ++chAfidLhpcQXZjZq4=;
 b=Exwz4LohVFz0sADVGcpdsBsoypVVAImMQvUBsatnGRr7QIjOOBR923lVaRDxXhBkuGVuoX
 S0rS20H07cJmnE1WhUziSRuYDWVDYHTrRJMYgHqPitjvrVrCL15lSd2aGdOMCKCv2alr9N
 oeT7SHfcy45wvaY1qX8PijVVrPy3WcUYBE0WCowbnn8zVXumZRF2P/udqlHY6HEiBty02L
 rnaXlcF3YNr5Splw4KWNtNI5bgUG4gxG77tsbuYL4/T2BOeWoVgr0pU2KHgpCnt5VWusv7
 GqTfgiC97m1RnmH96SzSGKwmKi7HcqM6jtU3OWUYgvaViu/biU5YUHNrzS3Jqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Exwz4Loh
Subject: [Buildroot] [PATCH 1/3] docs/manual/ccache-support.txt: expand
 explanation about ccache cache location
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The manual explanation seemed to imply that the cache is always in
~/.buildroot-ccache/, but it's just the default value. Clarify this
point.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/ccache-support.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index f6746ad7d8..ea64628615 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -15,10 +15,12 @@ speed up the build process.
 +Enable compiler cache+ in +Build options+. This will automatically
 build +ccache+ and use it for every host and target compilation.
 
-The cache is located in +$HOME/.buildroot-ccache+. It is stored
-outside of Buildroot output directory so that it can be shared by
-separate Buildroot builds. If you want to get rid of the cache, simply
-remove this directory.
+The cache is located in the directory defined by the +BR2_CCACHE_DIR+
+configuration option, which defaults to
++$HOME/.buildroot-ccache+. This default location is outside of
+Buildroot output directory so that it can be shared by separate
+Buildroot builds. If you want to get rid of the cache, simply remove
+this directory.
 
 You can get statistics on the cache (its size, number of hits,
 misses, etc.) by running +make ccache-stats+.
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
