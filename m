Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB4EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 04:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2264782150;
	Wed, 28 Jun 2023 04:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2264782150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GfJdHzD3DOC; Wed, 28 Jun 2023 04:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C0C82153;
	Wed, 28 Jun 2023 04:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C0C82153
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 266741BF307
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 04:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F21409F4
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 04:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F21409F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBRrKkb8B2CN for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 04:45:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C37409C3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73C37409C3
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 04:45:26 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 893CE6000F
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 04:45:23 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 04:45:23 -0000
Message-Id: <20230628044528.E9F21409F4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687927523; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kuHs2AruN5hmxquNDuVBjrolAUYRiFnZtqgwWtP9rKU=;
 b=OhAshgQ9EnCF44+1sYUe2ahU8K7KTIAYTwU3pwfhFQpY9w4aCm2x05rhxqY307CWHlXix8
 6utu8Ff1cOP1SK+BNVJrXaZsAQboIUPIqn05DUM2EHhoC8W9EYrVhnhSkv6833glSHuE/0
 8866T9pwDK6dlfcbh4lGbAiHiBmhMFYg8aaLTIT6k58nivV74TO9UNvq/Q0SQVOuypQLJZ
 jcyWu6k4k8yPJEEquf8U3Dm+7VnrCkq58MmiC6ZMub0UVhI4Wp+eE9ClNZoHRvNfvxzS+F
 fqJtlRFmonEQpA81nFIX12N9e5C9Qh5ANwjU0+QtlsYy/qF0hslHI4GWM1Y4pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OhAshgQ9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-27
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

Autobuild statistics for 2023-06-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  4  |  0  | 13  |
    master   | 111 | 127 |  2  | 240 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 21
                 agentpp-4.6.0 | 7 
  gobject-introspection-1.74.0 | 7 
            host-binutils-2.38 | 5 
      python-setuptools-68.0.0 | 5 
             host-ccache-4.8.2 | 4 
               libglib2-2.76.1 | 4 
                alsa-lib-1.2.9 | 3 
               host-go-1.19.10 | 3 
                petitboot-1.13 | 3 
android-tools-4.2.2+git2013... | 2 
             batman-adv-2022.3 | 2 
         gobject-introspection | 2 
                  kexec-2.0.26 | 2 
                libglvnd-1.4.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-6.3.9 | 2 
                    ne10-1.2.1 | 2 
            quickjs-2021-03-27 | 2 
                    strace-6.3 | 2 
               syslog-ng-4.1.1 | 2 
               zxing-cpp-2.0.0 | 2 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
                     file-5.43 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                  gensio-2.5.5 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
              host-rust-1.70.0 | 1 
