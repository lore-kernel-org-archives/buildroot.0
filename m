Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CE7C4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 06:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA5381F67;
	Tue, 14 Nov 2023 06:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA5381F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkEp1Vu6KiTA; Tue, 14 Nov 2023 06:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A146081FA8;
	Tue, 14 Nov 2023 06:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A146081FA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A94141BF2C8
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 06:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FEBF81FA8
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 06:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FEBF81FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOewadp4IDK5 for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 06:43:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E5B81F67
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 06:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E5B81F67
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E471C0007
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 06:43:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 06:43:06 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231114064312.5FEBF81FA8@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699944187; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ld329isEgbbUKRpax3KEjl+xbwtXWnerXhgYx1ZLpNk=;
 b=b4bXBzKUzBTCq1Wp4wO0aL1xNWGtx54XZMp+11nTaoZDnGmIlawfNvvDXrPWqRSDIUcUG8
 0y/UXVpXKTMdhmu27I8Di+37nqQ8qdlIDaEGbjnakkHGZBuSiF2S1tbhkEutvILTc9o6m2
 VbA5ervjAroSlt8MtrUHgjwM2PbNiKzAVsfFCWbqaItfgZDsw/EqEaSdRyF46Qf+tvekDq
 vyqc8RbfLErQjSdme8iUBibgPm9JkT3ilmHBXHi0869UdffjZPjy8+YDvFYooqB62MfQip
 hhCexHgyn8MLSVjHa32/52kA+n9tdQeLtOYibP5/lTAjzFEm/xx0Gts7kuxqbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b4bXBzKU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-13
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

Autobuild statistics for 2023-11-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  | 10  |  1  | 21  |
  2023.08.x  | 10  |  8  |  0  | 18  |
    master   | 42  | 74  |  4  | 120 |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.0.12 | 12
                libressl-3.8.2 | 7 
          python-msgpack-1.0.7 | 6 
