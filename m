Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 05:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44AD9409BE;
	Fri, 22 Jul 2022 05:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44AD9409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfHJePAQ5wxQ; Fri, 22 Jul 2022 05:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F59C40931;
	Fri, 22 Jul 2022 05:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F59C40931
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D83831C11A5
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 05:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B198D60E0A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 05:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B198D60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax0aEf2TRsZf for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 05:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C79660D89
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C79660D89
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 05:32:57 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D21F10000A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 05:32:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 05:32:55 -0000
Message-Id: <20220722053300.B198D60E0A@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658467975; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lU1TvLevAEfjP3eK6izBZTO7quQrsvH61sP88wqa+u0=;
 b=o6TeKAv3B6CLi2pFE7qlissvQdjUZpDx1GWoInRNddHkC2i1USJxobSFwbSbD4x+7zhvi5
 wE64l3mEgtjEPXlZPX5C9akGYDW20kS8PhNC1vSFr3Smhn0WHAcgSWp3bPABMBQ+NLJ2S3
 xnkqG3XvZ6/eJnjGwlceKNEfKy3oZ7QkaIsE3GH/FMC5u1MCHc0o6uMRcMduoXGsOWRl3L
 1C7GuzRlGwFRR9DdWS96CbYvUkBb529kKy/mHC/tAm1APpKWALfNV4otstdecDRLDR7I3z
 of7+Hqlb65cJAjXLODjOAg1u7TVCyIWjqqCzr9/O3QxssgEdjYhOXDdymwNZKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6TeKAv3
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-21
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

Autobuild statistics for 2022-07-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  8  |  0  | 27  |
  2022.05.x  | 32  | 15  |  0  | 47  |
    master   | 172 | 255 |  0  | 427 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.41 | 20
              bluez-alsa-4.0.0 | 13
                 zlib-ng-2.0.6 | 10
                 linux-5.17.15 | 9 
                 sudo-1.9.11p2 | 8 
              open62541-v1.3.1 | 7 
                     refpolicy | 7 
                host-go-1.18.3 | 6 
              alsa-utils-1.2.7 | 5 
host-pahole-73383b3a39afe86... | 5 
           libfreeimage-3.18.0 | 5 
              swupdate-2022.05 | 5 
glibc-2.35-134-gb6aade18a7e... | 4 
  gobject-introspection-1.70.0 | 4 
                   perl-5.34.1 | 4 
               protobuf-3.20.1 | 4 
                speexdsp-1.2.1 | 4 
                   tor-0.4.7.8 | 4 
                 wavemon-0.9.4 | 4 
                busybox-1.35.0 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                     frr-8.2.2 | 3 
                      grep-3.7 | 3 
                harfbuzz-4.4.1 | 3 
         host-gcc-final-10.3.0 | 3 
             libopenssl-1.1.1q | 3 
                    musl-1.2.3 | 3 
                 pixman-0.40.0 | 3 
                   speex-1.2.1 | 3 
                       unknown | 3 
                zerofree-1.1.1 | 3 
              alsa-lib-1.2.7.2 | 2 
           crucible-2022.05.25 | 2 
              fstrcmp-0.7.D001 | 2 
                gnu-efi-3.0.10 | 2 
          host-gcc-final-9.4.0 | 2 
              host-rust-1.60.0 | 2 
                libcurl-7.84.0 | 2 
              libgcrypt-1.10.1 | 2 
                   libnss-3.80 | 2 
              libuhttpd-3.14.1 | 2 
                    pppd-2.4.9 | 2 
       shadowsocks-libev-3.3.5 | 2 
                   uacme-1.7.1 | 2 
                xenomai-custom | 2 
               xfsprogs-5.14.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                arp-scan-1.9.7 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                 batctl-2021.0 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.16.27 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  bitwise-0.43 | 1 
                  brotli-1.0.9 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
                  davfs2-1.6.1 | 1 