igh-ethercat-2e2cef61318953... | 1 
                       kmod-30 | 1 
              libgcrypt-1.10.2 | 1 
                libgeos-3.11.2 | 1 
                libkrb5-1.20.1 | 1 
        liblog4c-localtime-1.0 | 1 
                libmdbx-0.12.5 | 1 
                libselinux-3.5 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20230127 | 1 
               nfs-utils-2.6.3 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.4 | 1 
                   perl-5.36.1 | 1 
                     php-8.2.7 | 1 
                     pv-1.6.20 | 1 
                  reaver-1.6.6 | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
             stress-ng-0.15.07 | 1 
                tpm2-tss-3.1.0 | 1 
                 uclibc-1.0.43 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c01b5e44aa626f7de487c018a100e62c65d5ec38 |     
   sh4aeb    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/6057225d5586426af6b178d17a465a2fd556cc81 |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/688588d46177d1c69cd89533658736a4bd2cd0c5 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d3a6dea33c581bfad3107b25dbd5b08f37178c2f |     
   sparc     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c48d967a0762bce53b22af337c6922cefb6d5e90 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/a51d437ec091d5e9d4bd50a4874c6a3b608502ef |     
   sh4aeb    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0163d6ad1607e8cbcdc0e5877fce0cdebaaeeade |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/936cf3ae61ba9563329330c1a44f93229af5551b |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/8025b63799f64f28b1b7b89b21c4da9a76bcd8f2 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/4c77620b7ddb778d97fb0f43a21de86592e77206 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fefd584bc5f17e45f8cf7da08770bd67cc4a5acb |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7095bf2bf58922aaab5b82409fea1f4639589216 |     
  aarch64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/fa050a8bfc980fa57d95b0e30e446bdc54e6bd53 |     
    or1k     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/d2815836feb23a802e70ba86d17f3e96c8b141e3 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/15bb9828190742c7b62b658c9841c8fccd2d9068 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1f304088a53847e6537d92497ad4d1b28072179b |     
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/7c5fbe4c636456e68d339aa7cbfb2b2ade789aee | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/35015d2e3d1bf8911bdc3dd82f4694c7016fd2bf | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3d173ee776cbee1396dfc4e4d362c13f85873dd7 | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/dfca3802545a23efa70a25cfffab6f47c9ea715f |     
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/11a561d28a84ebff9405330eb0dba6993299b5c5 | ORPH
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6acd08e6c590b4c7aa04c6329363f4fa5b2c863c |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d7366739c858b27345ff80b0c017e4ecda97e1a9 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/41089b2867ad75a836cd6b1014ed896387656b87 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1be00405113a5f817cea3bfeb13f876b622a7de1 |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/c92f68ae5c0c77fdbc128fd5cb5fb25f531cdcda |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/2095f02a0edbc0e06254464f8e53456af8515544 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/697bed1d06f45660e8a789717ac6d52f5552c694 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/99887397ecece1c9cacff43c8ec836e7f12fee41 |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b90b1ecfe35604a5b05190f75a21a30da6df1ba2 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b715cb6f7ebf58876477e3472569967b5a7b9e6c | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/c3f9abdd65a5b4ccc211568d3773807306f45068 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/505481f7375c44368fc1a691e9f64fa80f935699 | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/9d13752083abb324a0fd295109c7139581dcf8c4 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/72ba4717744b9f1a696fcdbcfcb60d8708ea6298 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f03646e137e3628b8b2d59bd30e7c868951c7629 | ORPH
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/ac3da053a9e141d7e66d2a17dfb6c06dbe540e1b |     
  aarch64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/4ef08f00f3b5e3fc9912555a97f3fa1cf609affb |     
   s390x     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/0c39f7d35dfc990b9f55dabb28b0273ca4eab8a8 |     
   s390x     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/f5af5a641f3acf985a5111f1da5c7a2d511fef10 |     
  sparc64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a2be02aa44fd787d1f5a7ed9d3235fa77e9e5ca4 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/2c80712fc9b6ad0b50e8d34c45a5a9cf9b6d1d3e |     
  mips64el   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/d9f069a0d214b338ede2fa1962e32953f4ac6419 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/626dbab7c346a4c374ddde372dca21b5520bc081 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/f00327fb1d8062de576e2798ff170668b0302418 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c5827d1bdb69fb79302a3f182058e192bbe4ee36 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5a291aef3c345607c500efa632003e2ecfa19b0a |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/589570c3aed50619751c7948f05e8b0c956528a8 |     
  aarch64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/1828eb63daed7cd3105f89fe4120f87a61bc0356 |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/22d7529ca31a8d6356bc02ce7a97cdea8165e712 |     
    arm      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/258eb6eabf39373d3a6093d31aa7a739f46d65b7 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/02e263c3121936bd1f344e068c165c119dc1d5ac |     
  powerpc    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/abcbe352a78fe0e5f5f36d9bda4061d5901b2e3a |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/bb15eead908956eb48af40056f8f345b55b5dd7d |     
 aarch64_be  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e51b1f830ea99a2981a389aed6f7a5a7ad050459 |     
  sparc64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5eda768f84c252d3a48f245ae8a4287ff340e652 |     
  sparc64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/def43d1faa673f2723b6a623d669fc1e0ae01983 |     
   xtensa    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/6a1dea4343b52674a5f9a02868e5dab45b5fdbd3 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/954a4398b8b3d6cc9d9e69f3e7c7fc19fce7cf26 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4b0d97c6fe45e5697ef0b350c83e848a9515c535 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7570f2877d3e7965218dd0db2a6b66ad4b300ccb |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/672e321279ff66950c302e4efade588242ba2823 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3644fd37bb0c211586e34c7c7dba3a545e2440c8 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/165928cbfc6e632a5051719294249a6e487e9794 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c654db3ac9831af0e0515067b8592aed5bfa443e |     
   sh4eb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/23476472ea4bc90610a1bd9569989d2647b63dff | ORPH
   x86_64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/13a6b959443f5eb79a8b69d26f9f02f33aa8e42d | ORPH
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/0e72731f4bbfac0511508f08146e4f7b5d895048 | ORPH
   arceb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/1f1f60cb1a6130bdbb110f12cccbab921d3bfce8 | ORPH
   arceb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/160e9476fc01005b74fe920856048bbe13d5efe1 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/af518871447751713e29a39dfc62d20651dd7280 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/69f8d7f89e5b436ca5f23c8daee99b0af427da30 |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/2fe67b4c304ac1fe9042d564890c19d9e892a214 |     
 powerpc64   |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/368b0867fa58ad7549e93213051c2cbd32059aa0 |     
   x86_64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/add213c1192588d599fc9b18eb4502877215b70d |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/4efb0b16df82bfe555ce404512cd9cccccb24b7d |     
    arm      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/3e4b64c09106e56330586a498976868211f9143c |     
 aarch64_be  |            kmod-30             | NOK | http://autobuild.buildroot.net/results/c5f13490ed053ea83d334508b2dd478728434e35 |     
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/76243c90e1de003c14d831923c905bddef76236f | ORPH
    or1k     |         libgeos-3.11.2         | NOK | http://autobuild.buildroot.net/results/a675e7cea55230d4dfc8664ec1f59a888e9438ea |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/edeb8d576ba839e6540458f9d9c044e0fb9c2931 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d26b5c1009dd2a66eaded2c46ac9f9fe535d686b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/af73f22837bc9c9760a1ff321e27eca06f1eab41 |     
  mips64el   |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bbb67517710df7a0bc0cd8c4ea5cade75b21ee70 |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/ba911ccca5762324af8c2aa1021dc8f0362cfd7d | ORPH
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/da10d0558aea61cb0195201f6f5d5081e57fccc0 | ORPH
    arm      |         libkrb5-1.20.1         | NOK | http://autobuild.buildroot.net/results/a430dd64a6fadd3bec20fa0cf0bfeea4e1626178 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/e0c4bfdfcddcc4945e5feeb2e9deb64a6060c32b |     
    i686     |         libmdbx-0.12.5         | NOK | http://autobuild.buildroot.net/results/5e99be7c7895d34d89fe06f81fe50b0a52d36a4f |     
    or1k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/ce2fa868a9908d9b11c394f3c2a60a5b363b0fc6 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ef70a3f9c1b7ad394a15e5098cd0fea65b809a3d | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/886cfcdafa06020ddd48ebf04dd145ba5cfc0f3d | ORPH
  mips64el   |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/2455c4fb3d6ff76a8c6ac52f6f4901a7f1ad2946 | ORPH
  powerpc    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/aadfc4f1b5ac0596a2b505cb3cd29dbfab8f89b6 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/bf6d07426cbfa4fbe8629cc93125983252b57f37 |     
 powerpc64   |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/fea2fe20795b1794eb22dade8e4ca5093fbd584c |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/f81a7df0788366f532a40dbd91743952adf1eee6 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/320b3fce806282c481b7da64763c4c656e270f41 |     
   mips64    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/a853e8968f4732faecc0188b4c595004b615f53b |     
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/aa752e0be6103c25eaf1e3abfb741a36ff7e2d0a | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d118619dc2d2d498cde8eb649e0ae56757eaa16e | ORPH
 powerpc64   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/bfc62a9ca6435cbb3abd16f5ac7afa271a71cb30 | ORPH
   sparc     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/73bfd79d3b31ce308ce532f6e9f425ba9e2dfc16 |     
