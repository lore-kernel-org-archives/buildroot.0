Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3148C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 07:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0D2441602;
	Sun, 12 Mar 2023 07:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0D2441602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slZpYoxO4U0Y; Sun, 12 Mar 2023 07:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70094160A;
	Sun, 12 Mar 2023 07:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70094160A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A348D1BF372
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 07:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E5CA60B19
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 07:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E5CA60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpT1XifSSS-z for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 07:35:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C251960ADA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C251960ADA
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 07:35:16 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B09DE40002
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 07:35:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 07:35:13 -0000
Message-Id: <20230312073519.6E5CA60B19@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678606513; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WOf81Kkb8mrjIhHWT2mLIavsjzLqvAlLsun0WbzmrVo=;
 b=JaAgwl2omPRdiw1J/SIFj/mZ/9Z8mY2nCSPdrvv6QD9OQoUtZIPtJJ1aetEKqPO8XEVbY/
 rR4ORKCWLHZiDcao51jTlJpZt6I7XplYwM3TjPcQrkCQOn6GfyNC/SFzs3gWs7OwThvphl
 6xp+HsnyxKYeEFvxyl7ai1KRYi9sCLGdDYa2pwgzGpykUpHn25A0z+Eo6uJNwJT6jc4NSD
 XzIX0xLU2FJpE1agvsLsOlt+45aE+dbN+aIH93PBeMg7mUolfm1TmXNeKnAdvCt32NmBI5
 YxnJ2Bz9WiHinuvF496aAzKrOTE90rTIDyrjjAqnlvsmZiI/QR46p3JV5DI/0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JaAgwl2o
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-11
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

Autobuild statistics for 2023-03-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 11  | 12  |  1  | 24  |
    master   | 105 | 84  |  0  | 189 |
     next    | 21  | 17  |  1  | 39  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-81-g4f4d7a13edfd... | 5 
ulog-0389d243352255f6182326... | 5 
                elfutils-0.186 | 4 
host-go-bootstrap-1.4-boots... | 4 
  gobject-introspection-1.72.0 | 3 
              host-rust-1.67.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
            host-binutils-2.38 | 2 
            host-binutils-2.39 | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.72.3 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.1.14 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.36.0 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                  acpid-2.0.34 | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
             cni-plugins-1.2.0 | 1 
                    crun-1.7.2 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202208 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                 glibmm-2.68.2 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.6 | 1 
           host-librsvg-2.50.7 | 1 
           host-libzlib-1.2.13 | 1 
               ipmitool-1_8_19 | 1 
                   json-c-0.16 | 1 
                lesstif-0.95.2 | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
                  libsepol-3.3 | 1 
            ocf-linux-20171122 | 1 
                    putty-0.76 | 1 
         python-pymupdf-1.21.1 | 1 
            quickjs-2021-03-27 | 1 
                   rsync-3.2.7 | 1 
                 rtl_433-22.11 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/632decd4ea50c937a17624358098209f47cc467d | ORPH
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4011a354441a9b7933261d7a808574ec64e940d2 |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/a9eb6ee24ab2a072188652be6602c0d450cf88e1 | ORPH
   x86_64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/e4c1030e38bcad2c61f1909da4df18b046e8a09d |     
