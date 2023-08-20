Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D5DEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 13:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71270415C3;
	Sun, 20 Aug 2023 13:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71270415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvSmGBXNIP_U; Sun, 20 Aug 2023 13:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06807415DC;
	Sun, 20 Aug 2023 13:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06807415DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1701BF46D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CB9160B3B
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB9160B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9h5P2nsb_MO for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 13:28:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 537C860B0E
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 13:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537C860B0E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0263440004
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 13:28:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 13:28:36 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230820132842.6CB9160B3B@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692538117; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gETOBDeTs3d6oqMI/mdn6NS7GEmeAec+vqlNv5Z4vW8=;
 b=BpAyt/bLL5sFJdPVRK89LpQQxv6rvv8/cg4RIXK0t9e2lotiLFFO96B573RiMikLhaRVzs
 Ez1p0Sqbwwm5vH+BnCo8sy8tZkHfzkF2OPZMLl+EOv8K1xQcwIeaCFJLwQhnAEpUxGH2GG
 hVI/+vSXSkT3c/60KAM0jRJ59YD2die9uko6by5Cew4PxfKcaVD6M9jWqaBOLQZhqPZNTm
 MoFYq/PlN5YylynHxejTvkPXHuk0crsKBpzE5AIx3PsuIocTSOWaY5VfaRjIInvZTjGa40
 YQu1FZyvw+FHDEMtQnVcQhFbUrkirYUEckUuZZK0vhfLy4iCdrVXpV5ZAQ3E9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BpAyt/bL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-19
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

Autobuild statistics for 2023-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  0  |  0  |  3  |
  2023.05.x  |  3  |  3  |  0  |  6  |
    master   | 64  | 51  |  2  | 117 |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.20.7 | 7 
  gobject-introspection-1.76.1 | 3 
              host-rust-1.71.0 | 3 
                   linux-6.4.9 | 3 
                 mpg123-1.31.3 | 3 
             batman-adv-2022.3 | 2 
                  conmon-2.1.7 | 2 
         gobject-introspection | 2 
               host-qemu-8.0.3 | 2 
         host-sentry-cli-2.8.0 | 2 
               lightning-2.2.2 | 2 
               linux-pam-1.5.3 | 2 
                       unknown | 2 
                bpftool-v7.1.0 | 1 
                  check-0.15.2 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
          host-fakeroot-1.32.1 | 1 
                  kexec-2.0.26 | 1 
                 libcurl-8.2.1 | 1 
libeastl-45469730d641868ce0... | 1 
              liquid-dsp-1.5.0 | 1 
                  octave-8.2.0 | 1 
                oprofile-1.4.0 | 1 
                     php-8.2.8 | 1 
       python-stack-data-0.6.2 | 1 
                  scrypt-1.3.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/7218ff6b685f0cc38e5bd25f2d5a31b478bd4c61 |     
 aarch64_be  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/b00b392d0cdc78cdf5eef829be6d47f597b1d2b7 |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/0c5d13796cd7e5b72452dd3ec439153a62aa5d3a |     
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/42d64ec3c50201078b8826f8a8a36016900b82e0 | ORPH
    mips     |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/5291a3549094b9f872e31b4f8c3eeebadd119aa1 |     
   x86_64    |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/7f43904f5d94d06aec26b1f9e2c7f57f3f14ee56 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4f7ad1efec71f566a75939760996a8f9c0b31d60 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e9c7b8f70ae7b077042b796f9a12c2cc57af12f4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/85f6c1ea685940aa294379bee013194ad165b1e0 | ORPH
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/712c13130e0f2a710532e66f50b59915b11cd322 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/0efc300e8b225e43729a23fc4f733afded0a6ef7 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c04c2695fd4030b315dc5bba49a693ae4eccd752 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5c2b5c38b87b32287035405f4705a9a5f4e7180a |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f15e9449207a5613a7cea9570c89416a4762f6c6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2232ff38d6eb59290d7a5f414171dca91b073a76 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a480df8925b275e77e998e413e5121145e409346 | ORPH
   xtensa    |      host-fakeroot-1.32.1      | NOK | http://autobuild.buildroot.net/results/988403ae94c36021b6586bd596c478b68383910e | ORPH
    i686     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/b7cc19adc0ed64ea377858444db2cf53aa0575c2 |     
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/cc8cade41d6239b4ed60e826adf84ba056b109e2 |     
    i686     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/ab90ecfb0e32b5b6038009815833183622091ba1 |     
