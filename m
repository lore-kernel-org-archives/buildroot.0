Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C41C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 20:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D01E4016C;
	Sat, 25 Feb 2023 20:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D01E4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWtVhfshBRbP; Sat, 25 Feb 2023 20:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7615540156;
	Sat, 25 Feb 2023 20:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7615540156
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33C5A1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A92C607A4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A92C607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-1YBzsLZCkW for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FCB4606ED
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FCB4606ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BC9586AE0; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:46:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34625d54c9ba4f9e19fdc350fcf0a48a05c98576
X-Git-Newrev: 21a3097e7e227e8a26075f4f036324706e20d54f
X-Patchwork-Hint: ignore
Message-Id: <20230225205333.0BC9586AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: fix second patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=21a3097e7e227e8a26075f4f036324706e20d54f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix patch added by commit 7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd:

0x300000fL -> 0x3050000fL

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
index 7e32ad5745..acb5cfc9a6 100644
--- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -61,7 +61,7 @@ index 54ab0a6ef4..bd4075b3e4 100644
 -#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
 -/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
 +#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
-+	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x300000fL
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
 +/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL (before 3.5.0) */
  
  /* mutexes for multi-threaded OpenSSL (see "man 3ssl threads" and example in crypto/threads/mttest.c) */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
