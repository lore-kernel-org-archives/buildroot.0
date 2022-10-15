Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A78C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 16:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2BF81754;
	Sat, 15 Oct 2022 16:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2BF81754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xo-AviWZDaog; Sat, 15 Oct 2022 16:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5044814BB;
	Sat, 15 Oct 2022 16:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5044814BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C094B1BF3E8
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 16:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9589814BB
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 16:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9589814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3t_-O2SeMlB for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 16:50:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EFC5814AB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EFC5814AB
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:50:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD5B6FF803
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:49:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1ojkMH-00H469-TA
 for buildroot@buildroot.org; Sat, 15 Oct 2022 18:49:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221014151028.3843939-1-peter@korsgaard.com>
Date: Sat, 15 Oct 2022 18:49:57 +0200
In-Reply-To: <20221014151028.3843939-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Oct 2022 17:10:27 +0200")
Message-ID: <87v8oldoay.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x / 6.0.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  linux/Config.in                      |  2 +-
 >  linux/linux.hash                     | 15 +++++++--------
 >  package/linux-headers/Config.in.host | 16 ++++++++--------
 >  3 files changed, 16 insertions(+), 17 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index f9caa3c652..ee59761f33 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -128,7 +128,7 @@ endif
 
 >  config BR2_LINUX_KERNEL_VERSION
 >  	string
 > -	default "6.0" if BR2_LINUX_KERNEL_LATEST_VERSION
 > +	default "6.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 >  	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 >  	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 >  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 > diff --git a/linux/linux.hash b/linux/linux.hash
 > index 07963f185e..e1fd0feb44 100644
 > --- a/linux/linux.hash
 > +++ b/linux/linux.hash
 > @@ -1,15 +1,14 @@
 >  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 > -sha256  5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e  linux-6.0.tar.xz
 > +sha256  8ede745a69351ea0f27fe0c48780d4efa37ff086135e129358ce09694957e8f9  linux-6.0.1.tar.xz
 >  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 > -sha256  4ecdb8b59c6f6f258d89cbf22eede210e0a55c09db884988fe706efe2fe8f148  linux-5.19.13.tar.xz
 > -sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
 > +sha256  4686e33847db3ec58e1043bc0c806472aae694b2c413bb7d8da91a5c9a55eb1b  linux-5.19.15.tar.xz
 >  sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz

Committed after fixing the hash for 5.15.73, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
