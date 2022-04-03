Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA590C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C35404CC;
	Sun,  3 Apr 2022 19:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOB38-3i8XRD; Sun,  3 Apr 2022 19:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A756540395;
	Sun,  3 Apr 2022 19:04:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 304F21BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB1660E40
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNKJFmQwdQdZ for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7662F60E22
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1DB8D86082; Sun,  3 Apr 2022 18:55:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:03:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32045a73a39904617a3c281e02ccf93ad953b5d5
X-Git-Newrev: 9fb9c1e8df655a8ba86f38145486d5412e44b84b
X-Patchwork-Hint: ignore
Message-Id: <20220403185526.1DB8D86082@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: add openssl optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fb9c1e8df655a8ba86f38145486d5412e44b84b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is an optional dependency since version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/7cfdc9f703a35c42f7168573ffcc92eaa37e4ab6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cppcms/cppcms.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 357909f31d..c560b5d0fa 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -35,6 +35,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=ON
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CPPCMS_CONF_OPTS += -DDISABLE_OPENSSL=OFF
+CPPCMS_DEPENDENCIES += openssl
+else
+CPPCMS_CONF_OPTS += -DDISABLE_OPENSSL=ON
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
 CPPCMS_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
