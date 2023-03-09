Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61817C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 07:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD238418D9;
	Thu,  9 Mar 2023 07:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD238418D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24E-cbxKtT5g; Thu,  9 Mar 2023 07:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4463418DB;
	Thu,  9 Mar 2023 07:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4463418DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12B311BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83B482024
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83B482024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWcToJb056UR for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 07:50:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D211081EE3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D211081EE3
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 07:50:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10C0CC000C
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 07:50:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 09 Mar 2023 07:50:36 -0000
Message-Id: <20230309075042.C83B482024@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678348237; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8yRwGER7T5mG2LaKu57+iBAQADFCLQDz4Pwp3f781Lg=;
 b=I7v7gIG801CIzqDx9FWMPgUDTYNTPehUCZu0sr5JboH6xcNxB+MDIkYP0sW/Mf3AYHBfnu
 Btm1PQ8NB7h6Dq197etkvTdsF/OPUOEXR88oqNy8xl4Xk7pplxJYowVaJc+tYIW913NK2v
 zcDZ5tMnihM4y8vXSpECcZvMp43Je4Lum/b/l1PC4A1WSOsd1ZohPCDaNKNOvuLbnuHqu5
 ozPClQHEk3/lvUgNScJZj/591swDtvy1/L3RXNBYY3rmeOrsbQ3zjZ/8G8Twbq/TcI2xap
 VSQ6c4J7NcI7yciB17JX8qYyRrjSvd1VSg1B5YbLJgqmmtDs9rlQJ3ugEyyC9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I7v7gIG8
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-08
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

Autobuild statistics for 2023-03-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 13  |  5  |  0  | 18  |
    master   | 106 | 182 |  0  | 288 |
     next    | 19  | 34  |  0  | 53  |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 40
                   thttpd-2.29 | 14
