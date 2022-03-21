Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A8BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E6304015E;
	Mon, 21 Mar 2022 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9f5ceFqRjVM; Mon, 21 Mar 2022 19:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61B5C40A21;
	Mon, 21 Mar 2022 19:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B92D1BF37B
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 19:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AB3060F6E
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 19:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji51kKvIHoJ4 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 19:29:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A96B660F27
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647890988;
 bh=KUKZnUv1cxtdcF25/Q5HTgu2gC5Ux/6L1KwFZ3Tdgl4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=d7w53l3pi8Djduwkk1IWCpt9MYLX5wbBK6Pzfjin4tMojr2ZRmTRMDt1toj8DYj7O
 Pru4FL/aXP671RCK9FJDhTg1F28I5H68+5vQeP0uG9HdwN0J0AtGiXwenKgONrrLbY
 NBOejA43d8yczm8kn1BBvjMPSd3TwZY2q4jXkQ3g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.139]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Wuq-1nT4LA1ilA-005VHq for <buildroot@buildroot.org>; Mon, 21 Mar 2022
 20:29:48 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 20:29:47 +0100
Message-Id: <20220321192947.20712-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mkBWV5T/iSXKW/pxbNpmDoU9PDbGZJJq74e4/GdlF78mnCsVs8L
 Dbi0k9J9x0zmsqlzqZoVlwZozIMCD6rFqggmEGqUyo6xoDNakubvo0pB8YNY0DLwRt6yxdG
 LLGloX/GSsYyxIxdbH5q3PdhRudNgApvkrtk887ypglu8m2Rj4B+xIYV7++CNU7xyeQU7iv
 SQWmrGjbnONIYZ9+y3LQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f7q8Qd+F7Xk=:IXV8JrMKajK449k2DNWhM1
 CJeSwDthojP9/z2Wvhzzgi037Xmwdd04MrT3AckWcvLELCKoDc/Vgj9SDxyJeU4G5cB1//6pF
 EF4ISuMPkitf17CbZqViAPI/RjkyI06U864IVZ3HhNrJn8wndtq6upP6aQYVijtAndTsnCQZR
 336u2AjUkjQhe4ve5GdAdy2aOCylCihV31ccJdBci3TfVZlb/6crbpzSXz3dlJVNbJHVbGoHj
 to6h9dn3BfLWSjVZsf1gcinKq7U4lGCAdc4aJPBRAzMXBccX+43lCejFHDb7j3bYh1RqDDQ5F
 wCYagWXX9hKY5MFoZwzXsDgFHhvLyZIHmtiilmIzS/rii/rKsN6FkVNJIrDNIO+VpG7052sCz
 Kz+rR46ngbo8JYo6Qojjsnxqe3W3kE1in87l2gXj7/thzEQMGdQ1CDp6D4HMGgeP/taGjeP/0
 LF/jBz+hBZooapI6Y3H4Ys5kYyDpydwrn3TeT6iGzc7YiIVDugoUwV2kD/pncHbcbweKKMCxU
 8oy4/XnYXwF9Z5uriQEVfH3P7Kd3HtT4wQuHrGsOJYFFedYoX2K3tBSWhev/KhsWQYsg14+uj
 2OT0ZkIkXuHQHuTd4xY4y5e38Y7x5tuFhHE7qmUvN2qV1/2R6bLkMEp5cGWyLpgvz6VZDBrTO
 NcF1UsTByorTR1etpJ4zalQVbiYAKMh0ORXe2joIvOdyHCrH7qIq5d5IF37kXXBIWtHVnSOO7
 28Vuk3oYZWz7wpLcSF97h/Y7ob5SV7Nu77fAffqedR1+lqrLsWloeqh/NwzKw0/Xi3l5+5mEx
 a0RlbCZybqJIys2q61Jag68zeNMCLhi3ToSK7RyicEGeCVRO2Fx/eSgcE5kXMtbubvZi0LG+R
 /V93txjowxaOC/+uhMRoKRkPjzy2CmUohQVlBUkcJyFIKz4FeDSzM8jDwpgfzWLUkp0DMeFim
 kOaRKEH80aUSy74/Ydm2uuao2yBQgk8lbUJOFNyRtkrCypzIPXtSzjki56RDPtGxALbebYBmY
 P69ov8TB8yF6UyICIItPLh8GulEcNiN0gCkn1rB1aQHIgR+JlgHLVTEuq3S/dr+XJ3Xq/21Me
 JxIeVFuPksiJb0=
Subject: [Buildroot] [PATCH v3] package/wget: bump version to 1.21.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.21.3 (for details see [1])

- remove legacy --with-libidn option (see [2]), replace with
  --enable-iri option in case locale support and libidn2 are available

[1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
[2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
  - fix iri option enable dependency

Changes v2 -> v3:
  - fix libiconv handling
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 7f89bedb88..22674650a2 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
+sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 8a73c33699..455faaed12 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.2
+WGET_VERSION = 1.21.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
@@ -33,11 +33,12 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WGET_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-WGET_CONF_OPTS += --with-libidn
+# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET_CONF_OPTS += --enable-iri
 WGET_DEPENDENCIES += libidn2
 else
-WGET_CONF_OPTS += --without-libidn
+WGET_CONF_OPTS += --disable-iri
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
