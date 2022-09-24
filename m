Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09315C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 05:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624354118E;
	Sat, 24 Sep 2022 05:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624354118E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hi91VUj6o5UO; Sat, 24 Sep 2022 05:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBAAD4118B;
	Sat, 24 Sep 2022 05:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBAAD4118B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45BD91BF86C
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 05:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14CD441C83
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 05:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CD441C83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NX9v8JIe-E3m for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 05:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37EBF41C7D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37EBF41C7D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 05:32:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77BD8FF80B
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 05:32:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 05:32:52 -0000
Message-Id: <20220924053259.14CD441C83@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663997572; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vv8EdqFrmuvdpw321spanbjWR869fmQALq0Tm42OJjs=;
 b=hrbE1yFmF1e06HzEgmQWofHnXqG/7Qqt8hrtmFmCPod5bjaOHkwdScY7QJxBhDwdnwoBh5
 eUxzbEoHYT3EZ70BuCt+5PLGvSVsfaopdV6HMT8fdfEjDzd4c7VDPq+qvnrI8UDT8I21QL
 h+jJtoeQTWaS7YU0gncB2mWfYeyN6R4zbSIytMnOGWYQlvoUMJghrJWvxpH2fGGYo2wLau
 +kILxlP6X8Nrdm4NGxIuZv3kG+G0J6e6ZW2D2AVKwAukzSpplsqgQA6hGml96IK9F5bsO7
 ySF4DpXbIHSOpkVOnjPE7hVw2Wqvg2xE4FYjTVWuSWQZlgIa77zwAHSV5ylnIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hrbE1yFm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-23
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

Autobuild statistics for 2022-09-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  7  |  0  | 14  |
  2022.05.x  | 32  | 24  |  0  | 56  |
    master   | 254 | 241 |  2  | 497 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.35-134-gb6aade18a7e... | 14
            igd2-for-linux-2.1 | 12
                       unknown | 12
                host-go-1.19.1 | 11
            host-binutils-2.38 | 10
                 linux-5.17.15 | 10
                gerbera-1.10.0 | 9 
             libgpg-error-1.45 | 7 
              host-rust-1.62.0 | 6 
               libglib2-2.72.3 | 6 
                 dash-0.5.11.5 | 4 
                  gensio-2.5.2 | 4 
  gobject-introspection-1.72.0 | 4 
host-pahole-73383b3a39afe86... | 4 
       linux-5.10.109-cip5-rt4 | 4 
                tealdeer-1.5.0 | 4 
                elfutils-0.186 | 3 
                     gmp-6.2.1 | 3 
               ipmitool-1_8_19 | 3 
                 zlib-ng-2.0.6 | 3 
                    bat-0.19.0 | 2 
                bitcoin-0.21.2 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                 dmalloc-5.6.5 | 2 
docker-proxy-f6ccccb1c082a4... | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.3.1 | 2 
                       gsl-2.6 | 2 
            host-binutils-2.39 | 2 
              host-delve-1.8.0 | 2 
                   libnss-3.83 | 2 
                   libqb-2.0.6 | 2 
           linux-5.10.115-cip7 | 2 
                  netsurf-3.10 | 2 
                nodejs-16.16.0 | 2 
            ocf-linux-20120127 | 2 
               openpgm-5-3-128 | 2 
           proxychains-ng-4.16 | 2 
