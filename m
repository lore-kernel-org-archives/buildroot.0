Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABCCC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC873404B7;
	Sat, 26 Nov 2022 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC873404B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NFxDvJOa0nB; Sat, 26 Nov 2022 18:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED33240278;
	Sat, 26 Nov 2022 18:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED33240278
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 856611BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613DD40278
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613DD40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLjtlHp-Vhth for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 894C7400FD
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 894C7400FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75D4F847AE; Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:52:05 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 9a53d1dbc17378325da7fb2d48135027b5df785c
X-Git-Newrev: 747d556910ec38c1f2c0364c42672a0d223b77e0
X-Patchwork-Hint: ignore
Message-Id: <20221126185508.75D4F847AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/edk2-platforms:
 refine license
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
Content-Type: multipart/mixed; boundary="===============0717152951669411986=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0717152951669411986==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=747d556910ec38c1f2c0364c42672a0d223b77e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The edk2-platforms project is licensed under the BSD-2-Clause license with
a patent grant, as per commit ae604e4ffe8f ("edk2-platforms: Change
License.txt from 2-Clause BSD to BSD+Patent").

There is a BSD-2-Clause-Patent SPDX license identifier[1] for this case,
therefore refine the edk2-platforms package to use this more specific
identifier.

[1]: https://spdx.org/licenses/BSD-2-Clause-Patent.html

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9bd126698397eb3105340f48e4f033e09b34aaf7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edk2-platforms/edk2-platforms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 7de59c1afc..6b155bf013 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -7,7 +7,7 @@
 # Keep in sync with latest commit as of the release date for boot/edk2
 EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
-EDK2_PLATFORMS_LICENSE = BSD-2-Clause
+EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
 EDK2_PLATFORMS_INSTALL_TARGET = NO
 EDK2_PLATFORMS_INSTALL_STAGING = YES

--===============0717152951669411986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0717152951669411986==--
