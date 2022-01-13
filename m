Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32737C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 00:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997936000A;
	Thu, 13 Jan 2022 00:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKnDtsq04TgD; Thu, 13 Jan 2022 00:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C8C6FBF8;
	Thu, 13 Jan 2022 00:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C390B1C1127
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 00:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1B4D415A2
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 00:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYDikbjkZECj for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 00:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A86F9415A0
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 00:19:58 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so4453427otu.10
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NooniZxRv1FDOUSS5qAVLldLLDDLF6qlQepT8oCpS3I=;
 b=bwRJyjZVnMWGjd09F2DnquAo6o6U7x2jXCXK0N2AyUWkM32JIdIg85stZfsoJFXm7/
 gfB+yno1v+mhgzTIq/rJuPUgJ7KebBQFUe9zkelJj+cZSXMKgtcz0dw+b8Vzxebafvqh
 vsTVCvELud851RRND6BcK2nEOOcq4s+tyYeykqCBy/PEiJ42Q0HfvTzETtoIllL2u5LK
 f8kxB4dCgPNW1J6YN3PJ9fPfuJLDhpi2V6UE2yW+39SEDv8KxGMY78BwrNm8XuWOzrfG
 Fis4BSQKzDX9dYR4kcExdRm0cVH5TAomEd0TM69O3DudqpEqIsrcQWjSm5BvrPEGYq0+
 1vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NooniZxRv1FDOUSS5qAVLldLLDDLF6qlQepT8oCpS3I=;
 b=NmoHtjN7g+tgbVfR/NR4d5QwTrlahKfyw/1pYbDDc0QwDoyshIzj28PiFkLa2/4k4V
 LYKSV5wK0IdUtg/W2Z8fVKlGU4V4yPc4yCm8A7RuUF9AKjocvOvZZklS8cEN5mKFbGyi
 U4LQ72MrGofExfdMcnBs/SPJOLBdLJzVT4RRI4UgwqUV6txiuaFKDmqHfnjGLhOOHITO
 aws3FaYIJ3Yj1kpqa1aC1igqgbHblUdDKfFnNY4fX3W7cb7chYAD+nDX04L+mHjvRm7m
 wJguJOi8x1SwzKHrbxm1epLl2nm6tMkYYCXvEGKgOShFi2FMrRYxeYYwa8n1VgpFm63k
 b27A==
X-Gm-Message-State: AOAM530soyeECWFNvzwSTQD33G/ovlvR/l7lzhiXDt74Ir60hQcTC7Ht
 cnQ71WTogY88PTIzqlCffh4DH4JX9AlG2acFWb8=
X-Google-Smtp-Source: ABdhPJyTIGISUtjzH5ZAhAUZdey7CSO6UcKo03m02kZ7oswB7j5fd66k10UUWXZt7HBEcs6byF8VsEOVxyjYDlBuMn4=
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr1518557otj.30.1642033197566; 
 Wed, 12 Jan 2022 16:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20220107045531.3985241-1-james.hilliard1@gmail.com>
 <20220112135637.12c5edc4@windsurf>
In-Reply-To: <20220112135637.12c5edc4@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Jan 2022 17:19:46 -0700
Message-ID: <CADvTj4qmO3=uSB-YU7-uvmXDqRqZwzptaKX9xLN_6FFVCYeB+Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 1/3]
 package/qt5/qt5webengine-chromium-catapult: new package
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot <buildroot@buildroot.org>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 12, 2022 at 5:56 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu,  6 Jan 2022 21:55:29 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > This version of catapult is python3 compatible and will be used to
> > replace the python2 only version in qt5webengine-chromium.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - add kconfig entry
> > ---
> >  package/qt5/Config.in                              |  1 +
> >  .../qt5/qt5webengine-chromium-catapult/Config.in   |  4 ++++
> >  .../qt5webengine-chromium-catapult.hash            |  3 +++
> >  .../qt5webengine-chromium-catapult.mk              | 14 ++++++++++++++
> >  4 files changed, 22 insertions(+)
> >  create mode 100644 package/qt5/qt5webengine-chromium-catapult/Config.in
> >  create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
> >  create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
>
> I have tested this patch series (I'm replying to the v3 because that's
> the one I tested) with the following defconfig:
>
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5WEBENGINE=y
> BR2_PACKAGE_RPI_USERLAND=y
>
> and it failed to build like this:

