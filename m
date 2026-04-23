Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E22FDEE43
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A46E83260;
	Thu, 23 Apr 2026 19:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ote8kjtpUNe7; Thu, 23 Apr 2026 19:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B8F831E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776970904;
	bh=qP08GSu4T10ePDhB+GqwN1TNIgMSFapmdC9C+dEGilg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I2AE0DtVrRjDGBC2KZZ5sAUFefnnTy/pOekQc/e1X9xHcaEauIrja3bNDjJ1xjZuf
	 vJaXi429gD3XZrx3txdp7+tWjdAaYSapTaQjXLsqtYNrzXlCD0umK2//NJlnTz3fXc
	 MnJxNQ3QKoiXv1fXqF1kFXHAIi9Nx5x7lQXW2Jlm6cw9lYrRn0CYy5I9+p+bRN98g4
	 CGOBVViL0blV8bLk8rvF+xqCRpbjebyJjt5dCVkxAw52ctcxzazZ0Lf3nsJZ3a4ae6
	 OkjmuTgFk9iLmyOrnNFSUJMOVpqCUdw4z0kVcdwEv3X2pFkqIfd0v9MiBFEo9A7fUd
	 UxaOl1tM3YKKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B8F831E7;
	Thu, 23 Apr 2026 19:01:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D15224D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829C54025E
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UwKJgqWoGz6 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 915CE40892
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 915CE40892
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34A2C82801; Thu, 23 Apr 2026 19:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 20:58:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1de564d07ee79c7fce9674801481c33627e03b
X-Git-Newrev: 1a4a04fe29ccad76159765143e221bb6fd2d598c
X-Patchwork-Hint: ignore
Message-Id: <20260423190141.34A2C82801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: security bump version to
 2.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a4a04fe29ccad76159765143e221bb6fd2d598c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.2/Changes.rst

Fixes CVE-2026-40215 & CVE-2026-35058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d01cb73c98..edfd25bfc9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  9858477ec2894a8a672974d8650dcb1af2eeffb468981a2b619f0fa387081167  openvpn-2.7.1.tar.gz
+sha256  9c3e150a595fc9a375221f2fa9f10524a9c064536cf81c96e3ba66c735b86f26  openvpn-2.7.2.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3bc42f2db1..01e19b2627 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.1
+OPENVPN_VERSION = 2.7.2
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
