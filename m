Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5E2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 21:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14E261298;
	Wed, 30 Mar 2022 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAyv0IfVFngF; Wed, 30 Mar 2022 21:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF1E61291;
	Wed, 30 Mar 2022 21:22:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC561BF392
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CF084915
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 21:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Qd1TpYMYWbl for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 21:22:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16FD084914
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 21:22:55 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 9so23198245iou.5
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=n705qPhbg3YpdTfJg41mA4JOGusJeo/9wo+1+upx3nM=;
 b=M2K8Dl7MWSTf4W7oNHqMgS8TOdHrK4nL7nUoGbANVsOjEBT0p1lUasND303b3rW0fr
 i4HEVHt5i6RfetL4czkOkT1O+gcxBWMyugVO7+Fdy+aT2Z6c8TIXYzlhfHepm95DxAR9
 fCSuSg7iT9bZamTley2Lu6vo4oaJZN5SRQ4VfyXjXPZWmUkwSqBXBln0sWha9sTz9U3t
 GKVtGZ3SPACKvbEN+03zGMK5IUHHmYbHp911M3JqedLpw0+YM/Kmbspzj1pAlhzJ9BAD
 AL67D5tF1o0NBcf1jjFmLQNvVx8M/Z/uS6Jck2XPGKVym0LK2y0cqlH4xKvmSwfUk89D
 FRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=n705qPhbg3YpdTfJg41mA4JOGusJeo/9wo+1+upx3nM=;
 b=bFPwd0vPSkRCjAz9dVOjuVkX44xeGoe2e79KXlNWw+gDlGIfLKwJo0MGLs7tq4Kxd/
 MxABq0NyQ46llNrEPsYdGw75makAFiSifBDfUKr8NPE4cDoIotvdygWA0WYNx+G6hwtD
 ho+LK4+SK/hdf0/+IV4xKoKIT24iN6qMt/+rvgJ0V39tJ61CXTxNQVAaOPwQEqOx2axB
 gkRLbFwidJ1rxftiXbT91hGeVQ2/qg+URKovll+k9VTA2/IUW/on+liLU5PB94eR//r4
 UzJQ6HRy3szhWG3zq/Yd9pM7f75hF8oInoGcFi4bGuSgz4LprdiCDHqoij4zxcz5kYtV
 XYlQ==
X-Gm-Message-State: AOAM531vvYMs5/YvMl3QNSEpo5wSuNXRsuaMUhgpZr21kVEYVH5JVnG5
 /r4wyH/i5boWZkpz0zY21ZPTiiYBLxukEhYSFb/XMbayO4A=
X-Google-Smtp-Source: ABdhPJwHUfKu/4eQTYZALtijoxhOinE/xgE8olISx6eqt6IxkcbjfAof4yNI5oxA22uX9uBk/JMkKfAqIz4lQhwNdmo=
X-Received: by 2002:a05:6602:1583:b0:648:c289:2dab with SMTP id
 e3-20020a056602158300b00648c2892dabmr12573704iow.60.1648675373724; Wed, 30
 Mar 2022 14:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs3mV8Nhq6VzwKRfLB16cJeQkjJjc-bBeP8RO7z8RCdgw@mail.gmail.com>
In-Reply-To: <CADYjeSs3mV8Nhq6VzwKRfLB16cJeQkjJjc-bBeP8RO7z8RCdgw@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 30 Mar 2022 23:22:43 +0200
Message-ID: <CADYjeSuys9nfFULtxATGEnW1+3EhiqCNRQKvCu+nW=mnbgw0sA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] Run-time dependency error | C shared or static
 library 'acl' not found
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
Content-Type: multipart/mixed; boundary="===============7818292784000997197=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7818292784000997197==
Content-Type: multipart/alternative; boundary="000000000000003deb05db7626cd"

--000000000000003deb05db7626cd
Content-Type: text/plain; charset="UTF-8"

Hello All,

After including libraries in Buildroot I am getting below eros related
"error adding symbols: file in wrong format":