toolchain-external-arm-aarc... | 2 
ulog-0389d243352255f6182326... | 2 
                 wavemon-0.9.4 | 2 
                  xvisor-0.3.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              asterisk-16.25.2 | 1 
                  cairo-1.16.0 | 1 
                    dhcp-4.4.3 | 1 
              dieharder-3.31.1 | 1 
                    dust-0.8.1 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
                  faad2-2.10.0 | 1 
                     file-5.41 | 1 
             fontconfig-2.13.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
         gobject-introspection | 1 
                 gtkmm3-3.22.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
         host-gcc-final-11.3.0 | 1 
              hyperfine-1.14.0 | 1 
                jemalloc-5.3.0 | 1 
              jpeg-turbo-2.1.4 | 1 
                  kexec-2.0.25 | 1 
                   libiio-0.24 | 1 
                    libndp-1.8 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libvorbis-1.3.7 | 1 
                   linux-tools | 1 
            lttng-tools-2.13.2 | 1 
              micropython-1.19 | 1 
          moby-buildkit-0.10.0 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
               openblas-0.3.21 | 1 
                   opensbi-0.9 | 1 
                 openssh-9.0p1 | 1 
                   perl-5.34.1 | 1 
                     php-8.1.9 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                     pv-1.6.20 | 1 
          python-orjson-3.7.11 | 1 
            python-ujson-5.2.0 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    sdl-1.2.15 | 1 
                     shim-15.4 | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-0844445e7358... | 1 
                  uhd-3.15.0.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                usbguard-1.1.1 | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.5.0 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b842aeed3442e0f7c42c488f79b2cb9d46998114 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3b7fadc094cb1e3997ab8d780e3dc6d19d357d6c |     
microblazeel |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/0c7dbffbc9a7df2fd5ca3c6ac52d3a485cc12817 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/617af870f46638ace4fbbc39778c7b8a96ee3753 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c0a9137a4a74c1ce1ddca7ab3e8d0f5d797406b8 |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/319cd7692589385842e5f5ea2676e47c46d0c065 |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/a814088774b23e5d624479b841df304f18f40c39 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/564809cf1806760230c26968ac35f7d74bb44a5a |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/064d4b1197768935b8a27500523c766ed3c30018 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/745c35dbe60f1e4b503210f48a31e48b29eb07b7 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/323e15fb1a7f3d32d3261f41ddaf4ae3ba8e524d | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1910e6caf32870904c46bbec33c04846ebea2dd8 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/55f80c207a2c2c305b6e96facb448713bcc55374 | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ea9a16f1ee666bb91a29f883a44345e32dfc7f47 | ORPH
  powerpc    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/c5b0f5e03315e96667ab8cb7b5400ca5e3f82965 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/cc15ed626d7ffd9623c891a5f62fe40d006ec801 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/c12c12743a0e81c9ec4dbabcdd2f5283fe34e904 | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/b1ad223c407fdd8b2e1d4837a5127218c4895a51 | ORPH
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/f3480dd4e86076bdac660b442b084fd15ea9b7e8 |     
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/2407f5952ae4a91dc54700b578f7873dad3421da |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6314a97d496affc847ffca2740fce34253ecdc1d |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/78d5f6210008c4661b79f16bc10336193f41137e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/79c3ce825e63a54a520b8f452914b6b4ca286120 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a1d09deddc4ae4b7d9d8945e832e5ae49722fb8f | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/70dcf185eca5715d3747ae9a9d4c220c5302d2f0 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5fb1820af57f63a981531fddbf8a2446903adab6 |     
    sh4      |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/7f93172040bd096c175ad0c4c21f3ac5809884e2 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/9b9be15d231d407cc8a333a2b0444b24ac12d029 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/fa862d946e7a11e0085866d6b5f88d8190ab8ce9 | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/03783f64079e523174d18fd894a99e979caa457c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/61ad45dec53eca8a4210d1cb0bcf4c2c40cf507a | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/9eeff61825cc095c1f7b53fe302aba8795ce740d |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/dafd9755e81791785b70a006ee22cd13c88fe60a |     
    mips     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/e89522d48f1ac72363030f61acdd53f324e6a2e5 |     
   sparc     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/db5d5d6023b10e5f47c20c2c2b97f0867e817309 |     
   mipsel    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/afb365510eb4962b69f1e5f8f414a4650d905a6a |     
  sparc64    | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/d6513c5abaf83147a80be12eec25f3cc88fd28e1 |     
    or1k     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/6792c95ba22f5777bfe269284c263e7ecec39dea |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/5de7b07ad10b8afc62bc196cf649aff067a4ac7b |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d6cd739ee4f75e86dc1448faa46bd68d73599ee4 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eae34b396a7ff3299dc154492272c1955a8bd018 |     
   armeb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/be391edd5ca8f5a2c8385380c4cf48a432dbe7a7 |     
   mips64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/abf813e76ceec28cb9b0366b1a547c97f31a2532 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ef5ec555113fef0cf24536df1c8e2837bd0eb7f6 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/00b3793d4f6eaddc2a6be0e3245470a71b0a6fbb |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/8cb0729da5135d73c3a5ef249af4b826b031a37a |     
   sparc     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/361ec00f65239e716f8026236c3938dd230d8fbf |     
   nios2     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/a9612836b63a048f28cc3d3d06389c5017a794d2 |     
   sparc     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/f74987fd72009e76e9aea7766fdfe1c19e977cbe |     
