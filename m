Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619D0C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A35A8415D;
	Fri,  2 May 2025 11:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-HKZekmnLyn; Fri,  2 May 2025 11:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF498416A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF498416A;
	Fri,  2 May 2025 11:13:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 130F4EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7442A61238
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2NiIAR1VWMN for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381F6121B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B381F6121B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C6B864AD; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 901f6e1cb413df12330cd81dcf150d2c4b3ca87a
X-Git-Newrev: 78cae9780a75799b1b6893022ecc4d76775327ea
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.B1C6B864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cryptopp: add
 upstream URL in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=78cae9780a75799b1b6893022ecc4d76775327ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The upstream URL was missing in the help text, so add it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b20c8aa1f1feb614f2bc321a236183c42e50596d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cryptopp/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index 1648a73f9d..95f930c8f9 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_CRYPTOPP
 	help
 	  A free C++ class library of cryptographic schemes
 
+	  https://cryptopp.com
+
 comment "cryptopp needs a toolchain w/ C++, dynamic library, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
