Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1CFD4337E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61AA82E9D;
	Fri, 12 Dec 2025 07:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJ4pif3K8xlU; Fri, 12 Dec 2025 07:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F05AA81AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526165;
	bh=H6tvEYOX3UO0h+EBg81kzA2pk53Kd+fQoLbAsXmyxgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cEe9lx2uFzFtMI57Lnwf4F0mCQvOXI+s/8+PdHPNf4ojYBpHWh8+1BEK2HDQASql9
	 cFcYZngdqgcDl653CkEC0zj+bCC+pgnmAm3w+YJbZ8EDdQy7cbGzSJaVzRy56+ELYB
	 UX74XH+//qjNcXhOsTtVqegq9bcma5hfSi0omoSDvZ/GyVo5cwlpRZs2WvPouIIzVT
	 L8+084UKAts5I+f6Ytn50VjQzVbXwlY9kmoKFZTE0csrBVtAiM3RypKi5ZPuGIie39
	 gKtBjwAFog4jnsGRRin8piStpIuvCBD0tS4IbOPI9l+7yMn//a/d7zelqiZC4EwUyW
	 3Q/LVhIBaF3Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05AA81AF4;
	Fri, 12 Dec 2025 07:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22635E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FD74024C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Voj3CnkUppo9 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BAE440154
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BAE440154
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CB7A86CA3; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:20:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 182d67255d895eaf5d256cc1ef4dcd70f14b2a03
X-Git-Newrev: 6caa5c7bfb2c0f8613e879a07a7ce358c7542f7e
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.6CB7A86CA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-rcw: bump to version
 lf-6.12.34-2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6caa5c7bfb2c0f8613e879a07a7ce358c7542f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 1bdd38446d..99dd860e02 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cf1caf7f45989025f8564c5edd9c98650082ebb2d091239292d3db8d75522164  qoriq-rcw-lf-6.12.20-2.0.0.tar.gz
+sha256  5106d0e42a990b5474100cbc397d27f550bb226420664ac5a40b952706b680cd  qoriq-rcw-lf-6.12.34-2.1.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 35602e41e4..1394766b92 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.20-2.0.0
+QORIQ_RCW_VERSION = lf-6.12.34-2.1.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
