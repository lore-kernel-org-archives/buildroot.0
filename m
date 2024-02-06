Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C01AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B958416CA;
	Tue,  6 Feb 2024 16:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B958416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuAXDIMPHVAY; Tue,  6 Feb 2024 16:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235A4416C3;
	Tue,  6 Feb 2024 16:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235A4416C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9375F1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD0B61043
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD0B61043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L51ZvOAHiMcV for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B565860C17
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B565860C17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A26068711B; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:02:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fba40a9f39cbd6b3f662073d148aad371dc07964
X-Git-Newrev: 21d89a5b86f550958b4e23262b33e8497842b8dd
X-Patchwork-Hint: ignore
Message-Id: <20240206160322.A26068711B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/readme.txt: document docker-run
 script
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

commit: https://git.buildroot.net/buildroot/commit/?id=21d89a5b86f550958b4e23262b33e8497842b8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[yann.morin.1998@free.fr: the default is an interactive shell]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/readme.txt b/utils/readme.txt
index d5cda70bfc..6488d13c75 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -18,6 +18,11 @@ check-package
     It checks the .checkpackageignore file if errors should be ignored and
     errors if there's a file listed that doesn't produce an error.
 
+docker-run
+    a script that runs a command (like make check-package) inside the
+    buildroot CI docker container; pass no command to get an interactive
+    shell.
+
 genrandconfig
     a script that generates a random configuration, used by the autobuilders
     (http://autobuild.buildroot.org). It selects a random toolchain from
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