ninja: Entering directory `build'
[1/29] Linking target test-cachunker
FAILED: test-cachunker
cc  -o test-cachunker test-cachunker.p/test_test-cachunker.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[2/29] Linking target test-cadigest
FAILED: test-cadigest
cc  -o test-cadigest test-cadigest.p/test_test-cadigest.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[3/29] Linking target test-cachunker-histogram
FAILED: test-cachunker-histogram
cc  -o test-cachunker-histogram
test-cachunker-histogram.p/test_test-cachunker-histogram.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[4/29] Linking target casync-http
FAILED: casync-http
cc  -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm -Wl,--end-group
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[5/29] Linking target test-caencoder
FAILED: test-caencoder
cc  -o test-caencoder test-caencoder.p/test_test-caencoder.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[6/29] Linking target test-cachunk
FAILED: test-cachunk
cc  -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[7/29] Linking target test-calocation
FAILED: test-calocation
cc  -o test-calocation test-calocation.p/test_test-calocation.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[8/29] Linking target test-camakebst
FAILED: test-camakebst
cc  -o test-camakebst test-camakebst.p/test_test-camakebst.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[9/29] Linking target casync
FAILED: casync
cc  -o casync casync.p/src_casync-tool.c.o casync.p/src_canbd.c.o
casync.p/src_signal-handler.c.o casync.p/src_cafuse.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libfuse.so
-pthread
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libudev.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libfuse.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[10/29] Compiling C object test-caorigin.p/test_test-caorigin.c.o
ninja: build stopped: subcommand failed.


I don't understand why I am getting these errors.

Can anyone please let me know how to resolve this? When asked in
systemd/casync git, they suggested checking with Buildroot channel.

Your help will be much appreciated.

Thanks in advance

On Wed, 30 Mar 2022 at 19:04, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello All,
>
> I am building casync to use with the "rauc" tool. And I am using Buildroot
> 2022.02 as build system and I have enabled "host meson-tools " in
> Buildroot "menuconfig ". But while building using
> https://github.com/systemd/casync#building-casync
>
> meson build && ninja -C build && sudo ninja -C build install
>
> I am getting the below errors:
>
> Found pkg-config: /root/raspcm4/sources/output/host/bin/pkg-config (1.6.3)
> Run-time dependency liblzma found: YES 5.2.5
> Run-time dependency zlib found: YES 1.2.11
> Run-time dependency libzstd found: YES 1.5.2
> Run-time dependency libcurl found: YES 7.81.0
> Run-time dependency openssl found: YES 1.1.1m
>
> meson.build:135:0: ERROR: C shared or static library 'acl' not found
>
> But BR2_PACKAGE_ACL=y is already selected.
>
> Can you please let me know what is the proper package that should be
> selected in Buildroot? And also what are the other Run-time dependencies
> (libs/packages) that should be selected in Buildroot?
>
> Your help will be much appreciated.
>
> Thanks in advance
>
>
> Kind Regards,
>
> Sourabh
>

--000000000000003deb05db7626cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,<br></div><div><br></div><div>After includi=
ng libraries in Buildroot I am getting below eros=C2=A0related &quot;error =
adding symbols: file in wrong format&quot;:</div><div><br></div><div>ninja:=
 Entering directory `build&#39;<br>[1/29] Linking target test-cachunker<br>=
FAILED: test-cachunker<br>cc =C2=A0-o test-cachunker test-cachunker.p/test_=
test-cachunker.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib =
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a -lacl /root/ras=
pcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib=
/liblzma.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linu=
x-gnu/sysroot/usr/lib/libselinux.so /root/raspcm4/sources/output/host/bin/.=
./aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/raspcm4/sources=
/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so =
-lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sy=
sroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/../aarch64-bu=
ildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group -pthread<br>=
/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib/liblzma.so: error adding symbols: file in wrong form=
at<br>collect2: error: ld returned 1 exit status<br>[2/29] Linking target t=
est-cadigest<br>FAILED: test-cadigest<br>cc =C2=A0-o test-cadigest test-cad=
igest.p/test_test-cadigest.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpat=
h,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch6=
4-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a -la=
cl /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/liblzma.so /root/raspcm4/sources/output/host/bin/../aarch64-bu=
ildroot-linux-gnu/sysroot/usr/lib/libselinux.so /root/raspcm4/sources/outpu=
t/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/ras=
pcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib=
/libzstd.so -lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/.=
./aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group =
-pthread<br>/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-b=
uildroot-linux-gnu/sysroot/usr/lib/liblzma.so: error adding symbols: file i=
n wrong format<br>collect2: error: ld returned 1 exit status<br>[3/29] Link=
ing target test-cachunker-histogram<br>FAILED: test-cachunker-histogram<br>=
cc =C2=A0-o test-cachunker-histogram test-cachunker-histogram.p/test_test-c=
achunker-histogram.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root/=
raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/=
lib -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildr=
oot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a -lacl /root=
/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr=
/lib/liblzma.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib/libselinux.so /root/raspcm4/sources/output/host/b=
in/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/raspcm4/sou=
rces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd=
.so -lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gn=
u/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/../aarch6=
4-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group -pthread=
<br>/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/liblzma.so: error adding symbols: file in wrong =
format<br>collect2: error: ld returned 1 exit status<br>[4/29] Linking targ=
et casync-http<br>FAILED: casync-http<br>cc =C2=A0-o casync-http casync-htt=
p.p/src_casync-http.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root=
/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr=
/lib -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-build=
root-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a /root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libcurl.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux=
-gnu/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/../aar=
ch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so /root/raspcm4/sources=
/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so =
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroo=
t/usr/lib/libz.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroo=
t-linux-gnu/sysroot/usr/lib/libzstd.so -lm -Wl,--end-group<br>/usr/bin/ld: =
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroo=
t/usr/lib/libcurl.so: error adding symbols: file in wrong format<br>collect=
2: error: ld returned 1 exit status<br>[5/29] Linking target test-caencoder=
<br>FAILED: test-caencoder<br>cc =C2=A0-o test-caencoder test-caencoder.p/t=
est_test-caencoder.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root/=
raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/=
lib -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildr=
oot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a -lacl /root=
/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr=
/lib/liblzma.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib/libselinux.so /root/raspcm4/sources/output/host/b=
in/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/raspcm4/sou=
rces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd=
.so -lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gn=
u/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/../aarch6=
4-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group -pthread=
<br>/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/liblzma.so: error adding symbols: file in wrong =
format<br>collect2: error: ld returned 1 exit status<br>[6/29] Linking targ=
et test-cachunk<br>FAILED: test-cachunk<br>cc =C2=A0-o test-cachunk test-ca=
chunk.p/test_test-cachunk.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath=
,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysro=
ot/usr/lib -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64=
-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a -lac=
l /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so /root/raspcm4/sources/output/host/bin/../aarch64-bui=
ldroot-linux-gnu/sysroot/usr/lib/libselinux.so /root/raspcm4/sources/output=
/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libzstd.so -lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-l=
inux-gnu/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/..=
/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group -=
pthread<br>/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-bu=
ildroot-linux-gnu/sysroot/usr/lib/liblzma.so: error adding symbols: file in=
 wrong format<br>collect2: error: ld returned 1 exit status<br>[7/29] Linki=
