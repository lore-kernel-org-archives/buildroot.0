Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADE9CF319E
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F135D61113;
	Wed,  2 Oct 2024 19:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbUT7kYRbFjb; Wed,  2 Oct 2024 19:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1FC76111A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FC76111A;
	Wed,  2 Oct 2024 19:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9B11BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57EE960A7E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-ZnY22l9Hkt for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E023C61113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E023C61113
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E023C61113
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:19:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 535451C0003;
 Wed,  2 Oct 2024 19:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 21:18:59 +0200
Message-ID: <20241002191900.2906349-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727896755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8bwV+B42ZIzlpT7Dg09IlKGUosjuuAsvfdEsOFGLPqw=;
 b=bfL/YJ3dQkZ0zkxi6LZP6nOEVLMr1bDOlBJ2b2hVgNBnfLrjpd8jVb1g9iXng+jqBx6Azs
 8a3igbvg8UmOHxhEqpFiGLorueMkFYF0DkMKotAu4ObcwhVsaMmuUanPfa10+u9/p3RMbu
 i3akHDem6ZQ67pX+dFmfAk2l79W7gzAwOeDRrosvXpEAkTbWnC82xVIbfthFZMHGoivBeV
 ZYPcPdznUVx5W0YDBFHmSLh5ipgZqEG2LowAPQL6Fo2UkWadCB3eAAJtm/k+G7EB9ovZvQ
 mpxXCybVOMZv9ZaRYgv+NjTrZUkpwvKRa4ZMH8KCUtQsazIgz80ZUdHE+iiioA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bfL/YJ3d
Subject: [Buildroot] [PATCH] docs/website/news.html: announce Buildroot
 Developers Meeting 2025
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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 32a19af69d..f1b26b6a7a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">Buildroot Developers Meeting 2025</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 October 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	The Buildroot community is organizing a 3-day <i>Buildroot
+	Developers Meeting</i> on Feb 3-5, 2025, in Brussels (Belgium)
+	right after the <a href="https://fosdem.org/2025/">FOSDEM</a>
+	conference. Buildroot developers and contributors are invited
+	to join to meet together, review and merge pending patches,
+	learn how to contribute, discuss on-going topics and work on
+	specific ideas or
+	issues. See <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">the
+	dedicated event page</a> for more details and registration.
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
