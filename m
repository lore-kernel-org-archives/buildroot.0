Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B25C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 07:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A1C60A9F;
	Sun, 15 Jan 2023 07:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A1C60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lrov6VWqxQvb; Sun, 15 Jan 2023 07:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D0226118D;
	Sun, 15 Jan 2023 07:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D0226118D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA441BF309
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 07:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB6A81831
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 07:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB6A81831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhWSfJTQnYE4 for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 07:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7854881767
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7854881767
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 07:14:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBBCF20005
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 07:14:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 07:14:37 -0000
Message-Id: <20230115071444.CEB6A81831@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673766877; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZU71jifQBie7mjc7+GRXM5HEh1trV+IUYOvuxH77vrY=;
 b=pn+/ISFPLfGNiswh72PjtQtoTY8eH2xTmTh3U9ghTMYeKONOzn9Z8IX/vnqSwrkuRkA8Ol
 SxR715CV/h3sln46oJbGoOOIVDvjYJmriFdIUTcXDZaJhd4cybsrN/pBRuaxN29sapKaee
 aeszBynlXTZWxi05le3zft1q3cT/VLFvIcWBUgRWe0r/rZPghMPx2OWKWpHwEptLWEmZ6B
 6wgYRXOSIY3nCiBbGUXQyh4WzIbcUU3daRuuoKPFUWn/R20oxFinw7VVL9gUqq1g5O/RWp
 Inlc7ar65pWOUcBew9Z0qcxsTSSKvVYOeQGlsOGZVQv9N1HmBom2LkyRVMACWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pn+/ISFP
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-14
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

Autobuild statistics for 2023-01-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2022.11.x  |  2  |  1  |  0  |  3  |
    master   | 135 | 205 |  0  | 340 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 24
               host-fwup-1.9.1 | 18
                    fwup-1.9.1 | 16
                  jack2-1.9.21 | 8 
         host-sentry-cli-2.8.0 | 7 
                    pixz-1.0.7 | 7 
glibc-2.36-81-g4f4d7a13edfd... | 5 
  gobject-introspection-1.72.0 | 5 
                     xz-5.2.10 | 5 
                    bat-0.19.0 | 4 
                gerbera-1.10.0 | 4 
            host-binutils-2.38 | 4 
                    opkg-0.4.5 | 4 
                  sscep-0.10.0 | 4 
                    dust-0.8.1 | 3 
               libglib2-2.72.3 | 3 
                elfutils-0.186 | 2 
                  gensio-2.5.5 | 2 
                   grpc-1.51.1 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.39 | 2 
           janus-gateway-1.1.1 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.46 | 2 
                   libnss-3.87 | 2 
              libostree-2022.7 | 2 
      linux-5.10.145-cip17-rt7 | 2 
             lirc-tools-0.10.2 | 2 
                    musl-1.2.3 | 2 
                 nerdctl-1.0.0 | 2 
                    norm-1.5.8 | 2 
           python-numpy-1.23.5 | 2 
