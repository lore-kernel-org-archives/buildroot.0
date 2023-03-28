Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEBAC761A6
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B8441C79;
	Tue, 28 Mar 2023 19:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B8441C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23mvqdaYaMNz; Tue, 28 Mar 2023 19:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BC4C40439;
	Tue, 28 Mar 2023 19:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC4C40439
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA04D1BF2B5
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0CBB83F2F
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CBB83F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQhiLnbcvdA3 for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E88783F17
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E88783F17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F15AD835E8; Tue, 28 Mar 2023 19:36:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Mar 2023 21:36:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37e63bb2c98052939de9b4e6cb30002016055c05
X-Git-Newrev: 9a3d4e38183e7c7ade63588519796005f43efe78
X-Patchwork-Hint: ignore
Message-Id: <20230328193659.F15AD835E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: ditch redundant -f 'rm' flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a3d4e38183e7c7ade63588519796005f43efe78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The value of the RM variable in make is 'rm -f' [0], thus the additional
-f is redundant. Avoid it on the docs to avoid developers taking it as a
good example to follow.

[0] https://www.gnu.org/software/make/manual/make.html#index-RM

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/writing-rules.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 758965d80a..13b7fd5bea 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -78,7 +78,7 @@ Do not align the +=+ signs.
 +
 ---------------------
 define LIBFOO_REMOVE_DOC
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/doc \
 		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
 ---------------------
@@ -118,7 +118,7 @@ YES:
 ---------------------
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
@@ -128,7 +128,7 @@ NO:
 +
 ---------------------
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
