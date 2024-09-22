Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39ACF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D32BD81461;
	Sun, 22 Sep 2024 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcN8pZqcxfcS; Sun, 22 Sep 2024 10:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A02581431
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A02581431;
	Sun, 22 Sep 2024 10:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8E61BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA19A4064B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeC7aKmppAzj for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB2940652
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAB2940652
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5D50811F3; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:31:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6804b486371c56e88be41d0b34dcb16abfbfe13
X-Git-Newrev: c0613d45fb412a44a80a1af97731e901be3b9a75
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.B5D50811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.123.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0613d45fb412a44a80a1af97731e901be3b9a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://github.com/python-zeroconf/python-zeroconf/commit/755ceae1f6a899a8befcc033d99acdddee224ba2

Migrate from setuptools to poetry build backend.

Add new host-python-cython build dependency.

Add host-python-setuptools build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-zeroconf/python-zeroconf.hash |  6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 10 +++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 13e1d16cde..dbc54b1e1c 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  f85fb9d239397b53836495fd49b85e5f  zeroconf-0.39.4.tar.gz
-sha256  701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295  zeroconf-0.39.4.tar.gz
+md5  c4d49cca10d8d10f12e9152d6380de35  zeroconf-0.123.0.tar.gz
+sha256  c50f24c9a7a6c7ba4bb301defad03a9d85dffb3ee280953de44eee9f432f2550  zeroconf-0.123.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35e4136e96aace60757a8b939741959d8627c4bc1fce62af99df325395276c56  COPYING
+sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index d939b2e5ae..726d874034 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.39.4
+PYTHON_ZEROCONF_VERSION = 0.123.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/f5/4f/c47cea73d7ae5467b63de3999d7207fd5b14d70cb2f35ce81c4ab7d7a52e
-PYTHON_ZEROCONF_SETUP_TYPE = setuptools
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/db/47/85eafb277f6ef78e1a1895cc72f0035dfa6a5e51396134eb9ce21564c72f
+PYTHON_ZEROCONF_SETUP_TYPE = pep517
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
+PYTHON_ZEROCONF_DEPENDENCIES = \
+	host-python-cython \
+	host-python-poetry-core \
+	host-python-setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