android-tools-4.2.2+git2013... | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
            compiler-rt-11.1.0 | 1 
             containerd-1.6.12 | 1 
                 coreutils-9.1 | 1 
             dahdi-linux-3.2.0 | 1 
            dieharder-3.31.1.4 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
                   ethtool-6.1 | 1 
                   flann-1.9.2 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
                    gdal-3.5.1 | 1 
                  gnupg2-2.3.8 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
                host-go-1.19.5 | 1 
       host-python-sip-4.19.25 | 1 
              host-rust-1.66.1 | 1 
              hyperfine-1.14.0 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.15 | 1 
           libfreeimage-3.18.0 | 1 
                   linux-6.1.5 | 1 
        ltp-testsuite-20220930 | 1 
                  mongoose-7.8 | 1 
                    mpv-0.33.1 | 1 
           optee-client-3.19.0 | 1 
                   pcre2-10.42 | 1 
                   perl-5.36.0 | 1 
                    php-8.1.14 | 1 
                     pv-1.6.20 | 1 
            python-bunch-1.0.1 | 1 
    python-cryptography-38.0.4 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                  reaver-1.6.6 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
                   ulogd-2.0.8 | 1 
                       unknown | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                 weston-10.0.1 | 1 
             xlib_libX11-1.8.3 | 1 
           xtables-addons-3.22 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c3df0a45977aa2800693c7229c0b7d7a6273aa34 |     
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f6e8079e83ff7bec2b522b22ceae0d6fdf077a46 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3990860a291e5c9532e6d7c750653d6b21f16f79 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bf17bc3bc3788336c094efa90583c5254ab64052 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/92f15456b133f432a4f8b814c553f6e409a5d825 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/420708c76849d87c887f5413d67115f72f2ad4ed | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ee264e0b8ef75d58fb3e013e50de72acfdd56d51 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ff373ead80d371df6cd2b7a5c4fc020d6ac2dd62 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/106525bdc7a4ed65aa75716467b08739c5f0f49f | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ac6e34c2ee4509743cc787dae33744e94ef54341 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/100470b3ffddf58a03addb8f61d6d81ce44fdbaa | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d77643847c5f89af1cd01c92ede8e9e5f647defb | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4b55065b67db591ac162ca5cf7f5cb8a2017eb7d | ORPH
    sh4      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fa1fa546b970f0b34084a7e51046feaaed5f9a29 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7dd9dd87e5767dbd8eb10977e097bbbbabf76410 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c0aac20e7e54c404e0cca8437db47cd5fc1367e7 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b0466c1fd17053e72b8b6ce28f32f834b2d68fc1 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/69a24cb136486e1da79f78342cc728dcee92f6a0 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/dc0dd71cb6634756b5823b3b51cc846bc8463ae5 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/214c759ac3eddf9e897cbfcfb80538edcacce518 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c86422a2c023218aa0f58d75ccf0e47fe913b875 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/39796625f74f8f24fe582291a2a6fee29e360328 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b9c96db3f4d5f6c8f0b0ed42d029ba46591b6176 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6290bf28b59eee593a9ed6ea886c459eae0b5468 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9928bcaa56869c7a6049a9806e694a7b6f7e5ddb | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/fbdd2269f054181db7ba9ce4fb4786da344ec4cc |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6233d21dcbdb7bf3f0236991009c65e19afa8556 |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7f5e71e26c724a13eb373eac086fba633f1a2872 |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/88ca3629dbf3cf5a6bec8ea07b41c36814b5ab9b |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/49fe467e54019ee37f111edb0649c810e9f23962 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d2619782f9198a73e6348b3dd85595fb2954dea0 |     
  riscv32    |       compiler-rt-11.1.0       | NOK | http://autobuild.buildroot.net/results/f7d67ecd2abb3cddd10e727ff56d024836c0f963 |     
powerpc64le  |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/2f7274e8c8bc961140a850ef66842cdef87939d0 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/a13fee9ed2ac61395375e4c4a9942434f1219ce7 | ORPH
  aarch64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/abfd09429aaee77dce9eb416f487221e95949b53 |     
