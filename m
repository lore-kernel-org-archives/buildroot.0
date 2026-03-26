Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4342610ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D39E612BA;
	Fri, 27 Mar 2026 10:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqKXpnFdkggr; Fri, 27 Mar 2026 10:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3902E612DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605720;
	bh=ZaP77l75Z1iDt3qN228nXDmBiQwOPn/Da0TwWAScO5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YFHZCKjAm31a0K/0JTLwS/WRrsE+/yjuqdSihlqjQNgQKkMI/tn3wtNHxVdMr/PdE
	 hrjO2Lo1EPUC4AkEamhU+CGnEwKvi889ofPx5OC581kDHVkYn6EOFHAmvu7GF6lD8H
	 CvMipQ9Pz8zC0dxii44+5Exk3HSWwo2tDI7OEBkc+tuBfz5P0QwzIZ6tvQmp/s3OCL
	 cyKgZAIssJtNVp+mIGyj2F+B3yvJbL9LS259a5TcWKQpTxxTZKRnkx1NVp4eb+ZMbH
	 nUAVP0MqO1NgUu+zZJoANEZlumKAr+2bVufbZ0i5ttR3qiK23boOkCpLB5fkQL2VT9
	 klD22jzQk+1xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3902E612DB;
	Fri, 27 Mar 2026 10:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6B82249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C74940BDD
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1AABmbEPhBJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E8B440BE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8B440BE3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C24F97FBB8; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:08:05 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4712caeeb67f292bb985973aca6bf319ff672a81
X-Git-Newrev: 6578fd1729ddf58848d108871fbc361f91207c36
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.C24F97FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mpd: add missing
 optional dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6578fd1729ddf58848d108871fbc361f91207c36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Config.in selects libiconv in certain situations (uClibc with locales
not enabled). This may lead to a build error with utils/test-pkg -p mpd.

Add missing optional dependency and restore sorting order.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 83e637d7cc30d398fbba4217478b02ec41fd0601)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/mpd.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a8e30f714c..3dbe6c1686 100644
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
