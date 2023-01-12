Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A13DC54EBE
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6A360E4F;
	Thu, 12 Jan 2023 19:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6A360E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_R8qIzhYsAh; Thu, 12 Jan 2023 19:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E5B60D4D;
	Thu, 12 Jan 2023 19:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E5B60D4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 476611BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23BB1812EE
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23BB1812EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIyv_xt_xa-C for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B9781F9F
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B9781F9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DEC87AA3; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:30:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbc80c75570f535e991297602191c724ff33a04d
X-Git-Newrev: bb79d78554632e96df52f41333aa62f928b6817f
X-Patchwork-Hint: ignore
Message-Id: <20230112193230.06DEC87AA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb79d78554632e96df52f41333aa62f928b6817f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4aca99f51cc97cfc3bcd3affa65f4694004dd444 forgot to update hash of
COPYING file and add hash of README.md due to the following commit which
moved the introductory note about the GPL from the COPYING license text
file to the README:
https://github.com/wireshark/wireshark/commit/d2b6b89b94bd3e18520c472affae9cd4a03283e2

Fixes:
 - http://autobuild.buildroot.org/results/aaed32b55cc56beb32152ed61ac9b7f69d3ebef5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 3 ++-
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ae06ab09b7..e9026b8caa 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -3,4 +3,5 @@ sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
 sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
 
 # Locally calculated
-sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ee3d6b1905..e2a424ef0f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -8,7 +8,7 @@ WIRESHARK_VERSION = 4.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-WIRESHARK_LICENSE_FILES = COPYING
+WIRESHARK_LICENSE_FILES = COPYING README.md
 WIRESHARK_CPE_ID_VENDOR = wireshark
 WIRESHARK_SELINUX_MODULES = wireshark
 WIRESHARK_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
