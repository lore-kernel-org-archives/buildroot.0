Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B871DC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5038A81338;
	Tue,  1 Nov 2022 18:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5038A81338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK4SIwCVEgRi; Tue,  1 Nov 2022 18:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85EA581296;
	Tue,  1 Nov 2022 18:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85EA581296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97C891BF5F8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 735F8812AC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735F8812AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9utgW_fzDYt for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B484781287
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B484781287
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E7CB8799D; Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 19:14:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e99a233bd8065b875346fb2b5f13fe2fead8fe6
X-Git-Newrev: 685d8a031896352abfbbca65d3e433e06fef620a
X-Patchwork-Hint: ignore
Message-Id: <20221101181512.9E7CB8799D@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_docker-compose: fix docker compose
 container name
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=685d8a031896352abfbbca65d3e433e06fef620a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_docker_compose.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 10ceee3167..c940cc8839 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -42,7 +42,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         # will download container if not available, which may take some time
         self.assertRunOk('docker compose up -d', 120)
         # container may take some time to start
-        self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
+        self.assertRunOk('while ! docker inspect root-busybox-1 2>&1 >/dev/null; do sleep 1; done', 120)
         self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
         self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
