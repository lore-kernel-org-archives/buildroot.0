Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF1C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829954139F;
	Wed, 10 Jul 2024 22:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-oAMwNga0zP; Wed, 10 Jul 2024 22:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E6E40CFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E6E40CFF;
	Wed, 10 Jul 2024 22:09:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD8731BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB2BC60784
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XER87dMYhMpR for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4936F60779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4936F60779
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:09:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37E9F84958; Wed, 10 Jul 2024 22:09:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:01:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a09d7b1d5f0874916ae4078b8037d7243aaa68be
X-Git-Newrev: 657ee644b3f4d9d1e7e7bdc45d1f689890ac36a0
X-Patchwork-Hint: ignore
Message-Id: <20240710220921.37E9F84958@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] gitlab: add default issue
 template
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
Content-Type: multipart/mixed; boundary="===============7739277288875730897=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7739277288875730897==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=657ee644b3f4d9d1e7e7bdc45d1f689890ac36a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This introduces the default issue template, to help users provide issues
that are meaningful, and that will help reproduce the issue.

If needed, we can add more templates in the future.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout:
 - add link to mailing list;
 - rephrase "pristine Buildroot";
 - add a checklist item for "I'm using latest commit";
 - add a checklist item for "make clean; make";
 - add formal items for Buildroot commit sha1 and distro.]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 32aacc4737e106a7ddb2f2129d4ab9f2279dcf92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab/issue_templates/default.md | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/.gitlab/issue_templates/default.md b/.gitlab/issue_templates/default.md
new file mode 100644
index 0000000000..c3f23e54ba
--- /dev/null
+++ b/.gitlab/issue_templates/default.md
@@ -0,0 +1,60 @@
+Thank you for opening a new issue. To help solve it faster and more easily,
+please review this check-list, and fill in the sections below. Adapt as
+needed.
+
+Do not open an issue to request a new feature; instead, post a message to
+[the mailing list](https://lists.buildroot.org/mailman/listinfo/buildroot).
+
+_Note: issues missing any information may get closed without further ado._
+
+---
+### Check-list
+
+- [ ] I did not find the issue in the existing issues
+- [ ] I can reproduce the issue with unmodified Buildroot from [this
+      repository](https://gitlab.com/buildroot.org/buildroot), not from a
+      fork somewhere else
+- [ ] I can reproduce the issue on the latest commit of the branch I'm using:
+    - [ ] master
+    - [ ] stable (i.e. 20NN.MM.x - please specify)
+    - [ ] LTS (i.e. 20NN.02.x - please specify)
+- [ ] I can reproduce the issue after running `make clean; make`
+- [ ] I attached the full build log file (e.g. `make 2>&1 |tee build.log`)
+- [ ] I attached a **minimal** defconfig file that can reproduce the
+      issue (`make BR2_DEFCONFIG=$(pwd)/issue_defconfig savedefconfig`)
+- [ ] I also attached the configuration for kconfig-based packages that
+      are enabled (and necessary to reproduce the issue), most notably:
+    - [ ] busybox
+    - [ ] linux
+    - [ ] uclibc
+    - [ ] uboot
+    - [ ] …
+
+---
+### What I did
+
+**Buildroot commit sha1**: _get this with `git describe HEAD`_
+**Distribution of the build machine**: _get this with `NAME` and `VERSION` from `/etc/os-release`_
+
+_Here, describe what you did:_
+- _any special environment variables: CC, CXX, TARGET, CROSS_COMPILE, etc…_
+- _the commands you ran:_
+    ```sh
+    $ make [...]
+    ```
+- _anything else that you might think is important…_
+
+---
+### What happens
+
+_Here, describe what happens that you believe was incorrect._
+
+---
+### What was expected
+
+_Here, describe the behaviour you expected._
+
+---
+### Extra information
+
+_Here, you may write additional information that does not fit above_

--===============7739277288875730897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7739277288875730897==--
