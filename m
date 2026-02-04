Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FC3E9D41E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B564D606E8;
	Wed,  4 Feb 2026 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIU3z7iLvSdc; Wed,  4 Feb 2026 17:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9596079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770227192;
	bh=vJbFJZSf3f9r6kwkHbvAhK+DKKw4d729mz5Pz/6Dqwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ebjNmKknrE3MZIYb7BWNjLFUgzjmmj66KQntEHEBWCkN9kOs3H9GsEF/m+C8ShviO
	 IA4R9yqAcHSNKCmdQGHX1bkvI6oANv2gVJ/oU9lpmihvq3MvSfvI0DF3TCiBHXL+wq
	 9ajm/oAVhwM9MUtixG9K7wxVn2QcZNUmV5OHgAdR528sNq6qrCOdi6xuXBUEgamOoB
	 9imupQLvZ0DxqcO2EnvYVNIxPfxahKd6oWT9j4ebC+2QpCFc5Da7vkn3QhAchLtp/A
	 b0HvflijFJp76NGWZVoCMAsTkCgUQXrgfJwcuTzfsqRfAhSUxk4pqH907rEkSV1xrS
	 4+FDLuQ21MpVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9596079A;
	Wed,  4 Feb 2026 17:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99935173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787DC40086
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvODsD60ylqR for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A067840080
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A067840080
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A68C86994; Wed,  4 Feb 2026 17:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 18:40:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96e6d7092c25506e40061b5bc3a2cc2731953b99
X-Git-Newrev: ba48197d1fe5d6a67c3138377851c43482b5698c
X-Patchwork-Hint: ignore
Message-Id: <20260204174209.5A68C86994@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: skip installing docs to the
 target
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0782608327529586399=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0782608327529586399==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba48197d1fe5d6a67c3138377851c43482b5698c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The current 'install' target comprises 'install-libs', 'install-apps'
and 'install-docs'.

In our case we don't want to install documentation to the target, so
just run the other two.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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

--===============0782608327529586399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0782608327529586399==--
