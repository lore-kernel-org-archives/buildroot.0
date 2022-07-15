Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 05:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15C5240002;
	Fri, 15 Jul 2022 05:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C5240002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYcYJ5yrXmbA; Fri, 15 Jul 2022 05:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19D8C405AA;
	Fri, 15 Jul 2022 05:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D8C405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA71F1BF2FC
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 05:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D7F42818
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 05:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D7F42818
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-0ta7AgHNHF for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 05:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C8042817
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37C8042817
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 05:35:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B82620009
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 05:35:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 15 Jul 2022 05:35:11 -0000
Message-Id: <20220715053518.72D7F42818@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657863312; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+yftpOlazDZaNnjv9+bb785pat1DQnJkX4BFjnXHdkU=;
 b=Lqy/4HdYGjWHW0Hkcqh3CWLoeXR0jeRrbHhnC1m5hanOcB73kwTJh9+16X29fVw5g0MRr+
 75KM+GLZvP0uTRWlRew5AzoKJIJx3VShAN5J9j45lbE2KhV4iTQODLGV7NXsQr+aGCwdkT
 MgoJFXdeWoj/vjK5xL+ovsTeOFekJ5CYimt7ArBNjHXRdcIo+so8DdC/NYGO9Hvhofl2R5
 tPQIcLabGV/r0mmRaFCdgRGuMohkG5JYKf9zruNDcVUFSpYAdc/mICxclvTA6eWpupgBto
 qtjH+jUTx9FzgoSf6mFxRiubOjcYOOiPo2RfKVS+HmpsbfABA7+Q7A0i5TOZ/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lqy/4HdY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-14
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

Autobuild statistics for 2022-07-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  8  |  0  | 27  |
  2022.05.x  | 24  | 19  |  0  | 43  |
    master   | 198 | 299 |  0  | 497 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 34
                 uclibc-1.0.41 | 23
              alsa-utils-1.2.7 | 19
                 libvpx-1.12.0 | 10
           libfreeimage-3.18.0 | 9 
             libopenssl-1.1.1q | 9 
glibc-2.35-96-g2c4fc8e5ca74... | 8 
host-pahole-73383b3a39afe86... | 8 
                libcurl-7.84.0 | 8 
                 linux-5.17.15 | 8 
                   speex-1.2.1 | 8 
                 zlib-ng-2.0.6 | 7 
                busybox-1.35.0 | 5 
                host-go-1.18.3 | 5 
              jpeg-turbo-2.1.3 | 5 
                   perl-5.34.1 | 5 
                speexdsp-1.2.1 | 5 
  gobject-introspection-1.70.0 | 4 
host-spirv-llvm-translator-... | 4 
                libressl-3.5.3 | 4 
           linux-5.10.115-cip7 | 4 
                 pixman-0.40.0 | 4 
                bitcoin-0.21.2 | 3 
                 dash-0.5.11.5 | 3 
              host-rust-1.60.0 | 3 
            igh-ethercat-1.5.2 | 3 
               protobuf-3.20.1 | 3 
                    bat-0.19.0 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                elfutils-0.186 | 2 
         host-gcc-final-10.3.0 | 2 
         host-gcc-final-11.3.0 | 2 
          host-gcc-final-9.4.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
                libzlib-1.2.12 | 2 
       linux-5.10.109-cip5-rt4 | 2 
               openpgm-5-3-128 | 2 
              skalibs-2.10.0.3 | 2 
toolchain-external-codescap... | 2 
                   uacme-1.7.1 | 2 
