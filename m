Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7825C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B83340FD7;
	Wed, 23 Mar 2022 21:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jS3fKcHdUzsa; Wed, 23 Mar 2022 21:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BFCA4019D;
	Wed, 23 Mar 2022 21:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3B601BF9C8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F75419E3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIk4NDP0vMIa for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22E241919
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 189CE856EE; Wed, 23 Mar 2022 21:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:59:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0dd4dd121735896e4875bf2527c032fc3c15bd4b
X-Git-Newrev: f331ffdaec10e9595d8e43f56e987d6861494eee
X-Patchwork-Hint: ignore
Message-Id: <20220323213134.189CE856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libodb-boost: add
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=f331ffdaec10e9595d8e43f56e987d6861494eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add host variant of libodb-boost required by the ODB compiler.
The libodb-boost headers are needed at compile time, and
therefore installed in $(HOST_DIR).

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[Arnout: add -std=c++11]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e2f1f28efd4236431b333fabe6c75aceba9678bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libodb-boost/libodb-boost.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index bac5f1e78f..6deb67f943 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -12,6 +12,9 @@ LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
 LIBODB_BOOST_DEPENDENCIES = boost libodb
+HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
 LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+HOST_LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
