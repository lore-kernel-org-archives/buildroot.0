Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF76EE937EA
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED3D61689;
	Sun, 12 Apr 2026 16:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1r9k_IrR6as; Sun, 12 Apr 2026 16:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C866163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776010685;
	bh=vynqKYHnW64oOKasnZNUDZeXtq9DY2YKEGEwLYTmLUo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gYadIyrzbqGiuaDdHmb+sdTvvtOWlcPOfDQ79eOMh1B5ZYajE1vGg0LIJPJMTfdPq
	 9h3uz1WbU+PaVkmtMcsvcc68oFgn1dCiOfZYeC1Jyrsxk4Bffv63bfDCXlM40qEVZX
	 4VofmrpRUQow75SQpaFw6v+phGAkfXR5RQAnZ+BaWZwM44K4Ti+pqmG1Cc9ndGPAPh
	 f2wmjDF1GRDfXAMXJB3VjPrbjYFGcs/qFZfQ0JYcPxlCIdBFgPbvVH4+GikhJIJUYW
	 d6In46PX59rLG0WTlgC4kFvKqO19+YiGu5oqAkp90Dd06mqCnkxMwxhk31kBgcqIXW
	 h0hm/3BYN+KoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C866163D;
	Sun, 12 Apr 2026 16:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9CA4237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B537183DAF
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNVjdiiHQlf5 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F1383DB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F1383DB5
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D8E6810E5; Sun, 12 Apr 2026 16:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 18:02:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e7886acfc5be2bb67fc87a1b4bfc8a8d2a16421
X-Git-Newrev: 19370808a2aa8243c18d2ed1712057686e3c9640
X-Patchwork-Hint: ignore
Message-Id: <20260412161801.5D8E6810E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waf: bump to v2.1.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19370808a2aa8243c18d2ed1712057686e3c9640
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This contains some minor bugfixes and enhancements, see the release notes
https://gitlab.com/ita1024/waf/blob/waf-2.1.9/ChangeLog

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 061a093c55..12dd57a4e2 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  d11579fb088200adc5e6bf6c96e31fcb7afd94cb  waf-2.1.6
-sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf-2.1.6
+sha1  40033ed0306c210f4e8d6e6cd5cb0592acec55c3  waf-2.1.9
+sha256  e235eeac6d34f039834e355a738298416a92a17defd1b6e1eae48488ba4a6864  waf-2.1.9
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf
+sha256  e235eeac6d34f039834e355a738298416a92a17defd1b6e1eae48488ba4a6864  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 911dcc5fc6..13d088d54e 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.6
+WAF_VERSION = 2.1.9
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
