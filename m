Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBDFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B974A60F9D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B974A60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A8084027;
	Wed,  6 Oct 2021 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTSoi-51CxKl; Wed,  6 Oct 2021 15:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85E183FB7;
	Wed,  6 Oct 2021 15:38:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE0721BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB195405BA
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDPvfvvSqkSi for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:38:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C3240590
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:38:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF1B092783; Wed,  6 Oct 2021 15:35:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:36:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c68ddb4f0a9c025648db5e386ebddae0a729d225
X-Git-Newrev: 2907c1028c2de2341fda486dae4ede34b7f0ddad
X-Patchwork-Hint: ignore
Message-Id: <20211006153551.BF1B092783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/wget: bump to
 version 1.21.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2907c1028c2de2341fda486dae4ede34b7f0ddad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

https://lists.gnu.org/archive/html/bug-wget/2021-09/msg00005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 16ca6f2f56e88abb9dbdee29e8d32ffdc5e78de9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 11071566aa..7f89bedb88 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
+sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index ae036478b8..f30fa39917 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.1
+WGET_VERSION = 1.21.2
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
