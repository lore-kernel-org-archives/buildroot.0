Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9828D374A2
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274AA84C35;
	Fri,  5 Dec 2025 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQwgooQOBHy9; Fri,  5 Dec 2025 21:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0C584C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968556;
	bh=3SdnCJbKsX4Rf47yLKaLGw+ZJTwlNP0MyjZ/BFOy/rg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hgGS76UH1YTlgNOJZ1hv++jezHOnelaZY3bxfEi+aTcTsod54VT1HhQDHyk7OByfU
	 PlVEhd0wWB7dG6HWydx9WMi3TvCjM39TUgTAJC9+ATHY2x4irPxdpInmZuUMEHKOVr
	 FKiOsSpE304C//QJjpP/VHjY+GELZUvP748v9gjEXZwtQEp68+ANuwB7Qy9jsJw9zY
	 yNUnVglgp+H4F3PxHBC9zbtth44Pfrn1v1Xo2N7jbFOjMIKWtVMzQOMW+JR6oGXZ0E
	 Kn0n+huo/AP2xNwCWbAHL5NcVAF26kgOKtQpEeN2XULpALdQwOiFm0twZ1J2KKixyJ
	 X4Gbv747QWFCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD0C584C2B;
	Fri,  5 Dec 2025 21:02:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68AF8368
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F9D9607E5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2bKrH1jmP2g for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68B1606EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A68B1606EF
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97446865F4; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 22:02:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 181242dfe8d5f9d39f3d9d503b5dde0818667186
X-Git-Newrev: c522cd914a621d1ef2d68b0ad3fe7bb23a79c558
X-Patchwork-Hint: ignore
Message-Id: <20251205210233.97446865F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix typo in
 migrating-golang-packages
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c522cd914a621d1ef2d68b0ad3fe7bb23a79c558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 00230e7 "package/pkg-golang: catch use of legacy FOO_INSTALL_BINS"
introduced a small typo, fixing that.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/migrating.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 130d7a1012..9ded46bfa2 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -227,4 +227,4 @@ your kernel or use an alternative network manager.
 === Migrating to 2025.11
 In 2025.11, the +FOO_INSTALL_BINS+ variable for golang packages is no longer
 supported; the list of binaries to install is automatically derived from
-the +FOO_BULD_TARGETS+ variable.
+the +FOO_BUILD_TARGETS+ variable.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
