Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AE1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 04:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E5E40311;
	Thu,  9 May 2024 04:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4Wlnb57uOKK; Thu,  9 May 2024 04:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AB2414E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AB2414E7;
	Thu,  9 May 2024 04:02:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B29481BF99D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 04:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DA6E60E4C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 04:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oz1qtqGqHp43 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 04:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB1FC60E3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1FC60E3F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB1FC60E3F
 for <buildroot@buildroot.org>; Thu,  9 May 2024 04:02:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86BF91BF208
 for <buildroot@buildroot.org>; Thu,  9 May 2024 04:02:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 09 May 2024 04:02:47 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715227367; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IJs8vjVMUjY3dmNYKyuh3gxDSKUkwqsYKRa6eE7Qy6Y=;
 b=NEtoovGU2wmRh9xs6jlp7+XEZEuLkcq3c00lSD5EP4w1QLsd4vVPdmdWrPBEMZCbbtqWj4
 tOzElvd78EcOLnjCQDynb6x8Qzu0kFHiV3wvRQNfZPQEpS6Cs9QpYUzj2LtEhkjyLjF3FC
 nbYlo+jc8Jjrc8UejIhG2QhtKXhqTTp8Q8y/FV7fQPVgouswehcqFkffJbEHn52SJgRNt9
 2r0Jh8s0XiqcKI1DuKDS+/T3tK7oc0STjURG2zjT0KlPiSc0+iHS/6Yr3msho/RWl/A1kt
 cFctRr/QB+Mla5/Hb8wHM+4UKSntSP3KGOrRRp56mrPvRx2DPZxWEEJm7DDDtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NEtoovGU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-08
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
Message-ID: <20240509040247.hVbYbnhMZOmKnpObA_rMIJon1CQ9tLnn8rMDjCPA_tk@z>

Hello,

Autobuild statistics for 2024-05-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  | 12  |  0  | 20  |
    master   | 73  | 84  |  0  | 157 |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 9 
                fail2ban-1.0.2 | 5 
                elfutils-0.189 | 4 
                   linux-6.8.6 | 4 
                       unknown | 4 
           dmraid-1.0.0.rc16-3 | 3 
  gobject-introspection-1.76.1 | 3 
              libopenssl-3.3.0 | 3 
                 openssh-9.7p1 | 3 
             bluez5_utils-5.75 | 2 
                    gdal-3.8.2 | 2 
                gnu-efi-3.0.18 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                libressl-3.8.4 | 2 
         python-remi-2022.7.27 | 2 
                    bat-0.24.0 | 1 
               belle-sip-4.4.8 | 1 
                  boost-1.83.0 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
              e2fsprogs-1.47.0 | 1 
                    fcft-3.1.6 | 1 
                     frr-8.5.4 | 1 
fs/axfs/axfs.mk:33: /home/a... | 1 
fs/axfs/axfs.mk:33: /home/a... | 1 
fs/axfs/axfs.mk:33: /home/a... | 1 
fs/axfs/axfs.mk:33: /home/b... | 1 
fs/ext2/ext2.mk:67: /home/b... | 1 
fs/ubifs/ubifs.mk:50: /home... | 1 
fs/ubifs/ubifs.mk:50: /home... | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
             host-delve-1.22.1 | 1 
         host-libxcrypt-4.4.36 | 1 
          host-sdbus-cpp-2.0.0 | 1 
        host-sentry-cli-2.20.3 | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
                  libbpf-1.1.0 | 1 
                  libffi-3.4.6 | 1 
                 libp11-0.4.12 | 1 
          linux-5.10.162-cip24 | 1 
                  ntpsec-1.2.3 | 1 
