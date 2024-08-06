Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA2C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F164605BA;
	Tue,  6 Aug 2024 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UC_2kqGpDkRo; Tue,  6 Aug 2024 14:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18689606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18689606B4;
	Tue,  6 Aug 2024 14:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD8F21BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E2780EB7
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNNcugknr8Jy for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE3A180BAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3A180BAB
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:56:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5136841CA; Tue,  6 Aug 2024 14:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 16:54:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a05038831e7b35b7c0349b847ed9e95bceecbe1e
X-Git-Newrev: a3a7e673de82adbd324b23cc90ffb09923eb9956
X-Patchwork-Hint: ignore
Message-Id: <20240806145616.C5136841CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openconnect: fix openssl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3a7e673de82adbd324b23cc90ffb09923eb9956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable needed OpenSSL options even when GnuTLS is enabled as OpenSSL
is used in priority over GnuTLS.

Fixes:

  http://autobuild.buildroot.net/results/f53/f535a63b80f2efe59709d5d9b59bc27ba66d2c26/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openconnect/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openconnect/Config.in b/package/openconnect/Config.in
index cacf617fb9..ab065be357 100644
--- a/package/openconnect/Config.in
+++ b/package/openconnect/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_OPENCONNECT
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	# configure: error: LibreSSL does not support Cisco DTLS.
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if !BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