microblazeel |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/059e4d73e1c0dfc554780ae33d290c93946945a7 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ae15f4e017a577716f185c0b18a0d9beee386426 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0513468331be4068ee05ed7d5934b0a0b2e506ea |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9204cd9a9fd7fedd21ba6b1df391d54b6bb91f23 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/909607bc00ec5e4fee860ece79f28e44dfd38f62 |     
    i586     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ac3c1c92a09c968a35a6b3d9ac5e6e7bbd355a53 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2ebf97c22d8bf955b6670a1ac9407fbdf553717a |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/596cd274fe5f5f64ab547c65a52dc909055908ec |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/833b66ebb2b2e5d9d3fa89c0bc4cec759955786d |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a2aecdf3aa1e11886ee6466571ab8605b267af4b |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/16a4d7b501b3bc5b68e0bc597f3f514a21d850fa |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/9a081ca0b798e0cd9b01b314c1e82f5ed14cc40d |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/a2da22ae90c5e2b2573e17cee27cc9eef1519f6e |     
powerpc64le  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/42791082ba83a73d925c06f35caf5e88b3e72473 |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/ad153fcd8ba40f9093a8ab3ede2486e809e2ff12 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1931c37a0a30163ae3c0963d90a600391486a997 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/64240190d5245956a95fb587488717ac0cbc095b |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/3859424999b8b97a82f1c3ba39cfeebccc00cd40 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0fe1f003757885063b0cef7f43948863be4078d6 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1bf62a257f1c6b5d51819628a954b7ca7722e7e2 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/590065463aa0265361ce5dc07b6a933129a9c554 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/252eb80ed7e6a81c83ba1661cd27024ee74bfa39 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d5f88fec9dbb53e08b246324e635ed4ef89ff0a2 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/6fbdc253b02c976e98ba993f7ec22f7cf7506a74 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/68d1b396d73ebb2ed6811721d79fca5df555ee51 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/49ccd97e6f89fdef8dc0daa48fa7e4cbaa427679 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/53cdcb048d298461a6ab4e1f27baecef86e2e12a | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/202b231c122f3147643a33483e919652db4998a3 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/712c610b8e41f94aae2262c8a340b2525213797f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d841f97d6ad855128e1bad219e50462a620e104f | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c0608409f18c3cb723f609d3df9b6f879446e3f0 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b531dbb4fe9ea8bd15acd85f48c40e3bbe00216d | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/27acb824ee4645b07addc476ffaee2cc0944f022 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/737b556cdea9e773c2b956c2c2da879cc89d328c | ORPH
   s390x     |         gtkmm3-3.22.0          | NOK | http://autobuild.buildroot.net/results/6c8672e7bde861ecb03574859cba18530262b588 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/cf06f63173c91935f6193e1359dec7a5c34d92aa |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cfdecbdd074e658f0eab160a5803c3e4c48c3dac |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/55b26a308e12abb6aed0764e115cee050765c44e |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f7b1fb629efa33569efbbc804d323d6c4781a03 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/28621a3cb066790837b60fd4f2d0acbe8f00eab4 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a354588cc7e0b71e5e390122293f323a2a584c4c |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9eb15bfd28a87faab94cbec6c262a60bd6075552 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/426709f05777f01a7d61bed10d5ee8498667c41a |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/03f6a822c770e0ea20e1bf3f01a30e9c5bd0d6ad |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b236bc347334cbb02692cf9dd2b48a34cb02f7d9 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a5bbdf47c1dde65b7db9db31c72cdecb6e82083d |     
   sh4eb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d334a9d5eb56a4aa0dc74275cb3ef4c83aa0c7d3 |     
    i586     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ea7f36c915f889f03d811a24100d01d8c9ef503d |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/47889aea49d42cb4678faf52c17c6bbdec9d2bdb |     
  aarch64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/d90d9737ffd56454b88cba75a621ebfe6f97a0ed |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1032f2a4ca220d4a4e7c7a92509a261ab02e21f0 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bb3b1e04038a716dbfe5e67c2c8dd63838465637 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9c81e93bb84908cde2ca60ace45c4cf5668e07bf |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2b600fc8d1ddf765ae6b6dc02938f5c35b70385c |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/cbb3d87470f13950a104b6f90b1ee4e59a00145d |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d5b7e369cc892ddcd1ff5f8e93fd8885c3926f42 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/874f4f7e59c16f0a9a7895855867883ee187eca2 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/15e5128b47f398e0df7a1a743531355936626d54 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/8cf37b935b19f5ad97076af52ca2dd84ed1f58b1 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/70de4acdadf7ab24fe202983b498c68f608cd22c |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/28034bb206e7d60293dab3e2ec77fdddc9008171 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/728248f5697e701e42a2aa3fd8d27f1e2fb5d52d |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/38d4807c9a25bbeb922947422b4af3e314dd39a2 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f2a22345dbd4b8090f6b4be5856d8b6ee18e98bb |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9a579226ae78f841596d97736c24bed1caaeec19 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cbbedd6d3b5bb93ca1e51efb7eeabae266021620 |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ffd45be80ddfb80d49e1aaa7ab643118864a24d6 |     
    i586     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b2ef5ba99dc01229b08957918dea238e968c1e48 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/778945de19851da631c536aabd334dcfeb8147a1 |     
