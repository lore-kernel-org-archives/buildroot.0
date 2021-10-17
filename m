Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1ACC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:37:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A7360E08
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62A7360E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6E960615;
	Sun, 17 Oct 2021 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rosUzlb0UslV; Sun, 17 Oct 2021 16:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B60C605DE;
	Sun, 17 Oct 2021 16:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A73381BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3566402BE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoFvbP5kyIJM for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:37:38 +0000 (UTC)
X-Greylist: delayed 00:08:12 by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8251402A0
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:37:37 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.24.103.190]) by smtp-32.iol.local with ESMTPA
 id c92DmY5ZpPvRTc92HmEzSB; Sun, 17 Oct 2021 18:29:22 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1634488162; bh=GwG7NnTAncKPR+nlGvMCjG/uzhUhGQKFeffzFl1jsj0=;
 h=From;
 b=cs2c0p5lcNdErm6JOl04orT/mCN+XlF9p519NMPPe00h0jqVdNC4UMt+filglHnXV
 Xd6HSSwzrSnPYEKf07eGge+mRY4mBrKXut+1rRYQQiM+DJkk1xifFD2l2lJVV/XTNN
 t1CWg0nYMDtMEz0ztUMzr4PArrkjIsiLAjeXEB/BI0L38VnrqflPun9NhaQm7vHEM6
 XYJot4QbHWbWt1BdrGEwfWJZclasFZwzK1f8JrMqkskUiliDXBiAclMWZ5XtmbFeHI
 66Pw7IP7kjBotiiTJkezhM2emNiXDaOWOlo4PVJ2oaZlUXGHkCfGo8cgkclZQBpiP+
 krC8P79r47Xsg==
X-CNFS-Analysis: v=2.4 cv=NqgUz+RJ c=1 sm=1 tr=0 ts=616c4f62 cx=a_exe
 a=YGFxGp/Nwp6jLtVyvvsm7Q==:117 a=YGFxGp/Nwp6jLtVyvvsm7Q==:17
 a=BSYEHu3y24qAtZsIgJMA:9
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:28:37 +0200
Message-Id: <20211017162839.20278-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfOwB6GSE4lbR+TBSYy40bCR0x2n6u0676CZmxzmyow+GIlcNYZf+VDAzwfVTDhxcPyBu4hNv2wxeqNaw8mmARqFr+a6R6nzblgNK6nUl9yHnSWC3dcLb
 DBguhbez1y9VpMU+vp3g6VZYlctaVX+cDlP8hywTxrmpyVIEEvDf550/Mdef6Vlb7oF+p3NAcvz0ZIPw7XxfnL+jQItmLn8zT4P9PYhPs5iIYyCUr9i6XAYF
 fu/me4yV77USiEBG9l/JfuocYFi9EZwcljGJEtF7ENJI7IyEFe0jjLklFkxT4I+rGUabQzKYP3gtroiIOa7h88UvCxCKpZ3alLj1TJHWIyQ=
Subject: [Buildroot] [PATCH 0/2] configs/stm32f469_disco: enable Linux DRM
 support
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series adds Linux DRM support for stm32f69 board.

I've been submitting two patches for a while now ([1], [2]) that were
acked by Christophe Priouzeau but never merged. In the meantime, the
patch to be applied to the linux kernel has been merged to version 5.14. So,
I submit again the series that updates the kernel without requiring it to
be patched.

[1] [RESEND,1/2] configs/stm32f469_disco: enable Linux DRM support
[2] [RESEND,2/2] configs/stm32f469_disco: add framebuffer test application

Dario Binacchi (2):
  configs/stm32f469_disco: enable Linux DRM support
  configs/stm32f469_disco: add framebuffer test application

 board/stmicroelectronics/stm32f469-disco/linux.fragment | 8 +++++++-
 configs/stm32f469_disco_defconfig                       | 5 +++--
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
