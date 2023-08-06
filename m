Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD812C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D9681E61;
	Sun,  6 Aug 2023 17:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D9681E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPRKK9gfP0kG; Sun,  6 Aug 2023 17:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A904181E64;
	Sun,  6 Aug 2023 17:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A904181E64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1199A1BF2BE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61C081775
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61C081775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYU08TaRdHd4 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC067813C0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC067813C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA15B8454F; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 77eba3436d3fbd0aaf0318774b66d30c098edf01
X-Git-Newrev: 2bd1d9d812d529071e1ab9d8ed8344f8077286d3
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.EA15B8454F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-stack-data:
 switch from setuptools to pep517
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bd1d9d812d529071e1ab9d8ed8344f8077286d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for building with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-stack-data/python-stack-data.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
index 494ce8f454..1a85938311 100644
--- a/package/python-stack-data/python-stack-data.mk
+++ b/package/python-stack-data/python-stack-data.mk
@@ -7,8 +7,9 @@
 PYTHON_STACK_DATA_VERSION = 0.6.2
 PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
 PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
-PYTHON_STACK_DATA_SETUP_TYPE = setuptools
+PYTHON_STACK_DATA_SETUP_TYPE = pep517
 PYTHON_STACK_DATA_LICENSE = MIT
 PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
+PYTHON_STACK_DATA_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
