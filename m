Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EBF823EB;
	Fri, 31 Dec 2021 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAzHxqGGiLcN; Fri, 31 Dec 2021 17:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DBD481DCA;
	Fri, 31 Dec 2021 17:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42F1D1BF399
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FBE3402D2
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFTOEWV6tRFY for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 17:39:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C5F402D1
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 17:39:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0AEA582DF1; Fri, 31 Dec 2021 17:33:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 18:39:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd5191efd97e814099d211288a9956e88677ff75
X-Git-Newrev: 9849fa0101c151a2977507cfb8ecdcae68af89a1
X-Patchwork-Hint: ignore
Message-Id: <20211231173346.0AEA582DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtasn1: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=9849fa0101c151a2977507cfb8ecdcae68af89a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 30ac432b419599a8744238fdea65cf08c0765b63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: also fix the variable expansion]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtasn1/libtasn1.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ecca00e79e..ba86081df9 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -20,11 +20,11 @@ LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
-LIBTANS1_PROGS = asn1Coding asn1Decoding asn1Parser
+LIBTASN1_PROGS = asn1Coding asn1Decoding asn1Parser
 
 # We only need the library
 define LIBTASN1_REMOVE_PROGS
-	$(RM) $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBTANS1_PROGS))
+	$(RM) $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBTASN1_PROGS))
 endef
 LIBTASN1_POST_INSTALL_TARGET_HOOKS += LIBTASN1_REMOVE_PROGS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
