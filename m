Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C02EC44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F9EA406EA;
	Mon, 20 Jul 2026 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZbJT4iGGw_9; Mon, 20 Jul 2026 20:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61C3406DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578617;
	bh=M2jkPhit6ZFxOPabhHETlZSsnWL+rust20FbBqGsqq4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nawvbQS14IaBRRYS32NdyBla2qfN/33LNcjK2Wg8qTTntqfTzgYntm9td9W8lowyt
	 jzTDlWVFFjLGAxspX8L03NIfQk6GSYO58iUR3tefzzoop0cROJ6qSljW9x3C4Ol5IO
	 +/Q9FFtW2ZP00W+Tw23+wJ4xsCIdZKIlCBt/lujEnUZnil2ByhAZjqiiV4QVXtDDt1
	 2JK9Bxf840lDBwgcDTPNlcrplu+yJhhT1UqwRuZdrhwDcfwGlkkqb5/mWuqwl3lXlB
	 Ei3AKUz3TB85vjgcvJpjetmxepSW274EZ4L1ECLiCIdzsZ0/XrPv3S0OxuJwlY74QH
	 4++eHSePthV9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61C3406DF;
	Mon, 20 Jul 2026 20:16:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6837786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86B240099
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1UDGXMi5IIw for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 169C540194
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169C540194
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 400A88907E; Mon, 20 Jul 2026 20:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 22:13:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c2b14a8b5537b23ad5beda705427d4943ba72e3
X-Git-Newrev: 9a77d5547afd32123eee493d42eeacf041c5a980
X-Patchwork-Hint: ignore
Message-Id: <20260720201616.400A88907E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettle: clarify license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a77d5547afd32123eee493d42eeacf041c5a980
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Nettle manual (nettle.html in the source archive) states:

> Nettle is dual licenced under the GNU General Public License version
> 2 or later, and the GNU Lesser General Public License version 3 or
> later. When using Nettle, you must comply fully with all conditions
> of at least one of these licenses. [...]

This means "or" is the correct description. Ellipsis covers a note
that a few files are licensed more permissively.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 93c638a4cd..dbbd60622d 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -8,7 +8,7 @@ NETTLE_VERSION = 3.10.2
 NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
+NETTLE_LICENSE = GPL-2.0+ or LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 NETTLE_CPE_ID_VALID = YES
 # don't include openssl support for (unused) examples as it has problems
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
