Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A5E7E368
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C908760A5A;
	Fri,  3 Apr 2026 10:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bTAqD7srS9T; Fri,  3 Apr 2026 10:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3AD660F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212031;
	bh=Z97Y87wsYJ5VSX4cvrDWVCUM3iwI1i5qdHdBJGvZPeM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XbVOAQXUCgUxpfVoJIqvUOx8MwvGjuysbHrNeRZGJGu71Umrhia1OpxYShezNr65A
	 PWFd5jXkRTtx08+JhbFfwdlXUkX/qMGyyWDV95ubc1MZyqQ11Xe+iKv29psCf/L6+D
	 PaJyJpmKzxVYrRiW+DDFvvv0nwURFZJjJcPaNmvwUorSbdnnMnJ/2PL2UfdjV7ROe9
	 HEo86kZEPDYJrgKV+JJEM+PpvF01wW4rBzY8uDe+1S3LneEKCgT8WZFlHv/lF4erLw
	 cgzrOZobrK1csjHdXV80TjE9yR5amFaN7LWx04uxR4UjLKoiONOul9P0Z5Oc5TBw5c
	 Qv3fSpU8qogxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AD660F06;
	Fri,  3 Apr 2026 10:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 290911A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3156D40E65
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sygGQ0FRPVgZ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D7740E60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75D7740E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00B057FFAA; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cf9b4eb348d69e0a561f43211efddb431d40199f
X-Git-Newrev: 5905cd590ccab0c01315dd46603a30ba96212682
X-Patchwork-Hint: ignore
Message-Id: <20260403102657.00B057FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] SECURITY.md: add new file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5905cd590ccab0c01315dd46603a30ba96212682
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
