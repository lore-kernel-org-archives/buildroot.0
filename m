Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84235C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 06:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2306C60E22;
	Tue, 14 Feb 2023 06:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2306C60E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHLmsqjHBXDC; Tue, 14 Feb 2023 06:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F69760F42;
	Tue, 14 Feb 2023 06:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F69760F42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 740A81BF307
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 06:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0F081DF7
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 06:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D0F081DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yeztN11goTY for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 06:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95EF813A7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A95EF813A7
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 06:40:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13EB8240009
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 06:40:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 06:40:28 -0000
Message-Id: <20230214064033.4D0F081DF7@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676356829; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dpQZJL2YGgFCtb12XgRrrhUQ7IB051uEVsxhCEU6aJw=;
 b=Wlwpn5Mm+N2MQEEdCwySeqEzViswRrJxvLwTbP/PYJsquTh2M7nSKXeDyl9tWoeR6IocVG
 jRB+5NUynLCA1QIgl7obACiWMIIsb/dfBCAUoRu/pQ1berEr7SS2wZLVwq9AamH2anqha4
 afININAbtaHZ6DDwPjMfcwIWbDeY8MWKQ9lOUKZLOPx1cHK73+LAFsvakPFBhtmAlJi9z/
 T2qL8JObi5TXqnYMlH5iKiWxI7qn0K/WqMBpvZl3/NXvKavXFmoAzqpCvjUkHrRGvAfUU1
 RmfREFGUDuA5jHmOZpljJzx9CBnPpJOQzlNc9tIO6fa04VWFbsJauXRRN+Np4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wlwpn5Mm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-13
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

Autobuild statistics for 2023-02-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  2  |  0  |  3  |
  2022.11.x  | 18  | 18  |  0  | 36  |
    master   | 135 | 193 |  4  | 332 |

Classification of failures by reason for master
-----------------------------------------------

                  gnupg2-2.4.0 | 13
                host-go-1.19.5 | 8 
package/postgresql/postgres... | 8 
                elfutils-0.186 | 6 
              host-rust-1.67.0 | 6 
                       unknown | 6 
  gobject-introspection-1.72.0 | 5 
            host-binutils-2.38 | 5 
              libgcrypt-1.10.1 | 5 
                   linux-6.1.9 | 5 
                gerbera-1.10.0 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 4 
                    olsr-0.9.8 | 4 
                  zabbix-5.4.9 | 4 
         host-libarchive-3.6.2 | 3 
              host-pahole-1.24 | 3 
             libgpg-error-1.46 | 3 
                 systemd-252.4 | 3 
                 dmalloc-5.6.5 | 2 
              erlang-22.3.4.22 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
         gobject-introspection | 2 
            host-binutils-2.39 | 2 
               libglib2-2.72.3 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
             lirc-tools-0.10.2 | 2 
                    opus-1.3.1 | 2 
                     php-8.2.2 | 2 
         postgresql-legal-info | 2 
                   rsync-3.2.7 | 2 
               valgrind-3.19.0 | 2 
                xenomai-3.0.10 | 2 
                     ace-7.0.6 | 1 
                  assimp-5.2.5 | 1 
                    attr-2.5.1 | 1 
                   audit-3.0.7 | 1 
                  bind-9.16.33 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
             containerd-1.6.16 | 1 
                 dc3dd-7.2.641 | 1 
               ding-libs-0.6.2 | 1 
                    dust-0.8.1 | 1 
edid-decode-188950472c19492... | 1 
                   expat-2.5.0 | 1 
                        ffmpeg | 1 
              fluent-bit-2.0.8 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                     gmp-6.2.1 | 1 
                   gqrx-2.14.4 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
               host-runc-1.1.4 | 1 
              hyperfine-1.14.0 | 1 
                  jack2-1.9.21 | 1 
                jailhouse-0.12 | 1 
                  janet-1.26.0 | 1 
          libcamera-apps-1.1.1 | 1 
                libcurl-7.87.0 | 1 
