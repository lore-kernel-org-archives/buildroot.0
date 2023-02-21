Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B2C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAB1840B00;
	Tue, 21 Feb 2023 20:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAB1840B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8UOGUibBV0Q; Tue, 21 Feb 2023 20:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CDC404E9;
	Tue, 21 Feb 2023 20:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CDC404E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E80401BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C25174184C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25174184C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7CbUB8_15id for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:47:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCFCF41849
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCFCF41849
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C88638662F; Tue, 21 Feb 2023 20:47:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:43:55 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: f5e565d9b2e9e2ec5098293b160ded29db2d03a0
X-Git-Newrev: 527e770697eec7cbc8c7b18bb44fd8e014c33f68
X-Patchwork-Hint: ignore
Message-Id: <20230221204754.C88638662F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tmux: add
 utf8proc optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=527e770697eec7cbc8c7b18bb44fd8e014c33f68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

utf8proc is an optional dependency since version 2.3 and
https://github.com/tmux/tmux/commit/6c94774b70f72952c4c512e4aa59a207ca1c34f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1f618aa388535181c281c85e2b5264532de4ef0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/tmux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 281b7d8ee6..b1c0af1a83 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -11,6 +11,13 @@ TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+ifeq ($(BR2_PACKAGE_UTF8PROC),y)
+TMUX_DEPENDENCIES += utf8proc
+TMUX_CONF_OPTS += --enable-utf8proc
+else
+TMUX_CONF_OPTS += --disable-utf8proc
+endif
+
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
