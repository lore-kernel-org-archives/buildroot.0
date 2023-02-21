Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70990C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26BB540B78;
	Tue, 21 Feb 2023 20:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26BB540B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdjZh9Px0tgK; Tue, 21 Feb 2023 20:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 456954102A;
	Tue, 21 Feb 2023 20:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 456954102A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC361BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 311CF81407
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311CF81407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3IakGNJYC2l for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DAA081404
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAA081404
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E9938666E; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:44:09 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3820c4b934ddc90c7f34c923254f0b2c9fad2c4f
X-Git-Newrev: 11374681baa1b7eedc30c5bd04ad3b10c3488155
X-Patchwork-Hint: ignore
Message-Id: <20230221204903.5E9938666E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tmux: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=11374681baa1b7eedc30c5bd04ad3b10c3488155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
