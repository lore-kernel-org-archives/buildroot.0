Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB76C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18E440643;
	Fri, 29 Jul 2022 20:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18E440643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2K391GMDY7mx; Fri, 29 Jul 2022 20:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBCB408F5;
	Fri, 29 Jul 2022 20:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBCB408F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A844A1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FE94414E7
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE94414E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fivl008ERFsh for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7692A41526
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7692A41526
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 06F07869CA; Fri, 29 Jul 2022 20:36:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 22:44:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e15fe6a5e91def9fce5b7d19b1f78c072bdab41
X-Git-Newrev: 15c972f32a9e4c8fb3e18646885141ab0fa52fc0
X-Patchwork-Hint: ignore
Message-Id: <20220729203601.06F07869CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: introduce "Integration
 topics" chapter
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

commit: https://git.buildroot.net/buildroot/commit/?id=15c972f32a9e4c8fb3e18646885141ab0fa52fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to add more information in the manual about how a system created
with buildroot works overall. We currently already have a chapter about
SELinux, but we want to add more information like that, e.g. details
about how systemd in Buildroot works.

Create a new chapter "Integration topics" with an introductory blurb,
and move the SELinux topic under it (as a section rather than a
chapter).

"Integration topics" is not the best title, but we couldn't find
anything better.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: remove selinux from main manual.txt]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../{selinux-support.txt => integration-selinux-support.txt} |  6 +++---
 docs/manual/integration.txt                                  | 12 ++++++++++++
 docs/manual/manual.txt                                       |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/manual/selinux-support.txt b/docs/manual/integration-selinux-support.txt
similarity index 96%
rename from docs/manual/selinux-support.txt
rename to docs/manual/integration-selinux-support.txt
index 21137ae6c3..1f6bcf47eb 100644
--- a/docs/manual/selinux-support.txt
+++ b/docs/manual/integration-selinux-support.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[selinux]]
-== Using SELinux in Buildroot
+=== Using SELinux in Buildroot
 
 https://selinuxproject.org[SELinux] is a Linux kernel security module
 enforcing access control policies. In addition to the traditional file
@@ -30,7 +30,7 @@ upstream https://github.com/SELinuxProject/refpolicy[refpolicy]
 project, enabled with +BR2_PACKAGE_REFPOLICY+.
 
 [[enabling-selinux]]
-=== Enabling SELinux support
+==== Enabling SELinux support
 
 To have proper support for +SELinux+ in a Buildroot generated system,
 the following configuration options must be enabled:
@@ -42,7 +42,7 @@ In addition, your filesystem image format must support extended
 attributes.
 
 [[selinux-policy-tweaking]]
-=== SELinux policy tweaking
+==== SELinux policy tweaking
 
 The +SELinux refpolicy+ contains modules that can be enabled or
 disabled when being built. Each module provide a number of +SELinux+
diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
new file mode 100644
index 0000000000..bdfbfa59de
--- /dev/null
+++ b/docs/manual/integration.txt
@@ -0,0 +1,12 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration]]
+== Integration topics
+
+This chapter discusses how various things are integrated at system
+level. Buildroot is highly configurable, almost everything discussed
+here can be changed or overridden by xref:rootfs-custom[rootfs overlay
+or custom skeleton] configuration.
+
+include::integration-selinux-support.txt[]
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b5cc044805..fab66dbda5 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -38,7 +38,7 @@ include::common-usage.txt[]
 
 include::customize.txt[]
 
-include::selinux-support.txt[]
+include::integration.txt[]
 
 include::faq-troubleshooting.txt[]
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
