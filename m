Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C9EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 04:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FEF42579;
	Fri, 20 May 2022 04:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVDcdWvwIEqY; Fri, 20 May 2022 04:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A154256F;
	Fri, 20 May 2022 04:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E19641BF39A
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 04:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3A44018F
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 04:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJ49hVR1j_v5 for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 04:43:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49B3C4002B
 for <buildroot@buildroot.org>; Fri, 20 May 2022 04:43:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D87E1C0006
 for <buildroot@buildroot.org>; Fri, 20 May 2022 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653021805; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gq9QdRfv1xHNmG5obi/SO64qGxXLbD9bnWHTtQx88Wk=;
 b=awSrp856wRTBfyNZzUeHLyQPHbkB4gaYnD1qFl5dHYUiurhcDRaIt44FlvQDFXxWxDQcOY
 ChUWr1PNi/eK8tNUnqdn+GFgNrMbA808k2BtjlguQcgj9PknP3wvgtgA4HgeReAk6RCEHP
 BE+UEWIJrsn2iKkDhcCiFaVcDeYNCIqS+xYEXrYRf48MYlN1xAg6D0P0MC9ZE26o+8tBjn
 M6gHaMDT+Z5pIOcSzjiFQWtmBEQ7IU683IWNcbyhWO+GEbfLVhCsWBp0qJfffkbYEAB57a
 ET2Vrv/VL50UKshI09H2s159YRWy0ZuWytqvFcN+SDM+et/GSQfzCj1trlI1eA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 20 May 2022 04:43:24 -0000
Message-Id: <20220520044331.CF3A44018F@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-19
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

Autobuild statistics for 2022-05-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  3  |  1  | 26  |
    master   | 119 | 151 |  0  | 270 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
               protobuf-3.20.1 | 10
         host-gcc-final-10.3.0 | 8 
            qpid-proton-0.35.0 | 7 
             libopenssl-1.1.1o | 5 
                  linux-5.17.7 | 4 
                 zlib-ng-2.0.6 | 4 
google-breakpad-c85eb4a59b6... | 3 
              libostree-2022.3 | 3 
              swupdate-2022.05 | 3 
                  acpid-2.0.33 | 2 
              alsa-lib-1.2.6.1 | 2 
               apcupsd-3.14.14 | 2 
                busybox-1.35.0 | 2 
                  exempi-2.6.1 | 2 
                     frr-8.2.2 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
                host-go-1.18.2 | 2 
      host-libtextstyle-0.20.1 | 2 
           libwebsockets-4.3.1 | 2 
               pipewire-0.3.51 | 2 
            python-ujson-5.2.0 | 2 
                     refpolicy | 2 
    toolchain-external-bootlin | 2 
toolchain-external-bootlin-... | 2 
                       xenomai | 2 
                apparmor-3.0.4 | 1 
                arp-scan-1.9.7 | 1 
                  bitwise-0.43 | 1 
             bluez5_utils-5.64 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
           docker-cli-20.10.14 | 1 
                   eigen-3.4.0 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                      fbv-1.0b | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
              host-delve-1.8.0 | 1 
          host-elf2flt-2021.08 | 1 
         host-gcc-final-11.3.0 | 1 
host-google-breakpad-c85eb4... | 1 
                ipmiutil-3.1.8 | 1 
             iucode-tool-2.3.1 | 1 
                  jack2-1.9.20 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
               libcap-ng-0.8.3 | 1 
                 libglfw-3.3.6 | 1 
               libglib2-2.70.4 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.1 | 1 
make: *** wait: No child pr... | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
                nodejs-16.15.0 | 1 
            ocf-linux-20120127 | 1 
   openvmtools-10.3.5-10430147 | 1 
                proftpd-1.3.6e | 1 
           python-orjson-3.6.7 | 1 
                    qemu-7.0.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
