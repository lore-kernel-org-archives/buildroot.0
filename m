Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82A5D6CFA5
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 20:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7011826EA;
	Thu, 22 Jan 2026 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlKZE2dQ1DwR; Thu, 22 Jan 2026 20:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87531826DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769113905;
	bh=gKw6cAxPv47xcB10uzm5kBeCjrEJPuE/E7m70MXq9zo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zy0eZen/fUEG7MXFC3DMEdCXE42pRJwj5U706Tkj0WwLqJpwTyC1L2CTv7CCi7lnq
	 oMMHUpsmD4eqH0XZ7lssP+uXrl5L/rOC82MxR5EDvDvtPVIgZlxSapEqYCbWWPPe37
	 bLrfNTSHyJ+9RQgvuBBrip2qCRxOFA7clifarY5EaSMTmmNFGDJt7AFAjQYh3Vo37K
	 BEFqWNRm4XUw5n+kYzVEUG8mtMjf3c57+DRDeOAmVSyH7EbN66vkcxTiCevfxBlOqG
	 pTTVOdsx8fxNzvheM76aw9vo3aYjiI8L3G08ozxMDE2Ddn5ctLKXPR6Oxtra3WkLe/
	 mT7GIdMUj2ypw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87531826DA;
	Thu, 22 Jan 2026 20:31:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A71122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B46CF40A16
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAF0eprNvRn0 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 20:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05D9840A11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D9840A11
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:31:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E45F0875A7; Thu, 22 Jan 2026 20:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 21:15:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6860a94a09b42b896fd2a5a1f437cd1aa1a357a5
X-Git-Newrev: bb556b1e1f5cf356cae34276837c39f26ce67329
X-Patchwork-Hint: ignore
Message-Id: <20260122203143.E45F0875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: bump version to 37
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb556b1e1f5cf356cae34276837c39f26ce67329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/bus1/dbus-broker/releases/tag/v37

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dbus-broker/dbus-broker.hash | 2 +-
 package/dbus-broker/dbus-broker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index fd4f43d16e..f4abd668d3 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b  dbus-broker-36.tar.xz
+sha256  f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b  dbus-broker-37.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
 sha256  ce7b8b8fb05126e556b3f9ed97fe21aa654e4ff411c00a9fd219ecbaae26abe0  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 0bbdd304af..7e029879f9 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 36
+DBUS_BROKER_VERSION = 37
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
