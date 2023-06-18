Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E2BEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 04:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA4D401B7;
	Sun, 18 Jun 2023 04:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA4D401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PiEK_HnU6ao; Sun, 18 Jun 2023 04:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ABB9401C6;
	Sun, 18 Jun 2023 04:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABB9401C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B33081BF82D
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 04:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A3F9401C6
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 04:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3F9401C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaKzsu8C9LBD for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 04:39:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FA1401B7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43FA1401B7
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 04:39:58 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46870240007
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 04:39:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 04:39:55 -0000
Message-Id: <20230618044000.8A3F9401C6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687063195; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HBs2yHilspxLHV+/Bz3FMUxKtnqFJiZm3LnCWfbnCBM=;
 b=WYNkAWpKJYNraZwUmK45T6XazeSwVJSk2Nig1jPBj42Ae82HqRhDLqGFsxTPJEcGdK+98F
 Cmv8nbJHpBwnkvCP9/RMxZyPQ+lt7yT2fvNZ0Kj6ITOc64HjK9y6yhb86CX6XBZjKQjrKK
 6ClX0hmXgwDqJkthWlXPeFOL2mRU3T0KD/c+2NgOwiuMDc8BhB6g3C8fZqh/iC8I1PJ5DK
 sXmIgy+j/m0Zv4dccRlZw40uEK91jXT76u6RjJvfgAXXjop090fD6PXtstQg11NW2sFqzu
 P9kauA2ttPg9Xer0DHQ2dAQdaGnnjwiGpWIHb5qcq0vZ8tnlYxp2GSlNOCrDog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WYNkAWpK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-17
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

Autobuild statistics for 2023-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  1  |  9  |
    master   | 76  | 54  |  1  | 131 |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 5 
                   linux-6.3.6 | 5 
package/ccache/ccache.mk:63... | 3 
                    strace-6.3 | 3 
                 agentpp-4.6.0 | 2 
            host-binutils-2.38 | 2 
            host-binutils-2.39 | 2 
              host-rust-1.68.2 | 2 
               libglib2-2.76.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               syslog-ng-4.1.1 | 2 
                       unknown | 2 
                     audit-3.1 | 1 
              erlang-22.3.4.22 | 1 
                  ffmpeg-4.4.4 | 1 
                    flac-1.4.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
                 haproxy-2.6.9 | 1 
                haveged-1.9.18 | 1 
               host-runc-1.1.7 | 1 
                jailhouse-0.12 | 1 
      libabseil-cpp-20220623.1 | 1 
libdill-32d0e8b733416208e04... | 1 
        ltp-testsuite-20230127 | 1 
              mosquitto-2.0.15 | 1 
                   perl-5.36.1 | 1 
    python-cryptography-39.0.1 | 1 
       python-stack-data-0.6.2 | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
sconeserver-8d1935919a20133... | 1 
               valgrind-3.20.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/428b4115f0c79a13b44f74940ab52b1c8be80324 |     
   sparc     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ddf92837002fcb7ae384f85a94672a55cb68cdf5 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/67834a962470dfebf1ae84e921c1e1beb3a61c1a |     
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/6dfb7718338c143b80bb7142f5470254ba62d4e0 |     
   armeb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/4f369b34b39ca81567618ab2f6e21d6f6cda9750 |     
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/e951119c03b25f7e8da68c5edc9ea844cccc1329 |     
   s390x     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/c95bb242437f813176fd1997b4fee013277cef9e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c3085d625c1968935a75224ec18e1cd19b02e34e |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e90e05e3d2b66d694764d5ac1a10f31d32789d91 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ce8d7af0942bf5262e129bb1641d75f102cf966f |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9434d40bb243b76854ae2faccb144b80ace8ead9 |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/d09b7a7a8554e7465433e75c0d277825fc988011 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/4079d3e33f02ef0d334e79d914b764d19d2dfb5d |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8fc5d0f1320ae414445a103ed520b2c9f98ad7ed |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5c384fd2d327c319a828a7066b4ff23b8b000232 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/40fb5550e1e270ddf3d2c060f667681e7bd36210 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/10be8e1998b362b044ee286c220f8cd97ff0f463 |     
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/59904c23e5ea7378888bef10b150468c73fe21b2 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/0c3add74f2b1462a5bdd748eb6878557b40b2398 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/85e27dd7fbd8a7c8bffbb0184c54ca9875ed2959 | ORPH
 powerpc64   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/23c5e74c469b3829c598c5dfc1ba2c48cbc99407 | ORPH
