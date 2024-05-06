Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09C9C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF2960AAF;
	Mon,  6 May 2024 21:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRejdmIPVZ5g; Mon,  6 May 2024 21:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D4F60AA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D4F60AA6;
	Mon,  6 May 2024 21:27:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4A861BF95F
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A77440713
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j37UjBtv-WRh for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921C3406B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 921C3406B7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:27:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D3BB86963; Mon,  6 May 2024 21:27:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:54:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 14e1388a95e3df3732d70c0b94a89836f3e072e2
X-Git-Newrev: 63d5a3b88e345a620ffebf04f18b81ef659db609
X-Patchwork-Hint: ignore
Message-Id: <20240506212727.7D3BB86963@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/python-service-identity: add missing python-cryptography dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=63d5a3b88e345a620ffebf04f18b81ef659db609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The last version bump removed python-pyopenssl runtime dependency but
doing so also removed the python-cryptography runtime depdency [1] that
is actually a direct runtime dependency.

While at it, update BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
dependency comment.

[1] 6008f2b1b901be1374ac201b5e560cca61b4b61e

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656983 (TestPythonPy3ServiceIdentity)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee074ddf6f0d00a97a1cae4ba62c1cffc77bb6e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index dccd8f37c0..3bb5c08c6f 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
-	# python-pyopenssl -> python-cryptography
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
