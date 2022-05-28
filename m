Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20CBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 18:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341B28494C;
	Sat, 28 May 2022 18:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7OX9BD1pauO; Sat, 28 May 2022 18:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45025848FC;
	Sat, 28 May 2022 18:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAA11BF385
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 18:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17D304272C
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 18:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EgCeK6ScLfP for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 18:40:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7A0B42729
 for <buildroot@buildroot.org>; Sat, 28 May 2022 18:40:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BE54683D21; Sat, 28 May 2022 18:29:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 20:40:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51316159c8b2ea247510c234b35288e292e474e1
X-Git-Newrev: e7f7d13a6176b09c59cffed87f31bea346f07433
X-Patchwork-Hint: ignore
Message-Id: <20220528182914.BE54683D21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libodb-boost: fix host dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f7d13a6176b09c59cffed87f31bea346f07433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
e2f1f28efd4236431b333fabe6c75aceba9678bc:

make: *** No rule to make target 'hoost-boost', needed by '/home/autobuild/autobuild/instance-8/output-1/build/host-libodb-boost-2.4.0/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/b7acb03dfc7c7ce27db5536d337f4d61a8cc7a4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libodb-boost/libodb-boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index 6deb67f943..996759a03a 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -12,7 +12,7 @@ LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
 LIBODB_BOOST_DEPENDENCIES = boost libodb
-HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
+HOST_LIBODB_BOOST_DEPENDENCIES = host-boost host-libodb
 LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 HOST_LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
