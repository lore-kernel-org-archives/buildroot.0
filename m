Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC14C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9735740935;
	Mon, 20 Feb 2023 21:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9735740935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yxve-so3wnDs; Mon, 20 Feb 2023 21:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242A041735;
	Mon, 20 Feb 2023 21:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242A041735
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9B41BF956
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C071A414F1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C071A414F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DpXMM4noFUIe for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F8641162
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F8641162
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E59486494; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:13:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f0e82c4ef8bc02bf8b2ada7bf5daf940d4e4cac
X-Git-Newrev: 6facb6fa1022a6bc5aa6fbdbaf20b1a57f420259
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.9E59486494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ntfs-3g: security bump
 to version 2022.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=6facb6fa1022a6bc5aa6fbdbaf20b1a57f420259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2022-40284: A buffer overflow was discovered in NTFS-3G before
2022.10.3. Crafted metadata in an NTFS image can cause code execution. A
local attacker can exploit this if the ntfs-3g binary is setuid root. A
physically proximate attacker can exploit this if NTFS-3G software is
configured to execute upon attachment of an external storage device.

https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-v4w8-jv3w-7prm
https://github.com/tuxera/ntfs-3g/releases/tag/2022.10.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntfs-3g/ntfs-3g.hash | 2 +-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 89bce73559..3fcba6af4d 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93  ntfs-3g_ntfsprogs-2022.5.17.tgz
+sha256  f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c  ntfs-3g_ntfsprogs-2022.10.3.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 64800c5eeb..62c515d50f 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2022.5.17
+NTFS_3G_VERSION = 2022.10.3
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
