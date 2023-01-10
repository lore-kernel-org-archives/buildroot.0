Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43739C54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 06:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1582408C2;
	Tue, 10 Jan 2023 06:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1582408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2YcyV4PyLxu; Tue, 10 Jan 2023 06:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8BC408C4;
	Tue, 10 Jan 2023 06:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8BC408C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5231BF263
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 06:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E7F408C4
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 06:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E7F408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaG5cuEWnC-l for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 06:41:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73F4408C2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73F4408C2
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 06:41:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E851DFF803
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 06:41:21 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 06:41:21 -0000
Message-Id: <20230110064128.E6E7F408C4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673332882; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hZRqv13BxPfnUa2+NbFOtPF+SYoOtBQzxCrq3dtr3t8=;
 b=DHW3DxzuRWw8trL00C2CaIHkWa1F9FnqZaNjXbgloEWHtIc6Zp0usiBsdwPpI73uv5JePk
 /wdBTUTPlZogmD2xFvMrnq4srZfeEU6xzg0SpUcSKej67KLdV39cLtsjK2ncLe3l8tGByd
 3tGIGgCKGyYXe6vXaiLkLwG+2Y2MCP3m8IeDU5hSQtkuiYONYry5bSTSrJpHIi9TD/Z7bx
 Ns1NwnQafMs36zt6nh6h7oe6mfS8axQNYelf6RX9HZn5+gyvp2/7LwiRkx8y+FzrozLEgS
 X5pe5ar4Merx0pL//NP5bxzz1JxE1CLHIcd2AtHbaB4TtOdpqobpRKFbokoFIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DHW3Dxzu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-09
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

Autobuild statistics for 2023-01-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  0  |  0  |  3  |
  2022.11.x  | 12  | 13  |  0  | 25  |
    master   | 151 | 308 |  1  | 460 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 27
                   bash-5.2.15 | 24
                    fwup-1.9.1 | 22
                    dust-0.8.1 | 15
         host-sentry-cli-2.8.0 | 13
                    opkg-0.4.5 | 11
           janus-gateway-1.1.1 | 8 
                   linux-6.1.2 | 8 
                host-go-1.19.4 | 7 
              hyperfine-1.14.0 | 7 
    python-cryptography-38.0.4 | 7 
                     xz-5.2.10 | 7 
                    pixz-1.0.7 | 6 
                    bat-0.19.0 | 5 
            host-binutils-2.38 | 5 
              host-rust-1.66.0 | 5 
                    norm-1.5.8 | 5 
           python-bcrypt-4.0.1 | 5 
                  jack2-1.9.21 | 4 
               libglib2-2.72.3 | 4 
  binutils-arc-2020.09-release | 3 
             dahdi-linux-3.2.0 | 3 
                   ethtool-6.1 | 3 
  gobject-introspection-1.72.0 | 3 
host-spirv-llvm-translator-... | 3 
                    mpv-0.33.1 | 3 
                  zabbix-5.4.9 | 3 
                    crun-1.7.2 | 2 
                 dmalloc-5.6.5 | 2 
                elfutils-0.186 | 2 
                     gmp-6.2.1 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
              host-pahole-1.24 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.46 | 2 
              libostree-2022.7 | 2 
             lirc-tools-0.10.2 | 2 
          modem-manager-1.20.2 | 2 
                    musl-1.2.3 | 2 
                 nerdctl-1.0.0 | 2 
                  ntp-4.2.8p15 | 2 
            ocf-linux-20171122 | 2 
              open62541-v1.3.4 | 2 
   openvmtools-11.3.5-18557794 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                   bird-2.0.11 | 1 
                 coreutils-9.1 | 1 
                 fdk-aac-2.0.2 | 1 
                    flac-1.4.2 | 1 
                     frr-8.3.1 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
                   gqrx-2.14.4 | 1 
                   gvfs-1.48.1 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-10.4.0 | 1 
               ipmitool-1_8_19 | 1 
               libcap-ng-0.8.3 | 1 
