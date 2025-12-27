Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E3E92715
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9304048E;
	Sat, 27 Dec 2025 15:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCVwHrT-Siag; Sat, 27 Dec 2025 15:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A27640498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850819;
	bh=/HBZhZpYXqtXzvR9/aj88jQ1waOdUf/vxle1Yo4v+N4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VPwAdPJ0X+R97lkiQYA3TEqakdh6pSQC2JzxjZg2R7RhTquI26u2YExwzAzbcUzu7
	 hqIScZaAVGMqX9gFpnfR+A9vZqDKuv5oVr7/8SU/xKlBdrb/xv0mIkSHDFveYbGtVm
	 YjpaiBcopuDRdjTS8xK3dtW6/Wjnd3Ghps/doiGG+5wovTDKsVAxx7NMYl2JGE1Jym
	 mzgcPUM3JY9NLpwXd745179EU2fQ3K3VoxWGZ836YbDAR459GiHHFrR3nvbL+eGN3w
	 8SeNLFZW4ykEjnTA0EBXlBsjOL2u0fJkXjSz06gvWo8/wkB30IQOr+HK7GcKQus79V
	 osxFERdO82anw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A27640498;
	Sat, 27 Dec 2025 15:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A06D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC20440292
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64dOBWP9g1iD for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412FB4027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412FB4027F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32A2787794; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:53:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29e9566a001e7eb42e3bd2aefd54d7fc67a4cb21
X-Git-Newrev: 2774502344f35b587ea8f1a2f43ec2398c3ebdad
X-Patchwork-Hint: ignore
Message-Id: <20251227155330.32A2787794@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpupnp: bump version to 6.2.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2774502344f35b587ea8f1a2f43ec2398c3ebdad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
6.1.2.

This bump fixes a gerbera build error introduced to buildroot by the
gerbera bump to 2.6.1 with buildroot commit
f8bf78911576672443a8d11eaf99bed4d383acef.

Fixes:
https://autobuild.buildroot.net/results/b6b/b6bd96cb9dbcaff9351ef156edaec7d1b5290b9e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 15ee26c6d2..9e4f211ecc 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.2.tar.gz.sha256
-sha256  cb3968773d30e2bfc765547df514fdc8927b9a37ecccca2e260ee8b612e756bc  libnpupnp-4.2.2.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.2.3.tar.gz.sha256
+sha256  563d2a9e4afe603717343dc4667c0b89c6a017008ac6b52262da17a1e4f6bb96  libnpupnp-6.2.3.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index d7192ec3f1..38b631fe58 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.2.2
-LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBNPUPNP_VERSION = 6.2.3
+LIBNPUPNP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
 LIBNPUPNP_INSTALL_STAGING = YES
 LIBNPUPNP_DEPENDENCIES = expat libcurl libmicrohttpd
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