check-11970a7e112dfe243a2e6... | 4 
         gobject-introspection | 3 
              host-rust-1.71.1 | 3 
               libglib2-2.76.1 | 3 
                   linux-6.6.1 | 3 
                       unknown | 3 
          cryptodev-linux-1.13 | 2 
                host-go-1.21.4 | 2 
               mariadb-10.11.4 | 2 
             util-linux-2.39.2 | 2 
                xenomai-3.0.10 | 2 
               apcupsd-3.14.14 | 1 
             bluez5_utils-5.68 | 1 
                elfutils-0.189 | 1 
                  faad2-2.10.1 | 1 
                 fdk-aac-2.0.2 | 1 
                        ffmpeg | 1 
                     file-5.45 | 1 
                  gamin-0.1.10 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
             host-delve-1.20.2 | 1 
         host-gcc-final-12.3.0 | 1 
     host-moby-buildkit-0.11.6 | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.2 | 1 
                libgeos-3.12.0 | 1 
              libostree-2023.7 | 1 
          libpam-tacplus-1.7.0 | 1 
               libsigrok-0.5.2 | 1 
       libzenoh-pico-0.10.0-rc | 1 
 Makefile:727: target-finalize | 1 
                   perl-5.36.1 | 1 
                    pppd-2.5.0 | 1 
                 weston-12.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/039450dea682a605f6dd326f15c57001376f050f |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1e54d4e5f877a0d650bd4cf71fcb44f4f128ae5e |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/accabbfd9f20eb7a2336b5a2472cd4503d99f9ed |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f845443de480133e4ef8aabd46b65ca2823e20ce |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f0603ff9311cb0741028708d826b3289e9624123 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c56322e9f86dd86770c9363c24da9f3208dd83e0 |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/920d247671fd41f0f466d1e13655518f79dee6d3 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b369d0f6fb18286398fd8d6bda03cd762e897a54 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/42dd4832e9ac725f48dec4ec83cfed67792db188 |     
   sh4eb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4e8f6a0b76adf566aebf369d14bc6c24acab0c32 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/58070d0c6626c7731f699220ac9b7fa6187e72c6 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/220765fbd1ad6ba0356323184c294f292a642d0a |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0d3125009b2b7d7a32ec0340ac3c29400fdc7db4 |     
    sh4a     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/29739a286a094156d3ace5d5904d6a0ed21a40fe |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/582b0355120a50274b9b8b69042f686a68438102 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc6842fc722bdb3786179bcbf88956c03f845a07 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc24fe97096e196c2f286db4cdd0d64f0df9e9f6 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5a9d970d8f8ea0b4a9d3cefbf6fa86ae441225e9 | ORPH
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/67190354801406af7cc76ec3fc526b56a9a3c059 | ORPH
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/6bd13380205779727d26d004d71a286514dd0f39 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cf0c864e28323d2812e22d7e947b93b0acee5dac | ORPH
    sh4      |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/f1b80fa915778228850dfb94e11549462fdb3a07 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b9dd1fdcc7aecb28f0f36da440d7cb7d1c2442c0 |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/a596eabf4efc3ff7648b52ea39b98234b7a33305 |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/ea209145884874cb694246e8bcbe6a92f44c5eca | ORPH
   sparc     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/d10ae1b8b095cf355015f76ab870cd5a624850c4 | ORPH
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/2a4c48321d55194f8ee43ca2271f98838c9969fe |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8e25175dfef04a8478120d363b3f573f5e05e936 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ae35b5111563b3910ea80261bc41aebe73f78d46 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/19ba60e90384eac7bf34f1fbfaea9c27e71fde62 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/90c8a1a989e8e47fa85e98c12c6c17d091f35fef | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/72431d505f575de2ed6ab59fa8586fc94eb134fb |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/f803d1bf5dd65d45f18a0b14b011b9dd828700ea |     
  aarch64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/372478c001c37522db5942cb87f4ee9cef47c38d |     
    arm      |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/1c1af8839f16bf9896cf047b5974ad4f9ec7431d |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/9ba779a47c5a9e80afcd7c03859c3ebaf6e2a760 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/dc7fd939f23a51fc095dc8ed39bb06ed452500f4 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/10ee872b5df65c5c5a9b8579b28c7fef9dba9128 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a290ed83818acfe78f9759f937a1f98c212eb82f |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/5b98690395e53540f9538649fe2886c34d633070 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a77d4ba55d878a45093f1cbd44c93a59a17ad4aa |     
    or1k     |         libgeos-3.12.0         | NOK | http://autobuild.buildroot.net/results/0437103f140d995d31c0c069cf01447328d8f798 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/440b2c279c1085ac56b4832331db59d993619f48 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/16e74e523c7409489e156b0e2aea634ad7317aea |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/07500d6460842fdb801863fd143f24f698705828 |     
   mips64    |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/f14f037b524786009680e9539b5b021078cd612b |     
  powerpc    |      libpam-tacplus-1.7.0      | NOK | http://autobuild.buildroot.net/results/d67386a54f4066458488517473271aa42c62332b | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6e24883d077332c266bb690bd144323589f0285d | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4f8b8bebbf75a48ff1d720e2f5cb718a3fbd5561 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4266b81233848d94a628b11ae462b9ccfb41f2ab | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9d6278f603ddc5d665e7c217103a9f002acdb7da | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/99df946f0793dd8451f35d6fd9d68d3ac06c037d | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/328c92538cbeb29c58591e6a59046d1612a78292 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0b0296f4af95d3b4c06bd9105fe7151240dcd283 | ORPH
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/76216b5e7b6a868af154000a3d5655b1c5cc4760 | ORPH
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/815a8fd72031f10340fc3df9b0dc3011b9b48f13 |     
   arceb     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/97d284ace47bf710883027513ed80892c4dd4e34 | ORPH
 powerpc64   |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/2c18de537c1ad0f92cafd28e89499ec7121ae1c7 | ORPH
   mips64    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/441953da9b07cbe76552411bf1f8afd210180c3b | ORPH
