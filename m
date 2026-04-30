Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D84CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B82261376;
	Mon,  4 May 2026 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KTNWLYmQ7M5; Mon,  4 May 2026 14:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D03861527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906023;
	bh=Vdyu9r5qTmk0wz8a3Z6PWRE8x/DM7RR8sRx1uk67Zjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KPwDguDzEnjt/QY11anvsHjnX1dcykfigbJSjvZ7DUw86nlsCDnqyirKzSIbslQGm
	 TrsU+dJBEQrekac9iN94721ldoXEZBQGYmhWvF3TBxFL+HoKJuboitXJxoevhz3GRY
	 eI1LrwrRKE87N1fgnvU0Ew4ZkhBoMs7zRwMeZozq5XxlAninh8IOchbuZSYwjAHyxp
	 fSBsaORvRBNykxHQxJrGlzskumC67gd8u4Dif39dx6i8r73e6eMs4jGTH4LmG2RSpv
	 YmrJjCua0hP6o8NuHiK0zE6AwX0WAb2Nr6jGUIx4w4u/7ORqungvyOgCq8UFYsOzZY
	 W5/IJNpoHYg/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D03861527;
	Mon,  4 May 2026 14:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E01B30A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A85844A8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zyg0A6v8DlE0 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3CB844D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3CB844D6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50C358423F; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:58:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ffdaa44c1f4060df2288572f292f698fa8640c35
X-Git-Newrev: 51237f6cf263b2df94be5a2a6a9f4cb9bd68b2a8
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.50C358423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/log4cxx: fix
 ENABLE_ESMTP flag
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51237f6cf263b2df94be5a2a6a9f4cb9bd68b2a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

commit cf686670b99ae0388b27867db64516c09b2de91f introduced a patch that
was later included in a release which made the usage of libesmtp
configurable. Later the switch was moved to the main CMakeLists.mk [0].

while the patch introduced the build flag LOG4CXX_ENABLE_ESMTP the
change to the .mk file used LOG4CXX_ENABLE_LIBESMTP.

So correct this.

Fixes:
CMake Warning:
  Manually-specified variables were not used by the project:
  LOG4CXX_ENABLE_LIBESMTP

[0] https://github.com/apache/logging-log4cxx/blob/rel/v1.3.1/CMakeLists.txt#L93

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 70a16560b21cc8a911031b0457f4159a3eb14cb7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/log4cxx/log4cxx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 2d8d57a612..4b85adbf92 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -23,10 +23,10 @@ LOG4CXX_DEPENDENCIES += boost
 endif
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=ON
 LOG4CXX_DEPENDENCIES += libesmtp
 else
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
