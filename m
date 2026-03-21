Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54578F483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26FC5821D1;
	Mon, 23 Mar 2026 19:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NJtSRD5unfE; Mon, 23 Mar 2026 19:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41566822A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295285;
	bh=QPHQMcpVT9JubYuRMyMd3ldpKo6nKw4ZktqSYV2wiUQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J0eWZWNr58IWbcYW2pHj9xx8aPsLe/mZsjextWaLoUf5u8m7hNSL9DrbjBdFfe3m5
	 eDSbJoSAb4ojQmYQ8Din3rnkVllP/+uk1oSf4lKUGjNoIQ6jRcmdhmp5iOyhTZ/aN8
	 0knWEpVXNQfbMfCnKwCpaj6xpV8hEByp9mPi5n5lSZn2/SBUaBdyhbdybTovQy6dgA
	 +AGpUhZtC+59hmz68Mv1lbn/Yx0RSxxXAYG5OWkAFGvT+8z/brzv4RVqpG0hleqmVx
	 6t2Bvgci0sIdSsC2wtX6/r0pfXAw+ZabkX7ryLmWLTmpbI58Z/21thnsnvWFgVt1TC
	 3Mg+cTkWLTmWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41566822A6;
	Mon, 23 Mar 2026 19:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42DD7353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A8664027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYCj7IgtmE_A for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8023540281
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8023540281
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD10A84C72; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 22:59:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7e2050d54b9059ecc205e580b11e1fd38521dcc
X-Git-Newrev: 83e637d7cc30d398fbba4217478b02ec41fd0601
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.DD10A84C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: add missing optional
 dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83e637d7cc30d398fbba4217478b02ec41fd0601
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Config.in selects libiconv in certain situations (uClibc with locales
not enabled). This may lead to a build error with utils/test-pkg -p mpd.

Add missing optional dependency and restore sorting order.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c8107be128..ce7c44a9a8 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -26,14 +26,6 @@ MPD_CONF_OPTS = \
 	-Dpipewire=disabled \
 	-Dsnapcast=false
 
-# Zeroconf support depends on libdns_sd from avahi.
-ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
-MPD_DEPENDENCIES += avahi
-MPD_CONF_OPTS += -Dzeroconf=avahi
-else
-MPD_CONF_OPTS += -Dzeroconf=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 MPD_DEPENDENCIES += expat
 MPD_CONF_OPTS += -Dexpat=enabled
@@ -49,6 +41,14 @@ else
 MPD_CONF_OPTS += -Dicu=disabled
 endif
 
+# uClibc w/o locales
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPD_DEPENDENCIES += libiconv
+MPD_CONF_OPTS += -Diconv=enabled
+else
+MPD_CONF_OPTS += -Diconv=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
 MPD_DEPENDENCIES += json-for-modern-cpp
 MPD_CONF_OPTS += -Dnlohmann_json=enabled
@@ -63,6 +63,14 @@ else
 MPD_CONF_OPTS += -Dalsa=disabled
 endif
 
+# Zeroconf support depends on libdns_sd from avahi.
+ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
+MPD_DEPENDENCIES += avahi
+MPD_CONF_OPTS += -Dzeroconf=avahi
+else
+MPD_CONF_OPTS += -Dzeroconf=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
 MPD_CONF_OPTS += -Dao=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
