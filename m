Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E9C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D3C40B0E;
	Fri, 17 Jul 2026 15:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRL1Ss0TwJCS; Fri, 17 Jul 2026 15:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5432740AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303171;
	bh=7f28D5M/SwXt5ZXVz9Et/oZIOLcG+z7w/JfE6E9udUg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eg9fzwitIabxv0OycePQtJdp3Y2CgUxa69jJW8mCNxb19MJrCqasIyR17fW9rjp+4
	 m7U6/mabt4xmni5bHkEt2MaACMUvjQjhR2BrmR+RSV2rwQB1k84WcCHValakutYA74
	 Wy/y+NP+4wN04D3AMcYwdWVxV/6NZ7Ve9tjAe/0B1hXVaVOnl8uuxlPWDPu8k2HDrJ
	 ybQ4QG/Z02vALplpxkLbCam/hKHw8JOOUq/YjQ1ZLY/+HTkDtJEnxi56iEM2RDAP1f
	 cJZ+7jQE4cXKCWvPwgSlMV/Bepo/F010XgDhZ6hEJyhDB8oWHYxW8RwuAJkifvP4Tw
	 xxWcDPcy9q+zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5432740AE6;
	Fri, 17 Jul 2026 15:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB3A36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2B040626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGLuru5jNqSX for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4125409C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4125409C4
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9499088E51; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 10:52:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 47ece003cd44fd635a875e0437593840fe86b286
X-Git-Newrev: 237e81130ac00d5e1996591d982bea7e2076f61a
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.9499088E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dropbear:
 security bump version to 2026.92
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/237e81130ac00d5e1996591d982bea7e2076f61a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://matt.ucc.asn.au/dropbear/CHANGES

- Security: server: Don't allow -B (accept blank password) with
  -t (two factor auth). If run with -t and -B a user configured with a
  blank password would be allowed to log in without pubkey auth.
  https://github.com/mkj/dropbear/commit/23ec78285639edf068d86bb96f91cba755039740
  Reported by nvidia

- Security: server: Fix parsing of long authorized_keys lines.
  The remainder of a long line would be handled as the start of a new line.
  In the case where external programs add semi-trusted public keys to
  authorized_keys, a crafted key might bypass restrictions such as "command=".
  https://github.com/mkj/dropbear/commit/8d8e1930b866eb44135ae393a793cbeb03b6b9d6
  Reported by nvidia

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ce9ed75bbcc12dd8dc4dee2bdbaffe2f8bf240f8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 31ac153b89..9df81ea4b5 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
+sha256  91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e  dropbear-2026.92.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a7de8432af..e7e6703057 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.91
+DROPBEAR_VERSION = 2026.92
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
