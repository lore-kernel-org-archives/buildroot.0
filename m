Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F0C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 05:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F7C42037;
	Fri,  2 Jun 2023 05:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F7C42037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlV72f9ud3OR; Fri,  2 Jun 2023 05:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314634263F;
	Fri,  2 Jun 2023 05:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314634263F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9751BF381
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 05:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 776EA4263F
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 05:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776EA4263F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzrFh7_NqvCR for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 05:40:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A4542037
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8A4542037
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 05:40:36 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 026C3C0008
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 05:40:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 02 Jun 2023 05:40:33 -0000
Message-Id: <20230602054040.776EA4263F@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685684434; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iMWUtiUUBGjyrSpkbeXq0GfHIOfq7+b2GCwldxtH/LI=;
 b=OVE3ljTahhzm98R1ey68Ne0Ka9lIqv8V3pvOPwM3nxdwglJehJ3e/T6agD+a+j7ef5JK+q
 sTuBipRuDhw3ioWIpt3ZvYF95a363NADhODGxrxntVL8nR+29MpCSSgJNvvgxFCDKLNWzA
 DN5K577NHTELBadyJoySd+aHCLlNmIxSliVcHGzM7DPu5P8AV7TqFLYh3GyPXZ6MWek/RV
 fBaUnUvIyY0jMms1YZgVTPd5n0o7Jx93fpJDmXrtJFsC1by4vcYyJG/5Vu9/WpB6xB7+GG
 Z4XRMy43egS41Is7Ear258oilovY3yqu8/SF8+FKIlCnwjhxDrU6ozoDNn6ykQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OVE3ljTa
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-01
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

Autobuild statistics for 2023-06-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  0  |  0  |  4  |
  2023.02.x  |  3  |  9  |  0  | 12  |
    master   | 61  | 65  |  3  | 129 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 7 
         gobject-introspection | 3 
              host-rust-1.68.2 | 3 
                 agentpp-4.6.0 | 2 
           at-spi2-core-2.48.2 | 2 
          cryptodev-linux-1.12 | 2 
                elfutils-0.186 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
                host-go-1.19.9 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               libglib2-2.76.1 | 2 
ulog-0389d243352255f6182326... | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
                     dtc-1.6.1 | 1 
                  ffmpeg-4.4.4 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
