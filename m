Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17725E728DE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8A1C83DAE;
	Fri, 29 Sep 2023 20:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8A1C83DAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2goUJFzrKVl; Fri, 29 Sep 2023 20:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC97F83DCC;
	Fri, 29 Sep 2023 20:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC97F83DCC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE1191BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C7283DB1
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C7283DB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gn89WH57b5o for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D141083DC0
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D141083DC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C14CD8367B; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c80f50ef0440270a6bc52caec9cb312287a1e75
X-Git-Newrev: 7906272c39744e26ed73028725787aa3a4441c54
X-Patchwork-Hint: ignore
Message-Id: <20230929200351.C14CD8367B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtoml: migrate to
 setuptools-rust infrastructure
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

commit: https://git.buildroot.net/buildroot/commit/?id=7906272c39744e26ed73028725787aa3a4441c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can now significantly simplify the python-rtoml build using the
new setuptools-rust setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-rtoml/python-rtoml.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index 9afe8c0315..819dcf3288 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -7,16 +7,8 @@
 PYTHON_RTOML_VERSION = 0.8.0
 PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
 PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
-PYTHON_RTOML_SETUP_TYPE = setuptools
+PYTHON_RTOML_SETUP_TYPE = setuptools-rust
 PYTHON_RTOML_LICENSE = MIT
 PYTHON_RTOML_LICENSE_FILES = LICENSE
-PYTHON_RTOML_DEPENDENCIES = host-python-setuptools-rust host-rustc
-PYTHON_RTOML_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_RTOML_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_RTOML_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_RTOML_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
