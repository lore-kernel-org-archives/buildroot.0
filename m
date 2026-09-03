Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4440BC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD4560BB2;
	Fri,  4 Sep 2026 11:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJW1-BxvmJ8l; Fri,  4 Sep 2026 11:16:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F0938606B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788520605;
	b=nL3P8S/rPVnwEKdHirIgYFg0BwVvT0w5bqDWgKXIqu8xn0Ha3w1V2sRobXKlE8TLUv1t
	 zPZ0tSQYBRHMCLbHb+7aZe0QOVx5eP7U+j/1n+9BqO1zbIA4/9hptrQ9/OG5pySLDOS2R
	 uCNfyQ4zn7irUbYe89aHCkWNGbLHXdZxocZ2Tbjd2clqr+Z8aYGSaSWIMNSzbG7dOe1b3
	 r1+vo4eGQo+3dSPWCgGvK+y6jQe5Cl4d2129KxqmnW8+LSK21P/vysk+HTXgnnPkF1Fbr
	 IsNxKteezSfTL4WW0+j1dXe6utnXf0Wt9aJfMc+59f12QT4CNKWX5rM2bjqAxI3wZGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788520605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FvU2T9wG43cpTvFClKOx1EOZ6pP0FQ8U7iwx+YZWHXc=;
	b=WTAy3sWITCBsn2klNV2D5NVLSZojqUpkpop/47rg1VgR2LdqOZ2+0F4aRtsG9wBKKi3Y
	 c6CjHFYicHcjA3XswEFHPSlNAR5TFGVYRc+r+A9HXX0zGt0eISOlKWpYZHkwFKCijJlqQ
	 quEPkGPEXqjxvOUJXRZtgNoqMEIyQq9Bpja4O38TTS2BK2cUjD9sIyRY8yFh2dKdyOyUw
	 R9CQGcsEL869Ew8xnPxvnQ+L69ejAUMG7WNeCzYBZgAzYCLH32uN1OykbwsObPQpMDtSa
	 BsOn5XLW/ipsJe+pfL5sgWxqHSxWl0UeVoy+Fw1fSOjkSzH4wZoAVKIzlb8X+98NOug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788520605;
	bh=FvU2T9wG43cpTvFClKOx1EOZ6pP0FQ8U7iwx+YZWHXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ue8tF+BLB+TDwAYvT2IRayVgQj7eqTCHo4KrrBNpuhrtljhhidwFDyqfZz6MalaPO
	 L9AM91lRlsMJB1AOKesRlfkqu8La0uD+Hrp2ECmzddcsqfD1nmt10vAfj6Q1N1vL+H
	 jOtsURvDi63zCAFvZEMVI7S0H3vY+S0yRJLCsq27hNmIlzUGXbnVl7sWJRREusZ8aq
	 7/3ZAVp/eIVgYpO7TKRh+lAfA8VLM3gAce3zxFrqX61NOEra2b1PhKz7LxVjlQlSSr
	 WtO+5X9QDoMxflEnnxRp2taqtZq8SM0q+fU59UeWrd6UCSwA6Rto7YUeCGo4dZ6CFm
	 k9/dTT+nggw7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0938606B0;
	Fri,  4 Sep 2026 11:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A59CE2FC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9835140388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gubN21RNrlcc for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ED51C4031A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788520603;
 b=NSduyg5RRnR9qrFgcMKd2mGTSRzeADWj9J4dj4Yr/iaNhRaSqYXirTZ6PY26hefvorSL
 lL6GnOqYeFcJjUCTfy+jEI8gRyLS2m1DHgZsh6Iqe9aXdsiy1mReRDsDg3qLUtt9b675p
 UFHcnp8citu5fhlYi82loRCAuc5+7lN1PpQ9IqNwiabY5G5sLkcss8oPNMEsQSXLAsNeN
 aQ/5/D+NQxw8mCpqPchPjER0apV7ALKlr2DbPCugfTXfyrc0LUavPz7l3+89wYyMHUP2T
 nn8NLOTN3o4tXH6TShR5UTXjTPFnplBeUiUkXx5tQq/XgOJ7BEleKvS0cMOPsTgcEAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788520603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M6csse6OJ0LIdPTiHNIqJwCb969mUEkuyUcO4w4riYY=;
 b=AFwA7N9Q37D37rMmG3BoQaGzJUwRmZoJa+B3CcBBPo0gov1BqYT1kN5EiewP5oAe8TJU
 98BQ9yGlCOz+Q6Wkon014JZF9CtZmoH3IYAUFTyzm8a3RLGmUmDaIGtjanCom9q/3s9eQ
 EF2kGhQqdC1fQZB3cxWBzGZQzqhb1ufdkzK6JJAY1LueNMPSuDMrKE7i9PHioo+APRTzD
 WQzJmUJLuAHxjcLdlVkOHCo4UW9aVtheizCwX8HIQ6Muyy3a7knZ33kKyinRxNDIcwWbh
 LKbcv/C9LKYg5HKBv6i+I0aHXGKvYGAu07AW/eVMCZpRjEeov0yA9aMFR7fCtWHU+Ig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED51C4031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8225894705; Fri,  4 Sep 2026 11:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Sep 2026 09:52:05 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 28d08f28a0edb410c041f0e26c19700defed7914
X-Git-Newrev: 13726d5e6bedcc561f4d1fd930b3f892436567e9
X-Patchwork-Hint: ignore
Message-Id: <20260904111542.8225894705@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/jpeg-turbo: use
 configure option WITH_{TESTS, TOOLS}
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13726d5e6bedcc561f4d1fd930b3f892436567e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
package to 3.1.2. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
which added configure options to disable the build of command-line
tools and tests.

This patch replaces the current _POST_INSTALL_TARGET_HOOK with the new
configure option and disables the build of tests.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d74a065a16be4e18e6c85ddf257c4f5ff033e6b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jpeg-turbo/jpeg-turbo.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index b00a71a231..72da56ffa8 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,7 +15,7 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON -DWITH_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -43,11 +43,10 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
-define JPEG_TURBO_REMOVE_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
-endef
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=ON
+else
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
