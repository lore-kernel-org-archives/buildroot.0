Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2AEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 212EA4213E;
	Fri, 13 Feb 2026 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E62ItfIaUWbQ; Fri, 13 Feb 2026 19:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56CE4213F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011537;
	bh=TO3URNWZcDJMiuTzS4VoSlhEYHERZJ03o5ceMCDPY/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RsjUlR/bSNifTXphtrs6Op238LQiRtXWicAlHttdNlkyIcDrDWJUp4m9NmOTSTc/6
	 4GTRml37Sy4xVdcdTpIb3eh1Nc8p5w7StS7rQmBBp6pn6OzQZBVAri7rP+gDckJ1gu
	 XUBtab7HVu62csxod8Ed8xaivTKb8cfNA92/suk3nKl4DMb2GCM59su62Eook3Y1wP
	 z+thrqvG9ZQ17gRJCtSKDIKhkay0W3EMMekcqgWP10Gu6Fj4eJhPvUCuxLO/XXIuHK
	 GQaNdEkhYsMNZGj3j85R8PrJGzCrDQts8utSKTlLkmYgtu1VE3w5Wuw58LRRAtC3sY
	 SdD718yIi2QTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C56CE4213F;
	Fri, 13 Feb 2026 19:38:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE2B7EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F4E4130F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJjppVM0tBPh for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9588E41310
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9588E41310
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ACDD825CC; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: da873e5a114de478b7d4cc4d5ba2ea6ca6b06193
X-Git-Newrev: 2cdadeb453023db1ef6cd1a1513d9548e0e20768
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.8ACDD825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mp4v2: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2cdadeb453023db1ef6cd1a1513d9548e0e20768
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `mp4v2:mp4v2` is valid for the package mp4v2. See the latest
CVE: CVE-2023-33719 that reference the upstream repository.

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-33719

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5a03ffed801f5558e334d0e0000668d6e3355af0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mp4v2/mp4v2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index ae777cdc75..8d8e184b99 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -12,6 +12,8 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
 
+MP4V2_CPE_ID_VENDOR = mp4v2
+
 # help2man expects to be able to run utilities on the build machine to
 # grab --help output which doesn't work when cross compiling, so
 # disable it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
