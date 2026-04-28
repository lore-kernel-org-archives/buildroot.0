Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E37FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EEB83D61;
	Tue, 28 Apr 2026 19:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1WXKzkLZd7z; Tue, 28 Apr 2026 19:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604FA83DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777404258;
	bh=IW+nifqy47Mb66jHnWdjhRQAYOLsz85pShvDLAsuFd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VYYd67w5/yr/Cz6x8Qca933t+7iMrXHdQmOywRznEdhLPzQ3z235a9io22HDn36Ue
	 91MIDGvcnWzCuE/HQWR2awnZ2AWEeZ+hT08Oh7sczG2E3ne00feotWw9F5UqI8PB3g
	 Qkv9GcsLYJOwMXjzgbsLIr+QOkl1su/L7wlMaehzcQ/4PUzREjZpumCudKQcGyKpO+
	 vhQXlBsY1oS1vpO4LDsXGDDC2CJcZosDRNFUwMBskWV0lcK8Vdv+Cxq/f+NZvsyiRc
	 jzXskJfqqQc6ow8/TKxac/Z2NzZov0gEBq3y7o0MM4KAkX+1WjYLfEfE4Ym+KUzoAU
	 QlpC9FCNCxf1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604FA83DCC;
	Tue, 28 Apr 2026 19:24:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 443DA1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362D783DCC
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZAig1RE30Oi for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B90E83D61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B90E83D61
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11F80839BA; Tue, 28 Apr 2026 19:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:22:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f63384539a0cd0bcca9f703b227ff757a72f15d8
X-Git-Newrev: 9dc5998127f5cbc7e44bc44ce09ad62dea3928b0
X-Patchwork-Hint: ignore
Message-Id: <20260428192416.11F80839BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.7.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dc5998127f5cbc7e44bc44ce09ad62dea3928b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.3/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index edfd25bfc9..d2e72bbbc0 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  9c3e150a595fc9a375221f2fa9f10524a9c064536cf81c96e3ba66c735b86f26  openvpn-2.7.2.tar.gz
+sha256  24f54cb0759330762f1140b874c07c8542c6a08b13457d8570dafd387d49397a  openvpn-2.7.3.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 01e19b2627..7598c9430a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.2
+OPENVPN_VERSION = 2.7.3
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
