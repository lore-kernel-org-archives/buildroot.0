Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB6C001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 07:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2104960AA6;
	Mon, 31 Jul 2023 07:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2104960AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ro3PwWl04G5u; Mon, 31 Jul 2023 07:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F09760AF0;
	Mon, 31 Jul 2023 07:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F09760AF0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5481BF3EF
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 05:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B10174096E
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 05:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B10174096E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcA0yn5TNR6N for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 05:36:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D14F408DF
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 05:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D14F408DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 227D6C0007
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 05:36:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 05:36:04 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230731053612.B10174096E@smtp4.osuosl.org>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:56:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690781765; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8ediYzs5GsBLrBhCIJ1h5gBslt5oMOGoC7t5rRuAFEE=;
 b=c8jPcQvDga1eO/de/Fnv2TqRJn2UZxBm3i69yWG/UAiizJk5AqrCVEwclus8Tb5PCV1d2t
 fHneBBZtYydp7RFhskXHmgt/6Vs6kEDKpq/owjEEFqZBC1m71yZK6Mr7SaI5ZCRH/JZWZc
 m7fBcLqU1yYVJ9hKHRsa1oiE500J8xm67LD5JbfDjR0PR18qAybfTIj/+q84oqpuAf4lgk
 u6DS+MpgWrOdfVJ2DdDGxOAVnCU9aqJ+hfDKm7IpG9Ohf8CFMLZosPW485o3Hyfbuh3QV9
 ruMwR/gKk+7o4ararQjCR9vW83GEcdS6jfNv8uVK22yOrcPmZyyoVnmj8YYs3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c8jPcQvD
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-30
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

Autobuild statistics for 2023-07-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
  2023.05.x  |  4  |  3  |  0  |  7  |
    master   | 69  | 49  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 6 
            host-binutils-2.39 | 5 
                    mbpoll-1.5 | 5 
              host-rust-1.71.0 | 4 
                  check-0.15.2 | 3 
  gobject-introspection-1.76.1 | 2 
         host-sentry-cli-2.8.0 | 2 
                   linux-6.4.7 | 2 
                     lxc-5.0.2 | 2 
                       unknown | 2 
                bitcoin-0.21.2 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
             f2fs-tools-1.16.0 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                haproxy-2.6.14 | 1 
           heirloom-mailx-12.5 | 1 
                host-go-1.20.6 | 1 
                  libuv-1.46.0 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.3 | 1 
        ltp-testsuite-20230127 | 1 
              open62541-v1.3.6 | 1 
       python-stack-data-0.6.2 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/8aceefdb71814c48163d7b171783172b6e1fdf27 |     
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/d36ec76e2c63d90e6e547543eef87f1e1db499fb | ORPH
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/36973d88c31b6bf73e0c6e7eb1ab77116748d618 | ORPH
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/8334bcc5e56345d380e276075d0fc629953dee5f | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/96aa74631c17b65f153413ffbb8a17c3fc11273f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/223084d90913606a360fe7e7b73847a3a5d58f4b | ORPH
  mips64el   |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/fff8b5bcaac7d882035c318400c082bb27fb4006 |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/2328057d40783f7534dfd168c3156439f8844c46 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6e730dd40ae677e139e2fa6504d340c439cff2cb | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a180757807d961cf3e5809a5bb9d8a8045ec19d7 | ORPH
    i686     |         haproxy-2.6.14         | NOK | http://autobuild.buildroot.net/results/6d7cfec365f0eae016988aad1bd528e2da5a390b |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a4cdb4ff7190f6f822bb500b312ea696e2ccd8c7 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f077ec588b395102ad501a18c85d5030c0765031 |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2b9953849967094b20174f1f46dd7156b60eeaa0 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bfb0b2c41a516141aa27475dc4ed481ca18b05af |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d76c82a6f438e69b7afa40eee2c79e2856ebfc0e |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a340859644c0f0cf7f7ba7df8cc463aee33bacb8 |     
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/0c1a57745f99ff157ddcf1f3ea1668a69b2d673d | ORPH
   sparc     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a8177173d90fd81893931c80497c0bf500d6c5a0 | ORPH
  sparc64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/62f4e9990c1be111aedd5a7c4c5bcb1cdad25765 | ORPH
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/cade9c37a5834c7712e807e0c41f33b682703b7f | ORPH
   sparc     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/3c30ed86e168e2b03994aee9b78e9dc76ab4884a | ORPH
   xtensa    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/3b3bdc5bc80d715d03427b0c4250758dc29bce22 | ORPH
    i686     |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/cee92aecc01710c698e0962c219b969e236ee45d |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/9a21440fccc7bd91e011567567911a5eb5119223 |     
  powerpc    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/722dcc448388504202c86bd302c609d53df8a2e9 |     