microblazeel |       dieharder-3.31.1.4       | NOK | http://autobuild.buildroot.net/results/445aa39bf07da8f81eef0f3f234d4f7a3020f7a4 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/08d2d21e3e5a119cd934a225bd6b1a4d7c6dce3e | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/1a21fdc263f652ecfae2fc029022282bbd335dd9 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f94dd5481436614a67caa8ad814ef324c8eb114d | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/139d29ae94ca189aa2446b712e67325fa0f35905 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5af0751a097ad092643093292555e18398e2c1b4 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/65b472683e1803540027e9093e743fd97f07a69c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6f936797d6940624d7eaba51c14cd8a6c2be1eba | ORPH
   arceb     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/a8220fbe56fa6467ed0a2e635f0c43f112710bca |     
   mips64    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/6254be8e103eda2f3778ae67de9421afa5d05e56 |     
    i686     | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/264cc705fa50256e03efdd87aa202bbbf7ee6f8b |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3ae1aa1fc7e3a01272a0c755c0b64756ad81fbd0 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6decd1c3a7207ebe5fd89fe86ebef9883ec39a3e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9543f189af567e7393cbd01034f453eb18d8f2df |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/755028d70b3e8086ea3cf7102eeb193055f41ade |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c091be4b892a2e75752e387abc9a7596df287076 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b390fbf57429151c7c58d8da4ebdddac81e7d2fe |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2df6def6abad0629c3366119c733f927ec71d28b |     
    i586     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e2202481482c8ee18c87b2c71c6cb7ae525e5c41 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/04947b6fbcb591562e6d7cf113d0a39209cfc2c3 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6095d083c6eba416bbbfbb57e15f59ba8dca7ef2 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8e4bb65344b080318a203e6f7aff510424c2a47d |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/39144a4056844cc5c65653797b7ed8c21dfcaead |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/94ef141144e04fa62ae641e9d70ef898dd71edaa |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/37f8f40092351441bf75d4dbae9bd3edaff643c2 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1a7ef903168c6373e858ec6b4913eb6010cf7a90 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2f09237642ee36fdc0ab412b6487ca23071f8824 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/90ef6820c3f3252127bdcfa32caffbf64423131e |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3d1885eba1665aecc292b70e087dc93786eaaae5 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a53dcf76f68a7ccd0451182515352251ea618747 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/27e96d7e7ea767c8059749f0d48e7e9ae5423c23 |     
    sh4      |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/3937d5a83970d572d10df4ebde1f50191e25d3fc |     
   x86_64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/cc708a52c49437b741547ed638719b383c3db225 |     
   s390x     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/e1c99aae688bd63e6e1515e848f42420cf786554 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a8723e00aeba6b2fa77ac1d82a3caa44e1eca046 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/40c570145bef23aedb7380c6078091220145673a |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f8dfec1c39753a70e0a7dcc9afeb2643e40d94e0 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1e7bc499316afdbf70f5c752e1d0ab9625a92f9b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/52a8ddb29fef1725c6a0d8c0e9f084c3fc8ec905 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/03dff10fd040cfc23464c081ce67dceee1c311a6 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/919e12c38a1be8dd2d713380dddf6cc54afaa8ce |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d0a9c99b209b8fbb4ccf34a6a518b49b1308f9e8 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e125100e96c722dd8ff1ea02e118571d62f73944 |     
    or1k     |          gnupg2-2.3.8          | NOK | http://autobuild.buildroot.net/results/9ccf144a0ef555616bc3572246bdec935ed803bf |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/769688c0534f275e40c818d443d704932d97fcd1 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0afa92012eef13a44f887c95d53cc25f78be22e7 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/05e95bbe5ff4c4734a517c0b9a05de40e421e46a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7086cd7b28d75f360ffc86c369a4fbadaa927b0d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dc30dc863dea27ca24f33051325d5c8c9216f470 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/998530907cb9edaed1761ab7d1fb5d04cde3ff02 |     
  mips64el   |          grpc-1.51.1           | NOK | http://autobuild.buildroot.net/results/37da0597a1a9daa4da116c2a5d4cfe010e64d561 |     
  mips64el   |          grpc-1.51.1           | NOK | http://autobuild.buildroot.net/results/a9cdf0dc0f10c6d67170be86103824b6a0e16ab9 |     
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/dd68574efd0ea6ce448cba0f7691fde2ee91d6bc | ORPH
   sh4aeb    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/454cbc0b6650bc103b4047e9e3075b12b2deb9df | ORPH
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a3e4ecb56262c68078f5f7ec20c3b7f0d674940d |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f631243420480f49a69cabf5bb615f6eb693df8 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/174edb67d1bbdf0d4f08110ebd68f9dcbf8f5bae |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f89edb08a18743a9de03e635b57cbcdc814a0472 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e2f7759970372b9dd5704c6806bfa79dd1d881f0 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e800b06add1a35072fb4ac0895c704135e315d48 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bd686abae27248dff6bbe4e8c355b34a6ca08fe9 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/45ee2b47d25437701e5e00e0be738cd735e65308 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/00175afe594f3a2ff764baabbe66efcab913535c |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dbc87696fe5d39527194315b1a429627815f810a |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c1389e46cf801736e8cf1780bb579c7d936d7cf7 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/55d585abc426b78a1bb86127335a52bcabb6b5a0 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/31749f943e5ab151a0b2b8ddba05e62a30b9cabb |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4c92442e0c813ae9110cde18885649f49f1e3e85 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/67b11d5b5698f71218a272368d14614d940c5d29 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fa903aeafb1b354f5c1a16e6f0969b57af386ab9 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/493ecee094ca9a155c260c80f5de72226a5d91f1 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a6e4906dbceb7f604458344b2c71bd7620e45af0 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5346cb69a0c11a1497cca9e9edfb98bf66dfed94 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/faa09a4892089a2c1d99eb44100770725324b0fe |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a516e123e972ef6d3103e0dd9ac4b1199118723d |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ee07a984d6ab5079117d2603a69c59bf44c5642e |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d97d8fabf53043fac4a2c2c77e7583f0691897ba |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f5e8ec86707d905da972aaa00c848e9a529b3821 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5e67115a858fab2d0617b00aa1df0d1f6219cef5 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/534c5021b5c482523feb0ab1e5fc049080d7d384 |     
 microblaze  |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/722c0298f3ca9f54c61205ab69769da1a15f66d0 |     
    mips     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/45bf14112c396163d0a38caf6eb27119b4d69ddc |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9c6b057afbf06e3eab724250503fb964c80c3e43 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4e3026f8963d895ad41049a00a2b51c4b1f2634d |     
  riscv64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/fd4a9858d750fe0de52ea976616883d90dc68592 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2ae81e922f7c9e760a05ea6502ce97e248181f91 |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/24d5e82e68a0f517dea2757dbbf87ae4ffbd189c |     
   sh4eb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5ce3f6964c2d098e6902660ddd6207200511c17b |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/61276710a92685cb3e9265099037bf708de55209 |     
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/50a54101684806d4f84050b5ffe7db923615dd92 | ORPH
   arceb     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/68bc6f4ce905ef0383da6aec9602ba49abbd493a |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/277274c05bc961ba34285c5d34b4612e2796a844 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8a6a267eb987420f53ecfcd34bf834ad2b82fc41 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4e0c651963f427084a0ce2f9945d549de605badd |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/082a407f03845e1ecef85c9b01a47966b707b894 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b91818d07166e9d21d75ae258556405988629e2b |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/861d720651e920ee5b285812e37e4f0ba73abba5 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7be454953baf9f7b2d831183f03364597b89a764 |     
   armeb     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/f0b756cccee36f76822d1f8ee4e0ba7cac552ed7 |     
  sparc64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/11bb0079f5a7d06d3494a61b411f0af2e8c4d342 |     
    arc      |            kmod-30             | NOK | http://autobuild.buildroot.net/results/2d5f594f56b409e77fb585d6164d0364bc310556 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/4e778c00378dec4408a62049253251f70d544cf7 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d26399f5426b5459daa0300dbe16188a49e50b77 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/7f9ab16ba3d4bc3a91b5c7aea443f5f944da69a5 |     
   armeb     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/67ea31751ecec5edc388c553e4869eff32f0add9 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0b73da5d2c829faa1687aa791d4c4168a05c3b49 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9f02e85006247713046c271a06a6306ea5452304 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/770c7049458f6471df39419da34dc49a3d13e9de |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8c94a6e67baaaea2d5850ebddd2d9267ab71d9af |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2ac391723186ae47253e88454c5940a84938caa0 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/45c6adaddffd1e120dc588ec37c665544f919dc7 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/05b1a476a6ef5083d06f68731d7a26f423e4cad9 | ORPH
   x86_64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/e76449b5720cfccb9fdcfc832d483dcc5d597f3b |     
