Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A61C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51C3E412F3;
	Fri, 27 May 2022 07:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abANdppNyTG9; Fri, 27 May 2022 07:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6056D412E6;
	Fri, 27 May 2022 07:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 657D01BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE9A412E6
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RmqEA1Z7VsS for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E022412EE
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4746F865B8; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 23:25:17 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 34e5c549347ff81399cb1e00f98aa984e1d9ad1b
X-Git-Newrev: c31e50ccaaeadad77e8497b5216fae73046d8c1f
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.4746F865B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/omniorb: fix
 openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c31e50ccaaeadad77e8497b5216fae73046d8c1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add host-pkgconf dependency to fix the following build failure with
openssl raised since commit 9d519412d65e13e4a7ffbb83edd8d1e4b2dfe4b7:

/nvmedata/autobuild/instance-25/output-1/per-package/omniorb/host/bin/m68k-buildroot-linux-uclibc-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wall -Wno-unused -fexceptions  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I.. -I./.. -I../../../../../include/omniORB4/internal -I../../../../../include/omniORB4/internal -D_OMNIORB_SSL_LIBRARY -D__OMNIORB4__ -I../../../../../stub -D_REENTRANT -I/usr/include -I. -I. -I../../../../../include -I../../../../../include -D__OSVERSION__=2 -D__linux__ -D__m68k__ -o static/sslActive.o sslActive.cc
m68k-buildroot-linux-uclibc-g++: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
In file included from /usr/include/stdlib.h:55,
                 from /usr/include/openssl/crypto.h:14,
                 from /usr/include/openssl/bio.h:20,
                 from /usr/include/openssl/ssl.h:18,
                 from ../../../../../include/omniORB4/sslContext.h:48,
                 from sslActive.cc:32:
/usr/include/bits/floatn.h:75:70: error: unknown machine mode '__TC__'
   75 | typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
      |

Fixes:
 - http://autobuild.buildroot.org/results/47b1906eb7dd122a81191d14ad663c5931cbfade

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa0aeb4bfa2de530cf108dc3043766896c09d3e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/omniorb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b44ec53fd5..d6434735cf 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -25,7 +25,7 @@ HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OMNIORB_CONF_OPTS += --with-openssl
-OMNIORB_DEPENDENCIES += openssl
+OMNIORB_DEPENDENCIES += host-pkgconf openssl
 else
 OMNIORB_CONF_OPTS += --without-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
