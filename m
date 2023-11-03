Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05674C4167B
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 06:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F090A6F529;
	Fri,  3 Nov 2023 06:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F090A6F529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0JNK3oEBlnS; Fri,  3 Nov 2023 06:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A915A707A7;
	Fri,  3 Nov 2023 06:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A915A707A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD08D1BF340
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 06:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673104359A
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 06:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673104359A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEY3Vp0FDbfd for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 06:36:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A50C435A4
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 06:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A50C435A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17B661C0002
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 06:36:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 03 Nov 2023 06:36:10 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231103063617.673104359A@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698993370; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LtcRD3G6dJGbdKOUAPPDqFv7BYNtnP47eTCeivwWHtQ=;
 b=HqdXO2zTaPwfk1yMYMCdS1iEf26T31zjnE5QVL9qBAcmyC/ronvdGQxUsbhY1JrrQqSxGR
 mduq+oQCXvA4wQI6npR+4aZYlyQtY4Uj80NJ3sMzWAJmVeInF6YQ7k3GVJ9/m6mygj6POf
 an4TeFWR/EEVqSeGbvK3pWHO4WUrlYpoeEg4/7Yr18G5Ys7IP1uY5QhpWe435tDYCAaUQ+
 cn/prHGUvQKZT0VrvDHYxwSSq3MPhN30CiI64k2k8JxXl1RN4peFDLG2BIJ98roukPn4Al
 jj4oySdxJFPChLA0DNqHBbyZe+gb78PgMho8fbXZ0jv/JcjVE1UAVkx74HBJ2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HqdXO2zT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-02
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

Autobuild statistics for 2023-11-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  9  |  0  | 17  |
  2023.08.x  | 12  |  9  |  0  | 21  |
    master   | 46  | 54  |  3  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
              gcc-final-12.3.0 | 5 
                flashrom-1.3.0 | 4 
                   bird-2.0.12 | 3 
glibc-2.38-27-g750a45a78390... | 3 
                elfutils-0.189 | 2 
         gobject-introspection | 2 
              libarchive-3.7.2 | 2 
                   openrc-0.51 | 2 
package/python-tftpy/python... | 2 
                    atop-2.9.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                    crun-1.8.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 dtbocfg-0.0.9 | 1 
                flannel-0.14.0 | 1 
              gcc-final-11.4.0 | 1 
  gobject-introspection-1.76.1 | 1 
              gr-osmosdr-0.2.4 | 1 
host-gcc-final-arc-2020.09-... | 1 
                host-go-1.21.3 | 1 
                      lft-3.91 | 1 
      libabseil-cpp-20220623.1 | 1 
               libglib2-2.76.1 | 1 
                   libmediaart | 1 
                libselinux-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     linux-6.6 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    ncmpc-0.47 | 1 
                    pppd-2.5.0 | 1 
    python-cryptography-39.0.2 | 1 
                    strace-6.5 | 1 
                      tar-1.35 | 1 
               valgrind-3.21.0 | 1 
               xwayland-23.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           atop-2.9.0           | NOK | http://autobuild.buildroot.net/results/8782cf4f39f3311bf8164764b9e02c061c94bb9a |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/192598e277ea84134a76a7ca5685858777bc49ea |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5311d9f46b90fd1fa0e58798c423ec4bebe59565 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/edb01ed39449005969955c84303c29d8f197e977 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/53ab12a5ffca1bacae2dd4820778170649519b8f | ORPH
   arceb     |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/3b0202346c1b47aa429f39fde439c2cf0739f78c |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/7d113c85d9491a7fd438b2ce1c1a50fb4bf574b9 | ORPH
 powerpc64   |         dtbocfg-0.0.9          | NOK | http://autobuild.buildroot.net/results/e5bae7fa5558801c39f53a4a15ac550c3855322e |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a98f94640791a7208f802772c8dc08faefbaca98 | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d59ec4404381cdfc7d2e07041fa1fd2a4a45200b | ORPH
   s390x     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/59f915d95ab8c71c3ff62d852c9e95b99fb5d358 |     
   mips64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/e2a22a8468ecbb5d727fc9f0a60f204860faaa18 |     
   armeb     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/067960b73048cfbf215ccd2a820b0c485717d079 |     
