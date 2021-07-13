Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2387CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:25:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE4860187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFE4860187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9400D404F6;
	Tue,  3 Aug 2021 23:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bT54MkoVjKWd; Tue,  3 Aug 2021 23:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979B4404FA;
	Tue,  3 Aug 2021 23:25:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC2F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1CB740E91
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3zNpl8FGgYQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB5040688
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 62F7D87F55; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 22:05:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5675f09e584e124201451a0feee6e22d8ea2b84a
X-Git-Newrev: 7ecbb956e2c6a6dd42126657e05e86072f3fc140
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.62F7D87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/thrift: security bump
 to version 0.14.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7ecbb956e2c6a6dd42126657e05e86072f3fc140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2020-13949: In Apache Thrift 0.9.3 to 0.13.0, malicious RPC
clients could send short messages which would result in a large memory
allocation, potentially leading to denial of service.

- Disable javascript and nodejs which have been added with
  https://github.com/apache/thrift/commit/61d502075bf5da10331c201f604acdfefc4d5edc
- Update hash of LICENSE, license for windows-specific files added:
  https://github.com/apache/thrift/commit/98854c48744f20b3f551817273ed502835477f09

https://github.com/apache/thrift/blob/v0.14.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/thrift/thrift.hash | 6 +++---
 package/thrift/thrift.mk   | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index f342dc348d..20d6baeace 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.13.0/thrift-0.13.0.tar.gz.sha256
-sha256  7ad348b88033af46ce49148097afe354d513c1fca7c607b59c33ebb6064b5179  thrift-0.13.0.tar.gz
+# From https://www.apache.org/dist/thrift/0.14.1/thrift-0.14.1.tar.gz.sha256
+sha256  13da5e1cd9c8a3bb89778c0337cc57eb0c29b08f3090b41cf6ab78594b410ca5  thrift-0.14.1.tar.gz
 # License files, locally calculated
-sha256  23df881cec3192d1f4474633c14eb2ec30a45b84f8daeb82b9de5d2bd3ac8218  LICENSE
+sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 544eb97323..c36efce2ed 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.13.0
+THRIFT_VERSION = 0.14.1
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
@@ -18,8 +18,10 @@ HOST_THRIFT_DEPENDENCIES = host-bison host-boost \
 
 THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
 	-DBUILD_TESTING=OFF \
+	-DWITH_NODEJS=OFF \
 	-DWITH_PYTHON=OFF \
 	-DWITH_JAVA=OFF \
+	-DWITH_JAVASCRIPT=OFF \
 	-DWITH_QT5=OFF
 
 THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
