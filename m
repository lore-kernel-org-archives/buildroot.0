Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D05C44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EAC40A4D;
	Fri, 17 Jul 2026 15:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev5_dp554YCf; Fri, 17 Jul 2026 15:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E7E240A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303075;
	bh=cjeYt+27AdEm7S6B/6fUf8H07K96NuGjP85fqdGC5mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pHNHpZzdr7WZEjxa0dHNl6iyBNVa6eR4APxs+zNxqlBiaf/Rsu9IWTHveg6b6U93N
	 kdOZ62sJVPesutiBkzRociQsXwDxdfE7sYw0YflzV+OiTHz0S6aq4K6EUOlfB7SEv6
	 3XaSSBWIsLLqAMQ+FxjBKNisWpRpgU34dIgps9OTAdjTo6a4EOWMkFT6If/VRC+0Vt
	 WxDG5byvb2at26Z1xfwDWerl2qbC9hH2zkvnyC43Y1P2xID505QpdfdOtbg7O9qBK6
	 UmTln3Hg04CXkiR2lUf/ZjDbZX/12JwYgX8BlWxoVp1Sb7JKOkeCoppfNxahRFqKCV
	 h9jSGl35hOOvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7E240A79;
	Fri, 17 Jul 2026 15:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DFFFA58
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C67740626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taTITWiF_B9o for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F525409DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F525409DA
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C74F88E52; Fri, 17 Jul 2026 15:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:15:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0703fc5606f96e5bd210f7c260ea7b61ea812c56
X-Git-Newrev: c8f60dff7af44157b460b1873e98de567ebd0d7c
X-Patchwork-Hint: ignore
Message-Id: <20260717154344.0C74F88E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cifs-utils:
 remove NO_WERROR hook
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8f60dff7af44157b460b1873e98de567ebd0d7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 6fe70fb484c35620877384bafdd1cd3865e1e583)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
