Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A06C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C8F80ACC;
	Wed, 22 Jul 2026 20:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC38oyPOfbdP; Wed, 22 Jul 2026 20:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9703080FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751861;
	bh=SHGIQAKS5yFl5il26/bSgqg/gBIiVXhM0OVQlQ3RdJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lc34pxEDQxbJ2CDCcNPE3A01InjxoDjGyCmxe0Xdscf17tLpJgzNiOm0RSwoyqsAi
	 BPrzQQZd6UcvoGsHKfKkf4lI2aDFxDh2Ida8dL+xvBxBxwuQuouviNqOuIZEQfjgMi
	 ywkIrKwCelt/N900cqGc+L4mUAUewaI5D2gwzPpDxRS0SovdywOKhbyXdiJpKsTmSQ
	 hDMyMZ9dH2DBxbA3PJVG4CrBOFALs1SkIIU0GyHY0XG0P6EVYlo/RXNsYuT6gX6M/z
	 k2k0eN1EYbLlBoHsxit8AgOmfD61gd3WphD1TG4E252T3BCrOC+k7T9YF+UBKv18qK
	 F2YhJNOz0EhrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9703080FD7;
	Wed, 22 Jul 2026 20:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC6D3B0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F1EF808D1
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmO2_gKsptSO for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D015580D89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D015580D89
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07BCB8A345; Wed, 22 Jul 2026 20:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f80126bfe8549b2e41a50a884af55fe9872be1f
X-Git-Newrev: 15e2433e1f3e3d631c47495d1413d4a4ba25d815
X-Patchwork-Hint: ignore
Message-Id: <20260722202337.07BCB8A345@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: fix license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15e2433e1f3e3d631c47495d1413d4a4ba25d815
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the source SPDX-License-Identifier headers, and the associated text
[1] matches the COPYING.0BSD file.

FSFUL and FSFULLR are the "few permissive licenses" of certain build
system files mentioned in COPYING.

Move "Public Domain" to the end of the list because it applies only to
a few files.

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 91eedd7a83..056c168057 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE = 0BSD, GPL-2.0+, GPL-3.0+, LGPL-2.1+, FSFUL, FSFULLR, Public Domain
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 # autoreconf needed to fix a musl static build failure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
