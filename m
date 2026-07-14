Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB3C44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B3580EBD;
	Tue, 14 Jul 2026 09:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFAHXipQnaws; Tue, 14 Jul 2026 09:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3691480E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021912;
	bh=5OUG8xBPSjUSlYWcz71Y4alJR2F4dfAWo2OPkgckDwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dOsCgosNOdErVPSSEsRSMMcHeBNw4wizMTL00b4t2R0HcSEpjaxHzy5IvIC2JHeRt
	 YkcA4fm5xnDbudOxlUcx2jv8bR5kZ0QDsZ0V0Q2vNOgbeK9waVJdFrR+iWSaKSXtBX
	 h9II+6kBxSKFvYJqPKPGjfWHW66g2PlKkylsFig4Ctu1HiylscPGTmqoEqbp8D1yhj
	 lzfpvHdtNZaSeqAQaSmVOwEtv3cC4v49RCp9r5K6B9NMVwpC4EMOrWQyOzUPvAv3Fb
	 e3n5DPojlKYwYi3BstdCqrwhf8hlFF2OJ2E1BuS/LgrMd6cwDjwNhezNCf3z4S2hMi
	 o/CATTucSV97A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3691480E41;
	Tue, 14 Jul 2026 09:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B73F96C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D0AC80E41
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgMHQu7DNvnM for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DF080B1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DF080B1E
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85A148885F; Tue, 14 Jul 2026 09:37:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:36:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe1f45c1330f5975722c416e4d1c518471e49307
X-Git-Newrev: 03d952c5e206c4fe92bce426eb02c628f2e92c2b
X-Patchwork-Hint: ignore
Message-Id: <20260714093755.85A148885F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: fix CPE_ID_VERSION
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03d952c5e206c4fe92bce426eb02c628f2e92c2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-25761

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/open62541/open62541.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 0d1abf724a..8d9c5e44bf 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.15
+OPEN62541_VERSION_UPSTREAM = 1.3.15
+OPEN62541_VERSION = v$(OPEN62541_VERSION_UPSTREAM)
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
@@ -12,6 +13,7 @@ OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CPE_ID_VENDOR = open62541
+OPEN62541_CPE_ID_VERSION = $(OPEN62541_VERSION_UPSTREAM)
 
 # Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
