From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 21 Jul 2017 20:29:23 +0200
Subject: [Buildroot] [PATCH v4 2/3] qt5webengine: new package
In-Reply-To: <20170721155145.zm2gauvqgoqvxsmy@gportay>
References: <20170720010527.5359-1-gael.portay@savoirfairelinux.com>
 <20170720010527.5359-3-gael.portay@savoirfairelinux.com>
 <f54d8e9c-aede-ebd1-32b0-a3129333293b@gmail.com>
 <20170721155145.zm2gauvqgoqvxsmy@gportay>
Message-ID: <e8073840-27ae-ff2f-7cbd-2082ba66b5b8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ga?l,

On 07/21/2017 05:51 PM, Ga?l PORTAY wrote:
>
> No hash entry for qtwebengine-opensource-src-5.9.1.tar.xz
> That is because you applied my patch after the bump to 5.9.1.
>
> 	854b93370 package/qt5: bump latest version to 5.9.1

Oh, i see, sorry for the noise, i blindly assumed it's against the
current master.

>
> I am working on bumping Qt WebEngine to 5.9.1; but I met the following error
> when I build it for a rpi3.
>
> It concerns the opus codec which is build by chromium through Qt WebEngine.
>
> 	In file included from ../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:31:0:
> 	/home/gportay/src/buildroot/output-rpi-5.9-7/host/lib/gcc/arm-buildroot-linux-gnueabihf/7.1.0/include/arm_neon.h:10369:1: error: inlining failed in call to always_inline ?vld1q_s32?: target specific option mismatch
> 	 vld1q_s32 (const int32_t * __a)
> 	 ^~~~~~~~~
> 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:40:15: note: called from here
> 	     int32x4_t coef0 = vld1q_s32(coef32);
> 		       ^~~~~
> 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c: At top level:
> 	cc1: warning: unrecognized command line option ?-Wno-#pragma-messages?
> 	[11/12339] CC obj/third_party/ffmpeg/ffmpeg_internal/autorename_libavcodec_flacdec.o
> 	ninja: build stopped: subcommand failed.
>
> Now, I am enabling the WEBENGINE_CONFIG+=use_system_ffmpeg by default; building
> the buildroot copy of opus, and it seems to compile.
Please feel free to send your patch with this config, i'll build and
test it as well. (although i only have a RaspberryPi3 to test this atm,
i'll check what other relevant HW i have around...)


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/0197075d/attachment.asc>