powerpc64le  |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/d336147f9d096f1e0d12857c44345138d8774ae5 |     
powerpc64le  |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/a726a2c782abb35e097de30ccea827f5485ed4f4 |     
    mips     |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/5b7ef7c08d5558c055ed0e0ac9adb5af07823358 |     
   sh4aeb    |           php-8.2.7            | NOK | http://autobuild.buildroot.net/results/6bb530b6ea847e27928d1f9e04b58cf13275bbe5 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/282b6d1d3d0d8f7dd568968dd16256708f9c1169 | ORPH
  sparc64    |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/7f217888867f4b47ef98cdf9b9aa475862751fa8 |     
microblazeel |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/dc1c5c12e3d5914ebd44ad60e23066b34c2d33e7 |     
  mips64el   |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/e5309f754e304d48f6bbcdaae2e7b4b5fd7e746c |     
powerpc64le  |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/4e472d7a5c9c392f7aeb61fa6354c7580739948f |     
  powerpc    |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/87062ab9f4ad8fb995d3491bf347323c48c4e45c |     
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/00641a2262b17b93f3f704141c3907a1442c4e35 |     
    i686     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f226053451e24a72c9efa5b27b0649f280881a5f |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/fa8b5e988a7e4725f72412a9cdb644b70395c8bf |     
   xtensa    | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/caf0ed3f81447abc9586aa003b16726bb333885e |     
   mipsel    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/3e677032159e25314e8b4f5adc6c3df483317270 |     
   mips64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/361d8c6ad2473fa616256be3803a227ce839c5c0 |     
    i586     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/11a3e9b67054dc7959cf5c65823104f3ae9b6a51 |     
 microblaze  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/1b06f22facac38107b37a238c8f3a2a1e597d141 |     
   x86_64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/8f765e90259819804c023622e02f7847adefe678 |     
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/48d36eb9b97b9edc67e74197df67f33cdb2ac122 | ORPH
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/1befb43b4676f7fcdf9f9ccc2f9f549db4ed5470 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/82c049e2acfa2aac8359646e3b88f382be55754c |     
   xtensa    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e733574823c64b88d15cce9fd28f50b2d552d453 |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/fd4c226ab280675c87cbfdc71e6e6d51435a03c3 | ORPH
    mips     |        zxing-cpp-2.0.0         | NOK | http://autobuild.buildroot.net/results/7760f41cc0a5b278b706d7aa901eec4c8c470d92 |     
    or1k     |        zxing-cpp-2.0.0         | NOK | http://autobuild.buildroot.net/results/3da6b3c6eedbf61a709d50095e4f68e4a1a2e8a9 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               host-go-1.19.10 | 1 
                  linux-6.1.32 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1a27874dd64d8e0391871c83e7da23dd1e3c4f66 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8b9047dcf9d892e846f697e92e6dfb2502098e8a |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/262495cbab2acab9d477ae1c5fd2783578eb9844 |     
   armeb     |          linux-6.1.32          | NOK | http://autobuild.buildroot.net/results/598ea4a24a66792e8fab1766d1e348937b6a2da9 | ORPH


Gitlab CI results for 2023-06-27
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
