Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90ECC4332F
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0579761A58
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0579761A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D2F61C1A;
	Fri, 19 Nov 2021 16:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvalVOE5-k46; Fri, 19 Nov 2021 16:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E611F606C8;
	Fri, 19 Nov 2021 16:03:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11BC1BF346
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C9941499
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEK_eAKhet62 for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:03:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B0FB41497
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:03:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DE36E8DBAF; Fri, 19 Nov 2021 15:59:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 17:03:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62ba22f312018eef1d46d04cd30680e3fbc2f099
X-Git-Newrev: 236385c50f58190f0dafb342d1d6c5115068683e
X-Patchwork-Hint: ignore
Message-Id: <20211119155931.DE36E8DBAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre: fix broken URL
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
Content-Type: multipart/mixed; boundary="===============0685620856086011641=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0685620856086011641==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=236385c50f58190f0dafb342d1d6c5115068683e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated on www.pcre.org:
"Note that the former ftp.pcre.org FTP site is no longer available."

Update _SITE URL to Sourceforge.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 264eaa10c7..c85f6717db 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE_VERSION = 8.45
-PCRE_SITE = https://ftp.pcre.org/pub/pcre
+PCRE_SITE = http://downloads.sourceforge.net/project/pcre/pcre/$(PCRE_VERSION)
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
 PCRE_LICENSE_FILES = LICENCE

--===============0685620856086011641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0685620856086011641==--
