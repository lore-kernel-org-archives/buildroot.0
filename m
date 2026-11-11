Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E6606A320
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 04:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hK9uZKFB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Ru8uZWJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E133840945;
	Wed, 11 Nov 2026 04:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcSHSuzrrLss; Wed, 11 Nov 2026 04:24:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF045409A1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794371062;
	b=mSYQ90foRZxd+dqkwH/Lvd6IjH6DXbtbkmErNQCe8ye53S4bIexM1xOkbMZHgejxSQYs
	 T4wb91iwYmdqIYFUHZxmV5jhlAdYBITp9dcp+oP5Mtv2y2erkzpWL79Hkco4qm+HUjW9L
	 rxdumLSEHFZP51JmeZp1ZMaCfvyye/stGjTPX1o2fWZNK6GKuRJFsrY+ZCTmJoZC/hPx8
	 Q5zkM2k+BgDLiJYnx59czuLM4XGyeSGQ4PuxhhuHNXqgN/6ZBdrl09AXdj0BfH81tIbZ7
	 kuy5hAryyGFM2g+njHfs6dir6dsI8Xd2xocbwNddKV/ZRwoz/7w8+PmTuwRqdJ1bG8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794371062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K8Pnw1as6oSx4wvqwDsLhk9iElrmAdwlcIewbWz+0yo=;
	b=tcmy7X6PLCCRcFQNEDwYNdLMoAtx4R4+pbZYaxxhLIa0w+P4MoeDqybf9va1GTv/u+3i
	 cPCJr/gtrLrqqBsO7f0WafbsmiG7f2yBeVyHraqWScialdMRj0//Pl3TG6ujHPH/zbm1H
	 d+Ipqh8ZQXckxXGwI3TjysMEyOkAVd9hGsrYEhVjMQXdONvGFhEq0Ka+WJtwvCNAwz9Zj
	 LYNoGWpyLS4wN15X4uK7mxwkpjNEaVURj1edx8wAyb+yzd4Lg6Gl6OAfB391W804San/r
	 fT/tuka0gcjreFdVwV+oJ5XxNlorntprYkMunPzNlfRLyaTJXz4qHPf+TEzFosXjIAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794371062;
	bh=K8Pnw1as6oSx4wvqwDsLhk9iElrmAdwlcIewbWz+0yo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hK9uZKFBZOPwAqIvsONZskKk1C5ITbs5scPYyK95XGu+vc53GEXwSbIecEEEQa91n
	 4BD6hz3JIU++1PvEXqR35OLchzitEyd4/CfZB1BAHXtlJG+PXn77uL+iKxqcRJqtEJ
	 GnHYKJ3Xw7t9woIrL6cH3HHLx3e4JghrxU6htyW0pMM0+rAwH91aZS1r1XYT/wTuJy
	 nKoEVnXhLrt+rQ7NCdXrj/CsyEtkgKtlTDiOY69Z+0dyGctspT0smgpJZ1k60NyPpA
	 zsMqryOLw46QvUSaeok6rbyEslE9OB0gPg0m354OawpFkYURP3XUusWN9p59vqFGKI
	 Me6oHjVMhplBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF045409A1;
	Wed, 11 Nov 2026 04:24:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4191A731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 04:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F6A608C4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 04:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xC4JHKW_F5d3 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 04:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5016960721
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=0Ru8uZWJ
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5016960721
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 04:24:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1662342f8f.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794371055; x=1794975855; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZB/Gv5isNgVWk5aQiRgU0DrTL69qiOVjqLr0vx/hJY0=;
 b=0Ru8uZWJQ4UUz/htKDbaeDkncU10EE5OYjvShYN/s3F+B+lJtA6nQUp9R0XUtnuK6C
 1ilJwBnPPOLNjleq7i9RhAaDgs/Pkl9OGXK1K28mzBnhMArAo0Qq3GjgNcpLBF9WlCjr
 UUGVt+GZu7QGlo8gC+gEICK0WileFeI0W565mLp5SSLK59OwGbaH9AgZbEClEYUxLeZa
 Ne+wT3mPMA/51gbffp4JsN/wJPalRLsxw5zZWq+JKSICSUN2i9xS5H+hC3aygT1PL8Rr
 9qRt/QFr6n0z+XQOs5Ggy0Ex7TKIU4rAf4b196chILT1xMu1jlj5EJzVcEjddrZ0coZ7
 pNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794371055; x=1794975855;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZB/Gv5isNgVWk5aQiRgU0DrTL69qiOVjqLr0vx/hJY0=;
 b=P65DL/fBK4TqQJjRLv5bgXMNI6JHjq6WDsy3pe/Ww8DGYCiZ4mgNyRIXdtE+kJDcvk
 QRtb7H90ioF8OhkfZfD8AoE97beiS72S1vAd/GetlIyFX14A/p052mQUZVC8GxxN8JgA
 pxCWtHDcnG3MxxQZHI4oFi5FcXOIRBg5i6bETmnSMNcred5nVhHRTQUVx6EaY01H6Xop
 j3W6kWYYXF31uO2UgmXxqIOyZdPneJ0x9XAyApFHnSaPrkQWqUxJdYcXjfzcSmcAGI8l
 3J1GHprjcwgBADe1rtc+P8tJ6m5k6x6XDF9MJNSQ+6WjE8QVv+xNc/Z8NnvV4e6rL574
 YI5A==
