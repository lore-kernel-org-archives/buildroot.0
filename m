Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AAAC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B370440969;
	Tue, 14 Jul 2026 11:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05auNSOoZ7_u; Tue, 14 Jul 2026 11:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF0F04095E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784027270;
	bh=5sm+Vi3SGKcqMSB4C14UGY7ppfCHJrIQFVs9IDuenAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UzFlzp7lwVVF2gQkO+nx6q+SRMV478e02J4snVTHtbPGcc167Uj+cjZxKv2dtkqQU
	 xGZWgifqsUVbkRmKBHL8ygje+EDl+6n8LlxXIYHL11weNksuo54POBfIt9BlN41424
	 Yq/HxiJ74BZYmJQEZ+bMqZvV/dnBC7tof+9iW9AEy/uON8VuGUDF1A2tPk4fRulDaK
	 RgaVjLhdQK/1fzpeJiBS7Jm9C6QNA0y+dpvEI5ShLTdhCtyDNusA5ivaTqm9DtDYGd
	 4K3BL7gHZ1+NemVk4JXSZGP0l3VO55rYdWDLqLe+BvNWFRUs1/xoyeFFl3PIS2R4nf
	 a3SkTPAeEs8vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0F04095E;
	Tue, 14 Jul 2026 11:07:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E443128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8015D811C2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdPZYND0nkiO for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE7181198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE7181198
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B05488898; Tue, 14 Jul 2026 11:07:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 13:00:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38a341d79a8813c228aa37652d97fa9bc06a5730
X-Git-Newrev: 6fe70fb484c35620877384bafdd1cd3865e1e583
X-Patchwork-Hint: ignore
Message-Id: <20260714110713.0B05488898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cifs-utils: remove NO_WERROR hook
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fe70fb484c35620877384bafdd1cd3865e1e583
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 18bd541dd02b153427fb4f010a6426c8e91bef1b added the hook
to remove -Werror after upstream added it to CFLAGS in version 5.4:
https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=dc0dd017a856185422d2f3691062737a9e93ecae

Upstream however removed -Werror again in version 5.6
https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=74edf24d9780900f3ce15d2403c6e331b031d454
This version was bumped in buildroot with commit
839546dd3aaff56f26536ea7373978e32563c473 but the NO_WERROR hook was not
removed until now.

The tarball of version 7.6 does not include Makefile.in anymore which
broke the build of the package. As this hook is not needed anymore it is
removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cifs-utils/cifs-utils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9e1e822c4c..58ac594b20 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -25,12 +25,6 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 CIFS_UTILS_DEPENDENCIES += keyutils
 endif
 
-define CIFS_UTILS_NO_WERROR
-	$(SED) 's/-Werror//' $(@D)/Makefile.in
-endef
-
-CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
-
 ifeq ($(BR2_PACKAGE_CIFS_UTILS_SMBTOOLS),)
 define CIFS_UTILS_REMOVE_SMBTOOLS
 	rm -f $(TARGET_DIR)/usr/bin/smbinfo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
