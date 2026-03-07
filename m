Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A336F5510A
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C2A41983;
	Sat,  7 Mar 2026 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggTd3B1U5IBI; Sat,  7 Mar 2026 21:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48E64419A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919884;
	bh=GuI70N8jtXfqHWCrEMx9ZpGk+vFjFE3f1VlAEkF0mlc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qsfYICEsYXsnstoe9d2hRygNeZhl7Xxl65ZnWjFwLhYrL99C+CEh+CPdEl9cjjavL
	 woFBndNkjNZr+uFoto/qixtCbnp23zlfBkfJHT2NG5dB12GuFKDaDgxm4ka3Ku3+2R
	 GeNH/CF7tqRvvgimG/1eiPm5rsjlPFlh6FPIcYpWFGwdmyGRKerFr2b07/xKN0EECx
	 sdvyqHK1eeaG6rxSw89Xdmi8V80ozSm9vk6hbYe5cD+H6plQ81Eb+x7PsUo6m08uy2
	 /qSq90nom1xbi6u7w76IJRU4jtT5SKns4c67vQgLu74lDDwlEg3ciS880hsS627abF
	 axUiFFMYuVX7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E64419A2;
	Sat,  7 Mar 2026 21:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19789158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B304403FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mu2RWGXokzAb for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D40940075
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D40940075
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CEBF83E42; Sat,  7 Mar 2026 21:44:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 22:39:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ed5af5288d3092c80e376cc260e7f2794363eae
X-Git-Newrev: 04120910b9964ed6ec1d4cf352a4c5ee6c48c8df
X-Patchwork-Hint: ignore
Message-Id: <20260307214442.6CEBF83E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.6.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04120910b9964ed6ec1d4cf352a4c5ee6c48c8df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/releases/tag/v2.6.18
https://github.com/OpenVPN/openvpn/releases/tag/v2.6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 1fad2163c8..d172689685 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370  openvpn-2.6.17.tar.gz
+sha256  13702526f687c18b2540c1a3f2e189187baaa65211edcf7ff6772fa69f0536cf  openvpn-2.6.19.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9740374bee..9dc4ef4714 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.17
+OPENVPN_VERSION = 2.6.19
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
