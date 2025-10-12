Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B2CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5412640D3A;
	Sun, 12 Oct 2025 10:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFNJkA9Ja7XF; Sun, 12 Oct 2025 10:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3EF40CF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3EF40CF0;
	Sun, 12 Oct 2025 10:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF302A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79AE240CCF
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoosD0B6PYHw for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E7240CCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E7240CCA
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6A6C870B3; Sun, 12 Oct 2025 10:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 12:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3322cfeffaf73502636dba0aa282f08d04166afc
X-Git-Newrev: 1c8a0065955eab8fe9bf0a88c1955bb79724f2f3
X-Patchwork-Hint: ignore
Message-Id: <20251012105251.B6A6C870B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: add patch to fix
 builds against libopenssl 3.6.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c8a0065955eab8fe9bf0a88c1955bb79724f2f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.org/results/4bc8df69ddb9533de7d877c42e5f7c39192ca454/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0005-tpm-Update-to-OpenSSL-3.6.patch           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch b/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
new file mode 100644
index 0000000000..a2a54717e2
--- /dev/null
+++ b/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
@@ -0,0 +1,25 @@
+From 7f727710326bc0a6d6f28397253ec3a89000300e Mon Sep 17 00:00:00 2001
+From: Pedro Monreal <pmonrealgonzalez@suse.com>
+Date: Fri, 3 Oct 2025 10:35:46 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 3.6
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/22
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 26828d0..731957e 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
