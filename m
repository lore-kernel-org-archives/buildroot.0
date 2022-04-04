Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9B5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC4D40939;
	Mon,  4 Apr 2022 19:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPyYuMKt32_9; Mon,  4 Apr 2022 19:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F87408B1;
	Mon,  4 Apr 2022 19:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885E51BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768B1401A3
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4z9m51JsAWq for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B192840168
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 13B9881E71; Mon,  4 Apr 2022 19:14:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:17:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: defafdf3f80a1311d0ba0c735624497a549ec0a4
X-Git-Newrev: fc9c97f0026191f3bab0cc1f37675de8e826a564
X-Patchwork-Hint: ignore
Message-Id: <20220404191459.13B9881E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cppcms: add
 openssl optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc9c97f0026191f3bab0cc1f37675de8e826a564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

openssl is an optional dependency since version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/7cfdc9f703a35c42f7168573ffcc92eaa37e4ab6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9fb9c1e8df655a8ba86f38145486d5412e44b84b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
