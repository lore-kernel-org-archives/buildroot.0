Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32629C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 08:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F2F4249F;
	Tue, 19 Apr 2022 08:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Uf9oZEnUIdB; Tue, 19 Apr 2022 08:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8AD041E6B;
	Tue, 19 Apr 2022 08:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82CCC1BF29C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F55382ADD
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqmSgq0-xLW5 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 08:54:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01FB783168
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 08:54:49 +0000 (UTC)
Received: from houde.tangerine ([193.138.218.222]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MjxW4-1oMcu71GMS-00kSjR; Tue, 19 Apr 2022 10:54:47 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 10:54:10 +0200
Message-Id: <20220419085411.125022-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
References: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jZHnonorQKfOsPiyOi5bE2WKQzR0FUvWuJ1Kx+AY+g3GajjpYBk
 jQQRaqb8TfccRUVSwZG28LO1vu8SNsoUaHSR7RKOrEQYLf/sv5ebBIp8y0hvPJVvDysC0Wu
 836rGmILJcvRsCtwF+Fa9nXV878EST3LVROmvta9PignbLMQdAws/a0ZROrsheV6yjse8E6
 ZgaLOffvowWNxvNAd6EUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l0gsfFb4IPc=:ezIu2WemtmXCc7/cElXirt
 C86Fvk4RR5OSXk64yBaM9ycoca6WEtVaCsGUINOXT8lY4l48Azj/uXbHVjkyCxqiwlxaQcYD/
 ytRwRG1+kdfwXE/nzpeDnO/yAeVwoVpeftixEqAiO16TyVqGIYIK3RT0ynRU8L/x0goc8/Pwo
 zseIB1dHErvaZX1hAy9l4zOy/mYBHVUkoqLB6KWufRkxR8gSDMY9UCAFhBxg/qGhJbT4jvx48
 FkskIPXOKvZJAczfQRmE5gv9PQ3AT0V6wiZR186QvdJ8+7dGTIis1DB+M9/0D3wufS4quw/yG
 YwFZ/Z/9j8p3SHmjl0FIxiXhytive/UIN44CvC6D1f59fGQO2OlHodP1mC4IEhUnpUSlWdqhd
 peVfn/I3FdkFH7Q2SL+Oj+hK+G1Sgwepg7pg8UJLhkxElFoG2fyR0IbvWtIo/D2P3BtynIuFB
 5RNX/p7O5y0QPR4yX4MwwQZQkd83/1spGjrmKrbOv42Ya8HaZKDT5juHwiIC4SdQImBUa/m9f
 kyYXZndJbtnScpSaRtO4haGvXELp4t0JoKdQlIh0jWJDlJfEc9vLZIg85hTMb1/avjelEC0dh
 OhGQadRmeXO2GveMMX/8fpLR1oOrp3sqy5UsTACYUSU6ZOxW0A03ZNab1P3/S4kQdro6SB2cC
 aCartj3DHnvc8EAEc7LCuDZdBnJB9KK35hgqkZeSPuEJ/RJE7bKpQkILqamiN7lomLrTZZz2s
 6VAPGh05if1ic53bHo8vS0i4wbNe6vfaySKBJw==
Subject: [Buildroot] [PATCH] package/vuejs: bump to version 3.2.33
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
index 9dd0fb548b..c53364e97d 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  770ff74851f7454977f084becd76b05b3fad4d52f048df5405d41849c125956c  vue-3.2.22.tgz
+sha256  042033a2a8e6d45f750924953f03c34058d5afd9cc1571fbaf1827eaf04f6943  vue-3.2.33.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index b74002e932..d544124bbc 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.22
+VUEJS_VERSION = 3.2.33
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.35.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
