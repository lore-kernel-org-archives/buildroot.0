Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF4CC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F6B7813EE;
	Thu, 13 Aug 2026 20:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ra5bYdgoggRK; Thu, 13 Aug 2026 20:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE7A813DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786652094;
	bh=AL/TjAtM3ckma1KZzWFrjAywGjU7WZr7a6IoK7NTwzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U2iJSRZmY29ARU2AXwTmfP3RY5qW3WSRAYqQ10DJKy2kXoBpuRmGLYIqYlKxsR5bA
	 Gy5qCBwuPFXytEg2h/0QVfLr2ahiVzvs7Gve+1xw9B0Rtz1RoPi2v9VWh7fjoCews5
	 KFxW0Yl6hzzyxdGzmk2ouOFRE1I4Ti+9H5fhcs9fqvekW48GbONOQ10LA15FQg5K4g
	 BjkZfXQ2AROiRVHTrJbGzqyxrCAT9xDoK2iUrRopY5+GhgoWjVeP/SuEO0G7DDzSAT
	 1p/TPGvcJM6smegMWPM2yeRHbuw6sHxtOzRdg71zP8c29M6wI6rYA7HXRVzeZ8Qont
	 fYW/kVMvOESPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE7A813DC;
	Thu, 13 Aug 2026 20:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE27139B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A8F400AB
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWxjyahdhbRz for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8416400A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8416400A1
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A2E58D56F; Thu, 13 Aug 2026 20:14:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:47:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1213189e81f82fa83e8055fecf99220cc184d924
X-Git-Newrev: 7b2e6578267d27f37e3a9c8cdc1d053ed862a88b
X-Patchwork-Hint: ignore
Message-Id: <20260813201401.2A2E58D56F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: security bump to version
 112
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b2e6578267d27f37e3a9c8cdc1d053ed862a88b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream changelog:
https://github.com/dracut-ng/dracut/releases/tag/112

The changelog lists multiple "security related commits", though only
one mentions a CVE: CVE-2026-6893 [1], which allows a malicious DHCP
server to inject code into shell scripts.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-6893

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 1b5b3dce55..3615c2af14 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca949190692e91611ef16ea3642c0f764f63948860f3f742524310728c991493  dracut-111.tar.gz
+sha256  839d21eb4bd27bb0ee40d74c9da46df088c2e1425fcd8c3ea62b7e3a3dd28a91  dracut-112.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 3a1c1567e8..0bd24d49f4 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 111
+DRACUT_VERSION = 112
 DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