X-Gm-Message-State: APuU4Z938xABvEu/1J0+AWc4FNXky5ivXwpb5ASSTJ6B0rxJcUXh87L5
 sZXbJahv5MYZTXh4ecCcGQjSUgIrvY6R1zoW+h/AQ56fWyGcyPOrHjMa8qdxf0nZ
X-Gm-Gg: AYBFou1IPM8dCXnjFtIbocdOOGkq/UFdgtW9c8wGIqxxZEXoYePtvDJ1h6Oe6OGJCDN
 5VhPivfDN4SLGqMJl/jImDx301Jmui4yclOw7kphKPd5GjN4GD7ajagLm0+v5Tj916Zfz8dCALt
 oOfVTnpQIPe9VvkWgxkZZjJ6IiyiS/1+5Po2ZXBqFzz6qrd6JF4tAtkD7Z9dNGbg7AmaDicnbPO
 JRrX7n62EbgDQsLiyIAya+v2thM5+1Paynkte4vPSs3ZycmHAxfjsEzCxmPUpB/8U0kFD3u2TTo
 EkgnQ0wVlxz92GlilohtwtZQUlPVbxA+h2a1oHTT1RIpXvqJB6ykeSM8dRJBlPdFoKQ7SoX/jFk
 /S1H+Nbg8ln5C2kE0HOn1hrwwuap8kI9FxWCVfP9t6q7NljPT6oGJ4gfaE9ExlrhsKNSGOpcy9f
 rBeQqcdpq70WUXIbTY/+J/+76jlupG12K6rdndyiNSuSJglCJcxvtvcfHauIzYxKZCdpxGlP4nY
 B7IZpANAynakSfJb2ts0uZjiZTq5Nyy8iwT1UcA4dUKCFFbePGtiBeKkxz7tBc5BM6P0nWuDJon
 AiJKz3tBCPIq5FBPfWxEL42ECrK8Cfz3
X-Received: by 2002:a05:6000:4b1c:b0:48e:3fc:e393 with SMTP id
 ffacd0b85a97d-499c3ba0605mr1405699f8f.6.1794371055083; 
 Tue, 10 Nov 2026 20:24:15 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c500asm8321825f8f.48.2026.11.10.20.24.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 20:24:14 -0800 (PST)
Message-ID: <6af3edee.cf9c1d7a.1a3270.2692@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 11 Nov 2026 04:24:14 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
  2026.05.x  |  2  |  5  |  0  |  7  |
  2026.08.x  |  3  |  7  |  0  | 10  |
    master   | 67  | 201 |  2  | 270 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 13
                 glibmm-2.76.0 | 9 
             glibmm2_66-2.66.8 | 6 
                    attr-2.6.0 | 5 
                host-odb-2.4.0 | 5 
                        chawan | 4 
             fswebcam-20200725 | 4 
