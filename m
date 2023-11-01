Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3767C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 06:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4725B4B59B;
	Wed,  1 Nov 2023 06:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4725B4B59B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrEijv8x-gIj; Wed,  1 Nov 2023 06:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3704BEF2;
	Wed,  1 Nov 2023 06:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3704BEF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22E661BF28C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 06:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC8914C0CC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 06:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8914C0CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQghmI21kxah for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 06:50:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEB7242D15
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 06:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB7242D15
Received: by mail.gandi.net (Postfix) with ESMTPSA id B960340002
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 06:50:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 01 Nov 2023 06:50:51 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231101065059.CC8914C0CC@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698821451; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bLTLBhttuYrzHUbqB4E/HZWR7QSrKw29XF3WCJM/ylo=;
 b=ByZNRP/YURgmHfFX8uBRdYRGjZvBlRVEA1jbFGXX4lmijOAByAW1ql3MnxTl+LSUj8YxUP
 pyAYqjA7yv2CoowNqk0Qou6dC6qyQm3QgU8Yyy7P6Yeu4w97MGL4f7LZWkUOMu4nJuw4+D
 Y+Bj9RY6UypAzd6kDbzgP2k/1TfMByFcR4odHxd7LwWXdC1Nqn0hEDtGtxAyPA47ytQkoK
 EO2+xw+deZqzJ0ScrKo3sDZynstEoqmkwuZeqyiuYSRUk5GPXy0yFPDfEtEf21UVJMHZ3O
 TCTGdUcYkuoUxE5qJHAFlXGZhX4i8vUyHHP6pXAwL/Jkfe5gxbsYtnVdDIF8BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ByZNRP/Y
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-31
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

Autobuild statistics for 2023-10-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  |  8  |  0  | 21  |
  2023.08.x  | 12  |  9  |  0  | 21  |
    master   | 58  | 65  |  2  | 125 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 9 
                elfutils-0.189 | 4 
glibc-2.38-27-g750a45a78390... | 4 
                       unknown | 4 
               apcupsd-3.14.14 | 3 
                   bird-2.0.12 | 3 
              libarchive-3.7.2 | 3 
                flashrom-1.3.0 | 2 
         gobject-introspection | 2 
google-breakpad-c85eb4a59b6... | 2 
                   linux-6.5.9 | 2 
                  monit-5.33.0 | 2 
                    pppd-2.5.0 | 2 
                xenomai-3.0.10 | 2 
                  botan-2.19.3 | 1 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  conmon-2.1.8 | 1 
              containerd-1.7.7 | 1 
             flare-engine-1.14 | 1 
fs/f2fs/f2fs.mk:64: /home/t... | 1 
              gcc-final-12.3.0 | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-11.4.0 | 1 
                host-go-1.21.3 | 1 
                libselinux-3.5 | 1 
               libsigsegv-2.14 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.3 | 1 
                   linux-tools | 1 
