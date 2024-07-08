Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA64C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8700581123;
	Mon,  8 Jul 2024 12:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFiv8Vml8pkP; Mon,  8 Jul 2024 12:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97ECE81164
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97ECE81164;
	Mon,  8 Jul 2024 12:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 992161BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859D04094F
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40pQlfJZMwXC for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:36:32 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Jul 2024 12:36:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C46584012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46584012D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C46584012D
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 12:36:31 +0000 (UTC)
Received: from harderbit ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MUGyh-1sqLAU0EPT-00L8tp; Mon, 08 Jul 2024 14:31:25 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 14:30:50 +0200
Message-ID: <20240708123050.45780-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZdUbHzx59QmiRhLNiweVsfCjrXnC8HkTC73TYhuOGKiz7A+0iX3
 WqhTA8/IQc2lJ0IMLYnHVsnsSYCAgMdS9yZ3TlV/u/GPPscvy6LBANFfh9oCOsUxAP/e4Pi
 eF2e7R7FfWBrrpY9sE2LuFP5q4N7jVZs0BQ8Q3s7spk6txgmZXnamOfxoBAuRYWp9wqLw9w
 icxIlkDAU7xrn/MzFnmFQ==
UI-OutboundReport: notjunk:1;M01:P0:smQqqPo7zYI=;SdEX+oBC4MgyrtufJlOXrULLAQm
 gNUnQtnZ6FSSfqShaW8Mj0pGkGo5ZuWHY7gxB+KzkCPGUO9AxKKpYg3meSzP5rNZev5FtY8Yz
 P10QGQtj6+gX0eTXIBwltjhYImEpfFEC+LYjsM/67STeUthSLzfYMQU9QxPchrNUlYetSSdnC
 1Yk8sOhmdZZSmJGGJU5nEMr/HluQiuVNWPWWJueRqKZz8htvAKgLx7Z1aOuKR+fADiWpqFqpD
 T3JH+K6NRyNPIK2dy1cL3WaD8DtSsHhxYsbB7CQ8Ha/4auawLssbiaZqehclrNGAqxb+3BVJB
 DisbphY+cXNcndIu0pP5WYX4TDFGs+BURVUzZnBIy8jlFENAiV4h6H8mOn8MsVcKMQB4FI6tI
 G57XSrv6ptxMgZONL+I+Q1takIgtnFuG529lnYgz+HmcC4o/eQLjhW7SuSUqlewLeEwJxthXK
 l/0+qswoJFNirJJG0oZy3NXc3VwngxZPsXC+VzXA86+FJdh0RjrzCR/msuLZoxkF2HAsii8wT
 Lq1zDsEzLK2YEBAIFfAAGIUn5CN3tMmB5kateRZ8mNtNsQGl9/xjCyDYNfoMAXGQ2Fe2HbE1g
 ArBP5dBVMVWDwqrKcIjFyRbZ9d1SBDf0MwkdI0kqh1lpC1k8Ht09F/MM7jfLO7/ba2SP8BlXs
 5Nn6dySU+X+c1TIhosJ9wTJHOviaeCd8VqSiNBKo6MotAYiVj7sRf5wF43Djav6swnZqjciY1
 OWv/korPWNFVSUaVrYeVnUBoW3pRifnKEL9iOeaCWcpNBOWeOr7G9w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 9.2.4
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 31496bbfca..29261c57ed 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  73acb923c0ef53c6b6bb34b6dba782e03e1d24279f5aadbec5e787269456a6d8  v9.1.0-package.zip
+sha256  f9818591685d2eda779b346425061ddde174931e89ba2412118f68b3779e0c19  v9.2.4-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index df29e04e65..682138c454 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 9.1.0
+OPENLAYERS_VERSION = 9.2.4
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
