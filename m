Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACD0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3019561065;
	Sat, 11 Nov 2023 11:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3019561065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdXgBz44Uyw7; Sat, 11 Nov 2023 11:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745E060F6B;
	Sat, 11 Nov 2023 11:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745E060F6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 788641BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABA060F6B
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABA060F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wqoRbFVhkE6 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:20:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0292360BE4
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0292360BE4
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D00FBA4C012C
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 12:19:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35950)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1m1t-0001Gp-1z
 for buildroot@buildroot.org; Sat, 11 Nov 2023 12:19:57 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:19:57 +0100
Message-Id: <20231111111957.2661737-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699701597;
 bh=qExYL5sIEWq0BkTD90jOonyPBsq51G5kgqqmoY58Pj4=;
 h=From:To:Subject:Date:From;
 b=Y3S1QHKqoQk0hTe/AhfbcMaVwpRTqCjIy2VE5NXSyfyOl388CLliHM6j+zCrAAuqu
 3cp2zVFKlYj4h787Oe55yH8tKe3+dHQXnct39P0/ouP27mCpmu5DP+fP7JN6mkZ5Oh
 t48+yHNM5y1Hbg07HoEzCtnvIxrJwYdJzw4mF0xK/tFFWPrNx8rjx9Sce6nYPcWm01
 PzM7tBHKEQtC9gjAi/kmKhy7JEYP5gFPi38gSGDlXCUamwI7OhqOTiJCvbKN4xAFE7
 tuUlkcBiMzmeC3Z6LNPG1aHVjJHwRnCYDwGTl62XNs6WGlk/JuttKlaa1oMcM6vATo
 +vt82LAPbIQpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Y3S1QHKq
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.9
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

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/security-release-0-4-8-9/10155

Fixes TROVE-2023-006.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index fc128e0fcf..dafa6d43d8 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.8.tar.gz.sha256sum
-sha256  21bbe908cafeabff04636d26293540aa9366eb1cf389bc65dc2476c93e688004  tor-0.4.8.8.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.9.tar.gz.sha256sum
+sha256  59bb7d8890f6131b4ce5344f3dcea5deb2182b7f4f10ff0cb4e4d81f11b2cf65  tor-0.4.8.9.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b054bc55bb..455ba2b551 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.8
+TOR_VERSION = 0.4.8.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