libdill-32d0e8b733416208e04... | 1 
        liblog4c-localtime-1.0 | 1 
                  libnfc-1.8.0 | 1 
                   libnss-3.87 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.10.3 | 1 
               lpc32xxcdl-2.11 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                  lvm2-2.03.14 | 1 
                  matio-1.5.23 | 1 
                  mender-3.4.0 | 1 
             netsniff-ng-0.6.8 | 1 
                nodejs-16.18.1 | 1 
               openblas-0.3.21 | 1 
                   perl-5.34.1 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.5 | 1 
           python-pyicu-2.10.2 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
              rsyslog-8.2204.1 | 1 
              sigrok-cli-0.7.2 | 1 
              skalibs-2.12.0.1 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                xenomai-3.0.10 | 1 
                  xerces-3.2.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/db4cf6d11ad8e61ff7797eb31584ded51d9f1ae2 |     
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/95e36cf5d5f7a2337c9c3b316c712233509a6fb2 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/41e56f2cca1a6b4c8815966d89d476e1774e2007 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3c19ca46a8dda5fd99f594f80d9495ed4a5a6f29 | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8dc86ab32fe69d5df1eaeeba7b2793ad01f66b63 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0a20312ca9c5bf2f20eecb1c7371cd63e00bfb77 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0ce4adb880109265dc5abecf7b5d8e799825c375 | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e74b521ab9e5d0356c2dc93eaeb02aa3d0389dda | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a411a00afa59fd70fb26293d4db1831943be85db | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f1d9c7578009526a7d4bdd96326afded8845fea7 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6071aa7c6a602fbe145df98a06cf3d15aa328672 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7a1b2cd6403e9e0713e39c410cb343c36e965c3d | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/55736be34369cea66747393adf7a4ada677b63ae | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/82239f6ee0c969aace9d3ce979151eb602537302 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f56b1da10a40732a3a39800b072aa2a3e4a7aa1d | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8142bb7e550859ace3c8c1f4354243667a61e145 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1f1e452bdb3fe5c2ae5a772c1ddf6f308e500764 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4eb67f602ec1911fa73d658149aceea8de461153 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4b5f889bad96fbd48562933112653d0d1d97c33f | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/060eba22a050022bcf604ca73c5bb78487b14bb1 | ORPH
    i586     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/02a3da2138a2a8b75579a67ca0999f84099d50f9 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9ee8b64ad45281384e482f4f35b094cd4e219c12 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/35ae235d5bdd313dcbf821c70ae3887a76f886b1 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/979f608a1fbba6ef424dfaba8ebf07e25595d312 | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9f15adc0e7c6066ff1d496f65031713faafe4fcc | ORPH
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f6def840fd8dd37643d46707864a40e5588528fe |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7a561239fd92cd5d19b78652e00834eea3bbfb0b |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/beac7674bbc9fd2f8777b5861f65afee9c485753 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/0d6e59c4d83b57bff9fef5d36b0873601220faf5 |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8fd35d0854f2f2695803d907691f982766280351 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/7fe3d41fa2e26b153f8ea620ae72a43e2acba069 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/1805b598e79488d2b4e5d512f9f7c45693e2a8e0 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/26f746535e40676eb00440027255e3fa2e4b3266 |     
   mips64    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/7b0b330cae7d0122c29024c97c6ceeb1a76a7169 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/4aba050be2b7a05fb640794211fe9e559642677c | ORPH
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/8e4211658804e8506e9db0addd5d6c9cbf5484b4 |     
 microblaze  |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/33e77e0a091dc779b52db5f5faba93ed81ead523 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/73e2f48c367b8aabf693c52303edde61d853d1f9 |     
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/69fecd64630be223c3d41f68ebdeed10611121fa |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/0111a08b0393281bb2bc14ca9bd77a7a1487c58f |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3af566c2dc1f73d52beddb84dede2cf96825698c | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/de6ba9c85aa88f808ef22132c32f8d54ba9faa63 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/42d4edf9a82f8d85bf18e4c98a4100fe69ee7157 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2e467ce958b4c4b8cc5997b23d4aab7951fa33d9 | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/39b717d2ae5db3dd457addebd304165369474745 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d955f543d8cb9fb3aa28bcbc78ff84e9c8c99901 | ORPH
    arm      |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e64200465801c4983899d92f52bb2581b11a6820 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/7928ad940f6650cc456a1a96be3f3ca9f719f8e6 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/aa50b889936edf2f3ce88823b18a76d232c6390c | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2058234b925acf0f46a8aa46f487d6f3498a79ef | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/a7ffaa0382ec2a89ff9a43b5e96693bee0824faa | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/59ad121696ff83981cca2f2e03e567a113ec5556 | ORPH
    i686     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d1ec1ebbde115628a4b8b9099544347242a97c1c | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/94724a822376c88bb0bced8577edf87e1eab0d88 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c0e03d355ed7dcf78f44143c8ca964b56de3d735 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/529f0c35a9d5957fc902fef6d3dda132766a6f4f | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ed1059b332491cecbe7cb2fb44b288b59853d772 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b4458b81f8b40a60d65357da6e3d2d74cb4383ea | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/653e4a3061f4f3c8eef4d19e0e79c8f3d6fd4e70 | ORPH
    or1k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/214db7e369c8842c4413dd8f9f8643342a98ee3c |     
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/ba822c901354a4aa2604ac9e61d1604d92d31f57 |     
powerpc64le  |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/8aeb4a39faf2ad5b3e855af02fc9ba572d933a59 |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/56e09f31332851ce8279e97916bd6c925a19f715 |     
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/5957f58b6154b7c3a5fbe963d9e49d16842debc1 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/0d9d59b18ade4fe5f46a378b5a11370c3e309f54 |     
   mips64    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/6ffff2ccd0a25038cc338e28fe1788202aa09140 |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/5eca3f50d16a0f5327713e87364289114ea9c66a |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/167da6060a4a7c57683bcfabad8e795a542ba5bd |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b4635ed9e63f79a5a3d2e804b80d32245ef9a3cc |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/543027f97d42f3bdc74a57ca808f0d47b4d07695 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7197d1edaaf73d54a5632ab0359cb5ed4116c9fe |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/535a13ecb16e7ea2d31c5a0385a423a577261cad |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/86b69f2e8ed5a5b1379ff842eb11fea65492a246 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/713524c145ad79ff3c145f3ee91b6d4c6d63930e |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c9a060d4618f2411fe44f2bbf5e1e6c44baf47f1 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/af2c9da96071d54e1185d78bf59f9ff567cba196 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5b2cff75a9b237e888baa79a036aff88e403edd4 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/236bcc1729c135885aef7642cc3c9fdafd562492 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d004e929c70d09dbbdf15a02821f5d96d470a383 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c075431b05b5912a0c901bafbe9af87761b9dc71 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/71a85529aa5a142198d21f259fa9a508658b9a2a |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/58b68ea055ae101d968e97c45b7ef485d3217c27 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7e8b613c6a86f3c52e30825cd1713618c4bd3b05 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/83ba8230103915d42a59f5731fccec46d8be06d0 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9b81a76c0e5f0c92f6d66dce9d2ac65bb18c09ca |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/82c803d382f63778a54b76234dfcf35ab8fdad73 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f59d158e4a213fe2724cdf946ac749666dfc2000 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7f149eb4f0dfa9dd094954b8ac830db7c02022f5 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d1a3b3178dc7145f6f8ab41cf0b14aee125e86b2 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0cd587a6a59c510e303d8b0b83b7953c153095e3 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4340cd22e06ee1a3dc272fe750214e5261e9ec07 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9d287d9fd6d9b7ae5c1529491f5cbbbbe87e384e |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/05ea59c55482e1de188df3b01ddf3d781409e56c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1e9eebe988d43952c2eddecf82d61b0b0d6fe9fa |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/3184cd1c87486466e61badab061ece303aba4a2c | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/97c1f74b20c0091ffbf17efda031349b41231b52 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/11d6605ae1b527255cf796c04f95a1878c5d8055 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/393a62feef0a7dd3da3005480137e872204a42c1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/81165d05f12218f3ee35330d0a8504cb4c5563ba | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/22253f0694013dcbbf34e4a8e20b4a65a3d43d32 | ORPH
    m68k     |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/fc88bfb662292376cfdb45637d514a46169222af |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/8762424cdbc9f740fabc2055e3bf5a51514a4eea |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/059f4188fdd6b5cc8b28323afeb0f65d4c342ac5 |     
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/de033d2d082f9a5e306ad0036a4104e9b4891f93 | ORPH
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/591bd6de2227bc1b7a4b75a257a5c3c40668d1d9 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/44db0de4bf970b39bb61f62a56dd4d80a30aa7d3 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8528d0ba7b1582120e9410c81aa95375dde1130e |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b18b747c6cd71442d7685ac2371e50e0c1f6cf8d |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4d859ce15cbbb2be27a75d1dce383aafc72a9c0 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3e8de8499a63b5c3c888a777b000fdaf73a12131 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0f30cb8373a4924c138d3f45c8b0c7e8cf572e6c |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2b4ef1ddfcf5f50197ca0d73e5e41b64e8fbb69a |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/633a7a433f9eb3384af47ef6ec90819ec27d96d6 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/84abeb92aae2d59bfc0d91aee7c5a99bb919372e |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/aeb634dade001a39090fa1ba5f90582ccab5566d |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8398c5ba92fdd633fa1f59b3ada39c7fa438da2e |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/751087e1043df4c64bf3dc9f41b24e54bf70b364 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ccb0cd1e6e5b58195c5a11b00b72e38d094fd9ba |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3a2bd0a8b792d728adcc5feb899112824215ef5c |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b6e097bd11f15649e19f0de82647ea903e339c4d |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f4f46065c42d039a8eab179fd67976ab142a1e59 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5bbbdaea696fb71b33ff6fe7567e0b2b1dede48c |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dd7db8c9f57d4c660eb51341fa5c6794b8ab210a |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bbd789952229f58a3e7e254e20ca0b65d039d459 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1ae6d87d59cdf76af74351b3dfd4a63c4a697ab8 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/86fc89a7f312c9f574b2965536e41cab2f3612a6 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/45c4f7f158a010b3b852767b46406914337f0fa6 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/01439d84f7b7ddedf444a84e93dabbaea78f7493 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/81288beaf5c9aba08ce20b3c90ef962b178f6e52 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/72b21674f88f89096ac7f26ae5df4d173d0f6706 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/62c67dd93a4f037b3d05d70324ceb7eb93828263 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0d787bc7c2cc1c6a5bad4f2cf03b209315a8481f |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bf50f12299f224d2196eb386cdb4351c517843d1 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b3ee834c007bdccde7f5f647b7d99f3e1707383d |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0390adc8b59e33b7946055acdb14bcf5ad692a4b |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f69ec36b7b8dc4c9d3d0ad3ee2c3c645d0fb0c99 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/102f9212bf07de58a8bd665c1e0dfb1080531fe7 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/528a63164e279ffefd2a235d8c373002de48253a |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/661419cff8b8b0219b82b57d63c3de91481d96a2 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ccbef66b3b7aad70f5894cb60b40152aac4d3591 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ad7de9414e6d49776e28247e0dc81db8175c414f |     
    m68k     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/86b4357c75049dcb4f7f250bbae185a4994f859f |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/1f246f16ab94c1bb4f12bf807e14d14fb88d46c3 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/b375a7b473d3d55f080ac6a99032f451bc6a17a0 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/82c7d4bc5fc5fa96b3698edd836ff161a9074a3c |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/4161e7c1f0eb491d8cf58a26c7d2c7bf97368144 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/d5029331ab1a6322d9eb71d68238dde369f231ae |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f60727f4200962b0b0d5bdd785e9a1c31c16c1ef |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/464dd3d251d36177c84090355eb9628492e82de0 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ad45e1391b03eef11229b64b713760a974f2bf99 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/21099217801d003a9cc63088a51d4e3cd2b8dd38 |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/da9fd97826a9d528deeda17248311559e8d13220 |     
   s390x     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/77053b20bda9f631422a74ae5173ac2fe05467e6 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/e79a6ff698553d97db73c0e226972cd3ffec4388 |     
    mips     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/964363ac891f96f4d9abf54539b23ba228cab009 |     
   armeb     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/e04815af13e46ab8ad82a2595ec62c748b345f72 |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a1fa1b06478eda8585013bac0ada5f162f87417b |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6b21ad5a5459748a45ec23e5d781c0b919d5894b |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f7569ca6087753de5935449e76ee02adab995e88 |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e3672076dab1fdc7951b8c8480dfad8200c821ef |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/aeb122a06f69744bc009dbac778ac830fabe6a97 |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b4a83cb85162620edb63e79a8b136c7f07be1ca2 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d695140466a8d7554f81f83fe670ed74802abce9 |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4e53f988ac871854678c144a7bd8902aedaee5fd |     
   sh4eb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/64995c7ca97bafbfaaaa151738956f05d9341d24 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e2d48f6bfc13c1fc39ed2b7f213dcbec9075bac3 |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6df455ab74672c20261bb2e64405e87ccfa4a7a4 |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/cc49471a73b23a20da78717a37a294c6bf0f597e |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b142721029acf63856116a2b5ca837935bc0f4be |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/79e410bc4504f7d3c2afd7a63d63aeaf62f46c64 | ORPH
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0348ec71eb269284697b1d403a56b996b1f09a1c | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fce2981c01fe17f7d630f0141ef22729ec9485d7 | ORPH
   x86_64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/2450d11c37977a1faf0cc6366b925bd902c920db | ORPH
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/3277d8c0cf083ca9d79658b3ed10326997627946 | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/f6677fbc46d18b80f9938a7066908f37570c0354 | ORPH
   mips64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/f968be895be9ca98b314fdd688ef8d3bdf4e5dfb | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d5a4a79adc36e9d28de6bcfffef5958b06d7819a | ORPH
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/0093e6af53ef6c6c7878176b6127fe42251c2851 | ORPH
powerpc64le  |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/b10293b7c477c02d138dfcc1be4333162067ccd8 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b5ab8d74842949406191803f716bc9ef46a218eb |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/73a0cd635e0945b442e12484cbbb6f700a4fa046 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/19ea59c1977e47248591a12d2c9cc304af154d84 |     
    sh4      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4677f1d338b0be3dfd0b75fa51951f5a4800e75b |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e3b014b874e3124c07818e924fe1070341911e28 |     
   mipsel    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/83b248bfcd882676dd9c58f00798c628703d08d7 |     