/home/buildroot/autobuild/i... | 1 
             18xx-ti-utils-8.8 | 1 
                    4th-3.64.1 | 1 
              alsa-lib-1.2.7.2 | 1 
              asterisk-16.25.2 | 1 
                     aufs-util | 1 
                  brotli-1.0.9 | 1 
              dieharder-3.31.1 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                     file-5.41 | 1 
                     frr-8.2.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    glog-0.6.0 | 1 
                gnu-efi-3.0.10 | 1 
                harfbuzz-4.4.0 | 1 
             host-cmake-3.22.3 | 1 
              host-delve-1.8.0 | 1 
             host-gtest-1.12.0 | 1 
             host-patchelf-0.9 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                iptables-1.8.8 | 1 
                  jack2-1.9.20 | 1 
                  kexec-2.0.24 | 1 
                      less-590 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.70.4 | 1 
                   libnss-3.80 | 1 
           libwebsockets-4.3.1 | 1 
                ljsyscall-0.12 | 1 
make: *** Waiting for unfin... | 1 
                mbedtls-2.28.0 | 1 
                  mxs-bootlets | 1 
                nodejs-16.15.0 | 1 
                 openssh-9.0p1 | 1 
                     php-8.1.8 | 1 
                    pimd-2.3.2 | 1 
               poppler-21.12.0 | 1 
                    pppd-2.4.9 | 1 
                     pv-1.6.20 | 1 
         python-greenlet-1.1.2 | 1 
           python-orjson-3.6.7 | 1 
            python-ujson-5.2.0 | 1 
                  reaver-1.6.6 | 1 
                     refpolicy | 1 
                sg3_utils-1.47 | 1 
                suricata-6.0.5 | 1 
              swupdate-2022.05 | 1 
               tcf-agent-1.7.0 | 1 
                   tor-0.4.7.8 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                  whois-5.5.13 | 1 
                       xenomai | 1 
                xenomai-3.0.10 | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3b1976d2fd528f6edd95966bea0d36763887fc24 |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/21ea2af4d10075d69a6c6b2d6001ff7b008197af |     
  riscv64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/4845ddc6ab1a13ee906ccbbc11c5cb88b59c8820 |     
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/bba40fae4d50cc70796029c48a7d5c85875f1d73 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e9a194b7aa711975ceb79afeaf5590ce295c469d |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/77ff9b640094a6ba9b45cf7abea445d826de8e60 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e6cd7eda74bc349479ac0cc5da199f5654ded2bd |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/de594ce661b83c7c508937e1f99ebe46ce624d91 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f56e721a81e2624e58c7675153ba7f900db8d42e |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0dfa072d49ea4e46482a2b43a12a70a8e94ce29b |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3c0732f55cdc699d12d51bfcd650be429cd779ad |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3260f7a4ffb1f53cdfaf4f829571c38a8cb030c5 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fef5a3f899bd1921624fe5bef529c8220b57dcf7 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d109ba6ae34781027eb2e8737d3cfdcdeadf2f85 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5f73a788efb9ac752c60e6ab7efaa3b5a228c598 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fe6e9b52b3ddd3afee870689c36d86bf632f1f82 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4fecc43e183206ccaa14cef34f17694ab43121c9 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b2e45c892031843d323a94e836e40fb2c2c8cdef |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/006674b948dafb3eecaafca1da66ff7f14274a99 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bf432e3f6fd5ed057ffeea84701104dd05dd72ec |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/eadb2bec5384f815abeb9779fce94f42d938300c |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bb29c326225f88add742f38d53d30f9976bf9251 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b1b3b21f1b153312b8d671f0d783312f1fa9e64a |     
    i686     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/917817ef6c500ce6ddd61d6c8914dc30449c1a45 |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/006dcd9381e814c7c155648dd3a4ac9f1e34831e |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d26779139b9558976425a7ac83e9932e871c61f3 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/2077d7de0ce9626c013aa10fb16888388d9b7f92 |     
   mipsel    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/04dc346a7f748a204d35eccdabc9de8c2c643437 |     
    m68k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/41edfe37029a7e840dd92ce747fac99c7d73beb9 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/d0cda21ccabb88e9ce7ffd2f7c209104b6500702 |     
  riscv64    |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/985362c004bce2b07d211057de0b27dfe60c9d59 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7513703130120c7a149bd0be2ac341b6bb43a4ed | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/db792646799d02638d38c36285330142084687c1 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5b14148bd2abcaa852a4d6d270d2805fc1b5a905 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/67838af31b6096e40911b0af27fa1a17a429c886 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/bf49742af1a3d0f6d8ee3f29466f63418e82fbd8 | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/14a20ea8a4bee139f2dd69554ce17fbb3730e705 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/79ed2bc7951e014d539ac730417d9ae488340396 |     
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/05d43b54f9f6d7c2cb62a94d0208b6df016b06d6 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/586924aa7bc79839cff4648c8c1408c5ad7ff1e7 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3e84b0775b9eed00d332b2caee6b20883b1f40bf | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b3ff8633802e6d1b7d51eeac9f7384d11c505042 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/24d2784c41ff3e85b8f7d8cba27ca8265735ea89 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e0bcb581c48f13708436b9b4f26a002bc665d7c6 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5d173b5aa0f1a650f6d0f012f7954bd8de95cd38 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/22b9794ba2e2fb4a5f7911887524145d21825b58 |     
   mipsel    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/13675a8ea6008e884681cc41c30c1dd4d88d8659 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/add18b88f1f24b668971c2db0eb6e7e11847c588 |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/396cb308a7b5ecd439d964d7a084aef3b606632d |     
    arc      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/2cbbeacfcea818c89e262041bd45bc584d691e79 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a87cbbb3c4e05334bc54f2814c8d67222e0587cf |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5b4125cdbfad47a10775dd4c5beca319553386ec |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2513638aa6362b22bb909c6d201229a6d2d735bf |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/62dcab321011f8ea5fba8126939895c9f8799437 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6b3e2be05be414d340edec9fe8bda4d1a54db650 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/5dd7afec86e6a14c5e739eaca4bac5c2df792181 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0be08908b7869745541187e00d2587ef84302ad5 |     
   mipsel    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3aee2a19b397d6c865af95b1f8df587df6d5809f |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0352da4b6352fefafc0f80327ba2d95bc680c72b |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/c06936ecb03231711d2d9d27c79dc2135bfa3ad5 |     
    arm      |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/84acf96129856bf7ac18b32c2afd3ad2247e6c12 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/326e24d1664c9be8aab835c355f79036341b602f |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/0961e93474538b0e9522d9100be3f7dd180aae7a | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/c31cefb20115ce9fe7185df19dc9997e52e03cb5 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3d388b20a79109e2d75944bfaa985433c1e62f00 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/090806924f9659a4f0b72f590465995827574aec | ORPH
    mips     |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/0b3c6af570911d6f5b33ac986a02954db2d75e50 |     
    m68k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/39b0be68eb3a4ac86504a3654eca04ddc90c3032 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ce990a8280683452a4c704e1bd5990e3ed400562 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/25c8008170b41187cdc2be8f24c0979530412d6a |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/38b7945d93ca137d0f845313a9ef937f0fc12c30 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/605946857b5a50bde258aab0b2ce8abdf619569a |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c0b78e3c867dbd0547698c40bb2d1856a1a9454a |     
