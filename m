Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F6FE95A7A
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2869F60B52;
	Tue, 30 Dec 2025 10:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6v36AzxVdT0C; Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CE9660B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092263;
	bh=PsxGLXXA0jzrdTQ9XcIjskGzfDNR6xLLXe/knEFsc8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMYo3cEV21beDlRp8LMManLddMCrU5LJCcevk3BkHDVTAiBcjjICdlYYzvCMJWyGC
	 nfH/KrnUiZlNUk6RvN63mzd55R5P5pd07Lsj6z+2cpjgStziWcTd7zhhrvDkuZtCPA
	 VdukqKFlhi39qKgHzWZ3SAyKKzVhOG+uT/uFf+7qBm7q9UnPQBokf0fAxZ6B3QjLT1
	 UYCsDs5ZrRiFBmGfJBsVozS6+Ol8Cvnf9ZXvGk7RLaPtsCfgS0U1Eg0zeUf53TXFeb
	 0+nmyXDxcKk9qdFJZJMT6fjK85f0Hx4rs292qA37wLHVPdi1uWHcjbGtiWcNjZbqgI
	 5rA/dqzym95NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE9660B15;
	Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E13375
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02D3F60A64
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIMGtmKwMimn for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6E56082C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E6E56082C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CC3387BD1; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fc37d7c6e8320679eff6bf7a602e3bd5b486e6b
X-Git-Newrev: b3007ebcaf4736dde948a43ea6f8abee6b83c8c5
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.3CC3387BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3007ebcaf4736dde948a43ea6f8abee6b83c8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NVD DB is now correctly tracking the vulnerability starting version
3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
needed.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
[2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freerdp/freerdp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 391b9a4675..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
-# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
-# the affected code is new with 3.x, was not there on 2.x
-FREERDP_IGNORE_CVES += CVE-2025-4478
-
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
