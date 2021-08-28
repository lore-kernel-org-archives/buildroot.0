Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D783FC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05EA60E90
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A05EA60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DDA340272;
	Sat, 28 Aug 2021 16:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9s2yosoZVl9; Sat, 28 Aug 2021 16:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2474022F;
	Sat, 28 Aug 2021 16:05:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBF81BF48C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC0F460747
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNjdlRJW-0vb for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 16:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C70CA6069A
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 16:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 15D6486033; Sat, 28 Aug 2021 16:03:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 18:03:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 50c5495f81d3418a0f63fc642dc6beb41cd316e0
X-Git-Newrev: d3ab39fe09b691550adafebc02dc566929808675
X-Patchwork-Hint: ignore
Message-Id: <20210828160352.15D6486033@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stunnel: bump to
 version 5.60
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3ab39fe09b691550adafebc02dc566929808675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This release includes the following changes:

- New features
  - New 'sessionResume' service-level option to allow or disallow session resumption
  - Added support for the new SSL_set_options() values.
  - Download fresh ca-certs.pem for each new release.
- Bugfixes
  - Fixed 'redirect' with 'protocol'. This combination is not supported by 'smtp', 'pop3' and 'imap' protocols.
  - Enforced minimum WIN32 log window size.
  - Fixed support for password-protected private keys with OpenSSL 3.0 (thx to Dmitry Belyavskiy).
  - Added missing TLS options supported in OpenSSL 1.1.1k.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 0ae20cb906..b8cc62be13 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.59.tar.gz.sha256
-sha256  137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f  stunnel-5.59.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
+sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
 # Locally calculated
 sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index cf2e29cb9b..cc56eb39a8 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).59
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