powerpc64le  |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/b594cb80e032b3897aca8e035f35bf2f9303d125 |     
  sparc64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/e86284ab38ade08115c9827a8acfe9d5bd34f768 |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a41f19a5ab1b74f3ee47aecdd00b57c2d1b68bcf |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/025e65fedc726ec0535182cf87436655d163953c |     
    or1k     |          libuv-1.46.0          | NOK | http://autobuild.buildroot.net/results/ba4e8547fdd0092a35ceb9f36114be51916881b7 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8fdc19cc28a1f486ba4765a3bd1f7987ec1625d6 | ORPH
   nios2     |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/dfb3ca93062740cf68ddd653efc0c30dd93aade3 | ORPH
   mips64    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/78d2377d7c8ab8455abda361e6b812462dccc7da | ORPH
    mips     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/1d96d4c57969536c14340ae5542e62a9459246f9 | ORPH
    mips     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/141393371cb6502db345e7e598b9e3ec3ae71e0f |     
    arm      |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/eac16c37053678543f19bb301aff089e3dd417cd |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/0b2a6a17196f0a0db26cf3f4d4cf7e538cc6a11e |     
   sh4eb     |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/21fbc7edc143d8e66eafc1b8c63e8978012735d6 |     
   nios2     |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/6e92343eef507cb8dd43bbe82355a7e64883f479 |     
 aarch64_be  |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/2f819871a89cb2a2df239b1f879c1babcdd022fc |     
    i686     |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/d959927e55622cd4693d05679848e41ce8970586 |     
  mips64el   |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/605f7d4e3d5d6a68e8445579a4203ac06e3a377e |     
   nios2     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/a3e8345eec01b0738eab8ba481fae7a7190ba945 | ORPH
 aarch64_be  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/440222df3cb2cc1f81195a8099d03d39230b8739 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/79005cff1b70fee5b52d4dcad54473b86cafd72f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e1388144eb293601a17a48547ce80b2d918cc0f |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1fd8d97e0f514a65eb6a4723e49605073c9e3824 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/561e0d49dd4f561e78f9d9089c7e92142c777753 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
               libglib2-2.72.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dd976b004af7f1a61dcbebae999035d98190a780 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fb35e04848a6822426dd363bc020feaf13dd4814 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

         host-gcc-final-10.4.0 | 1 
               host-runc-1.1.7 | 1 
                   json-c-0.16 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/200c6a1709e982dbbfbc534ddc4e43b60ca3fa24 |     
   sparc     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/c547174da74408f582f9308d4d1ccbf0f3d46962 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/b44ae3444b5d11c5e8e1e69222d8f181c6c4d2b6 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.1.1        | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.8        | 1.1.9        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 44.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2023.1       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 13.0.0_r66   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/00095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 12.6.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.29.1      | 20.4.0       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.8.0        | 2.9.0        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 102.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 7.1          | 7.2          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.1       | 1.11.2       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.4        | 2.0.5        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.38     |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2023.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2022.3       | 2023.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.8.2        | 1.10.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.71         | 1.73         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.2.94       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.2        | 8.2.4        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.2.94       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.2.94       |     
                        bento4 |  DISTRO  | https://release-monitoring.org/project/241638 | 1.6.0-639... | 1.6.0-640    |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.6       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.39         | 2.41         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.13.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 25.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.19.3       | 3.1.1        | ORPH
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 6.5          | 6.6          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.3.3        | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.25         |     
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 2.3.1        | 2.4.2        |     
                          cage |  DISTRO  | https://release-monitoring.org/project/21171 | 0.1.4        | 0.1.5        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.8       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.10.4       | 1.0.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/07680 | 3.3.1        | 3.4.0        |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.3.2        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.5          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                      civetweb |  DISTRO  | https://release-monitoring.org/project/21329 | 1.15         | 1.16         | ORPH
                         cjson |  DISTRO  | https://release-monitoring.org/project/21330 | 1.7.15       | 1.7.16       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.1        | 1.1.0        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 16.0.6       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.1        | 2.3.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.16.1       | 0.17.90      |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 16.0.6       |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.22       | 1.7.3        |     
                        cppzmq |  DISTRO  | https://release-monitoring.org/project/18648 | 4.9.0        | 4.10.0       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.8        | 2.9.11       |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.4        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.8.4        | 1.8.6        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.6.0        | 8.8.0        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.6.2        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.4        | 2.4.6        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.8.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.1.0-1      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.12       |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.5     | 0.5.12       | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.8          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.20.2       | 1.21.0       |     
                dfu-programmer |  DISTRO  | https://release-monitoring.org/project/328397 | 1.0.0        | 1.1.0        |     
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 10.0.1       | 10.0.2       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20230209 | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.20.0       | 2.20.2       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2023.1       | 2023.2       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/07454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 057          | 059          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.23.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.6.1        | 1.7.0        |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.8.1        | 0.8.6        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.1        | 3.1.5        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.18         | 1.19         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202305       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.3       |     
                       elf2flt |  DISTRO  | https://release-monitoring.org/project/115314 | 2021.08      | 2023.04      | ORPH
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.22b      | 0.6.23c      | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.5.0        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.4       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.5       | 1.11.6       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.11       | 0.8.0        |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.5          | 1.6          |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 6.3          | 6.4          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.0.1      | 2.9.3.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.4        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.2.0        | 1.2.1        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.0       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10         |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.4        | 6.0          |     
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.43         | 5.45         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.35         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.22.1       |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/10202 | 1.2.1        | 1.3.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 2.1.7        | 2.1.8        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.4.0        | ORPH
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/00848 | 1.6.10       | 1.6.11       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.0        | 3.2.2        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.4.2        | 8.5.2        |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.1.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.11         | 1.12         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.1       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.1.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.6.2        | 3.7.1        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.6.7        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.22         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 16.2.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.76.1       | ORPH
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.2.1        | 6.3.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.15       | 3.0.17       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.4.2        | 2.4.3        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.4.7        | 5.4.8        |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.15.9       | 2.16         |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.2.0        | 7.3.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.10         | 3.11         |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.56.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 44.0         | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.6.2        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.22.2       | 1.22.5       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.22.2       | 1.22.5       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.1.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.22.2       | 1.22.5       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.22.2       | 1.22.5       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.22.2       | 1.22.5       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.22.2       | 1.22.5       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.22.2       | 1.22.5       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.22.2       | 1.22.5       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.22.2       | 1.22.5       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.7.5       | 0.8.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.22.2       | 1.22.5       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.22.2       | 1.22.5       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.2       | 1.22.5       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.1       | 1.13.0       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.8.0        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.6.4        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.3       | 0.12.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.51.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.14       | 2.8.1        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.4         |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.14.0       | ORPH
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.0.3        | 1.0.5        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.23.5       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.371        | 0.372        | ORPH
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/18526 | 1.14.0       | 1.17.0       | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.43.0       | 2.48.0       |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-51     | 7.1.1-14     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.11.1       |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 56           | 57           | ORPH
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20230512     | 20230613     |     
                        iodine |  DISTRO  | https://release-monitoring.org/project/01386 | 0.7.0        | 0.8.0        | ORPH
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3.493        | 3.506        |     
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/07555 | 1.0.2        | 1.0.3        | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.8        | 2.1.9        | ORPH
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.8        | 3.1.9        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 6.2.0        | 6.4.0        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.17         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.0        | 1.9.2        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.2        | 1.4.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.25         | 0.26         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 2.6          | 2.7          | ORPH
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.21       | 1.9.22       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.2        | 1.1.4        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.0.0        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.81         | 0.82         |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.5        | 3.0.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.2       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.2       |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.10.0       | 3.10.1       |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.5.1        | 2.6.1        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.2.7        | 2.2.8        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.108.0      |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.108.0      |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.108.0      |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.108.0      |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2022-08-R1   | 2023-07-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/05511 | 20.2-Nexus   | 20.2         |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 20.3.11-N... | 21.1.3-Omega |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 20.5.0-Nexus | 21.1.0-Omega |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 20.3.0-Nexus | 21.0.1-Omega |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 20.2-Nexus   | 20.2         |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 20.1.10-N... | 21.1.3-Omega |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 20.1.3-Nexus | 21.0.0-Omega |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 20.6.2-Nexus | 21.0.1-Omega |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 20.10.1-N... | 21.4.0-Omega |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 20.4.2-Nexus | 21.0.1-Omega |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 20.4.2-Nexus | 21.1.2-Omega |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 20.4.1-Nexus | 21.0.1-Omega |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 20.5.1-Nexus | 21.1.1-Omega |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 20.9.0-Nexus | 21.3.0-Omega |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 20.2-Nexus   | 20.2         |     
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.4.6        | 3.4.9        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.1.0        | 2.2.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.11.0       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.3        | 0.3.95       |     
                     leptonica |  DISTRO  | https://release-monitoring.org/project/01549 | 1.82.0       | 1.83.0       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20220623.1   | 20230125.3   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.6.2        | 3.7.1        |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/01559 | 2.5.5        | 2.5.6        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 3.0.2-1      | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.2.2        |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.7          | 2.9          | ORPH
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.0.5       | 0.1.0        |     
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.2.0        | 1.2.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 2.0.3        | 3.1.0        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.1.1        | 1.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.1       | 1.16.4       | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/07879 | 1.4.2        | 1.4.4        |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.12.1       | 1.13.1       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/12043 | 0.99.9       | 1.2304.0     |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.15.1       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.15.0       | 3.15.1       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.11.2       | 3.12.0       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.6.4        | 1.7.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.76.4       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.6.0        | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.20.0       | 1.21.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.6.3        | 2.0.1        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.0        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.22       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 237          | 238          |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.40       | 0.5.45       |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/21934 | 0.18.2       | 0.19.0       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.40         | 2.41         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.16       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.2        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 1.8.3        | 2.0.2        |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.6.3        | 1.6.4        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.3        | 1.7.1        |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.28.2       | 1.28.4       |     
                    libmodplug |  DISTRO  | https://release-monitoring.org/project/05669 | d1b97ed      | 0.8.9.0      | ORPH
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/68638 | 3.0.9        | 3.0.10       |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 2.1.34       |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.5        | 1.2.6        |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 5.0.2        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.91         | 3.92         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.15       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.3       | 2023.5       |     
                libpam-tacplus |  DISTRO  | https://release-monitoring.org/project/20537 | 1.6.1        | 1.7.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 1.36.0       | ORPH
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/21491 | 4.12.0       | 4.13.0       |     
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.13         | 2.13.1       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.8.1        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.6        | 2.0.8        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.32.2       | 1.32.4       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.0.0        | 1.2.2        |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/01713 | 1.10.0       | 1.11.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.7.3        | 3.8.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.56.90      |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.3.2        | 2.3.4        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.3        | 2.0.4        | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.5          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.5          | 20200710     |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/07908 | 0.7.22       | 0.7.24       |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.4.2        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.4.2        | 2.5.0        |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/01733 | 2.3.4        | 2.4.1        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.22         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.9        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.1        | 0.8.2        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.6.2        | 1.7.1        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.13      | 1.14.17      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.23.0       | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.13.2       | 0.14.0       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.2          | 2.4          |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 0.1.8        |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.14.3       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 9.5.0        |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.33       | 4.4.36       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.5.0        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 5.0.2        | 5.0.3        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.06      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.30       | 2.1.80       |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.9.2        | 1.10.0       | ORPH
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/01817 | 1.4.69       | 1.4.71       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.20      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.29         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.0.18       | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.5.0        | 1.6.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2023.07.24   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 16.0.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.15       | 1.0.17       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 16.0.6       |     
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/21499 | 1.1.3        | 1.1.4        |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.13.0       | 1.1.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.20.1       | 3.21.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/21502 | 20230127     | 20230516     |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.6       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.7       | 2.13.10      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.10      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.6        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.17.1       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/01856 | 3.9.1        | 3.9.2        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.45.0-0     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.13.0       | 2.14.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.21      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.2        | 5.0.3        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2301         | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.2        | 1.7.3        |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/01953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.3       | 3.4.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20220418     | 20230301     |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.0      | 0.1.6.2      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.2.94       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.17       | 1.6.21       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 6.20         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 23.1.4       | 23.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 23.1.4       | 23.2.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.19.1       | 1.20.0       |     
               micropython-lib |  DISTRO  | https://release-monitoring.org/project/21520 | 1.9.3        | 1.20.0       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.7.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.7.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 3.0.7        | 4.0.0        |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20230416     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.12.0       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.20.4       | 1.20.6       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.10       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 6.3.2        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.8          | 7.11         |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.33.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.205   |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 2.1.1        | 2.1.3        | ORPH
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.2.1        | 1.3.1        | ORPH
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.0        | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.36.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.22       | 1.8.24       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.4        | 0.9.5        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.22.0       | 1.22.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.9        | 2.2.10       |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.1.5        | 1.2          |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.24         | 3.25         |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.18         | 2.2.2        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.47         | 0.48         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.4-20230603 | 6.4-20230729 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.6        | 1.0.7        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.9        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.32.4       | 0.32.5       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.3.1        | 1.4.0        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/02063 | 3.1.13       | 3.1.15       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.225        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.41.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.5        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.1.62       |     
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.42.0       | 1.42.8       | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.21      | 0.52.23      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.7        | 1.0.8        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.55.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.24.0       | 1.25.1       |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.11.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.92         | 7.94         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.20.0      | 213123       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 535.86.05    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.5          | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.0.1       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/10861 | 2.1.8        | 2.1.9        |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2.0.16       | 2023.04.17   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.8.0        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.6.0        | 4.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.19+7    | 22+8         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 7.3.0        | 7.4.0        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.48         |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.12.0       | 3.13.2       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.2.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.2        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.6.2        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.21.0       | 3.22.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.21.0       | 3.22.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.21.0       | 3.22.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.1.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.33       | 0.4.34       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.2.94       | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.24.1       | 0.25.0       | ORPH
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.7        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202307       | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 1.9.9        | 2.0.0        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.36.1       | 5.38.0       |     
   perl-class-method-modifiers |  DISTRO  | https://release-monitoring.org/project/06735 | 2.13         | 2.15         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.006000     | 1.006002     |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.15         | 6.16         |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.78         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
                perl-http-date |  DISTRO  | https://release-monitoring.org/project/02976 | 6.05         | 6.06         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.64        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.080        | 2.083        |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004003     | 1.004005     |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.67         | 6.72         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.10         | 6.11         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.510        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4232       | 0.4234       |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/11870 | 0.039        | 0.046        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.32         | 9.33         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
                      perl-moo |  DISTRO  | https://release-monitoring.org/project/03123 | 2.005004     | 2.005005     |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.93_01      | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/06578 | 1.0048       | 1.0050       |     
              perl-sub-install |  DISTRO  | https://release-monitoring.org/project/03345 | 0.928        | 0.929        |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006006     | 2.006008     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 2.004000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0209       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.22       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.3.1        | 1.4          | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.2.0        | 3.2.2        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.2        | 2.2.3        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.74       | 0.3.76       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.9.5        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.18.0       | 3.0.1        |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 3.2          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 122          | 123          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.10.0      | 23.07.0      |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.10       | 1.3.11       | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.15         |     
                          pppd |  DISTRO  | https://release-monitoring.org/project/03703 | 2.4.9        | 2.5.0        |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.3        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.2.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.3       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 23.4         |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.2.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.6         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.6.20       | 1.7.24       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 3.1.11       | 3.1.15       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.5        | 0.4.7        |     
             python-aiomonitor |  DISTRO  | https://release-monitoring.org/project/21253 | 0.4.5        | 0.5.0a1      |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.10.2       | 1.11.1       |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.9.2        | 0.10.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.6.0        | 3.7.2        |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/56566 | 2.0.2        | 2.0.4        |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.1       | 1.11.2       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.12.0       | 4.12.2       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 4.0.1        | 4.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.26.115     | 1.28.15      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.29.115     | 1.31.15      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 4.1.0        | 4.2.2        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.0.0        | 4.1.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 9.0.0        | 10.0.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 8.1.4        | 8.1.6        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/31282 | 2.7.1        | 3.0.0        |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.6.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 41.0.2       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.6.0        | 2.7.1        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.35      | 3.0.0        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.3.2        | 3.0.1        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.55.0       | 1.0.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 1.86.0       | 1.87.5       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 4.1.9        | 4.2.3        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.2.1        | 2.4.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 6.0.1        | 6.1.3        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.19         | 0.20.1       |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.7.0        | 2.8.0        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2022.12      | 2023.7       |     
              python-editables |  DISTRO  | https://release-monitoring.org/project/189881 | 0.3          | 0.5          |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.3.4        | 4.5.1        |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 4.5.1        | 4.6.2        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.9.0        | 3.12.2       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.10       | 4.0.0a       |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 3.0.2        | 3.0.5        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 23.5.26      |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.32       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.10       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.2       | 3.44.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 20.1.0       | 21.2.0       |     
