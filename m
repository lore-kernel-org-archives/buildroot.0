Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE65CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 916984334A;
	Thu, 19 Sep 2024 09:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4xIFDQSmm9E; Thu, 19 Sep 2024 09:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D38643344
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D38643344;
	Thu, 19 Sep 2024 09:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37E741BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB352615D9
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKyhfbujcaOI for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11389615FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11389615FB
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DE847FC62; Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:11:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 783c0eb7c7b582ff14a34edc95bdf5973cc4cbfd
X-Git-Newrev: 5fb4d48713022f1c18363963fe23acceba1abf9e
X-Patchwork-Hint: ignore
Message-Id: <20240919091608.0DE847FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] gitlab: fix issue template
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
Content-Type: multipart/mixed; boundary="===============4623016249999161928=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4623016249999161928==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5fb4d48713022f1c18363963fe23acceba1abf9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The two lines with the Buildroot version and the system os-release
details are rendered on a single line, "because Markdown".

Make that a two-item list, to be sure they are on properly rendered.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6a1e297a31ed3257876fcba5064dbce36b1e670c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab/issue_templates/default.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab/issue_templates/default.md b/.gitlab/issue_templates/default.md
index c3f23e54ba..968d6aab64 100644
--- a/.gitlab/issue_templates/default.md
+++ b/.gitlab/issue_templates/default.md
@@ -33,8 +33,8 @@ _Note: issues missing any information may get closed without further ado._
 ---
 ### What I did
 
-**Buildroot commit sha1**: _get this with `git describe HEAD`_
-**Distribution of the build machine**: _get this with `NAME` and `VERSION` from `/etc/os-release`_
+- **Buildroot commit sha1**: _get this with `git describe HEAD`_
+- **Distribution of the build machine**: _get this with `NAME` and `VERSION` from `/etc/os-release`_
 
 _Here, describe what you did:_
 - _any special environment variables: CC, CXX, TARGET, CROSS_COMPILE, etc…_

--===============4623016249999161928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4623016249999161928==--
