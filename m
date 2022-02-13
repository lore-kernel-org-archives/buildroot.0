Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D599DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C9A81460;
	Sun, 13 Feb 2022 11:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajL7V7lq5IET; Sun, 13 Feb 2022 11:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E8B8144E;
	Sun, 13 Feb 2022 11:14:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9342B1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8069C4033F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yucd_d8c-caW for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B28401F8
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 68FFF82821; Sun, 13 Feb 2022 11:06:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:11:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 594b2e9d3c427abac3efcbdf98359d2abe3d6888
X-Git-Newrev: 26157321240adb9f5cc2802183d3955a877b9487
X-Patchwork-Hint: ignore
Message-Id: <20220213110615.68FFF82821@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-python.txt:
 drop <pkg>_NEEDS_HOST_PYTHON
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

commit: https://git.buildroot.net/buildroot/commit/?id=26157321240adb9f5cc2802183d3955a877b9487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone and the corresponding logic in pkg-python.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-python.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index cfd2f88920..0141fea85b 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -141,13 +141,6 @@ therefore only use a few of them, or none.
   packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
   setuptools packages).
 
-* +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
-  interpreter. The usage of this variable is limited to host
-  packages. The two supported value are +python2+ and +python3+. It
-  will ensure the right host python package is available and will
-  invoke it for the build. If some build steps are overloaded, the
-  right python interpreter must be explicitly called in the commands.
-
 With the Python infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
 for most Python-based packages. However, when required, it is still
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
