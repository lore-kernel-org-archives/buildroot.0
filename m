Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069EA1077604
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D1E41714;
	Wed, 18 Mar 2026 18:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5wUgrnstLTr; Wed, 18 Mar 2026 18:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD5E41710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859195;
	bh=0ht4ud0OjzDRlr222afZvGMvvOgLFy7waLkEgGus2bc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BmrFe2bb7cYGkZdn4NsaFazvuyU5TjF3AXe5n1g4gGeGB1U7gOIvXwVtb9YYbznmZ
	 5aJN3IzMeJCg7USNXlD3OYqJ3k6GoN4C6DLotEh/FO6oxLH4XEJBA6VrXkU5pGhSo6
	 dmJaqymJghR1LDn5KLIIup/w40WsRDx1o1Y+l7FOx/zBxl1jAr0bnnS57sFEuPTlWk
	 ot23LCCT78Z68a5CBbNpQ8b26+THSlwO9VkMUWt+pDvRcP5QqfWA2dmd+N8yT4er5F
	 iZUff4zwokJAxIqoGMqf43gUDocQ4pNiYGN/xaZLMjQvjnPzILuAAjEYRbCBLFb6Et
	 AIPEoAd9ggoCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBD5E41710;
	Wed, 18 Mar 2026 18:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A021B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00DB060BC8
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCHVTycnNNko for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2132960B72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2132960B72
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E19F84AC7; Wed, 18 Mar 2026 18:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:13:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75f62dc6693abd7f3880a75bd22b43e0ef74e12e
X-Git-Newrev: f341554ee617a466fd3129c8448a9012aaadeb44
X-Patchwork-Hint: ignore
Message-Id: <20260318182146.8E19F84AC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: Bump version to 10.5.3
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
Content-Type: multipart/mixed; boundary="===============8708515437161089753=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8708515437161089753==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f341554ee617a466fd3129c8448a9012aaadeb44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v10.5.1, see:
https://github.com/FRRouting/frr/releases/tag/frr-10.5.2
https://github.com/FRRouting/frr/releases/tag/frr-10.5.3

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index e89b5042a9..349c56fc24 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fcdd1d326b2ebd1cc4b607fe1681d476865371ac0028fc5595a75c00f370189e  frr-10.5.1.tar.gz
+sha256  ecc95009b88e66df2c91be02fbf0a3eb8e1de434fd652e0cbf46f19126f708ec  frr-10.5.3.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 04282442fb..61a34de4d3 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.5.1
+FRR_VERSION = 10.5.3
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \

--===============8708515437161089753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8708515437161089753==--
