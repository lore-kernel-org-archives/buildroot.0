Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743FC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 761E784D5D;
	Fri,  7 Jun 2024 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi_TL4rN0X9x; Fri,  7 Jun 2024 20:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99DAA84BF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99DAA84BF7;
	Fri,  7 Jun 2024 20:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04E4C1BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D316B84CA4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxzR7MIwpqSS for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4440584D44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4440584D44
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:30:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B46987D7B; Fri,  7 Jun 2024 20:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jun 2024 22:20:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: da56f2dc4c4281e3dfec55a0619c21c6b80d0484
X-Git-Newrev: aa9dfe9ae7e74e34f4c4909647f11cda0289b79e
X-Patchwork-Hint: ignore
Message-Id: <20240607203033.7B46987D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/privoxy: fix
 build with root
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa9dfe9ae7e74e34f4c4909647f11cda0289b79e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Set GROUP_T when installing configuration files as root to avoid the
following build failure raised since commit
b6816034ebddd522a8fef9daa454c28fa1230dd6:

/usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'

Fixes: b6816034ebddd522a8fef9daa454c28fa1230dd6
 - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 981d25e5bcedee0dee8efcfbaa1dedb466a5445f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-GNUMakefile.in-fix-root-install.patch     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch b/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
new file mode 100644
index 0000000000..89347c214e
--- /dev/null
+++ b/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
@@ -0,0 +1,35 @@
+From 25bd5ae1664f5603c05c72b2c38525602f33da0a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 31 Mar 2024 19:17:45 +0200
+Subject: [PATCH] GNUMakefile.in: fix root install
+
+Set GROUP_T when installing configuration files as root to avoid the
+following build failure since commit
+4b3b267db159dc23314de3062859481b7c397e32:
+
+/usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lists.privoxy.org/pipermail/privoxy-devel/2024-March/000760.html
+---
+ GNUmakefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/GNUmakefile.in b/GNUmakefile.in
+index cf79aae1..db1bab59 100644
+--- a/GNUmakefile.in
++++ b/GNUmakefile.in
+@@ -927,6 +927,7 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
+ 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
+ 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
+ 					$(ECHO)  "*******************************************************************" ;\
++					GROUP_T=$(GROUP) ;\
+ 				fi ;\
+ 			else \
+ 				GROUP_T=$(GROUP) ;\
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
