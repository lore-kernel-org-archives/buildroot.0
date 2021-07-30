Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75C8C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B9360720
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75B9360720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EA383827;
	Fri, 30 Jul 2021 14:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIdBZpzBlVvP; Fri, 30 Jul 2021 14:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8205083B0D;
	Fri, 30 Jul 2021 14:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC73C1C1170
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC9D960682
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odQU52refBxE for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D1160618
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9E3E8844CB; Fri, 30 Jul 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:58:44 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7efeef34ef80139ad1603c0313f680cad767be8a
X-Git-Newrev: 55d11aeefaf9fcf2f79b1b166811229b39d15446
X-Patchwork-Hint: ignore
Message-Id: <20210730133428.9E3E8844CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/nettle: bump to
 version 3.7.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=55d11aeefaf9fcf2f79b1b166811229b39d15446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Bugfix release. From NEWS:

        This is bugfix release, fixing bugs that could make the RSA
        decryption functions crash on invalid inputs.

        Upgrading to the new version is strongly recommended. For
        applications that want to support older versions of Nettle,
        the bug can be worked around by adding a check that the RSA
        ciphertext is in the range 0 < ciphertext < n, before
        attempting to decrypt it.

https://lists.gnu.org/archive/html/info-gnu/2021-06/msg00002.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e5cb51680817b46ee8be39cb84a8d723c31f7e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 09652dcc8b..cd32ad442e 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.7.2.tar.gz.sig
-sha256  8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162  nettle-3.7.2.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig
+sha256  661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0  nettle-3.7.3.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index bf833eb27e..3dbd0cb94b 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.7.2
+NETTLE_VERSION = 3.7.3
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
