Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9ACC44501
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBA6811CA;
	Sun, 12 Jul 2026 14:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUd9vU9XcV7z; Sun, 12 Jul 2026 14:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBFCB81167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865959;
	bh=ffPGio5++SahGZr4ipCVcBCLi22X2hr91jsXzGVx0OA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=prp1pG4bTW/lYJFfx7GprT4xdaanSNQAUyFhYOof8uxKCXeyqcMWny9p7K6Pu5chb
	 2Irrhi4LfAy3wlpxysg1XIfYSTRE6wsE2yWZBjGGOfgd1szie88jXxB6MJ5z/pONfP
	 aejsouw2/0zOd+kNECZgNYkE3581XPEpfkKurNxW9OQeuKwzibozd5yEL0vix/N+oB
	 jr+y7UUB3DOsIk8m/NMP1kv0rAnpvCsyvWJmAaFHPQPGckITShERP3zxyP5aZqfiQY
	 AUMeeMTjxb0N1CvEPX1cKmXaY0blKT3yCH1HUpLDAEMs5IlAVj/HO92cIKJc7hNNLe
	 r7I7gycDNNHeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFCB81167;
	Sun, 12 Jul 2026 14:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9833442
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0108401D8
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i94_PL2nUvpI for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF5840108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF5840108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56D0C88733; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4225a5e5f358de2d5393a2c915eb5f6bcfd34049
X-Git-Newrev: 9116fab8af8436c02f72b2307df305a444dfdc7a
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.56D0C88733@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: add xilinx_v2026.1
 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9116fab8af8436c02f72b2307df305a444dfdc7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add hash to xilinx-prebuilt for xilinx_v2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..4e82561cb1
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6e02391f0dae67a46efc260729901da9c110b956880d0ff2617701f8b6cf0e1c  xilinx-prebuilt-xilinx_v2026.1.tar.gz
+
+# Locally calculated
+sha256  e4a8315687fbd55fc6bf0965c968bd95c8b73b8a957bb10b2ba618d5390b0e3a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
