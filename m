Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D37C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 07:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5320B40121;
	Sun,  4 Dec 2022 07:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5320B40121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-LtKAky0Bb2; Sun,  4 Dec 2022 07:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F6840488;
	Sun,  4 Dec 2022 07:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F6840488
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB0121BF32B
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 07:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A043B415A4
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 07:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A043B415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KN-KGICut0M for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 07:35:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D637A415A3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D637A415A3
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 07:35:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D82601C0009
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 07:35:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 04 Dec 2022 07:35:15 -0000
Message-Id: <20221204073522.A043B415A4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670139316; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0eMW82RJV+RijrTHc4pp7yZofnRb6SZT9hVFq1b/MJM=;
 b=GuPbzx6zgaUB33Ge7+tcu2IKhBjB8EwVnj3xYIVlzDDny3mRvJYH94YHjbA0lTA+WCS0Az
 VXt+NWvyw8lyHUMl0KS9/pZVaoc5g9A/vFgYgZiMHDrDCFebRNd6m0jVBn/Jk7m/NgbWmd
 aZx6RR+OtHFRuxcZW+Zo8d5X5928ZUm9mcvRf2kEOxjj+TMdwIT/Dj94TkUyTLF/CAa92q
 icxlo2KlPwFYvv0cpyCOasJJbZmVkjGjDOSCN6U026fhCZEQc3abq1cJT31JURBTbCtKhH
 1sV2kYFqXYqYUCzK16yQE4yb4+INMnWz+WVuTR/FW3pyFC1MpVlQXGMdWI3j3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GuPbzx6z
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-03
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

Autobuild statistics for 2022-12-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  1  |  0  |  9  |
  2022.08.x  | 23  | 15  |  0  | 38  |
    master   | 206 | 201 |  0  | 407 |
     next    | 13  | 31  |  0  | 44  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.24 | 12
            host-binutils-2.38 | 11
                host-go-1.19.3 | 10
                      xz-5.2.7 | 10
                   linux-6.0.9 | 9 
  gobject-introspection-1.72.0 | 8 
             lirc-tools-0.10.2 | 6 
           python-numpy-1.23.4 | 6 
                elfutils-0.186 | 5 
              host-rust-1.64.0 | 5 
                tealdeer-1.6.1 | 5 
                 wolfssl-5.5.3 | 5 
                gerbera-1.10.0 | 4 
                       unknown | 4 
                     efivar-38 | 3 
glibc-2.36-66-ga1dc0be03c9d... | 3 
            host-binutils-2.37 | 3 
               libglib2-2.72.3 | 3 
                xenomai-3.0.10 | 3 
/home/buildroot/autobuild/i... | 2 
                alsa-lib-1.2.8 | 2 
        edk2-edk2-stable202102 | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.3.1 | 2 
       host-gcc-initial-11.3.0 | 2 
                libkcapi-1.4.0 | 2 
              memcached-1.6.16 | 2 
              open62541-v1.3.3 | 2 
                 openssh-9.1p1 | 2 
   openvmtools-11.3.5-18557794 | 2 
                   perl-5.34.1 | 2 
                    php-8.1.12 | 2 
toolchain-external-codescap... | 2 
             uccp420wlan-6.9.1 | 2 
                 wavemon-0.9.4 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
                    attr-2.5.1 | 1 
                    bat-0.19.0 | 1 
                  check-0.15.2 | 1 
                   delve-1.8.0 | 1 
                 dhcp-4.4.3-P1 | 1 
              e2fsprogs-1.46.5 | 1 
                    emlog-0.70 | 1 
                  exempi-2.6.1 | 1 
                     file-5.43 | 1 
       freeradius-server-3.2.0 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
                gnu-efi-3.0.15 | 1 
