Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DB6D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C7980CA3;
	Tue,  5 Nov 2024 17:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk_e7Lne2WtS; Tue,  5 Nov 2024 17:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBBF80CA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBBF80CA5;
	Tue,  5 Nov 2024 17:14:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A791FB8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 885AE60879
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO3Xd0DvL2Pk for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10ED960878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10ED960878
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10ED960878
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:44 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.168]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1Mpkwn-1tcVki0f4X-00glHs; Tue, 05 Nov 2024 18:09:37 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  5 Nov 2024 18:09:19 +0100
Message-ID: <20241105170920.214977-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y4CNZ51JsaMHWPfuOBeSLs+Os5a+ohp3qFHnfOctRqOWlffP+YB
 PJBVoKktL1E7c73mbix0hXRzjdr4wQlhvR/QvmB/CEpgx43vB9Spel7badSwgE7T7uYF857
 InoHGjdLbn8/I3yyUm67brtk1JN0oXpNNeaaLu4iLCGwzUrUMjje3HdZKqsuuHZXuSTEKKF
 ZTvueJvOoN/pa+x0KnxmA==
UI-OutboundReport: notjunk:1;M01:P0:9whJOluqaz8=;sHUw8oU7ADetjwGtcL7MKMxARao
 r+WDdMYOZxRL7ux+6Jsl+rStm+NDt9kqmHuq1Qvu3yIcj1ZpHEcioXJnDi+SaYWT3weheqVAv
 jNp4O4rnm2vCiVJWS5ulH+BrrxopbVFfVAQwSWJ+CVeCoGYxiX5CMq06DZGMSu6qiyAIfzGJd
 dHE8wgS1yoz3Qgn8mBBCFC2gN/jmwpbFzyBEQOJ20+B9yRLcdEohOoU6Jn5ZQDHTmzlhksMYC
 wxWY4UbA3IyX2BRKmiB6EyxEf8KbRW+8C7RVQ+pYQ+iULD/bCaJcT7UHLgeHi3aATJkmZN1yE
 7RrFwygjDTZr08jkWruOf9qa0T32NBTCYwj1nTMy99iA5z84iSRPBAFah4Vkf4WyZXS+LMoni
 y8b1bVZJ8sNIQsO9dhHbdQQy5bol82sYuIffPU51xSrl/02osTuEHLoOBjh79FxXrGQk/vaC+
 Q9HT0kKa1frjdjKidxdi8EBw0fNas8xUgF7VvYKoPJ7X/DOCyzqrTEKNIPZjO8GQbRJRSEIXx
 gUhK+ifzlMd1ECncuh4ONqeKPsnnpdPRAcFY5KoEu6mw5tgYtqUSQuoXZ1HgJ7CsMXldasyjw
 wiYasOkvddDiXfDuUvA+P8rOnX+2Rd6dUKqq6XbTJ0pQZ9UGQo/YOkEViVKoNN7nvVMwELVpE
 ZZh0tGUcd1Dzqoe6tE3G7nbRjROBHuENwNjReKbmqJ6FWu5EMSJXgwWroiyQbVWSXRaw1j0Ct
 mDaGbHoW50nmb20PGRJCl/YPeZLtB5IWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.5.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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
index a4011d8000..127d6201a3 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01cb6ef41fdf1e2c1944bce553c254e216f507ed20ec1bd993766bf9554caf0f  vue-3.4.31.tgz
+sha256  ca13a1928f3c57c6b84f64c84c066e410f91c4f3c25ae61f5fce1557210b9927  vue-3.5.12.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index e8a21c8c2f..f2b5168c9f 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.4.31
+VUEJS_VERSION = 3.5.12
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
