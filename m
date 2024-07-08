Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471DBC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1440C80F03;
	Mon,  8 Jul 2024 12:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiPw1x_YR_4b; Mon,  8 Jul 2024 12:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE3480F0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE3480F0A;
	Mon,  8 Jul 2024 12:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B300C1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A001940A27
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8oG1I6afFLE for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B39040A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B39040A47
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B39040A47
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 12:39:19 +0000 (UTC)
Received: from harderbit ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Mg6uW-1ruBVy1Ati-00ncgt; Mon, 08 Jul 2024 14:34:12 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 14:33:46 +0200
Message-ID: <20240708123346.45938-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708123346.45938-1-thomas.claveirole@green-communications.fr>
References: <20240708123346.45938-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3akylPF0r4bre8UpAk94MS5PCzizhyMeetGxoNtvS7Nv0rKi5+8
 2HUha4dpokLZTbj3qdZ+c7s79Qya0+dC5RgRbUdH6wox+G7WKkD+pKuelKJHkUkgVfU7f96
 OA1vdMr8P3saPJoagrdVNX/UJrhcDrVDrzKkq9ZI/ivEVwOHe7IkvGylh4L3OZAQc0GnHBr
 r6rzkQs8REf94aRaqHRDQ==
UI-OutboundReport: notjunk:1;M01:P0:8CtgviH0BBM=;VIkDapjvHaA08yffHiWlrK6fvIQ
 Q6eFWInGSkJNLO3ew2Lp0Cge7b1k0xIUOKxjrN5+Qg2eGchiBcx4kWCqfcGcykveXLiaeTOGx
 N92g38wat5QYxwKVwAXmLmR+AjnU8vTdzuJGHN9vs7Ok2RH2JsjHHcnncf1gjDazp/PxaChoA
 +TqPsmr/Y7YteHwtliYyVl0JeDCTQIkFNo9HDd1uBDcTMOB5A9rAgOz0SLZqFMk7bNcyks/Oq
 rdzdfjkonPqNmX0H7qoG0jkp8IgkNsngMSs+/Uj1yPzziExgVv4riwWadnwjVXVF+fBV5iBOT
 HZUqmx5loBLGNu0dJPZLA/Pm+ehowGg1za3dRuhgFXxxw46m12WDdOQyqfHGW0068/HGSYIi2
 OaYAR1GKKnuuPV/+nYS0+KCt3tx/65q50z0wCqS4P+WljbkJR4K7Ktz/SbcwDZiYj/XsWgSJb
 IcF/Y+ujde3ULwPBziujKWuNI3xwvHNjUDSYYnrzGgpjy+FNZWBnSkEeD+82H2FV+D5IfaEO8
 nXkfoPJ/R067CDdpCm1muuq5SP0c3KDviDFvVqOOvFhv0EbZ8guN5U1QQKU397qsCRlpwaJVF
 USNG4ulm9V8Kc0qdXM0U2FDZbOXijDYLkSArnCopo2hEIe4fBhvz0wW7LTvYwlnn+qDY9HgRL
 2BY6BEtgWWpJbRxM5AylWCn3sODgGtGe8peYhcybjjM2odUq1/rdnc1G3NjuUeXVZKnjoW/mW
 OQZOzj3heUHQmKQbroTnNn0gUDLMdI1GQ9ET7vuKyygqukdsq/n+Ag=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.4.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 38f0bb5b8b..e297667f4c 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  466a762bd6e9fb0e1ec33dca0b0ed3ecf31f25186e7ef03906716d69e9ecf3c7  vue-router-4.3.0.tgz
+sha256  ad4999f6c346053d93e9e600a69162c52759b1db3aa9a09ef4e9d2d8ffb2d167  vue-router-4.4.0.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 1aa1372638..fb352fd1bd 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.3.0
+VUEJS_ROUTER_VERSION = 4.4.0
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
