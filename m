Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E87CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A23F0852C8;
	Sat, 30 May 2026 10:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNH4RSpmbH1o; Sat, 30 May 2026 10:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7F6852BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137154;
	bh=qPxwn7E+y3A+SE//6qdVzsycJ16JKsWY4pdXR8hzXrw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hCxjkSdJiiBcxrmkoYQu6B//9lGn+px/k8i4vP1XQvwXNOg8nk1kT9I1IO7XBM9yg
	 jtk1JcwfQP3rseGvfWH+ME1gZhIdjhwuljOWKlml46InES5LXcqQlKLcqhQTfqTO52
	 lgcRf550SH9vjkynT7RfK7hczoHgpj04y6jflfc6pDW513NudRrT2Aj1KOfM+xp+Xk
	 /+9QQSOFna5sE63SusrfS7IQ2Pk94laJs19f59Tp7ysvNXJUaxHIIjb8SNCmOHeUO0
	 SNrMD2GMGXLMPKrNjK2/2JmYH8Y5QtdFTDArSQRC5EyPkTdMWR2bMTNPMzb6OHyuCE
	 L16ifqUyE/8VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7F6852BD;
	Sat, 30 May 2026 10:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC04F12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF1B852BD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5vytNNzkgGs for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B83A852B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B83A852B7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:32:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E4F187472; Sat, 30 May 2026 10:32:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:20:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4868e0dd621013ff3d3b6e81a86d0d981ae21646
X-Git-Newrev: 23e70547ca1746c638a4e327548eefeb205faeff
X-Patchwork-Hint: ignore
Message-Id: <20260530103220.0E4F187472@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: change the
 default to GDB 16.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23e70547ca1746c638a4e327548eefeb205faeff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a2caa3d58a..fe639a4019 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_15 if !BR2_arc
+	default BR2_GDB_VERSION_16 if !BR2_arc
 	default BR2_GDB_VERSION_ARC if BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -78,7 +78,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2024.12-release-gdb" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "16.3"	   if BR2_GDB_VERSION_16
+	default "15.2"	   if BR2_GDB_VERSION_15
+	default "16.3"	   if BR2_GDB_VERSION_16 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "17.1"	   if BR2_GDB_VERSION_17
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
