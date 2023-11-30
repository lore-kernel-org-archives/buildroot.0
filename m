Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D6C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B377543653;
	Thu, 30 Nov 2023 23:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B377543653
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obDCrVgMgkNT; Thu, 30 Nov 2023 23:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBAA43688;
	Thu, 30 Nov 2023 23:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACBAA43688
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDB61BF990
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CAC4365B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CAC4365B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1NZPbIwOcoC for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB344365C
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DB344365C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B3118766B; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:45:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 566bad2b39f3ee0b91794c946882a3b62e6591d1
X-Git-Newrev: cfaac7f0a08fddd9a7b83eabdd3e679c9c0b1c1e
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.7B3118766B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/memcached:
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfaac7f0a08fddd9a7b83eabdd3e679c9c0b1c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
