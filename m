Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9791DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A53741678;
	Thu,  3 Feb 2022 23:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2eSaxhCe7ux; Thu,  3 Feb 2022 23:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52F0741670;
	Thu,  3 Feb 2022 23:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDE61BF2F3
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C31A81D3D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlxQjgpGv4St for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:54:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5642B81CA3
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:54:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FlvzntcB8I46dFlvznx0w2; Fri, 04 Feb 2022 00:54:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643932480; bh=agb7iXx6ejtVFvt4lW5gdg0CAosurv7PbUPEUxv0EeE=;
 h=From:To:Subject:Date:MIME-Version;
 b=oDVtVHKrCBHhjnx0NY6szoM9XPSoPoRPbdRipsV5yMDlMxnxHrzR72/Ipz/I8/sfb
 EQyo4+kBX3Q6r2m4W9UEP4OayiS9MsMxRMobNClAdtorlpL7jX3ZIiydiOXRYfvsMz
 KXgquR/rm5vT2bWV0lNrRwM5p6hhd20LKlGaoGMOmMlapfY35M08ytLc9v1vSCzUWe
 +QK+XnOb1m/iU++LruvDSBU755NYRni7aBIQGEa3zyrK59qEGtXURL8m0/HKyUKddZ
 QXT+X5zxMF0cvwIubuKSjVUQG8ndKxTyaHS+l6ZjmOFVMLbaygKuO7QVn+aaEnpedP
 2zlHViL+C2jDw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 00:54:38 +0100
Message-Id: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH2MnXJOQM10PW7eZqyw9/PWqX4BF+FVsizb45PVj60oov0LyVogputsTC0H7nEnOG2+PIQ95vYUY3EwkPFbYghdkDgkkr7LVqGbo+ViVP8RGLbzX4F8
 nb5JIyJGt/eHwDYoxE4DthcuMEsP4wFVCt48YybF1azogONvisa4LbSIba/dgFKnbJcAzVaqwY87Ce6W114RE8f7jRmtyAbu3MGyzRAOZFLQVNDhaH6No0s+
 iG5RxFOYrBZactcgoWIveXFgRKtwGor+a2u/EK/8fK8FUi07mWb08WZ72XmuSK6pHb52z3ZYMthUfSyJt49t0A==
Subject: [Buildroot] [PATCH] manual: board support: add instructions to test
 defconfig in the official docker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Often new boards have not been tested with official docker so let's add
instructions to do it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/adding-board-support.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index 33ed709535..f5fb3af371 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -46,3 +46,25 @@ create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
 Buildroot configuration. Refer to xref:customize[] for more details.
+
+Before submitting patches for new boards it would be better to test it
+by building it using .gitlab-ci.yml specified docker. For example at the
+time of this writing the docker is:
+$CI_REGISTRY/buildroot.org/buildroot/base:20220105.2314
+so:
+Pull the docker:
+--------------------
+ $ docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
+--------------------
+Run the docker:
+--------------------
+ $ sudo docker run -it registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314 /bin/bash
+--------------------
+Inside the docker hint:
+--------------------
+ $ git clone git://git.busybox.net/buildroot
+ $ cd buildroot
+ $ make +<boardname>_defconfig+
+ $ make
+--------------------
+Wait until build finishes and eventually add host dependencies.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
