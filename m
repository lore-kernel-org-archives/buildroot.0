Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB51C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63CFB40911;
	Tue, 11 Jan 2022 22:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRqvL_LuDo6L; Tue, 11 Jan 2022 22:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F8984090A;
	Tue, 11 Jan 2022 22:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1764A1BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 051FF4090A
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEMJ2ss3IsQG for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:08:51 +0000 (UTC)
X-Greylist: delayed 00:47:20 by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C994940132
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:08:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8D93DFF804;
 Tue, 11 Jan 2022 22:08:47 +0000 (UTC)
Date: Tue, 11 Jan 2022 23:08:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220111230846.2460ac6a@windsurf>
In-Reply-To: <20220109164756.1312023-2-ju.o@free.fr>
References: <20220109164756.1312023-1-ju.o@free.fr>
 <20220109164756.1312023-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/spike_riscv64: new defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jan 2022 17:47:56 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                      |  2 ++
>  board/spike/riscv64/readme.txt  | 39 +++++++++++++++++++++++++++++++++
>  board/spike/riscv64/start.sh    | 13 +++++++++++
>  configs/spike_riscv64_defconfig | 12 ++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 board/spike/riscv64/readme.txt
>  create mode 100755 board/spike/riscv64/start.sh
>  create mode 100644 configs/spike_riscv64_defconfig

Applied to master, thanks. I've just added an explicit BR2_RISCV_64=y
in the defconfig to really clarify that this is a RISC-V 64-bit
configuration (even though BR2_RISCV_64=y is indeed the default).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
