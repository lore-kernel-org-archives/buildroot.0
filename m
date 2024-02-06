Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83231C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D57E41E03;
	Tue,  6 Feb 2024 08:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D57E41E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bv4BI3hW1d4P; Tue,  6 Feb 2024 08:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865DA41DA2;
	Tue,  6 Feb 2024 08:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865DA41DA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 838B31BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C8E541DA2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8E541DA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzyThnEm8N9l for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A4741B8F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A4741B8F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D41B86ED4; Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 09:12:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 420d34a8ad20bc1aefb7ca0c50e7d2beae1d85ec
X-Git-Newrev: 3c413d16037e412f81f6cf735f6b4fd0b9723bf2
X-Patchwork-Hint: ignore
Message-Id: <20240206081556.8D41B86ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: disable examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c413d16037e412f81f6cf735f6b4fd0b9723bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Examples are enabled by default since the addition of the package in
commit 7251775773011e7da38e3a33c6817eceab6a9dfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjwt/libjwt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 7e2ea03b09..1643aa7b7a 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -11,6 +11,7 @@ LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
+LIBJWT_CONF_OPTS = --without-examples
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBJWT_CONF_OPTS += --with-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
