Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B7C5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86444408E8;
	Thu,  6 Aug 2026 22:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olEBDbnge8yI; Thu,  6 Aug 2026 22:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B6E408E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053742;
	bh=HZGvDhVIRyp4iea74u3nIMb9KT18bwmARjsnuknA+hA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qPBdj8yEnK+eZzTf36EcjUvAP6jjiX+N8kr9zcRqvZ9C555wxPwVw35lJchUKr+ud
	 81flTQX0RAa6vvGHQqy7fsVeDjZLQZyuoz8DuiSvRh4PaIpkLGttig2jej2ER0IuR2
	 T9Jt2XkbDXmpepVe/mTa1c8RV8lDED3jjdYKR8bAFTRAIBcokdTlCaqR42x5CFxJBU
	 IIzJwm6K2xAp2OOdJ7bq8Vzr1MmbtVND5lEnf3QozbT6ttmoUnPvSxE4oYR1yAhx/x
	 PnT3KuOydGtfk7iyHkWEs1nPeRzkMyg83KWhbAHUK36+Zeki2Uq6feLk3m93xitGKr
	 U17uP4ViMDZEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B6E408E9;
	Thu,  6 Aug 2026 22:02:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4BEA392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB1F4024C
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig2kYQZgsuGL for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22E540118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22E540118
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AD158CA20; Thu,  6 Aug 2026 22:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Aug 2026 23:21:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 209117f1dd8a833c8a588c6fdffcff30abb1eaf3
X-Git-Newrev: dab2b762346b17cf0671599604dfbd0847ba1122
X-Patchwork-Hint: ignore
Message-Id: <20260806220129.9AD158CA20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: security bump version to
 2.7.6
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dab2b762346b17cf0671599604dfbd0847ba1122
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.6/Changes.rst

Fixes CVE-2026-63649 & CVE-2026-63650.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 651f430534..3822b8c5e9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
+sha256  10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74  openvpn-2.7.6.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d5fd308e63..e543610563 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.5
+OPENVPN_VERSION = 2.7.6
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
