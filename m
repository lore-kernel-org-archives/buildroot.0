Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A77EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5291242205;
	Fri, 13 Feb 2026 19:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nif6pL3N3ITV; Fri, 13 Feb 2026 19:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2CB4220B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011577;
	bh=wrI+ud+kLjOiOmdZjDtrwaFTyF5lO3HWwd2jn8sjq8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I2lfxi3zT+dquVHgN+YZPkARU0ku7nkS7upioqlS+RMWuJPgQFtq97giT2wRaV9WP
	 r7NT65aimMWx5bhXsKazihWGiI2iYsg8SifGVaMn7bx/0TmpzoOQULv0f50hMWhFAC
	 9wd/2UB7MGYM8DdmybOI0YUhpsK/O2pFuqIHrEwwo0DdRrdtw2/ytZ7pUhHqoJWSeP
	 csl0K+nrjPt8MqfDEYModXLWmOtT003CmQiGIyJ9LO4i43Er1t2stkDohYzscSwcfJ
	 H3ho2/re/QGKDLIj+gPEWZo086MMFTW9bm/krMTXLwvzH8wTqWHBWpYRnjUlR5ts+o
	 d7+qJURMi8TLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2CB4220B;
	Fri, 13 Feb 2026 19:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D789F283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37DC8413D9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcOUZ4ydbWM7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 800AD412F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 800AD412F6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75C7683593; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:35 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 53f8d285f664396ec41d14182dc91cedc2f804f1
X-Git-Newrev: da48583a936869c03933fa6bb5028be4042ed30f
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.75C7683593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mupdf: skip
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
Content-Type: multipart/mixed; boundary="===============4507271381490828826=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4507271381490828826==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da48583a936869c03933fa6bb5028be4042ed30f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
index 57501ab954..fe4f3e6756 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -68,7 +68,7 @@ endef
 
 define MUPDF_INSTALL_TARGET_CMDS
 	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) \
-		DESTDIR="$(TARGET_DIR)" install
+		DESTDIR="$(TARGET_DIR)" install-libs install-apps
 endef
 
 $(eval $(generic-package))

--===============4507271381490828826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4507271381490828826==--
