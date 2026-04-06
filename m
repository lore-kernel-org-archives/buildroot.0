Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3125F46C76
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 19:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88C260BC9;
	Mon,  6 Apr 2026 19:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Tg1-dLY0wPv; Mon,  6 Apr 2026 19:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A3D60BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775502468;
	bh=m32VjOUnBxt5t6GokWFxFYF6fR78yd616G3vuOGj3q4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sMis3maL8HHIJui62ybT8q7dZX71GoVhsjM6yON1i/1vjaGLmtU/CNVcKPFKPxnmR
	 WXRaFxIGyTzF8hX0R5Jt/TEQoKGSA2lZaw50TT3MvuVS3ninJNC9JydhvGj0Hn9OXZ
	 f2DX405AL5hQqoVg73K8sr7FDoERfojlP5KOX5dTcJ1fwEqmUVfwtqJa4GQMNAp7w3
	 5wYuagHqurr9TKLIC3WRQSA4A0YjZ0TejeqhwGo2HuSi+CnH+kKr5d4qCT8OTFjpeJ
	 SJLo6sGIpjCKAs+VpZgXtHUyXL0eO0q0Sy07drbfPDkRjaJgIrWRspmgZSB7pQWHlC
	 QDN1/loqb49wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A3D60BB8;
	Mon,  6 Apr 2026 19:07:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B831EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B4480E5E
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYnl62XFNT8o for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 19:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D870580E5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D870580E5C
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:07:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C131804F6; Mon,  6 Apr 2026 19:07:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 21:02:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adf99a634b35763f77f3d2beda77319661de156e
X-Git-Newrev: 1b1018ce56347277f972c8596cd5518355af845e
X-Patchwork-Hint: ignore
Message-Id: <20260406190744.5C131804F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hyperfine: bump to version 1.20.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b1018ce56347277f972c8596cd5518355af845e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/sharkdp/hyperfine/blob/v1.20.0/CHANGELOG.md

Update hyperfine from 1.19.0 to 1.20.0.
This release adds the --reference-name option, extends
--ignore-failure to accept comma-separated exit codes, adds
improvements to the bundled Python scripts, and fixes command naming
with parameter scans.

Refresh the vendored cargo tarball hash for the new release.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien:
 - remove quote in commit title
 - add link to changelog
 - update DEVELOPERS file in a separate commit
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index ca3bb41a89..e0408ee79d 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9fb27f85472255c40f0ac24a932fae3cb5836cc99558d1f7a36a66e937be45a6  hyperfine-1.19.0-cargo4.tar.gz
+sha256  64644b26342ebd44ad455ee7750809e424aff084bad403d04d713d729b020934  hyperfine-1.20.0-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 7ab25fd4f1..8af6e0298a 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.19.0
+HYPERFINE_VERSION = 1.20.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
