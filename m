Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42351C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 09:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF36B613F1;
	Tue,  7 Jun 2022 09:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaipg9_wZeHa; Tue,  7 Jun 2022 09:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7D3613E7;
	Tue,  7 Jun 2022 09:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05F7B1BF2A9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4422416F8
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grV5O2q-hJlq for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 09:41:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83992415D4
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 09:41:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED501FF80D;
 Tue,  7 Jun 2022 09:41:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyViD-00DUI9-Gj; Tue, 07 Jun 2022 11:41:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <YggrcBOVfufdvm8G@waldemar-brodkorb.de>
 <20220530214653.GC1390376@scaer>
Date: Tue, 07 Jun 2022 11:41:21 +0200
In-Reply-To: <20220530214653.GC1390376@scaer> (Yann E. MORIN's message of
 "Mon, 30 May 2022 23:46:53 +0200")
Message-ID: <87fskgyfni.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/qemu/ppc-bamboo: use path to vmlinux
 image for copy and paste users
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Waldemar, All,
 > On 2022-02-12 22:49 +0100, Waldemar Brodkorb spake thusly:
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> ---
 >> board/qemu/ppc-bamboo/readme.txt | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/board/qemu/ppc-bamboo/readme.txt b/board/qemu/ppc-bamboo/readme.txt
 >> index 0b70d2fa54..53d1970698 100644
 >> --- a/board/qemu/ppc-bamboo/readme.txt
 >> +++ b/board/qemu/ppc-bamboo/readme.txt
 >> @@ -1,5 +1,5 @@
 >> Run the emulation with:
 >> 
 >> -qemu-system-ppc -nographic -M bamboo -kernel vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig
 >> +qemu-system-ppc -nographic -M bamboo -kernel output/images/vmlinux
 >> -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig

 > Since the correponding defconfig does build host-qemu, it would have
 > made sense that the path to qemu-system-ppc also had been changed to
 > output/host/bin/qemu-system-ppc, but I see that other readmes do not
 > use that either...

 > Applied to master, thanks.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
