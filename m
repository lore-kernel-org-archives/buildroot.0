Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531BE8782D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E216D83D1C;
	Tue,  3 Feb 2026 13:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jJRp9EVZUSx; Tue,  3 Feb 2026 13:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60AD83D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126333;
	bh=xonTY3QpnJ7d9wX4+LjeMbVhr0RdEwIUGHyIVOHU73E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S069ER7YNrECvMJHORhSRkHlG/YVU3WNxB7A314tEJ4Ixnw9QPk+i++Jdhj+FNbDC
	 aZT7lBXDnvjbndbQkbEIn3L+I25r2nYbtXGbY/3PtowLXCGAw0rnngpEMVbuQ3Kn0x
	 wSRLQIcwZupqaYl3slG6/VGo6ttWnxHKXWHiQcWMoXmA1lE3yCcfxtm5Q2poPewusE
	 LFjYAMYOWiVmP7k3Bd6P0Zotoe1h+VntzRi5Z3YrStCfBdGcqd/yTKcX1wFt+nrM/K
	 eJjW31r3zCXPElgP2CJA/z7vQLHElfBEHsrUp0HXhsepEZet5KHwEHto1By1d6Nlzq
	 iVyevfrg25klA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60AD83D1D;
	Tue,  3 Feb 2026 13:45:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D948F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 303E240B1F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfJzNQBwAlQn for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC0B409B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC0B409B6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D149F8669A; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a03ffed801f5558e334d0e0000668d6e3355af0
X-Git-Newrev: 7bcad09c029bd66cf7ae819e7a2a332025cb7837
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.D149F8669A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/easy-rsa: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bcad09c029bd66cf7ae819e7a2a332025cb7837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE `openvpn:easy-rsa` is valid for the EasyRsa package. The last
CVE is CVE-2024-13454 [1] that is reference in the upstream bug tracker
[2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-13454
[2] https://github.com/OpenVPN/easy-rsa/issues/1122

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/easy-rsa/easy-rsa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 7266943f5b..2d70dfd05f 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -10,6 +10,8 @@ EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RS
 EASY_RSA_LICENSE = GPL-2.0
 EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
 
+EASY_RSA_CPE_ID_VENDOR = openvpn
+
 # shell script, so no build step
 
 define EASY_RSA_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
