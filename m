Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CD8C531F8
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 16:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E950940AA6;
	Thu, 23 Jul 2026 16:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0icSFTnS9Fl; Thu, 23 Jul 2026 16:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F9040AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784825210;
	bh=pnDDcs1XuccCfMP3qltAnTZcn6mA3ghhGW3NXIZqi/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L+f25Fd/MPqhe3L5x1KDoQX9gsQfxzne88CGLQvVfnPrZwsEbm9oacXIHWBZZFbSl
	 k+DOu1rDGTEdzXdTs4rFZ4gaMjhU4Tpl3vYN5CICNgwgd4lEsc4O84LvLpJTWh06qw
	 dLV5T2xeuACyraiHXAZ1+LJRlDKLSiayX5+ujO3+rt+BqFaQTjy13PSOyX51BHVmeN
	 eFBjmVNViqTIlRwolygbNfwmZDnhxZ+FoK1k+qKnnmokv4eVzXqqmXSBkPjvGXk6kZ
	 4tYrPmIpVUUsLsuvabbu++pQiloZlHCxxQAAOtre5W2hQkdXiX6Q9jwtptEJ1v9djQ
	 VjdoN6SIYlNbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F9040AA3;
	Thu, 23 Jul 2026 16:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A05A7347
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F13810FF
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ft84AW5ENsnE for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 16:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC8481101
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DC8481101
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 611818A3F5; Thu, 23 Jul 2026 16:46:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 18:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a17921b60cd4a7e237287c791812a93164de11e
X-Git-Newrev: 32d1ebf9fc6b311cda598ea7b585bb695437b3ff
X-Patchwork-Hint: ignore
Message-Id: <20260723164608.611818A3F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agec: use correct SPDX license
 identifier
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32d1ebf9fc6b311cda598ea7b585bb695437b3ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BSD-0-Clause is not a recognized SPDX license identifier. The LICENSE
file matches the 0BSD license text [1].

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/agec/agec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agec/agec.mk b/package/agec/agec.mk
index b19eac94a4..b9a3d0b5f1 100644
--- a/package/agec/agec.mk
+++ b/package/agec/agec.mk
@@ -7,7 +7,7 @@
 AGEC_VERSION = 0.1.0
 AGEC_SOURCE = $(AGEC_VERSION).tar.gz
 AGEC_SITE = https://git.sr.ht/~min/agec/archive
-AGEC_LICENSE = BSD-0-Clause
+AGEC_LICENSE = 0BSD
 AGEC_LICENSE_FILES = LICENSE
 AGEC_DEPENDENCIES = host-pkgconf openssl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
