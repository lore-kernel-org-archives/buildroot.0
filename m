Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C366C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EDE583C46;
	Thu,  3 Jul 2025 20:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ytq8NCbG6Dvz; Thu,  3 Jul 2025 20:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A096783C2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A096783C2F;
	Thu,  3 Jul 2025 20:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A5415F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C80D4013F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH8Ejr8tu5bQ for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A711740050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A711740050
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84D7185CA3; Thu,  3 Jul 2025 20:50:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 22:49:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e868b974a799073428b7565925507697e049df0a
X-Git-Newrev: 8965024022d6c72a9297b13b08ceb95b959e837e
X-Patchwork-Hint: ignore
Message-Id: <20250703205046.84D7185CA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwupd: add CPE identifier
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

commit: https://git.buildroot.net/buildroot/commit/?id=8965024022d6c72a9297b13b08ceb95b959e837e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpe:2.3:a:fwupd:fwupd:*:*:*:*:*:*:*:* is valid for this package.

See https://nvd.nist.gov/products/cpe/detail/46E1E3C0-2F72-49BA-8374-1FBF203AE0F0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwupd/fwupd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
index b35f90839f..d143740c43 100644
--- a/package/fwupd/fwupd.mk
+++ b/package/fwupd/fwupd.mk
@@ -9,6 +9,7 @@ FWUPD_SITE = https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
 FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
 FWUPD_LICENSE = LGPL-2.1+
 FWUPD_LICENSE_FILES = COPYING
+FWUPD_CPE_ID_VENDOR = fwupd
 FWUPD_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-jinja2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
