Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278FDE77362
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA3D83D31;
	Sat, 30 Sep 2023 08:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA3D83D31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAY_0CrF3NTr; Sat, 30 Sep 2023 08:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E123883D26;
	Sat, 30 Sep 2023 08:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E123883D26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4DB1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F72417B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F72417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTG99t0jBXz4 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:25:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B687941763
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B687941763
Received: by mail.gandi.net (Postfix) with ESMTPA id 629A340007;
 Sat, 30 Sep 2023 08:25:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 10:25:04 +0200
Message-ID: <20230930082507.517920-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
References: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696062311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6MMumjwpZ1rfuVL3ZfbOb1u3lGkmxt4IazFehnJ1LQ=;
 b=XJkC9LtufkJ2dhQTWBIyzQ5GX9c6A8rMdrmy+FgLubde3Fq4S+p6EZPIljzowp4uD8vpmx
 oU8+sLuFnJg/wkeEp9hpvgYFL55UvxXVuXhvJo2+SP+XGBU2gCStUr+GEwPSVueJT/4ID8
 G6uTETjiY85c7JTssFvSph91H10oc9jdVUbO8ssOyMqTnovlWSL/mQ6uSxK0ueYBE9S00r
 1rEZCvvGV7SsR32U/ggeChTeyx1OIzSwkymxQ0wg1kL+vx2HfzNI1sq3EzBJ1g1kVGleRY
 I7NPij6mcATvBnD1Zo+axTiIIdInlOY3pArQU68eaMDk3yRb72gKSUzXMgPprg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XJkC9Ltu
Subject: [Buildroot] [PATCH 2/3] docs/website: remove mention of snapshot
 tarballs
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

In a Git era, those snapshot tarballs are no longer relevant, so drop
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 7d7b405a61..91ad4c7547 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -162,30 +162,6 @@ git pull
 	  </div>
 	</div>
 
-	<div class="col-sm-5">
-	  <div class="panel panel-default	">
-	    <div class="panel-heading">Tarballs</div>
-	    <div class="panel-body">
-	      You can also obtain daily snapshots of the latest Buildroot source tree if you
-	      want to follow development, but cannot or do not wish to use Git.
-
-	      <ul>
-		<li>You can download the
-		  <a href="downloads/snapshots/buildroot-snapshot.tar.bz2">latest snapshot
-		  </a> or view recent <a href="downloads/snapshots/">daily snapshots</a>.
-		</li>
-
-		<li>You can also <a href="http://git.buildroot.net/buildroot">browse the
-		    source tree online</a>.
-		</li>
-	      </ul>
-
-	      <p>
-		Older versions can be downloaded from <a href="/downloads/">the release archive</a>.
-	      </p>
-	    </div>
-	  </div>
-	</div>
       </div>
     </div>
   </div>
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