docker-proxy-339b972b464ee3... | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                       gsl-2.6 | 1 
                   gstd-0.14.0 | 1 
             host-meson-0.63.0 | 1 
            igh-ethercat-1.5.2 | 1 
                ipmiutil-3.1.8 | 1 
                iptables-1.8.8 | 1 
                  jack2-1.9.20 | 1 
              jpeg-turbo-2.1.3 | 1 
               libcodec2-1.0.1 | 1 
               libglib2-2.72.3 | 1 
               libgpgme-1.17.1 | 1 
               lighttpd-1.4.65 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.1 | 1 
               mariadb-10.3.35 | 1 
                  matio-1.5.22 | 1 
                mongodb-4.2.18 | 1 
                   ncurses-6.1 | 1 
                  ndisc6-1.0.5 | 1 
                  ntp-4.2.8p15 | 1 
                  octave-7.1.0 | 1 
                 omniorb-4.3.0 | 1 
                 openssh-9.0p1 | 1 
          perl-net-ssleay-1.85 | 1 
                     php-8.1.8 | 1 
           proxychains-ng-4.16 | 1 
            python-ujson-5.2.0 | 1 
                ramspeed-2.6.0 | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                    sdl-1.2.15 | 1 
           tesseract-ocr-5.0.1 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
                  whois-5.5.13 | 1 
                wtfutil-0.41.0 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9075a3f662555986dc7c8ed1058b71f44c6ac390 |     
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/080fe2c4e743fd8f0b68f00abb4cce5d93c4b099 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/56ecd43d061ccccdacf0eecf771765a0c4a0f6f4 |     
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/a57faa1834732ed3c28b43036789f4f6e302b1ad |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c1541fd730791377e381f00ee65a76ab919277cb |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9ff76dbb295d522b6fb50382530fc50d6b34533d |     
    m68k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/55682f3153b266885349a754df9134b6461f0dc3 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/07c849e260e17f173169a8ab3b62b718a6633375 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c8aff4eb42b42fbb44e12e22c03d45be62582182 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/22b2b926116f76445ddf09224f828a36e1e84015 |     
    arc      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/a640b3221734ec02b12c01ca0a2230ca5fcf8053 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7f9989301483c46ccb765b7c78ce6ea098a79806 |     
    m68k     |         batctl-2021.0          | NOK | http://autobuild.buildroot.net/results/19f39e4c3e3cead032aad7f9ba18bdb128943181 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b84989e92c4f442d4ea2dd7dc3f8abb91e6f57b7 | ORPH
   sh4eb     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/2370ba93a8207fd115cdc5217441390d33f54488 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/79796c8996e5a49e0e5fa413d8bebd09b24a2fc7 |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/c9188f99bad732800aee163e343eb6cfdba5b8ae |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/20f93eaae889fbc23db69341abaa8c16e9f045c2 |     
  riscv64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/7db7273bbb823b5a9f7290a33c7c595f85594d04 |     
   x86_64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/169b574ce113bbe248a958b978d0adc66d8ccba7 |     
   armeb     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/2298f3c4170c228d1c139331ad816aaa9e0b2c1e |     
  mips64el   |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/b75b46f582ca3967d28c2d1ed3d13e2d5e251b90 |     
    or1k     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/65439b879b43384ac9991fb82e53c27dabffa063 |     
   nios2     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/40ea5b2e2fc8a16a6292984f1b27031c7cbf341b |     
  riscv32    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/0fb108a5804832736738f7457dc45f122870cab3 |     
 powerpc64   |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/b0a3aa4c44f73c087fb64ebbba824c4386063488 |     
   nios2     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/858a6a89bc08a34404b48c3df7ffbe98c195110e |     
    mips     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/2cf016b4031805b3cda0118ee297d0a7fe2f0b7d |     
   mipsel    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/9c8207282f063fccbd4e5394e1f3a55adc727735 |     
    i686     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/bda281cf3ef71945eabc7dfd0ff9d1924dd850a2 |     
  aarch64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/a18bfe7beeb1d63b1bb1adbeea9043d9881a85ac |     
  riscv64    |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/1b14373d25086f2456cd116830ee945d2a961bc7 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f3d25accb7f4992de6d210d9ce1cc57dcf522ff4 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/80ada77f5566d29b947735baae232bc0238839d4 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/61b9cb71d17accb03f5d56842ac4703f3d41a80a | ORPH
    i686     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/e7764722449aaacffcb2d81d1e80f84785275de1 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/9eb2312cd01d288ba66c405be9b790eea2ce1ae7 |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/d0f964adf973b50c34a0e9d334f155fc569f1062 |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d6ec9ec72233fd31fd90073c366cccc00b3e30a2 |     
  riscv32    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f514d5b55e9e72316a934f06b425aa8d6dc4f662 |     
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9ae6dd443e409414bb77d0d69a8cce57af30636d |     
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b5b18ab300473bdbabb43716524cd11068731c0e | ORPH
   arceb     |          davfs2-1.6.1          | NOK | http://autobuild.buildroot.net/results/8ce5e2ae7d7e4562ccaf2374f20b2ab53d913549 | ORPH
  aarch64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/d6954bfb9adec211566f6df65fc5fa4f403c5af6 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/11d1698f6ce8c980ac49292688b3fef2bb96397c |     
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/96b578b8cdf78af2e617d3703041549e80a75572 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/dda7bef714ab2cefa7bdae7d677560ea65d4df3e |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f53af0c4612e46192bd80843039d3da1e3771fad |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f014a5b23304178383fa3ba6aa1bd3184ae71cce |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/582294f8e4af4c4b780caf3812c2c6cad7808754 |     
  riscv32    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/4c97a29741fd26b728a79b4693b3a971757394fb |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f6a78aeaffb22561ef64ce881e004ae34b5a7f1c |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/0c685c035afe0ed78cf92ce3393de92b946561b2 |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b29ab83af3ff0c373e81601c182d0c9df6f3c6cc |     
   sparc     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/b104f75020b78f0d7a8abdab41e04d6676078622 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/bc80fb300504a6a85ed8bab9bb939d4b89ebeb69 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/987a635b3d3677bc50b4ba8de1a5da37f5312165 |     
