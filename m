Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A304DCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC4060B2B;
	Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNWsJ1wgQaZy; Fri,  5 Jun 2026 12:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7436560B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663102;
	bh=EoIzfWaZ3p1+dsf3fzAK0Nw/r9PweGJFww/fZDYikm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ktIgjW2H3R79N6rnmrySGsU7lVYCkAGJlPUXo/Fw5RAs7C1gZIUmsg7vl9Zc0CXe/
	 RtbzQapFXI9yduyShcCsjy4t2gUZGjFkmw65gcBTlfB4tX3SfKnQDFApwVvioWQMEN
	 fbnrzdceK7xQVMfd3aKRDr8AXUPb+/bttAVp98uUOkUlhnaOLkoM2W4hSMwkj6ktV8
	 KZfnbDEYVioFME7HUIV2PUDXWaoJLy5N5UaJurluk8htxOTzeabQqd5CfLE15iCdiP
	 M9Aa2SFPgqf8FINP3lkDxFOqeygLvxYXqDgIRKZ43giUqDtEYybcOY1QnBJAEDeLCc
	 6Kzq9bz2K0/Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7436560B0E;
	Fri,  5 Jun 2026 12:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC46F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D9F081E92
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAMLB-HKy-Wh for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C78F8169F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C78F8169F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 967B687B3B; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a7bac29875330e562d7b3d77727115202100fa3
X-Git-Newrev: 491004290faab165d3d886ff1e5cdb00a88f9f6e
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.967B687B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgit2: add CPE
 vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/491004290faab165d3d886ff1e5cdb00a88f9f6e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
package.

The previous CPE hasn't been used since 2016 while the new one has 10
new CVEs assigned to it.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
[2] https://nvd.nist.gov/vuln/detail/cve-2024-24577

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e166708e1e686491d5555578380a2923e21f6c28)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgit2/libgit2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..02af500a65 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
 	BSD-2-Clause (basename_r), \
 	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VALID = YES
+LIBGIT2_CPE_ID_VENDOR = libgit2
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
