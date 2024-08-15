Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8A4C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 07:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1565A40A3B;
	Thu, 15 Aug 2024 07:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDosG267qZxk; Thu, 15 Aug 2024 07:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39E940E04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D39E940E04;
	Thu, 15 Aug 2024 07:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D28651BF5A9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFC2402A9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnuBQxddD_UI for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 07:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A354073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A354073C
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 07:21:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5AA85DF1; Thu, 15 Aug 2024 07:21:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 09:20:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4265790541e925708364e1e86038bd2884eec3a5
X-Git-Newrev: a0b8ca1c214c3e250c7c242121ff1e2c88644920
X-Patchwork-Hint: ignore
Message-Id: <20240815072109.BF5AA85DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-numpy: enable
 on RISC-V
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
Content-Type: multipart/mixed; boundary="===============6275369680494819383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6275369680494819383==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a0b8ca1c214c3e250c7c242121ff1e2c88644920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

numpy already supports RISC-V

Signed-off-by: 黄子懿 <huangziyi@canaan-creative.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index c27baec3b3..e10618f058 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	default y if BR2_mipsel
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
+	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_x86_64
 

--===============6275369680494819383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6275369680494819383==--
