Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE21EDF150
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 11:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C60840988;
	Fri, 13 Feb 2026 11:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7tNjbLl_bKq; Fri, 13 Feb 2026 11:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B476740AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770981156;
	bh=DHSlpdxbDEYCrvp0ACFZNBQeJo56xTdIb03m/5u6XIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qDFMhEE18F1vELE+zEptSOl+VXJbF0I6ahAiNfkHCHGFMs0uq0si1KkH7RB5uPxYL
	 Cra6JIpg3OYCsM8paLfPlhZBqbBPbdPfvZX0RbQd44k2lhIzwu0kJlSm7KN3W5SYbv
	 pKlJsKW6AyaFOoWaA57Y7cJy5Nlc+sPJQp4fEVsHkP0NmPj9orWs0HLEFUj3aSpBKY
	 B/+7+zFCgvekL7yzh/xU7/qQHClRkeog45viyNT4+9x0BwxahRvhieYCVB0KynId2i
	 c+BGEz5FhjVQbo4N64i3+Vj1OkwO3RN3KOj9Ydx9ma1DDWOyq2zaWRtMFpvNdIUTzs
	 Jjx7hjsioSH+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B476740AA1;
	Fri, 13 Feb 2026 11:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50756EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DFEA40FDB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wP0dYCesNoo for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E1FE40208
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E1FE40208
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B12886D57; Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 11:53:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95ffe208b087699d923f048ae8e29bffb587b1f
X-Git-Newrev: 70a16560b21cc8a911031b0457f4159a3eb14cb7
X-Patchwork-Hint: ignore
Message-Id: <20260213111234.8B12886D57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: fix ENABLE_ESMTP flag
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70a16560b21cc8a911031b0457f4159a3eb14cb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