microblazeel |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/43545d39a8dcd63584eaab84dbb50f1f0c904c9d |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7a2c522510981b91e4e5f67a9b2739f547492205 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ba3bb0e57366f5afe29a9f78d0688133cbf37388 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5e2a90f12aa54dd8d8ce38744082932952a74996 | ORPH
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/9532f80334c2b1f51baf6e75348a98939bc1e5de |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d3c28c266db8d00116c514b7a1f6ddf11ff7004d |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1d92cc6d480a65a788e5330cbccade56ed33b073 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7978a9712ea7a3da4fd5b174afc58f2fa600f87e |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/f4b694e688f79ea3217b20a2e0901ad11c6b677e |     
    i686     |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/69f18165bf0219dbeeda8bf80cd3662a8266e300 |     
    i586     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/50be82c5b901b145daeb4a7952bd327289a29e5d |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5403c32e0023ae012039d449ef574ac022019cf8 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0169b4d35369ec4c38f6ceac7eb98c9e2ea3cd30 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/89e1b5264acb7a1de9d83e5f8658022e1b3f648a |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/09b0ba75b51635a66368df63cc0aeb5ac255a9f3 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8670745a89ea96ef65296f0239d47ada7c491ba7 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0a2f7e676bfa5825ae41c4fbf3797d8b1bca564f |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4dfc73c98fe4659ac74fa89f3542f881f9e62916 |     
   s390x     |       host-patchelf-0.9        | NOK | http://autobuild.buildroot.net/results/068f66c63601bc2409f66ab9d88f3acfaa466f19 | ORPH
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ca10d6028af7c9e0f5ef30ba4151548c25dfe6a4 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b26b6bc3bd21679e10e7b695d92bf8f6db3331da |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ce88451697bc4a975b944116c5777b4a2c54e3de |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/3c53507344256c9ad8a9587066613cde3b317dd7 | ORPH
    i586     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d1915e06ade90b375eb00a13922ada1e644acd1c | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/05a9713e06b71cbba5117f76c0171558f252d528 | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/28b19422201bc8105df86be99d96d6085c363ac5 | ORPH
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | http://autobuild.buildroot.net/results/89ac43b1e52c18eb8bc718c5bf24591ef8cf5f9d |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/163ba89a07ef851074588457835d92fdb37bf380 |     
   mipsel    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/3349973948c7c939b47a2632fddb765990f0e95f |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/abcc80c0415afb99d5fee4ace12271f594ce18f9 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/be738af2b991073109ff8be68fee9bb878d26133 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/3862dd3cd92908c731e1ca79e65bc3103cc2f3c5 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/acd8fc85a7804de7abd79062fde04adbc13bc3b2 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/b2c70712de0eaca54ecc834ca577e4a380928c00 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/9a83f5b4cf0d321809dc96e413f01847403b99a0 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/7010e8aa09732bb4d1860a7d8459d0845210ae06 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/5497204d656e7aa2f2e0a18897e596b3e2945d9b |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/dc03c88e964b00af2139348867f44b2c9b4fc982 | ORPH
    m68k     |            less-590            | NOK | http://autobuild.buildroot.net/results/afaea52555385d9fde8835c5ad5b45eb426e6e22 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d0c3f191870d2ec29d8f49f3940b65e92886b19f |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f22e17d830e29af07d399dc2e59fdd3a1ea41f65 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/adf44a70c80612b32718e60dc19175620ce3698f |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aa4a444ff1cde213026838b9d36d4093acc44ffc |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/17189a20a6bed557ce038bf388f844106d96f1de |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a9ba581288aba4665eb72b028c91e9e7d81b8722 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1ba326bab8beec0a22dd50af2805c08ef590f198 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/42fb7bb9ace3674d7583dea6c1020e85d2770ca5 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f7535d1411a4ef72f39f27d08fbbf04125e4a85 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/00ff64a3bad771e19829606fe968a4036d550fc0 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5122a7274c97e0289e517d6554399613af494d57 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0ec5690e77f5a3ad22ea51d3bffca31634203603 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/65223427fcab5b6d6db72f3d8541b866334d1e6f |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d4511380fbfbc1954fb15e17ee28ee18f3c3331b |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/899963340532a7a90e81e5e6613e4ca452211a64 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5e389f200fca88db2a5eb08738ffc9b4336029ae |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/86dc4a00db4eb6eea6c041224a4a68ab08c119ef |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/60c1a675306f6787d5373012fbd3bee4e1e37f0e |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/b8f66e4efb173b4ea1b895d855a617f34a7d4f59 |     
    i686     |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/bfc3fd49b08ab393f019f339b5784670c6a94d4e |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/da602e1ea10714ba142e964e9413e7d96a24ca82 |     
