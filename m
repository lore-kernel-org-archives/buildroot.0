Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23893EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5666844BF;
	Fri, 13 Feb 2026 19:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48PSGiC-6ZKJ; Fri, 13 Feb 2026 19:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0563F84570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011344;
	bh=T7T/e53No249/DI1Jb6VJ1qOYRL/Z9jipDD6cNDobSI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lGMe01+PwJgjHiRdrHhS24PcSSBm07yrKWeyxRDz7yUGsiPmec2BZ4Pw+wbb7qXLB
	 TEZw89UdgDX1xWyUuSE4f49o0sY1fYKbIhDq7cUi4wDkV92hHed8PFS64i26Kj89hC
	 W0buHoxVn30637XtOWcousriUExXfNuu4d+Kut5zK2UcFoABtB/EniR8PmOkJpIXrP
	 SGE6Z/kzzI9oqskaSIWSrAiC2mRQlFNsPVZHtIc49yON/bD0PsZPq+OmYZZ3FkIj5+
	 wn1ZUxPBcNpIfDsleBtPhhHWei/+Frh0ZpHc5r4o70aQvyze1e+FRaxtAQoHhEELQ0
	 QRSAJw5KLNruA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0563F84570;
	Fri, 13 Feb 2026 19:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0661EEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A078441E42
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNaknqgeoNUJ for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F8341E1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99F8341E1E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ECF6811EA; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:16:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 51c4b7884178909346c3aa39ce39fce4a47173c7
X-Git-Newrev: d3976bd05b9dc5fa593b8c4128561f2534955732
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.8ECF6811EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgpiod2: enable
 gpioset interactive when libedit is available
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3976bd05b9dc5fa593b8c4128561f2534955732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3df8b35285cff60e96b4ca5c852c2a07a551197f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpiod2/libgpiod2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index e73f8d699f..de88084f29 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
