Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D33C5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263D980EA1;
	Sat, 15 Aug 2026 15:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1rZ4dBcZV4U; Sat, 15 Aug 2026 15:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A610180E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786806582;
	bh=A8JEfBKeU412QcTFCE55E9mQkubQfeqSVJ3+NDm/A28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqGoOKo/SwTMyuGB5ocL9wtbUyVM/xSbxZHFcXEL0pqK0sntq5e9YWiUkpXy9VIaJ
	 ZKQjx8Au8PCFrTWkfe6QxgjaqSYMKcu3r/d65h5tcqwerbHaxGrXP5pOHXzU2AJ9Td
	 2I8CLiNIGsRQy5sai5ieKZsbrbCaf/fznZU67R70JX1kdA47c8PDWGJ0mb5W3u+rJK
	 c+wo0sWI3hmo/9ajAK4l9U+q6PqA0v6VG9wG72UM5SvmVJC2jtaMOFEL1wfPX/Ukmb
	 PYbz8DvGoOnHaf0KrvctelDFzTIEuToMxVsC22nflslZ9PJzpgbVzyYHdJMz899yuX
	 MVfdcVtQce8xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A610180E8F;
	Sat, 15 Aug 2026 15:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 896C923F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B32F4082B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhhYwhr11vQV for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6287840838
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6287840838
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C25568D6DE; Sat, 15 Aug 2026 15:08:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:07:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b3d526226662af8b16525aecec7da5ff0e5fa1d
X-Git-Newrev: 4f867f10392bcb651a42ec2ccf68efddfccf8c43
X-Patchwork-Hint: ignore
Message-Id: <20260815150849.C25568D6DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: drop ARC-specific
 host-flex/host-bison dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f867f10392bcb651a42ec2ccf68efddfccf8c43
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-flex/host-bison are needed when building GCC from Git or from a
snapshot, not from release tarballs. The condition for the dependency
was actually incorrect: it was needed for the ARC-specific gcc
version (BR2_GCC_VERSION_ARC) but not for the ARC architecture in
general: building upstream GCC release tarballs for ARC does not
require host-flex/host-bison.

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/gcc.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9109777bd7..04ba70c52c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -198,10 +198,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
-endif
-
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 # powerpc seems to be needing it as well
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