microblazeel |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/7b66da2e1d908c3da2cb8791faf34597e959b780 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/6c10298586414d976925f57f7eb3dc0be9328135 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0c08e0e4dce4e1c368d813d37a47242bca332322 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e9119fffee711c79e95346c8e7770edb164acfac |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1730eb5e7b93d837c0ad28b49011d909fbf8600b |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/22b0cfa87ba818ed2e352310dc3d6c2db582b423 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/0f7076cbe64af95b2f77ecb81e8c9c17470e1eec |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3a37dfc61ae6d137cce59c3e69b6d758cf0db42f | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/713da8f2e0a9a5b8a17ff92151b3b52037eee691 | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a912d0dd194132206cee2cfbf43d62fa6de528ca | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/66842da87d15cfe1db998fe174da8a910e422102 | ORPH
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/2c1bebebbb8ba5c879ff947467c875b3a81c855c |     
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/37a1dabbd22eeb5a8ff524aacc1e33a9df88fa7a |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/20655e8773a5d27006750626e6be6332c266ef5f |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b01eacad6f10013c7d50bc807416ff51aa17d591 | ORPH
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ccd8b0aec53c4633f711333b3147fd75e0aeba0c | ORPH
    mips     |         harfbuzz-4.4.1         | NOK | http://autobuild.buildroot.net/results/f433606c901785e0360b23b8b53bf7b0df16cd3a |     
    mips     |         harfbuzz-4.4.1         | NOK | http://autobuild.buildroot.net/results/43bfb5b6258e04261fd4322ee52699fa0e5089c2 |     
    mips     |         harfbuzz-4.4.1         | NOK | http://autobuild.buildroot.net/results/55581f4e4ae9eb242a537765de85168328d61e7c |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/45624a5ca95988cdf2bc33820ad5ae36d8b3cc2a |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dc4677aa61a6402e3c81ed6bd48fa2507ce50298 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7e3daf2a09f7d445507f2d08504ca6112e79cf49 |     
    i686     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/45bf9196f706fc209396d1801d713508088fe88f |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/49fc4b994f55837f75fb7742a840bd9ea809e93c |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/10297254bbae8844f166e9cf71d303314f245734 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c4696fdcc86a14d9a6bec2a0db108a920185f096 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/829725085ca4eb84ae65457556d5efa442c6fce6 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3273628de9cd4424238d06e0be6f17cdad4294b3 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/36f8cfc5feca689f2cd221ae5e39a182ad90adb4 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/104f717bfc25499a6c9b1343808e4921555f9846 |     
  mips64el   |       host-meson-0.63.0        | NOK | http://autobuild.buildroot.net/results/848e08a4a203dbe4d39aea6e716954aa10e8aad4 |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/01ecaf2b1ec63cc9b8aa4360557b8f43b78e783f |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9e414019c5a4eb27386976f6274245ea2efc1087 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5079ad6ca274502d7ef0855ab28d36deee97a7bd |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7a3a44d25e18d0cc5a9aaaa7f6cc8d3c1d532bd2 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2ddfc4d5d574f4c3077d4313454c8f14acf383e9 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/fc2e5193b30a13de464608438dfe204aa83bcaed |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/763bc6a98771316c14fbcfab7e9443160e950abe |     
    mips     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/8e1fedbc4940f8e5a48a7cb0a53263100e66a689 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/b98551528f51e5b4206becbca687272d8a5163e6 |     
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/3ae476327b5a8ad198d44dfa4f8ad6d96f0214fc | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/73ec59e57352db61e687f389149f1054f57cc459 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/818a9294b6031f1cf27ff76ba9505bcffb482bc9 |     
  powerpc    |        libcodec2-1.0.1         | NOK | http://autobuild.buildroot.net/results/6321aa48efb10b148f7e8d9a00e055a7ee07e45a |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3b4712b0ace52da1650e88cdaafb6a20be135464 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8f695d4dbb91cfde8e93ab38e837b0a0042b986b |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/27747669749ec3b314bf05a06fa446fb17ab692c |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e6f86d9232ac7522d81ed91b7271bc6250ca67a6 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0f0b716418a38d56dc7afe3e0249d99b30cb0434 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ee6a0060e4b3d613f88d6fd66c54f97aafd178b6 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/645a79b8c239c006fb543719d60028f6032530be |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b12b11360fb1bd48b70605767b45df3329537a00 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c68042d8dcd06c525aba99034b243575c38d7f9b | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0a4a3913d1fdeb877d3e1c2ca6e43f18bf46b3f2 |     
    m68k     |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/15fb08c7c779bc07cf53d53a3e7808fa00a78e1c | ORPH