powerpc64le  |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/9c06252e3586bd0c7d820f56973a4ec02e4b30f2 |     
powerpc64le  |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/ffd9e72fb80b858378dc76a9c18c0abaee1f614c |     
  sparc64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/ff0c26d7edc0a09d5d1cf6862ec8e86c6885c7ac |     
   nios2     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/c160883c4a5b5ccd8c2cb7dc5747e8b982bcf713 |     
    mips     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/8b4edeea9903032fff6df57660b4768e67d6797f |     
  mips64el   |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/1ab828c0a2b99304f9b5439d87d2af309385e5b1 |     
   nios2     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/1525ace05a906bce8e373f08616dce40cb4150ee |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/38866bb3eb57c3b497a0da176cb387087f4169f1 |     
  mips64el   | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/757bd6040314b302cfec9396dc6edcd8fc72c8d8 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ec993f26aad63c822d6e25d7884b26c43c21ea1c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2d440ca64e0adbec5c3eefccc2cdaf66f6463c57 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a53f51d6938516eb09560d8bd3c074c20eeb6a51 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1f200c3dabbe86b205f42b7e253ef58d53b51727 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/91032749391106387a6b81f5f4c7440e9f038345 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/399d4adc82bc535412a295f69c909bddf9847bcb |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e8ad7e68264fb9f9d38cc4176c455d373c229500 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1217cd529684c0500ff69bcd29910330cf41f382 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/6e58e29f713a5797e69e58e7d92e3e7c5947e016 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/e7ce72d50a5ae12121d3359d4db07a8ef9b823cc |     
