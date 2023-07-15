Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBFEB64DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 06:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 992AF405DB;
	Sat, 15 Jul 2023 06:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 992AF405DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QikxzShmkrBU; Sat, 15 Jul 2023 06:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0BF340320;
	Sat, 15 Jul 2023 06:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0BF340320
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 560BE1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 06:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C41A40320
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 06:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C41A40320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZdoDAx-MLtf for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 06:36:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40C040022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C40C040022
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 06:36:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC542A4C00B7;
 Sat, 15 Jul 2023 08:36:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55202)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKYtT-00070f-1T;
 Sat, 15 Jul 2023 08:36:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 08:36:39 +0200
Message-Id: <20230715063639.1508174-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689402999;
 bh=8ZUqqE6oJDckCAbIQPg636vxpCR9/s9scFU0Kvf7Ncw=;
 h=From:To:Cc:Subject:Date:From;
 b=KTR/kQidp3TpTKXFlHF6ovQLp5RvR0JOnP7IemYTwrBvi5LLIG+1E4NZ8CzSzUwuS
 6PFuffiRohovEhBHjhKqRtD9skviR85f2XUDxa1ST//HJ6YjE7qsiV4Zcp9U0xSqtz
 XxTDdNXDPA7Lw0Fb4UwBl2PhJL6rBgxrKWMRTm8WMIhgSeENCjEuzHZKBGhQrqDs8M
 lmavJyuPVa0lSSWbzWComVe02B4mG/oFd+IcQAAP6Ni43MqYG0GEyYeOaO7Vp/FEA8
 5v2mn3Y6/G1kT33PJ6gU1WmGYqhiQLzsJ8H2us9VhFHcNJUo6MEU0uSo3REhgWvp36
 RI2lxJU0T6oqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KTR/kQid
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5{webview,
 x11extras}: fix hashes
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 6b23dff9e71786191797d3b41ce80afe659f0396 forgot to
update the hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5webview/qt5webview.hash     | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index fe12950929..d928c7cdce 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6b84aab9bc8292f299b249840218e9e69a1dbbff42e08c5da7cb659cff8bc37d  qtwebview-826d2a33929c69807917536d48b7861e7682001e.tar.bz2
+sha256  38f6c0a2863e9144632286b0ef43db506b8631eeff0f8facae14b0da86ca0491  qtwebview-87577dde04ed219bda776dabca86176149736331.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 7b369b0a02..87dac8625e 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fde322c017bee349d56f73f402ca67ad986e0c43a592e3ee032313aa194406da  qtx11extras-51b0a5a2e3e35f4cb17da1e7cb4babef6294bfb4.tar.bz2
+sha256  cf9124f3d35f1c8db4e9e47943cb1ec86834abf2be38d70412d0452e64462906  qtx11extras-982f20eb585d77e5b5c721e05a466d7161f7f2d1.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
