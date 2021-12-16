Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9505BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C071417FB;
	Thu, 16 Dec 2021 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iC-63FH5u9C; Thu, 16 Dec 2021 20:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A20402F6;
	Thu, 16 Dec 2021 20:17:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12DF61C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D9F4032D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5HFki89d71R for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF9C408AF
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 68CDA8228B; Thu, 16 Dec 2021 20:11:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:06:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60d416fb6cace17627eb2f1009c9ffe6f0f033ad
X-Git-Newrev: 59a1fcc69620da8eab1c048977fa22d297b18284
X-Patchwork-Hint: ignore
Message-Id: <20211216201118.68CDA8228B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lapack: security bump to version
 3.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=59a1fcc69620da8eab1c048977fa22d297b18284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
  DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
  as also used in OpenBLAS before version 0.3.18. Specially crafted
  inputs passed to these functions could cause an application using
  lapack to crash or possibly disclose portions of its memory.
- Update license hash, year changed:
  https://github.com/Reference-LAPACK/lapack/commit/f67034373ee2972b4ea5de5a3d635b30ad3026c2
- Update indentation in hash file (two spaces)

http://netlib.org/lapack/lapack-3.10.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lapack/lapack.hash | 4 ++--
 package/lapack/lapack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index bac7210c29..6f6dbff1a6 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573  lapack-3.9.0.tar.gz
-sha256 d56bd4441b999b80c88df04faf0d8b3d7d3b2bd781cf91242c4188e8a6d0f8be  LICENSE
+sha256  328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19  lapack-3.10.0.tar.gz
+sha256  66246b7d3e6736aea46e63fd5e087659474d07edfe2f9b051d085d9b42aaac61  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 41774f6167..f34f685ae2 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.9.0
+LAPACK_VERSION = 3.10.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