package/linux-firmware/linu... | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
python-unittest-xml-reporti... | 1 
                    zeek-4.1.1 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/edd09bb1bae3fa77c0a2b89f21c601b9f64aa974 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/f1e5460151b5b7205e3d08028a30f0d5f48cc7d9 |     
  aarch64    |       bluez5_utils-5.75        | NOK | http://autobuild.buildroot.net/results/779264595a09af19cebfcb9a85200abd99389009 |     
   x86_64    |       bluez5_utils-5.75        | NOK | http://autobuild.buildroot.net/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/e50ad6561a4e95a92acddc616bd757c918ad0556 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/392c5e7e61678dc24c2d9645013db9b0d05c786c |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4a49d5934f8cec858817c5e68c78ef42e00d055e | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/71ff1ca85118d0f7fa5c48b5470417d67e709a6d |     
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2a8b4a56fe4013eaa044cc31ecde6cc14534b939 | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/fb0d1cb421787650fda4162f23bc12f661daebf9 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/3a40333dccb390145e3f65526f16a35237cc2382 | ORPH
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/72e188c29208df6462d82fc84c1776aaa42ccdf7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e6ae62d8ecec608ad393b0e86614db08d7918db7 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/10d67aac172261c066b5defa9ab21ca01d2ab2e3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/abcf54e410b0f5d40d0325ea348eccc3410fd795 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9e000fb65030f18d6f541125daccafdcbb6f6627 | ORPH
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6e2d4bc0df637512383b0435fae44770c7248365 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c66a974d6efc636c7457a430d6d14b956a969db6 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a6fa80331404fd17d0e11d496bc4bb95c0455141 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/51a6992e11874e89c307649d39f647816cc33ec5 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/da9ba07ddfa157375ffcd2ae80132efe0aec6936 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/0fedfa43cb231a62c83b8ba951f26855197b2bdf |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/e3640c41a69b39a56fb746aba964e0bf757e1938 |     
 powerpc64   | fs/axfs/axfs.mk:33: /home/a... | NOK | http://autobuild.buildroot.net/results/f9d72d948cd26d048c736e1bd1337631c03f6fde |     
microblazeel | fs/axfs/axfs.mk:33: /home/a... | NOK | http://autobuild.buildroot.net/results/40f06e7a40fa90aeaec97d48249400c3af0e74e7 |     
    mips     | fs/axfs/axfs.mk:33: /home/a... | NOK | http://autobuild.buildroot.net/results/6b9c80f0b17ac1bf94e240722b7434b9dd4a4e70 |     
   sh4aeb    | fs/axfs/axfs.mk:33: /home/b... | NOK | http://autobuild.buildroot.net/results/e2b494210297066f90364d3804087956ae3cf4ee |     
   armeb     | fs/ext2/ext2.mk:67: /home/b... | NOK | http://autobuild.buildroot.net/results/cbd98588b3aced7c18467c2fec96e59c7d180881 |     
   mips64    | fs/ubifs/ubifs.mk:50: /home... | NOK | http://autobuild.buildroot.net/results/09795424e7c63f90fe00f8cd2b0f61d767560f0b |     
 powerpc64   | fs/ubifs/ubifs.mk:50: /home... | NOK | http://autobuild.buildroot.net/results/1451fa2b76071383251911ed64c388a5206713c7 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/77c2f3a5b272c6dee667bdc498e760ff0cb316b6 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/a5a94b7ed7a84b2a8ba59eb18ff9107abf75415d |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/a92cf0cf1e4945e09b90ddfd3092352b4ae5419f |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1f1ba3794061d85820c2d1e36b66f4511b7be491 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/98d955fd2fcf4a3db1ab46e4f553447031a23b92 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5ac9aea489fec6b540822fb6d91bf74ba3139359 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d64ce57aed1b5c9b76023f5ab4905eabbd47b268 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f23791ea1f9ee02804ea5f64885b9f09d20aa1ff | ORPH
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/e35e8bdd2d9db5a83716cc85bf11541657b76c14 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ea9d9ca1a36ab417bf720504f2c5c1a56fbd5d55 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3c54594a672b153b1e3f418b8624feec1fc326e6 | ORPH
  aarch64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2952208a3639886fcb9f3ec66a248d66656e5f6a |     