ng target test-calocation<br>FAILED: test-calocation<br>cc =C2=A0-o test-ca=
location test-calocation.p/test_test-calocation.c.o -Wl,--as-needed -Wl,--n=
o-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-bui=
ldroot-linux-gnu/sysroot/usr/lib -Wl,-rpath-link,/root/raspcm4/sources/outp=
ut/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-grou=
p src/libshared.a -lacl /root/raspcm4/sources/output/host/bin/../aarch64-bu=
ildroot-linux-gnu/sysroot/usr/lib/liblzma.so /root/raspcm4/sources/output/h=
ost/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so /root/=
raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/=
lib/libz.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linu=
x-gnu/sysroot/usr/lib/libzstd.so -lm /root/raspcm4/sources/output/host/bin/=
../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so /root/raspcm4/sour=
ces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypt=
o.so -Wl,--end-group -pthread<br>/usr/bin/ld: /root/raspcm4/sources/output/=
host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so: error a=
dding symbols: file in wrong format<br>collect2: error: ld returned 1 exit =
status<br>[8/29] Linking target test-camakebst<br>FAILED: test-camakebst<br=
>cc =C2=A0-o test-camakebst test-camakebst.p/test_test-camakebst.c.o -Wl,--=
as-needed -Wl,--no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/b=
in/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath-link,/root/ras=
pcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib=
 -Wl,--start-group src/libshared.a -lacl /root/raspcm4/sources/output/host/=
bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so /root/raspcm4=
/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/lib=
selinux.so /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux=
-gnu/sysroot/usr/lib/libz.so /root/raspcm4/sources/output/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so -lm /root/raspcm4/sources=
/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so /=
root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot=
/usr/lib/libcrypto.so -Wl,--end-group -pthread<br>/usr/bin/ld: /root/raspcm=
4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/li=
blzma.so: error adding symbols: file in wrong format<br>collect2: error: ld=
 returned 1 exit status<br>[9/29] Linking target casync<br>FAILED: casync<b=
