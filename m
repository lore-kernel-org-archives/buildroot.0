Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFA2CD6E4C
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7380742EA2;
	Sat, 30 May 2026 09:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQu7DDVGTZoz; Sat, 30 May 2026 09:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C7A42E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131883;
	bh=zDkmsKt2FmGzG6YBWRelPpcqRaqqDJ+py0FXFNA/D30=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fcJUkzOW3jxDPJinNLcbaZYkjI/kkZGtNBc3O+cV/MPltYfUFHdCNiRlh2dN44gHr
	 5JcUYx6ZwupoLGwWHecM22rzoBXa2c7tuQWF6gflab/HW0czDPziMEfxsLTQ7R/fFo
	 4m1P4+XGrIlMwok7xW4PkzdYx2OWGoa9v9o74jc8bZUObco0jwXW1DEd7REdXzPZXy
	 a1OoCJHi8P6khiZaivC4SVWPIhhPtDDiHavG8CcryR/ABGm/ICq5+ljutTBI9aufUi
	 8hXuiANjLf5akcY/yXktr696VWLhQnXhW7jjDpSOoZBwEji8T+SZebB/cMGTlP4rtD
	 JEBq/KalExxoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C7A42E73;
	Sat, 30 May 2026 09:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32D46218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 127A940877
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmHYU-ePfaw8 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3536E407EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3536E407EC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D16B82914; Sat, 30 May 2026 09:04:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:00:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c3bc6609b1d08f0953f85f7101da68568d96e1c
X-Git-Newrev: e166708e1e686491d5555578380a2923e21f6c28
X-Patchwork-Hint: ignore
Message-Id: <20260530090423.2D16B82914@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: add CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e166708e1e686491d5555578380a2923e21f6c28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
package.

The previous CPE hasn't been used since 2016 while the new one has 10
new CVEs assigned to it.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
[2] https://nvd.nist.gov/vuln/detail/cve-2024-24577

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..02af500a65 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
 	BSD-2-Clause (basename_r), \
 	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VALID = YES
+LIBGIT2_CPE_ID_VENDOR = libgit2
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
