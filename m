Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0E6D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1C1409D5;
	Thu, 22 Jan 2026 19:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GFCFKOQEJ00; Thu, 22 Jan 2026 19:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E375409BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110909;
	bh=Z7UKdpsLaOpiPNUKpvMr8MPBtVIjrgs6QFD/VCBhFE8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H23kqRVCA23rIINbgpRJZGlLdagGsH0HwbdgXnL8OtHlR5kdfvFQjeKIDfR4bSjlz
	 V19tYGubZ31IGI3IvBwea/gzqwm+YVr+wQOos/a53D+gIvnXAZV82KK/gyB5mu9gpb
	 Z3pgsg1uymx2crUxLPKb5WhJqUo1aZKSJoRP02VKh9uxyL0IwruvCBovHsELZtcW0r
	 YR8Se8AxyY/pvLNzioj5LjiZeLjBtWNWpR5gAqD+NCMn8E/qAQ7kWWhBarcmMUAn9H
	 SpHMdQHeNG1vR/NphCgRLVEhIUCstexFs3XeCWccTC2xKTY34KyfxuIYXlh+ttwT81
	 syaqg4VdHRmcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E375409BD;
	Thu, 22 Jan 2026 19:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5F4F122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB234015C
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkNEYHyhUUDh for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687524012B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687524012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:41:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6352987574; Thu, 22 Jan 2026 19:41:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:41:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cae3c75fd2e588d8f4de46a1910de15d1941b97e
X-Git-Newrev: b24dc68d09ff3b59f1091415dcb52a78f389b2fe
X-Patchwork-Hint: ignore
Message-Id: <20260122194147.6352987574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evilwm: bump to 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b24dc68d09ff3b59f1091415dcb52a78f389b2fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For changes see this page here:
https://www.6809.org.uk/evilwm/doc/ChangeLog

README was updated, the LICENSE part bumped the year to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/evilwm/evilwm.hash | 4 ++--
 package/evilwm/evilwm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evilwm/evilwm.hash b/package/evilwm/evilwm.hash
index 7fede9641f..f34b84e5a7 100644
--- a/package/evilwm/evilwm.hash
+++ b/package/evilwm/evilwm.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4  evilwm-1.4.3.tar.gz
-sha256  e98134d702e297c35e2b1150918a2b0cffea523f67644fa64e8dbb823fb55986  README
+sha256  6104852413e6d50669361dcadda5a25d39e2b2b0c95a6384022c905957a2740f  evilwm-1.5.tar.gz
+sha256  0863b8912894e6688c8ceb9a600983640099d68396e2fe0c5f08cf772dd18c09  README
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 12934427b9..0c5d414ef1 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVILWM_VERSION = 1.4.3
+EVILWM_VERSION = 1.5
 EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
 EVILWM_LICENSE = evilwm license
 EVILWM_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