powerpc64le  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/f098bf4332202b08253e71060e031c13b9bdf428 |     
powerpc64le  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/53bce68d6157f50d59dddcca0a6624003ad7530f |     
   s390x     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/5959aad946bc565c3a9f52aff1658b40715daa39 |     
  aarch64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/a562d00da1bc5771a61680fed4cc4129d79457bf |     
microblazeel |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/c996248cf10119e077b79d2e63bf3939f2843bca |     
  sparc64    |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/73bb717f1de54126384a0171d23c382e4b924e47 |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/ff5fe4d260c812feea40579bd67bc6be1d14df59 |     
    i686     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/29775562bbb21a4abdf274ecb78bd19fce425b7f |     
    mips     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/fb8db87892513f8156c02046569943e037d7039a |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/54100ef4247232491e828591fcc6789f7c0a396a |     
  riscv64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/736b523cf9740c96bfa8ecc627948160f96161ab |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/c710236b25f82f1cf405e9e3ec11faec0f938426 |     
  riscv64    |         libcurl-8.2.1          | NOK | http://autobuild.buildroot.net/results/1fc65048645fd54cbb27b264232ed1ccca97972e |     
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/5a2848bc67986bed28d66cb522a7a36eebb6a3a4 | ORPH
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/3846458d1ddde72ad75c456c67a118312d2cd5fd |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/b62b5b2b659186ed218be2d8cde0f7e7c4240ab8 |     
   s390x     |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/35889e713bcb8b08ada64e335418bfe63e61312e | ORPH
   mipsel    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/1a25b19ffc3538aed5d5d8520588f2901a29049f | ORPH
powerpc64le  |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/983447d5b500fb77740aabc00f1753910e17e7e8 | ORPH
    m68k     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/631651bf4cc4a2bcce8dff668c83c628de56fd4b | ORPH
 microblaze  |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/0110571506dfb4013e876dbc6c846e99ec3b9eda | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/646d7119901380c577868fce24a16d90ae8c1b0c |     
    m68k     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/408e1f4108260af387112c95a4b9b7ca972d5567 |     
 aarch64_be  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/b466d9d671bfd8540d682bfa89870114506d9963 |     
   sh4aeb    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/551b60ea685a74595b8adb08d65dc04b5b2fe8bf |     
 aarch64_be  |          octave-8.2.0          | NOK | http://autobuild.buildroot.net/results/d6cea8cb2acb1d183d321bacb174f46836cd3f16 |     
    mips     |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/1d5a516c3c0fd76062c830dafb1d55338c4ff72c |     
   sh4aeb    |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/56c01e39a75c12c8efd56325d997b6233df28a38 |     
 aarch64_be  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/8ac1275a573cfd981d3572e3abe633b9afaf274b |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/4173c358cdd6ff09be7a3d5560286cc18a54aad1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8cf01f59690c45060ec6aec2641ed64a386d0a4 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f666f82afdd6fca6a3b2ce010aa04ecc88f925ce |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/84bcbb2f58d98e652aa9018d71bff52b3638e936 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

             batman-adv-2022.3 | 1 
                elfutils-0.186 | 1 
                glorytun-0.3.4 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/a07ece30074b5c34344eac6bf9021214ed54277c |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4446bf5985360d247b9f15f8015c35c7e4ce8a60 | ORPH
 aarch64_be  |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/427450d7aee91c279bdc8fa10f65e85fcc1cba8e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
