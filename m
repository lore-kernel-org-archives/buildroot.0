Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC76410A9;
	Wed, 16 Mar 2022 21:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VIcjxEkmzcIP; Wed, 16 Mar 2022 21:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6AA410A0;
	Wed, 16 Mar 2022 21:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33CA11BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 309AD410A0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ba6zsnhJlt12 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:30:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E78254109E
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466248;
 bh=rUfWpDIZ7J/m6ZVUEsccZNrBmy+2wBr/NWRhpd+/iBo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MdEfztGes8p0vHhTm1RUNgFBWugAmU4KpPhEERxxQ5lyRNij4UydW7FEiIiWsFqUU
 JhCNF5hLb9R6dzjVzHnQPmJiPs8mQpkEL6nQWj+xlDIW3atmW9Vc/XOjRtK91NsXqc
 dVgkVBwGyCxLAZ74df5qRxgwUhyudsPgkuoCzjvU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MJE2D-1no3mt1Qap-00Kk1g; Wed, 16 Mar 2022 22:30:48 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:30:47 +0100
Message-Id: <20220316213047.16103-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:c2jtunooB06b6Hl8j87HgFguc43FbfQooTt06hzRnWKlLJoNvjL
 DrWt2gnHiN/nkjUtZUyXTOyQyk8kvcujquJgwdhembTZxWoRvNTP1mQs63CiQyfmM73r3Gb
 KtjS5d7WSEU/Ce+c9slVlERAG5RUd4cBvJHjwQVM39cQM++adMxYBsFoOSug60D6Xxuv7z1
 i8wYd1O0aojP0LfjNZnAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wQKm8Tjpg6U=:CxdGqt2pFYiUz5FWGJWzN/
 TT4wc18FlHmn7vFwPEQ766nY5/6x/yLQQ6O1cB63SfOtHobOx7SSDUTigICdxm8ePiWMsZMPQ
 JBVDzZyl2MPBbIseoPHaaklo4qrkRRqLK5dm65IEe4szyJh1EHmED85WCbtd5aUezv7hwnWHl
 gEUdYkPilYTI8i2AzfkTrlD4CHqn+kefCuraBX4psHJK56L2RWObsBBOES43Eq79JiwkrYSjE
 mB07jyCqCrrNUco/nr1UyzB0libK153Wxfw9+s+/0yRnOARxM96U11isZrEStPBf7B9ZrXz2c
 6Uf0/nN7uRi/4N/GwKRxsVUi97JzA0nV2COHNdQGNv7qrbO0FHboraqJq1tNv6ipec8aF1/Et
 LwLOq13mj7N5/XG3+LDTf3g/md5Sfp1qZ8VGVZx0sXim/TESmufthoxCcW8pjZ55uLUc5hjN8
 NhsCDoIrxzPpgwZ5NIm/Exl/a1i0i9SP7Fl1iFlOOSnLIw+rQhAB79aCtxb7agEFROvY8d0rl
 jPpVTHVrxo8tmNtKsUkHvXe6HjlVRPxHUw/P/dkn5gDxb+dNKEw+8k2okSGIRUogPO/7azMGC
 9BPTIXQq+2P1nEuaIUyQjGwl5V2zTBwaQACY4ZUpJJkYYyAkq8Bi5/lU9jtEZ3fk0Nob34S7N
 yKvtgTF+mOTeOpblo0r9FLSgTVn2HD9OAMEcKKKAbIfxlYIszEaOnhJanwjUidd506VGbOg3r
 owwkNUR22SwhJXcLpY+O4eynD/f5qoX/sf8XJTeu5xwuaRxMG6DonJqrm+TrL5QCkYhw6Z87H
 tBfTLUxKWgy3Cpieowzk4U+gF7JQyJJz+tZKfVFP/H2/96kS9YUA/RocLCeks2YtU2VKOyZ8P
 X12AsuYkKURRO4e+mPAkNTmXISNHKHqm/lAhcvjrRSqsgcxkkx9mfb2/ukuUt+GthLadwI2c+
 rRFYsSs81RMDwRxYVvlD7XT1rFw82Kqs+D3haHNai3tT7w90a9PC6HYNJ6A0cYwHCzaDGG/Tc
 yrxbQOivvMJlYxMe9uQeNWZ/I6eHyuqdlv5u9G9maOZBtU94kUDQOlzrxd5G4x6QzcX9x+NdS
 xfcNz4ALW+6F2Y=
Subject: [Buildroot] [PATCH v1] package/gst1-shark: bump version to 0.7.5
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog ([1], [2]):

  - 0.7.5: Eclipse Plugin was removed
  - 0.7.4: Remove RidgeRun Licence from Eclipse Plugin
           Add README with warning on Eclipse Plugin future removal

[1] https://github.com/RidgeRun/gst-shark/releases/tag/v0.7.4
[2] https://github.com/RidgeRun/gst-shark/releases/tag/v0.7.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index be26050715..cfd72dd2a6 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  689e60b4e10635a4f3af795b53045c6e90643896fa07b61e164a96158a79bdcf  gst1-shark-v0.7.3-br1.tar.gz
+sha256  413dbd8b6be1b09751e8d00abf9784de18cb74283c95ac078f6fb7d8750de26a  gst1-shark-v0.7.5-br1.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 4e7801e920..17df001cef 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.7.3
+GST1_SHARK_VERSION = v0.7.5
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
