Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A103CC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A11340370;
	Fri,  1 Dec 2023 20:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A11340370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpdLSM5SnOJJ; Fri,  1 Dec 2023 20:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 483D8404A0;
	Fri,  1 Dec 2023 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483D8404A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF2F1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1957A60709
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1957A60709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVBL5OuzqbBw for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D403605B0
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D403605B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23D728772B; Fri,  1 Dec 2023 20:12:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:06:51 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0ffbc8e28837ab094c744ecf3ea15b8922f34229
X-Git-Newrev: 49e32695beaa86fc5abe56d30e0c03ac088521dc
X-Patchwork-Hint: ignore
Message-Id: <20231201201235.23D728772B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/xtables-addons:
 drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=49e32695beaa86fc5abe56d30e0c03ac088521dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

--with-xtables is an unrecognized option since the addition of the
package in commit 490917387a0ff6969f8130be38993eed5f06f73e:
https://github.com/nawawi/xtables-addons/blob/a576f4d43e80f9f91705c9e6a86f2d58c283df14/configure.ac

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --with-xtables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e81dc9df53c406d0f65f5cb5e0fd6c5b0de32fd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index e794538956..adfedbc874 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -13,7 +13,6 @@ XTABLES_ADDONS_LICENSE_FILES = LICENSE
 
 XTABLES_ADDONS_CONF_OPTS = \
 	--with-kbuild="$(LINUX_DIR)" \
-	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
 define XTABLES_ADDONS_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
