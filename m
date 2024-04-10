Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC1CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629E060EDA;
	Wed, 10 Apr 2024 21:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6zAGV2--KdP; Wed, 10 Apr 2024 21:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DAD060EB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DAD060EB3;
	Wed, 10 Apr 2024 21:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DEDA1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A72660EB3
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdTnfFbUnYQN for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EFB560EAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFB560EAF
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DE5685FB0; Wed, 10 Apr 2024 21:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:47:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07ef00df9bdff1486622fe8248168137aa531c9d
X-Git-Newrev: d4833cc14df8496bb98e5ccbf0c020fdd502edc9
X-Patchwork-Hint: ignore
Message-Id: <20240410214801.7DE5685FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-segno: add missing
 python3-{pyexpat, zlib} dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4833cc14df8496bb98e5ccbf0c020fdd502edc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last version bump removed python-setuptools runtime dependency
but doing so also removed the python3-pyexpat and python3-zlib
runtime depdencies [1] that are actually direct runtime
dependencies.

[1] 081162580f99d1a68133f7f513bf2cd6d1b8b6b6

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656982 (TestPythonPy3Segno)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-segno/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
index 7107e67443..e6080fd417 100644
--- a/package/python-segno/Config.in
+++ b/package/python-segno/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_SEGNO
 	bool "python-segno"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  QR Code and Micro QR Code generator for Python.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