qt5base-f31e001a9399e4e6208... | 1 
rtl8189es-39c17661136da48f8... | 1 
                   uacme-1.7.1 | 1 
                 uclibc-1.0.40 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                    xen-4.14.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/b96482d4c783dc04d409a8378feac511d5a6dc77 | ORPH
   arceb     |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/2effe10df8f8fc9a247de2aea2b320b26046b4fd | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/a96c463ea9dc1e7462acf55bad5eaaa5fb8ca718 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/bb75ff5caae016d1586debbf8eeb1cd2b8c1a111 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/31565a21c7dadc8c14866c811ecbc2e3e0d8233b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/adc8dd016a660e22bf029d862d78f6eb33eb3b33 |     
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/2bda136cfe2e891af152eda94eeadd15192e9c62 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/ce2f3d3d3a894a118f6540011e8b6512ca0dcce8 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/5fbc7000fe5ff786796db4e93519b3316827e9d8 |     
   nios2     |       bluez5_utils-5.64        | NOK | http://autobuild.buildroot.net/results/0b2413c8f776f5b1c6b1804fa5563f07f51f9182 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/334fe502faf98a140e6bcfa373e820429c2f8db7 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c5a4f15fa13dc965bb124ea9d515fce42589a032 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/eb721cc0cda1bdfdc4eeb77cf2d7598054bca170 | ORPH
    i586     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/5fb5c24ee8893bb62a050ed1c6c11081b820b697 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/54d266407d2ffd68f71585c448d78e1b3426113f |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8793d7dede51de8916e4e91d95a606e9a986a755 | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/099d2c792ba2bd43f1102820ed8c0ba0d4747092 |     
   arceb     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/4884cbe3451ed9f98af5894d0cd08d5c87c5eeff |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/27cb4c39113c9cca91537c24747c1bbf3977665e | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/5a0ff202763c72d8176bb7c9a3a5a45b89385b99 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/edf9040085f3ae016e574c4e43de859c89707021 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/4e3368241fefe9052fecec1367ed099ab2eace03 |     
 aarch64_be  |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/92dd4c1df9869dce9121748c667322d234a2519b | ORPH
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/269a4fbfda799ff6221dfaa1ad2ba199a57c116c |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a9b27c07f7785664f88b2ff77bd1fd5b0997f7b9 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/71002853215b1b4e401d95247df31811890315e2 |     
   mipsel    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/27f3d156014fd5da483fc248a31b6ef0ce9e6b45 |     
   mips64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/92859a505bb95d06fd86756942ad6469dbd5beac |     
   mipsel    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/700239d429fb35870961991d57ebfbe780e29977 |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/518c6b5cfde67113281bbe128c5f595d68b3a973 |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a79d0937a358c9379ac2a34eb63038b4fc7f56d5 |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4f5426f82685d08099a80667cc1a76477ee2c5be | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/caf5289e7edc84ed067cb344efaffb26d3b3eec8 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/4ba8df1d8d89b85db547eec5113b428907ac9466 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/cc92aeec64b9cc3694c120dc744ab144a2ee5e99 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/6043aef682418c1f58c850dc533a3950adcab4c5 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/f88106cb280ff6f4e4879e99207379fcc5da15c8 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/8f52308138e10dcd2c641f97d9909a0b66b6ba3d |     
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/29b2f13cff6bfef6e9bbb10c8d7a94cd8b52e09f | ORPH
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/200cffc447c76d870c4260e33913cead79779062 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/82149f71b1639f80064098b2c77a1d0338a1f7ed |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/96e39727115fa4b047fe726655301b93d8b4478a |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4c77eb31326e9c1d9bdf152044820375763dd19c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cd8912845dc2528449039af1c1c20bc40c8553de |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8f8f13871c35e7406903ec58add3a51911b99087 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fe8fee0819d0837d65d4c53f06038391b8842077 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a0d736725dff820c06c2e84f49891b8b789eabfa |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a423d7475f622499aead13f20e7bc6b2de29b9b8 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/1f84a880d869582082f5c38d1fe93371518eedf6 |     
    i686     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/839a4de5198887fe96257841fdc376cfaffdbc73 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/552bbb845332563ab062eff89cbf941ad0c755b8 |     
   mipsel    |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/7ae3eb01cfb946147d755f1895efac628e767dda | ORPH
  riscv32    |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/fd7d47597152f840fe006ea116a63887320d4d39 | ORPH
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/55df65582660c91abb75b45a1225733ec630b0cc |     
   x86_64    |       iucode-tool-2.3.1        | NOK | http://autobuild.buildroot.net/results/3d2d9e27aabcd6763510238087fe25d5273d3535 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/7450eb062822151ac388c7c359a905dbc714b80b |     
    arm      | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/759197a3b33d75c7de6a30a83e74e7c72cb80f66 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/25fdc539e2cc7536ad91841bbe1fe8f697e001c5 |     
    arc      |         libglfw-3.3.6          | NOK | http://autobuild.buildroot.net/results/7381e114fa5c796c6edbb2c8e3987563bb32b6fa |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/4f6df7ccbcd6fb95f9b9662241157a4cec2b1a67 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f1a14b91bd8e9fa5fa753c7fa15eeba348363d4c |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d554c59449b55bfcec03af2317dbea26da225072 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/095f88fcb40b479d5bbf2205f717dd2c292bf91f |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/903e032a7fc65ad230e7727689b7aeaf6bd770d5 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/25045214da57fbe5c035afbf5c130f77265e2974 |     
  mips64el   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/036bf8f972ed571579a8d9f10bf11bb45194f9eb |     
   x86_64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/b98d0f4183943b31a48c5c12defd69d1e98be750 |     
  mips64el   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/513f4a68e47809eb5c3a16d20b7a17ba9a33aee6 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/826a5cc08921764ce33ee7edd59f99e513a39120 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f0775934fbd9d385467fd2a848cc61933b87b436 |     
   s390x     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/0ecf0caaac8d30212127f45fc4f5939550886641 | ORPH
 powerpc64   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/dc212d92006603bbbba982f3f4b38fe65b9c8f3a | ORPH
   mips64    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/4ce01b51f8cfe6194d5a2522d85ea2f44377f3db | ORPH
  powerpc    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/90909c4cc53800bbacf2da7edf126587889f1f51 | ORPH
   armeb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d7b3d15ebf80ca6dbbbd4554af541182c777e4de | ORPH
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/deb59bb011fa4a557e7faefa81c6062617d4e743 |     
   s390x     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/31aea744af10d34bcd3ff66cd4b530d06b771e7e |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4bd6233f93b9944319435cacc24988860f7c4082 |     
    m68k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/3f0814071b81850c88ba1662c5b36582d08c17e1 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/247cc7cf5ad99bdc405b1641beaaa6a31f023c8c |     
   mipsel    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0fb8f3a1bec09f4f376cf2c9b427bbcbff4ef47e | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e8a6e922f1a3c1dda7a033df61f74c7d15e696d8 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a0ebc7d2028e9216130440fff4c64680e954f40c |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8f7ea172568205acee0e1ac76bea4758194952e4 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b5dd936255e24eb3d5675e9d04873bfc489fb5e2 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f88b88c1692c141b67598a6d0805cfd9f88a9ae0 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/71941973e09de86e87d7ff2fa950718420155a75 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aa9d9cb39193796da6085782f66eadb45c689da1 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5ac3abcaf01cfa1155ff4622fe1a833db19baccd |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7d1c7009d9c790731563ba4cdb49452f4f640a34 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b284ebfa8c1d952446519347c28ab38889ae97d7 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/889cda404c0d80ee2520a8a7939fdf911c12f31f |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/09b0ecf3e224c7f428cbd039f615b52e836aef7f |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1d9d7a678e90837fee1764fb9a0d1fa2a517edfe |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f6c32d284dbf9e2fc64f6c013ef256ffa1091578 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4a3f361fea6842faf61ef45d36f2999c954ac632 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/feb07f8b62010b6b0aa5aa31637e39280b67895b |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/acc614bf37c43b1433a7d9e96264f36ebd67c67e |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4118d6e61bf78d1665e54f14b2b89647a256696a |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/16266afaf1989c5bdf6efffc3c44a9684154c7af |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/20b7d4dba0a96890374ba4e4fe8307c637347d30 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/95bc273cc1ef52981bcc9b77db24e0780844345f |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f02c2e21fb90a0c3fa4e10b5ca8803247014a77e |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/18c9dc0a924df2f7544edfa0bde77c2b6dce6630 |     
  powerpc    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/02f1b490f7f34a155e47a486d030fc23dab4cf57 |     
  powerpc    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/13d8bcd57b38fc71f019a7fe3d4fac3ecea7fe61 |     
    mips     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/8abaed031b68295c1a28f9b42f81f3fbc32853c5 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/385a1233354ea8ee3dda88aaf30c548a3b00bfdf |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2462fecda77566758f532889fc116fca76217be3 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d2abb768ca6454bdab6244479737550e5c04bcea |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a98dec70e00fe8721a7df76232231923c0312cde |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/872aea6a30e3112d743d1e615ed7afa2457b434a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b6a8e6170ccf3b56df0ed70d8e98230a915b3736 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/72e797440a02b43f806edabe9d3bc2c855768fcb |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d34b229a8c433c3822f9e09b9c0218adef1e0a95 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/538829cd9284673dcef8f7071e6cd1d0f697c41c |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b19f4682b95bbcea074e784ace11f0a7a2f5fd62 |     
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/069492d6b7357bcf3c43e2a40f8714bee917d3a2 |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/977ab17415bd1d8bab84824dc632c6a4cb681383 |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/a1ecc257f4ffc4b440006349f8d2dfad0dcf3597 |     
    mips     |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/3b2f5bf1e805e68271873209667da21247ab3241 |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5ee69d7f9692d4f35b86a33a8a70c6796923e37e |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3672fac3fc15a51a0d4731d2622fbdf2c6d2e980 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/7f5627f560e5045dedd2045408bce577e3455c3d |     
    or1k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/d1b246a43bebbfeb80a1b5d0ce7e426538273413 |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/bcdda7898265ec7d9f70ae86bb2094cd879edc9b |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/9c96917fc4f0d31817d52853e645f4823971856c |     
    i686     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/76eaaeba03e0e7fc27b9c2a3acbdd502604b539a |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/1096ff21bb7a914a1451a63d6184399460613f9f |     
 microblaze  | qt5base-f31e001a9399e4e6208... | NOK | http://autobuild.buildroot.net/results/93f036c7d04a186188bc2bfdeb3d429d4a1eed62 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/8b745407c65ae8216d2cdbfcdec14ead2f894b97 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f25edaefa53868d6687ceb9d51f94e3e32c1aeda |     
