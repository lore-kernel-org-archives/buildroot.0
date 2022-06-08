Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B8C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 05:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1CC83E6B;
	Wed,  8 Jun 2022 05:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8l6mlYGceapA; Wed,  8 Jun 2022 05:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2DD83E52;
	Wed,  8 Jun 2022 05:30:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A45C1BF2EB
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 05:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA8540443
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 05:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgW8Z_yACj5L for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 05:30:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13E9640441
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 05:30:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 251501C000A
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654666229; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wosxZ0zVjc8mypsXopYu1l38/t2cf2Rjk2L9rqeeYUM=;
 b=a0XfGEYVFswKzWLQ10wGjkVwFWtaMk4svFHunzTEcoeees3xmV+HgTkdLGPe+wQSEiMPg3
 6Uvyee40018QDqr7M40HxrBQsdlw3m1DIckl3DI1pT5rVBRiSENl6brlQAc5tfBlQhNFFA
 ukblCuNqIe5skWNNM/viHpS98WJ7xPzbfOB4DyfUGL83ozBAaOeLr4+A4Yh4h33l+/i8wJ
 ybwJuLV9qlb7zPVK6C2wV+1yQvlaTulBdxwslN07j8sn64wGvGcMXHPs0jf2wlyH6qpsnh
 +UXhyOJGXrlXC04Ry1OyJAd7kFA0NQWBIrszeuftLFOw/idaKhmN8QOH0BoRwQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 08 Jun 2022 05:30:29 -0000
Message-Id: <20220608053033.6AA8540443@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-07
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

Autobuild statistics for 2022-06-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  3  |  2  | 21  |
    master   | 159 | 174 |  0  | 333 |

Classification of failures by reason for master
-----------------------------------------------

             libopenssl-1.1.1o | 9 
glibc-2.35-96-g2c4fc8e5ca74... | 8 
           libfreeimage-3.18.0 | 8 
               protobuf-3.20.1 | 8 
                 uclibc-1.0.41 | 8 
                host-go-1.18.3 | 7 
                 dash-0.5.11.5 | 6 
                 linux-5.17.13 | 6 
dahdi-linux-5c840cf43838e06... | 5 
                     frr-8.2.2 | 5 
                 zlib-ng-2.0.6 | 5 
                    bat-0.19.0 | 4 
  gobject-introspection-1.70.0 | 4 
              swupdate-2022.05 | 4 
                  ffmpeg-4.4.2 | 3 
               libglib2-2.70.4 | 3 
                libressl-3.5.2 | 3 
                     refpolicy | 3 
                     aufs-util | 2 
                  bind-9.16.27 | 2 
                bitcoin-0.21.2 | 2 
              jpeg-turbo-2.1.3 | 2 
                 mesa3d-21.3.8 | 2 
       shadowsocks-libev-3.3.5 | 2 
toolchain-external-codescap... | 2 
                       unknown | 2 
                  vlc-3.0.17.4 | 2 
                       xenomai | 2 
               zziplib-0.13.72 | 2 
                  acpid-2.0.33 | 1 
               apcupsd-3.14.14 | 1 
                    bird-2.0.8 | 1 
                  bwm-ng-0.6.3 | 1 
                  check-0.15.2 | 1 
              dieharder-3.31.1 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-339b972b464ee3... | 1 
                  exempi-2.6.1 | 1 
fs/axfs/axfs.mk:32: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
         host-gcc-final-11.3.0 | 1 
