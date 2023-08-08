Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F49CC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E2281F7D;
	Tue,  8 Aug 2023 18:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E2281F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NE2AQg9mgtqq; Tue,  8 Aug 2023 18:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCFDE81FB4;
	Tue,  8 Aug 2023 18:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCFDE81FB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 634A71BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CAF240592
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CAF240592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMTLbVsYtZuD for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:15:08 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Aug 2023 18:15:07 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4B34402D4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4B34402D4
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:15:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIx3I-1qDZEA20cc-00KMaL; Tue, 08 Aug 2023 20:10:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:09:59 +0200
Message-ID: <20230808180959.28091-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808180959.28091-1-ps.report@gmx.net>
References: <20230808180959.28091-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NIZpKRKPOXMaOmN8pwIlX97sXBPyHrVy8sgPzcf2rhQKyhO0sEY
 VBAtFKe7xXPOMiKX5AoRhhzDvycjlH7lv/smZvyDBgPAW6S47/DdjIzWijiWP0YOANC4nEO
 be7my8CtrYVP45M2o46JOtY45kybEeNAoChx8PwDIWJaANWm9sePosspu5iYUK4kFEHCHSn
 SMITwOI1EIOBe8ZFL3xMQ==
UI-OutboundReport: notjunk:1;M01:P0:eEWlhPWrrKE=;NJsT+vaZybY1RhxUgsVdYDoUSLB
 E1WPc3PcQ9srzvtIwV3kCTTREFzcO3U/IKduEN3nKvph2RUIcaS1Q3atqDre8qGVk8xYgeBM9
 1nRuzmFQwfGXJmBlDIX64C4c78mIkF0+vHBZfH5VKlgLF4FsopGtZR2bQ03msvinHlfnsthbt
 xKW+cUYk64VA8v0eqwXsrOabRJfSxqjywFtyi9LT0+iqUjdGYVi11DlhS25UPMVYkWjW8za31
 yvpPwRNp0rjRe9brUJ9y3smyF9w3GZpo0aBWjieG4rLhhD+7lDx9TA7GLx6hD5QrjtufDBfxE
 /qybO1ZvzehyhqHU4nbT+o4r45+FLqHG3TtDmziuC/XxnwezAVFr6Yko9XTdK5faMKqK6HmaB
 ij73/VU9s4MekLL7mJzpTSMzP8r0L1slA8MGmzHPAgPZUteyULHqKXajV1VsoiM2VK+56qLs4
 uV6cReThwdtXk0LBvyGWEGzFEb9Ep0bVIDEZk5eVpOAn7Wmm7qZ7Djsdn+D1ivrXBrYyW/yff
 qiBvcUw3nBEiy3WaAzoHwysvntXIhPRwmj+DVS+lxNn6zgxDUpKCcJj8FcGbZJFRZ6/AKrLYg
 R0N2mPp3bqOl7q5lbPqKtIO5XYgqp7qYieHdNFbSvocI/Mhrqr/Dt9Elqb/DBHy65QuoUgYYs
 C0BoRvYv+pkvDmI5FphiXwTnmvaoXXtJ9VlpaJfiS0N291EeHSDCmRHcOD3W2MvZMslcpbEHS
 kvTCm9RiLd4pUYYBm388tlmZTq6F1kNljbRAjSDu0Rn5Qi6e7EzJdl+kJFpzH0PNyafxg5Hh4
 xGZd8DCxngu2IYYVw080WQQ9i0UHXsmxjBLrqHWyJcaax84myUhhojJuPoVjk5Hm6xYVgHy7Y
 krJ84mRa44pQIslmzdHV/xLXy6ylcNuaGqUz/Um7epgyIsVxcOS2A/UKXOKwWbR5zFj1CEf7/
 1FVYzPqss3f/EOIEf7YZNI2iLFk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691518505; x=1692123305; i=ps.report@gmx.net;
 bh=Ux7XQR2Fl5NQn4CGIbFZ8nUZk/bWh+a4SWQxbFA6+J8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CbDRO+XmQ86M/efnB6bSiJRCEximQqRMVKI+HABiZ+Tk3n6St0GlFLC/ZkMcUa8wG5+NEUq
 LXSAxJHKxJ8X8T1lroGlJPU5Q1ip1GEh9zFVG/Gt/zlDEBjOu6L+xN7/MMH7IlQcQ+JWzwdGx
 0yP3u3Uu6xWXh6pvi2GwmXAofWVmD/2Y3YTVjTcauP4FVW4VQ9+x12dm4HD1Wpt9isTDocYhY
 JD8/gs2eypourSaR2ZgqEnPnLXHo2I7CpaIrUUHTJxXszC9uPeO8Ug9cdDlh8TgJYxO/Y4AUM
 LU0WW2/MQLtWT9hry8D+huWNs2rOg7cRG1EnEertgA2JOe8NVGyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=CbDRO+Xm
Subject: [Buildroot] [PATCH v1] board/raspberrypi/config*.txt: remove
 failing 'dtoverlay=krnbt=on'
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove failing 'dtoverlay=krnbt=on' from config.txt introduced with commit
689b9ac439 ("package/rpi-firmware: rework boot/config file handling") [1] by
changing an dtoverlay option wrongly to an extra line (instead of changing
to an proper dtparam line), but as no one complained since 2021 just
drop it (and upcoming raspberry pi kernel/device tree will enable
it by default [2]).

Fixes (on the board):

	$ cat /proc/device-tree/chosen/user-warnings
	Failed to load overlay 'krnbt=on'

[1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf
[2] https://github.com/raspberrypi/linux/commit/ec08e93837efa2e75e5cab4d80427fdf7ea23da1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/config_0w.txt      | 3 ---
 board/raspberrypi/config_3.txt       | 3 ---
 board/raspberrypi/config_3_64bit.txt | 3 ---
 board/raspberrypi/config_4.txt       | 3 ---
 board/raspberrypi/config_4_64bit.txt | 3 ---
 board/raspberrypi/config_zero2w.txt  | 3 ---
 6 files changed, 18 deletions(-)

diff --git a/board/raspberrypi/config_0w.txt b/board/raspberrypi/config_0w.txt
index 195bad449e..771b975046 100644
--- a/board/raspberrypi/config_0w.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
index 195bad449e..771b975046 100644
--- a/board/raspberrypi/config_3.txt
+++ b/board/raspberrypi/config_3.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
index 34412fa9e8..ac5a09c486 100644
--- a/board/raspberrypi/config_3_64bit.txt
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -25,8 +25,5 @@ gpu_mem_1024=100
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
 
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
-
 # enable 64bits support
 arm_64bit=1
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
index ea02d3f071..01f60395b3 100644
--- a/board/raspberrypi/config_4.txt
+++ b/board/raspberrypi/config_4.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index 4a77fb3f1b..139f6a8788 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -25,8 +25,5 @@ gpu_mem_1024=100
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
 
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
-
 # enable 64bits support
 arm_64bit=1
diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
index 9e6b7f5ccf..151e446b5d 100644
--- a/board/raspberrypi/config_zero2w.txt
+++ b/board/raspberrypi/config_zero2w.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # fixes rpi (3B, 3B+, 3A+, 4B ,zero W and zero 2) ttyAMA0 serial console
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