microblazeel |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/3ef9b01b0b06e865c7c04ead3ea7ae977286602c |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/00784420ad98b8553fd37bb410f463ff41764c11 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/7e43d4b9419cf0bea32f11ed00ebce33551468ad |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cd4fdd4634de97dcb280279c6ea095344bb57f6b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fad313acb44d1bb4c4593a4d828a2d29e24951cf | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6f3efef7e0f0a2c21fe8f6d71854b378a759d314 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/78c4aba88c7ebfc99923ed59cf067c2a0d18fa89 | ORPH
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/663a84529e26f69c39aa381d83d4ad5f2a436a51 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7d1bcc862a68c3c38fbf09744cbf68b90a4f5ce3 | ORPH
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/41ba3aaa64a38fd64dd8e05dd411b248990b8e4f |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/22ae250caaad4db53538884fc6dafcb8accb49a3 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/22eae50ed38425c07024e7999b1310190a6651c7 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ffd453952ee80a185728a7bf7c1f9dde70a51518 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bedef6d2b6ab2aae7f2b56ee5c277297c03d8677 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6037f5c9a09a2e10e6448f6fa23aaaaf00ed0e7d |     
microblazeel | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/75c86e47c43320ebe77dac33e073b8cfcb766ac8 |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/7fb24be520bb423baa321b2d4dd09f8bfe14a19c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3321d22a589f999dedcf12cbfdf73652a6c49f55 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/dca59e38c1bbe245809c18863262dbc2f8f31c10 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/46d1de5e14c22353d6617833f2fc6b8443072ea4 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8326970e1bb08a571bdb03eda9148359af929045 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8809ef42ef4b91a79a4191bb5e4ea32338409341 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/bd23640b2607dd32965afa04ab85d31c2f67a4c5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/9a8f8a754bca91a24fdad7aff0618243413d8b47 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4f5107745387c7a45d3253d3204875104b91988e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2a3156a0eb37dc64e028571d4e442625a78b7bdb | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6e39bbc2766a2df6e2d8c1ab9519de66ca8de85a | ORPH
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8b55b24fd0eca26fd3b5fdf413cbaf243faa5f41 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea1a7c4f9a826de2a2759758c88816d85375a23c |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/404ed0f1b7f3cf2089456fdf17c8da9a772d95ec |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5e16c6ee0bf659a59c78f6a1db1e727afe74168c |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bb6c9c1dad0b03391fb881ae20747918f35d6359 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6652aa1639e16febe6d25aa9223be6fb6ec6d90a |     
   s390x     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/39aea94ba9a79306047661076e7a781a3699b701 |     
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2435271357637e5049716bb8aa0026f2bfe53e52 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/62a9cc2bcfb12842ff64443859c954a9f8f661ad | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/65f717501a6b2f2a2130c32568a7ae12dbd3c548 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1e872c2eddf85598d91e7bdbc61ccba5ef1c8aa2 | ORPH
    i686     |      host-librsvg-2.50.7       | NOK | http://autobuild.buildroot.net/results/b69ed345d517eb9bee78df892ecf2e464293bd20 |     
    i486     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/66aaad7661215de961c7a37ce8fad56de4a8fadc | ORPH
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/fb325d13f1b2f8a42970500d2cf2e3159f4869c7 |     
    i686     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/0e5d908fc17f36b056c99b094bd061da00dd6b04 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/350f069f49a0465fe2786bb7b58cf64de33d41ff |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/7b4891ffff6d0b97994aee4444b1daa56a8664cc |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/16847bd0d64b3e1b379092b3e9b8cfa083f96833 |     
    sh4a     |         lesstif-0.95.2         | NOK | http://autobuild.buildroot.net/results/0c212f692af20e3672a812e26cc997aa92029447 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/07d8c475810044060bfa35776e0b4fea83637be1 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e811ba36b2765f248131800b57d5f51a89d0d816 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/bd1d771205d71eb47cab3300c54df699cb26ec17 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/17589e22a5c44c890dddd6b3cb2ad32ee84d95c3 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/00ef9afcd99f363c462d28d29eea1688825b5ad7 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/046875b62477f7bd8ead2c9656bcae159d3ce9a8 |     
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/18fbf4680004bb93e05093a7d37a7de7fbd74af0 |     
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4b4a016bfbfccc41a60517bf7b998e0736ac07c0 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1f17ea0f37b4ccf60261e1bebb82a5616f28e1dc | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d05dfef7107cc59d278756a51a6661618c1e8860 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/200b539a8903d428fcf8fc9871a70839e93f71f8 | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b830e5a6d0d176e2060601ebce1a1c62c66db226 | ORPH
  riscv64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c22eeb59db48b108b0b60d4c8b42c3fd7c178c41 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b0fb4cca5dee87af6aadf25d1cb259026235bb59 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e3c522e6c92bb39633118067393d20cf04de7bf4 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b0a515f9209bc6f351863ce8b45f58a8c59e91cd | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a0d3168652be92badfb44495c6058f8ab52e409c | ORPH
   x86_64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/543d5eb2c7e3fd4a02e0284468809ad0d8384fce |     
  mips64el   |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/eec7460db0e3b84da77ff2cca535df4f59b4ab5b |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/097cd4f1ae0f0470277b21ac46203f499a1eccc8 |     
    or1k     |     python-pymupdf-1.21.1      | NOK | http://autobuild.buildroot.net/results/c689a385d984b87b63f3f2ff30338049774b1bf2 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7c4ff44ceef21ad229f003d0752cfbb697dc31dd |     
   sparc     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/9eb9a92871622472b8f9eb3797aadd3651fc78a4 |     
   armeb     |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/05e270c80c7f34c44207670da8abca6bc723a438 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/c12d7743485edd345852a248a7df5bd728c9c68b |     
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/50fc6a3bc9aabc9f14a471bf1f0ae03899604d81 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/15c2dd24de423eed997066c2481da1bd9d8bca43 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6dc73a06a8530d265d558de54603c23d694dd182 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/85e662aaf1671415812267452b165843baff56c1 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/339de9b49d787e8bfd3a73ef114e7b78a24af4d4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/89a2d7bc4a4a50bf3a61e284aceedbf640f6548e |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/ec8d88bd3660c203e3033c5ad9d5ccaa212e32b2 | ORPH
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/9f987a9718f035b49f30f69c99075dec65a5dd91 | ORPH
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bb4286a2d15da07eeae6eee0a544d751873b9025 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 4 
              host-pahole-1.24 | 2 
           python-numpy-1.23.5 | 2 
                        ffmpeg | 1 
               fftw-quad-3.3.8 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
               libglib2-2.72.3 | 1 
          modem-manager-1.20.4 | 1 
                     pv-1.6.20 | 1 
                speechd-0.11.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/fca9960d6a402dbb61f7a4e5d6d21b81f64a09f6 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/f3d5ca58f9b84418a62edff619c2fa1cfb75016f | ORPH
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/476df82f5e4b6a34470fd99dd7ffb468985b3f0b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/2d6cbc496859d9cb76619c4b10e3cdd3a409397f |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/06a20db91f547eecf17b483e4c1aa65b0747e0df | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0e10247b0d1c0028c39129b5e72bcca800f016db | ORPH
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5138a3d9533b9540c6749b4150830506c016094f |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c002fd174366ffda4e9bed8902bfcbe9eb4809d6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/310a56e2c312272e867fb7e1714bf75f367863ce |     
    arc      |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/c18e7632fbaf2ab841a725989440bfb5364e6e81 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/45377f3ec4f3da7901030a0dd337b64913cbb7ac | ORPH
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/5636e89cde8af51c528f513de2b427c363309ad2 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/1c5ab5fd8f50a4f5528f6c3cc4837c584fc9de65 |     
powerpc64le  |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/63eed677377a37518fdfab2903046bb0e2884cf2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8127bc6f28351ec237d0308774008afb9e605cc5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/628db1cdef561a4e881c0c79323a202d11b366a0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2635627f36c9fe9cb7a9a02ab94b819efa693626 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4542a3a7deadf16bcec3fb3fac174dc9c24a3bd3 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 3 
              dieharder-3.31.1 | 1 
                    dust-0.8.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
         gobject-introspection | 1 
                host-go-1.19.6 | 1 
               host-runc-1.1.4 | 1 
               libglib2-2.72.3 | 1 
        ltp-testsuite-20220930 | 1 
             uccp420wlan-6.9.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/6e15a319cff4177f2039d1b46e6138cd8b9a250c |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/7262af0fd32a47d550efdebb601a8c8c59bfcfbe | ORPH
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1ba3de6e2f38c01a1d4a8106977e0c8bcf97abc4 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5099fd1d4b5f300bcc5a2adb4be87f1f3fd01e6f |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/13698b37d712ffacc4c466ef8731991b1f975923 |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/5660744248d954f508e96e2fdda68aa3e8e68aa7 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a8bfa655ba6cd0976e4dd29bf53b08048b1a3651 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/084b324d7e9f6a56b1348d9bfbcde2a25490e5f1 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0f8f0d88cda42ee626d679b4920f64431ae8d788 |     
   sparc     |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/690cea366fb8aeea4c0a19cd43e3eb545cb7eccc |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/25b2dd6d8b13776b1c373bb351bf5db26a1c0cf7 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/95a216cad5bf529cfa5357dbf76ec2f9ee5b2522 |     
    arc      |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/1ec437b86012e89dfe3e44451185cb353b268ee1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
