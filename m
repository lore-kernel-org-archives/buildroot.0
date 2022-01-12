Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E1BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 12:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC562400C4;
	Wed, 12 Jan 2022 12:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7bp4bY8r6-P; Wed, 12 Jan 2022 12:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA7040A20;
	Wed, 12 Jan 2022 12:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF941BF3EB
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 12:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 484DF4023B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 12:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkCO0sLxxgn9 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 12:56:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94A1B400C4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 12:56:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EF8C1200002;
 Wed, 12 Jan 2022 12:56:40 +0000 (UTC)
Date: Wed, 12 Jan 2022 13:56:37 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220112135637.12c5edc4@windsurf>
In-Reply-To: <20220107045531.3985241-1-james.hilliard1@gmail.com>
References: <20220107045531.3985241-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 buildroot@buildroot.org,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu,  6 Jan 2022 21:55:29 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This version of catapult is python3 compatible and will be used to
> replace the python2 only version in qt5webengine-chromium.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - add kconfig entry
> ---
>  package/qt5/Config.in                              |  1 +
>  .../qt5/qt5webengine-chromium-catapult/Config.in   |  4 ++++
>  .../qt5webengine-chromium-catapult.hash            |  3 +++
>  .../qt5webengine-chromium-catapult.mk              | 14 ++++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/qt5/qt5webengine-chromium-catapult/Config.in
>  create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
>  create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk

I have tested this patch series (I'm replying to the v3 because that's
the one I tested) with the following defconfig:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_RPI_USERLAND=y

and it failed to build like this:

FAILED: host/obj/crypto/crypto/nss_key_util.o
/usr/bin/g++ -MMD -MF host/obj/crypto/crypto/nss_key_util.o.d -DCRYPTO_IMPLEMENTATION -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Ihost/gen -I../../3rdparty/chromium -I../../3rdparty/chromium/third_party/perfetto/include -Ihost/gen/third_party/perfetto/build_config -Ihost/gen/third_party/perfetto -I../../3rdparty/chromium/third_party/boringssl/src/include -I../../3rdparty/chromium/third_party/abseil-cpp -I../../3rdparty/chromium/third_party/protobuf/src -Ihost/gen/protoc_out -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -m64 -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointe
 r-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden -I/usr/include/nss -I/usr/include/nspr -std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti -fvisibility-inlines-hidden -I/home/thomas/buildroot/buildroot/output/host/include -c ../../3rdparty/chromium/crypto/nss_key_util.cc -o host/obj/crypto/crypto/nss_key_util.o
In file included from ../../3rdparty/chromium/crypto/nss_key_util.cc:5:
../../3rdparty/chromium/crypto/nss_key_util.h:8:10: fatal error: secoidt.h: No such file or directory
    8 | #include <secoidt.h>
      |          ^~~~~~~~~~~
compilation terminated.
[19912/23484] CXX host/obj/crypto/crypto/sha2.o
[19913/23484] CXX host/obj/crypto/crypto/secure_hash.o
[19914/23484] CXX host/obj/base/base/base_jumbo_7.o
[19915/23484] CXX host/obj/crypto/crypto/signature_creator.o
[19916/23484] CXX host/obj/base/base/base_jumbo_11.o
[19917/23484] CXX host/obj/crypto/crypto/symmetric_key.o
[19918/23484] CXX host/obj/crypto/crypto/signature_verifier.o
[19919/23484] CXX host/obj/base/base/base_jumbo_4.o
In file included from host/gen/base/base_jumbo_4.cc:6:
./../../3rdparty/chromium/base/debug/alias.cc:11: warning: ignoring #pragma clang max_tokens_here [-Wunknown-pragmas]
   11 | #pragma clang max_tokens_here 250
      |
ninja: build stopped: subcommand failed.
make[5]: *** [Makefile.gn_run:356: run_ninja] Error 1
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:295: /home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.8/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
