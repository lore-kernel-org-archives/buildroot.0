Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9B4C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D015740103;
	Thu, 20 Jun 2024 18:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2kA36TkeypL; Thu, 20 Jun 2024 18:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E921404B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E921404B3;
	Thu, 20 Jun 2024 18:32:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAA991BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A52C28454C
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Se6-UhNgfbJ7 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18148454A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E18148454A
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:32:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9332688083; Thu, 20 Jun 2024 18:32:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 20:31:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecf060a2ff93626fb5fbe1c52b8d42b6ee0fbb5b
X-Git-Newrev: 7338e103890c669c48797b0c96d1a5a66ce2d811
X-Patchwork-Hint: ignore
Message-Id: <20240620183220.9332688083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-bootstrap-stage3: move missing
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=7338e103890c669c48797b0c96d1a5a66ce2d811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch was added in commit 25991c843c3f (package/go-bootstrap-stage3:
fix go-bootstrap when parent dir contains invalid .git). Then all the
go-compiler packages were moved to a common sub-directory, in commit
0290c543dec8 (package/go: new subdirectory for go variants).

However, the patch for commit 0290c543dec8 was sent to the mailing list
before 25991c843c3f was applied, so it could not have moved a file that
was only added later.

Move that file, now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
---
 .../0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