hawktracer-2ec19d7192334414... | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-10.4.0 | 1 
               host-runc-1.1.4 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.7.0 | 1 
               linux-pam-1.5.2 | 1 
                linuxptp-3.1.1 | 1 
        ltp-testsuite-20220930 | 1 
          lua-cqueues-20200726 | 1 
                   luvi-2.13.0 | 1 
                     lxc-5.0.1 | 1 
       matchbox-keyboard-0.1.1 | 1 
            micropython-1.19.1 | 1 
                    musl-1.2.3 | 1 
                  nginx-1.20.1 | 1 
                opencv3-3.4.17 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
          python-orjson-3.7.11 | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.8 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                    ruby-3.1.2 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  udftools-2.3 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6f75f092227b15b1664fc55f4a6a23502d4321c2 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7e12a7f2f86b378c89f12353d0bdc74fc30c50e6 |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/058efa45ef137c64f7aeef80ba666ec2ae712d97 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/2f2d8800753c5e639fb575015298b75f00a4afd2 | ORPH
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/f60130166e9ce325ac875ca991db6ae48e3eb6f7 |     
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/9ea5df764245909984345f0abef103fb455af53d |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/58e0a5fb5684d4c96ae7641d5c0116ef0cdbb653 |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/e00ef4a27476013fb8f11f1f3cb7573a59e1f100 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b53824ad5e5e408ecb939b7bec7f75e90098cb7d |     
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0ce202c82af26e8283695399377c169edc1d4114 | ORPH
  aarch64    |          delve-1.8.0           | NOK | http://autobuild.buildroot.net/results/e7b208769e002202909a68953c633e1a9dfc8eba |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/6a0354eec9ae17f8f74c2ab31d57a012128f0044 | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/56cc331f03d9bc494467244b83ba5f87c1e3faa4 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/e53818c271d97ff8c11fea67694a22a8a9fdbc08 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/1852259af26c891ea074ad565e2c11ab201881fe |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/63e13836876f5504f24a3dfdd83eac17757f9d52 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/6bbb50283410ae1d9249c595c3aa217ffbad904b |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3dafbcb7fe5b86f10b4c54ea0f9a26e7474159da |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d3a7f11aaca9bc17498f13b4bd59477c4cf1bab1 | ORPH
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2ec3fca1a026ea47fa23554a3f98d53832dd2877 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b33e76547b67de270ad58e362e10480af99d249a | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a9f4b1bd7b80c2053fca7f5e014cd2192c84603b | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/72599267e2f5896b67887ad1138e827823f57a4c | ORPH
    mips     |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/88bae16061f22bbfbe4e38a7884e24ed2302cc3c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/9d2a39b254d2e3c53d9442e9ad1d5e9627101de6 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/01a253d8b1eba082afb24a3513cf33ad9062d87e | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e928228043e360f9e69a64fd37bf68e8559f2538 | ORPH
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/46ec455ee7125d0452fea19ef771ab7f885961e0 | ORPH
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/155473983b2764c1d7c0499f65c5a5697d18d586 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/2cb239a67c0f7d23356672c77ad0a71d3841d8f4 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/9cd2caadce60b8bcdfdd71f5d5d685df560d856f |     
   nios2     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a37f5ccd0c259c0e8957ab16bde043a569342ce1 |     
  powerpc    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/e9059e61d775eb7d85faedef25b719d00ef3e4a4 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7ce117831b74d74b34ea14b9afa0c044ee172f94 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3f4427bd360a918377e491307972783520a56c1b |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1bc1b9f01ed198b0ec5c7b76bcc071bb7cbbf6fb |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/970e02aad6edf19f5ccfc1fee9a35889307e01c0 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/47e01a90d42be394426eccff81a181f493f04ab8 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/de20ef7c069034d91acf03578cb6dad8ea0cb012 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a4a0923dbf1ad617b72cd9808c0ec6de61f426b1 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d59c4a04084a6fd09ba55e3f965f6168a23b803f |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b1d2049dd774227bc146d84567fb1f5f84027d8d |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/06738e589eedc004b5ed8cbbc8bd362efbd74dae |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f3f14cd9aca5278f7185e2a5b280340cba1a8c05 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0d3d3b6ac7dd5d98095d77668b13d9a013798262 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/148d8918d585deea313d14e9e60c098faec3ebc1 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b61a5f36f2256dd2309d10c293987780675ab8d9 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5c4f6cca8fcd399b4f9e0799da6469bf5ffb2699 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5edd9f99098b9affba7600a7c82eedbcf369babd | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ee759f47a317f27179441c7a9e36f9fb398be025 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7544076da301679eab44331e25b31c2b81a13953 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e0e1610d07ea157f7c89948fd4feca18ee4b0550 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3228e97704851ac5d74cc14e0a2e29044def9c15 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/77ff27bc3ed7f3be6fb060404914c445eb532541 | ORPH
  mips64el   | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/36bfe083b4ccd55a6485c374204b2cf3872e38d5 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4704c369bc173627ef4d97786bea96c6f3845e0f |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/191921a29e09dd00b1ce08896ed84acc22cafd42 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c18d991593482a3599629a734d2bf3504251290a |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3dc4d38214ce876b167c9e82ca6c2f29e45e0743 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7d56c939ecc1a5fece13e892c2c7110212708c51 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7f57382516da9c0e6a93ba6a7a670584c49158a4 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2cb8764f721041efa3ac83a5a4a94345ef29fc5c |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fca1a1978467e03784f1d64cb45bcc9e71bd207f |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/634e9933f6ecd4cfa502eaa1a360111ede666301 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/36caa9fa29f93b2d03163e33d61bff609839d2c3 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e02b70848510049b95741931f0708b0b1170cdba |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8925e70fc6509a5af30bbe84c0cf2c6548960bd1 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/deebdcae2e724798d0cd252678e6878316bc0ff8 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e6a620f9abcd96c7d25e94a81840dd80b50a3082 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8b5c2617c793765ed312f7da4b731f6642292e8e |     
 microblaze  |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/ca822b9bab677c0a9446e5faff1562525db1dec4 |     
   xtensa    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0490f179987c673f311b47a2bc411396b91f0d43 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/880ed6c402dbd68bfb07c9c2fbf7cbad1f0fc852 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/230d5914bb1c21d630272e33326a8ff56b4666ec |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2954b0ed13ff2fdcd4ee2e60ec670b1f71c1f131 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a739f31aff5034526dda9befee67d4978574a6e4 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5c4b84d0a6d8fccab5523908ef08a27dd5b6a656 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/61f1065b9b9cb2997e6455fde8172a2cfeb70d2d |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ec8e4021be0a46669c5d13a941701af336858126 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a0decbc9051deb4719d4a9fc8813f422e19fea37 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b856057a13d21dbdf417d7a5c777a0515adf3380 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a8a19b632447ea8ae7dfd7d5bd609f783d77bb0b |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b44313fd9837c6402659270dc9e539612b249c6b |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4424621a4a3f288db72fc9c1cb4ce93047ba24ea |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6775c63282f4b4043f953581ac2be3d2de5f47d5 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fbb9320463f966308056624ba400dc20b61fbe2b |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fd7d487ddf4b8685fdd719cc3fd17f75b3443fd3 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b750562a0e6bb1cb0d0ecc30b118f4d9b96aedf7 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9be418a3875c0c58c3b88187dab17122311adc89 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/35ea9ba9d2141672c49dc53e4e13186a36f1c545 |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/11980fe75e8ff8b5500ba01f6cd8a55e4c2f6d35 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c1f5e2e0070f764ea68c517943203d65a199d7d4 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7a853e7670b27363afc44ca268dd6a824a88c663 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/090d80246ed777aa4ec7572ce8bef0eb5a5b0ebb |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7c2b444ba1ec672848e910dfe6c648fa169fbc30 |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/7a6784a18ca4723b69812da13a5c1a07dc3a2fed |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/48cb29b21bd26086017a5479e3861804abc6e748 |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/38e1d63b9f9a5cda838c039df7e6f76e0e1a0b79 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/86b5c5b60c124c94d656c12925a49fdc08bdfaab |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/45e5909cdf37c15e286af2cdee19c2c2a0df3e60 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/492adbbb06a81aa1633e7efbe02ac057888a5210 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5b1e37bca8fcb4ab4fe22122b55d40a28c758961 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c4d25626d68422e9540624fa97199333cfbb646a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3b2f1db208c91bb63f6a11efa87760d8182d8aa1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3009303721e14df9c1d9fbcbae71ba3ffc640994 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/81b088323442d81c74c454598240bf58e0baf0ff |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/e5587802ccc6493c784053ace4a59b0d37d1d554 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/9b6306e963b7069e51db57c90d0134d508265353 |     
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/30e38b9bb081f404fe643b01d9f8b3201284ced4 | ORPH
    sh4      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/0bec4a5cdeec56d5d708b697ce7d5031e35e8058 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/1940420b2d28e9c94d8f1339edd1eea89baf549a | ORPH
  aarch64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/d94d90fa5901962105251bcb94836a4c4e32bcf8 | ORPH
   sh4aeb    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/aa0201ecc44519b3006bc92c7f8f4d36f1372445 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/60f488aa076ba2571b20eb5f0fa0f5ba65a123fc | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/37c7c2785b25d6414d02b0413fd5ca74efff5a96 | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4a0d4e7d84bd654218d149f2614cc68a3d277af4 | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/43b6cfca67100b1094b8fb78e6c05a4659df0645 | ORPH
 powerpc64   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/179456edc6c9c755d827d5ad6a023b39cb7b99c5 | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/7afe8ec8d6abd583b58b6b8ac7d00d84f24ab81f | ORPH
   mips64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/edb2daa9bc70ce8eb85b5edb487dd8a6d35bf02e |     
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f409da9d186809c07a387578bc649ad0d7ff2e7f | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/90bc617bebd5ade2ee80e83911c4b23f74004faa | ORPH
   xtensa    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/996d102803dac59dde23704a32c23487afcb9291 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/76639880b115065c979fa5f3fff9b355ed8880cd | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/fe63acbb65fda51f4d4eb10935b7f0df9e559c36 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f4a74057fc3c3b9e9948cd49041de78b4b9a0312 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9541412b3e3817c3289018154a4cf85566c95983 |     
   s390x     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/f5e02b8a4dbdfc72695289ce8508e8d1c0f47f7d |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/3ff5da67b66f9cd195f7f785f04629d8e251505d | ORPH
   s390x     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/614f0eaf8de5fdc8dfbd131317223c85f8a6630b |     
    mips     |    matchbox-keyboard-0.1.1     | NOK | http://autobuild.buildroot.net/results/4495f0720d7053a52ff8fef82d18a70a6f20c66b |     
 aarch64_be  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/363c84eaa69350e02bec0b35b88d4bdf4dad804c | ORPH
    or1k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/df7d0ef9bab1fe16fa71ced3771ba52054448d73 | ORPH
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/601ed54310fd47c5d1742086f9666c469cf5197a |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/54681f246eb4f6c247c2158e49dd6df75c1cfff3 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/79595320fe8b73431a7837e55c6d446b75f961d8 |     
    i686     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/2967bae1022ba5151016f95adbb891b2dc903f3a | ORPH
 powerpc64   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/ac1b898de62fc2474c239ad329b1e650a5782fff | ORPH