host-am335x-pru-package-5f3... | 4 
                  bcusdk-0.0.5 | 3 
                   bird-2.15.1 | 3 
             dahdi-linux-3.3.0 | 3 
                  ffmpeg-9.0.2 | 3 
                 haproxy-3.4.4 | 3 
    host-mender-artifact-4.4.2 | 3 
            host-mfgtools-0.02 | 3 
         host-ti-cgt-pru-2.3.3 | 3 
      host-uboot-tools-2026.07 | 3 
               libglib2-2.90.1 | 3 
               linux-pam-1.7.2 | 3 
             open62541-v1.5.10 | 3 
                    opus-1.6.1 | 3 
                opus-tools-0.2 | 3 
python-remi-2022.7.27-37-g1... | 3 
raw2rgbpnm-f28b903ca63b4c22... | 3 
                  xxhash-0.8.4 | 3 
am33x-cm3-fb484c5e54f2e31cf... | 2 
               collectd-5.12.0 | 2 
            dt-utils-2023.11.0 | 2 
                 host-gdb-15.2 | 2 
              host-rust-1.99.1 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
                 lcdproc-0.5.9 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
           libwebsockets-5.1.0 | 2 
            quickjs-2026-06-04 | 2 
                 rtl_433-25.12 | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                    sbctl-0.18 | 2 
                 systemd-262.2 | 2 
          aardvark-dns-v1.17.1 | 1 
                    bat-0.26.1 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.5.0 | 1 
                       busybox | 1 
                busybox-1.38.0 | 1 
                  chawan-0.5.1 | 1 
check-11970a7e112dfe243a2e6... | 1 
              containerd-2.3.7 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202608 | 1 
                      fio-3.42 | 1 
                   foot-1.26.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.44-70-g21442dba0d0b... | 1 
            gstreamer1-1.24.13 | 1 
               harfbuzz-15.0.0 | 1 
host-android-tools-4.2.2+gi... | 1 
       host-gcc-initial-16.2.0 | 1 
host-google-breakpad-f49c2f... | 1 
              host-llvm-23.1.5 | 1 
            igd2-for-linux-2.2 | 1 
                  libbpf-1.6.2 | 1 
               libdvbcsa-1.1.0 | 1 
               libecoli-0.11.3 | 1 
libfutils-c326ce0cc2a735438... | 1 
              libgcrypt-1.12.3 | 1 
                libmad-0.15.1b | 1 
                    libopenssl | 1 
              libopenssl-3.6.5 | 1 
                libressl-4.3.4 | 1 
               libtalloc-2.4.4 | 1 
           libtraceevent-1.9.1 | 1 
               libunwind-1.8.3 | 1 
                 libv4l-1.32.0 | 1 
                linux-5.10.274 | 1 
                 linux-6.1.192 | 1 
                   linux-7.3.3 | 1 
                   linux-tools | 1 
                  lldpd-1.0.22 | 1 
                   lmdb-0.9.35 | 1 
                    lua-ev-1.5 | 1 
                 mbedtls-3.6.7 | 1 
               mosquitto-2.1.2 | 1 
                  multicat-2.3 | 1 
                    ne10-1.2.1 | 1 
               nfs-utils-3.1.1 | 1 
                  ntp-4.2.8p18 | 1 
                   oatpp-1.3.1 | 1 
                 openmpi-4.1.8 | 1 
                openntpd-6.8p1 | 1 
            optee-client-4.9.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                   pcre2-10.49 | 1 
                   perl-5.42.3 | 1 
        perl-xml-libxml-2.0134 | 1 
               procps-ng-4.0.6 | 1 
           python-zlmdb-23.1.1 | 1 
               python3-3.14.10 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   qemu-11.0.0 | 1 
                   rsync-3.5.2 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 samba4-4.25.1 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.27.1 | 1 
           virglrenderer-1.3.0 | 1 
                 xenomai-3.2.5 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/5c55716fd2ec13c12f6ee0e6a01b54fdc492ab61 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/fefc276320d704f7b9da4f5666cd67192ec4ef39 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/887bfa4a6ddbc8acd06154ca2bee9c6f0d1cd416 | ORPH
   sh4eb     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/12858fe8ee2d55c3539a4d8932ecc31ccbf0efc7 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/5588eac27a903d77aee70ca2867a48d1ae838b14 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/413162baeaa6e37ed41e46653c713610ed392f73 |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ba93911322a7da5b4a4df7c007fa60d3a51d12a3 |     
    mips     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0696d5254bb676ec1019e3b623174219331d5861 |     
   x86_64    |           bat-0.26.1           | NOK | https://autobuild.buildroot.org/results/f5f806d169ee29640b837fadf075e60eb0c38145 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a52edeccbf9986921ff098fce0c590899851c9c1 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e2131f925451049c54df5d7c89b54464e9cc57c4 |     
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/35f86d551396e80a0f4850d66ddb2fdd06003185 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/73844202bb7aa56d926370b77be9e73aae440293 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/db68e9ed6063ba31ab9230bdc0276a40086b2dee |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c3561a48aac18acf5b65049dcee9b353c1ccb057 |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/8ccf06a3d2d8075b1d2598d888a2a8f3a1e9dfda |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/00bfe3bd4ce9ff7cc28aa7a623acf4e16be3c77f |     
  mips64el   |            busybox             | TIM | https://autobuild.buildroot.org/results/5d324ee93434c45da8eee65c48ce38a6fe4c8ec6 |     
  mips64el   |         busybox-1.38.0         | NOK | https://autobuild.buildroot.org/results/750b52e421d4e216feafe9b7d602438a2a58b4b6 | ORPH
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/256d2f712bf282c34debb0e84115e775629f24c7 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/d317014f1f5457865716581abf81c253e0dbd4f9 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/fb9ba7fc9ce5ae3aeb9961617e1d5170014aa9b2 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/96af1acb6aa8d47e0bf7157751691d27c1ee8585 |     
   x86_64    |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/85b7482b34377dadd13970f1fe827c2bd759fda7 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/75ea69f8aaba8879038e1ccc758c7af13d00c2b9 | ORPH
  aarch64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/0b105f951e923ac1c8292a1655f6b87e73cb19de | ORPH
