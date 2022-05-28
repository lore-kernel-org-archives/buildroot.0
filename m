Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165EC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57150840C7;
	Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRf47H4f5waD; Tue,  7 Jun 2022 19:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE3D83FEB;
	Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B6D1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CA240607
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgsLaIuRKTYe for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FAEE400D7
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7E45186E21; Tue,  7 Jun 2022 19:04:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 23:35:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5da5a83142ab0d231b6346f4784af0366a475130
X-Git-Newrev: 727ca56d1426171052ccdc39e33dd72adbbbe1cf
X-Patchwork-Hint: ignore
Message-Id: <20220607190455.7E45186E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: install all
 RTL_RTW88 blobs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=727ca56d1426171052ccdc39e33dd72adbbbe1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than installing just the three blobs mentioned explicitly in the
.mk file, use a wildcard to install all blobs. At the time of this
writing, this matches the following:

-rw-r--r-- 1 arnout arnout  29K Mar  9 13:28 rtw8723d_fw.bin
-rw-r--r-- 1 arnout arnout 136K Mar  9 13:28 rtw8821c_fw.bin
-rw-r--r-- 1 arnout arnout 148K Mar  9 13:28 rtw8822b_fw.bin
-rw-r--r-- 1 arnout arnout 198K Mar  9 13:28 rtw8822c_fw.bin
-rw-r--r-- 1 arnout arnout 142K Mar  9 13:28 rtw8822c_wow_fw.bin

I.e. rtw8821c_fw.bin and rtw8822c_wow_fw.bin were missing.

Although including all blobs nearly doubles the size, it still totals to
just 660K which wouldn't warrant making more refined sub-options.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