powerpc64le  |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a67216678b5868c25accc207fb38bf22bbddef10 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/7d5f5b4297ca5a542a85d5f05e81c51903658a2c |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/543330b7e56ca96000022240cf57ff23b0be48c2 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/e661973853288d6fea6775998afbff7cb5a9ccc8 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c233d5a3f06319ebc3ed898bd21a0cff706f9618 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c30a4945008d83d4a138ea3174968d5e3feed6e0 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7c8feddca944cffd4a8c97b499f61d8ab3f9f708 |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/346387d5d48d49a08056ccb7ea0eb46449fda07f |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/85d2278c441f8085cccf29707e830977e6f2d058 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/54e1edfd1e10d815f3249155174af66046f88f48 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/af738bff3b23ab96f4a3ac8ad0e0f56b99be1dfd |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/63bd2290e539f9512d391cf0817881df63de16e3 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9b61956fbb145c5de521e7fae98f903f28bdd4ee |     
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8bbed89048f0540261cefeb7c0cacaf154c51b47 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bcfa45144af7274fa1cd815155b51049675c23bb |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/545c0d57720b4d1436b668a3b95d5a323b64723f |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/70ee0f6d54c5947c60f8e67d30bc538d4bcfe998 |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/4df29655b13f50a48776c36179d96b9ce538d426 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/81ffe037d22a9d219290001a7bb02d8abd747b68 |     
    sh4      |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/d88ec65a610df0ff1b76e910052b73af08dadcb9 |     
  riscv64    |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/7d793d0f70b79ef70441bab4d2bf6a48c202addc |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/eb72298fa5f10492e0515e8bdb0e06bf85fa44d7 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2cd56198bb7322ecd3c46617eb88234d8ce20fef |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/67823f0097e3e420d3ace82662aded86e56b0a3d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8f0e6cb65ea876e74f532657d32845dc8e359016 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/612ec5f8e01b2440b325bbbf88764d7c4e0f1317 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d0672ae15eab3c0ebb3facc24374b4e6c2b20084 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/642ec55624fa136880575bc1b22ea2909c5ae2d9 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9878f4d664947b908a96584a6dd3043f25506c66 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6620cf2df539502091a598065f8beaaf8b5874d5 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a1ff78789601cec4b55cf3c3258e818e24c72494 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2a8291fcc21c24c9665dd47d932798ea70ca6e9e | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3b7992f8336375cde072030bbbe3ce1d587d9f73 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/df5ea829eea8028560b4a36ee3706e8aa7bc5ea4 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/fd5869dd8d440f2a6afea704b917c09d5df9684a | ORPH
  sparc64    |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/7f796f9bcdb10b08d36c07d9bfb8ab25c1e72106 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/002039ab8f10df449e5c4d84019f374441fdd1d9 |     
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/87b4036930da056d6904757248b560144dda76cc |     
  mips64el   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/bb1fce423b38ff9aaed2260a4f81f5e44e11d2fc |     
    i586     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/888e55ad630cead13f7c74485712211fbb4717ee |     
   sparc     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/2b46a8a9a848ad7dac4f54f133bd910c9267cc84 |     
    arc      |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/51e6415851ef989d01b9ef3728ae9bccdc4c053f |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/4e3e4f2d900e56c0e0bc05e93ea58ae2ee81b04c |     
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/1bd374629367bb22af4a81ccfa1326f418802c02 | ORPH
    sh4a     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/74aa99c621f808974f3dee3a7d0d9368ca307e53 | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/f94ace1efaea3b1768ce09637f31597d3dc257a3 | ORPH
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/94b29902aa1b8d0fb0c3075c7511f04d9d59f544 | ORPH
    arm      |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/406f880da5fb2e2450653fa72bc992116ad6478d | ORPH
  riscv32    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/14f3bff543327906c88f9d8bcc89eb183e52f210 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7fb567c8e0032b34cc43006178dba2da15c8bef4 | ORPH
  aarch64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e25a419f68a0f75e2c573609459b3132c4b6a103 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6515dcc3c5f185a87ad08beff877ee1094fff59c | ORPH
