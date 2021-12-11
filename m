Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC082C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 994A740472;
	Sat, 11 Dec 2021 19:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3u_n3StliuJ; Sat, 11 Dec 2021 19:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3D8040173;
	Sat, 11 Dec 2021 19:56:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8631BF414
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A69660D71
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3y4eN81FFxc for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 978B861355
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7ED3382804; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 997965c3a315821c973a01a08396f54ebe6c863c
X-Git-Newrev: 531192df1933736ebf10c9601fc5fc75d682b53f
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.7ED3382804@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: rename patch with the
 proper naming convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=531192df1933736ebf10c9601fc5fc75d682b53f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make screen-dirclean screen-patch | grep 'Patching\|Applying'

Before:
>>> screen 4.8.0 Patching
Applying 0001-no-memcpy-fallback.patch using patch:
Applying 0002-install-no-backup-binary.patch using patch:
Applying 0003-install-always-chmod.patch using patch:
Applying 0004-install-nonversioned-binary.patch using patch:
Applying 0005-rename-sched_h.patch using patch:
Applying 0006-comm-h-now-depends-on-term-h.patch using patch:
Applying 0007-comm.h-needed-for-list_-display-generic-.o.patch using patch:
Applying 0008_CVE-2021-26937.patch using patch:

After:
>>> screen 4.8.0 Patching
Applying 0001-no-memcpy-fallback.patch using patch:
Applying 0002-install-no-backup-binary.patch using patch:
Applying 0003-install-always-chmod.patch using patch:
Applying 0004-install-nonversioned-binary.patch using patch:
Applying 0005-rename-sched_h.patch using patch:
Applying 0006-comm-h-now-depends-on-term-h.patch using patch:
Applying 0007-comm.h-needed-for-list_-display-generic-.o.patch using patch:
Applying 0008-CVE-2021-26937.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/screen/{0008_CVE-2021-26937.patch => 0008-CVE-2021-26937.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/screen/0008_CVE-2021-26937.patch b/package/screen/0008-CVE-2021-26937.patch
similarity index 100%
rename from package/screen/0008_CVE-2021-26937.patch
rename to package/screen/0008-CVE-2021-26937.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