powerpc64le  |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/e726a9032b554b189a753a34f83b682d30257485 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/a3f66ac675e858ba6e28c64820061b70a8f6151c | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/6031b320b06446947b0c9a05e5043230d59231ca | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9c507e88ed2e0022a337bf6e84701415b1aeedb4 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/a66e01bcdb21a74b438cfeebdde7b7b926025965 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/11060930ae3532408824db3b2ee0940d5a7d4de9 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c1d6f7f71b9e0bbc6e755f3901c197ae0b0cdf32 |     
   sh4aeb    |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/10dbae498ad3c860ffa328f0392468d8ec2ca8fd |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/184023726f345b0590a2b55f66def4cab445f83a |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/ef488a30306a4b67f0f1d082a27118da2c2aa1e5 | ORPH
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7d7640d8c49828fc1980daa7091a176f9a8f89ab |     
   sh4aeb    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/78bec069e7c4c3a773152d23f3a0997374b27bbb |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e341ffaf592a984098b016f3537c44eaf8523b70 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/8fd7bcb33b7efbdd7564235c8191521ed2231aa3 |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/198d488d377102a228069654f4caa06389f42bb3 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/aecc0aafd2b2fd367183b7b1e77c6ffe39f274a1 |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/82fd96def0649ee6048327d6bd711f881e44ecdf |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5a02bc0bea706c45aed11f8eba87ed3e26444508 |     
  riscv64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/9906474ff5291a43ea80ba79589581288b2769fb |     
   sparc     | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/ab6482975befba0ad74bb7d91b37373b9b0f300e |     
    mips     |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/d4da8ec7c9849e8f1351ed7d415d0c108864f05e |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/e788e4c2361b64763ae8e6b78a3b33a74f29bf5e |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f8b4c48ed2bf2c203aa7e60e9e7ba4d8e997694d | ORPH
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d6c6aa7bbccaaf940896215c9a070af72e55bd40 | ORPH
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8cf6fa48e8d07ca3efcfe94f3f8c94c000e3a659 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8e70b63437c03bbd661a7a3813d1fd5c601496d0 |     
  powerpc    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/4b0b0e56e8cef3c86326162c0bd7cdf0fb7b4cfc |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/c65aef0467b20ff665621b3121cc4b530b076367 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1d539eb016640b187028394bc659db86e48fc6b1 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/477fd467e1922e3dd68f4685248c27612e8894bd | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/8ac1a5d8ecf1f524c32d76436ceaa2bc85fef54e | ORPH
   xtensa    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/80c09f0d0a594dec1e21e24232fa92deb6d479d2 | ORPH
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/599351cd3eec5e6dc1433b5ce993db59324a973a | ORPH
    or1k     |          udftools-2.3          | NOK | http://autobuild.buildroot.net/results/917940b147846e1c1e4715af8a9a46763c14cc99 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/87c0265952356b127f8ec40d7099c0a43b238073 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6583dbc4843f62b27be2a9f2b6d9fe6420a6c793 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/f876a8075b9fcbcacbb833eb705087e523152a3f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8c4263ee0d7da2c38c92f6f9bd4b056ccde9021f |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/410034964c52f299779dfb8f4a667c07431e26d8 |     
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/6eeeb9a6fabedfb41d6519ac303c6bb3124f40d8 | ORPH
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a60eb7d27c81207bc5d3b65d7fcdd4873d2a7ea1 | ORPH
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bbf41d5a300741a5dd634161314c1710a7b73fe9 | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/74b3b012398765244ceb952bdcf9072054d7703d |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/afcfa505ba3b6b6b278aa09385c4f3fdc08a4d8a |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/cfcba9a93f9854aa1c9618afd5683d971b9d9532 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/2743e2a1f22615535507e9fe2c46a49164211438 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/acfc6e4ba9c9881df93c1570a51e2b832322fd7e |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/76a9f0373fec2b41b3530263a963870911073d17 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/34535f0c2408c2cc16c26d26108f5c9fd8270167 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/77868eb23d0ef1d5f6b40967bb5266b755f142d9 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/03fea121735663fc77f467826cce858286ad0871 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d23413ed8ed77ed8e0879efa8578d100cf40b927 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b127c6d88613bd4d48453f10cf7e8c08b0cee61f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fc29a2e770a7c3e2272e9d18e1fa41bd2a7fc182 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/44e7c386dd5667767b06c26a9110cfd596e72c08 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b553da405a0388d14b1541373f5f469d0eca19fd | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9e49fcbfce9f87710a6fc7ac021f9b7047fd7213 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/717ab343933f8f6b1a18e5f69eb2d6b1c571967d | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d5c9f362b9b5b58bcf93117127887cb4d969d4df | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e936bc96f38fcbc82f6b9f5ec2696daead9817ba | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/59049c7d6cec055c04f00c855256aeebb139f7c4 | ORPH
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/45ed562d9e4220272b1895bd56de531cdd17ffd5 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/5b57ce8850435e28a5b94e272f6d95fc13a923a1 |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 4 
          imagemagick-7.1.0-51 | 4 
              host-pahole-1.24 | 2 
              hyperfine-1.14.0 | 2 
                   linux-6.0.1 | 2 
                       unknown | 2 
                 dmalloc-5.6.5 | 1 
                     frr-8.3.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.3 | 1 
                  jack2-1.9.21 | 1 
                  lcms2-2.13.1 | 1 
                    libev-4.33 | 1 
                libkcapi-1.4.0 | 1 
                    norm-1.5.8 | 1 
            python-bunch-1.0.1 | 1 
                  reaver-1.6.6 | 1 
           sdl2_ttf-legal-info | 1 
                  xxhash-0.8.1 | 1 
                      xz-5.2.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1e77e128f0aa75b647ca8d39463c7fb4219a83a6 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9fe409d8335028355c208ad52d801116f2ea80f4 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2f6df889364864a8ba5367d6f778eb71540b3a1e |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a19eb9676de6623f68aab10d91f2992e6157294f |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/019025806329ef399d554230909acc6fe1c31104 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/42b47a339e8293d302c950c232e39a48ff53e3ae |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6de1c921eaa3e7158900869321c83bfa3773a5b4 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/04dab6e99aa547f12de0f085baa7326fd1e65e99 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/241b9462e0c906df10ed6a7ab9fe74487bf6ba6e |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e05458b55e5f7dc0f7791c87c8202b2d7b746c94 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6bab998b6481bea8e75d094111a12c1d0b0350de |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/c46b90d49c3fc72cedb3967efdc3f17f031dcfd4 | ORPH
  aarch64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/12bfe29529420dc9d87b6eab1c46edf5f7eeb268 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4f0cce7d6d07990b5363d8a78ed6cb0a99314f32 | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/922a97b2056f3c5c8669a68a131f51d4fa598af3 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2650899d796f2aec68d53c9025879180dfd1bb4c | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c4d9e3b4045e746a067b3dcc8c69f8b47c7b2cd5 | ORPH
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f1915c535ff53fe9ca91062184dc5408b85aaf64 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/19b94258bd93d23db6e33cc37ca425a5fc6c4fd6 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/7e446b62cca27f88d838ea8b5bd2a0ddd154c098 | ORPH
    or1k     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/6892102ff3e4d8fc3c164450a261103f2a2c034a |     
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/9d7a38cd8ef566935a25b77780d1add6c91802fb | ORPH
powerpc64le  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/def77ee1a49ef4123345a7a5329a1a18937dac87 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f51760cb4011c21139b18a11cfcd10bde399230a | ORPH
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/246b13c5e160ff068bdf58b317ed39735148ca80 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/caa7f9b7b197b7277241e633c2c4fac49571e029 |     
 powerpc64   |      sdl2_ttf-legal-info       | NOK | http://autobuild.buildroot.net/results/6d2ecf6bed7d8e4d6c91c97f4f759b95f329a43a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/55f5f288a74a7a80f549a6b3a18ff799d25d5077 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e9823549c101ec4b14db28a4389d4301741b4839 |     
   nios2     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/a3dd4ac00467f24eb92371264c52a418aedd27e0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e42d740e1a010d2ff54751a57c41505b2c34b8a5 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f5d25787e591b3cf734cc84215a38d98173924e0 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              host-rust-1.62.0 | 2 
            igd2-for-linux-2.1 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
