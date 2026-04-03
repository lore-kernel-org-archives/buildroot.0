Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD8CE7E369
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7794A61298;
	Fri,  3 Apr 2026 10:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tub9SpHwPIVT; Fri,  3 Apr 2026 10:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAE96128E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212132;
	bh=ykEL8Km08He/Y4RH+psLqpIt+H5SMHc31a1vPIKduuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bbuJEIV/xkNipyH7kzkmvyGJPWbjiBDmAdiZhsEq+gbuQDTCu9RQ9WxEb58pGFHBz
	 bzkt2wf3Rtr/qhQKca3wFJ6swOx77zAuUMi2x4UFa5Vozt8NlJ05U4cGW7q0Us7ZG6
	 b9udmtcV3BIDn5MUArut4TUWVJ80VD17LBw/og6TOnJuWuGOVXEulJF/FavVSEkVbY
	 +EfeUpgEdgXTHCvk5GyWeFbe0Aa+0rN56Qoq1wKnT7SjIbLvuL3YgOmXYoxFgZgWSn
	 GB3Qz4ZLcB6YTWG4Ldp+T7oetUCw2uuxZLwpBDkfsgO7rh8JsvPwNI5v127LvZtSBm
	 85OFQpktr5veg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAE96128E;
	Fri,  3 Apr 2026 10:28:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0902CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E473E81C38
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBOGfn1-Cg3b for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BE581DE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22BE581DE5
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C647FFF8; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:05 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: dccfa5b18f46f8e84e08cd1ab0ff8d4e65c4d462
X-Git-Newrev: 6c09a5fee5c150ce4d1754afba1b59ba5e544c79
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.93C647FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] SECURITY.md: add new file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c09a5fee5c150ce4d1754afba1b59ba5e544c79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This is an in-tree description of Buildroot's security policies

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0ce674c2449fd506b4836a80ec0d78c2862d353d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 SECURITY.md | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000000..6b21ffd2b9
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,36 @@
+# Security Policy
+
+## Security advisories
+
+Advisories for Buildroot security vulnerabilities are reported on the
+developer's mailing list. A public archive can be consulted on
+https://lists.buildroot.org/mailman/listinfo/buildroot
+
+Buildroot itself has a CPE to track its published vulnerabilities:
+https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot
+
+The Buildroot project provides some ways for its users to track known
+vulnerabilites in the packages included in the generated images, see:
+- https://nightly.buildroot.org/manual.html#_details_about_packages
+
+In addition, detailed informations for all packages integrated with Buildroot
+are updated daily on the following public web pages:
+- https://security.buildroot.org/
+- https://autobuild.buildroot.org/stats/
+
+## Reporting a Vulnerability
+
+To report a security vulnerability found in the Buildroot build system itself,
+please send an email to [security@buildroot.org](mailto:security@buildroot.org).
+
+This is a private mailing list contacting the Buildroot maintainers only.
+
+## Vulnerabilities in packages
+
+Buildroot is a build system that cross-compiles packages from third-party
+sources. The Buildroot developers are not responsible for security
+vulnerabilities in these packages. Such vulnerabilities should be reported
+directly to the upstream project that maintains the affected package.
+
+When vulnerabilities are fixed upstream, send a patch to update the affected
+packages in Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