microblazeel |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/7b89aae32589e83a2a1af26a8e83695d012a1fea |     
   xtensa    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8446b2f846da7180fe41ba7d745fab1fe8c7dec6 |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/9fd13df258589b580fd463b071e5e505a8446e48 |     
    or1k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/74ca9a97b45315c73ed9f7c9741c1f8fc4f0dc0b |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/557248da3009e28a5cc6b70bef44b9c175218b3a |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e70a10f3e7158aaeaa8dac4b22748083dd586d84 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/b2f83477957b93866896daf3afa71e157715fefd |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/3ea0692fb7d7cfccb0788e875da1ba076f1905bb |     
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/a903735338d8a50392daed7c5838a63a3ec31020 | ORPH
microblazeel |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/6d5b38a5342aab7a45a522737b6ca74a36d64d7f | ORPH
    arm      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/68f98a52dab95b63062eb0c95bbcc58c2f878310 | ORPH
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/a2bdb2fc0085aefd828135e3c8a87e7075e6ea29 | ORPH
   mipsel    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/8b3bb84aa0935e5b96255fb5fcc3d6175523c53a |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/86d9b4fadf87124e5e966f60b2487d6c95d8f403 |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/6b34d7cbfbca9a9579a8e048ed2b153609b89f5c |     
    arc      |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/5a724d00207de08de3ac51a250278ca8289025b7 |     
   mipsel    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/cca6b15ea5905582ee470393bbaccb0f8f24811b |     
  mips64el   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/70f116b439e1b3c5bf8a7b6d92b6f7b6a6366f1c |     
  sparc64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/78b60f1ec91ab55b96050498303bbaaab3619716 |     
    i686     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/8719251358efb3891eac06aa4138497814b57b48 |     
 aarch64_be  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/2abcb4048bb2109e4dbb99fba5d6719ffef00e6b |     
 aarch64_be  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/b08d544ab64d516a41292798af938cb230ae17dc |     
   sh4eb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2392214fa5cbab1e4457948a6d1c529bf7266611 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/e51892b85466db6b11cddc4d99e379510290b27b | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/3c517da407120a5fb20c1227fb2621a8a161dee5 | ORPH
 aarch64_be  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/75a92e2ce663f9587693c18c43ed6639533aef2e | ORPH
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/588e1c110f4c93ba3a4870cef2899bf73dc84d10 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/2cb1a1b2c3080b4c5be4a39515767cf5395cd1f9 | ORPH
   nios2     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/1851f1dc9b20c4156c810e3347034a8e0cb764f6 | ORPH
    m68k     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/46d5adf4ad65446c5c1d9c3ec2e5da293d2ef571 | ORPH
    mips     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/58ea73999564b79a3b6b01c8672e48c574c9608c | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/42c3eb23b16985debae5e5b4e84a18d3ed1f23d7 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6b0289e6b2ae436d7481778a2588af140d782949 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a3f0c36e2f30433efded0b9d85b44bab0a840a37 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8447125f10d6735eb76ee7783982437f6a70a5f3 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3a0040ed8f7c517eb858dc73fccd78754f36ce7e | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5601f3224279061550c7910ef624a7e4f6b8b955 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/05e5887a38c113039a1b9c33942acad642c40102 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b9707123b17b2e545973c6d5a681c1a71fa23522 | ORPH
 aarch64_be  |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/13169c90a8d306ff23f5e03f1f2a021ae6e7c088 |     
 powerpc64   | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/6bc99b5f25586e16329fca740fcfac5589c6e6ef |     
 aarch64_be  |         mbedtls-2.28.0         | NOK | http://autobuild.buildroot.net/results/f27b2e5cee17d81f0c446544ba0016ed1e3e687e |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/5baa15ab12a400c1a894e7ab8dd2e5097b57ad7d |     
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/1585d117f61e944dadcabf19d6777addf37b6b22 |     
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/15a103a5997205e5d3703d5446559a79c6c2808f |     
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/550aa7f58dbedd4c1837edc9a0aa8d4ce442011d |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/f0c8d10b0696ccfd18d3093b8074717948a5df90 | ORPH
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/61286270f0047827e0a4e2d3c400fda1db667bb0 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5206bb7e25e657ddb5ec9974778294f3206cd44c |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f153ad40aa404d35dab61a706cab727def4685cc |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b9e985dfca601bb2ae07f56ef86b90c664ba50e2 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a72c699bbf926aecf66bad77dce663e89f5ddddc |     
    or1k     |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/2880b8701636c6d6bfca6aaa26679734f3784695 |     
    mips     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/93e84b3b72eaa5a5e9c26abc89eeca5edea64306 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/99f416c887f70a1e16de10e58cd42293ced48267 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b2613fb0c72cc69130333a36f6af299e183a4ed7 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/07d1e5d932ed9f9f3c4350b2540882a19f793eed |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5894d04c3e1ac4e3615a04d199d971c856895544 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/3d5f5ec47e8e70d63ca3fcc98301247ddf8658ac |     
   mipsel    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/11dd760dc65f849c99ee5fc163541bccb1d8865b | ORPH
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0e02b19ed4861d286acfc557f8925bf3f2b21d5c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bc4b8034459dffc9d86e26d3854e000dbcd85381 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/34c35db3b0e414730648039e187a0397a4a5ddbb |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0656a0edad87145b3923984b0cf1f095eb9f42fa | ORPH
    mips     |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/260dd48748b0d2cef07b61442da7959c1be9dd62 |     
    i686     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/ec9d6cac06ed6a4d0e692f1aa1466da9f3fcbfae |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/8598e09627e2c7095e36efca6e467f4ffb573264 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/ecf44e53fe81abbaa645fa50714573bbe0a59c33 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2b3fbb8f88187281bfd88481faa74ed6b913f6bc |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/9badd510654c23e7bc2a449556fd91e57a9f4de7 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/cf1e2be600c804181f56470009cccee4db94fcf7 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/2f203d51c31ea472fa0c5a0ff8e6d71c28860ec2 |     
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d4b6454e34e7a132e4621a7c35e23a4fd09fd201 | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/29da207eea8b1a9d19894a7192dc5fc3c10e08ea | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/cfe6a259d02665d7894bea785b54fa12cb3bb13e | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/55e05b9b739d58bc403ff3d0925041e847d60e41 | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/92706c5b8f921aab22c0b40e7410864e7bdbc756 | ORPH
  mips64el   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e8aec00614a893dfe057da048f5d6ca7740df8b6 | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/7fb41cdf52e065483d60a1852bfed32f7a270009 | ORPH
  mips64el   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/5b656c57080ef96074d8381944cf77279c7ccbf6 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4a211f6f9371a7f8791937a69ca1e9505834af61 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/99333f4eecdc9329a5a1a18f28ebe7f090f98bef | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/bdc9fec46a4870371bf3fa14730cc66241d5d22a | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8a19b756415494e0ca8edcf1c6c0f7927e2b9219 | ORPH
 microblaze  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a39f65f7c371ac21d8999af6c399a22ae8d79aac | ORPH
   armeb     |         suricata-6.0.5         | NOK | http://autobuild.buildroot.net/results/d1677726a8340431f01e6edbba54c44686cf0149 |     
    arc      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0058557946e4c4ed1536cbece802f9f86c7da01a |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/d446a78a281a16d1c671c40fdecf41df7143cc81 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/cbb00ca3bcdff72478b5ce177737c89708afbf39 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2f3014088a2d2fe359fd1b52e9bc7df170f6e54b | ORPH
  powerpc    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/fcf58daeee0bfd3a066a40b62b962525fce5f3e7 |     
   mips64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/fd7a900363d6af466b0e5d95b91a17d6995bf59d |     
   nios2     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/40bf61dfec4c6f45fa1b84bf25a6410f618d234c |     
 aarch64_be  |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/3e5e9a10fd6236536bc807e48f0d36b925c08c21 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f36c3ca9cbc3277d52b927edd9793500a01d5da5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7fc9e74aeebadb9cac30c728af83e5ba426fd736 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0aee1a5ad8aea59df8882e32a611350063c70e52 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b3efa10c5d6e3953658a5f55b3116f3b89af6d65 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/09785886611ec9797ed0332235b124c9b27251bf |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/40fb67058edc4c6e917ae2b8be5454516b6d336d |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b3cd477b5dfe1e3a5db9b68e31432c9236d56c4f |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b46b31974f614b90a8313cd5fb192913a13ec1a2 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/437cd9bc29f3040ef748f933d493b57b31ecd5a1 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/34cdfeb34d862ba9f75302ea971f9c15b64d39ea |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/06906bda402e91c3351c214e562149ebc8973576 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bf33a315503e5b947b8e424a1ee5a8158d79b96d |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f837fc687250641d052cf321940862cdd8a11242 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/81f9e31c5390cafa1a128c2c4f94a443a10ac88c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/119bc2ed5feab07eb9a353c23360ee10fad666ee |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/db3fab936dadd7273ebc0f4ee314abc1342ea9af |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ed068df5c712919009dd652c918684a2cfe092b5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e1baaefbd0385ac6e11cd82fd687cdf6a958f198 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a3621cde94f0de9b5ddf76350e5fd4bd1511c25e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c36330084446accd9dc2c2ebffc4b61bfae4898d |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1afcdef2cda03af8dbb421a7a4f75492de80d88c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/da495c4515030fe92f883acc2dea7ffdb4f34482 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/05f14e4339fd89717e9eb827421c9e73231784be |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/58fc8841826773f8b92c930e4ffa6c2634b81e76 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe4a0daa9865319bce423c031146d237a494ebfa |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f9f3b71d0efa103dcc1f2804aa0236605213ba6d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/bb3f850a684e5cf2991e76a3fabb7aa878a5e4e2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2ba3df9fa8946be3a79599a14209429f2d704ba7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/bd5e7e5bafdc65afb084449e9c2024d68fdfd254 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ce067f7f1e9379f34d28fbaec06e1223286c6e4c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/33fd35693395e239c629a85958e45d1ff6dc1f8e |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1179b04dc72dc4047d796dc56dd189ea35f5553a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2da55f17918a6f819d554ba185e530703e92800a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/64d0e3b93920b09bc41ca26b96c4820238266df8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/98a48458ca47aa59119181af00754a0432e6cd8e |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ae3596a238fff42ff783aeaf4b57628674fda141 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e48049abb3fb9835abadea8b11b143e4c8c91d81 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ac6af0c53cf992c06c8783743c873726ff8fad4d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/7c52c13900b52f9d8f2a09a8c2aa9b5f399f5363 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/bb6f8a9552248d79c68ed076c40eebc5c6f52804 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/33efccfcb814a6f4369e8c77538d9ab6f51a295d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3c072ef5574b2ca45543067520a8cc1d18bed83b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/57aba41a5a2fc46ac6a3cfca1f7afac0f00a4e2c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5fa11227d24ea2372b2c42a94ca02581939b562f |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f7389cbeb5d5357397422fc2fa86af745515c536 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/8cb4d5b759d5237a5f184db682a7c011930e5f81 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/91fe8ded8c2330074c90f1d595e117fb9f116600 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/61ba2358ca3dc3189d7efcc681fc5541ac288efe |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b7a6d07bb9bf01f6672f76e7c3bcb9b58922e58 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/208a17aee9815a615f04e6609df9c539812370aa |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/38534f49d2b2db465bc98dd8cf2b7d1f99e306b1 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e703c5e5518f168a1e35a195936590dabba3e8bf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e39dd64aa15e34ded8683f9eba98f7503d32363 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/66c844764bdffbcb4a7038c6972c0019ccc2ba9c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8c6ef293b9426280a967cca1a21f0ace05f1a721 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e10d37899cd8c5d164f0d8523dbeb6571061173a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/74965efc59619be5c08b0f9507efc9aa058621d4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3a1d6a08e73669e4b1e75bba3193ef3b848440e8 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/1e1b71181f2dbfa7faa38d716cd1f70f1dd7d148 | ORPH
  sparc64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/5e201a712dd91a02c8b27751e125cf47743643c5 |     
   arceb     |          whois-5.5.13          | NOK | http://autobuild.buildroot.net/results/e2142809db3b98011f2ce88230df274942c0cfe3 |     
    m68k     |            xenomai             | NOK | http://autobuild.buildroot.net/results/30985ba3af043fb430c97c40a1d0537704f0ca5f |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5eb7527553a13b9b09ed4414a558df8613598211 |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/c4ed67d8bcefc9d1ddeeffb923801ce7a01a9ad8 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/c973c16024685ca17a6df1c4e5eb69e35f7a2bdd | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c2d849767973b90101bc9b786402bd88fc662e9a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cbc5a4babb77e662f6f6d57aa0ac6b51f8573d5d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/edcd1005ecf097f60da2609fb94707dccc522d9c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/79ae275fd731089aa4782ad5b57753c73e27f326 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/74a31f387f33234ae6eecf5e225a62f4ff7681cc | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/77f4d32d0c8d212eeabf7fea47f0678b2ebaf1fd | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0c05fd51e19cb112fed57921a3abd61d19d35d8c | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                       frr-8.1 | 1 
                  ndisc6-1.0.5 | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8e5cda69d2cf71fec3b9e94e28bfb599496cc4b3 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5d83011a5ed763fafea8b44c612c0f16fc52780f |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d003a016e7ae3f781ba64a6cc5718e0772846346 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/453a9d866df2b82c3a9b1a0aaa4d75d19a8356f3 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/efe1353f6dd936bfd7afc89dccbfc41cbbc97971 | ORPH
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1bfa195519aae01b03e960875d986c28afc22f38 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/285cff2626a090991844477811f8131c8049941f |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/56f285c4b996ef6363cb4d8983d0ef8549e5d117 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
               protobuf-3.20.1 | 2 
                       unknown | 2 
                       xenomai | 2 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.6.1 | 1 
