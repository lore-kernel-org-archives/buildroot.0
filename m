Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AAEC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 06:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50BBD812CB;
	Sun, 26 Nov 2023 06:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50BBD812CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fr6783RiLyrI; Sun, 26 Nov 2023 06:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5132C812D2;
	Sun, 26 Nov 2023 06:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5132C812D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2FF1BF59D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 06:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 813734028D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 06:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 813734028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrz_fgnf62zg for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 06:45:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 888C0400AB
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 06:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888C0400AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94773240004
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 06:45:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 06:45:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231126064550.813734028D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700981144; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o+HiUtpKA/PXCe4Bt8PD1goKNODtehiCsgFbNlPbzT0=;
 b=SnW8QPW065Us4kiZANlasSPZ7TEiDMLmPausV7J1HQud6EtVAglB+eP1vKzfiZeFZfurYD
 0s7nc/fcIBXI7dsfOwkLjGhSy1UdbWZFxEHqnSTyqUhQyxR+eVulCysisg7gKy9xDocgft
 9sfyzZD95Z8vQrihH6TOeyVWXBN+flfwOBASjJ6cKeI/UqcqDWkm3ZQnEtEXirVuayy4oD
 JKqDm0hk4kqxBk2sEI3ALGqyKL05mW6oW4/sc9kuidonHB7hDcQ9BC5c8txCa8sIVujDS3
 qMu7UBTv170yqcVqzAJFL44G1+RSxGmRpynJLU7B5Gex0BqkgHh6cjuM92X/IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SnW8QPW0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-25
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

Autobuild statistics for 2023-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  2  |  0  |  3  |
  2023.08.x  |  6  |  2  |  0  |  8  |
    master   | 53  | 51  |  2  | 106 |

Classification of failures by reason for master
-----------------------------------------------

          python-msgpack-1.0.7 | 5 
              host-rust-1.71.1 | 4 
                elfutils-0.189 | 3 
  gobject-introspection-1.76.1 | 3 
                libressl-3.8.2 | 3 
                    flac-1.4.3 | 2 
                   openrc-0.51 | 2 
                tpm2-tss-3.2.2 | 2 
                       unknown | 2 
                busybox-1.36.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202308 | 1 
                        ffmpeg | 1 
                     frr-8.4.2 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
             gstreamer1-1.22.6 | 1 
            host-erlang-26.0.2 | 1 
                host-go-1.21.4 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
                  janet-1.32.1 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.76.1 | 1 
              libostree-2023.7 | 1 
               linux-pam-1.5.3 | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                    php-8.2.12 | 1 
          powerpc-utils-1.3.11 | 1 
           python-numpy-1.25.0 | 1 
        python-pysensors-0.0.4 | 1 
                 samba4-4.19.2 | 1 
             strongswan-5.9.11 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/334901fb8b08958efb0f95c7a9b4ab6cd379bf18 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/3f2791d6270369bb230c0183c16951a43bc86b45 | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/21c2c35b1f94e28c5299a29e74bccbb45b02e8cd |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8cf651a9283fe3e0cfc14749ca9abc629ee71fb5 | ORPH
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/87ad4cbb13b3daeeb1669d1ba6464a318ce42114 | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c96fc851cf1208339a2f795af15a3c59c02ec143 | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/773d274812c7e22cab5f2e7e9cdbc1bdd2c25b1a |     
    arc      |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/eead8987a72b634a6afdf6a26d2095281d799188 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/da11a316ad253c2f554c585a6c59e07285e80cda |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/04e27d44ebe86ebc3b73df510a97513c70aa62bd |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/faaaadc5bd4502c78bb84e9be2294284a368a4f2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/08f2dccae7af326ba9e07ea6a9b205f47fd07bae |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a50bdf3ffad743f3dbe583e106f40566881b6986 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/38ba987607d30ce9c99ddc7b8d027de83c67ba6c | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/08fc6eed4b7f4302ec2ec189b05841f4a65f47d2 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f4d11b498e1ba6be066ac059d82c45b51e109954 |     
  aarch64    |       gstreamer1-1.22.6        | NOK | http://autobuild.buildroot.net/results/c9a1f84121a9cad3c083ba17dbaa74168538e488 | ORPH
    i686     |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/86786562f4c304eef92e7e855569736c2a98b539 |     
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/cc9eeda92f6b3caa86966a92d08c9de10743aaa2 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/71904444034acccbfb5f94d8fbf6282229258b80 | ORPH
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4649704cfe07d52bd9c52b9e68a8a4c359dd55e3 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/6e8c33a4d72a449eb7787838d7187d56cdd12e83 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1ff533fb1bdfa35a619b36e7baf749536c176a8c |     
  mips64el   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/afa6563691293624d7b3b0cdfca6280bf05acddd |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1214a796c414acf980863b9e3e743d0ecd714a99 |     
  riscv64    |          janet-1.32.1          | NOK | http://autobuild.buildroot.net/results/17f8353aa6e1b47824f6c20110d3fbe5e66a57f6 |     
    mips     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/6684b0a2785668f26ba3e3cfefd997f257a6c3e8 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0118e14ca0362f50206987d51e028eb7c8223475 |     
   mips64    |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/479ef703132a8319884b252c9b3d597b41ef467b |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/947cadb9fef22bb1c185b65fcf991a2c076ae019 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d70b3063bad38d3e0e85217f21e4d33bc9f319d0 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1ad81330cbff63ecf6c69a0fba994c5d11f5226e | ORPH
    arc      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/59e0abe6929066bde705bfe42654b897fba1f3bc | ORPH
   nios2     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/3b7c705673790348f5ba4ed1e77022e257e98e70 |     
  aarch64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/5e19c6eea27a49af764be418deda932edfeddb81 | ORPH
   arceb     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/54d8c9213afa1b72ae7753595f4bfc981453d16e |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/66e38058ab90950366a077148557daaddd603d79 |     
