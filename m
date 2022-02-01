Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AEDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59DDD40360;
	Tue,  1 Feb 2022 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXFlgSARTUAw; Tue,  1 Feb 2022 20:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6885A4019F;
	Tue,  1 Feb 2022 20:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8891BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEA760AAD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NbXNgYmFU60 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FC4607C1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4099C81979; Tue,  1 Feb 2022 20:45:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 21:52:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 675f02fd3f0b11b24eab62b781038e492c40bf90
X-Git-Newrev: f1768855e73c1c41eed0cad94ec4a5f90c8535bb
X-Patchwork-Hint: ignore
Message-Id: <20220201204545.4099C81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/size-stats-compare: fix flake8 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1768855e73c1c41eed0cad94ec4a5f90c8535bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

utils/size-stats-compare:80:15: E225 missing whitespace around operator

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/size-stats-compare | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index 2ccbe7d191..fc6dd70623 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -77,7 +77,7 @@ def print_results(result, threshold):
     # list_result is a list of tuples: ((filename, pkgname), (flag, size difference))
     # filename may be None if no detail is requested.
 
-    maxpkgname=max(len(pkgname) for filename, pkgname in result)
+    maxpkgname = max(len(pkgname) for filename, pkgname in result)
 
     for entry in sorted(list_result, key=lambda entry: entry[1][1]):
         data = dict(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
