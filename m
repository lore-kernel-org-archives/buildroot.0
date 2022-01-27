Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A67AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2335740360;
	Thu, 27 Jan 2022 18:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WtJjVtsAM2D; Thu, 27 Jan 2022 18:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41AC94019F;
	Thu, 27 Jan 2022 18:49:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C066C1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF1F560A75
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBenAQ1CFfOQ for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BC7B60810
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B4004829FC; Thu, 27 Jan 2022 18:42:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:49:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9a7f54083e9b4c2461abcf06cfb0387a7ce51dd
X-Git-Newrev: 2e7e19a5b07e533716f3e1612c10a85fa2966d6e
X-Patchwork-Hint: ignore
Message-Id: <20220127184256.B4004829FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: fix install
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e7e19a5b07e533716f3e1612c10a85fa2966d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.3.3 in
commit 163509a8e0d558e6339c5489f072dfe805e0cc34:

>>> htpdate 1.3.3 Installing to target
PATH="/home/buildroot/autobuild/instance-0/output-1/host/bin:/home/buildroot/autobuild/instance-0/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3 DESTDIR=/home/buildroot/autobuild/instance-0/output-1/target install
make[1]: Entering directory '/home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3'
strip -s htpdate
strip: Unable to recognise the format of the input file `htpdate'

Fixes:
 - http://autobuild.buildroot.org/results/f1034de5ebc2fc2c49711820077d0b6e5e13aea5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/htpdate/htpdate.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 200c3207a2..54b3ec2569 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -19,7 +19,8 @@ define HTPDATE_BUILD_CMDS
 endef
 
 define HTPDATE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 define HTPDATE_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
