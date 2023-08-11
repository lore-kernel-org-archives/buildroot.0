Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC6EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 15:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F24F8408B;
	Fri, 11 Aug 2023 15:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F24F8408B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8s0CuaeeW74y; Fri, 11 Aug 2023 15:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDE184089;
	Fri, 11 Aug 2023 15:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDE184089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECA181BF575
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D246F40260
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D246F40260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Onku9QqmrnIE for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 15:18:06 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBDB401CD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 15:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EBDB401CD
Received: from pwmachine.localnet (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id C750420FD0DE;
 Fri, 11 Aug 2023 08:18:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C750420FD0DE
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Aug 2023 17:18:02 +0200
Message-ID: <1939790.PYKUYFuaPT@pwmachine>
In-Reply-To: <20230731221843.61feafea@windsurf>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
 <20230428152211.20394-2-flaniel@linux.microsoft.com>
 <20230731221843.61feafea@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1691767085;
 bh=StsuznWeAWIiy/sbAJQVayobvvfQw1KXm9NWiwtjRLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ablboCyfFuzux6MY7E4o59n0qt4EqL2k1R9bO/+vI6cN7CPUUEt3XsdTQeIzTNOaT
 WAxm2isCaujBoXX2c9GPYo3NfFHL3QwqwBH03w+SM7nkYOaZVqYu9/eZ5OIlIqYi1i
 Ldb0oBOZHYeTk2AB2iudyX346/+UA8EKjT9eJDOM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=ablboCyf
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/sysdig: bump to version
 0.31.4
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le lundi 31 juillet 2023, 22:18:43 CEST Thomas Petazzoni a =E9crit :
> Hello Francis (and perhaps Angelo who can help?),
> =

> On Fri, 28 Apr 2023 16:22:10 +0100
> =

> Francis Laniel <flaniel@linux.microsoft.com> wrote:
> > - Remove upstream patch as it is no more needed.
> =

> Actually I had to remove it from current master, because sysdig was
> bumped to 0.29.3 already, which includes the patch... and so the patch
> in Buildroot doesn't apply anymore.
> =

> I tested your version bump, and it fails to build with:
> =

> CMake Error at
> /home/thomas/projets/buildroot/output/build/falcosecurity-libs-e5c53d648f=
3c
> 4694385bbe488e7d47eaa36c229a/userspace/libscap/CMakeLists.txt:131
> (add_subdirectory): The binary directory
> =

>    =

> /home/thomas/projets/buildroot/output/build/sysdig-0.31.4/buildroot-build=
/d
> river
> =

>   is already used to build a source directory.  It cannot be used to build
>   source directory
> =

>    =

> /home/thomas/projets/buildroot/output/build/falcosecurity-libs-e5c53d648f=
3c
> 4694385bbe488e7d47eaa36c229a/driver
> =

>   Specify a unique binary directory name.
> =

> during the configuration step of sysdig.
> =

> Configuration tested:
> =

> BR2_arm=3Dy
> BR2_cortex_a9=3Dy
> BR2_ARM_ENABLE_VFP=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_INIT_NONE=3Dy
> BR2_SYSTEM_BIN_SH_NONE=3Dy
> BR2_LINUX_KERNEL=3Dy
> BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1"
> BR2_LINUX_KERNEL_DEFCONFIG=3D"vexpress"
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_SYSDIG=3Dy
> BR2_PACKAGE_LUA=3Dy
> BR2_PACKAGE_LUA_5_1=3Dy
> # BR2_TARGET_ROOTFS_TAR is not set

> it would be good to have a runtime test for sysdig in support/testing/,
> as it's not trivial to build, and the autobuilders never caught the
> patching issue.

Good idea! I will check how I can do that!

> >  SYSDIG_CONF_OPTS +=3D
> >  -DFALCOSECURITY_LIBS_SOURCE_DIR=3D$(FALCOSECURITY_LIBS_SRCDIR) \> =

> > +	-DDRIVER_SOURCE_DIR=3D$(FALCOSECURITY_LIBS_SRCDIR)/driver \
> =

> So apparently something goes wrong with this. Perhaps because
> falcosecurity-libs needs to be bumped first?

As you advised, bumping first the libs then the binary removed the above =

problem, thank you!
Regarding this, I am wondering if I should bump both of them in the same =

commit, as they are tightly coupled. What do you think?

Note that, I had to make linux-menuconfig to add CONFIG_IPV6, to avoid some =

compile errors due to some missing IPv6 related fields while compiling the =

kernel module which is parts of the libs.

> >  	-DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson \
> =

> One thing that is a bit annoying with the packaging here is the fact
> that sysdig needs to look into the source directory of
> falcosecurity-libs and the source tree of valijson. Packages should
> normally not need to access the source/build tree of other packages.
> Not a strict requirement for this version bump, but would be good to
> address on the long run.
> =

> By the way
> -DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson is truly
> horrible, because if valijson gets updated to another version... like
> it has:
> =

> VALIJSON_VERSION =3D 0.7
> =

> then this doesn't work anymore.
> =

> It needs to be VALIJSON_SRCDIR.
> =

> Curious that we can build sysdig today (I verified, it builds) with
> this mistake. Probably means this option is irrelevant.
> =

> Could you have a look at all those issues?

I removed everything about VALIJSON and it builds fine.
Glad making it simpler permits to build it!

> Thanks!
> =

> Thomas




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