microblazeel |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/89f9d54649d5b0ce77b7152680323e2db1fa06a5 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9edacfd7db2f5a1cd896ded973f188ddbe04b30a |     
    mips     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/129a4557227a662312bf5d3ad39737ede9da2242 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/1850d30c164a039cca92e51abea5853f5fcfb90b |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/365bd07671ac4f6841aea7c8dcf6f0e17e5993f3 |     
powerpc64le  |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/6f3c7bbdc69f37d3da0525466dc307f726440642 | ORPH
  riscv64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/942cf91a516d6c698fcf6c5e1236dba76df09ff3 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/2c8c1f34847be19a8f02780375381f213b9dff39 | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/c2b6634a20eb9b7590f7c23720969a891fe8a2c7 | ORPH
   mipsel    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/e0e3452bac4894927dee64c35f277c6cd4d89e0b | ORPH
 aarch64_be  |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/a55709c1a7813ccf56397297cbb8c5997fc31cb4 | ORPH
    arc      |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/918f31094087c304b0bf0fdfb9a536bc638bc373 | ORPH
   mipsel    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/fec525ef605d9a6728e739e448e953863bd794ee | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/16b01f75ceea519464908f7ceb15769590f6eb7f | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/6f7e0d390f57a8a652e3644ac3cbba116b3fa4af | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/82d327f8e9373f40d07efcb061e4e601c160704e | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2a9c5910bccd288380605938559dd7d7d52c1e2c |     
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/8e74f1b32daa0a4ef04e0e48c6bb834134c7fd1e |     
   arceb     |          lvm2-2.03.14          | NOK | http://autobuild.buildroot.net/results/fd533cef28f8a819c50687cbfc2aa7e63606f750 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/264e92e24b51da186271fc176f4daba9716b2b6f |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/609335029369674a6fdafbb80122820a5a037e70 |     
 microblaze  |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/7e1ce6f8bf3611d71aae696ace1804e8fccb3cc8 |     
    arm      |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/574ff4867ff5c38f882ac958dee2f26df29e055f |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5274bd7a7fcba279d36a841ce4a756deb6e1e36d |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e9f76e10eec3fcf50da620d2e5accc88322c2379 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c9754e0fd6cfffd2f7a5908543d2425d378a3a3d |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/0ded1b7f0b612f3c5af2d635a41ace605bce6046 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/aea83602d10ce8c0d803e57264c724d52e117fbc |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/6365b62a716b84203dc045668da6a59f65751db9 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/8182fcea228230bea054053f8fe89c2df83ff319 |     
   nios2     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/1181b21e55a8274cbc1d2c66d85b79b4a45495b0 |     
   x86_64    |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/2b598a78390c9ab7e1b5366203ba6c797ca734ac |     
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bd9498836dda8d870a72759bed9d1a79975437c2 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/30253ac877c67955d8191906f13f6f966f8d488c | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c3cdfefce5f51cac93045c177985730c8a4f0705 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/313e05f402ea1936a6f1558f3c620dfc4ec6b0c9 | ORPH
   sh4aeb    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c61d117bc71e2a2ac54a56bbbcde680756050666 | ORPH
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/60b8b5c139017b3925eb909057edf888370f1667 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d1958e24467fc325620e0dc208a3869efaca4e0b | ORPH
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d1afe0e5f6db3a199e3d2a222aa67834bfe7ea48 | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/beaf8282d348505d1c82e2fbe60a9a32be5350e9 | ORPH
  mips64el   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/55a884736ff2870c457a25c8630998b3d1b6d024 | ORPH