microblazeel |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1020fca4a475581856859c5adbc87bd0f26ce978 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8d9bbe63bc40e5bcceed59f6b7ec0beeb35c0ac7 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dcb80f467a9373fecd522b3536a34f0d35e74ec4 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b46e6e7cadeedb17d3bd1a2a93b1dec75dfffea5 | ORPH
   sh4eb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5646f0a7ff0012d762e87f1cef07a3f740686c89 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/94917a39330942ef138886ac83563018f31479d4 | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6d9247dbc8ad17e77225b9d78a9c0bc5386204e4 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/93842b85f71176bbe83189f9c465f3f7264c7de3 | ORPH
   armeb     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/b72a75399512e33acb466ec4fd31b5f9b1c3163e |     
  aarch64    |        micropython-1.19        | NOK | http://autobuild.buildroot.net/results/107e57f51ed146a83e8b89f9c35c134c2edf8f8f |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/3ba8d25b707ec9688c4079f76507fe9022446013 |     
 microblaze  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4be6331467630533dceeb4d8ae89310eec4a63df |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/0ae43e79e36aefbdb5d7124f80fbae6fbbe273da |     
  aarch64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/0188a1bafc3b6c68b3659204aa9a3a7ade710043 |     
   s390x     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/add671284711ff57544bdc02c19971a5f2203bc3 |     
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/cf07a361d7fe4b41c6e472a95c0d436d134ccc00 |     
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/7fe9132236ee8e3a86dd97fe96ffee42990c2d19 |     
 microblaze  |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/5126f6dbac631dc5cec789d32a52af9cf5027b8b | ORPH
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5daa16e8dbb26f95d3727589fa0a8716c7604956 | ORPH
  aarch64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/8e1e5e91cf9a3478308234332bf0e5f977d4c4a6 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/2ca330df18794f3ee1f55b7a162c9b3716c8fc3a | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/084acc768584dc1beb4baa2408621f462c7b5e17 | ORPH
    arm      |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/173bba7d07056b2da175187626146a9fa279302e |     
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/80212d18c049c86c4bb820e8b3e3cf43e0db5ef4 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/5d65b73d08755d6af44b7a2b17e540ab53469f04 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/df3dfd824a95f806c3bae687847e03273705cdf2 | ORPH
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/053ab15b1952f41e58fad06cf37b818c4dd52834 |     
    or1k     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/dfc0d9a4352a4354a6d44abc38be91ff168239c8 |     
    sh4      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/a936e522593e7d1a9f13876f055a7ba055bdd40c | ORPH
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/3951359efaea61b7ea075bbf4b5906f424810c9a | ORPH
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/28bd843c69a98422607217eda70118ab75d05ac1 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ae124d0d22ba60a15917f73034b6bb456df23487 | ORPH
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/d3533e17b650e3960e599774356f99e5394c4e23 |     
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/3c7fb14d274c9376f27729492690dd038821390f |     
   arceb     | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/86ac3299d92181d5a7e73ebecdb390896cac2817 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4ed0311b7291d3244d4dc4e243187822c3646d19 | ORPH
    arm      |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/8980c0f422516c7263d8d0c9cc6123f30c4b7ee4 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/04c4796a03f0e9547edc429988e33ed71f937450 |     
  mips64el   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/14cc717d852db1c776c1c193803e3ab706f6b8a4 |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/107d9f3c734c8334ccf487e1afd6b41844d83de6 |     
   mipsel    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/3d5d3b15966ffb85bc8e05a293fc53ab04142bd1 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/70a1888c1b006f9b7fefa3c73e68e9cefb7daf00 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/9ec1a1c2424a92487a91340b09d8ea453ef213b2 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4adb6e7c9b58c556484dcc8ac6c96bd15a531c2e |     
  mips64el   | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/96a8ecdf095f5258db407fe67d882397c44ec4c4 |     
   s390x     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/8aa1f5c8d9c22b83e93fab5f3ce880c76796a74d |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a1166fcc7c41cdccee277985591afc12d2ca7ba5 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/302855a69096798a488a8d47e23297e7b7cdaccd |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/c4b124db7e58069143f90a7eb2981f23dc5559c7 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/1c17831b1a1f6c88ed9edd4af9302aa19f2dd118 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c03c43b16b128c58d1c60f08b49e5fda150abd7e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/af1a804b982283bda625eb7b6368c19cd3d9e4fa |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/253930ace40d9cbabf069d78ea2a9bcbcdc34e47 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9ee9b86841adca443ed881bd617a325b9bd3cb6f |     
    m68k     |            unknown             | TIM | http://autobuild.buildroot.net/results/635f4a21ead8a9c9f8e56889b937b3ccc185be58 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/35d2b7cac709a58ca1a7df7d75f0eb17f8f14d32 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e294db625026008df826080781e3763e773ed1eb |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d5f108871ae05e0ec7d72596f01fc7deabe2fd47 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/a56293438cb2a7d40a62d118d7ed5106e29ff2b1 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c873ea824a3028cd141739d621a366a144de9830 |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/f277470b169cdc496b94b14ff9d2da7692e5ddd7 | ORPH
    sh4      |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/e4c130e9d072baf7aacb9d4d29302e8f77a775a9 |     
   sparc     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/18bf6c00fc544f55c9caa7b2968dbe43d30accb2 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4b05e65850a02d0b3932bae256b5f374e6a26e63 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/dd70d144dc0c8e41822cef13c4a622947a87f88f |     
   armeb     |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/f0cc28bee0cf04100b3ad76877732c93d78c2c9c |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8151aff750f1d70395bf15480a6c1e8285ea0ec1 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/bb746a5f55084b81465d4cc3635e1b97ede68300 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/59468869190bf4599dd9755c5bb99ad485612896 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d421e93b1f0abe51444d8c4f6e3518f8c243e612 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/03c0fc876d5fa0b1a3a16f3ba3934f1c0ee7ed4a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5efce2fd32930e91f76f90c4f07854e2af25a3c0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/af7315351b486715b7a09639bec1e66e60af3f98 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 2 
                  exempi-2.6.1 | 1 
                   grpc-1.43.0 | 1 
                  jack2-1.9.20 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5d7e225b7bc9c83438b94189cacbaecb045ab122 |     
   x86_64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/6ef4819544ef9c7781b8469668d26cad3e00e21d |     
    m68k     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/8499836f410639e2de9a08a4481d2df2f18bfcc5 |     
    arm      |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/83923d5ba6c400cded7bce1fa5007677aba7931f |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/b03d33c41c668af727abe3174207c5f9fea55664 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/3e8ec46d8d7f7e9f6beab3987dd3a546e8a2c317 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3cb517c90b3ec148492591a3363994aae6ea8544 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 4 
                     refpolicy | 4 
                    brltty-6.4 | 1 
                 dash-0.5.11.5 | 1 
               erofs-utils-1.4 | 1 
                     frr-8.2.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
          host-elf2flt-2021.08 | 1 
                host-go-1.18.6 | 1 