microblazeel |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/d108128d6ee2a65408a05c9f66f540ba40664b28 |     
    sh4      |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/cc30dcf729843c69c15232febe350f28dc3e6aa5 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/66ba8729719d97a82722bc2444003674f4ccbb7d |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/ba849021d6f3f1d2658c1c51ca347743fa8db68d |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/202de564f63f2c86831162715d61f26379c74a1a |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5fa8d68fac962bd135838ede2dc32d8bda8b4d0d |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/2a5d3953fdd3f896b646cb2389c6b08293ad60c1 |     
   arceb     |        lighttpd-1.4.65         | NOK | http://autobuild.buildroot.net/results/063c30b68121bfab11ec63b25c9caf06cad6c5bd |     
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d57d05cf80b2b79bbca2baaa65d7931825faed08 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/57b6b3acd7a16292fcb77e055f5c42bdb7e6660a | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/21e694112c0eea2db745668d0d9620643fa9e709 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/97f9289bda7d4840ee98756d0313fa988172f122 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/24c0a1eff4cf4f179e81125cad95612cad0b6b80 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1b4f05e4dabae7b718887db53c26a593efc9307c | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/897055804031f1e001e2c020170d644cdd441418 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9e75959379eff5f397ca011b77e1d230aa13cb98 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f9d7759b7d721ad355765ad1790bc738313a8979 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/1ac1aa46a95e0da5d6def8a92ffdc509e565c347 | ORPH
   xtensa    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/5647c93fedd80bead842194e6224a48a6346ae3c |     
   sparc     |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/a92821c3cb0de2ea86a60ec87fe65332e597a183 | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/4103577655310da5aa77db4316c81c974700c0b2 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b3c8aa143716bcf6757e26eae2b7b8aebb0b7b8c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/eeb3d66480e6fb4cd031e7803859480b6d0c72f3 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3f1956fbc1746ac25b537ed023e6393ff715f4c9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4e41d2ce80ba56f933b1a4ac2dec367d634b0b54 |     
   mips64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/0779fe94bbb7f125e7bfa6a003772a3532aae7aa | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/73157e61937500909b803a41a968f2f465e715ac | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6b394ee0c59cc01d154e2bfcd7a279f06353c47b | ORPH
  aarch64    |          octave-7.1.0          | NOK | http://autobuild.buildroot.net/results/b3cf87e12bd65ede7dc722905b088e3e3bc1eba1 |     
   x86_64    |         omniorb-4.3.0          | NOK | http://autobuild.buildroot.net/results/44b9a9b8e52831a4b2916ed15a6e66769863bc32 |     
