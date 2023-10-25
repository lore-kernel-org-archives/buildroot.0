Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7120FC25B47
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 05:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 079A34071B;
	Wed, 25 Oct 2023 05:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 079A34071B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXKGThfBq8l6; Wed, 25 Oct 2023 05:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2ED4354A;
	Wed, 25 Oct 2023 05:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2ED4354A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34CF81BF400
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 05:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9220706B1
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 05:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9220706B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDyjEpL3OxUv for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 05:37:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85F1C7064D
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 05:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85F1C7064D
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD7BC1BF209
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 05:37:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 05:37:54 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231025053759.C9220706B1@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698212275; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=edHO5MiZIyjA85L/NAR3GQNkca7ZD6vidiYkBRv1WHk=;
 b=mgsa0wFTWoEIREcX83EMUr9/gGwMHiw91JFvHPjbFdcgmD9f3l5goLktfvfKEJe16XVxe5
 OO7Q5BcqGWLritEQJ4nWyV3aoYZaK6ZhyT5r4TZSwNP4jQJlnmwbgmmOfcnxQso/YfBRlB
 /+4vWhxYSXFbZRmcFjAApi2bholphPOMNFUvOFwc8z84OL0mUdxjVfzh1rzHEowuk2iAdz
 tJYB4Wi78oDurscFiSWVc9a1uTce8wv//gjhYyAsUYwYNlHOqkekVnP24HBRO0Lugi2fRi
 VM4k9j16Rh/KuPru/rPRc5h8pdxeoaMrK9MEPujCucmSinqc1Ez42+sZZWVhgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mgsa0wFT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-24
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

Autobuild statistics for 2023-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  | 15  |  2  | 30  |
  2023.08.x  | 15  |  5  |  1  | 21  |
    master   | 41  | 67  |  2  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 11
                   bird-2.0.12 | 7 
         spirv-tools-1.3.261.1 | 4 
  gobject-introspection-1.76.1 | 3 
                   linux-6.5.8 | 3 
                    brltty-6.5 | 2 
                elfutils-0.189 | 2 
         gobject-introspection | 2 
              host-rust-1.71.1 | 2 
               mariadb-10.11.4 | 2 
                    pppd-2.5.0 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.23.0 | 1 
                 c-icap-0.5.10 | 1 
                  conmon-2.1.8 | 1 
                     efivar-38 | 1 
              gcc-final-12.3.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
