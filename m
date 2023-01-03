Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9EDC46467
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 12:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F1C80C18;
	Tue,  3 Jan 2023 12:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F1C80C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hrXYmys1cq5; Tue,  3 Jan 2023 12:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 018C380BDE;
	Tue,  3 Jan 2023 12:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 018C380BDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66E071BF36F
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 12:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C6D80BCB
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 12:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C6D80BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xp2B81soYkMH for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 12:18:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B827C80BDE
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B827C80BDE
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 12:18:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8F36100003;
 Tue,  3 Jan 2023 12:18:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pCgFm-003hJL-QF; Tue, 03 Jan 2023 13:18:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230102205416.817843-1-peter@korsgaard.com>
 <20230102205416.817843-2-peter@korsgaard.com>
 <8979f17b03f06016741f713598287436@free.fr>
Date: Tue, 03 Jan 2023 13:18:50 +0100
In-Reply-To: <8979f17b03f06016741f713598287436@free.fr> (Julien Olivain's
 message of "Tue, 03 Jan 2023 12:12:19 +0100")
Message-ID: <87ilhnak0l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] spike_risc64_defconfig: bump opensbi to
 1.1
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Hi Peter,
 > A minor comment: the patch title misses the "v" in
 > "spike_riscv64_defconfig:".
 > By the way, according to the BR manual recommendations,
 > https://git.buildroot.org/buildroot/tree/docs/manual/contribute.txt?h=2022.11#n202
 > the patch title prefix should be more "configs/spike_riscv64:" for
 > both patches.

Will fix when applying.

 > I successfully runtime tested this series.

Great, thanks!

 > On 02/01/2023 21:54, Peter Korsgaard wrote:
 >> Instead of the default 0.9 version.
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> configs/spike_riscv64_defconfig | 2 ++
 >> 1 file changed, 2 insertions(+)
 >> diff --git a/configs/spike_riscv64_defconfig 
 >> b/configs/spike_riscv64_defconfig
 >> index cd8fd8ee04..26103682f9 100644
 >> --- a/configs/spike_riscv64_defconfig
 >> +++ b/configs/spike_riscv64_defconfig
 >> @@ -8,6 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 >> BR2_TARGET_ROOTFS_CPIO=y
 >> # BR2_TARGET_ROOTFS_TAR is not set
 >> BR2_TARGET_OPENSBI=y
 >> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 >> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"

 > While at it, I also tested with OpenSBI v1.2 recently released:
 > https://github.com/riscv-software-src/opensbi/releases/tag/v1.2

 > Unless there is a specific reason for v1.1, maybe you could update to
 > this newer version?

Purely to keep things simple. OpenSBI v1.2 introduces kconfig support so
I'll add optional support for that similar to how we have it for U-Boot
in a separate series.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