microblazeel |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/b782a5fc0a544b97bf6959f31990dd7daa11fcc7 | ORPH
   mipsel    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/d664b17179fc552db845da80d33eae71866e5398 | ORPH
   arceb     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/4618eb9e1b8a17e13e6a6911e1b942e574141ac3 | ORPH
  sparc64    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/63b059ab50187ff8a6ab008f6035f8391d6f17ec | ORPH
    or1k     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/da06840b6cb7d3174487883311ae976eccd07dd2 | ORPH
   armeb     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/d8e34b8bddf0f3568e64705c6618b17bce70d210 | ORPH
   xtensa    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/0cee2aa484554602347050de6319587e7ad6f357 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/a700b64803736dbe69e323b7f4cade50aac653df | ORPH
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/606c01ed23197588f14b66b6483b918afdeaa191 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/968b9819e760593feccbc91600dfb5518331c02f |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4f7cd534fd10843d0e4cf00fc930082b0fed44f6 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/021f1a7617a46ad12a8b14c236e41d8a33fa4e6c |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/41f5773540b021849cd519d1e42575251f431036 |     
microblazeel |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/4cb318d757f5a71ea6f85ad5ac81ee47ce66d8cb |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7df2034e16ad4f4a84fbd0506b75473f29287a5d |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/97d382a0923554fbeffae62ce6dc005b7ca89e44 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/536e4723dbb84b0f822b7dad9ba914c8ead33655 |     
    or1k     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/cb9f784d50bbb7ec5adb08d588f2097afc084e01 | ORPH
   armeb     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/1d687b827a5e9e9f05a48c99088869ceb6161574 | ORPH
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c0e722088b74683b3d709579016afc034a2316d6 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7f859eeac029925fee9a9d26133c89697c6e43c5 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/59b86f1608173785aa735898b850645ed9e49789 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/691225e20fb270c98ec807a62803300becd7b7e9 |     
    arm      |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/943134935cdd130345a3198738cd5da850f2a98c | ORPH
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/96c40ea979d7d5b2526e39fe2d68f0b9f505a001 |     
   sh4eb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/2a4e041b78f19d3a54badc467d725e4a726fd682 | ORPH
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7dda8555aad5c4270eeb0f236b3efcf2e4837c07 |     
    i586     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/62c9ecd24585673baa29e4ba74aff5ea24e352f5 |     
    sh4a     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/87873563fbeefd99d747d877ff6fc42049139262 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/40a6e7012a56eb32c6d5538866f3dc0abe6abd28 |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/031629fc6cea097ed84c4e69c2c4610c78fcf4cf |     
   xtensa    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b4d5366e486a6c119a9264252c41e191b866d859 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/84ae601aaa8d6b24ab9cf78605e49b4d2dd46775 |     
   sparc     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/cdd9b404d58cea8ff9a8b13af1d57e2266eab67e | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/bc9ddc033b74d675f99ac3f0be41eac388e72352 | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/66fd093fd2263c948b697a772989141d74f2543b |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/75ca164903b8d47fa67343a4c2df11ce3f91d2bd |     
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/40d1a266e997964f56880bf6fdb0a01997e37384 | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9a753ac51d6d037703cb986aa11272f3db713107 | ORPH
  mips64el   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8d84a4dd91520b7172e4a5f5159d9ffe4c39fd82 | ORPH
   arceb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d0fbc26bc61cf0e9dacafc5af218b549ddd610b2 | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/c16bf1d6dc8437aca102f4ac81978e473d19f334 | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3fa63d22d96462b0242de795a10d85a8c9fd6b55 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/efd7107dc0a8dffb0849287fa36061ce33f7c7ba | ORPH
 powerpc64   |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/6a8c2d96ffdb9d1fc55badb257f6bd9caf811be9 | ORPH
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/7dd81ed7ccb2b3b0978ddac48066e395d45442e7 | ORPH
   armeb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/3b87f2d8bea55b1ca1207a9a6c30cf9f1b2bc93b | ORPH
 powerpc64   |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/6f716e00ec0f3a0453b1c9961bc4eefff31bd745 | ORPH
 powerpc64   |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/424118e18fcee1b3ae9fb09f4591172eb273f4e2 | ORPH
    mips     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/b3c429cd8825824922608c75b2988ea28f8c8ada | ORPH
  sparc64    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/04ca88e8d17f56a9dbd0e4cf599b3fd747107d03 | ORPH
    sh4a     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/59381dc7c339494f1a070055c76a18a1db431f55 | ORPH
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/da1a6c59d9c3986d7f85a0d9fc334fb095370465 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/35d5d0fbc1da678150039481a197d1982e7fd580 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/205ecb5e9776e121859f6ec0fd2bb54b564a5a08 |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4d2f6ed01b6100b0e499aa753672a797143c6b57 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/87f4aa5cd0f136442b5d393f3c32f088988853e7 |     
 aarch64_be  |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/521f8e077b8deec6282822f7d6cdc64b9be14f54 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/33f6ce196ba8ed6c592a0283651bb45b50154d9e | ORPH
