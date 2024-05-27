Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DA2C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352D2605D4;
	Mon, 27 May 2024 14:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNUnE5MQa6Je; Mon, 27 May 2024 14:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEB7605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEB7605D8;
	Mon, 27 May 2024 14:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C966B1D1DB3
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C216480ED4
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlTr5gcgAhGe for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A22480D8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A22480D8A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A22480D8A
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:34:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D716FF809;
 Mon, 27 May 2024 14:34:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBbQK-005S2i-2k;
 Mon, 27 May 2024 16:34:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240526204042.14587-1-brandon.maier@collins.com>
Date: Mon, 27 May 2024 16:34:04 +0200
In-Reply-To: <20240526204042.14587-1-brandon.maier@collins.com> (Brandon Maier
 via buildroot's message of "Sun, 26 May 2024 20:40:42 +0000")
Message-ID: <878qzvb9yb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/zynq_*: add hashes
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 > ---
 >  .checkpackageignore                                 | 4 ----
 >  board/zynq/patches/linux-headers/linux-headers.hash | 2 ++
 >  board/zynq/patches/linux/linux.hash                 | 2 ++
 >  board/zynq/patches/uboot/uboot.hash                 | 2 ++
 >  configs/zynq_microzed_defconfig                     | 2 ++
 >  configs/zynq_zc702_defconfig                        | 2 ++
 >  configs/zynq_zc706_defconfig                        | 2 ++
 >  configs/zynq_zed_defconfig                          | 2 ++
 >  8 files changed, 14 insertions(+), 4 deletions(-)
 >  create mode 100644 board/zynq/patches/linux-headers/linux-headers.hash
 >  create mode 100644 board/zynq/patches/linux/linux.hash
 >  create mode 100644 board/zynq/patches/uboot/uboot.hash

I've made linux-headers.hash a symlink to ../linux/linux.hash like we do
for the other defconfigs and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
