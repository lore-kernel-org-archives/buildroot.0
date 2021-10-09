Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2901C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC3A60F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CC3A60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B23C40570;
	Sat,  9 Oct 2021 12:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuoHp3aLCt5Q; Sat,  9 Oct 2021 12:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47A5E40502;
	Sat,  9 Oct 2021 12:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3434C1BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD35D60A65
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KE8DTv6YF6V6 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:02:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8267660BA5
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B94089359A; Sat,  9 Oct 2021 12:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:52:19 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b96d31a5644559b3a7882373621d6debfa175ab4
X-Git-Newrev: 9870581397af66dfb69d2c6f64c1482554b9b29c
X-Patchwork-Hint: ignore
Message-Id: <20211009120015.B94089359A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libcurl: fix
 build with wolfssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=9870581397af66dfb69d2c6f64c1482554b9b29c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Select BR2_PACKAGE_WOLFSSL_ALL as suggested by upstream in
https://github.com/curl/curl/issues/7745 to fix the following build
failure raised since bump to version 7.79.1 in commit
6d6842130b456499d3ff230a3b70cec756cbccd1:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/10.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `wolfSSL_ERR_clear_error'

Fixes:
 - http://autobuild.buildroot.org/results/2956c8fb91a16d2ab59fb1c7babec46a6c8399e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 36ac5b0b0b6f90002e0dd684f345dda8d1dce096)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index afe6c7b9e7..d8072c0afc 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
