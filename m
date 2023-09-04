Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7EC71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 17:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B250981E67;
	Mon,  4 Sep 2023 17:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B250981E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbNSUL3UGv01; Mon,  4 Sep 2023 17:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D6D381E84;
	Mon,  4 Sep 2023 17:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D6D381E84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD09D1BF369
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 17:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F93C40948
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 17:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F93C40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qi7-jjYjLyVf for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 17:13:07 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CAC54012F
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 17:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CAC54012F
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-570e005c480so1051941eaf.0
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 10:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693847586; x=1694452386;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WWbKZoHv2HYbTr/2xjxV6NLKdeHpkpyEPtZ3ibU1U3Q=;
 b=CPgRRaxf0UUHPEg+4Vb+P2ENYDaKJOqqCEIvlhHqR7GL0EK+rjfr66zN89w4zZSsFY
 tS+KxjojtpFsPVxSqTnfvUFNMmEQUP43kq03k/OmI6lOcGm6NHzba86V8jYVUtL7fV3L
 PLXqeHG6v8017WYSC74JMYWCkmggxHJIYRYtOGdgWKqypKYk/istqZOZyMm6uAFfE0kr
 wpreAI8viASVfCSKE66V0Nka/dcomwwiileWr3SV6czFk9gswKLV7Axv2LhPwUy4U9wx
 0mOxyAyCQyIc+fCFjHMltK8gqUlZqN2KBvHUeuiXFUFoNotYmt6fsAjzNvU8E7i/6NTU
 FClg==
X-Gm-Message-State: AOJu0YzS4vKwJL+eaX1mDtwTdYO/ZYHa7+4rUmdvDIfSCzqqwTTVmegy
 9yc9gg6zNiQDY+TriLUxSJzGbzFvGzwTk/5b2vfz/8Ij+ZY=
X-Google-Smtp-Source: AGHT+IFkv5CgSqYuBK8TEGmb3B+KlDBnvZLcKsQNupW+A0nainOoxdGLsFycDva133YygMIlKsgPoSJbEKt0j+vqJ1E=
X-Received: by 2002:a4a:2a13:0:b0:573:b2a4:7a6e with SMTP id
 k19-20020a4a2a13000000b00573b2a47a6emr9286194oof.5.1693847585999; Mon, 04 Sep
 2023 10:13:05 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 4 Sep 2023 19:12:54 +0200
Message-ID: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693847586; x=1694452386; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WWbKZoHv2HYbTr/2xjxV6NLKdeHpkpyEPtZ3ibU1U3Q=;
 b=FXDc2q/aPrQml5ROR/g3E/+5ONGsNk4a8rWuBtcD4BBg8Djba+7I9j93/NCF1nb6as
 IGt2sXjc+YzleL0gIA3x6A5tWMhQbIit1K1b1mUl1P2oSOV8Il3Il2R+rmxFGLKWxkSs
 OiQsVKJ8NblRDrOHGcLqOX+gBag0caCCfPDhiiFwvdEDG8lArQe9E5myWjzr1TL12LSd
 0GQp6EaB4pm7ctNW2Mp4r07ngkI1eEZF0J4yu6CUKvyZ/NRDttYV2uE2J/47MkiBNoiX
 KvCQPVL3e8efv1SiiXqsaZG0yKpJ7aJAm1C90T991JCirKCh8yqVIEv9ewLqCC9RDGZJ
 T21Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FXDc2q/a
Subject: [Buildroot] Error while building tensorflow-lite package
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
Content-Type: multipart/mixed; boundary="===============6856398545777289321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6856398545777289321==
Content-Type: multipart/alternative; boundary="000000000000aad21106048b9f66"

--000000000000aad21106048b9f66
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to add tensorflow-lite to Buildroot package and I found a git
(quite old)
https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
wanted to test.
But while building it I am getting below error:

file='/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
-- Downloading... done
-- extracting...

 src='/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'

 dst='/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 33%] No patch step for 'pthreadpool'
[ 44%] No update step for 'pthreadpool'
[ 55%] No configure step for 'pthreadpool'
[ 66%] No build step for 'pthreadpool'
[ 77%] No install step for 'pthreadpool'
[ 88%] No test step for 'pthreadpool'
[100%] Completed 'pthreadpool'
make[4]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
[100%] Built target pthreadpool
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
-- Configuring incomplete, errors occurred!
See also
"/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
See also
"/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
make[1]: *** [package/pkg-generic.mk:283:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/.stamp_configured]
Error 1
make: *** [Makefile:23: _all] Error 2

