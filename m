Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A323C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35ED860E3F;
	Sat, 26 Nov 2022 18:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35ED860E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXwBT4ugLIIq; Sat, 26 Nov 2022 18:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82ED160E3C;
	Sat, 26 Nov 2022 18:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82ED160E3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C507A1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F55140992
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F55140992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3WgiR_Gv2-D for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909234097E
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 909234097E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F96F847AF; Sat, 26 Nov 2022 18:55:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:52:32 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 747d556910ec38c1f2c0364c42672a0d223b77e0
X-Git-Newrev: aa2600f603e084403aaa714fc97f83a69f6dccfc
X-Patchwork-Hint: ignore
Message-Id: <20221126185508.7F96F847AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] boot/edk2: refine license
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
Content-Type: multipart/mixed; boundary="===============6757737645198621904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6757737645198621904==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=aa2600f603e084403aaa714fc97f83a69f6dccfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The edk2 project is licensed under the BSD-2-Clause license with a patent
grant, as per commit 304bff7223a8 ("edk2: Change License.txt from 2-Clause
BSD to BSD+Patent").

There is a BSD-2-Clause-Patent SPDX license identifier[1] for this case,
therefore refine the edk2 package to use this more specific identifier.

[1]: https://spdx.org/licenses/BSD-2-Clause-Patent.html

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 40c05259d89545c40a2ead709be161569db54a05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 7d8765c310..953bea6fd3 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -7,7 +7,7 @@
 EDK2_VERSION = edk2-stable202102
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
-EDK2_LICENSE = BSD-2-Clause
+EDK2_LICENSE = BSD-2-Clause-Patent
 EDK2_LICENSE_FILES = License.txt
 EDK2_CPE_ID_VENDOR = tianocore
 EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux

--===============6757737645198621904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6757737645198621904==--
