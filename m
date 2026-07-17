Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6AC44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B626340A92;
	Fri, 17 Jul 2026 15:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s_TLlTiuwnC; Fri, 17 Jul 2026 15:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E1940A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303082;
	bh=UCfTOeK7Zmb06IH9JypvgwMU9iG8B4sg/ymnPMJ44lw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DKho/97erzXPx46mW/zM8HDG+gqS6OsWHtbZfMJNjlJGbdJ+L+pONAcy94XUOWoOm
	 ogr5Q2It0A05iGC6QmB6z2qLTEFpE/snLlEHbQVWk/gF9cuoFdI0Iby1ee/FojXBqD
	 ta4KZz+7DKI4JL1RUanjyCIleIZuhYrvxgt39BI+r+31ibbrIAeZMf2TvuQuu4HKLe
	 k8xRDBWItXHs7kJN3uqSDKwI57iugecHMep7ljWS979X3pajVUuOX6YvEbpI58JHL2
	 //m//R4l3cjQHXeEQ03JPo/TqvfzHJC+dt+jvtctN1W7Q/Ex1kfKS7q/5u25jogANc
	 xFksu98re5ERw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E1940A89;
	Fri, 17 Jul 2026 15:44:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0703F1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E232F40056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIGbS6aWvo0j for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC20740279
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC20740279
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B29688E52; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 10:52:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b115701c06ca7123d9bd37616bbeec5efc7174bf
X-Git-Newrev: a734a5f13b8b1f2692af5aeb61664ca49401271a
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.7B29688E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dropbear:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a734a5f13b8b1f2692af5aeb61664ca49401271a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