Yeah, there's quite a few issues with the qt5webengine update build in
general, I've
split out the kde qt5 deps update so that it can be
reviewed/tested/merged before the
qt5webengine update as the other updates require much more minimal changes and
should make it easier to test the qt5webengine update issues
separately once the kde
are verified to not create regressions:
https://patchwork.ozlabs.org/project/buildroot/patch/20220113000935.2353800-1-james.hilliard1@gmail.com/

I also think I fixed a potentially related issue with qmake sysrootify
path generation by
disabling it and setting sysroot paths manually, this seems to work
better and appears
to fix per-package directory builds on a number of the qt5
modules(although some seem
to still have issues), this should hopefully make it easier to fix the
qt5webengine issues
as well:
https://patchwork.ozlabs.org/project/buildroot/patch/20220112203939.606775-1-james.hilliard1@gmail.com/

Both of these should apply on top of master and should not depend on each other.

>
> FAILED: host/obj/crypto/crypto/nss_key_util.o
> /usr/bin/g++ -MMD -MF host/obj/crypto/crypto/nss_key_util.o.d -DCRYPTO_IMPLEMENTATION -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Ihost/gen -I../../3rdparty/chromium -I../../3rdparty/chromium/third_party/perfetto/include -Ihost/gen/third_party/perfetto/build_config -Ihost/gen/third_party/perfetto -I../../3rdparty/chromium/third_party/boringssl/src/include -I../../3rdparty/chromium/third_party/abseil-cpp -I../../3rdparty/chromium/third_party/protobuf/src -Ihost/gen/protoc_out -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -m64 -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-poin
 te
>  r-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden -I/usr/include/nss -I/usr/include/nspr -std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti -fvisibility-inlines-hidden -I/home/thomas/buildroot/buildroot/output/host/include -c ../../3rdparty/chromium/crypto/nss_key_util.cc -o host/obj/crypto/crypto/nss_key_util.o
> In file included from ../../3rdparty/chromium/crypto/nss_key_util.cc:5:
> ../../3rdparty/chromium/crypto/nss_key_util.h:8:10: fatal error: secoidt.h: No such file or directory
>     8 | #include <secoidt.h>
>       |          ^~~~~~~~~~~
> compilation terminated.
> [19912/23484] CXX host/obj/crypto/crypto/sha2.o
> [19913/23484] CXX host/obj/crypto/crypto/secure_hash.o
> [19914/23484] CXX host/obj/base/base/base_jumbo_7.o
> [19915/23484] CXX host/obj/crypto/crypto/signature_creator.o
> [19916/23484] CXX host/obj/base/base/base_jumbo_11.o
> [19917/23484] CXX host/obj/crypto/crypto/symmetric_key.o
> [19918/23484] CXX host/obj/crypto/crypto/signature_verifier.o
> [19919/23484] CXX host/obj/base/base/base_jumbo_4.o
> In file included from host/gen/base/base_jumbo_4.cc:6:
> ./../../3rdparty/chromium/base/debug/alias.cc:11: warning: ignoring #pragma clang max_tokens_here [-Wunknown-pragmas]
>    11 | #pragma clang max_tokens_here 250
>       |
> ninja: build stopped: subcommand failed.
> make[5]: *** [Makefile.gn_run:356: run_ninja] Error 1
> make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
> make[3]: *** [Makefile:79: sub-core-make_first] Error 2
> make[2]: *** [Makefile:49: sub-src-make_first] Error 2
> make[1]: *** [package/pkg-generic.mk:295: /home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.8/.stamp_built] Error 2
> make: *** [Makefile:84: _all] Error 2
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
