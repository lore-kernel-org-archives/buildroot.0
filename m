Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2D8C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F310043674;
	Thu, 30 Nov 2023 23:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F310043674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HXmQBNmOG56; Thu, 30 Nov 2023 23:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED501436BF;
	Thu, 30 Nov 2023 23:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED501436BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 790511BF2A1
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0092684692
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0092684692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFSRHK4hvTE5 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09830846E8
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09830846E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0D03876B1; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:44:48 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: f86173d5f62cb0667cce77a705b59e417c0d91a8
X-Git-Newrev: c06c12775b79fe44b870ab2d54934711fc09551e
X-Patchwork-Hint: ignore
Message-Id: <20231130230901.F0D03876B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/memcached:
 security bump to version 1.6.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=c06c12775b79fe44b870ab2d54934711fc09551e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix CVE-2023-46852: In Memcached before 1.6.22, a buffer overflow exists
when processing multiget requests in proxy mode, if there are many
spaces after the "get" substring.

Fix CVE-2023-46853: In Memcached before 1.6.22, an off-by-one error
exists when processing proxy requests in proxy mode, if \n is used
instead of \r\n.

https://github.com/memcached/memcached/wiki/ReleaseNotes1622

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bc96e9da0d8010482dcc50c055567d4625498088)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index c223a14bac..bd2072df0b 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.21.tar.gz.sha1
-sha1  6d899680b4ba4b76b6c92120143cf87630ee984a  memcached-1.6.21.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.22.tar.gz.sha1
+sha1  7a691f390d59616dbebfc9e2e4942d499c39a338  memcached-1.6.22.tar.gz
 
 # Locally computed
-sha256  c788980efc417dd5d93c442b1c8b8769fb2018896c29de3887d22a2f143da2ee  memcached-1.6.21.tar.gz
+sha256  34783a90a4ccf74c4107085fd92b688749d23b276cfdad9f04e4f725a05d1ca7  memcached-1.6.22.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a1a5eac049..05ae69eb32 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.21
+MEMCACHED_VERSION = 1.6.22
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
