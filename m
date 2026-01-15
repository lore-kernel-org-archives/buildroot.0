Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1604CCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99C481C18;
	Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1E0-3rIDUqQl; Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E1F81CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816849;
	bh=4fA95cFMXYbfQH9k89M7esHYbt10AVf1vA08LjrBUGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WByaA4mdfwTTail6LkaNIqxopPGSyvRPjHPSTR6ss9m/bg0Sr4lH6lcGVCx22ZkWY
	 4B0HNg2RUR+dQBnPfCyq2ksxycDWVA2hyLqUaNYiJC3Dby3KMEOabOEjPqYI35UXSR
	 dUSPz2vk6T0o+Zfq6peowWwJ1eeJDGsdTwki8iNftNTYDOA2u9Xn+agQ3HSV7N1k8L
	 CqJSzyfELYTYin3vx7+wkafD7wfOzjjd68By54iLQhzayyuG5BBR8gaJdUNtyquxbI
	 NnHv+Xsr159jdYk2t6S8AaHRpj30iOhivNkqL5Y4RXuViIkFoQg3CAipy5gObxyuGG
	 f8WIMry514jQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E1F81CAF;
	Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1E5347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16F5D60D6E
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dd2mWcXxH15 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705D660C14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 705D660C14
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 628E1885CF; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:14:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c4ac35c600121aeebfee87e5821140b00fa0523a
X-Git-Newrev: f89a71d3066d205642530d98c0544569cb07c957
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.628E1885CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libgtk3: remove
 schema compile hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=f89a71d3066d205642530d98c0544569cb07c957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9ce4dd52fd062c593483cedcd5f0aad4861d4ea)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgtk3/libgtk3.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index be24869d3d..cbe49b8716 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -87,13 +87,6 @@ else
 LIBGTK3_CONF_OPTS += -Dtests=false -Dinstalled_tests=false
 endif
 
-define LIBGTK3_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-
-LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
-
 # gtk+ >= 3.10 can build a native version of gtk-update-icon-cache if
 # --enable-gtk2-dependency=no is set when invoking './configure'.
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