The CMakeError.log
build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CM
akeFiles shows

Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32 failed with
the following output:
Change Dir:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp

Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]: Entering
directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
CMakeFiles/cmTC_76002.dir/build
make[3]: Entering directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
--sysroot=/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
-g0 -D_FORTIFY_SOURCE=2 -ldl -latomic -funsafe-math-optimizations
 -march=armv8-a -std=c++03 -pedantic -Wall -Wextra -Wundef -Wcast-align
-Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
-Wpointer-arith -Wwrite-strings -Wformat-security
-DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
-Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
aarch64-linux-g++.br_real: error: unrecognized command-line option
'-Wshorten-64-to-32'
make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'


Source file was:
int main() { return 0; }
Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions failed
with the following output:
Change Dir:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp

Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]: Entering
directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
CMakeFiles/cmTC_0b14f.dir/build
make[3]: Entering directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
--sysroot=/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
-g0 -D_FORTIFY_SOURCE=2 -ldl -latomic -funsafe-math-optimizations
 -march=armv8-a -std=c++03 -pedantic -Wall -Wextra -Wundef -Wcast-align
-Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
-Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
-Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBUG
-fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
aarch64-linux-g++.br_real: error: unrecognized command-line option
'-Wc++11-extensions'; did you mean '-fms-extensions'?
make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'


Source file was:
int main() { return 0; }
Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with the
following output:
Change Dir:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp

Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]: Entering
directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
CMakeFiles/cmTC_4c191.dir/build
make[3]: Entering directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
--sysroot=/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
-g0 -D_FORTIFY_SOURCE=2 -ldl -latomic -funsafe-math-optimizations
 -march=armv8-a -std=c++03 -pedantic -Wall -Wextra -Wundef -Wcast-align
-Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
-Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
-Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
-Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
-fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -wd981
-o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
aarch64-linux-g++.br_real: error: unrecognized command-line option '-wd981'
make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'


Source file was:
int main() { return 0; }
Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with the
following output:
Change Dir:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp

Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]: Entering
directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
CMakeFiles/cmTC_3d2da.dir/build
make[3]: Entering directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
--sysroot=/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
-g0 -D_FORTIFY_SOURCE=2 -ldl -latomic -funsafe-math-optimizations
 -march=armv8-a -std=c++03 -pedantic -Wall -Wextra -Wundef -Wcast-align
-Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
-Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
-Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
-Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
-fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
-wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
aarch64-linux-g++.br_real: error: unrecognized command-line option '-wd2304'
make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'


Source file was:
int main() { return 0; }
Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed with the
following output:
Change Dir:
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp

Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]: Entering
directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
CMakeFiles/cmTC_b2340.dir/build
make[3]: Entering directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
--sysroot=/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
-g0 -D_FORTIFY_SOURCE=2 -ldl -latomic -funsafe-math-optimizations
 -march=armv8-a -std=c++03 -pedantic -Wall -Wextra -Wundef -Wcast-align
-Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
-Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
-Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
-Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
-fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPIE
-strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
aarch64-linux-g++.br_real: error: unrecognized command-line option
'-strict-ansi'; did you mean '-fstrict-enums'?
make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
make[3]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
make[2]: Leaving directory
'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'

Can anyone please let me know what could be an issue and how to resolve it?

Thanks in advance

--000000000000aad21106048b9f66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><div><br></div><div>I am trying to add tenso=
rflow-lite to Buildroot package and I found a git (quite old)=C2=A0<a href=
=3D"https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master">http=
s://github.com/Exein-io/buildroot-tensorflow-lite/tree/master</a>=C2=A0that=
 I wanted to test.</div><div>But while building it I am getting below error=
