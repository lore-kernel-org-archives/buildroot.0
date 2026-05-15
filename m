Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC78CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CCA85667;
	Tue,  9 Jun 2026 13:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SP_LaWt8A85M; Tue,  9 Jun 2026 13:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A5C8563D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010108;
	bh=jyB6kXUKtDgkh7Vaa+QEWeJQfjeLADP/cuOh9kcgbUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A/Cm7BU21cljYGMLHxLP6Cti+fOjEUCfXeUlET4fRgMNdN+j2dEs2xbh7pHpnTUjx
	 b7MFmNFrL21CftXxjkgrw7V/FFDWNAvC2YJNaesec3aQZxgIGw7M4Ae7cDRLccGnn4
	 saKr7iBmYxmFtzjIdkNRDDZC6wxta3453e5ZFu7qbWiW4vF9DyJkh6H4hnG6wULxTZ
	 kcJBUHObbgu4gTe2POgE1FR1qHAUlgd1KdPbzHGxbSxcGRvFdSf+qhak+6TfmAFDri
	 ZbUb1dGoFLAYxKa37q54QH+Q7v7VotI0PB5PPd6ohsPAlR0Ev3hwhP37qd/WXArGbo
	 3dKoHpsBmmImA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A5C8563D;
	Tue,  9 Jun 2026 13:01:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D762EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07B1640DA8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhzyNnIQV3go for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362B54103D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 362B54103D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6133287E8D; Tue,  9 Jun 2026 13:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 372f0ea9cefceb2f56a5dfedf612631eea1f47bc
X-Git-Newrev: 73594f1d0e53f5be9f2676d33524cedd857fbffe
X-Patchwork-Hint: ignore
Message-Id: <20260609130109.6133287E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: bump version to 4.3.5b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/73594f1d0e53f5be9f2676d33524cedd857fbffe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/obgm/libcoap/blob/v4.3.5b/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcoap/libcoap.hash | 2 +-
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 17fce990fa..0ca4fd3901 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bca78a2076ebb02179f93ab6cf2363b1256d878b540f810c238ea231ad5948ab  libcoap-4.3.5a.tar.gz
+sha256  383a17d8466cee7c1cb1d4dfbffad2651004850b29eb590e9591c7bedd46741d  libcoap-4.3.5b.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
 sha256  1ba383ac337111d18334b2e230d02831b60913d137c3b653585d8e8675824111  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index bb1321f194..21b479fc16 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.5a
+LIBCOAP_VERSION = 4.3.5b
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
