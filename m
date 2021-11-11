Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5736EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:33:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0025761268
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0025761268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB67740201;
	Thu, 11 Nov 2021 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTktbN4AX5CS; Thu, 11 Nov 2021 10:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1714021C;
	Thu, 11 Nov 2021 10:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E55FF1BF9D1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DAE60782
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7N2bh0yWaoa5 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B34A605CD
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E55098B84F; Thu, 11 Nov 2021 10:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 11:31:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ac3f0a4ac7e51980397e79a6fc6da404951159
X-Git-Newrev: f69f27f06c6299f78993427518439a9aaa9982dc
X-Patchwork-Hint: ignore
Message-Id: <20211111102930.E55098B84F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.14.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f69f27f06c6299f78993427518439a9aaa9982dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