dahdi-linux-5c840cf43838e06... | 1 
                     frr-8.2.2 | 1 
host-pahole-73383b3a39afe86... | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.7.0 | 1 
               libglib2-2.72.3 | 1 
       linux-5.10.109-cip5-rt4 | 1 
toolchain-external-codescap... | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/60a13ae3d1965d394084f3ef77c69f9a71c93e0c |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/21dcb52836f7203fb00ec7897372e92acbf5756a |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/c0f5d1f2ea65ad03e5b537fb278376832e3c4771 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/33f98db04724938fc5d502f603fac22683af6b14 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/7b82a5a3073aaf5f07f465d2ae81a0d5c9a28467 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/fbcfb1a1fbd46bd8d38d386cb1b031a524bf8d17 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/02981640ad79ed0ede557747e666fc9c220ab0dd | ORPH
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/4415b5b256b811eb5f8e1acddb1e0ef2240c6684 |     
    i586     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5dbb1a1f2384d4c56aa81e80fef726761861970b |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a47033ef35b97215f78c22a92a375ba41d29be49 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/99bd851c683aa5ee49d6b2e6df19712874961f24 |     
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/5a017550b1ad79a4b109ec2c00e2bed314736c48 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/b122e6e0be9123fd4300b7935f009d0fcd58f960 | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/c5e7c39d16981fbab07da01172ee2bf6427a0955 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ab71fc1a28384d3513d7deb3806d9eb8b27989e |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