libdill-32d0e8b733416208e04... | 1 
           libfreeimage-3.18.0 | 1 
              libudfread-1.1.2 | 1 
                libxml2-2.10.3 | 1 
        ltp-testsuite-20220930 | 1 
                          mawk | 1 
            mesa3d-demos-8.5.0 | 1 
         multipath-tools-0.9.4 | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20171122 | 1 
   openvmtools-11.3.5-18557794 | 1 
           optee-client-3.19.0 | 1 
                   perl-5.36.0 | 1 
               pipewire-0.3.65 | 1 
           python-numpy-1.23.5 | 1 
         python-pymupdf-1.21.1 | 1 
            python-sip-4.19.25 | 1 
                rdma-core-44.0 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
                    ruby-3.1.3 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.3 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/a18c9a471786632f1790ecf9d985838722ffbf2d |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/18b9c0e3b877ccf0a2ef004a7e9b1c132b3515f7 | ORPH
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/dfae3378d9e93a688d000d0ac88873bc686e29f0 |     
    arm      |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/35e6df7243ab6b4505380eb15fcabb438c673fc0 |     
    sh4      |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/06d95cca882f6a58a7b89463e6f602d926da1bf9 | ORPH
    or1k     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/19f36081bcf386911622c48d3ad03f40fddec360 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/6aad75e66463045b33cdffcda67e4eaa08ffe80d |     
  aarch64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/f0e72626ecaa9d4af1b16464cb921b39510676bb |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/417bcbd3f5748a98d6af7aa7772c2c6447bb0127 | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/f26ceaea1e91af208cb5ca5576bc6346d9244b1c |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/c9fa0fb349d5b1351bde2362dc26fff2314c26a9 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/091858c740cedf28164dd2d0a891980341b28af4 | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c14f3612891b40c9ac053ccd5b31c35ba4ef1179 | ORPH
  riscv64    | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/dfdd2284b407df880fb83ea2766f5f0c566ef35c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ad7342f721a5855011e9e7663999ecf45ef60ddb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/728a1a9a187b47b80efaec5297246fddd129bf48 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/387aac8443f8098a018623ed62260d7355c3e6ef | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c65e90ba56d1ae8061eae11014768e6a5f4c4c32 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/50227e3e281a1e28848b2e1ae0dc1123cfca7fc2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3469a1cfe2868194102376f19188a5d0a48bebf6 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/48527d6610e3afa13841e921acecddf023145268 |     
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/ea968af1e2d32b616755fe83d297f72ab009fb0e |     
  mips64el   |          expat-2.5.0           | NOK | http://autobuild.buildroot.net/results/198c9fed072fbb87bd21beac7fe40104a6ed8176 |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/6830f1b80c0b8af0133e2fa5f03cf4700577ac88 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f7962b003a5391cafd3ba7594e9ab2cf901968d6 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/db3b254dbdd409dec3e70c1b489d7473c0a7b33a | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/325ca998c1f70fe28f28ff8ec762ba18c22f99ed |     
