Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D557C83F2C
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 05:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECB481871;
	Tue,  5 Sep 2023 05:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECB481871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8pxcqRC0uBC; Tue,  5 Sep 2023 05:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0178187F;
	Tue,  5 Sep 2023 05:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0178187F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE451BF32E
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 05:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AB4240924
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 05:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB4240924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNEsHtIpVz96 for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 05:41:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B80840922
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 05:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B80840922
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D37D40027
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 05:41:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 05 Sep 2023 05:41:38 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230905054144.0AB4240924@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1693892498; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pSw6ZYAx8FKVPrVR3Pzh+IuHig6L22EC2JesoqsVlEU=;
 b=Mp4n0xbH2qAohuLpAg6qubfUn48nyExxl/+LOCQdQlB9BnTpVsnXK32VFbbZYsUEZZ0AZR
 hryA+ubGqRrwwFVu490tXvrN1yopneJuBk7SyUuI23X5hmAo09unJl8fTRKYi/C5byxHA8
 wuGXoRZWvTjVnjs2UwqQEwUdNaSZf/OT+3dwwTlK5mykEhseWQDVZ50CGGajzPm0NEb4zP
 yMD2RGwIVoz3ieCIQexgkJs9nEFL1tqQpwxpYyU1HQiuKOZ9rG8aBbM0MZU/BAXss4mdT8
 jbQdOWBk07XxekpvYMkf7wHntALZb44+uduX9qSPPNGBEvBBj0TKA/b/zBwAig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mp4n0xbH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-04
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

Autobuild statistics for 2023-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.05.x  | 10  |  4  |  0  | 14  |
    master   | 75  | 56  |  0  | 131 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.39.1 | 8 
glibc-2.37-2-g9f8513dc64119... | 3 
         host-sentry-cli-2.8.0 | 3 
                  conmon-2.1.7 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.71.1 | 2 
                  linux-6.4.14 | 2 
               linux-pam-1.5.3 | 2 
                oprofile-1.4.0 | 2 
                   systemd-254 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.6.3 | 2 
                xenomai-3.0.10 | 2 
             batman-adv-2022.3 | 1 
                  cairo-1.16.0 | 1 
             cni-plugins-1.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
              fftw-quad-3.3.10 | 1 
           flatbuffers-23.5.26 | 1 
                host-go-1.20.7 | 1 
       host-python-sip-4.19.25 | 1 
              hyperfine-1.14.0 | 1 
           libatomic_ops-7.8.0 | 1 
                  libuv-1.46.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 openvpn-2.6.5 | 1 
                python3-3.11.5 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                 rrdtool-1.8.0 | 1 
                   shadow-4.13 | 1 
                       unknown | 1 
        util-linux-libs-2.39.1 | 1 
               valgrind-3.21.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/f152ef9166ae7ff0ac7b57d9e1122533d3c07111 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2997893c228b09371c8ea4624f793f48cee652ac |     
  aarch64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/1ac7eb60c46f061f4681a3fa254c1773a07f451b |     
 powerpc64   |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/a0edb3715c8454c810f8d672920c540a50fd61b0 |     
  aarch64    |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/bc810e409ba757c3481ed03f0c2230758ccb7712 |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/60787b589b685c5a77160cb7ad18eeea9fd8132d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1ac87b749437b27977e5cbd0b79a816b7c23305e | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/a42413f6c97633c9a3e841d67834a6f1e8efcadc | ORPH
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/063facccd1e6b9cc59d96fcfbaacfbc7bb4d05a0 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6c3f7640bda012d6b637a6d9f141b5defd1df9ed |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ddd87749db284efe2dff3b9228cdadb8d9c28898 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/281f20be5aae07e4ef480d4a678b41ed69467271 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/41f84a0abee8007a24ac39274d1bc769da00e812 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f4a2692eaec3582462cbb37de5059ad37fa11544 | ORPH
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/e5c1ff9f86fdeaa7fb362afcb68b7d2ff09959ca |     
  aarch64    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/30294e6c247d99bac35438b0af022e5369c2e780 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a0a3134cab5316a5c6e8c4c9ae8f3628778bb3bb |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/48fb3c27aaa9ed77a8d6ed521b6be618021f5127 |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f3270d36ad1875bfc822d9903d0c7d7d66d41fac |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2efe8c08e9d109ccfaebd022fd09abcf92f8ced8 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7eca428fb5f6f03d189f5e5e1c268f63422cfc1b |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d0f3101bb613ed56eb5624b8b22653fc3a51074c | ORPH
  riscv64    |      libatomic_ops-7.8.0       | NOK | http://autobuild.buildroot.net/results/711fe3a36fe19df7bdf95da15b24ded8cc4d4f14 | ORPH
    arm      |          libuv-1.46.0          | NOK | http://autobuild.buildroot.net/results/bfe7a24fe639e935f8793d691722ed2ac027908a |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8b3cca4f91d4320ac8b227c5f46f14a142ca0f7f | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/57612252ac7077c78e6b4a0849d618ff7aa9e14c | ORPH
 microblaze  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d4922cb3c28dc2925e53fb7e1fc9fdfb567b79ba | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/6f0aad508e4a5b2235b3bb0ed2fb1024db21d53a | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/adb35fd5753d01d0a950fe352caded2c31faced8 | ORPH
    arc      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/7b5d962161dad7e2e12c405ea01b45c3cc679d90 | ORPH
  mips64el   |         openvpn-2.6.5          | NOK | http://autobuild.buildroot.net/results/db77763a07007bca10aca404b66fd8f9dbea4dc2 | ORPH
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/00923745352237c331a31fec1a4139bb518975c4 |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/668552bf01b0b71bb7de2e78ac332d4ee082cb33 |     
   x86_64    |         python3-3.11.5         | NOK | http://autobuild.buildroot.net/results/09373ac5d29b89f2d06349348679f35d3390ab2f |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/91a2d87eb42bf62f8d4f2b24788deef6c5e866f6 |     
   mips64    |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/d82132ed3f3c3b13a0d21e77a9e21643f31e2094 |     
  powerpc    |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/93e515709b006b85f6a5880216201dab0dc81dc6 |     
  powerpc    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/cb524a77833797057ffb190a6712d605e2a981f3 |     
