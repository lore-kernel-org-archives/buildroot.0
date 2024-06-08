Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE04C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C9E840651;
	Sat,  8 Jun 2024 11:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYb5A8m1H-3d; Sat,  8 Jun 2024 11:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1878040653
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1878040653;
	Sat,  8 Jun 2024 11:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 426BA1BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7BC40169
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejuDebmWXb4o for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2099400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2099400FE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2099400FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:26:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5755920002;
 Sat,  8 Jun 2024 11:26:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFuCw-00GqwH-2K;
 Sat, 08 Jun 2024 13:26:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240512175117.2096550-1-bernd@kuhls.net>
Date: Sat, 08 Jun 2024 13:26:02 +0200
In-Reply-To: <20240512175117.2096550-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 12 May 2024 19:51:17 +0200")
Message-ID: <87cyor7k1h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: Link to libiconv when
 needed
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes build error
 > /home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
 > build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
 > /home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
 > /home/wbx/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/lib64/libiconv.so.2:
 > error adding symbols: DSO missing from command line

 > reported by Waldemar:
 > http://lists.busybox.net/pipermail/buildroot/2024-May/690952.html

 > Reproduced and fixed the build error using this defconfig:

 > BR2_x86_64=y
 > BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PER_PACKAGE_DIRECTORIES=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_KODI=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
 > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 > BR2_PACKAGE_MESA3D_OPENGL_ES=y
 > BR2_PACKAGE_PYTHON3=y
 > BR2_PACKAGE_PYTHON3_PY_ONLY=y

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