uqmi-0a19b5b77140465c29e2af... | 7 
                host-go-1.19.6 | 6 
              host-pahole-1.24 | 6 
                elfutils-0.186 | 5 
            host-binutils-2.38 | 4 
              host-rust-1.67.0 | 4 
                    wipe-2.3.1 | 4 
  gobject-introspection-1.72.0 | 3 
       network-manager-1.40.10 | 3 
                   pcre2-10.42 | 3 
                     php-8.2.3 | 3 
                     ace-7.0.6 | 2 
                  boost-1.80.0 | 2 
                busybox-1.36.0 | 2 
                 dc3dd-7.2.641 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
                  linux-6.1.14 | 2 
        ltp-testsuite-20220930 | 2 
          lttng-modules-2.13.7 | 2 
                  mender-3.4.0 | 2 
            ocf-linux-20171122 | 2 
                    olsr-0.9.8 | 2 
            quickjs-2021-03-27 | 2 
                    sdl-1.2.15 | 2 
              traceroute-2.1.0 | 2 
           uboot-tools-2021.07 | 2 
                       unknown | 2 
                    4th-3.64.1 | 1 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
                 augeas-1.12.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                dbus-cxx-2.3.1 | 1 
              dropbear-2022.83 | 1 
              erlang-22.3.4.22 | 1 
                  faad2-2.10.1 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.37 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-11.3.0 | 1 
               ipmitool-1_8_19 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.7.0 | 1 
             libopenh264-2.3.1 | 1 
               libvorbis-1.3.7 | 1 
                   linux-tools | 1 
               log4cplus-2.1.0 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
               pulseaudio-16.1 | 1 
                     pv-1.6.20 | 1 
           python-orjson-3.8.4 | 1 
                    qemu-7.2.0 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                 rtl_433-22.11 | 1 
                speechd-0.11.4 | 1 
              tinymembench-0.4 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/1f223c3ea10903128fb7ec16879827dd7a33230d |     
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/c84528004de5532a0cf5cda04463ed2e97d69b94 | ORPH
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/729acd56b8acd5ff26f3ceca812b9385fcff5b03 | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/4e33197010f8f60b1a2588e610f04f4ba2da062e | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/1cd880ac764306ffe34e369e7538624324ec38c4 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/5e95e778ea0548fc9f301d1864e7c7ebe04d5357 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/0e511c5bdc738a46d56bd4e751fa1f72f30ccabb |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/dea56e2b54846a5d6e58bd69ac84f756e7fd863c |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/55463781b5e269cfbb10607d3f3e49a5b3f27857 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/af17d06727bf3bb4d1fb9fdfed449c342a0bed4b | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/631be3d34adf29cfb108aac4f7a98ffcee681752 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ee0e0af513f84d7ff97060546332b47cddd81cc1 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/e7e63282d28c191f323bbcc93b96aa826d0c3cdf |     
   arceb     | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/cb98cd97d21fd4d04eeed848ceae71f772dea100 |     
    or1k     |         dbus-cxx-2.3.1         | NOK | http://autobuild.buildroot.net/results/d0ff42f23c4a57e89e8f148563d5f41060d5202b |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6016fc289134490442b712dade050457574c504b | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/302edd0f240f55fa0c1c85a07ca48eb330020ea7 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/e018b81b00c4e1a4297774597db20a2a9397ec68 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/840c2a721097de8a7d0593499639abd5bec7f074 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bb5b18d450baa629215f7a9ba88073a7dc39348e | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d100cbcca8cbdb97c2518e110a04e5cfe9b15e38 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/246f3cb4ce771b2f8dd9b4d2004678c28f9d0e51 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7a0039fe855994a1525d4d85a09060400e7f5ec7 | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/f6aa9c96762c72b50cfac8585329e2f534a7faf1 |     
   sh4eb     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/19086507d8c55806b6bf428ef0bbfdcaa3c8f117 |     
    mips     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/72cdf97ba959ffd40574200b539a0d38c393a324 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cd3c50effc8fa142fa0d0b28ff6b45dfccc6dab3 | ORPH
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/70410f7d8da17ee39e4980a6d8c2d7680153d2f2 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8b3a68a0a7970db5ee113dc39cde65e85c944801 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a3702b04a90d3db65da81e0573593c41a83bdc13 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/77aa8b2e6f7d028bd9fab38900ed6c03ce8c9be1 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/06471c9a540c341c833db42e950e6c4ac66a781d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/897f0ba6c011d336495626c0342a3ba9babf20e4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/953acb37d8186e4feb9fbb982e0e9c9e92314817 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9e66314bda4198f9032428ecec8d499d159f2ace | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7fbac5c046d7aa667ec68f250475ef2dc3f06c97 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f41b8a38a7f22dd431422390caf69184530700a8 | ORPH
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/87b45da9788561a6bc9b8c5ae25b34a6289eda20 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2960c24826cb9f797b58b063ae0700b1484cbe04 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/982a6536152914df9bdbde5e8681d672543b3368 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/91a7dfd3094a00caa00225ca4269b83e2890b0f0 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/350136117349c1f3c1b15d3f8c3e64b69c17b250 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/f80b37ce696c829af17b62c1e31947bf7e10763e |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/090cec1e73f83fa82b4486197b90790afdbfc460 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/7172b45bc36e1063ad1d9ccf51d2b6d61bece41e |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/588a9aad19d91056017d8e3f22bf6eaaa78bb7a3 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/7b078c9b6d354151c5f6aa40d426dcfd9bc137d8 |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/b4580fe73a8fa85679b47a9bcad6e8debadf5074 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/445efc8443debb2245aba7adda580fcbbdc7517c |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/98d3c9f398083c66e933cf7ba0f50ac569efe3ee |     
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/75cef1dab7945e207cabb4dba2fc1e42827a8351 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/802a85b567344ad46e1a94a2798784a1a53c6d2b | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e7e00dd711fd7924d007d871270d5db4ce52b7c0 | ORPH
   xtensa    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6c4e94cfc75e59bac11173db0c60eb0f08b4bfc7 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/10d9db5ca3dbdfb65eae071f8a07391db69f8877 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c0db736b1cbae77602e320026ec316a739724d9b | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e0193dc453f98613d7649afd3bd45c94531d8ea1 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9182527364d738122783c335a79599926c0aeb85 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a417f8f36049f575b7cf1c1fb1b123055ed18f4c | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/efc645216cd003abbf6f201ad16ca77707d6fb98 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e180c0d000eb97400b0dd36f91682f1649730100 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b183a8e9e047df23bedc7e695631a0e70a74cdc4 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/954b064ea71ac34a8ed837ebe82ec8e749db78fa | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8669a8fa68e4657a801bb73032e89867d91e8a9d | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/df1bb0bedb55d1abea385f59a7523bc28dff9719 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9512c3b74f5d962651e68eb2c877001612e0026c | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/463e55dcc9732a68684310374d065116f4f06efe | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c0340b7f62d3b67d7732a38e766191c39abfe647 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b4938c620fa23a3378c5c5118e72cce88a6e1ac5 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3905535599f6bd7deab05835276358545f6d6262 | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0018c4540862f22b5c74b35c50afee13df2bf69a | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/28b8f3c8cc0eba884c1f20efe10e114230dad221 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fc94133990ed57e129022629ade1af48d21ecaf5 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a38d2c8657e85a664ff64f2fffdf821b72931ef1 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/72f216411e3cc05d5db9bca277e8a4fedb87fe52 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5c0a65b7c6bea02f3b2dd156e81451633c3a0c28 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2ac0745a3fed356548a268fa0183ded014538203 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bfa3b7ac6e276fdde38aa6432c07fe5a3fe6026b | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/be6ac23f9e8d4f8f25bd6467d1db7294d4119e4c | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1e06b7b208192b5c003a31a9e10f6b4e030b2d2a | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/18cfd949980f92fe10c0fcb3945471899f870696 | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/29f1f85300813c5bfdd5c31ca21e6887db81510b | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/112b27e1ef44bf9b676c3cc6d68c0eeeec6f75ef | ORPH
    sh4a     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1c49ecdb819ad25daa6f0b4c19997e37ab60d379 | ORPH
    sh4a     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0fa460b5e9e025baee479467cb9c0a9075a196fb | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/26fd44ef53eefb5661916a4616abb0f904654805 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e730f5cf2e513ff145ce57979d872f3152f3016b | ORPH
   xtensa    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d5805d199a300e780bf460987992777a1742e26b | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e4591a714c3492b71f871b86608bff3227c79a64 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/470a13c9b5aacd65c351fc25468a049d0939e0c6 | ORPH
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8478e2e9b5dfb8f8d28dd0c9607a15d77a675e5b |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8d2da7dc36fb1bd6546b0ea8a980af71759072f2 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/471d777cf3aa5483e080fae6eeaf063ebde3f327 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a9d3cde25ddb3f593863cf5b48fe4ec60bd97084 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/26e48f2e3d94d8f2daf363bf91860edba7b92cf4 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f0d2203000ae695397bb08ddda79d7c33a7a01a1 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/3e9a5ec607600e28edf9c85eea4dd74dc3b46d7a |     
    i686     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/6d2c6697e01f6330adeb80b8ba54dca768ba67f3 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/1a0f15f714842c726d2cb9fd3f701e720ce9ce4f |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/dd3f3937895bfa5467a84158cee889a484215946 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/39240ed61310b93141be0888c540d686fd8e633f |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/25e9c6e95e7efc6a6aebd3b3b4d60de877e04489 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5e7b0d26d118899a6e2fed0d30022f339093fb24 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7895920342f5fe6e59256874e90a2b29a3bb5c47 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5cecad5e0d62f5762f1c716360945c4316ead6fc |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/ba3dd199545d11c6cfe56fdb8bc477f83eff39cb |     
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/76d30af4732473ca34eb8ff251ae2d9dd9526924 | ORPH
   mipsel    |       libopenh264-2.3.1        | NOK | http://autobuild.buildroot.net/results/7a2721ab84375c4a4dfa376fe4106972c4593e16 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/44384dc3ba2345586878e251e8ed797b91b1cbc7 |     