powerpc64le  |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/cdb4dba11d1cb2854184da3ebe2f5d82a4745e56 | ORPH
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/2da53a76aae3d267df56b8c0c723d911badba085 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6f7b5ff9337c2542387c883ab8ea4dfe3d7e41e6 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c2577bc74192d20853ac981fc95a5321dcad4ec0 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/30fa20762396e776e2c168007c7f34faf5330800 | ORPH
  aarch64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/b9eee5f321682db3e6ca62437b09e6b21a221aee |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/e8d4d972f15e26d7e6619d944bf2a2125962eef0 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/4bb69061fa0017c4f842c92237c90d050e2d55ca | ORPH
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/41651cb299fbe9ace36cc5c06c6c195c7ee35c0b |     
    i686     |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/31b7a6c2f1296edd0ff23657f92dd6e8854c32c2 |     
    arm      |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/91cb8573a8a222d076333b15ec9eed13e333b1c3 |     
  mips64el   |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/1feff9043f5604f007707551dff15a425cffd0d3 |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/02ff5de266be197c9a10059bef05b29302c95e85 |     
   x86_64    |          foot-1.26.0           | NOK | https://autobuild.buildroot.org/results/daec23a9b64bcb353adca069519ff63259152ad6 | ORPH
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | https://autobuild.buildroot.org/results/cfb9af1535e77ce69562190cd974da86ebb245f4 |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/5943a5761faf5a7e9bec2b44c7058c6c72d0f5e7 |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/71fe098512bc182b19d2737b9881e77af7575ad4 |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/27b67d15febb197fa1f7c30d39e6096ecfef0e1e |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/5d411af0a7593f3fadbfdcd5b4e84b946bed8ce1 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/858f7a4943b52d2470a49c979ba3ce24282e1d56 | ORPH
loongarch64  | glibc-2.44-70-g21442dba0d0b... | NOK | https://autobuild.buildroot.org/results/dee8ae6ef51564bc6630d9434c7f252d83e5b80d |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/458054c42863b13e1496df051442862e6511a18a |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/5042c522c4ea4d6ee656f5952906da594b5e2ae0 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/e6c7e28f2521fef5496a616e0bef241f77376f34 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a00911d63c983f43a38f2a2e97da65f79c9079af |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/0806adeb8aeb0a0f9be0c53e7494270bb991e2f4 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/72aa8b40433343108f94af84a9c8e27888483c16 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/7a9903ad6abf8fe2be398af0e7ac2081b7e9b2c8 |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/27d583ec96aba3b8097af1bc3f74f4569c4fdb20 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/fc9b6bd235fabef7d522cf6cb21326c54bd5a634 |     
   x86_64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/5b95c1ffa4915e09c875ed7be4ffd843268fbb7a |     
    arm      |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/c8611221c04699e360944f111f2d3ee4059f0d86 |     
