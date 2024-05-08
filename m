Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE2AC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6DB60682;
	Wed,  8 May 2024 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Lv0VORA-ClF; Wed,  8 May 2024 16:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6907960D5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6907960D5C;
	Wed,  8 May 2024 16:34:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 308B41BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D127404D7
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtleWt7u69Oy for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42207401F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42207401F9
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB3986ADA; Wed,  8 May 2024 16:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:33:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faf371a476c3125f2d2a3f50da89d9d372dfd68e
X-Git-Newrev: 8b1b43802419fabf19ac780f6106cccfb255718c
X-Patchwork-Hint: ignore
Message-Id: <20240508163429.3CB3986ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeromq: disable perf
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b1b43802419fabf19ac780f6106cccfb255718c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable performance measurement tools which are enabled by default since
bump to version 4.2.5 in commit d3a8177e175e035ca3b19dca7868859f7cb238a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 137fad1a66..f1a1f02f9e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -7,7 +7,7 @@
 ZEROMQ_VERSION = 4.3.5
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
-ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
+ZEROMQ_CONF_OPTS = --disable-perf --disable-Werror --without-documentation
 ZEROMQ_LICENSE = MPL-2.0
 ZEROMQ_LICENSE_FILES = LICENSE
 ZEROMQ_CPE_ID_VENDOR = zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
