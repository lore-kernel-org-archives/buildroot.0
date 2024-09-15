Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70566C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D21D849D3;
	Sun, 15 Sep 2024 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBwI7ESc2lZF; Sun, 15 Sep 2024 21:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430EB84727
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430EB84727;
	Sun, 15 Sep 2024 21:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 710241BF954
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA6560A47
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBWcEg3MlZwY for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B4860880
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B4860880
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD78A821B6; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:58:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9b0893a8e2ec57db0d2a353539511a9c988a9b4
X-Git-Newrev: 8931e9f5344ad050d998fecd841b0d43bba78c55
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.CD78A821B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: switch go-src to use
 flannel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8931e9f5344ad050d998fecd841b0d43bba78c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test currently uses tinifier, but it can't be vendored as of today,
so switch to use flannel which can (still?) be...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_go.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
index 0b25fbc26d..a657a435f9 100644
--- a/support/testing/tests/package/test_go.py
+++ b/support/testing/tests/package/test_go.py
@@ -19,9 +19,9 @@ class TestGoSource(TestGoBase):
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_PACKAGE_HOST_GO=y
         BR2_PACKAGE_HOST_GO_SRC=y
-        BR2_PACKAGE_TINIFIER=y
+        BR2_PACKAGE_FLANNEL=y
         """
 
     def test_run(self):
         self.login()
-        self.assertRunOk("tinifier -h")
+        self.assertRunOk("/opt/bin/flanneld -h")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