powerpc64le  |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/f3b46a7b8ddbe5aaaee23322e3ee6c5f5c35654a |     
   x86_64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/ef4306b952bcff712c0d1d4d4c5520e4a6b3d33a |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/64b776bfc92f7d5c51866c6f7ddfc5aa23342ed9 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/cb9cb9c7069c55ba4a9a71e48ed462a873bcda84 |     
    arm      |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/4ed115358168048503b85c149e85dacc6b580c61 | ORPH
   x86_64    |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/833cd17be7b9f950a9bce1dd5839af78425d2586 |     
    hppa     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/6f4d4714e87ddf95581e5623f6606eec52b74441 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/618e317af0c4d3154f1c818eb47d59e809eaaff8 |     
powerpc64le  |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/40196e55582f8ca5bd6198a3571fd0c822979d4a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d6e70d200a3a7003a1d3fb03000fcfbd6b9dcc56 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/43a2f4aefa20eaeab43de582f651aa42f1302465 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8da58c489c3a7880251ad6e98f26b23ae88db2a3 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ec0cb6ce30bac5ecfd0b7d30f8011d6f681132cc |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/1665dfb92057a08c178bd07a8c496b1d7d0ffc1b |     
    arm      |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/24b191e60d399cc3164a6ff06885e89964fa0205 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3b41f704a212a302c0ce09ff915d68076c889bb8 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ef10c6e2554ba0f9944b4cbc43518a6e52dfa70d | ORPH
    arm      | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/01d7a166a60594d2bb1d00c4c42511ba28c9ec33 |     
    i686     |        host-llvm-23.1.5        | NOK | https://autobuild.buildroot.org/results/05d53b04b6f9fe62f4cf8755c7a20fccf9b849cc |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/bda20bffdccf72bd5f457fd36b2a9ca7f42cd47f |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/0bd47d2d5381f1240eff0d2f2b5edae21f1eb5c2 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/d6593fb2c0d2fb3ccf69d7c0f040a72d277420b1 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/713822fe32c6ada1a1a1d8ca94a8e3a1cd626e8b |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/bbee9fdd36b03120f110cab119efec495f50b57a |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/fa18fc9c145d0cf89629592d6263fb5a8b44bcbe |     
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/53875a1898688f9e2285c91d2f90fa5285f00b57 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7aa970f26d8d83294da71e6879d6018b477c26a7 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8e9e6d4f186d17790a03a2cc9626c1eb0f82d8db | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/62335b42fe6c9470a4b96f5dde75773c5e83d6c8 | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cf2b87fc8b9c87c062a60c93ecb274264efad1d9 | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/d4c2bba3bf2140db3ac90e053a5c5449cac6a783 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/1c72e4197f456b949e334b76fe433a8e340dc142 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/553886d522ec6e7945ce591f22347211fde4bb55 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/d1f905d35f2634f13107c81c5ff1c2684add01e9 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/169d707e5fc6db6d48539f492197e4f07d07b6b4 |     
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/dc1ea63b32eba62f3812f56d67c1a92f7f6f32ea | ORPH
    arm      |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/194807260c940a5284ef968ee041a10a60ab2d8b | ORPH
    arm      |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/681f3adb20deb68203a4d9d4b113bd5567bc039b | ORPH
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/7f67ce21ccb42040fb284344ddb35a753b0da44f |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/5573c89054e6abaa365ffadeb36201e520817903 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f54f5ceaef5508a9e13bc5de470e3330efd36072 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/5e64c8b373a81066f52f4adf858a6601a06f0740 | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/bf449eff264d828e3fb1eea7dbd1ab400c08e4c5 | ORPH
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/0c907810038752a0fd347b09a3d7e583a62a5874 |     
  aarch64    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/db41f791bb7f300b2abc98a12287774b9133505b |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/816439431735d43f7edf49cc54f8b59dc2ff9b7c |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/2209f6ec43eeda3ac3e2e8a475d19305d3617c6b | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/12fdbbc1b55f20fd481d42d0cbb55308d503ca32 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/806a893d95c487917e8ddacd8092fef8bc07dbfa |     
    arm      |        libgcrypt-1.12.3        | NOK | https://autobuild.buildroot.org/results/730d7cf6cf7feb7f2d6f8e14250d4752a8e2e69e | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/acf20d695431f93ed2e3bbd5ee459883fd7c20eb |     
    m68k     |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/c1c5a91612fd28f88841752125516b75feee1f56 |     
  sparc64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/663934d4726812f18b9b15333f456777e0c085da |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/9c842711bfa6faa1fe7a0e139cd5783c14e78c62 | ORPH
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/465eb3ec734657fb47919e2b16416ec7e594dc3f |     
    arm      |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/89f4b39a599b2fe414f0c8f6664f319f46c9dd1a |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/85737d136698e57af162e9fd3d1dcb80e4aca0f7 | ORPH
  mips64el   |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/1109064b0be37d46fd50e23bd6424d9d9f593e8a |     
    arm      |      libtraceevent-1.9.1       | NOK | https://autobuild.buildroot.org/results/7255c3dead9a4a90775abc58536aefa9c13118eb |     
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/3c5cd1f515b0aae2f38138002fc4138f79432186 | ORPH
  mips64el   |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/f92b4ccb52f8fc854803f6085d097c8881d74781 |     
  aarch64    |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/c35aaf17e24e7c2f0697b6f746b0491105919f4e |     
    arm      |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/aa7f536e1111216a619f2c01fa042b8ae76cc3e1 |     
