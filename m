Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDC5C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A20B41779;
	Wed, 15 Feb 2023 21:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A20B41779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8zo1Cwi8nmy; Wed, 15 Feb 2023 21:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8233741776;
	Wed, 15 Feb 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8233741776
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D80B71BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0F5281E37
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F5281E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfKNuprRWFj8 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:24:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F97181AC1
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F97181AC1
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:24:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SPGdpCSs4nPhRSPGepb3wQ; Wed, 15 Feb 2023 22:24:46 +0100
Message-ID: <25265a89-2f7a-4db5-0f15-ef66c48b3b63@benettiengineering.com>
Date: Wed, 15 Feb 2023 22:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230214120808.1282621-1-giulio.benetti@benettiengineering.com>
 <20230215220026.1a771114@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230215220026.1a771114@windsurf>
X-CMAE-Envelope: MS4xfNRSjkSnqEXFr4TYm2u87sFwMLIZCWJfjWvNGe+TNLPvd4ngmmlxmyILp7Vq0elyv48BoROxlvKH5sSVFz+y82Cu/W6uEekHgs06lw7ptEQrN+3gacvn
 vvYdhxg/YL/ayxlm874jlA6jPPZv6NDO1YKFaJdeL6mSWO7bSr7F2/ofbQ5zo+Gv43t0BLN7K/irwmaFxkSLCrne83Y0hEaIYQQChvlFQhJ8Oj5AIvyeMqIi
 bVCtvVy7DkkLVjQASWUfo1nOQ++9ALNbs+37AJRxMnnLvsu2uvhZAktl927oCKb8mNHtEzeMUVYN26gRs7PasQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676496286; bh=W+7UT5UvNMq2gXfOiwU7PLb3OcJXJtx69lSVE+fptMk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JekkH+r8Zy/m6NaXGaHlom9Xsz2GRnLNNFUa44HzHZm9S2rf7PCEcRfeiwopnijKE
 Nn3zary0e976rset5/AecpdfuPRohAPPIBusEksUO6T4bVZKeqpM0yQKv95YsIuydz
 9uPF0atciHHmXBKlYjbaxvTt/hRjwPBibgqpOQsFuxiy5VC4iv7RURAzZBYv6+orny
 DUMRRu+1gbfyvWc7aTKEQBHzkpgTgKQkRejPIVFlXwu/136lJAtbKPhLijjelY9G1S
 KRl4T2gL7YEQTa5Lkr7p9r2JztCRC5XFbrNsE8eYxGOLO8UYEYauLyJsh/R9BYu+6T
 ANxW4NCs7z5+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JekkH+r8
Subject: Re: [Buildroot] [RFC PATCH] package/Config.in: move all Wireless
 Driver into a separate menu and enable them only if architecture s390x is
 not used
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/02/23 22:00, Thomas Petazzoni via buildroot wrote:
> On Tue, 14 Feb 2023 13:08:08 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/Config.in | 28 ++++++++++++++++------------
>>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> Why not, but then you need to change all the existing packages that
> have a !S390 dependency to remove it, as it becomes redundant.

yes, that wouldn't be a problem, it would be part of this patch

> However, I feel like the dependency is more "obvious" if it is in each
> package. I know it's a bit of redundancy, but it is less "strange" than
> having it in package/Config.in.

But this way we kill two birds with one stone for dependencies and in
the future I see more probable having people adding external Wireless
Drivers to that menu, so it will inherits the dependency.
And in any case there are already some dependencies in package/Config.in
like !BR2_STATIC_LIBS and other BR2_PACKAGE_, 18 if statements in total.

I'm wondering also if it would make sense to create many Config.in.* for
every top-level menu in package/ like:
$ ls buildroot/package/Config.in*
package/Config.in
package/Config.in.audio-video-app
package/Config.in.comp-decop
package/Config.in.host
...

The only con is to check for packages in multiple Config.in.* but it's 
already like that with Config.in.host.
The pro we could have instead is to "hide" the dependency checking on a
specific Config.in.X

Nothing special on the final result but maybe it would be more 
user-friendly.

Just my 2 cents

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
