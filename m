Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E9C7114A
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66FC840990;
	Thu, 12 Jun 2025 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsaIfY4EoJ4h; Thu, 12 Jun 2025 20:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9212D40A19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9212D40A19;
	Thu, 12 Jun 2025 20:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79520183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1251183C16
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PrpcZaT8gBN for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD0E83BE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD0E83BE9
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E17683563; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac9e479c0723e4a658ad56cbeb95e764e48d779b
X-Git-Newrev: dd9c9b40582086fecda80a585a007b40dcde21a8
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.5E17683563@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kmsxx: fix meson
 build directory for extra tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd9c9b40582086fecda80a585a007b40dcde21a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build directory")
changed the build directory for meson packages to 'buildroot-build'.
Thus accessing the build directory for installing the extra utils needs
to be adopted to this directory. Otherwise the install will fail when
BR2_PACKAGE_KMSXX_INSTALL_TESTS is enabled.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 55979f081df2d70fe5fecdeddf1dcd666f5f049a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kmsxx/kmsxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 8ebdffaad1..f65cc668d4 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -30,7 +30,7 @@ KMSXX_EXTRA_UTILS += kmstouch
 endif
 define KMSXX_INSTALL_EXTRA_UTILS
 	$(foreach t,$(KMSXX_EXTRA_UTILS),\
-		$(INSTALL) -D -m 0755 $(@D)/build/utils/$(t) \
+		$(INSTALL) -D -m 0755 $(@D)/buildroot-build/utils/$(t) \
 			$(TARGET_DIR)/usr/bin/$(t)
 	)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
