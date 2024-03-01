Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77105C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23E0B400C7;
	Fri,  1 Mar 2024 18:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abuK1h_apEYC; Fri,  1 Mar 2024 18:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D2F4151D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37D2F4151D;
	Fri,  1 Mar 2024 18:24:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39DE51BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB3E41C9A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQU5l47mp85j for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB5E41C88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB5E41C88
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:24:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DDE887F2A; Fri,  1 Mar 2024 18:24:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:19:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd3f953c7883b2a5d30cff03c92e34a2b2718953
X-Git-Newrev: def3b9d9a8f17398f280950b35eae0cf22d67bd8
X-Patchwork-Hint: ignore
Message-Id: <20240301182406.7DDE887F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: use correct license
 format for dual licensed package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=def3b9d9a8f17398f280950b35eae0cf22d67bd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1f4bcaf341..5032414d63 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,7 +9,7 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
-FREETYPE_LICENSE = Dual FTL/GPL-2.0+
+FREETYPE_LICENSE = FTL or GPL-2.0+
 FREETYPE_LICENSE_FILES = LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
