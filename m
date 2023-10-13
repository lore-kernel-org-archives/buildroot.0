Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD3CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEC0408DC;
	Fri, 13 Oct 2023 18:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEC0408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8vL7k7kIzs2; Fri, 13 Oct 2023 18:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2795241850;
	Fri, 13 Oct 2023 18:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2795241850
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61CC41BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B25D981E5B
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25D981E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HemPcJ6Mqs5 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA28481B8A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA28481B8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCCE984FC8; Fri, 13 Oct 2023 18:46:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:42:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2ee81d616b7b74841e2cac6f7ea2aee4cff51321
X-Git-Newrev: 056e5618b30953ca18a9a5734c9c361e28b8890d
X-Patchwork-Hint: ignore
Message-Id: <20231013184632.BCCE984FC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/exim: security
 bump version to 4.96.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=056e5618b30953ca18a9a5734c9c361e28b8890d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes CVE-2023-42114, CVE-2023-42115, CVE-2023-42116:
https://exim.org/static/doc/security/CVE-2023-zdi.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 657d10b34b1ba2fc3478a3cfad7ac7fcf4ce1094)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 2336aaa5c6..6cdeea0614 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  299a56927b2eb3477daafd3c5bda02bc67e5c4e5898a7aeaf2740875278cf1a3  exim-4.96.tar.xz
+sha256  93ac0755c317e1fdbbea8ccb70a868876bdf3148692891c72ad0fe816767033d  exim-4.96.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  6b863661465a0b9897c1b71875c5196a1903cf560dd85de45b08242b9731edb2bc10eb56945d62e477e5d15cc7a8d493915bff2ca81689673a8091c66f62c89e  exim-4.96.tar.xz
+sha512  ef1a0e57c59cdf4e915b3ac5dcdbc69f565b14dd92b0527f6796b2c46a9ec34f991f9790fb4171c99417f7e482cdd62d77e780cc71fab227c8bed876103f7fdd  exim-4.96.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b84a51d6de..f5695d048d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.96
+EXIM_VERSION = 4.96.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
