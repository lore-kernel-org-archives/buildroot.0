Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855EBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 257574040D;
	Fri, 14 Jan 2022 15:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52dZ0d8_pYWN; Fri, 14 Jan 2022 15:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FDDD404A8;
	Fri, 14 Jan 2022 15:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB5B1BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A9A5607B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MY6X7rjkrH2o for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8690060B26
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B39D835A7; Fri, 14 Jan 2022 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:25:17 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: c1c56be8a0cd9cdfefe15dc9897d41c56b007546
X-Git-Newrev: 391ef106dd2ec69d56b059c095d1b97bf08a5382
X-Patchwork-Hint: ignore
Message-Id: <20220114155011.6B39D835A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-idna: add
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=391ef106dd2ec69d56b059c095d1b97bf08a5382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

A host variant of the python-idna package will be needed for the
host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7c4a52e08789997229f505f59853a095b03c6668)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-idna/python-idna.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 7314d85493..a2c842f1e7 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -10,5 +10,7 @@ PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
+HOST_PYTHON_IDNA_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