powerpc64le  |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/2d750aafdacd0cb2b05c353901033edbfdfffb2f |     
    i686     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/1b2072257144e91356da34759e468a04a57e9321 |     
   x86_64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/c44e6768890bd7b7b86103cc0138b8e171c52236 |     
  mips64el   |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e2b13aa45b10f859ffea0c895986390bf69e8a57 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/78ca736d1951e32d4047dfb8a6b9d35d4bc23d05 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/18cebcccbe52b0c5a7cf2ef00bce7b885df4094c |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/c4231b7e4d020da696a138ae1f848c70f771140c |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7dd8474cbe6d4f9d479e066ae18702cf2e7d7f02 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/23d198c5e9d04c4f8326610ea1cffe3d9784d304 |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/9c7ae2e0bc795a65cb50b3c92d11a70ecc1b935e |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/213e351972376ed074fb11c758d96c45fd8fc057 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8e8e310a9fb1be8c18cc6e7189fe98d401caf74d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/03e1eac5426878a7654447967d0ce1d3c7d7c371 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5eb5a758fc271855ca7903b5a9050a346bc84653 | ORPH
   x86_64    |        gr-osmosdr-0.2.4        | NOK | http://autobuild.buildroot.net/results/8d6fbdba1fbdb0fbc8d738b5c76f8eaf44754499 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/abf76d1835b72a7765090c3f82687cde991f46de |     
    mips     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/1a79d9e5f8c792ca1b960bda32ca2da63c9235b2 |     
    arc      |            lft-3.91            | NOK | http://autobuild.buildroot.net/results/7675835f68df098c63fd4d91b0eac90777ea3f4e | ORPH
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/f508cfe67cced4c0a18bfdf20efe18ab6bebbbee |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/80c2941d171df86e643fcd4cdb9d133b33cf3add |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6101911ee7fb487ea0da5e3a78c93b9207c96ef5 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ed5e9f0684486f8b556bcacb34493ac7ecf06057 |     
   nios2     |          libmediaart           | TIM | http://autobuild.buildroot.net/results/017f3fb0b92a1978114302726b385609e808fb88 |     
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/7feee092fb332320f811d2fdfc086b6bcd5dd057 |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b7e07a425865a64dfb5db9c90a777f292b88889d | ORPH
   arceb     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/16c761935b3636cbafad7ab0e736fcb22b846f20 | ORPH
    mips     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/a3a5c46e8562d3f091a9b4b205322168fbf9d16b | ORPH
powerpc64le  |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/3d0ba0162026b5b7c97b3dc45e36e4516886682d |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/0bae1ea05d80db57d446419f6197de2137997bf1 |     
    mips     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/e14996832eb953907a37db6d81a1296257482ae6 |     
  sparc64    | package/python-tftpy/python... | NOK | http://autobuild.buildroot.net/results/438d38513732ba011e3670116e400a5eb8087588 |     
   mipsel    | package/python-tftpy/python... | NOK | http://autobuild.buildroot.net/results/9e12e0cd81bdf1a09884a340ca809c194e4dba9b |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/100527b728fca43ce8adfbc607967adb8a3717f4 |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/e23cf85608d159308952d48c375773ce24bbac0e |     
microblazeel |           strace-6.5           | NOK | http://autobuild.buildroot.net/results/da026b8307a4ef1406d2c90d42564df38a172a50 |     
  aarch64    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/f00d438205fa95e8107dfb8f691a736385d7ba4d | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3e7d5ca6c2c7e2d5b3dab9e67e5d01d0539a3cea |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a879deb9a1d846fd0eb8ed715b5cab9668dbc730 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c0b6923acf10d2ed28e2529dd06b6ac122a23469 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2cc58f367ab19208c2bcb7a3d55e07a3f2dca594 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/43619f93ae07c7c16064d4f9f0a934691d073bfc |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b8cde4e0965b0bfef6c70090131a24e128bbe55 |     
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/6ef993770c8c1b990a641512d4b334d61d5a40f2 | ORPH
  sparc64    |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/d85b71d6c1022e46bcb5a77384d6a55396d8e69c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             containerd-1.6.22 | 1 
                elfutils-0.186 | 1 
        ltp-testsuite-20220930 | 1 
                   luvi-2.13.0 | 1 
         nftables-python-1.0.7 | 1 
                   perl-5.36.0 | 1 
                      poke-3.0 | 1 
                    vlc-3.0.18 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       containerd-1.6.22        | NOK | http://autobuild.buildroot.net/results/9ec2dfcffe147d3bb459b6c298cf9cdb2cbbaee6 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e3b795952f35aedc8edcff55c385ab7926cd8293 | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/be6768b1c5834700068c9d70b48e8c9c7be92411 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/997c48e694c2ac4fd901bf4b6a0d3041255c4334 | ORPH
powerpc64le  |     nftables-python-1.0.7      | NOK | http://autobuild.buildroot.net/results/fbc5cb64297690ecea481f568a02b02bd5102c7f |     
   mipsel    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/128140b8beb7e6894b315bacdbe427b362eb2f6e |     
  riscv32    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/e3509219c81e11f5a28ae3b61d86a2f9a04ac290 | ORPH
   sh4aeb    |           vlc-3.0.18           | NOK | http://autobuild.buildroot.net/results/c42a761cdd5b3aa978600419a0a4dfe7e469650a |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/14f3232219306cb365091f5bb6982df32bc710a3 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                elfutils-0.189 | 1 
                 fdk-aac-2.0.2 | 1 
  gobject-introspection-1.76.1 | 1 
               host-go-1.20.10 | 1 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
                libxml2-2.11.4 | 1 
            python-sip-4.19.25 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3bc8c0f5ab014090187614483b3ffb6afa63d9b2 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5bcbd2be38181691fdc962b3d802a9a08a5f7433 | ORPH
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/cddf63614b47ad2aea32e9f9dd81616d68e3ff01 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/15f74f3ed10b484dc16aa0eddd71f93efd31d564 | ORPH
    i586     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/dafc785ef295f979356151faef7491c22feea066 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f4322054e494e50a7626372ce4f4721ef0e67761 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b4020b59406f926a2f02e1f4fb09a07601cc84ed |     
    arc      |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/8ea40125660a2b49b7f6d8c4cd8012544d1c009e |     
    i686     |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/212b9be476e9c9a8caccfd01b1aa084ad5a27d08 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
