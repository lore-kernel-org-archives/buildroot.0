Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8699ECD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4067281F34;
	Mon,  1 Apr 2024 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z18TrOeD51KX; Mon,  1 Apr 2024 20:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9710681F36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9710681F36;
	Mon,  1 Apr 2024 20:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03EFD1BF966
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2143181E49
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBeKFziRejTB for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1550D81E82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1550D81E82
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12351845A9; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96c6f20de65b0cad79a53cae2b2df297ba65db12
X-Git-Newrev: f30f84dd93bcbbb5af4ded17e56e41d4d8d68426
X-Patchwork-Hint: ignore
Message-Id: <20240401201823.12351845A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyzmq: add cython for
 python-pyzmq
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f30f84dd93bcbbb5af4ded17e56e41d4d8d68426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for
python-pyzmq.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyzmq/python-pyzmq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 1d9a7d01cb..f1444b9124 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -13,6 +13,7 @@ PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 PYTHON_PYZMQ_DEPENDENCIES = \
+	host-python-cython \
 	host-python-packaging \
 	host-python-setuptools-scm \
 	zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
