Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA4C7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 05:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 172E941D2E;
	Tue, 30 May 2023 05:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172E941D2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcR64_pzipv5; Tue, 30 May 2023 05:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BAAD405DB;
	Tue, 30 May 2023 05:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAAD405DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A490F1BF3A9
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 05:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA6F8235E
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 05:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA6F8235E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpMuhPTJd5Ts for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 05:39:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BDF4822A8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BDF4822A8
 for <buildroot@buildroot.org>; Tue, 30 May 2023 05:39:55 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F3C524000D
 for <buildroot@buildroot.org>; Tue, 30 May 2023 05:39:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 05:39:53 -0000
Message-Id: <20230530053958.7DA6F8235E@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685425193; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bvsSvn2oz7cOfwzV62ZRSauVdbLoGLrDSqubPIYhZRE=;
 b=jectn18Wlc7eexOycKAv370XdL53sMsKh9ZFaE8dXzq2kYBNrlS6SrDVwj8JHHC/pkNrmb
 A9W0ZugYsGCM3lVCiUm4brIUWX7JI0yegMpsYOaIY9myMxIXeRMTvwqsGi3cFBVrWRJH+P
 XublBmA4NrPzn1f3ugPTHBCAog2vZdxFwSGW4kTRqWM9T7WNnfTej7/0Xv49QJfCMFILWd
 V+aVwvhZCJy2RLDmmm0E4PckkeQeygk9jFEQ/6JHP6VCGtX+YjsGuqp9Ksu4FMKDoUqpno
 1gYj7tx7E/ey7ho+B2r9AwPAvlUX85lhxBPbHvB5qoNAt65IUATql+fQxYnuvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jectn18W
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-29
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

Autobuild statistics for 2023-05-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  2  |  0  |  5  |
  2023.02.x  |  6  |  7  |  0  | 13  |
    master   | 62  | 73  |  1  | 136 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.74.0 | 5 
package/sdl2_net/sdl2_net.m... | 5 
           at-spi2-core-2.48.2 | 4 
            host-binutils-2.38 | 4 
host-heimdal-f4faaeaba371ff... | 4 
               libglib2-2.76.1 | 4 
                elfutils-0.186 | 3 
              host-rust-1.68.2 | 3 
                    olsr-0.9.8 | 3 
               syslog-ng-4.1.1 | 3 
                 agentpp-4.6.0 | 2 
                haveged-1.9.18 | 2 
                    mpv-0.35.1 | 2 
sconeserver-8d1935919a20133... | 2 
                     audit-3.1 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.12 | 1 
                     efivar-38 | 1 
                     file-5.43 | 1 
                     frr-8.4.2 | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
            host-binutils-2.39 | 1 
         host-e2fsprogs-1.46.5 | 1 
         host-gcc-final-12.2.0 | 1 
              hyperfine-1.14.0 | 1 
