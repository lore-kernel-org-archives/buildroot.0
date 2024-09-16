Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40FCC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A292B6086C;
	Mon, 16 Sep 2024 10:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uL9_4sYvbpo; Mon, 16 Sep 2024 10:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B14FA608A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14FA608A6;
	Mon, 16 Sep 2024 10:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0221BF966
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB07D811CD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAJtWqR6A7V1 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE3B811C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE3B811C2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7ECA8019E; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:23:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3eb2c46bc4d943d4f3e118e405ed0d6999836f9b
X-Git-Newrev: 6a0257e9497fe82718babde3b0e3df89c27676f3
X-Patchwork-Hint: ignore
Message-Id: <20240916102405.A7ECA8019E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/python-unittest-xml-reporting: add patch to fix LICENSE file
 installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a0257e9497fe82718babde3b0e3df89c27676f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The LICENSE file gets installed directly to the root of $(TARGET_DIR),
which clashes with other packages:

FileExistsError: File already exists: /home/autobuild/autobuild/instance-3/output-1/target/LICENSE

This commit fixes this issue for the python-unittest-xml-reporting
package. Other fixes will be needed for the other patches.

The issue in python-unittest-xml-reporting was introduced in upstream
commit c43427611390fba83ca13fbb5311bd8fece5048f, which first appeared
in v3.1.0. We switched from a pre-3.1.0 version to 3.2.0 in Buildroot
in commit 69ba1562d5bef8d58b430fd7d67d0f3e77acfefc, which was merged
in 2023.02.

Fixes:

  http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 182d3556a6838c01b0d1f4e6a36da84260605298)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...op-data_files-installs-LICENSE-to-incorre.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
new file mode 100644
index 0000000000..4bc005f448
--- /dev/null
+++ b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
@@ -0,0 +1,40 @@
+From 662cd67695c31126d72035a818b0f5f1da5a31ca Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 12:24:28 +0200
+Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
+ place
+
+As reported in issue
+https://github.com/xmlrunner/unittest-xml-reporting/issues/284, the
+data_files statement in the setup() calls installs the LICENSE file in
+the wrong place: in /usr/LICENSE, or even /LICENSE depending on the
+configuration.
+
+So let's drop this, and let setuptools install the LICENSE file
+automatically: since setuptools v56, the license_files attribute is
+automatically assigned to a default value, which includes "LICENSE",
+so there is in fact nothing to do to the get the LICENSE file
+installed at the correct location. See
+https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
+
+Upstream: https://github.com/xmlrunner/unittest-xml-reporting/pull/287
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c524ed4..afa5925 100755
+--- a/setup.py
++++ b/setup.py
+@@ -27,7 +27,6 @@ setup(
+     description = 'unittest-based test runner with Ant/JUnit like XML reporting.',
+     long_description = long_description,
+     long_description_content_type = 'text/markdown',
+-    data_files = [('', ['LICENSE'])],
+     install_requires = ['lxml'],
+     license = 'BSD',
+     platforms = ['Any'],
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