microblazeel |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/7e1370224e55b8a80c0267b5aa84c68acc6887e6 |     
microblazeel |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/ad6712bf3ef8f3881a7637914d42a470eccc3b10 |     
  mips64el   |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/6014dd8d46dd34235391377b9e3b67a5174b7e7c |     
    sh4      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/fd4be6d978b87eb0c67deb15085dd8305d421b6a |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21 |     
 aarch64_be  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f |     
   sparc     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/b314ec95e711247f57da84a3fa663e7bf5e40dce | ORPH
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1a1efdda1a39177b1d5d2770d2f0ec41994518dc |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/abdb85c25fd7cb42f8fa47417bbb0a2aed595927 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/917600277a04f95c6c4a421a48cfe5c228dbfcb7 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0705937f5e0f800261ce931864778b4f1690f3fc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ae34e58647d7629d6339ac0b047c97741d681e6b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1953a6289418459cdddcc74b4673c0de0a8882a6 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4f69f3f128dfdbbd95059aea46bd39d6ba22c2be |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1350ec052f584770c21c1dc14da5b84bfcc57291 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/18cf443c692c2c316f997dee0530f2b665730995 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/84769a7bfd300a54621d2b2e0d564212e0657916 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f4830727bb8eaa8a58452f0e6535748cbca6c974 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/05cc296479675178c59e6bc0d6b69391a1fe3416 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b9638d0c24753ae19a159e09ef33781b59023841 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9d1490cb7efe21582f456868b386149879228a7e |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6b987faf26de61a8559f66b260c54f85f087fe50 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dd2e4593eff929a4115f3fd8069f88e34390f530 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/014fecf99394e2aae58f4bfb890c269be32ae9d5 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d9022b66c941c7aaea778335c026f36fa96474e0 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d3eaf7d9f9caa152178f4479e0fc8c655b66841b |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b670c33c8e4abfb0b2d7832ad8f7aca19055b551 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b7d6dc77cfb890f2f521a3d8fb0fc6323f01869b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7f1718cd256183dc7d83bd6ef4a19fac0e1c99a4 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/defa89d0d4f52d01201bad34009c0f5305b78224 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/dd16811347f35357df68aed9409f0d550480451c |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/77e58c77ea0d0cd9c1d6ad353f3331fc7ec8feca |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/eaa2bc8c68a65b0540fc5e78a9fb5d4973b995ef |     
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3f5046c16ca88b4d33ff46426cdefe83297b4957 |     
 powerpc64   |          whois-5.5.13          | NOK | http://autobuild.buildroot.net/results/82d11fd1d4a672185af71a5283ef36e00a856b44 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/338df3502b0b80605fcefbab44c0a7e8f79ac321 |     
   xtensa    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/bb329fff8e03f24a94c81775fcaa1d4c33c624b1 |     
    sh4      |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/181719cc52de10a56c02d4817b4c217b9ffdf90d |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/437a4c247913cee00074ba2342d294fea697e3cb | ORPH
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/cb84a677368147baaccf2e03c488c72eeda27663 | ORPH
  sparc64    |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/3252b21a1bfe4147db66034e261b37dd8015aac9 |     
 aarch64_be  |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/7fd85d405d727339da43bab843895feeec81ecf8 |     
   s390x     |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/e01c3d3948904aa9dcc4b289eccc7b97ea36b456 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1a4feaf103c6e561bcd247f95be3eeed76820d39 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2a8340d7af1728f38722e92f11ef5ccd225c6b59 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8eddc331a449ca06bdcae7b54ba8fba29e79a01b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/dbe78ea3df09d989faa56e95b9fd771e7b971005 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e0130c133654f03a14d23bb77667705120853ebe | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/29e31e345560e9ab3a5211e7226180986c2482a5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5bd0ff40ebb97d543bf260da18d65fb8a7d287b8 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/54fad489724906d41421ae675d1891c877382a25 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a39dfdbbe2a847f26cc2899c1309b0fc244e7f55 | ORPH
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fc3f1034466f51607c40802d2f33bab6748bb712 | ORPH
   sh4aeb    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/79f88e9ec14cda7d07cf689eee864791ba949892 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                 uclibc-1.0.41 | 2 
                  jack2-1.9.20 | 1 
              python-pyqt5-5.7 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/e6f77ffc59344003606e7c336dbc568ebf9aa34d |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4aeaadbca0b7d11537d86ffb640a08632e4beaf5 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a33c28fc2d77c440a575acef094fcdf5cc16cf9e |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/676fac4451c17240ed78872e787ac0841dd40734 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/32fe112e2f4e8ca9b5d73fd0940711fe76e24cac |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c3667d84c01aeacd5354f66174901d5eb26fe8ed |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c70144690fedf7c5972ff55acfaa9a3709f08e5f |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/118ad1bd73c6ad7ff8a28a132aa79bed1aa0a2fd |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                elfutils-0.186 | 1 
                     frr-8.2.2 | 1 
                   gstd-0.14.0 | 1 
              host-delve-1.8.0 | 1 
