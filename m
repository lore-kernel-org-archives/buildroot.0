Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06027C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F9760FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1F9760FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD046151A;
	Thu, 26 Aug 2021 22:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGlhKlSoh2Fi; Thu, 26 Aug 2021 22:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C108961500;
	Thu, 26 Aug 2021 22:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBBA1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B78407B5
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39KrxxSqCbhU for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B485407CA
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CDC968DC50; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:00:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dbe3af5532bfc2ecceca5ea2a4604a82021a8748
X-Git-Newrev: 44004843f466a709cd511432a604e14097712f38
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.CDC968DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: install
 polkit.loc to HOST_DIR
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