microblazeel |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/9ec3ac713ae8a747e1c4e2a08232120b970921db | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/21c7632fa3b9f3165dd68373018553ab5d5aed5c | ORPH
    i586     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/efb5614d7b9c4d294d58ce23ba46fc0a5610ebe7 | ORPH
    or1k     |        log4cplus-2.1.0         | NOK | http://autobuild.buildroot.net/results/1fdb0f225e352b74bccf7a351a26dc74f3187553 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/f159902b78f7f816097a287d462b0a1e760b1ed0 |     
   sh4eb     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5c0de1f5d9d1be99357978fbb17dd1feab91571e |     
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/8b54281a3fc01fe3b70a314c3854f4ecb33453f2 |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/fded7ac74d17b43bf98ef86103fd85b3de9e554b |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/a23acb9ed5301157a8c3b9935678848c4278cf32 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/e8a61df0ded9a98abc0ac9d5dc92e3e2ce682a1f |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ee2cb5f85ed1598668c8b99df5f848ed31a218a4 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3013d906217390e6fbe0b93d30a49ce3fbbf11b5 |     
   nios2     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/4a1784f893f972e91cac409c5b2bc22fd369f3f3 | ORPH
   sh4aeb    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/5b509bb1ed3bedce105947a537bb664a38f44155 | ORPH
   mips64    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/bd3997719776081e50d6038c02aa5bc8f4078229 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1be7d7f207c29a1e14a54e0640395fbf4e042190 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e32c04b27e8150e745bdc17c188ba665ac2553aa | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/551cf1472738b18ed362a515c05fefac482304c4 | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c224b7cd27dba7165784c21899a1c5a266abaa5d | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/fc8d37cef89d1be1e194d3e3a3d536c5f464d5bb | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/9e201e090045b06e10d770384b27a729a6cdef77 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/82f9e0dec9d0ecf086ccdc2b309353996cf7593e | ORPH
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/c5cf99a15ac2622c250477dabcdf8410b12c9858 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/44d24a9997573d74b4e27047b3639fc5229a5dba |     
   armeb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/1f8d882ec4a3e4341180fe48ba9ada2098fcaa80 |     
   nios2     |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/2c41044b8a47bf7f853578458e764b2daa1dd8c6 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/af8371dc515ccedb53c0cb4861a200cd0f014de8 | ORPH
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/22c15c6446b94065b76f8ee13c7890bc39340144 |     
powerpc64le  |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/649c04e9e94deebc28cae33dd0f39c2eed5ed117 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b13e8ad33bf10fd06cf3e2f494d295d696e00a65 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/1b90b2f7fa8ab9a2d909b289de99a9c673fe0e24 |     
    sh4      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/23150025d70346b19f6452a18588ad2c6f64700d |     
   sh4eb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/1a07674a5b85442ca96a82263f1024fb4fabbaea | ORPH
  aarch64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/14555088574c4b3f187ca20037834850a3b2e009 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/cde84348c1bc746c0abae63723c154b356ff7bbc | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/db0acdb77bcc6cf90e8dd870ab334730867acec9 | ORPH
    mips     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/32e65fe1b404d211f0161a4e610a74223c84bacc |     
   nios2     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/7cafc2b309a837ad9f399d040464d90640b77a2e | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/c34a1dd830826d09b22a042b46e361a71e759943 | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0b300dd88f025f866bdbbc62b6373818182ce5eb | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e3757d7247f87a95a89f2ed98642e58fd54228e3 | ORPH
   arceb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/fa802bc74fb99c806082cbef60882da31b818c0a | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/307ab1ac93c5400b8c79c83ffe87d612dee5fa8d | ORPH
    m68k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/6586ad00bea12c61a6f4ff4879ffc2d65a450971 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0dcb89239f72ce5ff081b54914a35d3e2c984ce9 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e2156c3747b37d0ec2559a67f2f468ad42a20dbc | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/cd45eeea4a69817d4fcdc0c493d6969330223be6 | ORPH
    i686     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/166cdd92b0e1a2523fea44d426dacc242ba0e084 | ORPH
  mips64el   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/c56da4cf578c293ce54f79240764559d3f948bfb | ORPH
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/8e4f532d9d0c1ead8149dc24b7119581e41fa874 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0ca81cab59ca72b90c27f3e6ef54dc2bd301b43c | ORPH
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/c8d935c9431b1ff543fc00c3ab5cfbff10f9d258 |     
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/ed9e8319be480d994464c64a827236c3689c7c25 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/cf517b93959679e0ba17e30390604759c845c2e5 |     
    or1k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/02a1345743adda0bbd0bf3d72f0a2d81aba17981 | ORPH
   sparc     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/5b86adde2cf22672edc46ca3a63b5fbfd7d7b132 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d45f493712cc82639d16557d8956de40e5e8d232 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0676f2b5c0ae6e595764d7e4fa9d3fe834f757b1 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/dda49ad72aec3371c3744a3b171461746f6d510d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1d4b18ea3dbac14d3b0d8f130eeb870e9d89414b |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/62cefdaee8f145a33d9d7c662b796a07034a75b9 | ORPH
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/4f58291b87b25b4cdc8c2be3781255a8b80fe555 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e7924ad0d440612273d6e8dd69401c4e896a72cb | ORPH
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/afd50c0ce11a346b76aa7372c110fd15efde81fc | ORPH
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b841557e7154c56b479c97f31b232353a05b9a12 | ORPH
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/fb0643ea7b86360acb2c2c8d4979348d618a9095 | ORPH
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/3b57eec4f278233b39b1078e0e7de54d962558c5 | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/b0ea59b2a9af89d11b71e30b253eb59ff28d6d90 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/f71021a9aea03c848237be5934ae83df1c2fcf21 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/fafe886de29e072497e186f58384c694f879d2c6 | ORPH
   armeb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a356dd0cd1fb4c9a1b9d6a4cbad4ae2a34dbb562 | ORPH
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/6ae8f57303ea54db35b97550c7aaf4e55bca53a0 |     
   mips64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/bc34e674273203249487de21d7600f7ed38d3529 |     


