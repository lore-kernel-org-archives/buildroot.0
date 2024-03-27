Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D06EC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9AA820B2;
	Wed, 27 Mar 2024 22:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMC4QK_w_TIy; Wed, 27 Mar 2024 22:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97BE8820CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BE8820CF;
	Wed, 27 Mar 2024 22:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9AE21BF980
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96867820B2
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsK7oKWr08Dx for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A83811AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A83811AA
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B68A784390; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:53:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ccca0d77a9c61f3730aae0289210c4724aa1887
X-Git-Newrev: 3c0c08e80f98f0a7a27f5f6fdd48b801ec7490d0
X-Patchwork-Hint: ignore
Message-Id: <20240327220143.B68A784390@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyyaml: add cython for
 host-python-pyyaml
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c0c08e80f98f0a7a27f5f6fdd48b801ec7490d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for pyyaml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: order dependencies alphabetically]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyyaml/python-pyyaml.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 846c57df4f..40a1c25758 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -14,7 +14,8 @@ PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
 PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
 PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
 PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
-HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
+HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml host-python-cython
+HOST_PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