host-pahole-73383b3a39afe86... | 1 
              micropython-1.18 | 1 
                 pixman-0.40.0 | 1 
           python-numpy-1.21.2 | 1 
           python-orjson-3.6.7 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/e7e9c5741db3119ace1587a99feecc4881f382c2 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7b96c88521109b5e9edc22dcf2ba588822508c30 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/722dd394014c07b8641f1c25daaabd9bc7bfa64e |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ea3c1d350e11dbe31360a1a9cb6a2e0817800904 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/d7e02dbf25bc0519d2bea4650a0a58a9fcfcfb69 |     
microblazeel |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/68baff3e046223adb70da09465b5c95ad0d1b6d4 |     
    m68k     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/ffb79b70de0484596f1c80619eb71f10c5c1e64a |     
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/83d8ceb0569f97e0fd238f1c2f4c4033bc2acffc |     
   arceb     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/d1a193f76ecdef56773362c0ebebefa2c1512956 |     
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/1aaf3c03b2c3be662ab0ff5d0396e713c6248e77 | ORPH
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/adfd4cb1b0262dc483f47497b75bad2a2a913335 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/16c6ef29176e8e918ff4aa0489d05fc16d293091 |     
 aarch64_be  |        micropython-1.18        | NOK | http://autobuild.buildroot.net/results/00a47a291c4723100dfb176bf64676304fcba516 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/af1424d9a03cb04a5429ff093af47f86c7543645 |     
   armeb     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/933bd05a6c02d6130f44cde948e381dd6720f977 |     
  aarch64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/79938bd958cda2bf3abe66d4b5f7a83d1a5281f8 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/09200aa97a05493bfa50e02556b956dcc963079f |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a2f34e4f3f621ad1effb3a1348e61560b8857305 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/eb679e9118a9fe4def6f647085006c95cee4ced1 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/05f0dd964fd22e3f1846db6119d8b361bfee2869 |     
    arc      | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/c6bf03e5bfcce00e1b633c2b164cb4eabf3edc6c |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dcbd3fef88810e5e5a66909c1108e5b8e9507822 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/529ea0b27d9cbec6506e3da44a0b92e9bee70d11 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e59bf86cb0e230fa52cd3eb90a43c6108f20a4e3 |     


Gitlab CI results for 2022-09-23
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657559  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657569  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657621  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657622  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657623  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657624  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657627  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657658  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657659  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657660  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657661  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657664  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657665  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657666  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657667  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657669  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657670  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657671  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657673  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657674  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657675  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657696  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657697  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657726  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657727  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657728  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657730  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657731  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657732  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657752  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657756  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657757  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657762  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657763  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657766  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657767  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657781  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657830  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657831  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657833  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657835  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657870  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657884  | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657899  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657902  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657904  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657906  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657921  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657924  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657926  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657928  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657930  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657932  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657934  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657936  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657938  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657941  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657943  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657944  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657947  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657949  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657950  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657952  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657954  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657955  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657956  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657957  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657958  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657959  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657960  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657961  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657962  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657963  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657964  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657966  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657967  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657968  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657969  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657971  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657972  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657973  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657974  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657975  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3066657976  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