microblazeel | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/7b0c134d1f7a23882c44eb2c2ec779d1265ca5e3 |     
    mips     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/6323d814e7dacbaae8a16217c7c6832b3703950b |     
   armeb     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/46e91a391913f927429e61f92243afb13bcfebd6 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0aecfe0c22274d623a78907e32322e700a1f101f |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ad78cc33806706d4ee72bd521fb66cb2eb2cee6b |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ffc22d8bedc9862c775e221c336515c5218131fd |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a9db0663e4dbd5096184eb3c4a920add5f224ce2 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e258dc36ec6d9d3273b485a7ed8a6d00b2624b37 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bdd396ef095d8e2c9556d3c398ff263f2e8357f9 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/02d284654057af08162d0cb9edc3e6bbb2ffba32 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/50391e1463ce25db972b2e202c7cb820826c006d |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ccaaea6c362d57e2daf0a12621b3004febbcfdf2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b210a78f2bfb622a6cf488a78908c2647719009d |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ee1909c631cba531070cd67e6c3546be26773bea |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/1c00b8f72b0098974add7b4604fe95f2d4329678 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3105d25c30e64eae3dbed5379270e3a7c8696327 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bf6380d241dd2dfd7dc0421ea8c2108351893600 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6d5b9c1b0f089aee1cb16327bbee50b5527ad8d1 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/081bd5474d574f5f45a158e1829ab0dc628ea2bd |     
  riscv32    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/32dea54f343ce8543b3e598afa8f0b96841acfae |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0c8d76de4f495c1d41664dc756b0b3900aebfdf6 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7c02fcf63db132bed901697042391774d98a60f4 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b124ee2d554c1a28b38420bf9000f6571c689964 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ab8fae8289e96fca3b4ee948b9076e0425f45ba0 | ORPH
 aarch64_be  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/8868c105ad5d1c8333b02b03097f9a213b85c4ae |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/b9f7d2edcadd4f785817be502a73f357f4fa480e |     
 aarch64_be  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9bd34162265ad04e8a770634ce143c7387ab4ba2 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6df7bb5f30e1438362877fb8eb92fa0c85e56907 |     
    or1k     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a35b27be105388c965ce93203ae80ff0946fc5a3 |     
   s390x     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/3a294511b2ccc4c4463aa50c1d7c742205d93f6b |     
    i686     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a90db8e1e310858e6ffbbd4aacd7581107d1926f |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/f2f04c2eb3076c7528dd58dfaf94cc4b44ba6344 |     
 aarch64_be  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a75fd752dbd10da441ead9cda39f206315ae258a |     
   sparc     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/acdfa41e8f7c3f6de2b6cf4fe5b13688c0230b0c |     
   nios2     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/f0f5b4d817d235f65a96529ccce1108c315d6145 |     
  mips64el   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/82cb5f9c6c7bf2d01d73c9ed8fcea669779cf10b |     
   nios2     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/3d735d2258dd872dbd50c5358bc4f7b4b8338a6d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a25e7938f9fd6e890ed9a652f9509790686b62ce |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4e7bc1b18c030937f31fb4b2c563324160b6344f |     
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/61ed6ffcec3d7ed29073ab8bb64782323e1cd01f | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d8303851152fb4a44c3e87b5b185dd99afbc686 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0537b05399f9eefc9a77ef195be892e6555ef2e0 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3f89a980cbc32e60a9b55330cbb8aa6f63545024 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7100592c8ced090a50b727f8c58884fc7085ab98 | ORPH
 aarch64_be  |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/42b5ab2e555063273ea55fd1c09a9be6d8b620e2 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5699dcd4a21d137334cc9df0743100301444f499 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/230ac4c60497236eac11b74e45df4ffcaad8933e |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/72d5e1894242d092f4cdeb4f2bbfdf12614acace |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/49fac1ff741b7ab06962835bd00e2fe89fd62800 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2f5be22d5aae3793413fd8566b4d995a19e4f379 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/892bdddc021451157e46f626264f536938c9cb81 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9e32209526d39dad8e1d9f63af036ab9d8f45cc7 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/90293fa6c6eafb705b9dd5745614047d8c0ca5bd |     
  riscv32    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/94a0da7f503a2a67a6cf05cb103385a0b35cd724 |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/21c70302a4bd25c8075650b29ec52a82bb5ddece |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/574c9686e4b0f54e38909851abb57c328f266733 |     
  riscv64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/3ede83521a087f11b2463907c5a5e4d69b665f2d |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c8f69909ddb69f04b9f720d91587276f056d86cb |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/21a3509011770d0f7ce9e593c47e5c3cf7c502f4 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/76a37309b2b8188d592c19a83e71bc160a4f343a |     
    arc      |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/19515bf7334c676e4b847938c8de5f973c781d68 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/3e27768aea451b364fd2ccd4ed91ac9f4634acec |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cf0e13e05b890d0be3822350603e0f118f28a768 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/5af0899215a3a41cd67f17e6db4e4d19906cceed |     
   sparc     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/9857bf0454d4684b479b0d710721ab693a38728b |     
    or1k     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/88111f1ef1bde2798611195dbf5c531955d0da23 |     
    m68k     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/9aacc32d35cd23dcad0930f2d1dd089c25cc708a |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/45e1a67e0a1e93419dcdef0446ec14e8daece748 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/db3d60b0f17713f9b5ac4db53cecfaff07f7c207 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4b1c251886d06f79a237b2d9abd732b9fd4a84f3 |     
    or1k     |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/c3f3de2a7dd1a465c62948ef3a91e28274f8f3e6 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/7ec413f13a56b354a24b7ef69006ecbb49d15df1 |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/ab42b30ff4a848cddde2610d29ce68c5035d848b |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/94096259ee11bd17ade743aa398733500a25c537 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d81e1a54b14ab25b4668b0b5c82037f5257f789e |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/be9c80c8382d272feb65e53dead3a13139e495b3 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/08b93ff45d70d215e2ed0213a2a1cf176651c3ed |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9ea7ba64367c2eaf191c668444bd52642d7ce960 | ORPH
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/aae15f54e06bfd5c00aaf38fc78bc65ed98c2575 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/fcd1dc058f6bc9ed8f86c2deb2de5092b86310b9 |     
   xtensa    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/d517f990a730038435323a8c24e752b1fb985e23 |     
    arm      |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/391445bfea4ae447622f0a4dd39de3420b6e1398 |     
   arceb     |         libcurl-7.87.0         | NOK | http://autobuild.buildroot.net/results/3eaa4ee44920285cea2a73f6279bb142f0df9063 |     
    arm      | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/7b0ec76f05dd978517c1163e0f7521f6e393fe3d |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a029b31bfa8de58ab5b2665e5e03bcc812d7ff92 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1a27a255ce62ce63a36043cd89d4dc913ab8efb1 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1ba900ea50270338cda8fe9ffff1a5c637784404 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/60f2d4c98441cbff7c2edf7e73505814a40366b2 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9da0863e4ce8b3f612f2279a75bb8f9cd22f1806 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3990f03e4deb21551b320f792647adc067416b74 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b63e152d47f65476dd3631ae0fa69b45aaf1d651 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6cc4594437094c3c88898f344ac99c6e60994cd9 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/89910bb1e73fb27a6f85afa41128c74ba78c25bf | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/21997a0a40378cdc00c1420c5748dfcb28dee4e3 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7478e88bb5511a2087973d3bf2d05bf2422a6ca2 | ORPH
    arm      |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/754596590db80c6250d60b8d3c156ae1ccaf624b |     
   mips64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/d1a0f90e0b3f8ead5a3320941f894a635507d0cf |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e09104ccffe408a34a124e1fd357d7816591845c | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/83a2bebb7efc709ef662b470df39c65ae1fdebb2 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ef1674176eaad3f591ce812be946b38e65f7bd92 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/33520bc829f138035aa6dbdc1718fab12c3c21a9 | ORPH
    mips     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/423554fcd1721ca8814bade3fec60c69fdbaa146 | ORPH
    i686     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/2587b82a352798922a864b9b74d5f74d39e98945 | ORPH
  powerpc    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/4afe577b30023a525fbb2a14fcebbe587ee056f3 | ORPH
  mips64el   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/f0995716a2a5fada06ec224e4b5f21f26ade6e83 | ORPH
   arceb     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/4239f11f6864aa3c04e2eca4fcb5712f7e970874 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/038271a34d88abceb81aa941db5c9706f75380d9 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/3ffd1cd536e82e4dae21824976d5d4c5b324c9bc | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/b80c992b05541558896d2c53534edba99d24988b |     
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/fcf77717661ec34e57cbd8f0e025f015c53e2aa9 |     
  aarch64    |       mesa3d-demos-8.5.0       | NOK | http://autobuild.buildroot.net/results/1f59abec436e5db19a70f58ffdd55891935a9e15 |     