microblazeel | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d5c8d6f24a1d1e4ec8f3049e31c432dbb61fcfe9 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/3e0e97c9920a668c3b1c01af01a8ced9a0a1c15d |     
    sh4      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b617cbc1ad62627e2875fd91c09bcc908054c18d |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2e782ab4e034c9b29c2634a2ea6e08ea54ceac23 |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3044d270f2ba122a262aa3548abff12b2420fbbd |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/797509d4c6eb3daa6c9c41c1e5c2122cacdcb687 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7597f09e5275fba1ea3f0f981d5eb9966268de98 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8ea4ecc07e04c38b59112b3ff92c16ae0a090905 | ORPH
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7cf2ac1773172e96d9aae191da83bdfac31e7683 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e6c70ba9c46a5566b644dbd7beb41a8ad1744e8e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d7c5b5ad697fa28d5fa85fdc98523b378b12c241 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ff73995bbe3526badb1b43760ddfcb8c53342a74 |     
    arm      |           xen-4.14.4           | NOK | http://autobuild.buildroot.net/results/0cab6893834bb5c5ca93bd8843ddfcf03bb76f37 |     
    i686     |            xenomai             | NOK | http://autobuild.buildroot.net/results/e0205880a4e6010590b48bf71399b56f41979e56 |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/d7ba7c43b43290f2697924807cc15911521664fe |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e0f732bf22f40b2f2b423d54ab68707db6f2f3af | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5068fadefe6a120d7c15c65b325e4d7d96766e82 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/af3b12aac4fa35cf2333288261a299d48e815693 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/578bf80eed1d8624c8ae2f9bdcb580a4954f7b67 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             host-gtest-1.11.0 | 1 
           libmemcached-1.0.18 | 1 
                       libuwsc | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/2d6ccb63735f454aff7197a8582d0ee6843eb843 |     
    arm      |      libmemcached-1.0.18       | NOK | http://autobuild.buildroot.net/results/5d12c371385c658adeccaa4fe816d82b6a1207c1 | ORPH
   sparc     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/6477762c53c0a647c5e6d2150b57ccfdb9de28c4 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/cef49483bf04aff8691712922f7211636e19823b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
