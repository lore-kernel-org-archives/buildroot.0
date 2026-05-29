Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB602CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB72C4215D;
	Fri, 29 May 2026 09:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78jkAS-iddhu; Fri, 29 May 2026 09:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E303C42177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047908;
	bh=NokMu2vsgRIDk40OSZRR1IjbEE0lWw+JHd3+Q4/kCO0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nr+mLoCkcZrLB7Ld7I4FvlTQ7hF1hhh8oqVFMZkIajwjx4YLY94keV6cxwzJEPr3j
	 v7pza0QUhFAHCyoB9YOoilyl77ebvd5bepjsd0VNLUT08VvQDg3uJFXUs+ybdUNOKG
	 uZzjwCYq1UmmhgE9WEs4E2Od/m8HaBDpqXhgeDGL9lAptQ45HhPwKBwnrQgcJj6YVD
	 BbkE/EichugG7XkQaoHcyRKv0VhUHrq12vGXI9NjY/nuRZbZIEU81BwHCtynw6qDWh
	 bL+kzM9K3okYlduE8kc3NJcTluzpBoN0u5TCijuGSovCl5nFUSH2M/DfDWsdt49GZ8
	 xJSCA/U0YDA3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E303C42177;
	Fri, 29 May 2026 09:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D89F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01C3A42177
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa1POTrait_3 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489894215D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 489894215D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A3A8732F; Fri, 29 May 2026 09:44:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:41:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9129a431921d51d82eaee66f98d4969534978fd4
X-Git-Newrev: 0cbfc9e9911471ff60ba7630dec7ef8f88bdaf3e
X-Patchwork-Hint: ignore
Message-Id: <20260529094453.C3A3A8732F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unrar: bump to version
 7.2.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0cbfc9e9911471ff60ba7630dec7ef8f88bdaf3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

- Performance improvements for solid RAR archives
- Enhanced TAR extraction speed
- New archive naming and date handling features
- Various bug fixes and improvements

https://www.rarlab.com/rar_add.htm

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index c9a5f521a4..65dcab4464 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a008b5f949bca9bb4ffa1bebbfc8b3c14b89df10a10354809b845232d5f582e5  unrarsrc-6.2.12.tar.gz
+sha256  d1afa67ef4121ebc5986815699e05db0ce8648499e5dca854f282a4c3f72c003  unrarsrc-7.2.6.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 0a61bcfcba..c829a2ebbb 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.12
+UNRAR_VERSION = 7.2.6
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