powerpc64le  |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/e0f56ef924c13d6b1535fdc350ad8ecc06ea0a58 |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a739ac11ded2fae7283951def6e247e9fb580892 |     
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8abb8e97a8fb7a9a216787e368f582ea2a6b2aaf | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b5fa7cf0dde7320b78ca8d95e80bca496cf1a827 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dd888f32dbc1191150acc985daeeee43a6c250ba | ORPH
  riscv32    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bff5633edcf2d185659d2cc21ef8560127ee18dc | ORPH
    sh4a     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/02590a47c1a199e8164032dcf177af8d460aa105 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9aedc73aceed5a5cb7987f593846752f70693b29 |     
   mipsel    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/6cc48d9eeb288b1582907d8c5e4f36ae17e64229 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/2fbcded586aae03a0c59b050f63def61744735b3 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/356d2b80ea48af07f19368ddfc120550ccf01721 | ORPH
  sparc64    | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/37290f277a1b7206bd3d347e2451dd02c1929d22 |     
microblazeel | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/2cfa87cdf0ae5ee1d28143d2904a1040d073d804 |     
   mipsel    | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/171cccefebf486900d24a8cf592d641de6be363d |     
   nios2     | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/b5f48a6121ab85c207101fa678838e72539939d0 |     
 microblaze  | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/d441c3b8507f5079bbf31b4109062bee61b4c887 |     
   s390x     | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/d308cac03f7454a015e6d833ecf125fab6ee02bd |     
   mips64    | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/0fefbf0b3f20aca78838403bcd094869e1ab2b21 |     
   mipsel    | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/2957277613e738d24ce1e9b261f22f6f1e0042c8 |     
   mips64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/d652c6b5157181f47d8fdb412cc98f30fb26f8f9 |     
 microblaze  |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/94b0d25578498b6296832fb8a174756c4beb7b27 |     
    mips     |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/c241d3ef0db29abf4c345d7665aefb2ffbd639f2 |     
   s390x     |        pipewire-0.3.65         | NOK | http://autobuild.buildroot.net/results/9ecd9aca5edc3756154da59573157954f06e6537 |     
    sh4      |     postgresql-legal-info      | NOK | http://autobuild.buildroot.net/results/93f40dc71619745ddc6741598c9a488c81ea440f |     
   nios2     |     postgresql-legal-info      | NOK | http://autobuild.buildroot.net/results/9d2daeb565c9fc4465219474e8c87555d072367f |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/1bfc260aad8f5b24e90d49294ef9e9e427e34990 |     
  powerpc    |     python-pymupdf-1.21.1      | NOK | http://autobuild.buildroot.net/results/cf268d3631330a8288fb8ad2af009abb7f1ca6b0 |     
