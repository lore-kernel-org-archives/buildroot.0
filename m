Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD2CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7934441111;
	Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opT-kc_2SZhm; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815F141118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263452;
	bh=h5VelAb2s7T0n6tNtOxczXWI+ycR76YBHZjkK+1X/S4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iVOR/57y88e1bkc4sqcwA840cJ6ma0vzeYf4JKg1rh9u1s0cfNoA4skjVyveIFFFM
	 /dzrnoDEeZlyxK6/gSzj0D0fptyrCWWnY8l47JeQE1OWRXQH+L0lmMyZQWp4nGghF1
	 8aMQOsLLlJ9DWnHKTT4oDwmLGrv31RwLMw2wEBHEzI30nFAINjQTPixowoOdnvFjoe
	 MLzQp8kGd/SY4ClblFEwxWjhR9ZHb9AFVfpkuaI6+EZ0mYOaJmyB67zQTGMlfjCLvr
	 uj3m39yhDGvDQxVLP6lwq7zGgXmz3mjlWVtC0cd5uBghdxsix0SM4HujjQR6rMvjMe
	 3pFv8Nk1w2ZOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815F141118;
	Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40A3F237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25CEC60F36
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EMZSusjS5T3 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D33860EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D33860EA8
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35556880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:09:35 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bdfdeea8e1cd6a87565cc738e32ff221e1f33f35
X-Git-Newrev: cf5072ec131c937f22184f27329cb1dabc040804
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.35556880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/zsh: correct
 download URL after 5.9.1 release
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf5072ec131c937f22184f27329cb1dabc040804
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/

>>> zsh 5.9 Downloading
wget -nd -t 3 --no-check-certificate -O '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
URL transformed to HTTPS due to an HSTS policy
--2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2026-06-01 01:46:36 ERROR 404: Not Found.

zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved under
old/, so update ZSH_SITE to match.

https://zsh.sourceforge.io/News/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92cdec5a54a009ece181eaaa6446fadef0303a66)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 7e577fa9e1..b18788417c 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZSH_VERSION = 5.9
-ZSH_SITE = http://www.zsh.org/pub
+ZSH_SITE = http://www.zsh.org/pub/old
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
