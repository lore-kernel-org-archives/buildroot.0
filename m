Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9401DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C96418A1;
	Wed, 23 Nov 2022 21:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C96418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-gw1KDRm1LV; Wed, 23 Nov 2022 21:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001E841893;
	Wed, 23 Nov 2022 21:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001E841893
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDB661BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B994E81026
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B994E81026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qb2nspPidtqE for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:38:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD9780FA8
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD9780FA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAAB484355; Wed, 23 Nov 2022 21:38:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:38:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bd126698397eb3105340f48e4f033e09b34aaf7
X-Git-Newrev: 40c05259d89545c40a2ead709be161569db54a05
X-Patchwork-Hint: ignore
Message-Id: <20221123213849.CAAB484355@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: refine license
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
Content-Type: multipart/mixed; boundary="===============5925402942928577603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5925402942928577603==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=40c05259d89545c40a2ead709be161569db54a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The edk2 project is licensed under the BSD-2-Clause license with a patent
grant, as per commit 304bff7223a8 ("edk2: Change License.txt from 2-Clause
BSD to BSD+Patent").

There is a BSD-2-Clause-Patent SPDX license identifier[1] for this case,
therefore refine the edk2 package to use this more specific identifier.

[1]: https://spdx.org/licenses/BSD-2-Clause-Patent.html

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============5925402942928577603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5925402942928577603==--
