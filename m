Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B38E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB6740711;
	Fri, 13 Dec 2024 22:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOSK-2Srpuhb; Fri, 13 Dec 2024 22:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F7340630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F7340630;
	Fri, 13 Dec 2024 22:18:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E856ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADBD40630
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsRrCl0subiO for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD8D405DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FD8D405DC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 746B186F7C; Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b87f8cb21e58ae007d370c899f1f5c41a29ff97
X-Git-Newrev: 2dc0482b0770ebe2353e3827b85c6980e3912bdb
X-Patchwork-Hint: ignore
Message-Id: <20241213221820.746B186F7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-semver: enable host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dc0482b0770ebe2353e3827b85c6980e3912bdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant is required to build the python-changelog-chug
package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-semver/python-semver.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 29d7ba46b1..65faa8a851 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -11,5 +11,7 @@ PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
 PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
