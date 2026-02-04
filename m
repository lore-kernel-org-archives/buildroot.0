Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0196E9D408
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B8A360AE1;
	Wed,  4 Feb 2026 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdXU9VANR92i; Wed,  4 Feb 2026 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D91E60DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770221392;
	bh=qY2yzV8dkTj2aIAzPL2dDYoHyWsPFZeVJq72WWMcwvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eFnD7ATIkATLpTjpY/pfiG4P2rSgIruI1eMUKs2GxmXjx9dG/fA+kMkaYX1Wi2r2O
	 pIkowOfxczyzDd66Im6wJuQn7ARK+RdryBRZvb+tGHkr4LCzxYYZYr1f79bqoAB5PH
	 dMLgfpihx9Z/TtBDqkpkyXiBn0csBxw60muJpcwCUNa5P6Twal9k8PL+RRlPAJ47sq
	 LrxAt/YdXDig2REfHlgQxpqL5XseA1ChsPLTL6esdjNZXhTHxlSBFq76mYO07Mnfmv
	 CNuVld6W757RG9zwd2WCn5x8KU2i/kUNE6PNZscHyXKtVBMzecxdPtTZhNdanWz9PB
	 RlO2HcVG8NPSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D91E60DC5;
	Wed,  4 Feb 2026 16:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E4B17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9336360E20
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmmBZbzD9frn for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B060E60DC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B060E60DC5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A37AF86940; Wed,  4 Feb 2026 16:09:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:09:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1634ee6d161ed478866ae620fd5dc8c774be94f3
X-Git-Newrev: 9668821a48d176d9b3373b7edd70846255a6c8a4
X-Patchwork-Hint: ignore
Message-Id: <20260204160949.A37AF86940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: enable ukify for host
 build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9668821a48d176d9b3373b7edd70846255a6c8a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ukify tool can be used to create Unified Kernel Images.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
[Arnout:
 - Remove the target option.
 - Use enabled/disabled instead of true/false.
 - Always enable for host build.
 - Add dependency on host-python-pefile.
]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/systemd/systemd.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6d04ee2581..6ab6586009 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -982,7 +982,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dukify=disabled \
+	-Dukify=enabled \
 	-Danalyze=false \
 	-Dbpf-framework=disabled \
 	-Dvmlinux-h=disabled \
@@ -1024,7 +1024,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-libcap \
 	host-libxcrypt \
 	host-gperf \
-	host-python-jinja2
+	host-python-jinja2 \
+	host-python-pefile
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
