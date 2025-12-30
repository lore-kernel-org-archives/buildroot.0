Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C237E95A8A
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 12:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FB6818D0;
	Tue, 30 Dec 2025 12:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbyiYmem87bV; Tue, 30 Dec 2025 12:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B46781A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767098242;
	bh=EJLQQw4WnUTyHxV0Tzy4hbmvCOpeSTl/dus/wdwSZL4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UA8J5a5s0bO7Eaw5GRmQkScdjWrtUkVwBMH6oF4Zoj6RWefqug2zkP8eSCEVSUX2A
	 NsPQHNlhFwsvOBmxKdCiyQ4VRiXJEVaK68VysvGNztajStJ9x1k5V/oS3oCSbjFRBH
	 X7yDi7wkcjUut5YxukENSD35v5jtoMvI6GQF+zdSh1z6CGUQBBUCa9Zu3h/+qUYJbD
	 62lNjiZpVezJ/7enuywZBpyhYxJjhhPtSm4aqtP9ZCr3lKfflLq+qk9itqQvd6MIwK
	 AzdPkbpdEwcYxZpygJ4tmrVyq8mjIPb7RH1FqfTqkg6WtbftYYJl8J/HTJecv2HKJ4
	 hHLynt39ynINw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B46781A99;
	Tue, 30 Dec 2025 12:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D2ED8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 399654019A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwYoGWU16avp for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 12:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875894013F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875894013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 772DD87A5E; Tue, 30 Dec 2025 12:37:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:36:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0980aaea0461db01027dc173060bd9dd20110c4
X-Git-Newrev: b7b96c97f9714baed16e23059d703facbdf155f4
X-Patchwork-Hint: ignore
Message-Id: <20251230123720.772DD87A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utfcpp: fix comments
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7b96c97f9714baed16e23059d703facbdf155f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454 added this
package as copy from the taglib package but forgot to change all taglib-
related comments.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/utfcpp/Config.in | 2 +-
 package/utfcpp/utfcpp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
index 19e1f21688..3a3fc339bd 100644
--- a/package/utfcpp/Config.in
+++ b/package/utfcpp/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_UTFCPP
 
 	  https://github.com/nemtrif/utfcpp
 
-comment "taglib needs a toolchain w/ C++"
+comment "utfcpp needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index d3d7896813..4e17364e0b 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# taglib
+# utfcpp
 #
 ################################################################################
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