r>cc =C2=A0-o casync casync.p/src_casync-tool.c.o casync.p/src_canbd.c.o ca=
sync.p/src_signal-handler.c.o casync.p/src_cafuse.c.o -Wl,--as-needed -Wl,-=
-no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-b=
uildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath-link,/root/raspcm4/sources/ou=
tput/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-gr=
oup src/libshared.a -lacl /root/raspcm4/sources/output/host/bin/../aarch64-=
buildroot-linux-gnu/sysroot/usr/lib/libfuse.so -pthread /root/raspcm4/sourc=
es/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.s=
o /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libselinux.so /root/raspcm4/sources/output/host/bin/../aarch64-=
buildroot-linux-gnu/sysroot/usr/lib/libudev.so /root/raspcm4/sources/output=
/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so /root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libzstd.so -lm /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-l=
inux-gnu/sysroot/usr/lib/libssl.so /root/raspcm4/sources/output/host/bin/..=
/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group<b=
r>/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-l=
inux-gnu/sysroot/usr/lib/libfuse.so: error adding symbols: file in wrong fo=
rmat<br>collect2: error: ld returned 1 exit status<br>[10/29] Compiling C o=
bject test-caorigin.p/test_test-caorigin.c.o<br>ninja: build stopped: subco=
mmand failed.<br></div><div><br></div><div><br></div><div>I don&#39;t under=
stand why I am getting these errors.=C2=A0</div><div><br></div><div>Can any=
one please let me know how to resolve this? When asked in systemd/casync gi=
t, they suggested checking with Buildroot channel.</div><div><br></div><div=
>Your help will be much appreciated.</div><div><br></div><div>Thanks in adv=
ance=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 30 Mar 2022 at 19:04, Sourabh Hegde &lt;<a href=3D"=
mailto:hrsourabh011@gmail.com">hrsourabh011@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><p di=
r=3D"auto" style=3D"box-sizing:border-box;margin-bottom:16px;color:rgb(36,4=
1,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Hel=
vetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&=
quot;;font-size:14px;margin-top:0px">Hello All,</p><p dir=3D"auto" style=3D=
"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47=
);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helveti=
ca,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot=
;;font-size:14px">I am building casync to use with the &quot;rauc&quot; too=
l. And I am using Buildroot 2022.02 as build system and I have enabled &quo=
t;<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regu=
lar,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospac=
e;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">host m=
eson-tools &quot;</code>=C2=A0in Buildroot &quot;<code style=3D"box-sizing:=
border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menl=
o,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0=
.2em 0.4em;margin:0px;border-radius:6px">menuconfig &quot;.</code>=C2=A0But=
 while building using=C2=A0<a href=3D"https://github.com/systemd/casync#bui=
lding-casync" target=3D"_blank">https://github.com/systemd/casync#building-=
casync</a></p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px=
;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacS=
ystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><code style=3D"box-=
sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quo=
t;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;pa=
dding:0.2em 0.4em;margin:0px;border-radius:6px">meson build &amp;&amp; ninj=
a -C build &amp;&amp; sudo ninja -C build install</code></p><p dir=3D"auto"=
 style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb=
(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;;font-size:14px">I am getting the below errors:</p><p dir=3D"auto=
" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rg=
b(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quo=
t;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI =
Emoji&quot;;font-size:14px"><code style=3D"box-sizing:border-box;font-famil=
y:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Libe=
ration Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px=
;border-radius:6px">Found pkg-config: /root/raspcm4/sources/output/host/bin=
/pkg-config (1.6.3)</code><br style=3D"box-sizing:border-box"><code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time dependency=
 liblzma found: YES 5.2.5</code><br style=3D"box-sizing:border-box"><code s=
tyle=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot=
;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-si=
ze:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time depend=
ency zlib found: YES 1.2.11</code><br style=3D"box-sizing:border-box"><code=
 style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&qu=
ot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-=
size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time depe=
ndency libzstd found: YES 1.5.2</code><br style=3D"box-sizing:border-box"><=
code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular=
,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;f=
ont-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time =
dependency libcurl found: YES 7.81.0</code><br style=3D"box-sizing:border-b=
ox"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Re=
gular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monosp=
ace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-=
time dependency openssl found: YES 1.1.1m</code></p><p dir=3D"auto" style=
=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41=
,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px"><code style=3D"box-sizing:border-box;font-family:ui-mo=
nospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation =
Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border=
-radius:6px">meson.build:135:0: ERROR: C shared or static library &#39;acl&=
#39; not found</code></p><p dir=3D"auto" style=3D"box-sizing:border-box;mar=
gin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-syste=
m,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">But=C2=
=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">BR2_P=
ACKAGE_ACL=3Dy</code>=C2=A0is already selected.</p><p dir=3D"auto" style=3D=
"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47=
);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helveti=
ca,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot=
;;font-size:14px">Can you please let me know what is the proper package tha=
t should be selected in Buildroot? And also what are the other Run-time dep=
endencies (libs/packages) that should be selected in Buildroot?</p><p dir=
=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;=
color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Sego=
e UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;;font-size:14px">Your help will be much appreciated.</p>=
<p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,=
41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,He=
lvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;;font-size:14px;margin-bottom:0px">Thanks in advance</p><p dir=3D"aut=
o" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,47);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial=
,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-s=
ize:14px;margin-bottom:0px"><br></p><p style=3D"box-sizing:border-box;margi=
n-top:0px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-bottom:0px">Kind Regard=
s,</p><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,47);=
font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica=
,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;=
font-size:14px;margin-bottom:0px">Sourabh</p></div>
</blockquote></div>

--000000000000003deb05db7626cd--

--===============7818292784000997197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7818292784000997197==--
