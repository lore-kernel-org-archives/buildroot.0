Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1ACE8FDA8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1277F40593;
	Fri, 26 Dec 2025 11:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHvyQM1wmz-n; Fri, 26 Dec 2025 11:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EA640564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766748968;
	bh=6DLZqc0IKDKA83/2EUDfEBd830lWm20P7aUj79Y5xU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=byLmTkqVKQ9RpeXxxd4D/ad9t8tPDJRkGQmoUwx5IXKjwbLpkR2oI0wELduf5ee+S
	 j14a0UDUl5RHqSRY3PjzPRMgrk19bvtFyQj67yhbmKX0LzTJhXJq9X2uL58bjOvo30
	 6a3EnlTVj/5pvnxe/De75+P0i2BpJBPvInEOFFUFo11S2iiECNNXQrHxwvSDPXMaFK
	 3I5PRY5E87amrcHEnBrN4p7WZrQxFaqC2xQbylE/c6jShaeKTPJcG2piLwDaEi+LSl
	 Rw497Hl0eWilV3995tIKeuwpASitkeobXkS6MURZw/O7CrU4L0HW/S2W6OdACZod70
	 lFyLx3NRGhX4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25EA640564;
	Fri, 26 Dec 2025 11:36:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7024F119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7D940502
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbZlcIXUR8yl for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D384012D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D384012D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2202844BB; Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 12:14:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edf4a89aaf9d7af884149a431a141a4b80c524bc
X-Git-Newrev: 849dc900988529d0fa2dc7fbbb7d762a1889d9a6
X-Patchwork-Hint: ignore
Message-Id: <20251226113602.A2202844BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: bump to 2.3.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=849dc900988529d0fa2dc7fbbb7d762a1889d9a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index d128565469..a9f879ea18 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3  zlib-ng-2.2.4.tar.gz
+sha256  6a0561b50b8f5f6434a6a9e667a67026f2b2064a1ffa959c6b2dae320161c2a8  zlib-ng-2.3.2.tar.gz
 sha256  6c9f0d975b41afaa34d22f55bb8986ce69e5cb7ad327cb2b28820cd425edf5ee  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 68a3b2d6f3..275c5b86f0 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.2.4
+ZLIB_NG_VERSION = 2.3.2
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