powerpc64le  |         linux-5.10.274         | NOK | https://autobuild.buildroot.org/results/3b4d5e7b9fbc268cc41d8febafefc2b19d27d6ed | ORPH
    i686     |         linux-6.1.192          | NOK | https://autobuild.buildroot.org/results/103c02fde3e9d68cd3219bc638de9de52b0d2a0d | ORPH
   x86_64    |          linux-7.3.3           | NOK | https://autobuild.buildroot.org/results/4e72e84b320b226e220f72288c20b83b3437baf9 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3320bb18a41841fb45f2ed228dfa621a51e650c1 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/524ce3e12b6bb0252188449336bb7d8e59ff1fb8 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3677511c78b6de6dbb521369b2b8815df4fa0d6f | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6e9c142e2b742615933d8e892604476907999dca | ORPH
    arm      |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/2365b9c88237ee2605d789adbd6d4a85613bf8f6 | ORPH
powerpc64le  |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/77f3e532cc629c5bad59e07ae6bc59906a49d514 | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/0b96a04ff6e76d3151419d9bb488865f7de0bb79 |     
    arm      |         mbedtls-3.6.7          | NOK | https://autobuild.buildroot.org/results/b2c4ebbcaf4e10f18497f7f90fc115315707d56a |     
  mips64el   |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/4fa2ccacb7d11c7396f1dc82993e7d67f2790908 |     
powerpc64le  |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/cf88752dc46acc71c1b93d27381f5c309817d800 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f4a6092fbb6e6ce138c9e58f60b7ffa573053d6c |     
  mips64el   |        nfs-utils-3.1.1         | NOK | https://autobuild.buildroot.org/results/7c52ec55756d30da14609d57766b85340dc020dd |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/92693f7430a51af0f21a819c0afb2b91a87fdcca |     
    i686     |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/d364d0a2e37e42f74161a06faaa811b4e457ab62 |     
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/2d4c241d793ab9860b1d032c8621fec962455d16 | ORPH
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/276fe5f1dbd6c3bee023053ae9565eef084e7374 | ORPH
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/3036a55ad5dcb4187cf3b9106b0e069775465f69 | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/c2683f563e1b85339dfca6338cceb9696d17ae6f |     
   x86_64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bfcd46dc8d0b6799c7408845ba05737f039cddc0 | ORPH
