Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065A8C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5CF812DF;
	Fri, 31 Jul 2026 11:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSvJA85lhnZ8; Fri, 31 Jul 2026 11:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3C281335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499120;
	bh=rlsdPhLGtfOcdwHhoAOJypoZzNiUqwtD/dmzKOWn+/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HAKIT9Puo5r1n5Y0Qtm7rcdO6DA8rtZhLMOQVoQIyBIFnO/4o0XolJU5ID8yxlluy
	 kD2VCyIwcs9avLspjSfOJ3tJrKYZ3GXx4nv4S6SGEbPBZY7HEqwE1Jgvs7GhVpB0U+
	 nxgVRB6pJgz0WHxWlcXRbAUMpgVkxY3c7cOdq8Z/I/xnqhhv3oy2WigfRn6M6aPYqw
	 dSmhNP8XEvCPWtur9U/xyu7y27xrLm4bdeRk4m2zNVFitFDgxVrb/YZOokS/AuNa5Y
	 EucQJxK8BRFlc8fo/D/GM5sZRNORMfXgq08BTXvP7CAqecMntgCUO/q/3V2pBdrm/N
	 6wUKGFw7q4IeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3C281335;
	Fri, 31 Jul 2026 11:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABFE27C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CEDE40F84
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxAsARvQCg52 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAF340FB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AAF340FB1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C0AF8B743; Fri, 31 Jul 2026 11:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 472efcd1765e7d634109faf0477492a4e2edcb21
X-Git-Newrev: 135fa553df943fd25846e68a8a94acdb20fe638a
X-Patchwork-Hint: ignore
Message-Id: <20260731115730.1C0AF8B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xz: fix license
 information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/135fa553df943fd25846e68a8a94acdb20fe638a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the source SPDX-License-Identifier headers, and the associated text
[1] matches the COPYING.0BSD file.

FSFUL and FSFULLR are the "few permissive licenses" of certain build
system files mentioned in COPYING.

Move "Public Domain" to the end of the list because it applies only to
a few files.

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15e2433e1f3e3d631c47495d1413d4a4ba25d815)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 205ab928a7..c07152ad92 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE = 0BSD, GPL-2.0+, GPL-3.0+, LGPL-2.1+, FSFUL, FSFULLR, Public Domain
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 # autoreconf needed to fix a musl static build failure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
