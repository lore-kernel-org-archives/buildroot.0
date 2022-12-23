Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA8EC4167B
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E3B6113B;
	Fri, 23 Dec 2022 09:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E3B6113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGzX8KdVDXJI; Fri, 23 Dec 2022 09:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC10F6113D;
	Fri, 23 Dec 2022 09:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC10F6113D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE08B1BF973
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C25678217A
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25678217A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYt6Z-WjubNd for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2CCA82179
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2CCA82179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FC5D86DD2; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:34:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd7e90779861bb603fc1cca03f6fad4d951f7bd9
X-Git-Newrev: 53f2999edfa5e67923d4d8a102c15fa3200e089c
X-Patchwork-Hint: ignore
Message-Id: <20221223093614.9FC5D86DD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xtables-addons: bump to version
 3.22
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
Content-Type: multipart/mixed; boundary="===============6264430379737664057=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6264430379737664057==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=53f2999edfa5e67923d4d8a102c15fa3200e089c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for up to Linux 6.1 by fixing the following build failure:

/tmp/instance-5/output-1/build/xtables-addons-3.21/extensions/xt_CHAOS.c: In function ‘xt_chaos_total’:
/tmp/instance-5/output-1/build/xtables-addons-3.21/extensions/xt_CHAOS.c:70:46: error: implicit declaration of function ‘prandom_u32’; did you mean ‘prandom_u32_max’? [-Werror=implicit-function-declaration]
   70 |         if (!ret || hotdrop || (unsigned int)prandom_u32() > delude_percentage)
      |                                              ^~~~~~~~~~~
      |                                              prandom_u32_max

https://fossies.org/linux/privat/xtables-addons-3.22.tar.xz/xtables-addons-3.22/doc/changelog.rst

Fixes:
 - http://autobuild.buildroot.org/results/4564ba888156710819f6bd86117e0c0bdd513dba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 0d2434eeb1..840a31f947 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e09ac129a14f5e9c23b115ebcdfff4aa84e2aeba1268dbdf39b2d752bd71e19  xtables-addons-3.21.tar.xz
+sha256  faa16a27166275afbfe8df605f55c3a81ac693bf19da674d45ceded4137ae217  xtables-addons-3.22.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 83cc3266c4..77dcfd741c 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.21
+XTABLES_ADDONS_VERSION = 3.22
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf

--===============6264430379737664057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6264430379737664057==--
