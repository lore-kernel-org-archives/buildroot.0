Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2978C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 18:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FF78135C;
	Sun, 15 May 2022 18:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9_eOAhrO5Jf; Sun, 15 May 2022 18:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82C281351;
	Sun, 15 May 2022 18:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853CD1BF424
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74323416AD
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6TogAP5Ljiu for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9382D4160F
 for <buildroot@buildroot.org>; Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2C19085E8D; Sun, 15 May 2022 18:07:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 20:15:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92357f4cbe96288b981e4835c15640405ee83139
X-Git-Newrev: 42357b8e47fd3a89e6dddc8f24f41b66fc76564b
X-Patchwork-Hint: ignore
Message-Id: <20220515180747.2C19085E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=42357b8e47fd3a89e6dddc8f24f41b66fc76564b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure since bump to version
3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /nvmedata/autobuild/instance-11/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
                 from /nvmedata/autobuild/instance-11/output-1/build/libressl-3.5.2/tests/../include/compat/stdio.h:18,
                 from /nvmedata/autobuild/instance-11/output-1/build/libressl-3.5.2/tests/rfc3779.c:18:
/nvmedata/autobuild/instance-11/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:149:23: error: expected identifier or '(' before ';' token
  149 |         void *__unused;                         /* Placeholder for codeset binding. */
      |                       ^

Fixes:
 - http://autobuild.buildroot.org/results/620cb8d542c2e0c263233f5b746cbc9be1bd9547

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index c9c484d5d8..a52a15c676 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,7 +10,7 @@ LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
-LIBRESSL_CONF_OPTS = -DOPENSSLDIR="/etc/ssl"
+LIBRESSL_CONF_OPTS = -DLIBRESSL_TESTS=OFF -DOPENSSLDIR="/etc/ssl"
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
