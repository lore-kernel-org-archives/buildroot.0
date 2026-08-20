Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9A2C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B01816E5;
	Fri, 21 Aug 2026 15:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecA1Q-14Gjnl; Fri, 21 Aug 2026 15:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325091;
	bh=6SuCLpzN072AtQxKOhDcODiAHHyuh/trZ3V/LWzdmCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X6FdfY0nwE9PaG1wvGRVoieHl4/2VE83g6kt471bkNJIHXmuqD6/2yPY/AdFpZ6Z6
	 /Eth8acc1hk9MnHAzIGhQD+cadWx/piwRVuTj4rJYeoaWot9CUGkxpG0wEVhYeL0O3
	 ud5QIOXLNqdQD7pru2zKY0wn43C8/qmQNvzTPCQ5TKez6l+4SRSufr8TPYJwcyRIIz
	 Q1ngQ04uWrfkrbc+qY76cIdxx8ZdH7bfxXIK4fwPdSCmn5UWT7IqRAwiO11nF8y9ac
	 2UrZWj9uZDbEDbq8+adxoLps870OdmKsc5tgp1iZ/03zIN1XPCiaKi5NS7UmpJiySG
	 Nez2hzE0IJeXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3118481628;
	Fri, 21 Aug 2026 15:11:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F291F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91852606A6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl2VQSsrXLZe for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECDA760666
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B0B38E13B; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 11:43:49 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 43d970f062dc98215046dd0ab864d0dfaa954923
X-Git-Newrev: 3ec5adfa6eef2e8aa850d75d6874a5c03cd85b30
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.6B0B38E13B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dracut: security
 bump to version 112
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ec5adfa6eef2e8aa850d75d6874a5c03cd85b30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Upstream changelog:
https://github.com/dracut-ng/dracut/releases/tag/112

The changelog lists multiple "security related commits", though only
one mentions a CVE: CVE-2026-6893 [1], which allows a malicious DHCP
server to inject code into shell scripts.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-6893

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7b2e6578267d27f37e3a9c8cdc1d053ed862a88b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 1b5b3dce55..3615c2af14 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca949190692e91611ef16ea3642c0f764f63948860f3f742524310728c991493  dracut-111.tar.gz
+sha256  839d21eb4bd27bb0ee40d74c9da46df088c2e1425fcd8c3ea62b7e3a3dd28a91  dracut-112.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 3a1c1567e8..0bd24d49f4 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 111
+DRACUT_VERSION = 112
 DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
