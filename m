Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA13C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03596407B7;
	Mon, 13 May 2024 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75fA8psu_G55; Mon, 13 May 2024 21:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA02840824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA02840824;
	Mon, 13 May 2024 21:17:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4B71BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15BA1403D6
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mY0h-KGS1yo for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 495534034A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495534034A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:17:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B89872F6; Mon, 13 May 2024 21:17:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 23:13:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbd082e0cac44e53a83d62ff5c103fddd7fd6f31
X-Git-Newrev: 580f6ef46dfec9db8483eeab8d639b935641289f
X-Patchwork-Hint: ignore
Message-Id: <20240513211740.33B89872F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: bump package version to
 4d2c017f41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============7103665397600349102=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7103665397600349102==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=580f6ef46dfec9db8483eeab8d639b935641289f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version dates back to 2017 and is lacking riscv support.
Bump the version to a more recent one (4d2c017f41) which supports riscv
and contains a large number of updates as well a CVE fixes. Since
kvmtool does not seems to have releases, just bump to the current git
HEAD.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvmtool/kvmtool.hash | 2 +-
 package/kvmtool/kvmtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index f7436dd3c9..63bbb7167c 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dbc3537e63ebff35bc19bdf6c90d74dad24f9175d8130baba79831ba2ad1788d  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-git4.tar.gz
+sha256  a8504d8b184cae4e65ff5555cc84a436f3fbbc832a8017e3ca59d997dd5581db  kvmtool-4d2c017f41533b0e51e00f689050c26190a15318-git4.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 2bcd556f9b..7fec6643f8 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVMTOOL_VERSION = f77d646ba01d04be5aad9449ac00719c043fe36e
+KVMTOOL_VERSION = 4d2c017f41533b0e51e00f689050c26190a15318
 KVMTOOL_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \

--===============7103665397600349102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7103665397600349102==--