microblazeel |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/597168067ea751622e522c7a874396333d878dff |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/fd41d4c1f17f702442f9cdb2f96fa2939fc58b04 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/a9b783d2b41334e8b229ca633a22eef3082ff5da |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/487e8f1cc84996f1cd000f01ea4aced4d0aa1e72 |     
    i686     |         opus-tools-0.2         | NOK | https://autobuild.buildroot.org/results/ecacbcafeb42661bd62745f98a375ffd58155aa5 | ORPH
    arm      |         opus-tools-0.2         | NOK | https://autobuild.buildroot.org/results/9bd1eee339f750896050afd6e2c939e87891a294 | ORPH
    arm      |         opus-tools-0.2         | NOK | https://autobuild.buildroot.org/results/aae369ca56f391e875efc6d98f67c450df57a6c8 | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/46848c357150ffd4bbcfcb34a697c603002c26d6 | ORPH
powerpc64le  |          pcre2-10.49           | NOK | https://autobuild.buildroot.org/results/bb414417dd3d95f8b87f8a4e2e92ed2bdccdcd39 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/79cb80d2dfee1c646a63a92ed2cf074def25af93 |     
  mips64el   |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/0b05e425c3f57808e28bd3f0db970f53a6877e9a |     
   x86_64    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/8fac935b86ac133de806138cf77e0a0cbe246e84 | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2db26f9c37a233561c267f376d22218c0d031ed3 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/417e7c67d77d1f980902657e3fdd2209ffd3df92 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2e93a8df59d9d7dc40d3e9825c5c84ad7df57e5e |     
    arm      |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/2f2020ee893e4c65e735dcc194964314922b4f2d |     
    i686     |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/3ba7d3aa4eda2f466a23033ee7fbca0cbc10c080 |     
  mips64el   | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/31d27e40ac1b3c3e5faec6d3dec94575e782a55a |     
  aarch64    |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/60c1a5469de3b8d46318b12585a855cab89e2530 |     
    arm      |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/afe855bd05d620c2eba8ec62be16212e75b1f6f7 |     
  mips64el   |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/40ddc8cd433ec0cbf2057910d5bb2b776ba07d33 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/cd1ec81f593d914dc30c4c24371413f9b899ae75 |     
    sh4a     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/ed0a9cb306c4c9e74de0ec46387daff7b7b79cd0 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/4e61a32a312e4f55264766c0f5d0b661be076ea2 |     
  mips64el   |          rsync-3.5.2           | NOK | https://autobuild.buildroot.org/results/3e5be380d4ed829e73eba610e57981b03d719d39 |     
  aarch64    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/3387c86c081a9915eacbf8ab9cb61c48b09c87bf |     
   mipsel    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/2c1e882e5ce1c38ac4b286c457b173630a796361 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/3f0db504b9c259fd198289e60414841c406ea221 |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/8a0cbc0b18f4c457184db809c0b25a8ab5da85c9 |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/2e38a389142cb77565c5745e17dbf87811d63192 | ORPH
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/36997e6a05473e722f47acfb00743a321e8330c9 |     
  mips64el   |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/48457d6f05e529557f6d9b063389c218a327dbba |     
