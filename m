Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB6EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AAB182CFA;
	Thu,  7 Sep 2023 15:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AAB182CFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bozYNg0CGSau; Thu,  7 Sep 2023 15:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE6882CC7;
	Thu,  7 Sep 2023 15:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE6882CC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12E9A1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9D641E24
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C9D641E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgitScgYclSr for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33EF241D8D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33EF241D8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30D22869E0; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 21:54:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4d7761fc0107e286eb080084e5a149378809448
X-Git-Newrev: a20f8a87aaf5d8d16755fd645263d4d286ef52de
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.30D22869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: add host python
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a20f8a87aaf5d8d16755fd645263d4d286ef52de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 5511bd12b3..9591439b01 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -11,5 +11,7 @@ PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