make: *** Waiting for unfin... | 1 
              memcached-1.6.21 | 1 
                  motion-4.5.1 | 1 
           python-orjson-3.9.2 | 1 
                   redis-7.2.2 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                     z3-4.12.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0b93c05837a5b0f7f9f6a0fd7ed15690b1893b82 |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/46a64e5a029cb12ef8d7dd1f856b6e11ce4e36e8 |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c6ba91fced2be1fe97fa18f39ed3016829d9e076 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/411697d094d7f77d6559c5d00d5a1a6ba28a1327 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/27122f83aabd1bbef791e57fbc6398ce17b24955 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/864fec91fd9381fdd38b5ef6bbadb05af74d942a |     
    arm      |          botan-2.19.3          | NOK | http://autobuild.buildroot.net/results/0fa615464894eeae8c56dd5fba6b80bb13ddf531 | ORPH
   s390x     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9ed15c4afdb940634e3044320741489462a53c4b |     
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3bf13be52c3d4604b2c300a083958131247889bc | ORPH
   armeb     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/cbfa2f3a585b7feecd902137bc589a1ec15cbefe |     
    arm      |        containerd-1.7.7        | NOK | http://autobuild.buildroot.net/results/2b1ce7d40922bb0b7aa2c76b411875c2b996c863 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f7de653b6ee6de65e8aa768766f58388731a7916 | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0196c38c345c47f1ea2c8323fe1badf5cb9523ff | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/64189670c8b9521d658ef3d88271fb669ce886c8 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/066f1bf78750be5e04d7f80970c448fe61be7082 | ORPH
  mips64el   |       flare-engine-1.14        | NOK | http://autobuild.buildroot.net/results/54d95b29eabd2584ad6a6bc4235709d4c1a761a5 |     
  sparc64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/d8fc76e8c283243aab00f81de1ac14a605354cf5 |     
  riscv32    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/cd797c83d71f374f21cfae9eab802e14f7b57b54 |     
  aarch64    | fs/f2fs/f2fs.mk:64: /home/t... | NOK | http://autobuild.buildroot.net/results/8c6d508edc60ab4cb81430f169e6964faf202bb3 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/3213878a4f624191cd7c9bafdb48579a6ebca984 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/94717f7418dfc5b62608886d85b5188350f863c9 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/29a7fc8a819c3f80af2bb77f3f8dc3f0d4c91c9d |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/43b5a3b949c87b815ac96af2344ad2b12b8a9cf3 |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a905a84d70485062838e6f26adb50703066dc000 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/71ef9d442a03cbb8db4f1b34f5522346f1bac581 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/aaac5da9391f5f2ca063c8cf35324b3764c7fb3e |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7f174ed4d59388ad8adb1f5d9f08b48e89f11f87 | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e8c3df787337620ac2f40b38c1d0da7cb16caa70 |     
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/57e210349435666bcbead2c672fce0649807b479 |     
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/3ea6b8fb2c00d3b3ff720b8141269fb02eaca1a8 |     
  aarch64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/7a42faf00f37d5075d32921f10b731897785caab |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a97618c6b43627b3c06ac4b3f05ab513968ecddc |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6bb4472ce686b4d2122df64a9f24f9986f3d8ae9 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/571400b46c349ef78cff7df171a235939a85f968 |     
    mips     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/5b6ffdd7b59ae64037623d2cddd4c3616cce2e48 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/a5bc681817bb042e0301c36a1b7255bcb21e5bb1 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/165814f82d35023a8b1fcd540ea45e46419ef57a | ORPH
    i586     |          linux-6.5.9           | NOK | http://autobuild.buildroot.net/results/66fe208e96519757cb0b78b6207e7bdfc8778ebd | ORPH
   armeb     |          linux-6.5.9           | NOK | http://autobuild.buildroot.net/results/36913c56f171f4acc76c81bd572c00cd0242fc74 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/58ec6dd783715ad715b0d83599ce61f1cceb713e | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8a6902d7708d727bbb304176898491236e21920c | ORPH
   x86_64    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/0b4af51a082e2f9a7db29e7ffeb4528af4efe3a8 |     
   arceb     |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/0a5710fe00cf8baa0e5f15cfaa8acd23bbc23a81 | ORPH
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/f4ca85ad547444ed840c2e76931dc45f3d4517eb |     
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/8fa5cd090a15a52d1e99eff0376d89389da2d8d8 |     
 aarch64_be  |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/1698bf7f1dc1d3771390e2ed4aeb1c6cf7671003 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/48cc348feb0ad5cf56be155d1ee9f88534903c95 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0556d23b1b3808f88528fc0894c438a71ed2badf |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/27a7557640fcd5e61ca0ae9f470a1d2d190c6658 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c3367409f3d4a470e214a5a4c705e38435691109 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/afee257592563105c48ebdd3338cd22e851fcef5 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0ed599dae8e7e78128aef10141c9a2b503826299 |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c8275bf6c05591a0a67f0a95d07da2054753048a |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/06187f59070b8e6c25d748395851366bdb0dc506 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/76065ed0bf2b2f04b3ae238f716d0bb1ff078950 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/65d8847dbf0134c4ebe3f8cf886babbb0bcd6f38 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/5a2520b3d3c23a5787d3989eb7d89f0a670aa15f |     
    mips     |      python-orjson-3.9.2       | NOK | http://autobuild.buildroot.net/results/79da1bc8b2afde908e19181250b6e9209c892496 |     
powerpc64le  |          redis-7.2.2           | NOK | http://autobuild.buildroot.net/results/e5747674d52b065203a0442f7cab13e8be5f426b |     
   mipsel    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/165829409eaed09b10dafc4d2916eca704175cdf |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/fac9193504f33788bc7455a2b2e76c68a8120202 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/03a7fc4a8c0eafd5424d99780bbe310ffc5a26eb |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/422c365e04f4efe73aabdea4dcd852579b2dc051 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d9990c785ae3148aea483d6acd4d22b6036d9999 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2d8dbf456eddbed073555bd147eba1121983a287 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/84201e416ca90bdea5b4b0f17fd5ca2b6e9f6fe5 |     
  sparc64    |           z3-4.12.2            | NOK | http://autobuild.buildroot.net/results/4b85330ba79ec9cd29b1a438881de58f76fbe6ef |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.20.10 | 3 
  gobject-introspection-1.72.0 | 1 
                  ntp-4.2.8p15 | 1 
                    php-8.2.12 | 1 
                      tar-1.35 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/08177ea5ead779b940da0ca2433ecd5ffec4ef68 | ORPH
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/06262268215e879b4cdd7db8317ae58002128672 |     
   s390x     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/ea84c45971844739e69f945be3dad92b3eeaae27 |     
powerpc64le  |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/719126641ddb56fd7cbf973eb04074ab5767772a |     
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/536aaa26a2ca0f4e7d1d99c3c30ce9fa08f52a7e |     
    sh4      |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/2908e7271f209de511edeff43e31b3bb862f02b8 |     
  powerpc    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/7f2f88890e10d41c3d9775529260ecbe0eadfd73 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4dc47c9fa7b7b90f484470921a51a1dae72f63f4 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

             util-linux-2.39.1 | 2 
                   bird-2.0.12 | 1 
                 coreutils-9.3 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.71.1 | 1 
                 uclibc-1.0.44 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/69a15fc0a687ffdaa55258a5249ee200dc5d8b5f |     
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/13672ead8b66ab67729617379a662297fb01ece2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/464d36a011f3893ab3b17d3ebd54df4c60750340 | ORPH
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5b4c38cda8efbad8162b60209d4ac7209355ea7d |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/341c00f2faf40b24c23bd34c28b1a3e7e339aee0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/02a47238156bba983f4c7d8f480c10e9796745fc |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/20871c23477076f71304237ef75f80e257eb2159 | ORPH
   mipsel    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/f8231059a9a0f350c33bbc766c4b660508af714e | ORPH
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c08b8246777408da956b4023fb3d38116474d595 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