powerpc64le  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/af1cbc00bf2574fba67575e1cab1fa7b1434b746 |     
    m68k     |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/b0e8c7f317fbbd798b2833803413fa767e0386e8 |     
   sparc     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/3bf75b802d79ee0ba81ead235c4be1a19d282bf6 |     
   sparc     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/30f0a53825518e78d3e782efafc741a308fb6ac0 |     
 microblaze  | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/e128298929fce31374687a566e50b00c150131b8 |     
   s390x     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea |     
  riscv64    |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/e0c51820ab371e6ab6fa76654dc94934820ffcb9 |     
  sparc64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/84c309aee11570a9e9ca44f0681e06ec719ff11e |     
powerpc64le  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/4f0df587dd00806169aad68ca645374c5056f540 |     
   nios2     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/1eeb23969ad7bd3896bbb3b0ca6992499b9c5942 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/ead304285a9cf32bf6b9dcc7fc30acece25ec680 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/1b3c27c1b7f48eb95bb91348ac1801a43a845558 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/507e0bffe040adcf8ce99f77a2024e2182cb1620 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/9b3f74bf8656ddebfdd9609b2165b54e71aa3a94 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/c5127f97baaa2397f4dcb45ca512f3ac9a91d474 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/86b5f2bb0381ce5964ab4d851d2341be383a6a86 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/07d15c087b133509fc4745702f90143fc5d96336 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5df4884304cd4fe53f9901fc075342825f4a2e76 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4f49f1ddb5796b0324cfcddc507713f8be13db4c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0757e3931203a15313148f70986108cf565a998c |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e21535338461b5b085e666a8ad84ceeca8779fe0 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c36fb5aed960abe88c6627efdbc5f4b328efe5ac | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6f7847d66e6bd5f20a4ad311e10455dae28638b9 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/5225bda547c110317dd7c5f81ae2af8db81f557e |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/48a3ec2c75e1d57d63365b2bf47c94b58cadb84b |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/61a179b8d3cc2cd7e7bf88db4254070c8f3c6f9e |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6603637236336336292d872f515eddcb7c666f8c |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c5bdf24f6fff972bd8f2725174897df3f5f9a5f3 |     
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/617b67d19a1b75489754ba16fd0150ef39d8d045 |     
  powerpc    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/bccb9aa17ebaec6abda88bbc5f3feb2d5b9023fd |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/26dc8469f452d0efce9d81f41d5c35577885352e |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/053a62e9969046a7f8a0e1890c24d2bfb099ae42 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                flannel-0.14.0 | 1 
                 mesa3d-21.3.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/d8e0f21a0475996dcb9d4a6dcb5343d381fe09a9 |     
    mips     |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/265a441fd4ccc81b0434ef4c7bea8c24e1a15ff3 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 5 
                       unknown | 2 
                 augeas-1.12.0 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
               lightning-2.1.3 | 1 
                  linux-6.0.19 | 1 
           python-numpy-1.23.4 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/b550a6883a0340afff13e755056410647b431bd1 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f69128febbfd4a5363c1d098c756a7b8dace7166 | ORPH
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9d805ea3a3143a2607739a3de97af3a990d7de4a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/23148e8ba4134b88728e540c72a823d37e659690 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b57643a9098eb08653f40515639ff68e3fb06cf8 | ORPH
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea2ec269e5fcb0a0fe9aabd63bf86f2c7d2b7b0c |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/722f516a6b0faba0a78fca21a204b788b07fd086 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/713f81903a221158a01eb3869d4bf50ff1950eb6 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/01332fb48d5aab2bc85bf91d016500fbdea0d102 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8fc883af903ba73caadd887019c0df3545068b7b |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/efb35288b235943a20823eda39f93ad5db065445 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/328d3715b86693a6f3824d62f71876d7a9c75a07 | ORPH
  powerpc    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/abdf3e9e1633734e80b017e8444c54e6059495d2 |     
   mipsel    |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/0dab7e93b939cab2e34454cb87ed2236d88adc9e | ORPH
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/bf06f2181b08a7787343d212914c269ff20d86e2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a08adb898323277b323a11303f4a8f3783cef0b2 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/60e92faa766a948cae278c9058ede76bbe4e9629 |     
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/4b8f858e717d027c5e152f056a2e8b2fb9ee6ff3 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

