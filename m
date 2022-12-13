Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F333C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E27881E36;
	Tue, 13 Dec 2022 21:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E27881E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZpUsKs7rpcO; Tue, 13 Dec 2022 21:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B563181E1E;
	Tue, 13 Dec 2022 21:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B563181E1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56A9F1BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3253181E1E
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3253181E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3E_unxwT_3T for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0006781E0D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0006781E0D
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:35:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5EFF100003;
 Tue, 13 Dec 2022 21:35:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5Cve-00H4nn-Re; Tue, 13 Dec 2022 22:35:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Hunleth <fhunleth@troodon-software.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <87pmcoy07y.fsf@dell.be.48ers.dk>
 <-RGRUyu_Rb7y4OO0GtQmXCmLMASiD2ZbUenzbGaZW9I6aHZhcsiY3yriYTsZDz1ZkKvVLOHm8Q_aFcGL9kz2kSIDqQqZFFyUydO3WHPibGI=@troodon-software.com>
Date: Tue, 13 Dec 2022 22:35:10 +0100
In-Reply-To: <-RGRUyu_Rb7y4OO0GtQmXCmLMASiD2ZbUenzbGaZW9I6aHZhcsiY3yriYTsZDz1ZkKvVLOHm8Q_aFcGL9kz2kSIDqQqZFFyUydO3WHPibGI=@troodon-software.com>
 (Frank Hunleth's message of "Tue, 13 Dec 2022 21:32:00 +0000")
Message-ID: <87pmcnugvl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

Hi,

 > I am able to run fine on a 512MB MangoPi MQ-Pro now. This is with the
 > patches that were just merged and with the U-Boot defconfig and Linux
 > DTS witched to the Mango Pi MQ-Pro options.

 > I don't have an understanding of the store/AMO access fault above. I
 > had an unintended change to my Linux configuration that just happens
 > to require a later version of OpenSBI. I just wanted to follow up in
 > case anyone stumbles on this thread that the simple U-Boot defconfig
 > and dts switch to the MangoPi versions works.

Ok, great to hear!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
