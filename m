Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF94AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D450410BD;
	Sun, 14 Aug 2022 10:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D450410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YvcS1-Ske_m; Sun, 14 Aug 2022 10:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3374109B;
	Sun, 14 Aug 2022 10:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3374109B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3081BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAA82607FE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA82607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSqwwmdAv6vC for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:07:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE4836076A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4836076A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 160B287449; Sun, 14 Aug 2022 09:53:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:07:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44e3d85cbb327480473f6293f20f84600bd3c240
X-Git-Newrev: 8271e8692eef780d22df65116344e684e6f76ce8
X-Patchwork-Hint: ignore
Message-Id: <20220814095318.160B287449@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: bump to version 1.6.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8271e8692eef780d22df65116344e684e6f76ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc 12 thanks to
https://github.com/memcached/memcached/commit/4df826aafdd6abf0fc483d52774047c3533206dc:

In function 'complete_incr_bin',
    inlined from 'dispatch_bin_command' at proto_bin.c:1010:17,
    inlined from 'try_read_command_binary' at proto_bin.c:119:9:
proto_bin.c:272:31: error: array subscript 'protocol_binary_request_incr[0]' is partly outside array bounds of 'char[45]' [-Werror=array-bounds]
  272 |     req->message.body.delta = ntohll(req->message.body.delta);
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/memcached/memcached/wiki/ReleaseNotes1616
https://github.com/memcached/memcached/wiki/ReleaseNotes1615
https://github.com/memcached/memcached/wiki/ReleaseNotes1614
https://github.com/memcached/memcached/wiki/ReleaseNotes1613

Fixes:
 - http://autobuild.buildroot.org/results/27ae4bc1ce0d37dee09613b1145023f0d96d8c55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 22c794d07b..3bdd1e5e33 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.12.tar.gz.sha1
-sha1  40d43e98f149e13e6c81eee813e6734f23413a01  memcached-1.6.12.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.16.tar.gz.sha1
+sha1  724f31c3462fb6b07264d72d0043fd65545fd84a  memcached-1.6.16.tar.gz
 
 # Locally computed
-sha256  f291a35f82ef9756ed1d952879ef5f4be870f932bdfcb2ab61356609abf82346  memcached-1.6.12.tar.gz
+sha256  3051a93bf1dd0c3af2d0e589ff6ef6511f876385a35b18e9ff8741e4a1ab34da  memcached-1.6.16.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 842c0b42fa..5249195c2e 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.12
+MEMCACHED_VERSION = 1.6.16
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
