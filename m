Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D956C44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B461606C0;
	Sun, 19 Jul 2026 19:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0R_l8vzYCLdJ; Sun, 19 Jul 2026 19:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C8C6069E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489318;
	bh=DzrX2R1kVFa66SlHUer6jFwb0qHUdgiYJ/WfyMoncOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sluNWb/2DuV+uQkN0R226shmSpQTdQMNdTpXPqKVy3gtx+5EI9xzahRXfY9Jfo80/
	 Jp9D81apgN34MAb694i1j4pIOnM87HxaNMqsjsJK6Xu06qClrSt9DkP9yAntcmrfPV
	 XJL1gJJcxnVmXJIxo1GMoCozQp5yh9mU8sx2gRNSmCAVmHs1UGeyl5GqANKp57gI4B
	 9Uozj0r8pz/u8cVn2dGYELFmAJPjG7lKt0gerdZj1kxZE2SVB+yMyKElfqXA8dHK/t
	 peic+glsSexBPjR+yYhMBS0ouilUlLgI2rjv/hl9d0usFjD3cwXkqSqhfeIRqxEg8L
	 fjMPRUBcC9fsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C8C6069E;
	Sun, 19 Jul 2026 19:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E009D1F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D10696068A
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psW_KADYrN7K for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8555C6066F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8555C6066F
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3643388FB5; Sun, 19 Jul 2026 19:27:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 15:31:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01f0bb8d91cfe867a3e4e58bac2922562a8221d7
X-Git-Newrev: 32485f8bcc72cb099c99b7af75ec9d3b07585651
X-Patchwork-Hint: ignore
Message-Id: <20260719192756.3643388FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-rcw: bump to version
 lf-6.18.20-2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32485f8bcc72cb099c99b7af75ec9d3b07585651
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 99dd860e02..6b9f591866 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5106d0e42a990b5474100cbc397d27f550bb226420664ac5a40b952706b680cd  qoriq-rcw-lf-6.12.34-2.1.0.tar.gz
+sha256  933333957ed6b12d2521c1ef85ff806c4bcd5c26ef473305bd58bcf5f2abaff7  qoriq-rcw-lf-6.18.20-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 1394766b92..05d6a4bf23 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.34-2.1.0
+QORIQ_RCW_VERSION = lf-6.18.20-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
