Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69706C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CA35811AA;
	Wed, 27 Mar 2024 22:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3TwN_mXOMrX; Wed, 27 Mar 2024 22:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62A0820EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62A0820EC;
	Wed, 27 Mar 2024 22:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9A011BF983
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C596240917
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdhdHrk2XI1W for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3EB14090B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3EB14090B
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A97D28438F; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:44:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 830eda38e1590f449bd479ca89e08108aa1ade81
X-Git-Newrev: 4ccca0d77a9c61f3730aae0289210c4724aa1887
X-Patchwork-Hint: ignore
Message-Id: <20240327220143.A97D28438F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-rust: add host
 setuptools-scm dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ccca0d77a9c61f3730aae0289210c4724aa1887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need host-python-setuptools-scm for python-setuptools-rust to build
correctly when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing setuptools_rust.egg-info/PKG-INFO
writing dependency_links to setuptools_rust.egg-info/dependency_links.txt
writing entry points to setuptools_rust.egg-info/entry_points.txt
writing requirements to setuptools_rust.egg-info/requires.txt
writing top-level names to setuptools_rust.egg-info/top_level.txt
reading manifest file 'setuptools_rust.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
adding license file 'LICENSE'
writing manifest file 'setuptools_rust.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	setuptools_scm

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: order dependencies alphabetically]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-setuptools-rust/python-setuptools-rust.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index f07263becf..1203fbf616 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -10,6 +10,9 @@ PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
+	host-python-semantic-version \
+	host-python-setuptools-scm \
+	host-rustc
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
