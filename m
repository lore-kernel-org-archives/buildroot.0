Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C748740A68;
	Mon, 21 Mar 2022 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sm2kWtFL1pF; Mon, 21 Mar 2022 21:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6F540A5D;
	Mon, 21 Mar 2022 21:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD20E1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA62A40A65
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiQ_MNXo9NwM for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 544D240A5D
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0051D84CA0; Mon, 21 Mar 2022 20:51:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 21:57:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9c81cc4eefd0972b91abced472e2bce8b53fa2
X-Git-Newrev: e2f1f28efd4236431b333fabe6c75aceba9678bc
X-Patchwork-Hint: ignore
Message-Id: <20220321205121.0051D84CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libodb-boost: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2f1f28efd4236431b333fabe6c75aceba9678bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host variant of libodb-boost required by the ODB compiler.
The libodb-boost headers are needed at compile time, and
therefore installed in $(HOST_DIR).

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[Arnout: add -std=c++11]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