microblazeel | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/97148acf890d3e5f56327d6826f8bdb84f6b1ff7 |     
   xtensa    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/257056175aa304046645cf06041c69a4a198e638 | ORPH
   x86_64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/910c59445e060bafb972cbd378fd6af32db2aec1 | ORPH
   mipsel    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/6df1fb77632b5885c532e5a43859bdb46ae29301 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/eefe58dd1100e0d2aeb3b657c39a3b9dc3ac4646 |     
    i686     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/bf702171469c64eff4c062e23be38e792e942fe6 |     
 aarch64_be  |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/0ba70c58de5bcd123af0c577c09c182d6a1a2813 |     
 powerpc64   |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/94f5db1d4bbcb8465065df00bbd12151def4a47a |     
    i586     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/11c3fd04115306aa4ac923dd9b6fd87870b7fc8d |     
  sparc64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/2c20f345950994236ed50137465ea0de70ea4099 |     
    arm      |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/7d237d941b890d8b1eac49fcfc4c9f0e8bb6df7f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f9f93fd3e297e30968d733068ff4ed7c7fb411cb |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f9656a5e2aabc9a4a59efac31091e86b9f002075 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b5887e578a2f2e713e7cd7e3fa33a61eee25e60f |     
 aarch64_be  |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/8e7f08baa40fcc8c2b7e85092a22cfcab56df9d8 | ORPH
   arceb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/ae3f459136e827268d54bf8f733e5b57ecf15a5d | ORPH
   nios2     |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/7c928f3754845d7aad8fbd6311fd2e7274203fb6 |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/23810c2d39866efc5e247dd22f1f897e5e53a235 |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cc57712f05ca6ca51b70dee5f2a8a33f6aa1c02f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 3 
                   bird-2.0.12 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                  kexec-2.0.25 | 1 
              libsodium-1.0.18 | 1 
                  linux-6.1.61 | 1 
linux/linux.mk:642: linux-r... | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/28eec775ae27eac67e36ee984261399aa23598c8 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/70012946d3425f77d68c5ea6e157dd5d9f03c2f7 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e2ee3464654c1b1be85e29f2b40adb9a3b32032f |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/13d9d7329f517885cc7f8340fb1fa6498535cfcd |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/b0bcb4e46978fe152c2cef877511bde35b2eb47e |     
  mips64el   |          linux-6.1.61          | NOK | http://autobuild.buildroot.net/results/869d32ceda8c1daddead9acfd6982f7f85eb5dd6 | ORPH
   armeb     | linux/linux.mk:642: linux-r... | NOK | http://autobuild.buildroot.net/results/4acb2b6e6799e69fb3f83d853b3182ddac4aeaf3 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/34a07876fea01a98df7a98a79262b15c4e297f49 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/75603ec875d71198dceec096eacd480a350afa46 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d6ea7dc02591962701c69d40a008db8ade4eba6 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/37d21a81387f76a023bdfe589eca2847042a0e2f |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              e2fsprogs-1.47.0 | 1 
                    fmt-10.0.0 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
               libglib2-2.76.1 | 1 
                 ntpsec-1.2.2a | 1 
                      tar-1.35 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/6c1712f0140581f022f895a9f178192e11473c27 | ORPH
  mips64el   |           fmt-10.0.0           | NOK | http://autobuild.buildroot.net/results/2d2b3f1650e4af6c8235d582f5e03735eb63213d |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/65b02c06fc27334357a7c94eb91e4a7b29fc0144 | ORPH
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/173de50c1b9d45888b66d13e866d40de1cbf155a |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/12f58c4ee42bdbba5caf29a9ed5764ddf1b93cec |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/42dd56db6493d82018a11904fa5f4dae80f99c56 |     
 microblaze  |         ntpsec-1.2.2a          | NOK | http://autobuild.buildroot.net/results/728ed6142f0b224ed9788444a6aa7d75ebf2ecad | ORPH
    m68k     |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/20a2adc237586910de7ceaeb134f562e5f3b54a6 | ORPH


Gitlab CI results for 2023-11-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968424  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968428  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968431  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968435  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968440  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968441  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968352  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968337  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968666  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968507  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968531  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968481  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968487  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968493  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968690  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968719  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968693  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968722  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968815  | ORPH 
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968820  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968823  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968830  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968891  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968894  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968971  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968922  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968932  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968933  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968938  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968941  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968945  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968955  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968966  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968967  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968973  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968981  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968985  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968989  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968993  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968996  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518969002  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968359  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968382  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968497  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968364  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518969027  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968342  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518968343  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518969044  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518969045  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5518969046  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
