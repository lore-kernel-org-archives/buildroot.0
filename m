Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A05C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 09:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB831419E5;
	Sat, 18 Mar 2023 09:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB831419E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTNLePKgXUv9; Sat, 18 Mar 2023 09:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5424192F;
	Sat, 18 Mar 2023 09:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5424192F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 644681BF3A3
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF4B82170
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF4B82170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr8rw9FRJOqJ for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E1782164
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E1782164
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47BAB86F9C; Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 10:31:04 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 24f0af804e6a0ff2704a22ba7c222862b1b43ec2
X-Git-Newrev: 7225efefa559ec5e8aa2cb98cc2474be8dee9106
X-Patchwork-Hint: ignore
Message-Id: <20230318093210.47BAB86F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmodsecurity:
 select pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7225efefa559ec5e8aa2cb98cc2474be8dee9106
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit ea746f312844df298bbc9a697ca178f3a3c67a8f forgot to select pcre2
resulting in the following build failure:

Makefile:575: *** pcre2 is in the dependency chain of libmodsecurity that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/6528d2611bd1a45c1e94bc6b866de9c33dd90a7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f5e1cec70087df0964200beb81d9269bf2813f6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 37cd2ac263..69bb0494cc 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	# various issues when static linking and other dependencies of
 	# libmodsecurity in turn use mbedtls
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
 	  v3 project. The library codebase serves as an
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
