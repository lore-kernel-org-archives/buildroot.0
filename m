Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB1FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 12:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2F1E4055D;
	Mon, 21 Feb 2022 12:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_HofSpiWBE2; Mon, 21 Feb 2022 12:07:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7EE7402F3;
	Mon, 21 Feb 2022 12:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88D271BF3BE
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 12:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849F040916
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 12:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjBNxjSFByhR for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 12:07:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by smtp4.osuosl.org (Postfix) with ESMTP id 042F240928
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TqG2R
 32J5sW+M7zoEinlWScbyVh0gh/DUDNbaLJOwpU=; b=aN2PcRc2jz3RYmbYc7YNq
 8Qi2ux3G8b6+AtdRwdrJxPNyqyYM0t3+zybZfICp0tLghNLg0LzR9RpDSLpiH5B4
 agkSvtCOAr9/ZrHhxVnHEZY1c2yxvh+Jk0rO5p6AHTbZvV8XlRJWoF3+EOWc8aHy
 lJpAXNBLpb7T3E9eWw7WHs=
Received: from localhost.localdomain (unknown [123.185.181.144])
 by smtp10 (Coremail) with SMTP id DsCowADneTR_gBNig6DsEA--.18670S2;
 Mon, 21 Feb 2022 20:07:27 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 04:06:57 -0800
Message-Id: <20220221120657.4095013-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DsCowADneTR_gBNig6DsEA--.18670S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4xJry8Kr48AFWxGFy8Zrb_yoW3twc_WF
 4rtrWSkFs5ZrWFg3sYy3W3tr93Ga97Gr40ya12yFnxCr4a9F42qr4kGr45Z3yxW3W7Kr1f
 AFWfCF4rJrnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKXo27UUUUU==
X-Originating-IP: [123.185.181.144]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqRmujV0Dd0HhogAAs4
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: remove unused sqlite
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dependency on sqlite has been removed since v17.04.0-ce.

See: https://github.com/moby/moby/pull/30208

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/docker-engine/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 911cbfe428..1f0efb8fcc 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
-	select BR2_PACKAGE_SQLITE # runtime dependency
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