igh-ethercat-2e2cef61318953... | 1 
           libfreeimage-3.18.0 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20230127 | 1 
                   perl-5.36.1 | 1 
           python-pyicu-2.10.2 | 1 
                 uclibc-1.0.43 | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3ee7ee18fe5582a8a72f0bfb6351977051202a47 |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/553a0d57a491ed515e5d15ebbddcebdf206d317c |     
 microblaze  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/8e376224a4c75d47fa15ef1a65f73c3bc911be14 |     
  aarch64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/133067596f04c46fe1b420fa4c88f5ef667e76ed |     
    i686     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/8a6eda4d1b1d68082aea5a651eba654c0a664f74 |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/612dfa95bdc36243230833bf8c13c423ae7a2f8f |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/9e5a6eb55f7c996d49467650ad363af90ab742a1 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/b7321a301d779b84c619e2cfb6063d1341c21f39 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/04721e596bcff9fa630c33f7455e744f64d9a070 |     
    or1k     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/4763f13d5599746f289ba09b2a6effd73a3b7d61 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/52b7b49076e4a57f02b0d89b51b43238614c5b1c |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c59dd764ed0eb673b9d66e787dc9895bb7387950 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f1e1149a4c0d5c7e25438fe5764be3a44750a9ee | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/12c7c88f2a94c4671f956d5d6aaffe6eac33995b | ORPH
   x86_64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/d80a4b9b1db297f4b33447d727629fff8367d7e7 | ORPH
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/509e1770a8295040237ff65448379a2c73614d04 |     
   nios2     | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/4f2fadc29debd56f0eb8c9b1a5d615e0d3bb2b67 |     
  riscv64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/3e527ffbff6f772e1b5f302bf6fa4ac2dca130f9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3f8af0cb195112acb70b778896cb4191a2a8d539 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/42f8c4bedbf44c00265ac79e540dac53577419c0 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/20f92319f0489968ad51511a3d75519e6b2d29bb |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0085acbafa22d7543d44a5db50ae31d0a92e23d1 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/c50839835a742150dff11a692dd2f7b1587fb123 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a6c94dd245eb14a0f32c282a3ae6f382dc8c7502 |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8c9452c865d67fd62ee47d9e126f942cc4cb59b3 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/099966b8050e1c69bb3e876aaa7dd5af9a4665c7 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/91a02dc081584dcb62518f4e2a14d3706155a146 | ORPH
   x86_64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a0d5344575adc9605c7b1ad3616795d1e77fe16e | ORPH
   x86_64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b39b15193cb73fd0f8016f4c8e33150c9c4e94ea | ORPH
    i586     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/02243899f8af61c07c7d8f5a78c9b9f5f43615d6 |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/c5d29c6414087b5ccab6440becdb578273006f7a |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/19bb2711b6cd4207a3df9df49cdcacf88354bff7 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/99a623d8d680eb9e7dcd2aa72a03f02895499d0d |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c75f40bce826d0b9e421fc21de25ed85c1abe05c |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e83cca4259da868b889bbc1059c1365f1bfe80be |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6a77f595722f631285ba71fdc5a85ca10e88863f |     
   x86_64    |     host-e2fsprogs-1.46.5      | NOK | http://autobuild.buildroot.net/results/ca8184262d53810f8853941bee63a7c8e93a0576 | ORPH
    arm      |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/a0efcd2dba4071ac9a4c9ea01adff977088f3d9e |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/146e67ddbd235f7946b59c4768ed2987fcdc0362 | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/233b51fc581b898a5c29b4ed0e647f323bdb19a0 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2b02b5347b629c0d030aac1ef1f2c12c6b796db9 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c6b80482538d6af026e3f30ac93a228216094115 | ORPH
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/02d3851df4fc176c6f225122f08199e31b0f3f84 |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/dfacb1948b072c01e03601c9e757da44b0aa85c6 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/cfd071e5fdf327de73f08bb40b3c5b3130154826 |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/87ecc8e88a48d364f8d4f7f16d80679e015c6e77 | ORPH
   sparc     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/016fae9728bc70bb67efc89570f9fe7d399bf833 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7b0a1db960dc444e83915f2127d377f09fdf9796 |     
   xtensa    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c3941f87fe370e6c34493708ff0ced0d035eff55 |     
  powerpc    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/48d7040ef2c3d4fbf3306d93a8f6c0f167a085bd |     
    mips     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7742d8cde3c0d694378a3dd40d225ba817bc239c |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9605e562bff83996e610deb0367d0323465c53b8 |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/90ac533458ce4737eef5c1b63869033e6b8504e6 | ORPH
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/ba1a8b94cf6b53d413d1d3d29f7b2b87f9f90040 |     
  sparc64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/e9101efcca406aac6f94eea42caf12e584ca9fb8 |     
  sparc64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/ee2921f5e669d9a80d32d01412da85a0f28a83d6 |     
   arceb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e666d2a7cb12918c691ff389b70777d2dde0e6c2 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c87cc58719864dfb2b7ec3c7ee95f58ed6b34591 | ORPH
   armeb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1f5eb909e4b70aa98b664d6b5cf8ddfb879b351b | ORPH
   sh4eb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/6bd23712346375d2c3249767f64b3214804e546d |     
   sh4eb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/563585a527ac77d2194c6f3b13e80647eeb7e974 |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/101f138f53f1654cf3e63b8dfc0eaa036c3a307d |     
  aarch64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/ca06606552f9d40659b1c10e4feaadedd385b62d |     
   mips64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/9b28f413900fac9f00aff51fc56b0ec55917fdce |     
    i586     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/691da556d845e25cee8a12dcaff32b8be4b3e994 |     
    sh4      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/977c043615603dd3541e23b81c5f11374606aff6 |     
   mipsel    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/3c4e4811e9a8566445c5637f87aa5609d20c3e66 |     
   nios2     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/3ae53a6adcfb13dca5d6c844a00c4fb1689fd593 |     
 microblaze  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/8e72cf5b3f6455afd68b812b1a86c5d88bb4bde1 |     
   x86_64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/6997262f48f4a7c62f94a848ba9a4f6c2caf74f3 |     
powerpc64le  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/fb1bb894456bb29202301cc8965f24d25d9e5f98 |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/2650b284549520f0f39b8243e6d5541711fb1e97 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/15d1c6a40536f3b4cc9ee61277d569a194c7b442 |     
  mips64el   |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/8e46cd20bb8f64404e6c0dfa9cecd59029dfd9be |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                 snmppp-3.4.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a6e9bc27951557928b29eaefd3c150d531a55b01 |     
  powerpc    |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/477e487d9fc683702d5a8d593bc44cb760b30f6f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 5 
azure-iot-sdk-c-LTS_07_2022... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/735b96c842796f309c33a0545eeb2e8f8d1f75ca |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d95e2c8b4e2e06a6622e8cba5f07e28aac5bf52b |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/411a5153185e4b86f83704d5ab8e43c5586203bb |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/cb6a717304c95d3d13f8ed5ef71261704d54e805 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9cee7e6a8a22f89ae31d2866a58a5eccf39cb22b |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4f69b53eaa7464ed83140cc5b315f4fcd7fd8843 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4e962803bf4515ec3032140d910e045357040b2a |     


Gitlab CI results for 2023-05-29
================================

Detail of defconfig failures for 2023.05-rc2
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600444  |      


Detail of runtime-test failures for 2023.05-rc2
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600540  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600558  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600559  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600561  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4366820228  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4366820275  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4366820277  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4366820282  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