google-breakpad-c85eb4a59b6... | 1 
        host-sentry-cli-2.20.3 | 1 
               libglib2-2.76.1 | 1 
                libselinux-3.5 | 1 
                   libzlib-1.3 | 1 
               linux-pam-1.5.3 | 1 
          lttng-modules-2.13.7 | 1 
                    ncmpc-0.47 | 1 
               nfs-utils-2.6.3 | 1 
                nushell-0.85.0 | 1 
                   pcre2-10.42 | 1 
                    php-8.2.11 | 1 
           php-memcached-3.2.0 | 1 
                 samba4-4.19.1 | 1 
                sedutil-1.20.0 | 1 
                    strace-6.5 | 1 
                tpm2-tss-3.2.2 | 1 
               trace-cmd-2.9.7 | 1 
                   uhd-4.3.0.0 | 1 
                       unknown | 1 
          xdg-dbus-proxy-0.1.5 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/196450d7c55db1b7c434d0e2e6dc6df7e5af390f |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/857044e1be293d9dc37df4b04173d41b4a6d7657 |     
   sh4eb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d623b01a3e0e59e63d412dca3507892b865d85cf |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/70ae53efc78be62576816084824a44f49a1d5502 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7bcc726ee6e06bc56b4e3aaf78b01e1f4aec28bd |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/549967f47a7b6448290adef162ca12b2462ed2fe |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/96af8a45d4b8b301b9ca99f5227d3634ab9a6b0a |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ec6206acc75ab691e94d684baedfd1395c8f3c41 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/38b691846599cf9f61ef74de7da0507b3b8c6996 |     
   s390x     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2e1f609ef47c820b69a7fea63d4a7364d7342364 |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4e63c7b727cd9260e8b835d8ea67f66c696079c7 |     
   mips64    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/bca84915550a72f1dc89c8661cba2545d6bc96ef | ORPH
   mipsel    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/dd43f33315c6c4aa738cf8dabf67539c9fbc31c1 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2e4c8a9a64afa14fc803339aaab8097f9c61befe |     
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b967963dfc714cf4865adc30baa20326e690df26 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c397701f7e233b4e65dfb5a203918e5e5f1076f8 | ORPH
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9ec45b5a13c5f0e1e1faf86e21660cbd4c846ac3 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/4eaeb8cd10f2f217e0d8539982203cc7776a291b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4f540bbf99d9d514169f7614454f18ae1f8e0ff9 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d0b30c0f170b819d2a03613f0ca3e3797b41a4da |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/66c73b402147b1bbe7ccbd50f250e1cecceeef46 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d473cb47faceddb2082445c322b42a600d7cd30e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/728c06d24a699d2d4a6679987fbb50110b89149b | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/d8cbad32e4ca561b8f4df261af9931c34a0f799b |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/49b2fe20cf7f337572418cd0072195f93f2af354 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/0bc235c418b5704830c991af99ea2c55e2f3814e |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/70128c2d8381b35ba621664a2a9f6877c2a3b472 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9152cf66a4ff38184a55ece8d7647cd4db68dcc8 |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/a4a92d479daeb3faa120b3a02730e4c45470ef87 |     
   mips64    |          libzlib-1.3           | NOK | http://autobuild.buildroot.net/results/9a6115300bf7ad03dc18aaa9545356a7a18de2de | ORPH
  mips64el   |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/234ce50730d20f437132e386a6fbf37669a43058 | ORPH
 aarch64_be  |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/d24ffeaa3500dad00f2be75863156ce470a064fc | ORPH
    sh4a     |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/a3be19ef3881a34b5f2322b39ad9d9787b4c5e26 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/82a5a38816ff0b0a3f3bf18a34539bcf93bc9214 | ORPH
   armeb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/5ba8c66c49728f51b4d690d156e33bc4f8cf250c |     
   mips64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/0abc5760f8e205dac848394a3ebebf018016334d | ORPH
    mips     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/5ce0ecca74789e08fd4518054041c42eb112abe1 | ORPH
  sparc64    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/b06df152d1b87428336287a0b87b79adb2c03881 |     
    mips     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed |     
   mipsel    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/4fd0df3b6b41fd7a1a69047fa10c8d6678594b3d |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ee25f8d3eb5e145df8ec5793f6f03aa496fefa08 |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/62e3a67a7797ce06af9757fd7ed5bd7445cb88ac |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9632751b2b05707401017f4c1ce4eae2b75a9a16 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ecc76d46a25aa1614188ffcf5ec513c1e2ed42ca |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e7c092143d68be18ed814a6f47201a32ff3de711 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f5762f33b2c89e0543a5a41ed87fbd3c8a52b843 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/486405cf5dad8da6ba0e027e17b1af05a6ea9378 |     
    i686     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f7a69dcce5c595e7caccb97b12d901bccb4c3c54 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3a7dd60f8b6eaa197558e6b520e2862586f93d4c |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/4035f291286b35437a8656547bebbdf39dcbb74d |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0cc06fae48dc5301453081ac82d64a50f781e7cd |     
    mips     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/64e5b29f5bb4eb5fe0ebab9fe5892155df6f4503 | ORPH
    m68k     |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/3b8155e089bf17fe237426d6c7e291066a386e54 |     
    i686     |      php-memcached-3.2.0       | NOK | http://autobuild.buildroot.net/results/b140d225208e7fa44b935a119e74347caf710e55 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/67831f181b71232de1d4947566f984c909ae7498 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/69198391835f1b18950d63a5fb861396b4c8fb85 |     
   mipsel    |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/c02bd208dc3a7574f07ef2d8f1dc714541379b9f |     
   x86_64    |         sedutil-1.20.0         | NOK | http://autobuild.buildroot.net/results/0a1fdbddceec68291ce678453fa1d791036aa269 |     
  powerpc    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/751a625c815e9861d01dc4e09ab2ec4eb7bbf14a | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/480f66530f5a326cefec37df80dff1a778f801e2 | ORPH
    sh4a     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/c2d4acc915e54021030d5a1496eb30fe47a5c0c2 | ORPH
   mipsel    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/6abd393ba292f5d588969004b9fac61748b15b02 | ORPH
    m68k     |           strace-6.5           | NOK | http://autobuild.buildroot.net/results/56d3ebf8ad0b157b4a8782c98745f1204843775f |     
 powerpc64   |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/4b4131e92ecd947923491e5b8c734ea38d604464 | ORPH
 aarch64_be  |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/13134992b0e5348acc9436b3b05d6caa7683881e |     
    m68k     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/e536d7266eb0244041cacbcb59608991f97fda63 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ee5c6021f8d0ba1e37b1ddb9cd92bd8b2ff32711 |     
 aarch64_be  |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/70fc8c045d5451e39a6da9b798ef5d1bee1fdd90 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d1e6a44f76e99387c929ea40905a328754380691 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.20.10 | 3 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.38 | 2 
                   bird-2.0.12 | 1 
                elfutils-0.186 | 1 
              fftw-quad-3.3.10 | 1 
         gobject-introspection | 1 
                heirloom-mailx | 1 
              host-rust-1.67.1 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.3p2 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6e8603d3240320c474a1642ecb6dd9cd9a161cc1 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c8df386d976979ca85532f0061b3213493ea4fc | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/2cdc669428a76e4c4d88af71b1115ba94a34d71a | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/43a26ee4673d75e12c88986ab6b2a2f0a3e1679b |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2cd3aaed3fd34a1037069af0be5b98b1cc1d6a95 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c3507851d308171c9f33fec5ecfe015149358e27 | ORPH
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/f0d73a59163ca7e80649955beb5bfd1cc96c89d9 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7a6e24f75e6ae60b704801efc527b6b7065a2cef |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/928f24a788494b9ff5b4eb4bd18733ef10ab790b |     
   mips64    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/1fd75ca06c8846552e47838a9875c55110fbd977 |     
    i686     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/49dac72b9c669707a7605c6dedb6150924f1c7a0 |     
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/5ff467f513f56c8ddd3d19329460f94dee3c317e |     
   armeb     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/b700467bf68bfe9881a0b9f496afcd9e4e71c53c |     
    arm      |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/f98ec568b1c3d2ec71b8dad62879b682daa6f0ea |     
  sparc64    |         openssh-9.3p2          | NOK | http://autobuild.buildroot.net/results/97883d1156951864197a0a8cf179c6cb8cc41f27 | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/ac1f687c3384bd17f4252f2c1e15fd738da03db7 |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0f0a54b8eb832660f8a7b3e8e74d67f2a972c34c |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 2 
               valgrind-3.21.0 | 2 
glibc-2.37-45-gb4e23c75aea7... | 1 
         gobject-introspection | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/1edc6a5fd88e9d24818babaebd54af83fbb5d082 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/df11b0079d5742815bd059923b08222c872dd028 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9f251e0758d0960c0db046123a8f2c15fa4bcf83 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/93f9440bded086e374778d668f8d8f3da175b036 |     
    mips     |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/151c7f1791cfccfd97902b8e040421cb8d9f5f0e | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/8b5613aecb485da606d8a0fc1e81c65010222d9c | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
