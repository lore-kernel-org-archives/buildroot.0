Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D611BC3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F4340940;
	Fri, 26 Jul 2024 07:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdKZ4ISKgoNU; Fri, 26 Jul 2024 07:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5963340944
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5963340944;
	Fri, 26 Jul 2024 07:32:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE8B1BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C82540018
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0DkTbFLcZpN for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2238C40150
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2238C40150
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1944F807E5; Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 09:31:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b65856fbb0895d4b08f35b2d3a9bb5b5a2069e1d
X-Git-Newrev: ea3c465304d1d7a2891d9f47775996855461f117
X-Patchwork-Hint: ignore
Message-Id: <20240726073210.1944F807E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] gitignore: ignore multiple output
 directories
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea3c465304d1d7a2891d9f47775996855461f117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Developers may have multiple output directories when building multiple
boards in parallel. A previous commit attempted to gitignore new output
directories automatically but broke some things (commit a14c862c08
"Create a .gitignore file in the CANONICAL_O directory").

To provide some support, ignore anything in the Buildroot directory that
starts with "output". This is a bit more cumbersome, but doesn't break
packages based on Python maturin.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..ec5768d053 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,4 @@
-/output
+/output*
 /dl
 /.auto.deps
 /.config.cmd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
