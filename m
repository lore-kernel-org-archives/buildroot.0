Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B1EC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E9140952;
	Fri, 10 Jul 2026 13:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUyQywFW0i40; Fri, 10 Jul 2026 13:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9952B40A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691011;
	bh=dGJOgrvxHvn8apPp46OV8KIGbNVIOF5f7Q4QEU7qyD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ItWSdCoSz3jAeiZgsFWvpHlsWI69fuxlLkD7EuZcIjQjiyY4MMT3jX8u7EE8ZWGCA
	 rWItDxzkng0PHCRbl9xBH5HoXWio2Z5nDCneps2uI/PyN8ozlSrU0hslxvBMAZ8wes
	 xsENd/5xL30gjxleA8X7GzkyOmN6O1P3fuJvnUxpknErGd2CIA4ls/iqSrZEzQ1uPa
	 kO/imjH2tnFl4vWBArQc0iupInrNGLSaiLWAjHjpb1lp2cVKhwT7Lsw9yKXqtna6wG
	 4v30yqWqzvtvtVMJXgZWMXnsMx+/mee3kt8RhdYiU91OLqFU3QbEDvTfrRIKYL14T8
	 OFl4U4wZBIaVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9952B40A29;
	Fri, 10 Jul 2026 13:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E100EFD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1902408F7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2w7NoJ6RkDm for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B507B408F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B507B408F3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA3688864C; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:59:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a15fd3a1e3a5ecf94e2637c851d1c26030761c8
X-Git-Newrev: 7508b24b8f1b5788b27863c17f9383035ca4f364
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.EA3688864C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hwdata: bump
 version to 0.409
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7508b24b8f1b5788b27863c17f9383035ca4f364
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/vcrhonek/hwdata/releases/tag/v0.409
https://github.com/vcrhonek/hwdata/releases/tag/v0.408
https://github.com/vcrhonek/hwdata/releases/tag/v0.407

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a34e6a1938040d95372f81da0a8a1d699754d066)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 8eb0597a98..74a7f5e7e7 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1166f733c57afa82cfdad56e62ef044835fbc8c99ef65f033e6a5802716b5c66  hwdata-0.395.tar.gz
+sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 4de227b650..7300b908b1 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.395
+HWDATA_VERSION = 0.409
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