powerpc64le  |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/616ba96b571019469e6d01834fea27fa503ad61b |     
    mips     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/d3e10f22d675057015dd2f1ea0171a0498daf9b7 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9cb97956aea22f45af30bd57f1be27d245aa011f |     
   x86_64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/83ad6facaa98ef594b551f79c7b3c4cb14641103 | ORPH
  powerpc    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/056abacdd85eb1a243fdea9e11fd7412836b26ec | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/c6cff68b9bc5df99cd57595447df1d44aa3f2058 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/061c9fa7081862e2a0b76a82533d17ff69598430 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/59169a48472abe19c04ff32f69a243d9b147beae | ORPH
    i586     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c89e62bf28dbbd711bd11fa337b2e2f754ad6584 |     
    arm      |          mongoose-7.8          | NOK | http://autobuild.buildroot.net/results/c538c6d8e87e4e24097c9878ee15083802276505 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/137249d0a1dd095c925f13b17a732cf1a87f1988 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c571edcad05329ff2c2a60ea6f3737fa78df76da |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/19d215f97bcd1b2fcdeb5ff23637494bec686374 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/1aa6e917f2fc79426935c749ba91413db5d45519 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/825d2000d72d34b77edcd3ff1596a1f1ead702ca |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e7c7a2fdc08eb82551a4c5506be1e202de3c049c | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/859de717a333772c2b6e1f26c6509004168aad8c | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3143dcd1aee40fc0abc1cc309c3ccc51ecdca544 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e044898a1cbe811da4f4c76319c08abe64d08f1f | ORPH
    arc      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/cb698de222bafa5c332cba3afddabd88152240db | ORPH
    i586     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fe00520e39e53e0bca929f60fc64914d0b4817b8 | ORPH
    arm      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/e9a70b9a8267f003fbb43d041e167e2c3bb1986a |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/f24661e426dcc6eca87293fe9cf367f49c928024 | ORPH
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/06181ad82dad8cede413625004df136529d7d9b9 |     
 microblaze  |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/c9ea0f609ec41e2c3d5ba029dc881f3826172e48 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b2e4f7b2fcc000e32561ae74ce5d7265230f2a7b |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/4bab17f2147778534946176268d121c20614c1b0 |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/a31b6e9835834b8b1467b2d256647e3ce4d48f31 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8c4f6ec4e58d4897cfce90e4885d0ee6c8b8198e |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/4c4b60e9f04151bd8218dcf86f67f5518a4d2848 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e50d5d4429a62834dc3bce4464b44424a005fc68 |     
   arceb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ab4bcc2c8efe1302aefe16a7795ca4882609264c |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0b507cea8fe34c43e2e8d0a94d3b26e5b089a74e | ORPH
   mips64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/dfb123dcf7e2af67144b82c0c764d9b7fbb6f6e7 |     
    arm      |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/452c1f8956174e4b979d90dfe55dd71d2ad64af3 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/48c3f26879c3877fd1c30195163aa6ff62920f33 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/b2cee0ff2037ef5a2828e64d46620a342e724554 |     
    or1k     | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/0591e417d5bcef7ae65da71d3d6c034da885cf83 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/2e0fa0929f5cdc77feab5e8643046c43e1776e98 |     
 microblaze  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/aa21cf2043c9525b42c1655aeb93608fc2d030af |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/02a746967df1ac678045116d504ec43de9d393ae |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/94561e2685626d94eb6d982eb14e9351c2e053d9 |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c113008bda8d9afd12ba2d47fda96a9649ed7b25 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c7c58c04bc4c84871c46b7dbcc7a834a4520458c | ORPH
 powerpc64   |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/e3178752cd71f0915b4623b4725d414b6c8c1da0 | ORPH
   mipsel    |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/7974a6f25a8c314b154a1cc1140c1db3a9c5bb46 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/30d5a3467b0e5c6f7f3c8253c602627b934abcd8 |     
   sh4eb     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/0f4f6d1bfee4b15fa0cb14c2b6ccf8847e4a5a01 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4f51e82d7d7c2bcc9e64cf4105366ec3778d2ae8 | ORPH
   sparc     |         weston-10.0.1          | NOK | http://autobuild.buildroot.net/results/5643b33ff93b2a7102a16b3eada8afdb4285a39a |     
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/404b79e05cc30d494a3d0a4140a8df9b3ff9d66b |     
   x86_64    |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/c32f5dedc4568daffb0c513cff84d007a5f520dd | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1afe58cac6eea35a1f8ccb608536271e3d08bc3b | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/49d5df64f0ac87916dcd037635b88c7ea0f322d8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/57906fd0bb09decbc5287ca4f34b00c6fe5d6607 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/66e88c7341febc173a8ff337e5ee52508d55b65f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/29e2b9da768d6d346561a95011645ae0ad37bdcb | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/0317bbf10ab2d9ef4a9147dd471b2882a715d7bc |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                     efivar-38 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/0209ed6fa963c93824c8f9379b19d27fcfdff0b1 |     


Gitlab CI results for 2023-01-14
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