powerpc64le  |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/5f2258364a92b7c18f3314cdd291fe0c8605626c | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/a426649c1c19513514d56bdca11dfec0a19cc9a4 | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/2f81be8d3baac54c9e9519364b546cb85952fa6c |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/c94bb166efbbf110d9ffe0f83010451e45c0f9fa |     
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/49086da8f58dff8d22120dd42ad28d034cdba33c | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/08a6dda35b7e39be28f010a5a6ebc4bdd3811ef5 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/dc6a659501cebb8b1b8a35fc35efd8497c5dc701 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3510bfa646628a653cbc2b7fbb4e3e97846ed520 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3dbecdf2f8913f0531c84cbacf5106689c342fb8 | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/c3137b5363117c37fda8c1b87e0b0299ee97a8b9 | ORPH
   sparc     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a3abb339f90a345344594beb3377613f4f631998 | ORPH
    i586     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/da38ccbb3702a76297c9ccf3a94dacd9fe10d104 | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/bb08376e0c0ec4e2b9d20918fa6f6f3e75e60420 | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/c5e4eade053beec98b48466916bbdc6259cdc1dd | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3023d22afb26ebbfbbeb16f7e41673b8194b1073 | ORPH
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/75bd311fe3d7a0533ace06f05b7bc7e36d0fba01 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8cb4b2c826eafc81acbb9b16084a90788383191d |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/52f540c9de1f371d45b87a6b7de14545a1911f7e |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/5a0cb8263b1927598ada7cf27deea61a7096ecbe |     
   armeb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6a1c743cfa292f6bcf6e0a4fc267abd6eaf40224 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/07f9274e5c18a0888a3f4820f65599bbff162610 |     
   sparc     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ab712a4ca43da7370d3e6197fb22b1818ca43394 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d463ef06d2fb095548b475faf9f946260030744c | ORPH
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/0ada73bf0d2b3c49b97a17f37fb3c520c6845af1 |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/db63f783545d30b7082402823dae0ff80c835aeb |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/5f2238197828381d49b77e51dd0d29b7a9d82308 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/668c62a6a86534ddb95bc733c991e55ef02f09d3 |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/726888e7d55581036165ce97d7baebfee37e1ba7 |     
 powerpc64   |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/97a21d58bc5fd58e438c2755e7a1dd5647fe1998 |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/a49cde21e7f26d6114f200c7a804bf7598ac32ef |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/77ed5072ce7a161ab5f6e60d5f0e6a57acb1d611 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/3c7cb80fef678299a500c231c831c7710a972fcd |     
    mips     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/05fc840b97d87a0b50fcb3a53e21958a7367f4b8 |     
  mips64el   |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/bf1d41a82ff51724fb9e952515968231ed8bbd0c |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/36c807aa542d38c6b740839697728e876985668e |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7302a0cd90ccacd960e10706df2eac7d69a40342 |     
    sh4      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/19e75f0a9a0e14d78fef597c5d40c0f602c582f6 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/c7f2cde8bfcfd5d30dc873dfbd02066421a93a0a |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/35c22a198f3737a703841271644259a10a55ea39 |     
   arceb     |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/b8dd2c1cadda3069bbd82eda4d1418797e32571f |     
  riscv64    |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/8e2334670fb2523ae2928fdcceed30f7eba5d74f |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/0112ac92ea8a83061141891c4be3efd77464d057 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/6bbc0d89312c49f502248be3b416b117b2417a3b | ORPH
   armeb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/14a074c8f24b3782b6618c23c7b217bf09f69cf7 |     
    or1k     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/81c48f00d67a74896a03bdab300832b28746b4aa | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/277fad531fffff3112b57f3a44113a4d36c62a46 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/785d18e61c26a5719790115c88af14fe23cf6888 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/331a7ff78c1a2056498035a0cac0475b4e38b8cd |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b083388f769a4cabd6b2126e2c8601137f147313 |     
 powerpc64   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/5cca6e66e9879db7e5f0ea1f74a05d9743468d02 | ORPH
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/96370dccdf26e76bf2161e835903d273ff1cce8d |     
    or1k     |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/5e367b1e9820499d73d61d9ae7bad9710bffabbf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3b4338bb5962f2c54077215d74a6d5ea40d2185d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cf8c8f2b18850ce9bd9f85545681255e2cfecb8e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/dd095f512ab288f0e06a1ce0a96a4f33802c2bbf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/92a1347fdda754cd16cee157defb1725653b4697 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f42a0b9e34f8f74978a182b6b94eec5e1d776aae | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/45f4052870e8658a3d043bb0384543d4d29fcc9e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/58d3307ea0f14113ec26f9bef5dc311e84a113c6 | ORPH
    sh4      |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/a1330a7288432b80836e6fd9fa7d1acda49cd5ae |     
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/bdd9387f7c66e28387e882237e9e103a6c3d4d0b |     
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ba601389ef02d640ec68be6089e504000666f60f |     
   mipsel    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fdb145b4e5c023246ab5376073560b48d71b4f69 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           janus-gateway-1.0.3 | 3 
                  cairo-1.16.0 | 1 
                     frr-8.3.1 | 1 
                   grpc-1.50.0 | 1 
                host-go-1.19.4 | 1 
              host-pahole-1.24 | 1 
