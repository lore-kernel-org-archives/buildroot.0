Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFC2C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2693960EB2
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2693960EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32446070C;
	Sun,  8 Aug 2021 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9kp_7sZAaS7; Sun,  8 Aug 2021 19:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A05F6058C;
	Sun,  8 Aug 2021 19:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A881BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33A116058C
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVQgguyI8cCM for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:47:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB56600D4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:47:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 30F928D2A9; Sun,  8 Aug 2021 19:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:46:59 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: fb9c660f5224a152fe222678d1661a090fe3076f
X-Git-Newrev: 992f4aa9713bb378e1142d5367dbd1ecaa4e52bd
X-Patchwork-Hint: ignore
Message-Id: <20210808194659.30F928D2A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/glibc: security
 bump to version 2.32-50-g737efa27fca5c97f5
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

commit: https://git.buildroot.net/buildroot/commit/?id=992f4aa9713bb378e1142d5367dbd1ecaa4e52bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes the following security issue:

- CVE-2021-33574: The mq_notify function has a potential use-after-free
  issue when using a notification type of SIGEV_THREAD and a thread
  attribute with a non-default affinity mask.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash b/package/glibc/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/glibc.hash
similarity index 70%
rename from package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
rename to package/glibc/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/glibc.hash
index b1d5243fcc..5e00ef7c04 100644
--- a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
+++ b/package/glibc/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  b634d38ace90752eeecb93246d71c0673bab0db8dfbd69333479ae7b10d63410  glibc-2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f84f670fc0..14c3f03597 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+GLIBC_VERSION = 2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