powerpc64le  |          systemd-254           | NOK | http://autobuild.buildroot.net/results/0a96edf58165166d9b5ce84725963b33c48a8e05 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b11ee6ba736c054e15c510db761457359f9db97f |     
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8560d168d1be1f9c6c85f74986bcbec401db0e25 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/71ed9a58221e19f01a050b2617412ea62e1d3e1c |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/e69bb48a4093e371879bdb1933e9a445a135b50b | ORPH
    arc      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/67f39b007949b9772b7009a5a023ad7b7f087d80 | ORPH
    i686     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/8209adb8e9fae8d3166f883ee9794a2cc57072a1 | ORPH
   sparc     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/7f5cb9dd5f5a938197c07b170986da4659da481f | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3757f30e1558acb1551603d7f6bb6ac93eec137d | ORPH
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/973c54aed87dbd708fc26d2a96843402cc6d8b0b | ORPH
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/fa1e401eb198653e34196dc79e839c692bd1911d | ORPH
    m68k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/06c5896392fb6b933d4931b923d5be92badb4b44 | ORPH
    arm      |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/f306a8a1beaf780a824a3f93e271ff109adb66a0 | ORPH
    mips     |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/06037bbc7f88db2c8087c0cd22757951f2cb052f | ORPH
    arc      |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/0121199e84aa50483913a31adee877ca51a1391c |     
microblazeel |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/c46af9bbbcbbaa65b8bf40f20e50ee2435e7a144 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c4a899b5b61b7178e6ee6596676eaf9d5613007c |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4cc21a2548be343608ea44b01e8456018cb74c60 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
      libabseil-cpp-20220623.1 | 1 
          linux-5.10.162-cip24 | 1 
                sysrepo-2.2.36 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/4e120709f3fc7424acde5bd94a2d0f923e00d3e2 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/5e97038feeece3647adb9460372cdb1156a1dce4 |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/af48b2d906f9df5068fd0961ca7aebc2315002f5 | ORPH
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/7c2506dc8bf6ab273ac8c5de7acd882be1e92187 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/cea2defb2a53ca4ba543200962dafb3795b5849a |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

fs/ubi/ubi.mk:51: /home/bui... | 1 
            host-binutils-2.38 | 1 
            ocf-linux-20171122 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/4145321a7e28b55bce889fbaf7c3737d82bde900 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0f818345676557a9597ce306079c595c03d9d61f |     
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/bd3d00ccb61e09c5cd33177cf0ffe2a69dd756ee |     
   x86_64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/3a150920e05da95305eb54ca82237a2fd67bfec2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
