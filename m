Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567EFEDEBF5
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11016811B9;
	Tue,  3 Mar 2026 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqQipyF_K-hU; Tue,  3 Mar 2026 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5F6811B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772572062;
	bh=66KjXa5pZrXcVydr2ntTyEFXUdPpj8OlCF9QuT0pvAo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q/agWFZif00i97N32iLD8anGtQI69w1CCXnQ6DAw+qEEsJqh9iaVb8cHazfRLGoAl
	 gSvnpjTGH8XNNjWZcRg7S/xThXbflI8by0QRw5bZ+fSs/ZsmNJTwDJaRNhxM2tDZA4
	 Ktx6Y05iZvbQoNIiCLqFhCJVwSM2XP8cwmJUZf9a3njv5H1EDO3CtyKlRFqDRO/qXH
	 kQr0KCXh512e6iBGHHu8oKk4maf2ytcZ93WLFCfUPbZA4Laiwzlm1nwSMp/OmhMdwJ
	 TQVEdhm+ldEuaeHkSTPco3YmCjtfGu56tdntMZXBMjwmEl3eU62k5J2MuVNr8zqBg7
	 bNcWVnd7hZNwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5F6811B5;
	Tue,  3 Mar 2026 21:07:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 510EC231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 371FC8117A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hO3OmyoJLarp for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31515811AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31515811AE
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2815A860A1; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 22:05:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 166ef8a12c7672c6928859ae1aab6ceb6dce575a
X-Git-Newrev: 38486b310dbea25067408afa2e53fa9db0757a9b
X-Patchwork-Hint: ignore
Message-Id: <20260303210739.2815A860A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx/linux.hash: add license file
 hashes
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38486b310dbea25067408afa2e53fa9db0757a9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that custom Linux versions can specify license files, add license file
hashes for the Xilinx custom Linux version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/xilinx/patches/linux/linux.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 0b1d9331f0..d843dafb20 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,7 @@
 # Locally calculated
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
