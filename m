Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78455C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3384032E;
	Fri, 18 Mar 2022 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDanRZ-qalCf; Fri, 18 Mar 2022 21:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D6140122;
	Fri, 18 Mar 2022 21:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEB881BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D0940131
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opi1gKyUcM-N for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:27:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B0D4012E
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2C1E9844B1; Fri, 18 Mar 2022 21:19:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 22:26:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05507efd1a791948a23036eb28eb7be0f4d1f4ef
X-Git-Newrev: b0fc0a811ba198288a3aef8413466d9a61d1dfd4
X-Patchwork-Hint: ignore
Message-Id: <20220318211911.2C1E9844B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: use explicit
 --with/without-libuuid option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0fc0a811ba198288a3aef8413466d9a61d1dfd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This has been like tht for ages (probably an implicit dependency check
in older versions), but now wget has explicit flags, so let's use them.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: expand commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wget/wget.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index f30fa39917..58e04e3040 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -34,7 +34,10 @@ WGET_CONF_OPTS += --without-libidn
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+WGET_CONF_OPTS += --with-libuuid
 WGET_DEPENDENCIES += util-linux
+else
+WGET_CONF_OPTS += --without-libuuid
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
