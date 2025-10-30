Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29469CCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A876F83FF8;
	Thu, 30 Oct 2025 08:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuDEkdAN9hT7; Thu, 30 Oct 2025 08:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B0683FFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B0683FFE;
	Thu, 30 Oct 2025 08:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E0B2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71BAF613C0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7O8u2dFtj1H for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9AC61382
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B9AC61382
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49787879C2; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:48 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 03587fbb4469177f8de08654ce85ee3384640b69
X-Git-Newrev: 9127f0dacbf0ddd6d32e19922d4d1d536e132d5b
X-Patchwork-Hint: ignore
Message-Id: <20251030082228.49787879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 package/freeradius-server: requires RC4 support in openssl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9127f0dacbf0ddd6d32e19922d4d1d536e132d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/5a5/5a57a82800fb7a47731198effc15bd7044133c4d/

    src/modules/rlm_mschap/rlm_mschap.c:1016:54: error: implicit
    declaration of function 'EVP_rc4'; did you mean 'EVP_md4'?

The oldest build error found with a quick search appeared back in July
2024 with freeradius-server 3.2.3 so a backport should be considered:
https://autobuild.buildroot.net/results/e2d/e2d77a52f81b0fea1081417c5c80f7991e27810a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 99c5c21b14e86ef53520868a6bee672d6e249c3b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freeradius-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index e99778ea49..40401f57c7 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