host-google-breakpad-c85eb4... | 1 
host-pahole-73383b3a39afe86... | 1 
           libfreeimage-3.18.0 | 1 
                   libnss-3.78 | 1 
           linux-5.10.115-cip7 | 1 
              liquid-dsp-1.4.0 | 1 
                     refpolicy | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
              swupdate-2022.05 | 1 
                   uacme-1.7.1 | 1 
                       unknown | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5831d382a07ddcb8f8fdce0fbc4af98180d41092 | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/85417da3b9d8126a6e0651df8d980371a0dfa652 |     
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/aaa5afb7aaae814bf0d1a78599b86bebceeabf32 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/e7e3ea68053af1abab2cb5903ad036dd91980085 |     
  aarch64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/e0c49e6578a8ae08be36c774366faef703f50977 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a1e910792d236a5ee9058d6e9f10c7c9bfe1ab73 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/01a1f8ab292cc30cea05b5f7fe6b43c598aec826 |     
   mipsel    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/fba4098221f6f9ce1aee32fb892ccc19584d4ad9 |     
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/4b123e147db4d17af9fb5805d1764822263ff782 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/692249824e91add7b0669addcc4fb046b89ac740 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/80ec7354c67d7b3d7054e1cb4cce698c64a3f57b |     
  mips64el   | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/75372a6f506477fa6a2f262289501cac37d20176 |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c0774d146cc563a59e31e49d44ffcb551cc47317 |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/128d4007ab1cf1be1d5297da00846cc9e2bc72e0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6c16aed78e7779a71234aba1aba133ff8514d1b9 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