microblazeel |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/b64af3cdaa7517c966444e32fe4d7586348fed9f |     
powerpc64le  |      powerpc-utils-1.3.11      | NOK | http://autobuild.buildroot.net/results/12af6dc9e3fec1f5a6edafb6f1aa009ac5ab8e17 | ORPH
   s390x     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/638d6ab36311448fb059b6a833e43e4d550bf5d1 |     
 powerpc64   |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/d81923fd41d303640709b5d3422124ae1e4d877a |     
   armeb     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/8c271c25f5e13ba82bf67bb2a1d2850199cedf2d |     
 aarch64_be  |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/c3243553caaec44dded995930fcc34773658ae3a |     
   nios2     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/c6ad4656dd487aa04e35fb25b96cd69dc7c8ec56 |     
    i586     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/1ee9181f3f59f09dbde0fc21002c2ee4cc44ee21 |     
    or1k     |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/589f8c2ca0706fff1107e13ccfe1c8a1f07b7b15 |     
  powerpc    |         samba4-4.19.2          | NOK | http://autobuild.buildroot.net/results/49d185dc7c3ec2e6871faa73e53cf1b0e5901e2d |     
  mips64el   |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/e0e8d4d690c366104f93eebb9743c0f62dce5ea9 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/883e8f51d1c685be7f6c67bd81013586dee715ed | ORPH
    arm      |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/eaa53f258d63f2ffc37d71b114ef95e851e2c7af | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4de4ce4f26d51f39a5d487c2b77b68092b7d2758 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e2b6e7bec660d7e1273dc50c697fda626f3a69d3 |     
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/5783681ecbb89c7bed46391ccda8b588129bdcd6 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 2 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c71ef9e168c6d8ceed54759b880249fa51590e52 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dd8e53b587555a62b76833a8b883cee6b7b93b9c | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 2 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5c31d460816ffe19e89a605d204a0b65fc6b77b2 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/6dce1cde1498969bcf5d95cb4a9ce77acc62f3c6 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
