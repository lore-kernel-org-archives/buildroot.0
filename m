Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10764C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 12:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69F5D40B54;
	Sat, 24 Sep 2022 12:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69F5D40B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4-Fhal-r2lY; Sat, 24 Sep 2022 12:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98EEE40443;
	Sat, 24 Sep 2022 12:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98EEE40443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD941BF855
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 12:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D0A40443
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 12:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D0A40443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9gKDZ0wJcgv for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 12:09:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F5F24012E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F5F24012E
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 12:09:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1967D240003;
 Sat, 24 Sep 2022 12:09:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oc3yF-004SW2-11; Sat, 24 Sep 2022 14:09:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 <87v8pebk2s.fsf@dell.be.48ers.dk>
 <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
Date: Sat, 24 Sep 2022 14:09:23 +0200
In-Reply-To: <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
 (Zvi Vered's message of "Sat, 24 Sep 2022 12:41:10 -0400")
Message-ID: <87r101as98.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hi Peter,
 > Thank you for your reply.

 > In the following, I used buildroot-2020.02.9
 > The contents of defconfig is:
 > -------------------------------------------------------------------------------------------
 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 > BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/xilinx/petalinux/2018.3/tools/linux-i386/aarch64-linux-gnu"
 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
 > BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 > BR2_TOOLCHAIN_EXTERNAL_CXX=y
 > BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 > BR2_TARGET_GENERIC_ROOT_PASSWD="123456"
 > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 > BR2_PACKAGE_VALGRIND=y
 > BR2_PACKAGE_TREE=y
 > BR2_PACKAGE_MTD=y
 > BR2_PACKAGE_APACHE=y
 > BR2_PACKAGE_DROPBEAR=y
 > BR2_PACKAGE_ETHTOOL=y
 > BR2_PACKAGE_GESFTPSERVER=y
 > BR2_PACKAGE_RPM=y
 > BR2_PACKAGE_KMOD=y
 > BR2_PACKAGE_UTIL_LINUX=y
 > BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
 > -----------------------------------------------------------------------------------------------------------------------------------

 > If required, I can do it for any other version of buildroot.
 > I'm using an external gcc provided by Xilinx.

Ok, any specific reason for doing that? Do you see the same issue with a
more "normal" toolchain, E.G. one built by Buildroot or the
ARM/Bootlin/Linaro preconfigured external toolchains?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
