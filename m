Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC7FCD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED37405E9;
	Tue,  5 May 2026 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J_69_LlpPE9; Tue,  5 May 2026 19:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E095A405D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010839;
	bh=Z2h+8uUlswXpSCnGNSbyZFcL9joypiOk48NHrsRddp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=anl8BeIsgXAOyTqtZkekEWvDQjOmr3NNKpa7JXooPxaZ8bPduQ/cisyl3UZMKaABR
	 4cCW9LbdrUDpNT6Vftj6Y+qkMu4MT12+Tt+ASu0UMCLyuh1//pmMghJd1ns9ugNdiJ
	 d3GnnMhew8pYLzzDOwLuanbDrq3Z3E71WxNJJeHqdPuT4HIQ+i2SjTP9cBRTuh/gYc
	 qzfFSQZ4qmAUPVFoK6b8UG5RL1I+VNibquBGPAR91g5kElbGyU6KbRdCOb20IT8csU
	 ge30cDHphBiXSGZLJnjTmVidNFXRvPh0MSghwtP3wtyX59i1QSTtAdQlhjCFB4B9eV
	 muuJylU3qPFqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E095A405D0;
	Tue,  5 May 2026 19:53:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79DEA280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C11840BB3
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UW-5CXXSTkk for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C245240BB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C245240BB1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E44768464B; Tue,  5 May 2026 19:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ab95cf0eea0349f91b82faf7308ad04ba9bcabb
X-Git-Newrev: e8dcebf4597d74dc12c86535118ae0bd16d272a0
X-Patchwork-Hint: ignore
Message-Id: <20260505195355.E44768464B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix host/target
 infra filter
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8dcebf4597d74dc12c86535118ae0bd16d272a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The filter is supposed to exclude host/target infra from output if the
respective package is not built with the current
configuration.

However, excluding host packages did not work correctly: If keep_host
is False because the host package is not built, the next branch was
checked and included the host infra in output with "target" type if
the target package is built. For a package that support host and
target build, but gets built only for the target, this leads to output
like (Meson example):

meson (target)
host-meson (target)

Skip host infra in the target branch instead. Also include
Package.infra in Package.__str__() result, which was needed for
debugging this bug.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a87bb23a8e..bbd1e3e6f0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -205,7 +205,7 @@ class Package:
                 infra = match.group(1)
                 if infra.startswith("host-") and keep_host:
                     self.infras.append(("host", infra[5:]))
-                elif keep_target:
+                elif not infra.startswith("host-") and keep_target:
                     self.infras.append(("target", infra))
 
     def set_license(self):
@@ -342,9 +342,10 @@ class Package:
         return self.path < other.path
 
     def __str__(self):
-        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
             (self.name, self.path, self.is_status_ok('license'),
-             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
+             self.infras)
 
 
 def get_pkglist(trees, npackages, package_list):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