microblazeel |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/6348a830c7f76bb757b5e373cc50737e3b88b317 | ORPH
    arc      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/6f386fd8f3523566be3cf6e65455fe698597e0b3 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/4be7b48dad818b9e15e22e4569710c4044f462b2 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c35e148afa28c16b6b936f9955b569fe4b0e3bb4 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/63f8bae788ba51f0364da8566e893ecd41d20f35 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/2754ac5bea97c4022e4f29d5ebd1bd0e3b800628 |     
  riscv64    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/f55dffe68e8ae91794503d474a55735565daf434 |     
   armeb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1ce19d0c17db5a1c1f13717cb99670024a49062f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ae9882a8d78b398202526dba5bb38da8e62482c6 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1201a39bfc1d377970028a36589455d0e7daea5d | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/01359d5228f5370172060b358b2d8fc1b48fab48 | ORPH
    arc      |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/e42a2a8a00be20f4c753b8bc887eefa2ecf2642a | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/cd3eb24e22caa1c355068b847e6264dfc421a970 | ORPH
   mips64    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/3ea84ee186ea141ee2cabfed8677e6290446f8ad | ORPH
   mips64    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/1bf2f954fbfc7e8728cab4bd064c627497af2846 | ORPH
  powerpc    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/2d067b7a387daeed3df4f31839731c51c5a15f18 | ORPH
powerpc64le  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/ec17eca608c73cd1b77954b18fb4651c621ce8f2 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/c76f842f9499d53e5c183387fe21323e75c6b4eb |     
   xtensa    | package/ccache/ccache.mk:63... | NOK | http://autobuild.buildroot.net/results/bb2dee43d98dac5d9fa408ed6e3c773c00152c8a |     
   x86_64    | package/ccache/ccache.mk:63... | NOK | http://autobuild.buildroot.net/results/1f442d309ef81f09b7aaa1671a095dcbd15a80ff |     
    m68k     | package/ccache/ccache.mk:63... | NOK | http://autobuild.buildroot.net/results/7976bd2aa1d68c85dcb5947fe11e3aa30bf682e3 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/9ed58495aaaba5461c913d0543ceb62016267c63 |     
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/be0f02c994a2929e1c25e13ead6e5e5447ef6469 |     
    mips     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/de0f352154462a2f8f612090a66e8eed1266fdca |     
  riscv32    | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/d8f3ac83fba81e55de12e62e49206977fadeb8f2 |     
 microblaze  | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/0c1a3cf4fb80cdf8e91694373f55fb9a60ea9ff7 |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/080e27b72bc991da1194bf6d7a84ecbf23671fbd |     
   armeb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/55901502a57e79b78526b0aaee22c181cf9a5e0d |     
powerpc64le  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/c57c7fe5baf7b6b4e4e1fa74c5fa035ca8e92f9a |     
powerpc64le  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/981fa27caea0379948eeaba036ef8208e7e01835 |     
 aarch64_be  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/e2b64a56ffad52209b1ddac4745dd3570ab59147 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0c8d1a7e8b5ca57843424db46cf2613e341d712e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/794a9b76eef166e1db5bd6bd44e263705ad61153 |     
   mipsel    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/adc173c7cf721b003952e8e41750edabac1f6ab7 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               fftw-quad-3.3.8 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
         gobject-introspection | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/3a12b85c3b35bf9342deecf4beb0391def6c9d7b | ORPH
   nios2     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/49781762a83ccb4116cdbb1cfe3e31ad528d847d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fe83be7a08094bbb79a903b0ecd1a2fa4996419d |     
    i686     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/0bcf71986d38ddfcc396ba9c3d6a0bf7be2ccd6c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/76318ba546abc6a53bbe95170b6fcbc4ff9732ca |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/993bba2201aeaba696deee4ab09419de080fd73a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
