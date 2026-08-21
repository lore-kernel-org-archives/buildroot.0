Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138BBC5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11B760A89;
	Fri, 21 Aug 2026 19:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4wNrnbkSv5U; Fri, 21 Aug 2026 19:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787339196;
	bh=i3AsHaJvPU1SNnVqj66x0uSdyvjE6/RshE1t8eI56bg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAy4TkW8qlcPD1Wt+IutysIpZSj6NJvMm6lZnwmhvLCoS32ZlNH9+7cXswjZxpoip
	 izCuTiAposQYhwOVnZg5EaRaz64jjB+Kl66z+OuuztCYbvQYE8s8iOA1GE4NmB57NT
	 4Et4sdqZKJHwuGxNu3JDg5T5vygA9Jx+curIgSUsW7C9T8y/R7TDN/V7adqe07rqme
	 aP+ImsR3FXnLzmIzAxWPKDeZErJoBd2NcJOGYPH4a59X+cA8ehP+0IKn36rWTqW4sV
	 sTBzuVxCvu7VeHRR+bqhadCNNkPFc/GypEJc8AkEdWUjEwiX7wqfiL2v0+RtLU+U/z
	 EusDFkMA6Jlww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5DD60870;
	Fri, 21 Aug 2026 19:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38FD493F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221B640123
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-u_XQHfviYN for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0F94011F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C88238E287; Fri, 21 Aug 2026 19:05:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 20:59:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 772ff404c5bd114279e08281193f921be69ea10a
X-Git-Newrev: 4788039a894ed8a8041a5719c6acf1c2b3faa8d1
X-Patchwork-Hint: ignore
Message-Id: <20260821190540.C88238E287@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: fix build with examples
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4788039a894ed8a8041a5719c6acf1c2b3faa8d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Some examples embed CSP views, whose C++ sources are generated at build
time by drogon_ctl. When cross-compiling, CMake looks the tool up in
PATH, so the build fails with:

  [ 77%] Generating HelloView.h, HelloView.cc
  /bin/sh: 1: drogon_ctl: not found
  make[3]: *** [examples/CMakeFiles/helloworld.dir/build.make:74: examples/HelloView.h] Error 127

Add host-drogon to the dependencies, as it installs drogon_ctl in
$(HOST_DIR)/bin.

Fixes:
- https://autobuild.buildroot.org/results/b8f38b0645932cb5506515d6d313b64d824c8ce0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/drogon/drogon.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 89b1b2720c..73388ea92c 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -41,6 +41,11 @@ DROGON_CONF_OPTS += -DBUILD_CTL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_DROGON_EXAMPLES),y)
+# Some examples embed CSP views, whose C++ sources are generated at
+# build time by drogon_ctl. When cross-compiling, CMake does not
+# substitute the drogon_ctl target executable in the custom command, so
+# the tool is looked up in PATH and must be provided by host-drogon.
+DROGON_DEPENDENCIES += host-drogon
 DROGON_CONF_OPTS += -DBUILD_EXAMPLES=ON
 else
 DROGON_CONF_OPTS += -DBUILD_EXAMPLES=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
