Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBE5D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C34408A2;
	Thu, 22 Jan 2026 19:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOlq89c-HsRO; Thu, 22 Jan 2026 19:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3F740886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110512;
	bh=HECnT9Mks3aqFZ01MP7uN1GvaYEHSuxsG4b40C5p/lw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CfddH87VPYfVCYQLMphQw8FtlYfAFXMbFe2e03DaGI2WDqfvzX8XsUqtgr8eAemnF
	 xgRguBRbpbfIBLiEUq0kvJKRLYDD53gRcDI0GYiGHe0/UJuunv9GuoIiHRcy4MBGky
	 RJT13eTHBlhxiTcgHNFetORpBKzYe5QPsaO+QwYXezFTuNI2jnf+V1qpjbDJoayJAv
	 JgPrYQ3CA1dRUHo/kC+uh1ikUD9/laJtAYkoPBdyG82NTFrIMCLWSZRt7NTFEJD6BA
	 MrGRTTDj4ExGtajTZJ4qLC99A29auCg16zmYdCdb7pCYvpiCXggAMpz8T6Q7hjdP5M
	 4eIhUgy2Gwf0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3F740886;
	Thu, 22 Jan 2026 19:35:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD933122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD5E880EBD
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bW8-JeuS1SpM for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0003A80EBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0003A80EBB
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E33788754F; Thu, 22 Jan 2026 19:35:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 170a7c462baf89ab6c7f5f3dd8aa912b431e4288
X-Git-Newrev: 12a66851b167a7544ec1a9b9d6e9ba9735b7441d
X-Patchwork-Hint: ignore
Message-Id: <20260122193509.E33788754F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcdio-paranoia: bump version to
 10.2+2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=12a66851b167a7544ec1a9b9d6e9ba9735b7441d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libcdio/libcdio-paranoia/blob/release-10.2%2B2.0.2/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcdio-paranoia/libcdio-paranoia.hash | 2 +-
 package/libcdio-paranoia/libcdio-paranoia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcdio-paranoia/libcdio-paranoia.hash b/package/libcdio-paranoia/libcdio-paranoia.hash
index f1f64f6c08..9ebdea5ce3 100644
--- a/package/libcdio-paranoia/libcdio-paranoia.hash
+++ b/package/libcdio-paranoia/libcdio-paranoia.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a  libcdio-paranoia-10.2+2.0.1.tar.bz2
+sha256  186892539dedd661276014d71318c8c8f97ecb1250a86625256abd4defbf0d0c  libcdio-paranoia-10.2+2.0.2.tar.bz2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio-paranoia/libcdio-paranoia.mk b/package/libcdio-paranoia/libcdio-paranoia.mk
index 944bb14d77..c2ca4c50d0 100644
--- a/package/libcdio-paranoia/libcdio-paranoia.mk
+++ b/package/libcdio-paranoia/libcdio-paranoia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_PARANOIA_VERSION = 10.2+2.0.1
+LIBCDIO_PARANOIA_VERSION = 10.2+2.0.2
 LIBCDIO_PARANOIA_SOURCE = libcdio-paranoia-$(LIBCDIO_PARANOIA_VERSION).tar.bz2
 LIBCDIO_PARANOIA_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_PARANOIA_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
