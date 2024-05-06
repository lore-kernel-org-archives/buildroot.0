Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5DC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD350605CD;
	Mon,  6 May 2024 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qj9IinHI09WM; Mon,  6 May 2024 20:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6AC60764
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6AC60764;
	Mon,  6 May 2024 20:38:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A14DD1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC2F60764
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBjjxPT3PYCn for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDD0605CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDD0605CD
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D404686920; Mon,  6 May 2024 20:38:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:30:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
X-Git-Newrev: 1a2564e6880b70256c850a3fb54e9ec77d109d58
X-Patchwork-Hint: ignore
Message-Id: <20240506203847.D404686920@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a2564e6880b70256c850a3fb54e9ec77d109d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:bencollins:jwt_c_library is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/6335E595-6F38-4837-83BB-C78B687BB75B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjwt/libjwt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 1643aa7b7a..8929904d10 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -11,6 +11,8 @@ LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
+LIBJWT_CPE_ID_VENDOR = bencollins
+LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 LIBJWT_CONF_OPTS = --without-examples
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
