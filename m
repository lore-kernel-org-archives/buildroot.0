Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6B7EE3F09
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9908F81FC1;
	Tue, 12 Sep 2023 18:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9908F81FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTMWwurt1e0D; Tue, 12 Sep 2023 18:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6CC81F21;
	Tue, 12 Sep 2023 18:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6CC81F21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 582AE1BF83B
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3139181F21
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3139181F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7joyHVxUyst for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:04:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE09681E39
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE09681E39
Received: by mail.gandi.net (Postfix) with ESMTPSA id B34D460002;
 Tue, 12 Sep 2023 18:04:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qg7kl-000VcC-Ip; Tue, 12 Sep 2023 20:04:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <ZNew/asuEOItVTZZ@waldemar-brodkorb.de>
 <20230812215444.0af6eb62@windsurf>
Date: Tue, 12 Sep 2023 20:04:47 +0200
In-Reply-To: <20230812215444.0af6eb62@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 12 Aug 2023 21:54:44 +0200")
Message-ID: <87h6nz6zeo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/qemu/ppc64le-powernv8: fixup example
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 12 Aug 2023 18:19:09 +0200
 > Waldemar Brodkorb <wbx@openadk.org> wrote:

 >> Use full relative pathes for rootfs and kernel, like in other
 >> readme's.
 >> 
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> ---
 >> board/qemu/ppc64le-powernv8/readme.txt | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks. I was initially a bit confused because all
 > those readme.txt files for Qemu configurations are used in our Gitlab
 > CI infra to automatically boot the resulting kernel/rootfs images in
 > Qemu, and the build/test was working fine in our CI.

 > Turns out that board/qemu/post-image.sh strips output/images/, and then
 > board/qemu/start-qemu.sh.in chdir into ${BINARIES_DIR}. So indeed, it
 > makes sense that both this incorrect readme.txt, and all the other ones
 > for Qemu defconfigs, that had output/images, worked.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
