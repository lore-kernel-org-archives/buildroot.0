Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6551FCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 311C340BA1;
	Sun,  7 Apr 2024 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nixliTvGxkNw; Sun,  7 Apr 2024 19:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D03D40BA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D03D40BA8;
	Sun,  7 Apr 2024 19:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8F91BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 720D381E54
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zy9Sew0PE4bA for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE3E81E55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCE3E81E55
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA11C85C77; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:47:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 066c3e67d7f117f7810597e1ab36e2346fe8f7c2
X-Git-Newrev: caf3f7fb5dc289c0c25254af78dc655687ad4bec
X-Patchwork-Hint: ignore
Message-Id: <20240407194943.BA11C85C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oprofile: drop unrecognized option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=caf3f7fb5dc289c0c25254af78dc655687ad4bec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-gui is unrecognized since bump to version 1.0.0 in commit
7f7dc71cc8545dacf23f9a25f33c184d15bed65c and
https://github.com/wcohen/oprofile/commit/0c142c3a096d3e9ec42cc9b0ddad994fea60d135:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-gui

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
