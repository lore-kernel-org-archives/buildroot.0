Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA3ECD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5338E615D1;
	Mon,  4 May 2026 14:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-LnJLCzAbuF; Mon,  4 May 2026 14:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CBDB615D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906131;
	bh=UO22kMaqUGEjXNCeEIJNC6tFhvz5H2Wl+Heo7IIc6GA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qk4QbiGKXdhfjOAd/Tn7+W07fvaxqdbopYQYl5lDzqnN/za2E5HijUT1fwwrx0TYK
	 MzfTGe33tatlapAh5vyF30v8nu8fgyqQ6PAx6ZiweS22vKV1Dr2RY6pzc8ud9KEO0j
	 C3vn19tjVNnsIvUFF9y+vrmDRxRSMWq+mifjf0LDdJ5MxhZwb7gOP6+vB/maIQ9TQt
	 2Bgv0OEsPjvdtL/ju6iuZBDqzs8/urB9v8xCBGzt0U+tpY9oh6vreP/k9Zx6avs6g8
	 UgqjBEFcJEyZ2yI/tp0vb/oibovvyWJmr7MNlkRoF3TkcdOkg+l63GrTlBPiGh7EaN
	 2AKlwXK6YVqkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CBDB615D7;
	Mon,  4 May 2026 14:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9959E25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FAFD40B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THMkiuQQU0YB for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0AB74079C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0AB74079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 780FB8435A; Mon,  4 May 2026 14:48:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:06:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5578590f1eb131b6e2f20346d70f43c6ea5ed4ff
X-Git-Newrev: a07b4bb16ae32559fb336be5c6454a101cebda76
X-Patchwork-Hint: ignore
Message-Id: <20260504144841.780FB8435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/openvpn: security
 bump to v2.6.20
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a07b4bb16ae32559fb336be5c6454a101cebda76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

See the release notes:
https://github.com/OpenVPN/openvpn/blob/v2.6.20/Changes.rst

This fixes 2 security issues:
- CVE-2026-40215:
    race condition in TLS handshake that could lead to leaking of packet
    data from a previous handshake under specific circumstances
- CVE-2026-35058:
    server ASSERT() on receiving a suitably malformed packet with a valid
    tls-crypt-v2 key

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 1a4a04fe29ccad76159765143e221bb6fd2d598c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 1fad2163c8..957537dde6 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370  openvpn-2.6.17.tar.gz
+sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9740374bee..a117f6ee8c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.17
+OPENVPN_VERSION = 2.6.20
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