powerpc64le  |         samba4-4.25.1          | NOK | https://autobuild.buildroot.org/results/607e6ac29cfcf3feab5445f5ed88d9c2a431408e |     
   x86_64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/36858ec5725db34e68e203b643d32fcd13249a4a | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/5ec03b9283e82218b19b7986e3fce56a6d04128f | ORPH
  mips64el   |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/d42e072206fd1e723545921d569d40e82f0d775d |     
  mips64el   |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/5d8d6f6baa5b0104392e4ceb006e7418d433fc6e |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/503166a90826db1f888df21f4f8ec042377b56f5 |     
    arm      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/dfad3bd46f65644ed80ed9db3b4f4af577ce0d80 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/968d556ee0887a77edda92d1a0f2b0f339f2a1ae |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/69ff4fb219924e1f4ef21d35a0f6a89a4de56ab6 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6b8e6a7c6c129d328aec6e08ee7ae2d9d5ebc5f3 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6508f463a389b90603555a3b1302e7f7196b802a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/35a3b118435ae034c392c90cd2ca8032d41cc6c5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7f1d0978026a484629afccaab92b1441375768d1 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/13f446f35109ece0aa14736e0e960fbd974dca08 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe8fb85af26cb9bb4ddb619b50536b93a1abc34d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9cae16b9864710bbd55da950e1bfc8e24c0501d7 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/175716f93d8329426d77b1d9f2aa5268396ff45f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b3c4f7de24a753301665f131bf991b0b005fac6f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a012091f13e04291f6cdb51b01f93b43a5005f24 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/93a517d5881a13dc19f0bded86bd4bd5cc7358e0 |     
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9d5caedfd50df1ba477888beeba346ba0a245fec | ORPH
  mips64el   |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/dbbc5abc310b9c0071916ed90ed14de8a7cf8d18 | ORPH
powerpc64le  |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/585ae68e8c1a21d032628bc3f50174c20cb4a505 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b81a268b8a4acfefe6790d183d7ea7f4e2a50b2d |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/e65571fbeed05480dc3372e478f66e886b322dc1 |     
    i686     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/2a840c9c33ea2e8d0675e4dc6bb60a2b5f2bfae9 | ORPH
  mips64el   |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/0a32cb6b4f0af7e2da1b635cbe628f8927d75865 | ORPH
    i686     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/1bb551a6f118cec48ae25a2e9a3ad057c689d327 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               libecoli-0.11.3 | 1 
               luasyslog-2.2.1 | 1 
                  mender-3.5.3 | 1 
            nodejs-src-22.23.4 | 1 
                   perl-5.42.3 | 1 
                systemd-258.12 | 1 
                    which-2.23 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/b9656a85da84747842c58eba8d14a6c2c98d95a3 |     
   x86_64    |        luasyslog-2.2.1         | NOK | https://autobuild.buildroot.org/results/b3bb9b47c79fd6208efa3bfa7f2539ba1be57eaf |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/a771c16888012208202943d97a451175489b7110 |     
   x86_64    |       nodejs-src-22.23.4       | NOK | https://autobuild.buildroot.org/results/689f184c3f9fa024fc09280568e39bd596c47b72 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/6489082ffd93e2cd562e11185342e7746b642091 |     
powerpc64le  |         systemd-258.12         | NOK | https://autobuild.buildroot.org/results/0cd2a6edf317497d5da7ee57b8be2a9e454f5fc1 |     
    arm      |           which-2.23           | NOK | https://autobuild.buildroot.org/results/410c7d4b6635197b536b13df1f2c29767599e143 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
                    fcft-3.3.2 | 1 
glibc-2.43-63-g20b3e8717652... | 1 
                   perl-5.42.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/c45f1911c6b5529edaf25fa41f4981d3dd922b49 | ORPH
  riscv64    | glibc-2.43-63-g20b3e8717652... | NOK | https://autobuild.buildroot.org/results/79177b21ce4feda49883bf8b955fa18ce044d6db |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c9802f5556bed59a00c43e59d87497f6b4622166 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e16f272d59f820fda09013e7b3b89f01ea587452 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/10b33698a79ae4b22be96a16950103323355aded |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             batman-adv-2024.4 | 1 
              fftw-quad-3.3.10 | 1 
      host-uboot-tools-2021.07 | 1 
                   perl-5.40.5 | 1 
          python-django-5.2.18 | 1 
                    qemu-9.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f7d3696611fd359f0e9f7753e29ec3a337c93507 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/90a6eb88d2b4e94053e5e1952033908d1c80a3da | ORPH
powerpc64le  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/2a417fa9bf20685d2a5995926c744e10eaea50c1 | ORPH
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/1c80499d34cfd9e05b16cb9357ef588126b2145c |     
  aarch64    |      python-django-5.2.18      | NOK | https://autobuild.buildroot.org/results/254148e8a977d512b979ad06a1ff4427281bd182 |     
powerpc64le  |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/f47c1a69817d1573a65d6ac2d94a716476cfc5f5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
