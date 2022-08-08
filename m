Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03123C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C178145B;
	Mon,  8 Aug 2022 20:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C178145B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evpzfTkJemCr; Mon,  8 Aug 2022 20:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDEAA81458;
	Mon,  8 Aug 2022 20:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDEAA81458
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF4791BF365
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0368607F7
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0368607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzpcCJdwS2PL for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FAB760768
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FAB760768
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 29B1186F9A; Mon,  8 Aug 2022 20:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 22:24:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37f05c2497a05c9d007ed03c224f4a4d18a21b21
X-Git-Newrev: 6826595759d1978633008479d305abb8a894d442
X-Patchwork-Hint: ignore
Message-Id: <20220808201330.29B1186F9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: needs qrcode,
 not pyqrcode
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

commit: https://git.buildroot.net/buildroot/commit/?id=6826595759d1978633008479d305abb8a894d442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It may be confusing, by pyqrcode and qrcode are two different
packages, and autobahn's encryption support needs the latter, with
support for SVG image generation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index dfb517ae4b..c9caa1f1c4 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -25,7 +25,8 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
 	bool "TLS and WAMP-cryptosign encryption/authentication support"
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	select BR2_PACKAGE_PYTHON_PYQRCODE # runtime
+	select BR2_PACKAGE_PYTHON_QRCODE # runtime
+	select BR2_PACKAGE_PYTHON_QRCODE_SVG # runtime
 	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
