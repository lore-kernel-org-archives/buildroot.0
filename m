Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE8C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2C042092;
	Tue,  6 Feb 2024 22:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59tMo7C-IJCu; Tue,  6 Feb 2024 22:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781B24209C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 781B24209C;
	Tue,  6 Feb 2024 22:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1FDB1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7F642093
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5r06VC21ZoL for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F0542092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5F0542092
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94FEB87482; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:21:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36e635d2d5c0166476858aa239ccbe78e8f2af14
X-Git-Newrev: 89e67a96383f1a0d8f44a9385637798f8c31ef3f
X-Patchwork-Hint: ignore
Message-Id: <20240206222231.94FEB87482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update documentation about
 support python <pkg>_SETUP_TYPE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89e67a96383f1a0d8f44a9385637798f8c31ef3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that we do not document the special flit-bootstrap value, as it
is considered an internal implementation detail, and shouldn't
normally be used by packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc |  4 ++--
 docs/manual/adding-packages-python.adoc    | 26 ++++++++++++++------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index e994b7e1f6..03249ca06f 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,8 +429,8 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +pep517+ or +setuptools+
-   mechanisms. We cover them through a
+   for Python modules that use the +flit+, +pep517+, +setuptools+,
+   +setuptools-rust+ or +maturin+ mechanisms. We cover them through a
    xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 44fd77fd1d..9953be6639 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -4,9 +4,9 @@
 === Infrastructure for Python packages
 
 This infrastructure applies to Python packages that use the standard
-Python setuptools or pep517 mechanisms as their build system, generally
-recognizable by the usage of a +setup.py+ script or +pyproject.toml+
-file.
+Python setuptools, pep517, flit or maturin mechanisms as their build
+system, generally recognizable by the usage of a +setup.py+ script or
++pyproject.toml+ file.
 
 [[python-package-tutorial]]
 
@@ -51,8 +51,9 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The three
-supported ones are +flit+, +pep517+ and +setuptools+.
+this case the +setuptools+ Python build system is used. The five
+supported ones are +flit+, +pep517+, +setuptools+, +setuptools-rust+
+and +maturin+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -98,13 +99,14 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The three supported values are +flit+, +pep517+ and
-  +setuptools+. If you don't know which one is used in your package,
-  look at the +setup.py+ or +pyproject.toml+ file in your package
-  source code, and see whether it imports things from the +flit+
-  module or the +setuptools+ module. If the package is using a
-  +pyproject.toml+ file without any build-system requires and with a
-  local in-tree backend-path one should use +pep517+.
+  by the package. The five supported values are +flit+, +pep517+ and
+  +setuptools+, +setuptools-rust+ and +maturin+. If you don't know
+  which one is used in your package, look at the +setup.py+ or
+  +pyproject.toml+ file in your package source code, and see whether
+  it imports things from the +flit+ module or the +setuptools+
+  module. If the package is using a +pyproject.toml+ file without any
+  build-system requires and with a local in-tree backend-path one
+  should use +pep517+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