dahdi-linux-5c840cf43838e06... | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
host-pahole-73383b3a39afe86... | 1 
              jpeg-turbo-2.1.3 | 1 
           libfreeimage-3.18.0 | 1 
                 linux-5.17.13 | 1 
                    mpv-0.33.1 | 1 
              open62541-v1.2.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8fd4a6629e4e7d08c4c57c5ff88f572e47658271 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/8a91028c31caaaaaa9eaf6e12e6792aa50a81fff |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3e1bda5ab9b6040f49088bffbfdca590b2cabbf1 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/bc7572980a570a99eefeef1c861d642a798e1b59 |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1f8c6d3833198dc9fd8855b03d8ac06e85affec0 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1da378b7f3ee0a736fba8abe8625a890b12cb659 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/33ddacf37f7613ba845bbe245f19ac0f28b10840 |     
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c088ec8140521a77de127aa249503e726be0a818 | ORPH
    mips     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/37de4738282fc84e646a1811bc67356cbddb6d58 |     
   nios2     |        open62541-v1.2.4        | NOK | http://autobuild.buildroot.net/results/b2776fc13aa1266a80a6f126b1bcb9ee093724b1 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/af92fd25a1d232fe27a0902ef78c6c85095996db |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e64bada97f6036632b8eb4a2451048d49dc6e78b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7c7ec6ac1182c169682ef3f85c99627a7b25fbb8 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c7f3450659e7dc108302d6f2c620e87d865c1be3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bacd8874f2fa75d39f1fd89f951852d725a1b9ee |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/508700d3f49924e90c8adcb64e179e5cff31e993 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/091b2f64a1c373c8717cef77a188c34c62c6da20 |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/042501d899457ec77f6e07d2bba3b900fe0c3020 |     
   sh4eb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/8cded5f4261d3a9b9efcd0631b7364f588ff4230 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