google-breakpad-c85eb4a59b6... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
               ipmitool-1_8_19 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.16 | 1 
                    lcms2-2.14 | 1 
                 libnss-3.89.1 | 1 
                 libp11-0.4.12 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.3.4 | 1 
                   linux-tools | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
               perl-clone-0.46 | 1 
                      poke-3.0 | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
                speechd-0.11.4 | 1 
             stress-ng-0.15.07 | 1 
                 uclibc-1.0.43 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e35d3ef8a500cadc11927cda4e51d7f5443df172 |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8ad513b961e7833cb242d037f7a93757b381be9d |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5707d691f32c2d8ac97c5912e4c1e5432deefc33 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/a87ac562e031a05f9e51999cc93180564969dc92 | ORPH
    arm      |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/5ebf7e9775a92d4ccc73aed36c040ba49dc4d9c5 |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/aa7a47f7ab77b15aa9f0442fb80282f82365dffb |     
    i486     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/73b98f14f34d96af1fe1aea639f076dcaedd5042 | ORPH
   x86_64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/2abab129dab668705dff582f123be03eac279712 | ORPH
   armeb     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/c2576c8511cfff82d7d069466b14577cc19f8eb3 | ORPH
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3aab76c14298abd7cb4fed0c1c930560cb32c486 |     
    arm      |           dtc-1.6.1            | NOK | http://autobuild.buildroot.net/results/2ab436d3ef7d4ad3cc12fff29ca10ca8dc577511 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2b78a0bb8c788b31868ba386dc215af6fdae2092 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c0f59d9a12aad74cb148edd4867ae8e1c7e61404 | ORPH
    arm      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/fd95df777eff486e9efbf42f0c085a55b81f4c6c |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a24322a848f80f5e0b09087a99f5e1fcc9aee496 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d9ec9327af698c499e49603b79ec45b17e915f2a |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a1361993449b154810208d1424bc9f17cb72e1c8 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cf5932a8ca2e2afbfb7ff7404d3030212ab0835e |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b75810ea15e59e62c3d10fa0eff71aefe867d92f |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c080f689eea8ee832afcd203696c2bdfda84c965 |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b7421d81ec7e8b5608918642bd98006782b1ff81 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/0e5794221789219f99d9c218f5678ecbd87f8d48 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a328d0055a33e7d34221494c2fb637cb4fa18e0a |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/87613dbdc0da1e3037a18c43c79a4fa8fe409c65 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a2aa52d4fb6efafaf54b854b371b5992dc5a53d9 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8691512c62afb493df98d41d1fb7c771faa23a48 |     
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/e2d40693abe47fca8ef5585bab4d945f316584cc |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/16d8cb7f19b937ec702cc44e386c49fa0bf307b0 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/cd2c313ad7d4516bb8b8b00f4d662269a2908d2a | ORPH
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/d0a7002648652a96a835896fd8819cebc0b3d293 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/9de0a812c23a92249e2097253666bb932c3ff531 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/677d3f64fc84cd9d371c7a7e7640d2787dc3800c | ORPH
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7436cf691bbd146818f61047eeac613288426cc3 | ORPH
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/ec8e717d412869a5e9eb2e6b20f1f32ccd79557a |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/7e78a05203439ad68db48f4923a4fc8bde7c6a44 |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/f7f87546bb11a9961b7618fd8504558d782b0d49 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a5c843cd0a464dc3c2972f6053d8f14b73f94c6d |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/e391c203dd49cea330029328b13f04de42182c4b |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/9fd14dd4e2f61712a76c71bb1a64f76b9691c6da |     
   xtensa    |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/7672012a5078c8e03d97f17d72133ba835bbda07 |     
 microblaze  |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e13a53073e17fa554c903999bd7eef6b1fb9ec64 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a499c3a3b7408d252aafe640a5d77a3c6ea62139 |     
    i686     |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/372801e19b163efd5767da889a459cd8ef08f8eb |     
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/5a00637e1d2a27c2f10b53101e85414a16f66b10 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7939a7a45e48d25a79d9a44d4d52a4a896ad3613 | ORPH
 powerpc64   |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/941aaf22d482f413b23f03a322c224fe479eecbb | ORPH
   nios2     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ceeafc1fb1b53310d7d3db105d209690095dbb3c | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4e74fc58ea12c66f2783b317f578f73481065200 | ORPH
   armeb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e4eadf29dd599d80abcee16bb238d6886543c7c6 | ORPH
    arm      | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/9e59fe9f1a913bb08954200fd627e32207fbf0fc |     
   nios2     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/604a9753d5539db85b2894b7c0c2eb6ba531ece4 |     
   s390x     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/7efe674aaefc150dfe4138bdccf249dec95588f7 |     
    sh4      | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/5f6ebfd07da8b8b779eb5ab8f01e155bf47164cd |     
   arceb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/a86fb187ce3160b520c523cf58f6e001c6421cab |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/3d01848cdb26f52eb3cc5e5de9dad08c58236225 |     
   sh4eb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/6a297ab4f2fd2695a1e18bcc64568011ca2b3715 |     
   arceb     |        perl-clone-0.46         | NOK | http://autobuild.buildroot.net/results/717e7c4dde06a490834932d6fb2e735046e6996e |     
  riscv64    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/a8d2caf70fa28bbf807385ca5a21bbc9dbc7d3b0 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5632e43110ee0c6e700fcfbb866c2f1d1dea8b56 | ORPH
  mips64el   |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/4a489481c2e26a5dcd688d973147762c2b8a2638 |     
    or1k     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/742d5fe3cea8b27e1dad71ad3aa6f816ed12f435 |     
  aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/66ca3a7fd950c2864a5aa1ba719b11e0b5ddf482 |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/72045fbf84bb0a10c8b0a066048aa4388c2396ca |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0f149b6e09e7642de01351c8c0edd811b71add95 |     
  powerpc    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2303b14710028228f52fdf2a9c14f04b8c232cf8 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ba3e70fd596eb76ba06b4a7545a67d15b0921cdb | ORPH
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9220d526fc606ef115d9c0c0c90b572136569a0d |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/2e3e72cafaeed696aa446309218eaf162ef338c8 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                  brotli-1.0.9 | 1 
                busybox-1.36.0 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
       host-python-sip-4.19.25 | 1 
                  ntp-4.2.8p15 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/859f919936807c08ec20a36d948c17aa75e965a9 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/71c1cb82c551af7325b99437fe4308869fb0b0ca | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c0d3f853a73a98db031c4c1e8becc9090884b1c | ORPH
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ee2c89a6d7e5d31feb4b5be749d2b3b81d0f5676 |     
   s390x     |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/097104cb72422bc545e9d053717d48b711c345d6 |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0fa84e616ea0c6125a018b735a43282a39283b9b |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1609a078df42af5524233ba74f19b45a724e9dd4 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/8876b6cf85a0df2f83c0f9c4d0020bf3d15da683 | ORPH
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/108125698c41c137a76c9397cbc2165154299798 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