host-google-breakpad-c85eb4... | 1 
                 host-wine-6.0 | 1 
            igh-ethercat-1.5.2 | 1 
                jailhouse-0.12 | 1 
                 libbsd-0.11.3 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.78 | 1 
                libpcap-1.10.1 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
            linux-fusion-9.0.3 | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
               openpgm-5-3-128 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
                    pimd-2.3.2 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-37.0.2 | 1 
           python-numpy-1.21.2 | 1 
           python-orjson-3.6.7 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
            quickjs-2021-03-27 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                sg3_utils-1.47 | 1 
                   speex-1.2.0 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-bootlin-... | 1 
                   uacme-1.7.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
                 wolfssl-5.2.0 | 1 
                xenomai-custom | 1 
    xserver_xorg-server-21.1.2 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/aeefce1b1744dbca9d5d76e6b5c6119ce808be07 | ORPH
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/980595634058f13966c9696f230f1811f3feeee6 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/7cd33fb71f0a4901f52ae49070a389129af9b229 |     
   mipsel    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/f3bff0ad3ba6a7448e0ed48f16df1e4f8b1a5a32 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/92af932bfec87e54aec2f00279ef8ddf7aded191 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4d17870fbae1cfe19442bb1e6491c2b3608263f9 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/058cab140107f6e09d9b8e595df18db6979df69e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5798826dd2326eca9570f567196a7224671e70e9 |     
   sh4aeb    |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/3a72f79fa07ab68175ffaa9f352d54e63a50f8fe | ORPH
   sh4aeb    |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/61975c21b0e483ced58898cec704d0113faa410b | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e6552aef88f8aae699b0044a80507d885c9fd276 |     
    m68k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0727fd6658f3bbea95fb121f4183f8e6d62b32d8 |     
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/9fab6f0ea2beb2a6be0ae25e6fd07f66f2dfc66c |     
  riscv64    |          bwm-ng-0.6.3          | NOK | http://autobuild.buildroot.net/results/71b1285247e381090a4ab8c17514c416f6196881 |     
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b383cbc108dabf7b927c43f14974e9c50a2b1804 | ORPH
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5503dcfb57e2d35598a73af0733fc6fdc625cf32 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e4bff1a3896ddbb7eec80914c662550524e707a9 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/55eccd5459a3b164fe1c855c96753b67ba7df2c8 |     
microblazeel | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1276ed0e33cce6c82dcc4c9463b73ecdda0986ed |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1e5e01bd318e1b8895495f5519fcf3d176a83aa1 |     
   arceb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5106840c96a91b597a2d78da3021db4a230bf619 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3a1c76c817300c107c203ae3e623112d66268699 | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/63ee06d856ad76c9f6530e5640bcb8b6fb9f3107 | ORPH
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6d8a9b851a5ee1cae0a1983f80ea1dcd47d87bf8 | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7ee64e1c9270063f36aa4ad9d752b8237f2d1de5 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1e20d456e1585529ce1d693522a67a928f876caa | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/4609c8e2af24d9536eb33397a4659ad740aca742 |     
  aarch64    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/cba0bcf49809440a355f27b2dee93a73a4ae7b0f | ORPH
    i586     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/6a16dea645e84e7bd33e50682e5282b3797a1b88 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/eea1ba19f94b0449c2e88a1e5b8b183ebaeda463 |     
   mips64    |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/22a54d8f0a237418257ea9ff2ee99036472eb306 |     
    arm      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/64d21872d25fef35b72106133ed2aed300f52f2f |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/b772d285f978ff9bc3b07872d009633c943f20b1 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6e2d3583869c0632b4f66c8aa84991a0a6841460 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d1fd07fcc0e578fce9f55f84ca4c461db80c54a6 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/13fcd3f7abdd58b7a1f56d301d14c05f1b0c58f8 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6c9015281809fe3c7e97b2d29a14a217e18f1bb2 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7eabfa7ecf14ceb2e335bef981eb4acfb32c9114 |     
   armeb     | fs/axfs/axfs.mk:32: /nvmeda... | NOK | http://autobuild.buildroot.net/results/ebd09fdbca5cf37bcc268ecb54a59ee8d007a555 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/999592ca996c82bedc4cbe273dc53689579d6e37 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/f5122fdcb27e72df1714b7d40120d62cab915168 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d371ce810c7c88ba7a6a67312eb7b5a805b579c0 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/933cee745c32ad4f96869d6c10eea0e1b079bf7b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2afbc6cbb1c8c7aa6a85fe052ac32e8acc04a4f3 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/c567df84847e5f4e359713866a1ab909d36f9955 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b15ce7d70af4a0d625ef5fc83de0ecf58d2b34f9 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9d6c77effa93f40a86620c0afa1e0de971055e16 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0ef15e79b02e4ac57436271036a33f31dc6b8386 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a519f1ad998c81b4505542c20cbe3b66d0ef6866 |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7926b70a3caec4a46a0bc94619eaa5091208cdf8 |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/aa24ba7b499c0fb2da24fb58f21276eefb398ced |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/b67b7cb54c88ebf207a867b88ea583377c25aa83 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/eac1176cf7c99fc53c35bedbffe33b3fa6eb0c3d | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/90d41f911faa72527ac3dad5d9f5632a4c428fd2 | ORPH
   mipsel    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e88ffc79e4226bba9b2b9ac3b034bf138168f819 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/b835e7f36c70eebe6de83b20d86a08edeff9de42 | ORPH
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/251d5af6f22deafa87a6cebbc99fc5c1ffbafbb0 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/622b3a56990ad90145cd1043b3da1e73fc231bc8 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1558bd1110db317cb3a3d4db8d99c8a2c229a5b7 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a4428058397e7948169c6fbab7edb63c319f0d31 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a98c7e2909a32cc927ac03ae1c8db81571fca17f |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/65d33c6b4eb91620a085767e7c7622b7897cf1dc |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2f91393c278065abb0625b44f7a3e65db3889b87 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/de02a6bd937fb26c6dbf04721944d841fe31ee3a |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/ffe179d58a3f1f860ddbd3874083d6c73265646c |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/a22ec2c6f173e37854f204ee0e50ff1af3de278e |     
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/94beb26c4cc7a77406000e5d428a76e88082e617 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/e11915f580d8bb459e32ee3178dfcd593e7109b5 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/a27b7f997791cf0c839d4d9cda5b1d8e6bc0d08c |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/be6d5ad0cee4ee19eb25e595d44555a1af6e073b |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/2980fb79c208454195d77383f1ece9afbd7f981b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3ce4bfcc622cdec02da67730f04c0a027a23230e |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/54c51c85ffbb6f7f4ef7073d91aa1c57dc6d099a | ORPH
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/57347b74df0994520bc230707cda2fd43fa77eed |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/67040e61227e773979ae7117471200f0fa976801 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a7b218f69bb3f62c5b453ec5d2c4eeb5d6f7ecc8 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a397a02abe013656b6f7bce1be68df9705e63046 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d72d3880e47530e123ea9da30fcd440165f09e9c |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ec0a0ad594e5a3e7ed66df30fc73e07546b4ae69 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4703c048a12a0864f0f740c03f7d36e91dd7703e |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/55cfeaf0563973720b97285b930d3c1b4e3c16fd |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6c145b8503b74a2195e652dbbcfc297df7995905 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/07bb42b9f77569667eda883d66ff7d7478e71d58 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/34c391c2dbc04bc2eb1102aff5c533e4380222bd |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6ba297ab99365f3ec5d749d420e25519bb342c17 |     
microblazeel |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/109e4ca09319a5966d373c199aaadaa2b3e7a754 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a34e6233439bec5a5be907bc3d9b283def93270d |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d9400dd4606dbede6417eb414564bee76a5af88b |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/74d4e4e02ab4c847ca9378d893e00e7f53488e06 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/22d8aa3af0b10fe491863b764bcede9b0a77e9a9 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b413be1b95c5e806622257aeadd331e5577c8f02 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/8ebf585d867b76c9a683ad636fa8922f592df321 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3cf2e1c46efe18e0fa262a6704f64c780003c601 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/93ada32a1ec259f8f835ad700d613a502a81382f |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a9013bf1a6f12735b242675a0d94ca2127887eab |     
   arceb     |         libpcap-1.10.1         | NOK | http://autobuild.buildroot.net/results/a955ac1da1fb53f6ea429472c1c981eb47930eaa |     
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/7ae521875e94b0c983395be197d9942a00de0343 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/90220acb721ab5683af03fff7611b25d619246ab | ORPH
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/f8fe8a88e84cf4f5c1dafc00078a4e550c88f762 | ORPH
 aarch64_be  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/86e279049b449618a1fc91a8a0b3252919bd35e3 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/495340a4cec07823d671fad3db8b3e165216ca94 | ORPH
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/34cc2ccb158c591a981653430a934db93b42f674 | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6666e8d035e6773024ca9c8d713e2e0d88c9b67b | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7f8403a88ba57d632242ef888cf65f36d26cb4b1 | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/d488a058d53956cbf5439edf38f8d25aebf1703e | ORPH
  riscv32    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c6bd0d45790ae821dde3ffd3235ce592944b0cf8 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7fcc79dc2a1df867729a5b60d27d830e4a791acb | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ff37354d82addd54d4b1df8a1e4b0123f5e45d15 | ORPH
    arm      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/856d4e701ab3b04fef61972d599d6408e68028ae | ORPH
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/e47ce20323d589b60d18cacb8e895456709ed58e |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/9c097bb1b0b7994180bc082f852563bb4d348435 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/6781973a8983651fd522eae8aef96398c5c62e55 |     
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/df8c204759557348bbe26309662f858ffb333647 |     
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/886af68e027c5c1da1fb51a9da7f0381854da3f8 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/0f7a33935ef7e81d53d8589c022f0e32a4e7bc01 | ORPH
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/45f4b44746582305b4c1f8d3830c8b39f27d7e76 |     
   sparc     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/168202f65d168acc55b4d946c2e2416bf890c32c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c915f4baa2b2992d4c894b2ce6cfa9c5dacfd501 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/595e035327e98e94c8120bf7095cd85497879128 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6a71526f9d4a485eb0300ea9dcdf5c05c38e99f6 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1677f45746ebf96676acc555cac62b406a62105a |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/01570d75deee009b48784962f3c4fea8767eb583 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/54115c46145bdeb9cae744d46db321f60f93f9ec |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/80f1e02fb6e36f4b9af538b8b575cfd4c010829a |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1b263d3206d8dfc6d050b317f9acf1037e96e1f1 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/df8ce718ef81fda5732a3db5e0fd9e949edead68 | ORPH
    mips     |   python-cryptography-37.0.2   | NOK | http://autobuild.buildroot.net/results/b87d0f415bd4e79c9203143ed8b40c5bfba06268 |     
    arm      |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/3d31f1aad5b93024d0981db13e53ec8d17a1c699 |     
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/a61552331a9fc57c5305eb7cea9aa1b0015c1f1c |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/31a8959399c277a64726934d2db5a6eddd7d247b |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b82082a65d0962ede21b75b88d40b3b0c4c3cc41 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3f951a3a954c8e3d6d3f9a62add1eea7a8e55803 |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0de6a0322b36a949717de3ee6ef6714ddbbd5901 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/11288b521bb71ab99537bb38e509d0667b10878e |     
    arc      | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/5668cb4d1d7115e03b01747de52b14c2670a3fb5 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/c93886bf082e3b1f37d089770cbe6697544195e0 |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/981493fd42fb251812014873e1802ea5ff86e6d6 |     
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/1c8deaf94960c2dfc3d0d91719ea6d0c22205890 |     
    m68k     |          speex-1.2.0           | NOK | http://autobuild.buildroot.net/results/94e695ad51ad0332355c1533391bdb44dbb062cf | ORPH
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/754b06032a75f119f7fd756c8c5daf72e7c2af4a |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/bbda01df1c6c676036aaf8a491a1106b5d1b7342 |     
   armeb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/8513084cab7bf7650385a7717499b049efafb5ac |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/fc95aca44a32982d27f4ce692f326d501e648ef2 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/7d91e4657672fc1f2bf054750880b59b36792476 |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/56c77ba3e7905cf9db6c5dafe8d2693afa11e359 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d21d74f15d548dc6bc9b3cb50e20a9eab5a880ae | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d9ae7920b0b50240f3cae48efa0be02bc23780bd | ORPH
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/40320cc629915f6180839c10cae2ea4d26665ac2 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6db7297f7659627423b4a75b1408bc4ede026d52 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/18dd528b316b675db7b99f4e45f40fcad4a24f29 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6da0e7d6238b4cd1d5ecbde2d487264863f0a1fe |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a7bd2d3890d39fe8d369b3226f4bd2fb3f36e07e |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7b01ea36c29258f9d1b7deaf38b8ddee6bb392f2 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c419f50ba9142cfae8da7138fc8c374ea1eba273 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4152cb37b5454fc2b5176d7ee6aba2e502302f1b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e6fd90fec8d3beeb7b1c50fb57fb64c3fa8f19b7 |     
  mips64el   | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/d739c97db6f9a93d5dfc840111ff46cf5cb1b56e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f8c9b11318e99a62bc607cc876f25c3fb5901474 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/56c6287748d775fee8f17b637994bfed2c92d8c1 |     
  mips64el   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/0f1a66b1aa2409816b7750a78c2e21a8e50cfa2d |     
    arm      |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/ed7d58881dc9d3de69f3a5691353c28149638e63 |     
   armeb     |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/6a81b3cf09ab50cdcb9ecde674e5339e5e152420 |     
  riscv64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/06c8f02338b60675612a5684aa5181f6c694002d |     
 microblaze  |            xenomai             | NOK | http://autobuild.buildroot.net/results/daadd8cd17ec5a11831361b339777d94d6468efc |     
    or1k     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/cc9fbfbce6b5554a6c8a9f382ae1f795751545aa |     
 powerpc64   |   xserver_xorg-server-21.1.2   | NOK | http://autobuild.buildroot.net/results/fef3e93f9d3262854181dfef622c92c63a7ee760 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/458de916d6f2df23f30d850e4dca4cfba36d5b42 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/15bf5bf25dea2ceea7a9e9675943b47c0417eb7b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e07f7664e81fe7599ac7f87628219776cc939252 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b069f929661dc64649b224e5d03cc15cf2010bbc | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a8c096e0b922c75b73c8ddf50b5f887450dba775 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/086f4da921dfc66b15f3804e3ddf7a864d274907 |     
 microblaze  |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/6038fd4c9df5cd2a8f9fe5caf4c0e8a4f673f1ef |     
 microblaze  |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/3e6b9acb959f86c23a27d4cfac8138b4f1f09595 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           docker-cli-20.10.14 | 1 
                       frr-8.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                       mongodb | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/6c6156f44a420b317b0da1cbb2bc7a39d83ad1f6 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b9c541d48e7b35f4e32465b2a58acfd3b62079ae |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/94cc746575f01bfe63153c9d3d1d8d9b0284074a |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/31c4687f9ea5521a6e228aa9c984f2a34cdd597f |     
   xtensa    |            unknown             | TIM | http://autobuild.buildroot.net/results/440342810794cf427119abe0b3790271eef1e3d7 |     


Gitlab CI results for 2022-06-07
================================

Detail of defconfig failures for 2022.05
----------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2553040619  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2553040669  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