:</div><div><br></div><div>file=3D&#39;/home/test/tmp/.../build/tensorflow-=
lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-bui=
ld/pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fa=
c02e973a3de2.zip&#39;<br>-- Downloading... done<br>-- extracting...<br>=C2=
=A0 =C2=A0 =C2=A0src=3D&#39;/home/test/tmp/.../build/tensorflow-lite-9663ab=
e4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadp=
ool-download/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de=
2.zip&#39;<br>=C2=A0 =C2=A0 =C2=A0dst=3D&#39;/home/test/tmp/.../build/tenso=
rflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildro=
ot-build/pthreadpool-source&#39;<br>-- extracting... [tar xfz]<br>-- extrac=
ting... [analysis]<br>-- extracting... [rename]<br>-- extracting... [clean =
up]<br>-- extracting... done<br>[ 33%] No patch step for &#39;pthreadpool&#=
39;<br>[ 44%] No update step for &#39;pthreadpool&#39;<br>[ 55%] No configu=
re step for &#39;pthreadpool&#39;<br>[ 66%] No build step for &#39;pthreadp=
ool&#39;<br>[ 77%] No install step for &#39;pthreadpool&#39;<br>[ 88%] No t=
est step for &#39;pthreadpool&#39;<br>[100%] Completed &#39;pthreadpool&#39=
;<br>make[4]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/pthreadpool-download&#39;<br>[100%] Built target pthreadpool<br>make[3]: L=
eaving directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c903=
7030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-do=
wnload&#39;<br>make[2]: Leaving directory &#39;/home/test/tmp/.../build/ten=
sorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/build=
root-build/pthreadpool-download&#39;<br>-- Configuring incomplete, errors o=
ccurred!<br>See also &quot;/home/test/tmp/.../build/tensorflow-lite-9663abe=
4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFile=
s/CMakeOutput.log&quot;.<br>See also &quot;/home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeError.log&quot;.<br>make[1]: *** [package/<a href=3D=
"http://pkg-generic.mk:283">pkg-generic.mk:283</a>: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/.stamp_configure=
d] Error 1<br>make: *** [Makefile:23: _all] Error 2<br></div><div><br></div=
><div>The CMakeError.log build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CM</div>akeFiles shows<div><br=
></div><div>Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32=
 failed with the following output:<br>Change Dir: /home/test/tmp/.../build/=
tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/bu=
ildroot-build/CMakeFiles/CMakeTmp<br><br>Run Build Command(s):/usr/bin/make=
 cmTC_76002/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>/usr/bin/make -f CMake=
Files/cmTC_76002.dir/build.make CMakeFiles/cmTC_76002.dir/build<br>make[3]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o<br=
>/home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++ =
--sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-bui=
ldroot-linux-gnu/sysroot =C2=A0 =C2=A0-D_LARGEFILE_SOURCE -D_LARGEFILE64_SO=
URCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -lat=
omic -funsafe-math-optimizations =C2=A0-march=3Darmv8-a -std=3Dc++03 -pedan=
tic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-dtor=
 -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-security =
-DCOMPILER_SUPPORT_Wshorten64to32 -Werror =C2=A0-DNDEBUG -fPIE =C2=A0 -Wsho=
rten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c /home/test/tmp/.../=
build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/l=
ite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>aarch64-linux-g++.br_rea=
l: error: unrecognized command-line option &#39;-Wshorten-64-to-32&#39;<br>=
make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66: CMakeFiles/cmTC_7600=
2.dir/src.cxx.o] Error 1<br>make[3]: Leaving directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>make[2]: *** [Makefile:=
121: cmTC_76002/fast] Error 2<br>make[2]: Leaving directory &#39;/home/test=
/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/ten=
sorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br><br><br>Source fil=
e was:<br>int main() { return 0; }<br>Performing C++ SOURCE FILE Test COMPI=
LER_SUPPORT_Wcpp11extensions failed with the following output:<br>Change Di=
r: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp<br><br>Run Bu=
ild Command(s):/usr/bin/make cmTC_0b14f/fast &amp;&amp; make[2]: Entering d=
irectory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b4=
97c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#3=
9;<br>/usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make CMakeFiles/cmTC=
_0b14f.dir/build<br>make[3]: Entering directory &#39;/home/test/tmp/.../bui=
ld/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite=
/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>Building CXX object CMakeFiles=
/cmTC_0b14f.dir/src.cxx.o<br>/home/test/tmp/.../per-package/tensorflow-lite=
/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/tens=
orflow-lite/host/aarch64-buildroot-linux-gnu/sysroot =C2=A0 =C2=A0-D_LARGEF=
ILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_=
FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations =C2=A0-march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -Wlogical-op -Wenum-conversion -DCOMPILER_SUP=
PORT_Wcpp11extensions -Werror =C2=A0-DNDEBUG -fPIE =C2=A0 -Wc++11-extension=
s -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c /home/test/tmp/.../build/tensor=
flow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroo=
t-build/CMakeFiles/CMakeTmp/src.cxx<br>aarch64-linux-g++.br_real: error: un=
recognized command-line option &#39;-Wc++11-extensions&#39;; did you mean &=
#39;-fms-extensions&#39;?<br>make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.=
make:66: CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1<br>make[3]: Leaving d=
irectory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b4=
97c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#3=
9;<br>make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2<br>make[2]: Leav=
ing directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c903703=
0b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeT=
mp&#39;<br><br><br>Source file was:<br>int main() { return 0; }<br>Performi=
ng C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with the following ou=
tput:<br>Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037=
030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMak=
eTmp<br><br>Run Build Command(s):/usr/bin/make cmTC_4c191/fast &amp;&amp; m=
ake[2]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-96=
63abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMak=
eFiles/CMakeTmp&#39;<br>/usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.ma=
ke CMakeFiles/cmTC_4c191.dir/build<br>make[3]: Entering directory &#39;/hom=
e/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967=
dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>Building CXX=
 object CMakeFiles/cmTC_4c191.dir/src.cxx.o<br>/home/test/tmp/.../per-packa=
