Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BDAECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF59284381;
	Sat, 17 Sep 2022 12:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF59284381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5GS_ahQoJuI; Sat, 17 Sep 2022 12:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9518436B;
	Sat, 17 Sep 2022 12:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9518436B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 742591BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4253D83F7D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4253D83F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3lsKQd_Megw for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3897783F75
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3897783F75
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:36:12 +0000 (UTC)
Received: from booty.lan (unknown [80.233.62.104])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 16FA6240002;
 Sat, 17 Sep 2022 12:36:07 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:36:01 +0200
Message-Id: <20220917123602.961826-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
References: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663418168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5dtZWVVpIW5H14UusMJ066TCTyNzz1hUad79N36IME=;
 b=jSPclT/UT4YunR14qboT6g1YPuR7PJkCZMJsoblljnVMS8cFMKAfG5pXtS6KXJXXQ6fY/N
 HdIxOlKsKX8Hdmgt6Z+H9olbNfVc9wOzQqRjmQmry+c4dbIcXqaRCX0R9TJr8XkNsqoW+y
 hHTLVj/iKp9AgAJoIwsbWHXPqm0Yy0iugumkWYeHkd9hNDn6IbjdMWxaEKHANtDwE6nak2
 0BQ8TqO6w85fmYGki+Hh31fmiag1QgIjD4A8xbkJn3CwJFUqwjdvqKOKuvQy3vbmiXy8Wl
 dnVNqNYotHbj+F1Iyfiao7zjBd2wkkGL7+nfHnBH4snaCvd58uOgBbfdB2N8Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jSPclT/U
Subject: [Buildroot] [PATCH 3/4] package/snmppp: fix broken URL in help text
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/snmppp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 1f05f53f9fc0..f3a076714d1d 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SNMPPP
 	help
 	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
 
-	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
+	  https://www.agentpp.com/api/cpp/snmp_pp.html
 
 if BR2_PACKAGE_SNMPPP
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