host-spirv-llvm-translator-... | 1 
               ipmitool-1_8_19 | 1 
                  linux-6.0.16 | 1 
             lirc-tools-0.10.2 | 1 
            luaossl-20220711-0 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/1a0cccf6b2c77ea30ab4cd27861aa812fdb7a1d4 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e5778a8c9ca002dd6e8c25297dffb341287e8e26 |     
    mips     |          grpc-1.50.0           | NOK | http://autobuild.buildroot.net/results/e0c6d56deb8d6e292251f3e9387e2463d4fbbf09 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/9c9e5ee8f75c4bca7f232c2c9720b07482e4993a |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/85159db0bd517ecd797428c92faf3ed7d8c31364 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c56191fa360a4bc72d5441d0fbde60bfe2960ca9 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/513c91a53a9eb87c13b4732efb2bd5f14e933c6c |     
 powerpc64   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/06d2a23bd2543b4573aeceeee9a5c3dfa433cdd8 |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/4b3c5cc7056118f1dc15342016a1fc0f8f738748 |     
   nios2     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/d2114d15fce52ba5417fa1b86033750f34e8993a |     
   xtensa    |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/b67463f1972a5fa4d97055907f762a6cbe8a99ad | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/60042c60cd09eedf36c6ecf5e67f48fd186ecf1d | ORPH
  aarch64    |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/ee3b56a8cbbcbd03eb35d348864255688447549c |     


Gitlab CI results for 2023-01-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122297  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122298  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122301  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122686  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122320  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122415  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122438  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122448  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122450  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122457  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122464  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122465  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122471  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122479  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122507  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122509  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122512  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122504  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122518  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122519  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122531  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122532  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3571122533  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
