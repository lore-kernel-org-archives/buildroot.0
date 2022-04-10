Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AE1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0875B416A9;
	Sun, 10 Apr 2022 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spanv1XHeMb9; Sun, 10 Apr 2022 21:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FF4415B7;
	Sun, 10 Apr 2022 21:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB101BF990
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 282FF41511
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0J0RKEgpXtl6 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A945414D1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E451D83931; Sun, 10 Apr 2022 20:55:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:02:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1e0fb274cde401417fbade86add3651da1eab1c8
X-Git-Newrev: 892d6562d6ac6d53d29b7719d5bfc2f1687ffa8d
X-Patchwork-Hint: ignore
Message-Id: <20220410205517.E451D83931@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nbd: needs
 host-bison
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

commit: https://git.buildroot.net/buildroot/commit/?id=892d6562d6ac6d53d29b7719d5bfc2f1687ffa8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

host-bison is mandatory to avoid the following build failure since bump
to version 3.24 in commit bf2e459bb9fc9fe57147313cda35f7022172e6e8 and
https://github.com/NetworkBlockDevice/nbd/commit/cd099ee7d0602104506bdd5063c0a3db2ec9b550:

configure: error: bison is required

Fixes:
 - http://autobuild.buildroot.org/results/05872813c9e9b9f39f960fa9a33ad82dc124c808

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a8290f99a7a2f75a8668d4e4f6c42f59862396a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index f0fb23910e..50f698dd24 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -8,7 +8,7 @@ NBD_VERSION = 3.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-NBD_DEPENDENCIES = host-pkgconf libglib2
+NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 NBD_CPE_ID_VENDOR = network_block_device_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
