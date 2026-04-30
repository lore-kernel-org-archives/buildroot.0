Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B59CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EFC36150B;
	Mon,  4 May 2026 14:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3-8r_aPh_Ez; Mon,  4 May 2026 14:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746F161516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906013;
	bh=hsQG6KQpYX0XozA3IhDbXpmPP7FbxsuS7+LrKAoIzdk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Km0R9wI38lKp5ae/CHbMiWS8hJlAcHDBxVm5p56UMGYl0r1BBNe20nT5YBJCw58wE
	 9Ogga8UDdhzIEtzWvmcNfu9X2/hpnonfVeP/Gf5mfbYbIADhJyhynXHBaYACeGPbOV
	 0dt0sNwU2tdKl5yoRgTgqkbDj32UiqIvYReAkU+LPRVCAmygAPDbOiUcyEVCLKJkqi
	 /SgEDXbI+n5IEbylSPvsqToUXXVCulNvF5nK3mU58COZTcuVeS/yc/xiiElmqB+Xo8
	 13x9WuGMSbKqdbhMSLg7fgnCAn+cyFjltKjBhK2QqZtKPNUlUG6InHE55A+LTukdl3
	 cdUblG42bTAAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 746F161516;
	Mon,  4 May 2026 14:46:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3006130A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CB8844AE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9b6dcrkxD_5 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC06F845AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC06F845AB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A04EF84272; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:04:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ea54a338751d967061287e315cad6124bd6acd58
X-Git-Newrev: ae34d39c8d4057581a84b91426de059badb54263
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.A04EF84272@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvpn: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae34d39c8d4057581a84b91426de059badb54263
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 0123babe4b..957537dde6 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
+sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0175c51d63..a117f6ee8c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.16
+OPENVPN_VERSION = 2.6.20
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
