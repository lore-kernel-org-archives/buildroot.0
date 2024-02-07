Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60884C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0791B826C7;
	Wed,  7 Feb 2024 11:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cte4WBTW2ezn; Wed,  7 Feb 2024 11:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99561824BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99561824BD;
	Wed,  7 Feb 2024 11:06:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA2C1BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F488824BD
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCzgSJZtLFPP for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48BA1823F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48BA1823F6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 315F387552; Wed,  7 Feb 2024 11:06:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 12:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ef9213e4a99c7cf12aed4d21dc3b5338d81d50
X-Git-Newrev: 8f4be5c41bdf296e6f5c7ad7b9811d34386f89ea
X-Patchwork-Hint: ignore
Message-Id: <20240207110648.315F387552@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedevs: used manual's description
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f4be5c41bdf296e6f5c7ad7b9811d34386f89ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the makedevs syntax explanations are duplicated: one in
the package directory, which was introduced firat but bit-rotted for
a while each time the makedevs was updated, and once in the manual,
which lagged much less. As for all duplicated documentation, the two
diverged and one was not updated.

In commit 738fb6dfa48b (docs/manual: extend makedev syntax section),
we recently updated the makedevs syntax description, but that indeed
missed the old README.

Get rid of the README and replace it with a symlink to the manual
makedevs section.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/makedevs/README      | 35 -----------------------------------
 package/makedevs/README.adoc |  1 +
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/package/makedevs/README b/package/makedevs/README
deleted file mode 100644
index 70844bf802..0000000000
--- a/package/makedevs/README
+++ /dev/null
@@ -1,35 +0,0 @@
-When building a target filesystem, it is desirable to not have to
-become root and then run 'mknod' a thousand times.  Using a device
-table you can create device nodes and directories "on the fly".
-
-You can do all sorts of interesting things with a device table file.
-For example, if you want to adjust the permissions on a particular
-file you can just add an entry like:
-
-  /sbin/foobar f 2755 0 0 - - - - -
-
-and (assuming the file /sbin/foobar exists) it will be made setuid
-root (regardless of what its permissions are on the host filesystem.
-
-Furthermore, you can use a single table entry to create a many device
-minors.  For example, if I wanted to create /dev/hda and
-/dev/hda[0-15] I could just use the following two table entries:
-
-  /dev/hda b 640 0 0 3 0 0 0 -
-  /dev/hda b 640 0 0 3 1 1 1 15
-
-Device table entries take the form of:
-
-<name> <type> <mode> <uid> <gid> <major> <minor> <start> <inc> <count>
-
-where name is the file name,  type can be one of:
-
-      f: A regular file
-      d: Directory
-      c: Character special device file
-      b: Block special device file
-      p: Fifo (named pipe)
-
-uid is the user id for the target file, gid is the group id for the
-target file.  The rest of the entries (major, minor, etc) apply only
-to device special files.
diff --git a/package/makedevs/README.adoc b/package/makedevs/README.adoc
new file mode 120000
index 0000000000..d62887a747
--- /dev/null
+++ b/package/makedevs/README.adoc
@@ -0,0 +1 @@
+../../docs/manual/makedev-syntax.adoc
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
