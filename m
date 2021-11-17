Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1A8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803A8613D3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 803A8613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5511F60A8A;
	Wed, 17 Nov 2021 21:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jz79fHOpFmYm; Wed, 17 Nov 2021 21:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A617160A83;
	Wed, 17 Nov 2021 21:48:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D04251BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD0B38247F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X93R_7VqzB4U for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0B4D80D22
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E45658D5BC; Wed, 17 Nov 2021 21:44:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:21:07 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 51094c698b1e87088dd46b707e0dcef301a3d72f
X-Git-Newrev: ef978418465be783590aaca61056eab95559eea1
X-Patchwork-Hint: ignore
Message-Id: <20211117214411.E45658D5BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/samba4: security
 bump version to 4.14.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef978418465be783590aaca61056eab95559eea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Release notes:
https://www.samba.org/samba/history/samba-4.14.10.html

This is a security release in order to address the following defects:

o CVE-2016-2124:  SMB1 client connections can be downgraded to plaintext
                  authentication.
                  https://www.samba.org/samba/security/CVE-2016-2124.html

o CVE-2020-25717: A user on the domain can become root on domain members.
                  https://www.samba.org/samba/security/CVE-2020-25717.html
                  (PLEASE READ! There are important behaviour changes described)

o CVE-2020-25718: Samba AD DC did not correctly sandbox Kerberos tickets issued
                  by an RODC.
                  https://www.samba.org/samba/security/CVE-2020-25718.html

o CVE-2020-25719: Samba AD DC did not always rely on the SID and PAC in Kerberos
                  tickets.
                  https://www.samba.org/samba/security/CVE-2020-25719.html

o CVE-2020-25721: Kerberos acceptors need easy access to stable AD identifiers
                  (eg objectSid).
                  https://www.samba.org/samba/security/CVE-2020-25721.html

o CVE-2020-25722: Samba AD DC did not do suffienct access and conformance
                  checking of data stored.
                  https://www.samba.org/samba/security/CVE-2020-25722.html

o CVE-2021-3738:  Use after free in Samba AD DC RPC server.
                  https://www.samba.org/samba/security/CVE-2021-3738.html

o CVE-2021-23192: Subsequent DCE/RPC fragment injection vulnerability.
                  https://www.samba.org/samba/security/CVE-2021-23192.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f69f27f06c6299f78993427518439a9aaa9982dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a571ba79f4..033d932732 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.9.tar.asc
-sha256  7fb11818ef7f9bb817a3b21019358b1469aec98799057cc9e55933563361c409  samba-4.14.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.10.tar.asc
+sha256  107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af  samba-4.14.10.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 83eb2dacda..eb1f3b830e 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.9
+SAMBA4_VERSION = 4.14.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
