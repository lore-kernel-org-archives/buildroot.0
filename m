Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46680C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 07:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBF8741A41;
	Wed,  3 Jul 2024 07:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK1N5UAKHOvV; Wed,  3 Jul 2024 07:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D7014099C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D7014099C;
	Wed,  3 Jul 2024 07:20:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA9ED1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62C460E69
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz7jUncgxY_K for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 07:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D2160E67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92D2160E67
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 07:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CAFB83B31; Wed,  3 Jul 2024 07:20:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 09:18:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e00cceb60e9ac8ec36ec7eb43eb9ef5534b705d
X-Git-Newrev: 32aacc4737e106a7ddb2f2129d4ab9f2279dcf92
X-Patchwork-Hint: ignore
Message-Id: <20240703072049.7CAFB83B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] gitlab: add default issue template
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8894487568363365119=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8894487568363365119==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=32aacc4737e106a7ddb2f2129d4ab9f2279dcf92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============8894487568363365119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8894487568363365119==--
