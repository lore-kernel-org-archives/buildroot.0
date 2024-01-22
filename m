Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CDBC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 18:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB32400D3;
	Mon, 22 Jan 2024 18:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB32400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SnI6olpAK7BV; Mon, 22 Jan 2024 18:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 404BE419D4;
	Mon, 22 Jan 2024 18:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 404BE419D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23CAF1BF3CE
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 18:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092C881C21
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 18:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092C881C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwn83SYFJOXs for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 18:04:22 +0000 (UTC)
X-Greylist: delayed 2002 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Jan 2024 18:04:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC65E8184F
Received: from mail20c26.carrierzone.com (mail11c26-2170.carrierzone.com
 [64.29.152.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC65E8184F
 for <buildroot@busybox.net>; Mon, 22 Jan 2024 18:04:21 +0000 (UTC)
X-Authenticated-User: thirdharmonic@myfairpoint.net
Feedback-ID: uhmgawa@third-h
Received: from anvil.third-harmonic.com
 (burl-mse-70-20-54-127.static.ngn.east.myfairpoint.net [70.20.54.127] (may be
 forged)) (authenticated bits=0)
 by mail20c26.carrierzone.com (8.14.9/8.13.1) with ESMTP id 40MHUtwK085016
 for <buildroot@busybox.net>; Mon, 22 Jan 2024 17:30:57 +0000
Message-ID: <65AEA68E.3080104@third-harmonic.com>
Date: Mon, 22 Jan 2024 12:31:58 -0500
From: uhmgawa <uhmgawa@third-harmonic.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: buildroot@busybox.net
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevvdeinecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffhfgfggfvufgtgfeshhejrgdttdefudenucfhrhhomhepuhhhmhhgrgifrgcuoehuhhhmghgrfigrsehthhhirhguqdhhrghrmhhonhhitgdrtghomheqnecuggftrfgrthhtvghrnheptefhgfelgedukedtieetueehffeujefhudehteeludegveeluedvffdvgeffvdfhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpuggvnhigrdguvgenucfkphepjedtrddvtddrheegrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjedtrddvtddrheegrdduvdejpdhhvghloheprghnvhhilhdrthhhihhrugdqhhgrrhhmohhnihgtrdgtohhmpdhmrghilhhfrhhomhepuhhhmhhgrgifrgesthhhihhrugdqhhgrrhhmohhnihgtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghushihsghogidrnhgvth
X-Origin-Country: US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=carrierzone.com; s=mailmia; t=1705944657;
 bh=JHpd+3KFh7ty3yxu+o0iRgdPvcH6AtMsO4NTN2tqnWY=;
 h=Date:From:To:Subject:From;
 b=Ji+yccTuKzuIYgjunBF66mN7mJm40cW7O50zCCdDoVFYk/liwA5OkUTWtxE6d19qE
 dyucsT/3GFy9zPIsanFVD827qJIaaOHWa0r4UZgqIVgzgE+naEmgfCpd3lQb1drso/
 KOMhr4VQg4athLPqyKlAw9xXJpBvrSLW48HQIMUM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=carrierzone.com header.i=@carrierzone.com
 header.a=rsa-sha256 header.s=mailmia header.b=Ji+yccTu
Subject: [Buildroot] Buildroot + u-boot + raspberry-pi Zero W
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
Content-Type: multipart/mixed; boundary="===============1813557510534822916=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1813557510534822916==
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I have a vanilla build of gitlab.com/buildroot.org/buildroot.git @
    b200632b1ab for raspberrypi0w_defconfig<br>
    which seems fine directly booting the kernel using the stock
    Broadcom binary bootloader.&nbsp; However<br>
    changing the Buildroot bootloader config to BR2_TARGET_UBOOT=y,
    several issues appear:<br>
    <ol>
      <li>While output/images/u-boot.bin is generated, it is not present
        in output/images/boot.vfat nor does the file /boot/config.txt
        reflect the expected launch of u-boot with "kernel=u-boot.bin"
        but rather remains set to directly boot the kernel zImage.</li>
      <li>Implementing #1 manually (which is the drill for grafting a
        standalone u-boot into an existing PI install) does not result
        in u-boot coming up out of reset.</li>
      <li>If I take the same Buildroot built u-boot and install it (per
        #2) in a creaky Raspbian 9 install, u-boot functions just fine.</li>
      <li>If I take a git.denx.de/u-boot.git standalome build of
        u-boot.bin which known to work on the above Raspbian 9, it
        similarly fails in the Buildroot generated install.<br>
      </li>
    </ol>
    So a few thoughts:<br>
    <ol type="A">
      <li>I may be missing some configuration step given the seeming
        lack of image preparation in #1.</li>
      <li>Otherwise #1 may imply full Buildroot + u-boot integration
        remains a WIP, at least for a Raspberry Pi Zero W.</li>
      <li>The actual root cause may be an incompatible holy binary
        Broadcom firmware package being selected as the only other
        source of root cause appears to be the /boot installed
        bootcode.bin and/or start.elf.&nbsp;&nbsp; I do find a limited set of
        config knobs in the form "BR2_PACKAGE_RPI_FIRMWARE*" but at this
        point would like to have some sense of where in this problem
        space I may be.<br>
      </li>
    </ol>
    For reference, this is the Buildroot .config content change from a
    successful direct boot of the kernel zImage to the selection of
    u-boot as an intermediate boot loader:<br>
    <br>
    <tt>dot-config-default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?&nbsp;
      .config&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
---------------------------------------------------------------------------------------------------<br>
      # BR2_TARGET_UBOOT is not set&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;
      BR2_TARGET_UBOOT=y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES=""&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_PATCH=""&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_CUSTOM_DTS_PATH=""&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_FORMAT_BIN=y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_VERSION="2024.01"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_0_w"&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_LATEST_VERSION=y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_USE_DEFCONFIG=y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;
      BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=""&nbsp;</tt> <br>
    Any illumination here much appreciated.<br>
    <br>
  </body>
</html>

--===============1813557510534822916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1813557510534822916==--