python-hatch-fancy-pypi-readme |  DISTRO  | https://release-monitoring.org/project/274452 | 22.8.0       | 23.1.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.12.2       | 1.18.0       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.21.0       | 0.22.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/11771 | 2.3.7        | 2.3.8-1      |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.11      | 0.13.13      |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 8.8.0        | 8.14.0       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 1.1.0        | 2.0.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 3.2.3        | 3.3.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 3.5.2        | 3.8.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.18.2       | 0.19.0       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.17.3       | 4.18.4       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 23.13.1      | 24.2.0       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.5        | 1.1.7        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 1.4.0        | 1.4.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/20016 | 1.5.3        | 1.6.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.9.2        | 4.9.3        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.38.0       | 0.39.0       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.4.1        | 3.4.4        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.6        | 2.4.10       |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.19.0       | 3.20.1       |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.7.2        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 1.1.1        | 1.1.3        |     
          python-minimalmodbus |  DISTRO  | https://release-monitoring.org/project/230441 | 2.0.1        | 2.1.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 2.0.4        | 3.0.1        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/22813 | 1.1.2        | 1.1.3        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 9.0.0        | 10.0.1       |     
                  python-munch |  DISTRO  | https://release-monitoring.org/project/06177 | 2.5.0        | 4.0.0        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/23367 | 0.4.3        | 1.0.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.0          | 3.1          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.23.5       | 1.25.1       |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.1        | 1.0.2        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.12.0       | 3.3.1        |     
               python-pathspec |  DISTRO  | https://release-monitoring.org/project/15607 | 0.10.3       | 0.11.2       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 2.5.2        | 3.1.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.11.0       | 5.11.1       |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/21705 | 2.3.0        | 2.4.1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 22.3.1       | 23.2.1       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.0.0        | 1.2.0        |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 3.1.0        | 3.2.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.36       | 3.0.39       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 23.4         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.4        | 5.9.5        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.5        | 2.9.6        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.8        | 0.3.0        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.23.0       | 1.24.0       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.10.8       | 2.1.1        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.5.0        |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/05653 | 2.7.0        | 2.8.0        |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.6.1        | 1.7.0.post1  |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.20.0       | 0.21.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 3.0.2        | 3.4.1        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.22.0       | 1.22.5       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 1.0.2        | 1.1.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 23.0.0       | 23.2.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.1.0        | 3.1.1        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.12.0       | 3.13.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.9       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.7.3        | 0.7.9        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.7.0        | 0.9.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.64.2       | 1.0.0        |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 7.3.2        | 7.4.0        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.21.0       | 0.21.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.0       | 0.24.1       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 24.0.1       | 25.1.1b2     |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/20011 | 7.3.1        | 7.4.2        |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 4.5.5        | 5.0.0b4      |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2022.10.31   | 2023.6.3     |     
      python-requests-toolbelt |  DISTRO  | https://release-monitoring.org/project/05665 | 0.10.1       | 1.0.0        |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/62048 | 0.8.0        | 0.9.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/66067 | 0.17.21      | 0.17.32      |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.6.0        | 0.6.1        |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 1.1.0        | 1.2.0        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.8.1        | 1.11.1       |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/05645 | 4.9.1        | 4.10.0       |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.13.0       | 3.0.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.12.1       | 1.28.1       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 21.1.0       | 23.1.0       |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.14.3       | 2.0.4        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.18.1       | 3.19.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 1.3.0        | 1.3.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.7.10       |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.7.2        | 5.8.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.3.2.post1  | 2.4.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.4.42       | 2.0.19       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.3        | 0.4.4        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/07314 | 234          | 235          |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.3.0        | 1.3.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.2.0        | 5.5.0        |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/10198 | 2.2.0        | 2.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.3.2        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.64.1       | 4.65.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.9.0        |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/17451 | 0.22.0       | 0.22.2       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.10.3       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 22.0.0       | 23.5.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 4.1.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.3.0        | 1.3.1        |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.8.0        |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 3.0.0        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.6        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.23.1       | 2.24.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/24711 | 8.2.0        | 8.3.0        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 1.4.2        | 1.6.1        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.4         | 11.0.3       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/11428 | 0.40.0       | 0.41.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.14.1       | 1.15.0       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.1.2        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/04100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.71.4       |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.5.2        | 6.1a2        |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 8.0.2        | 8.0.3        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.5.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.5.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.5.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.5.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.5.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.10      | 6.5.2        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.5.2        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.5.2        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.5.2        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.3          | 1.4          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/13768 | 0.11.0       | 0.13.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221215-... | ORPH
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2023-02-01   | 2023-07-01   |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 7.0.11       | 7.0.12       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.5          | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.4.3        | 1.4.4        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 8.3.2        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.15         | 4.0          | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2204.1     | 8.2306.0     | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.3        | 3.2.2        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.1.7        | 1.1.8        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.42.3       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.27.0       | 2.28.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.11.1.2     | 2.11.3.2     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.4      | 2.3.5.5      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.8.0      | 1.1.1.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.6.0.0      | 2.6.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.5.1.1      | 2.5.1.3      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.5.0      | 2.3.0.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.3.2      | 0.5.4.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.2.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.5.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.8.0        | 2.20.1       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.6.5        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.4.0        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.30.16      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.2        | 4.4.3        | ORPH
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.2          | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.7         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.6        | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.9          | 4.11         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.12.0.1     | 2.13.1.1     |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.9        | 1.1.10       |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.6.0        | 1.7.0        | ORPH
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.1.66.0     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.14      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.1        | 4.5.4        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.7          | 6.1          | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.2        | 2.4.3        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.22      | ORPH
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.5        | 1.0.7        |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.15.07      | 0.16.02      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.8        | 5.9.11       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.65         | 5.70         |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.5        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.6        | 7.0.0        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.7          | 1.8.1        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2022.12      | 2023.05      | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.32.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 4.2.0        | 4.3.1        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.48.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.36       | 2.2.73       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.6.1       | 12.6.2       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.18       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.34         | 1.35         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.54       | 2.1.56       |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.8.0     | 2021.10.0    |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.12       | 8.6.13       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                        tcping |  DISTRO  | https://release-monitoring.org/project/14881 | 1.3.6        | 2.1.0        | ORPH
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.4.2        | 4.4.4        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.3.2        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.1        | 2.5.3        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.18.1       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.11.0       | 2.11.1       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20220801     | 20230101     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.47         | 2.6          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.12       | 8.6.13       |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.5          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.0.1        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.2          |     
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.0        | 2.1.2        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2023.07.02   | ORPH
                        udisks |  DISTRO  | https://release-monitoring.org/project/05028 | 2.9.4        | 2.10.0       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20211207     | 20230319     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.12         | 0.14         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.4.0.0      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.3          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.2.6        | 6.2.9        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.1        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.2       |     
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.5.109      | 1.5.120      |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.9       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.7          | 1.0.1        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.3        | 2.6.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.0.1414     | 9.0.1677     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.6        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.72.2       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.3.2        | 3.3.4        |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.2.0        | 4.2.4        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.257      | 1.3.260      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.24       | 2.0.25       |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.7.2        |     
                       wavpack |  DISTRO  | https://release-monitoring.org/project/05121 | 5.5.0        | 5.6.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.40.3       | 2.41.6       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.2.4        | 1.3.1        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.1          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.18       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 8.13         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.14       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.6        | 4.0.7        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.15.1       | 0.16.2       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.40.3       | 2.40.4       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.19       | 1.4.23       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20230201     | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.5       | 4.17.1       |     
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/17200 | 1.0.4        | 1.0.5        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 6.4.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.39         | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.4.pl02   | 1.5.6.pl02   |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.06.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.22         | 3.24         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 376          | 384          | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.1.1       | 23.1.2       |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.8.1        | 0.8.2        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 13.0         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 6.4.4        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.2.2        | 1.3.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 6.0.0        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                      binutils | CVE-2022-4285    | https://security-tracker.debian.org/tracker/CVE-2022-4285   
                      binutils | CVE-2023-1579    | https://security-tracker.debian.org/tracker/CVE-2023-1579   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2023-33297   | https://security-tracker.debian.org/tracker/CVE-2023-33297  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
                  bluez5_utils | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
          bluez5_utils-headers | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                       connman | CVE-2023-28488   | https://security-tracker.debian.org/tracker/CVE-2023-28488  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2023-34241   | https://security-tracker.debian.org/tracker/CVE-2023-34241  
                  cups-filters | CVE-2023-24805   | https://security-tracker.debian.org/tracker/CVE-2023-24805  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                   ghostscript | CVE-2023-36664   | https://security-tracker.debian.org/tracker/CVE-2023-36664  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-28733   | https://security-tracker.debian.org/tracker/CVE-2022-28733  
                         grub2 | CVE-2022-28734   | https://security-tracker.debian.org/tracker/CVE-2022-28734  
                         grub2 | CVE-2022-28735   | https://security-tracker.debian.org/tracker/CVE-2022-28735  
                         grub2 | CVE-2022-28736   | https://security-tracker.debian.org/tracker/CVE-2022-28736  
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-1289    | https://security-tracker.debian.org/tracker/CVE-2023-1289   
                   imagemagick | CVE-2023-2157    | https://security-tracker.debian.org/tracker/CVE-2023-2157   
                   imagemagick | CVE-2023-34151   | https://security-tracker.debian.org/tracker/CVE-2023-34151  
                   imagemagick | CVE-2023-34152   | https://security-tracker.debian.org/tracker/CVE-2023-34152  
                   imagemagick | CVE-2023-34153   | https://security-tracker.debian.org/tracker/CVE-2023-34153  
                   imagemagick | CVE-2023-34474   | https://security-tracker.debian.org/tracker/CVE-2023-34474  
                   imagemagick | CVE-2023-34475   | https://security-tracker.debian.org/tracker/CVE-2023-34475  
                         irssi | CVE-2023-29132   | https://security-tracker.debian.org/tracker/CVE-2023-29132  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                    jpeg-turbo | CVE-2023-2804    | https://security-tracker.debian.org/tracker/CVE-2023-2804   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2023-30571   | https://security-tracker.debian.org/tracker/CVE-2023-30571  
                       libcoap | CVE-2023-30362   | https://security-tracker.debian.org/tracker/CVE-2023-30362  
                       libcoap | CVE-2023-35862   | https://security-tracker.debian.org/tracker/CVE-2023-35862  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                   libiec61850 | CVE-2023-27772   | https://security-tracker.debian.org/tracker/CVE-2023-27772  
                        libjxl | CVE-2023-35790   | https://security-tracker.debian.org/tracker/CVE-2023-35790  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                    libopenssl | CVE-2023-2975    | https://security-tracker.debian.org/tracker/CVE-2023-2975   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libyang | CVE-2023-26916   | https://security-tracker.debian.org/tracker/CVE-2023-26916  
                       libyang | CVE-2023-26917   | https://security-tracker.debian.org/tracker/CVE-2023-26917  
                       log4cxx | CVE-2023-31038   | https://security-tracker.debian.org/tracker/CVE-2023-31038  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                      netatalk | CVE-2022-43634   | https://security-tracker.debian.org/tracker/CVE-2022-43634  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       opencv4 | CVE-2023-2617    | https://security-tracker.debian.org/tracker/CVE-2023-2617   
                       opencv4 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                        opensc | CVE-2023-2977    | https://security-tracker.debian.org/tracker/CVE-2023-2977   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                  oracle-mysql | CVE-2023-21977   | https://security-tracker.debian.org/tracker/CVE-2023-21977  
                  oracle-mysql | CVE-2023-21980   | https://security-tracker.debian.org/tracker/CVE-2023-21980  
                  oracle-mysql | CVE-2023-22007   | https://security-tracker.debian.org/tracker/CVE-2023-22007  
                  oracle-mysql | CVE-2023-22053   | https://security-tracker.debian.org/tracker/CVE-2023-22053  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                          perl | CVE-2023-31486   | https://security-tracker.debian.org/tracker/CVE-2023-31486  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        pixman | CVE-2023-37769   | https://security-tracker.debian.org/tracker/CVE-2023-37769  
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
           python-cryptography | CVE-2023-38325   | https://security-tracker.debian.org/tracker/CVE-2023-38325  
                 python-django | CVE-2023-36053   | https://security-tracker.debian.org/tracker/CVE-2023-36053  
                python-ipython | CVE-2023-24816   | https://security-tracker.debian.org/tracker/CVE-2023-24816  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-scipy | CVE-2023-25399   | https://security-tracker.debian.org/tracker/CVE-2023-25399  
                python-tornado | CVE-2023-28370   | https://security-tracker.debian.org/tracker/CVE-2023-28370  
                       python3 | CVE-2023-24329   | https://security-tracker.debian.org/tracker/CVE-2023-24329  
                       python3 | CVE-2023-36632   | https://security-tracker.debian.org/tracker/CVE-2023-36632  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-3354    | https://security-tracker.debian.org/tracker/CVE-2023-3354   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                    rabbitmq-c | CVE-2023-35789   | https://security-tracker.debian.org/tracker/CVE-2023-35789  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        screen | CVE-2023-24626   | https://security-tracker.debian.org/tracker/CVE-2023-24626  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2022-28737   | https://security-tracker.debian.org/tracker/CVE-2022-28737  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2023-31981   | https://security-tracker.debian.org/tracker/CVE-2023-31981  
                        sngrep | CVE-2023-31982   | https://security-tracker.debian.org/tracker/CVE-2023-31982  
                        sngrep | CVE-2023-36192   | https://security-tracker.debian.org/tracker/CVE-2023-36192  
                       speechd | CVE-2001-0956    | https://security-tracker.debian.org/tracker/CVE-2001-0956   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    strongswan | CVE-2023-26463   | https://security-tracker.debian.org/tracker/CVE-2023-26463  
                          sudo | CVE-2023-27320   | https://security-tracker.debian.org/tracker/CVE-2023-27320  
                      suricata | CVE-2023-35852   | https://security-tracker.debian.org/tracker/CVE-2023-35852  
                      suricata | CVE-2023-35853   | https://security-tracker.debian.org/tracker/CVE-2023-35853  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       sysstat | CVE-2023-33204   | https://security-tracker.debian.org/tracker/CVE-2023-33204  
                           tar | CVE-2022-48303   | https://security-tracker.debian.org/tracker/CVE-2022-48303  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-3618    | https://security-tracker.debian.org/tracker/CVE-2023-3618   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2023-2426    | https://security-tracker.debian.org/tracker/CVE-2023-2426   
                           vim | CVE-2023-2609    | https://security-tracker.debian.org/tracker/CVE-2023-2609   
                           vim | CVE-2023-2610    | https://security-tracker.debian.org/tracker/CVE-2023-2610   
                          webp | CVE-2023-1999    | https://security-tracker.debian.org/tracker/CVE-2023-1999   
                     wireshark | CVE-2023-3648    | https://security-tracker.debian.org/tracker/CVE-2023-3648   
                     wireshark | CVE-2023-3649    | https://security-tracker.debian.org/tracker/CVE-2023-3649   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2023-30402   | https://security-tracker.debian.org/tracker/CVE-2023-30402  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31975   | https://security-tracker.debian.org/tracker/CVE-2023-31975  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2023.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                        bento4 | CVE-2022-4584    | https://security-tracker.debian.org/tracker/CVE-2022-4584   
                        bento4 | CVE-2023-29573   | https://security-tracker.debian.org/tracker/CVE-2023-29573  
                        bento4 | CVE-2023-29574   | https://security-tracker.debian.org/tracker/CVE-2023-29574  
                        bento4 | CVE-2023-29575   | https://security-tracker.debian.org/tracker/CVE-2023-29575  
                        bento4 | CVE-2023-29576   | https://security-tracker.debian.org/tracker/CVE-2023-29576  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                      binutils | CVE-2022-4285    | https://security-tracker.debian.org/tracker/CVE-2022-4285   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2023-33297   | https://security-tracker.debian.org/tracker/CVE-2023-33297  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
                  bluez5_utils | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
          bluez5_utils-headers | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                       connman | CVE-2023-28488   | https://security-tracker.debian.org/tracker/CVE-2023-28488  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2023-34241   | https://security-tracker.debian.org/tracker/CVE-2023-34241  
                  cups-filters | CVE-2023-24805   | https://security-tracker.debian.org/tracker/CVE-2023-24805  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                     dmidecode | CVE-2023-30630   | https://security-tracker.debian.org/tracker/CVE-2023-30630  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                   ghostscript | CVE-2023-36664   | https://security-tracker.debian.org/tracker/CVE-2023-36664  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                            go | CVE-2023-29406   | https://security-tracker.debian.org/tracker/CVE-2023-29406  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-28733   | https://security-tracker.debian.org/tracker/CVE-2022-28733  
                         grub2 | CVE-2022-28734   | https://security-tracker.debian.org/tracker/CVE-2022-28734  
                         grub2 | CVE-2022-28735   | https://security-tracker.debian.org/tracker/CVE-2022-28735  
                         grub2 | CVE-2022-28736   | https://security-tracker.debian.org/tracker/CVE-2022-28736  
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                      harfbuzz | CVE-2023-25193   | https://security-tracker.debian.org/tracker/CVE-2023-25193  
                       heimdal | CVE-2022-45142   | https://security-tracker.debian.org/tracker/CVE-2022-45142  
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-1289    | https://security-tracker.debian.org/tracker/CVE-2023-1289   
                   imagemagick | CVE-2023-2157    | https://security-tracker.debian.org/tracker/CVE-2023-2157   
                   imagemagick | CVE-2023-34151   | https://security-tracker.debian.org/tracker/CVE-2023-34151  
                   imagemagick | CVE-2023-34152   | https://security-tracker.debian.org/tracker/CVE-2023-34152  
                   imagemagick | CVE-2023-34153   | https://security-tracker.debian.org/tracker/CVE-2023-34153  
                   imagemagick | CVE-2023-34474   | https://security-tracker.debian.org/tracker/CVE-2023-34474  
                   imagemagick | CVE-2023-34475   | https://security-tracker.debian.org/tracker/CVE-2023-34475  
                        iperf3 | CVE-2023-38403   | https://security-tracker.debian.org/tracker/CVE-2023-38403  
                         irssi | CVE-2023-29132   | https://security-tracker.debian.org/tracker/CVE-2023-29132  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                    jpeg-turbo | CVE-2023-2804    | https://security-tracker.debian.org/tracker/CVE-2023-2804   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                          kodi | CVE-2023-23082   | https://security-tracker.debian.org/tracker/CVE-2023-23082  
                          kodi | CVE-2023-30207   | https://security-tracker.debian.org/tracker/CVE-2023-30207  
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2023-30571   | https://security-tracker.debian.org/tracker/CVE-2023-30571  
                       libcoap | CVE-2023-30362   | https://security-tracker.debian.org/tracker/CVE-2023-30362  
                       libcoap | CVE-2023-35862   | https://security-tracker.debian.org/tracker/CVE-2023-35862  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                   libiec61850 | CVE-2023-27772   | https://security-tracker.debian.org/tracker/CVE-2023-27772  
                        libjxl | CVE-2023-35790   | https://security-tracker.debian.org/tracker/CVE-2023-35790  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                  libmemcached | CVE-2023-27478   | https://security-tracker.debian.org/tracker/CVE-2023-27478  
                libmodsecurity | CVE-2023-28882   | https://security-tracker.debian.org/tracker/CVE-2023-28882  
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libyang | CVE-2023-26916   | https://security-tracker.debian.org/tracker/CVE-2023-26916  
                       libyang | CVE-2023-26917   | https://security-tracker.debian.org/tracker/CVE-2023-26917  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                       log4cxx | CVE-2023-31038   | https://security-tracker.debian.org/tracker/CVE-2023-31038  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mariadb | CVE-2022-47015   | https://security-tracker.debian.org/tracker/CVE-2022-47015  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                      netatalk | CVE-2022-43634   | https://security-tracker.debian.org/tracker/CVE-2022-43634  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2023-26551   | https://security-tracker.debian.org/tracker/CVE-2023-26551  
                           ntp | CVE-2023-26552   | https://security-tracker.debian.org/tracker/CVE-2023-26552  
                           ntp | CVE-2023-26553   | https://security-tracker.debian.org/tracker/CVE-2023-26553  
                           ntp | CVE-2023-26554   | https://security-tracker.debian.org/tracker/CVE-2023-26554  
                           ntp | CVE-2023-26555   | https://security-tracker.debian.org/tracker/CVE-2023-26555  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       opencv4 | CVE-2023-2617    | https://security-tracker.debian.org/tracker/CVE-2023-2617   
                       opencv4 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                  oracle-mysql | CVE-2023-21977   | https://security-tracker.debian.org/tracker/CVE-2023-21977  
                  oracle-mysql | CVE-2023-21980   | https://security-tracker.debian.org/tracker/CVE-2023-21980  
                  oracle-mysql | CVE-2023-22007   | https://security-tracker.debian.org/tracker/CVE-2023-22007  
                  oracle-mysql | CVE-2023-22053   | https://security-tracker.debian.org/tracker/CVE-2023-22053  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                          perl | CVE-2023-31486   | https://security-tracker.debian.org/tracker/CVE-2023-31486  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        pixman | CVE-2023-37769   | https://security-tracker.debian.org/tracker/CVE-2023-37769  
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2023-37276   | https://security-tracker.debian.org/tracker/CVE-2023-37276  
           python-cryptography | CVE-2023-38325   | https://security-tracker.debian.org/tracker/CVE-2023-38325  
                 python-django | CVE-2023-36053   | https://security-tracker.debian.org/tracker/CVE-2023-36053  
                  python-flask | CVE-2023-30861   | https://security-tracker.debian.org/tracker/CVE-2023-30861  
                python-ipython | CVE-2023-24816   | https://security-tracker.debian.org/tracker/CVE-2023-24816  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
               python-pygments | CVE-2022-40896   | https://security-tracker.debian.org/tracker/CVE-2022-40896  
                  python-scipy | CVE-2023-25399   | https://security-tracker.debian.org/tracker/CVE-2023-25399  
                python-tornado | CVE-2023-28370   | https://security-tracker.debian.org/tracker/CVE-2023-28370  
                       python3 | CVE-2023-24329   | https://security-tracker.debian.org/tracker/CVE-2023-24329  
                       python3 | CVE-2023-36632   | https://security-tracker.debian.org/tracker/CVE-2023-36632  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-0330    | https://security-tracker.debian.org/tracker/CVE-2023-0330   
                          qemu | CVE-2023-0664    | https://security-tracker.debian.org/tracker/CVE-2023-0664   
                          qemu | CVE-2023-3354    | https://security-tracker.debian.org/tracker/CVE-2023-3354   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                    rabbitmq-c | CVE-2023-35789   | https://security-tracker.debian.org/tracker/CVE-2023-35789  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2023-0614    | https://security-tracker.debian.org/tracker/CVE-2023-0614   
                        samba4 | CVE-2023-0922    | https://security-tracker.debian.org/tracker/CVE-2023-0922   
                        screen | CVE-2023-24626   | https://security-tracker.debian.org/tracker/CVE-2023-24626  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                          shim | CVE-2022-28737   | https://security-tracker.debian.org/tracker/CVE-2022-28737  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2023-31981   | https://security-tracker.debian.org/tracker/CVE-2023-31981  
                        sngrep | CVE-2023-31982   | https://security-tracker.debian.org/tracker/CVE-2023-31982  
                        sngrep | CVE-2023-36192   | https://security-tracker.debian.org/tracker/CVE-2023-36192  
                     sofia-sip | CVE-2023-32307   | https://security-tracker.debian.org/tracker/CVE-2023-32307  
                       speechd | CVE-2001-0956    | https://security-tracker.debian.org/tracker/CVE-2001-0956   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2023-36191   | https://security-tracker.debian.org/tracker/CVE-2023-36191  
                    stellarium | CVE-2023-28371   | https://security-tracker.debian.org/tracker/CVE-2023-28371  
                    strongswan | CVE-2023-26463   | https://security-tracker.debian.org/tracker/CVE-2023-26463  
                          sudo | CVE-2023-27320   | https://security-tracker.debian.org/tracker/CVE-2023-27320  
                      suricata | CVE-2023-35852   | https://security-tracker.debian.org/tracker/CVE-2023-35852  
                      suricata | CVE-2023-35853   | https://security-tracker.debian.org/tracker/CVE-2023-35853  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       sysstat | CVE-2023-33204   | https://security-tracker.debian.org/tracker/CVE-2023-33204  
                       systemd | CVE-2022-4415    | https://security-tracker.debian.org/tracker/CVE-2022-4415   
                           tar | CVE-2022-48303   | https://security-tracker.debian.org/tracker/CVE-2022-48303  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-3618    | https://security-tracker.debian.org/tracker/CVE-2023-3618   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2023-2426    | https://security-tracker.debian.org/tracker/CVE-2023-2426   
                           vim | CVE-2023-2609    | https://security-tracker.debian.org/tracker/CVE-2023-2609   
                           vim | CVE-2023-2610    | https://security-tracker.debian.org/tracker/CVE-2023-2610   
                          webp | CVE-2023-1999    | https://security-tracker.debian.org/tracker/CVE-2023-1999   
                     wireshark | CVE-2023-3648    | https://security-tracker.debian.org/tracker/CVE-2023-3648   
                     wireshark | CVE-2023-3649    | https://security-tracker.debian.org/tracker/CVE-2023-3649   
                       wolfssl | CVE-2023-3724    | https://security-tracker.debian.org/tracker/CVE-2023-3724   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2023-30402   | https://security-tracker.debian.org/tracker/CVE-2023-30402  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31975   | https://security-tracker.debian.org/tracker/CVE-2023-31975  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2023.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                      binutils | CVE-2022-4285    | https://security-tracker.debian.org/tracker/CVE-2022-4285   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2023-33297   | https://security-tracker.debian.org/tracker/CVE-2023-33297  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
                  bluez5_utils | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2022-3563    | https://security-tracker.debian.org/tracker/CVE-2022-3563   
          bluez5_utils-headers | CVE-2022-3637    | https://security-tracker.debian.org/tracker/CVE-2022-3637   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                       connman | CVE-2023-28488   | https://security-tracker.debian.org/tracker/CVE-2023-28488  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2023-34241   | https://security-tracker.debian.org/tracker/CVE-2023-34241  
                  cups-filters | CVE-2023-24805   | https://security-tracker.debian.org/tracker/CVE-2023-24805  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                     dmidecode | CVE-2023-30630   | https://security-tracker.debian.org/tracker/CVE-2023-30630  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                   ghostscript | CVE-2023-36664   | https://security-tracker.debian.org/tracker/CVE-2023-36664  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                            go | CVE-2023-29406   | https://security-tracker.debian.org/tracker/CVE-2023-29406  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-28733   | https://security-tracker.debian.org/tracker/CVE-2022-28733  
                         grub2 | CVE-2022-28734   | https://security-tracker.debian.org/tracker/CVE-2022-28734  
                         grub2 | CVE-2022-28735   | https://security-tracker.debian.org/tracker/CVE-2022-28735  
                         grub2 | CVE-2022-28736   | https://security-tracker.debian.org/tracker/CVE-2022-28736  
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-1289    | https://security-tracker.debian.org/tracker/CVE-2023-1289   
                   imagemagick | CVE-2023-2157    | https://security-tracker.debian.org/tracker/CVE-2023-2157   
                   imagemagick | CVE-2023-34151   | https://security-tracker.debian.org/tracker/CVE-2023-34151  
                   imagemagick | CVE-2023-34152   | https://security-tracker.debian.org/tracker/CVE-2023-34152  
                   imagemagick | CVE-2023-34153   | https://security-tracker.debian.org/tracker/CVE-2023-34153  
                   imagemagick | CVE-2023-34474   | https://security-tracker.debian.org/tracker/CVE-2023-34474  
                   imagemagick | CVE-2023-34475   | https://security-tracker.debian.org/tracker/CVE-2023-34475  
                        iperf3 | CVE-2023-38403   | https://security-tracker.debian.org/tracker/CVE-2023-38403  
                         irssi | CVE-2023-29132   | https://security-tracker.debian.org/tracker/CVE-2023-29132  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                    jpeg-turbo | CVE-2023-2804    | https://security-tracker.debian.org/tracker/CVE-2023-2804   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2023-30571   | https://security-tracker.debian.org/tracker/CVE-2023-30571  
                       libcoap | CVE-2023-30362   | https://security-tracker.debian.org/tracker/CVE-2023-30362  
                       libcoap | CVE-2023-35862   | https://security-tracker.debian.org/tracker/CVE-2023-35862  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                   libiec61850 | CVE-2023-27772   | https://security-tracker.debian.org/tracker/CVE-2023-27772  
                        libjxl | CVE-2023-35790   | https://security-tracker.debian.org/tracker/CVE-2023-35790  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                  libmemcached | CVE-2023-27478   | https://security-tracker.debian.org/tracker/CVE-2023-27478  
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libyang | CVE-2023-26916   | https://security-tracker.debian.org/tracker/CVE-2023-26916  
                       libyang | CVE-2023-26917   | https://security-tracker.debian.org/tracker/CVE-2023-26917  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                       log4cxx | CVE-2023-31038   | https://security-tracker.debian.org/tracker/CVE-2023-31038  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mariadb | CVE-2022-47015   | https://security-tracker.debian.org/tracker/CVE-2022-47015  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                      netatalk | CVE-2022-43634   | https://security-tracker.debian.org/tracker/CVE-2022-43634  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2023-26551   | https://security-tracker.debian.org/tracker/CVE-2023-26551  
                           ntp | CVE-2023-26552   | https://security-tracker.debian.org/tracker/CVE-2023-26552  
                           ntp | CVE-2023-26553   | https://security-tracker.debian.org/tracker/CVE-2023-26553  
                           ntp | CVE-2023-26554   | https://security-tracker.debian.org/tracker/CVE-2023-26554  
                           ntp | CVE-2023-26555   | https://security-tracker.debian.org/tracker/CVE-2023-26555  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       opencv4 | CVE-2023-2617    | https://security-tracker.debian.org/tracker/CVE-2023-2617   
                       opencv4 | CVE-2023-2618    | https://security-tracker.debian.org/tracker/CVE-2023-2618   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                  oracle-mysql | CVE-2023-21977   | https://security-tracker.debian.org/tracker/CVE-2023-21977  
                  oracle-mysql | CVE-2023-21980   | https://security-tracker.debian.org/tracker/CVE-2023-21980  
                  oracle-mysql | CVE-2023-22007   | https://security-tracker.debian.org/tracker/CVE-2023-22007  
                  oracle-mysql | CVE-2023-22053   | https://security-tracker.debian.org/tracker/CVE-2023-22053  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                          perl | CVE-2023-31486   | https://security-tracker.debian.org/tracker/CVE-2023-31486  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        pixman | CVE-2023-37769   | https://security-tracker.debian.org/tracker/CVE-2023-37769  
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2023-37276   | https://security-tracker.debian.org/tracker/CVE-2023-37276  
           python-cryptography | CVE-2023-38325   | https://security-tracker.debian.org/tracker/CVE-2023-38325  
                 python-django | CVE-2023-36053   | https://security-tracker.debian.org/tracker/CVE-2023-36053  
                  python-flask | CVE-2023-30861   | https://security-tracker.debian.org/tracker/CVE-2023-30861  
                python-ipython | CVE-2023-24816   | https://security-tracker.debian.org/tracker/CVE-2023-24816  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
               python-pygments | CVE-2022-40896   | https://security-tracker.debian.org/tracker/CVE-2022-40896  
                  python-scipy | CVE-2023-25399   | https://security-tracker.debian.org/tracker/CVE-2023-25399  
                python-tornado | CVE-2023-28370   | https://security-tracker.debian.org/tracker/CVE-2023-28370  
                       python3 | CVE-2023-24329   | https://security-tracker.debian.org/tracker/CVE-2023-24329  
                       python3 | CVE-2023-36632   | https://security-tracker.debian.org/tracker/CVE-2023-36632  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-3354    | https://security-tracker.debian.org/tracker/CVE-2023-3354   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                    rabbitmq-c | CVE-2023-35789   | https://security-tracker.debian.org/tracker/CVE-2023-35789  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        screen | CVE-2023-24626   | https://security-tracker.debian.org/tracker/CVE-2023-24626  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2022-28737   | https://security-tracker.debian.org/tracker/CVE-2022-28737  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2023-31981   | https://security-tracker.debian.org/tracker/CVE-2023-31981  
                        sngrep | CVE-2023-31982   | https://security-tracker.debian.org/tracker/CVE-2023-31982  
                        sngrep | CVE-2023-36192   | https://security-tracker.debian.org/tracker/CVE-2023-36192  
                     sofia-sip | CVE-2023-32307   | https://security-tracker.debian.org/tracker/CVE-2023-32307  
                       speechd | CVE-2001-0956    | https://security-tracker.debian.org/tracker/CVE-2001-0956   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    stellarium | CVE-2023-28371   | https://security-tracker.debian.org/tracker/CVE-2023-28371  
                    strongswan | CVE-2023-26463   | https://security-tracker.debian.org/tracker/CVE-2023-26463  
                          sudo | CVE-2023-27320   | https://security-tracker.debian.org/tracker/CVE-2023-27320  
                      suricata | CVE-2023-35852   | https://security-tracker.debian.org/tracker/CVE-2023-35852  
                      suricata | CVE-2023-35853   | https://security-tracker.debian.org/tracker/CVE-2023-35853  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       sysstat | CVE-2023-33204   | https://security-tracker.debian.org/tracker/CVE-2023-33204  
                       systemd | CVE-2022-4415    | https://security-tracker.debian.org/tracker/CVE-2022-4415   
                           tar | CVE-2022-48303   | https://security-tracker.debian.org/tracker/CVE-2022-48303  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-3618    | https://security-tracker.debian.org/tracker/CVE-2023-3618   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2023-2426    | https://security-tracker.debian.org/tracker/CVE-2023-2426   
                           vim | CVE-2023-2609    | https://security-tracker.debian.org/tracker/CVE-2023-2609   
                           vim | CVE-2023-2610    | https://security-tracker.debian.org/tracker/CVE-2023-2610   
                          webp | CVE-2023-1999    | https://security-tracker.debian.org/tracker/CVE-2023-1999   
                     wireshark | CVE-2023-3648    | https://security-tracker.debian.org/tracker/CVE-2023-3648   
                     wireshark | CVE-2023-3649    | https://security-tracker.debian.org/tracker/CVE-2023-3649   
                       wolfssl | CVE-2023-3724    | https://security-tracker.debian.org/tracker/CVE-2023-3724   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2023-30402   | https://security-tracker.debian.org/tracker/CVE-2023-30402  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31975   | https://security-tracker.debian.org/tracker/CVE-2023-31975  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
