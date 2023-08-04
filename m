Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C33C001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 05:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B8160AB0;
	Fri,  4 Aug 2023 05:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B8160AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Re9pmHpivsbr; Fri,  4 Aug 2023 05:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EC260B93;
	Fri,  4 Aug 2023 05:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EC260B93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8731BF98E
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 05:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B322260D51
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 05:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B322260D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEjK4lAbWokQ for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 05:36:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E69E60A9E
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 05:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E69E60A9E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0054BFF806
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 05:36:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 04 Aug 2023 05:36:00 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230804053605.B322260D51@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691127361; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TjsHF5owuzzghX3FWwyova2OUtH56gJDet0u+h6g2Hg=;
 b=bKrLahyA16mOtY6RA0MV9Ec9YreJrwgFMWQsX4qva5g9Lddwk7R9BUViD2V66ZfV3hGUvI
 YPp0Wi7lwUnAKL0A16Ku5qx7DR+9eRQ/OA/BxgSSh5g9VKrIlC15GymtHp1SibP3TjQQqN
 A7U+VpNqpYltqR9r2GAB3dR6jIAH2YHfCvQ66UfMsM5muvdqPwNq26MI1wvWuOaGGV8AyP
 Ao/Zh6yE7Id01PmeIkilvdyQdEOyPbJLS3E6XxNaMYbCIdIsr97HELGsTDcIhocr4l2Gxh
 ALDETQsARjTbY8Vc5niTQOxjC8OJ5UIrP7dJUefNi8sQeZRbOeEfY58kGIbtIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bKrLahyA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-03
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2023-08-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.05.x  |  5  | 13  |  0  | 18  |
    master   | 53  | 47  |  0  | 100 |

Classification of failures by reason for master
-----------------------------------------------

         host-sentry-cli-2.8.0 | 4 
             host-ccache-4.8.2 | 3 
             f2fs-tools-1.16.0 | 2 
  gobject-introspection-1.76.1 | 2 
          host-elf2flt-2021.08 | 2 
          libedit-20221030-3.1 | 2 
              open62541-v1.3.6 | 2 
                   perl-5.36.1 | 2 
             batman-adv-2022.3 | 1 
  binutils-arc-2020.09-release | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202305 | 1 
                elfutils-0.189 | 1 
                     file-5.43 | 1 
fs/squashfs/squashfs.mk:56:... | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
               gocryptfs-2.3.2 | 1 
                   guile-3.0.9 | 1 
           host-composer-2.5.8 | 1 
                host-go-1.20.7 | 1 
               host-qemu-8.0.3 | 1 
              host-rust-1.71.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                   libnss-3.92 | 1 
                   linux-6.4.7 | 1 
               linux-pam-1.5.3 | 1 
              liquid-dsp-1.5.0 | 1 
                     lxc-5.0.2 | 1 
                mongodb-4.2.18 | 1 
                python3-3.11.4 | 1 
                    sslh-1.22c | 1 
