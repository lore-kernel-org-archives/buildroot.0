Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2157EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833E741E89;
	Fri, 13 Feb 2026 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odF1Cl9KUw8k; Fri, 13 Feb 2026 19:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756FF41EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011400;
	bh=6oJTlE4kGgmXNZMf+d/18DYi5n2exLAoYAbsjSW0ktU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gRClPaoldF5HHSErivRpGYRjfuhfRHHbIdnzXNnqMFGlX5jOjiKtfnThGheBhhLHF
	 NeIuGuhE100KzVfmr/bA00hd27ythLR5jVS+sEYKsbNB9MHCNGEMZrIXdm1sc5Qc9x
	 mW8pqsCUziwphIAo1jVJr9kD4QOrioQb+Rx173Dw1pYjSu/MH3P5YOZarKpq/+sVeB
	 lJ/YqZYwCmgHfoTod5JZzKOJkGvhZRrCNjQJWRo01fhvrkrDbf1wTI2PwhbB26gXOA
	 O3bL4LlY2n7L61R66lpfErfqTodnddaSgaCrg3vUpoeLsoh/r0aNJo//sz6DaLI2Al
	 oYO9j4WRG0uJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756FF41EF5;
	Fri, 13 Feb 2026 19:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AE9283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86A184550
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0HCMl7CUSI8 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EF7844E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EF7844E5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB66582A3B; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81d1880f0456383610bbe73406ef7e4769740d82
X-Git-Newrev: 9a9e6df3f402bd86abda6cc67e085357bfbac870
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.BB66582A3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mupdf: skip
 installing docs to the target
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
Content-Type: multipart/mixed; boundary="===============8090150164672887682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8090150164672887682==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a9e6df3f402bd86abda6cc67e085357bfbac870
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The current 'install' target comprises 'install-libs', 'install-apps'
and 'install-docs'.

In our case we don't want to install documentation to the target, so
just run the other two.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit ba48197d1fe5d6a67c3138377851c43482b5698c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 6b666033eb..6fdbf59f05 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -68,7 +68,7 @@ endef
 
 define MUPDF_INSTALL_TARGET_CMDS
 	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) \
-		DESTDIR="$(TARGET_DIR)" install
+		DESTDIR="$(TARGET_DIR)" install-libs install-apps
 endef
 
 $(eval $(generic-package))

--===============8090150164672887682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8090150164672887682==--
