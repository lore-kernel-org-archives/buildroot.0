Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1217CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 05:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6513960E61;
	Tue, 15 Feb 2022 05:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8VqQaw8f4g4; Tue, 15 Feb 2022 05:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF28560E55;
	Tue, 15 Feb 2022 05:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5088C1BF2A9
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 05:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB9040412
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 05:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeV-yUWrmU2Y for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 05:16:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CAC4401C8
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 05:16:10 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 21F5Fct9046783;
 Tue, 15 Feb 2022 13:15:38 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 15 Feb 2022 13:15:38 +0800
Date: Tue, 15 Feb 2022 13:14:44 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Message-ID: <Ygs2xMj+B0UhKFxh@APC323>
References: <20220215023202.1188-1-peterlin@andestech.com>
 <20220215023202.1188-2-peterlin@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215023202.1188-2-peterlin@andestech.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 21F5Fct9046783
Subject: Re: [Buildroot] [PATCH 2/3] board/andes/ae350: add support for
 Andes AE350
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
Cc: giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> On Tue, Feb 15, 2022 at 10:32:01AM +0800, Yu Chien Peter Lin wrote:
> > This patch provides defconfig and basic support for the Andes
> > 45 series RISC-V architecture.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Signed-off-by: Alan Kao <alankao@andestech.com>
> > ---
> > Changes
> > V1->V2:
> > * move linux source code and its patches to AndesTech Github repo
> > * rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
> > * change C library to uClibc
> > * remove OpenSSL package
> > * remove rootfs.cpio and rootfs.tar
> > * update DEVELOPERS
> > V2->V3:
> > * specifiy branch to download from AndesTech linux repo
> > * change boot.cmd to extlinux.conf
> > * add post-build.sh for extlinux.conf to retrieve Image and DTB
> > * fix format and update genimage_sdcard.cfg
> > * update readme.txt
> > * add packages (python3, pylibfdt and openssl) for u-boot binman
> > * reorder item in DEVELOPERS
> > 

Sorry, I missed versioning for this revision.
I'll resend it and fix changelog format.

Regards,
Yu-Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
