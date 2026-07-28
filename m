Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD3C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD47681276;
	Fri, 31 Jul 2026 11:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52bIolgc_WlB; Fri, 31 Jul 2026 11:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A23F58126C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499102;
	bh=iivtGd2zzdAMsQsOuKi2M7H6Iw7HTWuDjd6VMO6POMg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rvCYIf8+Au1H5J3EzrcgSbKT1N0Dh6FQl35zO9/Mq5NgzmxEWnBVQBvpZZXDJFzPd
	 uchqMO5emUtiMuBk60qH48G2M4Rxgz1IPKCpoY0Qf3vi5spaTaEkOPpduUZxfZJcO6
	 TSuEKkP+MJjPZABDF2Spz5eIZ44/W6sHQT9MX5d2fAww9XfsgKNcEbB7QurNR9wiSJ
	 MKyCNI0lBP6RkAsRC7iZSxhBUqOQUsYzLS+tixKQDMdjlgNvfPiYRKJJKRDyVSQ/EL
	 9zfftbV1DyjNYCzTNBVmrj4TBDyZtuUXU8sMle7luJVP4vucYJCAUhArnKPk3GI6JZ
	 fjL5ar4wangHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A23F58126C;
	Fri, 31 Jul 2026 11:58:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 353042CE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279D040F85
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAd8APTPQhdl for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C119240FA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C119240FA0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B20B58B741; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:44:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a45ecab2890a54560c0d9390f821a305d0b02359
X-Git-Newrev: dd8481e7672b343d8c01540ff5687d33e2c09df8
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.B20B58B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: use SPDX
 license identifier for bzip2 license
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd8481e7672b343d8c01540ff5687d33e2c09df8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

"bzip2-1.0.4" is not a valid SPDX license identifier. The license text
in archival/libarchive/bz/LICENSE in the busybox source matches the
text associated with the bzip2-1.0.6 identifier [1].

[1] https://spdx.org/licenses/bzip2-1.0.6.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9687af626abefc7d7d7c81157dbf8997fd31005)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a33548c355..6c0f945e01 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,7 +7,7 @@
 BUSYBOX_VERSION = 1.37.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
+BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.6
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
