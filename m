Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30235C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE093831BD;
	Thu, 11 Aug 2022 17:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE093831BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBLaBU5KdJpR; Thu, 11 Aug 2022 17:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F384482F49;
	Thu, 11 Aug 2022 17:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F384482F49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49C1E1C116E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222D260AEE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 222D260AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ax8SsFsqsq3G for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55AF260A98
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55AF260A98
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B73687142; Thu, 11 Aug 2022 17:19:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:32:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5a5c6cd386f5480fc7c9cc9419cd00fed6f9d2b8
X-Git-Newrev: c3d83ee69f59b624ed049d52ed581ac025efa42a
X-Patchwork-Hint: ignore
Message-Id: <20220811171916.9B73687142@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: disable
 cmocka
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3d83ee69f59b624ed049d52ed581ac025efa42a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable cmocka (wich is enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3acd6452fbbe8c70ddb4dcfc299505b1bfefabac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0ce78d08cb..c84abe91a0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -31,6 +31,7 @@ BIND_CONF_ENV = \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
+	--without-cmocka \
 	--without-lmdb \
 	--with-json-c=no \
 	--enable-epoll \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
