Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9425AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BB6610CC
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19BB6610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB1481A34;
	Fri, 20 Aug 2021 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6th2u2dHAx3; Fri, 20 Aug 2021 21:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFE481A95;
	Fri, 20 Aug 2021 21:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9861BF35A
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2950740723
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTZ3ydTZ4374 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9332C40716
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ED3248D4A7; Fri, 20 Aug 2021 21:01:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:00:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbe3af5532bfc2ecceca5ea2a4604a82021a8748
X-Git-Newrev: 44004843f466a709cd511432a604e14097712f38
X-Patchwork-Hint: ignore
Message-Id: <20210820210140.ED3248D4A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: install polkit.loc to
 HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=44004843f466a709cd511432a604e14097712f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix added by commit c20d31baf471daeeec50d62cb8baa79bac06fa51 is
incomplete as polkit.loc must also be added to
$(HOST_DIR)/share/gettext/its

Additionally, the destination path for "$(INSTALL) -D" must be a
fully-qualified filename, not just the destination directory.

Fixes:
 - http://autobuild.buildroot.org/results/170e4802b7b4e8e7dafa95ade549e8fd05e43bfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: dest must be a filename, not a directory]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/polkit/polkit.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 23adb534d0..3a8c442dbb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -41,11 +41,13 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
-# polkit.its is needed for gvfs and must be installed in $(HOST_DIR)
+# polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
 # and not $(STAGING_DIR)
 define POLKIT_INSTALL_ITS
 	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
-		$(HOST_DIR)/share/gettext/its
+		$(HOST_DIR)/share/gettext/its/polkit.its
+	$(INSTALL) -D -m 644 $(@D)/data/polkit.loc \
+		$(HOST_DIR)/share/gettext/its/polkit.loc
 endef
 POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
