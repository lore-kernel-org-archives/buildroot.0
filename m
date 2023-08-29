Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA45C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 08:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 518DC40C51;
	Tue, 29 Aug 2023 08:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518DC40C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMrdDq65tw2F; Tue, 29 Aug 2023 08:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 956C440CA5;
	Tue, 29 Aug 2023 08:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 956C440CA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2827F1BF29D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 08:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0132F40C39
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 08:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0132F40C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syCiSDk791Ys for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 08:56:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33C53405AA
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 08:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C53405AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22C97860E9; Tue, 29 Aug 2023 08:56:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 10:51:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 421edb89b4565496d12758b0104ac9e2b686fd17
X-Git-Newrev: 4d98c3fdd5f0db1cd6477bbc867f5cc5d0a8f9c4
X-Patchwork-Hint: ignore
Message-Id: <20230829085639.22C97860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dmidecode:
 security bump to version 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d98c3fdd5f0db1cd6477bbc867f5cc5d0a8f9c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes CVE-2023-30630: Dmidecode before 3.5 allows -dump-bin to overwrite a
local file: https://nvd.nist.gov/vuln/detail/CVE-2023-30630

For change log, see:
https://git.savannah.gnu.org/cgit/dmidecode.git/tree/NEWS?h=dmidecode-3-5

Note: this patch also adds a comment about pgp signature verification in
the hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c97f27283b36ffc39dfb6223caee6055997b3234)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmidecode/dmidecode.hash | 5 +++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index ec5484e667..654c4cc537 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha256  43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212  dmidecode-3.4.tar.xz
+# Locally computed after checking pgp signature from:
+# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.5.tar.xz.sig
+sha256  79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073  dmidecode-3.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 352cdb106c..353978daa9 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.4
+DMIDECODE_VERSION = 3.5
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
