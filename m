Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6013C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C12480E2F;
	Mon,  8 Jul 2024 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uZDYUbuhUB6; Mon,  8 Jul 2024 12:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A81980EE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A81980EE8;
	Mon,  8 Jul 2024 12:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291CA1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 109B780D28
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGEQXIGWSlgz for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:39:10 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Jul 2024 12:39:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C27C80DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C27C80DD3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.24;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C27C80DD3
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 12:39:09 +0000 (UTC)
Received: from harderbit ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MI4cT-1seHx02eZj-008DKE; Mon, 08 Jul 2024 14:34:01 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 14:33:45 +0200
Message-ID: <20240708123346.45938-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:vYO2BicGZdTxWkMITvHEMrxyD9skZKaonhAPpwR+rinTrNUJ2VT
 7ZG3j+A3Pt99LuOIFdeVnlT6oTJRxYskICi3RZuuUBVi1Izw3hEwR7jtIMK5RgcFcfPEi8u
 DZhdzfH+K7ylZf8Bji8JVqd+Qq1T7U332CLYcdCMjhHmFdgmZiD1CPCUIEqKIP4XCwxDORC
 sqmHajF5ZcXs4ajCEN9qw==
UI-OutboundReport: notjunk:1;M01:P0:ebUUimuqqgQ=;AV7S68By0q5gl5/Y1mH4hYv0WcI
 Uma7yc1aMqzXojmkNkGuVWi+3FAhO3dMQhZZvTRNpFjacEJACmM4c7+5EBRApCdQNITmSmRB2
 NbdUwZb6+9rXXzGpud4tUQBifwVjbtI/aYtYtdcyLd9IhV9qZO6s0NFbLitd3FiKhPHkp/8Sq
 gRHJeyut5V72CSYI7LGy0zXs/sZetouBK8vHf4B4BIq+1TOmaTHOpxnWUwx4glR7mNJfbBeiu
 pzfT/VPp6WFTn2shR74AT5703cXHhvjUEXqcbpqRgimhpZFyIuPr87IfsMG3C0r6iDV93xQSA
 m4AQ1lMtlA10VqSaI7MW0ApqtpENP11WeKJoP9D1oMNWthTVzX5n2ZNnrwdHTLFvrWs32/bmk
 gO02kCjPYZ//zDnxweveYCwkMtwpTdS63qLqzfSMM/NLMv156L0SOJYRun47kXOfbWzM5qTdj
 veSHewPLNatfsvomVxwfZ9Axwel8XGidDb5zyrU4ZbJz2aVQJNx+PGfWsX/bjAH+6a7itw7rH
 8ti6xXqsVFz+P0qWfUVByIr966Ea99u8q1ALbinzzgYXl/h/VfaUShZM0w3udzu2OI5mSpylW
 CWsc/sQuytZzGT7350eaDh5gItgMaNvRQO0ozw4RSzAKInyhUT22fN3GWYeQG0GU56+mB6wqP
 WY3uKC/FChxARiNv1SpUMzWjnmf+9quwtg7Gmo6A/bw1YwUCoBwTg0pZ5w+ZctDEQkShSVRCa
 f33iPpXG4kRuepuEWzhkMdnFJVtU8L/SHAoZeGp98HDLYOrOl7iwwo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.4.31
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
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index 2785a24eca..a4011d8000 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5772054f07ee4d86b831b963a889b9b3e60764f4fe909c1ccddd00fd628bc6c7  vue-3.4.21.tgz
+sha256  01cb6ef41fdf1e2c1944bce553c254e216f507ed20ec1bd993766bf9554caf0f  vue-3.4.31.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 3ab7182083..e8a21c8c2f 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.4.21
+VUEJS_VERSION = 3.4.31
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