Classification of failures by reason for next
---------------------------------------------

              fluent-bit-2.0.9 | 2 
            host-binutils-2.39 | 2 
                host-go-1.19.6 | 2 
               libglib2-2.72.3 | 2 
                  linux-6.1.11 | 2 
             lirc-tools-0.10.2 | 2 
              asterisk-16.29.1 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.38 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.67.1 | 1 
                  kexec-2.0.25 | 1 
                libxml2-2.10.3 | 1 
               lpc32xxcdl-2.11 | 1 
            modsecurity2-2.9.7 | 1 
                  netsurf-3.10 | 1 
   openvmtools-11.3.5-18557794 | 1 
                speechd-0.11.4 | 1 
                 sudo-1.9.12p2 | 1 
                 systemd-252.4 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
               xwayland-22.1.8 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/1b80abdac60eadd8f95cae40630ee134bb11e085 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/27eb62b3b84e8672446e50506a0829b63b790f55 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/346f617a5d6deebadc38b09343b4950643c319ee | ORPH
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/50c1d7df8c27ca45e2f8b89c7137864b27d82239 |     
    arm      |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/9694d21a0435666cbb1be7b5fedfd2da1a317453 |     
   armeb     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/cc17b2fe9bd1ff593d55fcb27b1e7b8badf466ad |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c0b08b5d06397e49216fd79fc86893d480deb16 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/df9de432b4dc984865780c62b78e796033d36b56 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/150c0bc61e05bc8ae3851d439218cda508f5f368 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7d1213f9575502fb18cbdfa39a9beb7c49cf9698 |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a18cc0550119f064390cd8e6387567ae45de9e97 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9a9864543296b0c4e3d474e71de27a81c3602357 |     
   x86_64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/3d601b14636cf3e44a3d21d5a463d7349db10483 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/baf7bd54a7620a6a31a39ba7bdfb3adb02b7ec3b |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f191a935892f62343791b227b9219dabee3b6238 |     
  powerpc    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/1ed2d142049bc33afcee1d75931ab11699ff27f6 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/0384ea8bad44a0c71e795c975ec1ff721aac25af | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/52ce7c66099fb96b5ad14326b100e51261a2d58d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4538635493d719e93c1cff961061ef0ad9da9223 |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/5a285c21d63d8ad51144770bd2202428c6226fed |     
  mips64el   |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/0618bc120b2e3b9c0e9a169be4fc7b799352f1cb | ORPH
   x86_64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/7e7eaa31defea16706f8f84d6cf7d2b867b6c32e | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/8349e680762a12b439233f15429fd77e18faa63a | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1b918300d892562867f5e624b3d761ec509b221d | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/1bd86fe1f7d30d4396fec1b0d091d37168c43e98 | ORPH
    mips     |       modsecurity2-2.9.7       | NOK | http://autobuild.buildroot.net/results/52776928e9d62a8e46659fb587167527afc74312 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/22e9330a29ea29d419807ca5fd98788440533457 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/b4d1c692c02d18e1941ca0653513c215f1204382 |     
   nios2     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/5ac687b12272d8c1baf21b6d2bc729ae5d70c2c6 |     
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/fdf5befc7a4e3a26a84f606d3d19458e9c6f6126 | ORPH
   nios2     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/7a71a5cf14939a074a4b1b5e46f86db2bfc33002 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5764d63fbc349c04292286e90530dd8ecef16906 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/44ed86f5577e760266322eadecc3e2c035a0ab0c | ORPH
 microblaze  |        xwayland-22.1.8         | NOK | http://autobuild.buildroot.net/results/ae71575b7066036ae33f70e6a5a1d01a900697c9 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
              host-pahole-1.24 | 1 
                  netsurf-3.10 | 1 
           python-numpy-1.23.4 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7200999bbbf251cf69310ec342a085f9a0e765d9 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f2a5eba0f208293b80367ef5666c887986522a82 |     
  powerpc    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3e723a5ab26b0491fd111756a21a3cd6ef0979b9 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ed13b77b0c904b05c906f881433d2b36643d2da8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8a22854f0683d3a4b7a0efd23e1940c1f1648d48 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