ge/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/..=
./per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot =C2=
=A0 =C2=A0-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 =C2=A0-O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizat=
ions =C2=A0-march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -W=
cast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wp=
ointer-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversi=
on -Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-lo=
ng -fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -W=
error =C2=A0-DNDEBUG -fPIE =C2=A0 -wd981 -o CMakeFiles/cmTC_4c191.dir/src.c=
xx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68c=
c4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<=
br>aarch64-linux-g++.br_real: error: unrecognized command-line option &#39;=
-wd981&#39;<br>make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66: CMake=
Files/cmTC_4c191.dir/src.cxx.o] Error 1<br>make[3]: Leaving directory &#39;=
/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99=
1967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>make[2]:=
 *** [Makefile:121: cmTC_4c191/fast] Error 2<br>make[2]: Leaving directory =
&#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br><br=
><br>Source file was:<br>int main() { return 0; }<br>Performing C++ SOURCE =
FILE Test COMPILER_SUPPORT_wd2304 failed with the following output:<br>Chan=
ge Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68c=
c4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp<br><br>R=
un Build Command(s):/usr/bin/make cmTC_3d2da/fast &amp;&amp; make[2]: Enter=
ing directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c903703=
0b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeT=
mp&#39;<br>/usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make CMakeFiles=
/cmTC_3d2da.dir/build<br>make[3]: Entering directory &#39;/home/test/tmp/..=
./build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>Building CXX object CMake=
Files/cmTC_3d2da.dir/src.cxx.o<br>/home/test/tmp/.../per-package/tensorflow=
-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package=
/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot =C2=A0 =C2=A0-D_L=
ARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g=
0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations =C2=A0-ma=
rch=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wc=
har-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -=
Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversion -Wdouble-pr=
omotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -fno-check-=
new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror =C2=A0-=
DNDEBUG -fPIE =C2=A0 -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c /hom=
e/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967=
dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>aarch64-l=
inux-g++.br_real: error: unrecognized command-line option &#39;-wd2304&#39;=
<br>make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66: CMakeFiles/cmTC_=
3d2da.dir/src.cxx.o] Error 1<br>make[3]: Leaving directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>make[2]: *** [Makef=
ile:121: cmTC_3d2da/fast] Error 2<br>make[2]: Leaving directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br><br><br>Source=
 file was:<br>int main() { return 0; }<br>Performing C++ SOURCE FILE Test C=
OMPILER_SUPPORT_STRICTANSI failed with the following output:<br>Change Dir:=
 /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9=
91967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp<br><br>Run Buil=
d Command(s):/usr/bin/make cmTC_b2340/fast &amp;&amp; make[2]: Entering dir=
ectory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497=
c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;=
<br>/usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make CMakeFiles/cmTC_b=
2340.dir/build<br>make[3]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>Building CXX object CMakeFiles/c=
mTC_b2340.dir/src.cxx.o<br>/home/test/tmp/.../per-package/tensorflow-lite/h=
ost/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/tensor=
flow-lite/host/aarch64-buildroot-linux-gnu/sysroot =C2=A0 =C2=A0-D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_FO=
RTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations =C2=A0-march=3Da=
rmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar-sub=
scripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-=
strings -Wformat-security -Wlogical-op -Wenum-conversion -Wdouble-promotion=
 -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -fno-check-new -fn=
o-common -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror =C2=A0-DND=
EBUG -fPIE =C2=A0 -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c /h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>aarch64=
-linux-g++.br_real: error: unrecognized command-line option &#39;-strict-an=
si&#39;; did you mean &#39;-fstrict-enums&#39;?<br>make[3]: *** [CMakeFiles=
/cmTC_b2340.dir/build.make:66: CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1=
<br>make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-lit=
e-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/=
CMakeFiles/CMakeTmp&#39;<br>make[2]: *** [Makefile:121: cmTC_b2340/fast] Er=
ror 2<br>make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflo=
w-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-b=
uild/CMakeFiles/CMakeTmp&#39;<br></div><div><br></div><div>Can anyone pleas=
e let me know what could be an issue and how to resolve it?</div><div><br><=
/div><div>Thanks in advance</div><div><br></div></div>

--000000000000aad21106048b9f66--

--===============6856398545777289321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6856398545777289321==--
