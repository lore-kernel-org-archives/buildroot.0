Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9B4C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 07:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53509408E0;
	Fri,  3 May 2024 07:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I8n9EDJ2AdA; Fri,  3 May 2024 07:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0588141558
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0588141558;
	Fri,  3 May 2024 07:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 146371BF2AF
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01105401CE
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1E9ESuP5pyaT for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 07:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B58D40133
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B58D40133
 for <buildroot@buildroot.org>; Fri,  3 May 2024 07:13:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3746E86526; Fri,  3 May 2024 07:13:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 May 2024 09:11:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 04b72604bc0c96b2a78fe90b46c165d1808ab460
X-Git-Newrev: 98a1ed7ae3557ac2522f48c23b21a65708630720
X-Patchwork-Hint: ignore
Message-Id: <20240503071321.3746E86526@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/oprofile: drop
 unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=98a1ed7ae3557ac2522f48c23b21a65708630720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

--enable-gui is unrecognized since bump to version 1.0.0 in commit
7f7dc71cc8545dacf23f9a25f33c184d15bed65c and
https://github.com/wcohen/oprofile/commit/0c142c3a096d3e9ec42cc9b0ddad994fea60d135:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-gui

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit caf3f7fb5dc289c0c25254af78dc655687ad4bec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/oprofile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 265d6ebd18..512fbf9ea1 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -11,7 +11,6 @@ OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CPE_ID_VENDOR = maynard_johnson
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
-	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
 
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