microblazeel |      host-sdbus-cpp-2.0.0      | NOK | http://autobuild.buildroot.net/results/1764ce0d48b390e430d2d8f54388013d3700e9d7 |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e06b3386644a344bdabb7df80342f168cd757f86 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ebe526ba3ea6c7e489a6d7d02055eabc72ec8235 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/af61c71b0f1c7c9925a9aa0db00dbfc82b7fbba7 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/754884faffed960a83e77cffaf954c8a293b34b9 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/025b801b5324e16d1fc5ca76c864d5435e175eae |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6366dc6b6798d9cd0bb216aefe07fa367b4513e9 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/69137b943ab0b112e53602decb3a3f429988437f |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8c8cb01539b77090028e6d3a524e0666f731cafe |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a9d0c8f4b6eab4d6e2ba4fe0d0baf97cc9c58548 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2ec0028dd1d5b1168080ce03c207f8e9cf951b50 |     
  riscv64    | igt-gpu-tools-0ee4074685c1e... | NOK | http://autobuild.buildroot.net/results/a7818af881d9aafa9a36f87dc7c882a6880554e8 |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/90b6407204fedcd50a3eb78c6cba7b606ebdd6df |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0b7b2cb757b1561d2879918a73d99ac95e9125f3 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/2cdc55cb857ff313ab15b3248f266f213ff22772 | ORPH
    arm      |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/468c94941f73a6c7139d37915be770c5d1916091 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/7102cf481b246a34c6e237fca12fc9fc5a263d47 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/45b5545ff141767a244d3cb8e8b69c0c985b4c21 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5dab90bef7be4429c120a73f7e899a63b86d4f99 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f02035b4759c548fcff56de81c749acb1177988a | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/021780c58c20da091ce9b9999a5e2b9e5d17a7cf | ORPH
    sh4a     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/2a91da479f918a9578e1aaea7047c69c67b0b360 | ORPH
   armeb     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/82fe677525d35704495824427ad01e3926d5728b | ORPH
   mipsel    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/08f36cc140ad129f33c5b271ab55db4f4cd65477 | ORPH
   nios2     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/b147c5c4209df96d42ad456df606ed0e5be67f49 | ORPH
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/18ab8094b4a5e7c350ff7b2937f8ad867b75f2de | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/fd81e4f43666721ab7a445fe08c72f5be715a16d | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/6c59b43177c3ba69aad7e0fc8264f955cd5ae0f6 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/bdf90be3dd4f36c63339d06dd230ade2ae898dcf | ORPH
    mips     | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/144ce581645d78a2d27a59a63130977d0f549db8 |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/62f6e46d0cfe82ceaf944a2a5a2717db28516580 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/3c7f19b2db14ae57cef102fd8c23b9cb3583eb9a |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/a46a61c1e7048b9227dda866daf087f14e0b3c2b |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c287ab67e777953a5db0b9a58531367384031c74 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ad11f07f97712a8d3052c4b8a3603837e195c2b6 |     
   s390x     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/d494ec32a6a9d8d3bc62a8c2fa159f950d020d2e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a189fd3d13dd351975c1c002d4bd9e4cf8d22ea |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8a8f32bb201fbce410798d8d03b01a433875b917 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bab93c5855ab64be2cc2f1c52715879539033d22 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/14f99da882807e7ee29925967215e22edbf25db9 |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/29c972d434c8ca465995ed8f59b381b3c01c4423 |     
    sh4      |          zeromq-4.3.5          | NOK | http://autobuild.buildroot.net/results/54a821e2ca834aa010153ce9a65c173157803523 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
                   duma-2.5.21 | 1 
                     efivar-39 | 1 
                gnu-efi-3.0.17 | 1 
 host-binutils-bare-metal-2.42 | 1 
              host-runc-1.1.12 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.27 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ee440a80a7f2d208b1af99c14efa5543bdbc8f07 |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3b78c5e09506fe002b20b1b5d95a7239d476a692 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/adfbfb8dab4475f480a39271c1dc827c003011f8 | ORPH
    arc      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/6efe8bfcdf2ce95558de8826e172ecbb273752bf |     
   xtensa    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/83eb2173957c2a01d373b6eeb26f6ae0a8c6a118 | ORPH
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/0c49782261ad7653dfece84677c7593e82ea238a |     
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/98463537ad299bfae863f1626188ce4982a59556 |     
    arm      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/280a9aaaf927fac35e04c63135cc991dfd6748e5 |     
    arm      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/3a599f0c86ad5a4e7d5ab82bc892c20899729724 |     
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b629b085be417fc893d493a6f64eaf83ff3b8050 | ORPH
    or1k     |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/d94e7f7d09936786286b9cc7a0d536120efef0d6 | ORPH
 microblaze  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/ff5a160db3a69843331176cbea928b75aa40e580 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