tvheadend-fe47ecb5504a521fe... | 1 
                  zabbix-6.2.7 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/81ff3991271727771f1ad9aa96f36653a93747d2 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/45e0566510a527d995b3745b948093f7ed443289 |     
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/bed5cef75772cda3e6eeb45185420337e9857ce7 | ORPH
  mips64el   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/adcc854dfc665d65d1ba7a142b99a195d1ed5c6b |     
    i686     |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/68c767c19ee497938f85a552d4914747a8e77387 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e0fdd373ca0cc72b2bc096246fb336f415601227 | ORPH
    i586     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/b257a518180755d6ca63a4cc7870355d1ad597eb |     
 aarch64_be  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/a04814e7b47bd24343e31dec53825d367d64d7e1 |     
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/e7c7aed7edccb781d31ad3f58f99b28b58c1b612 | ORPH
   x86_64    | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/59b5357e037e9edc6023fa3d1a800441264988e5 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e445fcc44bb4e80c1519560f953dc80c219992a1 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c46c31bbbb57f3a6440a5b8faca783570a9fc224 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dea8d882538cdc2d3d2af7e03f4fe6e7a9db60a2 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b6cdc98be29213107430610e1da6a6dae521740e | ORPH
   x86_64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/3ef66e5b400b233dcb647c2b09d5ac877f994e60 |     
  mips64el   |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/49709a654a3097d86ac52d0da253e38c636ba2b1 |     
  powerpc    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/1087b300d988d0e2ab18cbaa020c3dfe71ba2236 | ORPH
    arc      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/18527e0309dc1178748765528de5ef13be18856c | ORPH
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/890f9df0f745a6e6b6cbc98ffed12b41877b8e5e | ORPH
   sh4aeb    |      host-composer-2.5.8       | NOK | http://autobuild.buildroot.net/results/50658c50fde8145fac320e3b17004e98c78c6c4d |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/07f5ac1a9442367f7aea6c59b678dfb4bc34cd49 | ORPH
    arm      |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/a90f63b54415fb4dd2968a9843c376fa53464566 | ORPH
    arc      |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/154618353717be289f6a911ec28233f90a387d40 |     
    sh4      |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/f1794105ebe66567319f091cdac76409e7dcca97 |     
    i686     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/65f252bc44c1ba0ec7da9305dc5502a0c2d1b201 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/21a83942c96f07a71939e4b61e03ff3fccd711a4 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/da834709c75c9f8f244e295b2bdc3a6a0a451c4e |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d333d3d8a6797bff3b4c4e0629be8d66944e5b00 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/307d541437e2834d3b1e6c87f709310dac23604d |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/ec202caa2ca149dec4d8ee6907724c252f0c350d | ORPH
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/52e4b2f0c7033fd610f53b295520c3e44c209565 |     
  mips64el   |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/15ce1056270defb4cb1626665e8f550c1a458f00 |     
    mips     |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/9cd5d87a7c65ba34bf1a023a11f9381548a20a49 |     
  powerpc    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/79f20b5bb28e75e6122a067e1084b226fead2107 | ORPH
    arc      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/8fd483f43341d2ea630e16301a2e1496095853a4 | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/a2d150c724ab6787aeabaf31f65116f802e8584e |     
 powerpc64   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/b1cdef89c4d4a0c7b0991a4938bb86689e0f645e |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6a28983a703287e0560fb554562815a7330769be |     
   mips64    |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/e22284ef8087caf6e0aac6a7cb5ecaf6614fb6b1 | ORPH
 powerpc64   |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/9664f70015eff89f9106c06bf4fafd30cecc73ca | ORPH
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/6767ae727b43c2076ace187294078cc16b7fe8e4 |     
   armeb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/b9971e05da2c09d9aee3490afc375c03a591eda6 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/1924d084c3f9a2f7acd27afe7447dadf230e398b |     
    sh4a     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/48c95d0267ded78dc4080047f483873af76a6dc0 |     
microblazeel | tvheadend-fe47ecb5504a521fe... | NOK | http://autobuild.buildroot.net/results/0ab54d5017b09bcbd95ba814f06956549fd076de |     
  sparc64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/f79dda7fd9be8e0e5eb2f53ced1c15867a097e93 |     
   nios2     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6d5c556d483dae6136a729c16d5d0a6aa4a40c75 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 1 
               host-go-1.19.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0ad3cd3b34e6a076f579e1f2268a9478b3794baa | ORPH
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/2e6d67f23a58c13c634bf68aa37b6d08a8aa9156 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

              host-rust-1.68.2 | 3 
                 coreutils-9.3 | 2 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
             fontconfig-2.14.2 | 1 
            host-binutils-2.38 | 1 
               host-go-1.19.10 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f7bcbd2cc1aeaa98c1f0abef14b1df1c51b479a8 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cb5695eba784fe68c699f0dc7a15264930bf1bdb | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a20a68b21ec2cbd30238d08560d01abac27a99e0 | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/bc756b6558210fdfbf4bb72a54974f34b471b349 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/711faa0bfed6f470a56807cc7ab5549c8695599d | ORPH
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3e148779cf55b4cacad8c29f9e42770bada5952 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/75de1f7729991d504305ba30e94692a88180af0c |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c1c492384391fa3bcccc2d3b0007fddc78dd43c1 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/dc440f46ffef2967c91e679881f8a3256ce87d75 |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/5327d38318aefbc13a6ada0b5d25f5f803902579 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/71f8f186f2521c540604584dd29e34eda84f1e40 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2d55b7337cdd3837a0e6f5457dfd4efe11248799 | ORPH
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1881a9fe86fe7560fb93f380c70cdaee8de38f44 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
