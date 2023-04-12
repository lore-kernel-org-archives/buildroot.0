Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD00C7619A
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 05:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 761D4817B5;
	Wed, 12 Apr 2023 05:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 761D4817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndXlNX5hUmkx; Wed, 12 Apr 2023 05:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02AA981815;
	Wed, 12 Apr 2023 05:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02AA981815
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 829EC1BF3AD
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 05:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB6B408ED
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 05:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB6B408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J36Idt68fhfz for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 05:29:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32534088B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C32534088B
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 05:29:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A44754000D
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 05:29:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 12 Apr 2023 05:29:50 -0000
Message-Id: <20230412052958.4FB6B408ED@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681277390; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ADNnwQBngWxLjATsyMBzzOpzAktwu+IDSlqsA04g0D8=;
 b=bCiTlPHZkq/jhiQWL0l30uZ1LJJF5UqRyAYVZEkKUCW8TDKJQ01s1aLkfkVsSM9g/4iicg
 007OPp/kAceBjttRTbT3O0NKinJB0BgAPsblGQrHfx5K1EuuZj+apaHTpm9+5/ypfGK3eO
 pcz2d0nP0Yu/84//ppkRQ3/jCwuyRn+oWxrkunSmbQzJsUvjQyeQn1Br8vmUg03ucvhwJ+
 bQCyz205sAxejSWoAUeCF444Q7AFKIMtS1GeYqs0pK8+RtYKtbRiXASMJv6Lz6Brjl6FPv
 LLS4q0rn2lNI6Qq6zpjPJn7EgHFzqs+j6I9Z05luVmOr9ar4lgtTS6/SONntsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bCiTlPHZ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-11
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

Autobuild statistics for 2023-04-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  9  |  1  | 17  |
    master   | 53  | 78  |  1  | 132 |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.24 | 12
          refpolicy-2.20220106 | 6 
               host-qemu-7.2.0 | 4 
                host-go-1.19.8 | 3 
                 wolfssl-5.5.3 | 3 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
  gobject-introspection-1.72.0 | 2 
         host-gcc-final-10.4.0 | 2 
         host-gcc-final-11.3.0 | 2 
                  linux-6.1.14 | 2 
                python3-3.11.2 | 2 
                       unknown | 2 
                 agentpp-4.6.0 | 1 
                   bullet-3.21 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                haveged-1.9.18 | 1 
                heirloom-mailx | 1 
            host-binutils-2.38 | 1 
               host-efl-1.26.1 | 1 
         host-gcc-final-12.2.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
               host-zstd-1.5.4 | 1 
                  kexec-2.0.26 | 1 
               libdeflate-1.15 | 1 
               libglib2-2.72.3 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
                  ntp-4.2.8p15 | 1 
                     php-8.2.3 | 1 
           python-pyicu-2.10.2 | 1 
                    qemu-7.2.0 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/981984b8d7cbebef02cdea40dd737c448b7c6432 |     
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/7381f105586d0437db57e3283358552732949070 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/74c7a438bd547b1b9516a3b755f939e6fbe03b6e | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/184d8e86af58abe1201ee015c34a13c5fdd0cfca |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a44c0238bfdb31efaef312fe8d0e63dcddaef028 | ORPH
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/2e2ebaa42e051775d50cea968de86fe95b8f959e |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/db9f0a2b643c1255e01cb9224ba154b3279455e3 |     
  powerpc    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/11316f8ed26cd48c5c829a709e3d5c53a9c9c608 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6ed1640ee9f1b53a5e724b2d30b271832a7de6af |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/59bbcae1609c23b43d56243b1f0f21520731014d |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/31aa6871dd92bc308b0c9009fa0f56b175687323 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3576266a5e6c6ee5b9017c352783058fe6a75116 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8f3dd61a65fffb4a2bf74bfad5a680d4954f14f1 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c11fe42d577691e70d46f6ae6930dd0e173450f8 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/21559a71bde6f1abe68b111200934882fbc8a9d1 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/405f48783acaaa18fb111843c45940d3e0d57618 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/49b554d908b39c7deb347bf3d67229d7cf7bd088 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bdc1e5987b4b2d58456d4bc7d2f8b989344ad973 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/40656b511821153dce1c629db50fcf15845fcb9b | ORPH
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/78556b01eb7f26bd10a87ac42f81f5fc4805100e |     
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/d886c3c14557dd4b1025679d954acb84c5c8f4a1 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/99a2faed334785d242fc9640ed4e389f3da89759 |     
   mipsel    |        host-efl-1.26.1         | NOK | http://autobuild.buildroot.net/results/7e2186c94162ff0eecf86c641c9d87bfbbae0bd6 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/a77378541c3d2146157085faeca98906c27cde22 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/170f1ebd2c0efd1f66f1876d06c6ab120bff5d07 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7363d854b71967a35eec595e801adce88612d1f7 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/82f6ca48928fba02c893a1d0d547ffb9d572c921 |     
   arceb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/acc95f8f2b13178cb29467bc9b8f2f311dafff1e |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/1b4538c97bafc7cf529174553fa62e5b0d14b24b |     
powerpc64le  |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/1c1a1e89736a11bab6c2d9adf040d20db281d62c |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c407c72660a657e1a07701022882ce4e12fa94fd |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/63ab5a6bd7023f3f158bdb025d68cd681ee506eb |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e3a2ee6f9c5b8275da331fdabe8a7f0e651e62da |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7a1cb3cd269c0397271b5b1decdbf35ecc5225a3 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6ed305ca97e0efc7c3477923d6a5cdbf657e144a |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/364152d22a8cbfa3dd1ec9fcf5f532e04fc2510b |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/748136f1949ac07d1b10054d0095fdfd87e686d4 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0fbc8bd3f43f03407fa19af48a9b355676616010 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2590a8d569dea0995351a46d91789bd05916951a |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b0ee0c74364c7865998a59d37351790c92736ce4 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f8e017a60d08c2d0101ed2ab37cfd9346ef9b159 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8b0588bb0d77615647a3e53fcc1e14ff603e95a3 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a80ca0d4b6ad3ed10b0ccd81c5b40d0cc8e132a3 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ddcdf8f10d9e3b0174e108cbd1651e9498df1e67 |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/cc5134188855dc477dd0790d42cab7da22291787 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/bb01fda7bf5c8107ad7cdfca9829406984eb414f |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/7e2aa6a9424f1b051bf184bac430d07b020bb5ac |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4bfc8cde76c9fb3136a7852f59451f93b9f7dd8f |     
   nios2     |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/0ffb2c938653221a67cb191de347ff8ea7fd42f2 |     
    sh4a     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/5dcf3f42ef90f6163f82158cd6d21978e7a035e7 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/545eea064dfe4dd88798f4bf39bc6101005d240c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9bc20e6b9c237fd1ca160c671fa0c45ddaa038bd |     
   s390x     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c9c9e334d04ab5427c7ec05b70ead5368cee349d | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/3f8baabae1d2022689738890035a3916fd2d092e | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/d76eec1c5db969f47611c2ada72a814cfaa4b150 |     
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c887a858150f3f020048a6a11f5c4ffb9d470714 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b793f732cf794290a0bc35882a13b65a36d5dad4 | ORPH
    mips     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/1a563d938cfc1028ea71c6c8ea82d65a2fc9d6c1 |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/1ba39a5b793b3cd98c6d5d9ba748b4c59ce02b28 |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/a5349c0815ff7a3eb1186518bb5efe569f2ff8b1 |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/fbb5f6c3a7108346b4f43f215f2907d554e01a65 |     
powerpc64le  |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/0666a3bd0d5c3ab0539a0f3701cc6d6914686f57 |     
powerpc64le  |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/85f0f5ebfcd29e6fe32319598e6dceaea2b8957a |     
   x86_64    |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/f7fecdafee2cd8cc425db591f69b9d5276c1aaa2 |     
   x86_64    |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/f9ea3a47bff95bbc3d96b9ebd2e2eaa8755d92a4 |     
    mips     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/7191c83872b9219b915a8841962b4a976beafb09 |     
   sparc     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/512a180ee8c4bde68003e7cee6b5a5481206a8f3 |     
 microblaze  |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/c44ec595eb163fd5bbec60f9550082425f092b87 |     
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e048b444af10c407e00db9825c9e8e187a8424d2 | ORPH
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1fa896650f4a202a34822a879ec48c994c435f48 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/ab95eff5ca2c22b44ed2a0ecefa79b01862a4b5d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/998ac50478e4f14cf8051e3483ada4daf17fbd5e |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0f67af1d83c30596012aa79023f1079531ab7127 | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/915160bdb50185863fdfadf642312b0720240d6a |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c2ab4fbcf25150fbd9a765f257eb39d391875677 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/72f4d6b806733646ff4028b01c5c11dec1d13dda |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/01826fbc9e65451a89b08d2327cb75f9b975ad0b |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4b4d22f9d572ace3024545e2b38b111af830bb73 |     
powerpc64le  |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/49ce9e9ee3251cd6dc93ab888bec8f67639a595c | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
                haveged-1.9.18 | 1 
               host-qemu-7.2.0 | 1 
          imagemagick-7.1.0-51 | 1 
                  libnfc-1.8.0 | 1 
                  linux-6.1.14 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b02aa31d2572111b74eead016e3bdac3021d4458 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ccd730054f2f2d9f3b0c6e1e9000602205e11a31 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4309b36fabc8a38a585232e6076e95a4a32887dc |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4c2a6609ee55325034ad306f09196af3275313f2 | ORPH
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/4e7651999c8a27114a6a4e243f54d1985b1c6908 |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ec8e31218145520a6e3b8b764fa904507d238c59 |     
    sh4      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7182d08d4935b31212229ce60b5cb26c5af078c8 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/1d4cba49899c0d1326cd00e190c9731b3707560e |     
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2055423187bfaecdbc589ace77e77339e471489b | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/98178712a928db404fbe2b21bf906ffd500de521 |     


Gitlab CI results for 2023-04-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274904  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274905  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274908  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275606  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274593  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274511  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274595  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274515  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275031  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275034  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275036  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275037  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275039  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275052  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275061  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275062  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275064  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275065  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275068  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275070  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275073  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275076  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275078  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275082  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275083  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275086  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275087  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275089  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275091  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275093  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275095  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275096  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275097  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275098  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275099  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275102  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275112  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275119  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275123  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275127  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275132  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275136  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275138  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275141  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275144  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275147  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275148  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275152  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275156  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275158  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275159  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275162  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275165  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275169  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275170  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275173  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275175  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275177  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275180  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275182  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275184  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275186  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275190  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275192  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275194  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275197  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275199  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275201  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275204  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275207  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275210  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275212  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275214  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275218  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275222  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275226  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275230  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275232  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275235  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275237  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275240  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275243  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275248  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275250  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275253  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275256  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275258  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275260  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275263  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275265  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275269  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275273  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275277  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275279  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275281  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275283  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275284  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275286  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275288  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275290  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275292  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275295  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275297  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275299  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275301  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275303  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275305  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275307  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275310  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275316  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275319  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275322  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275327  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275333  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275338  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275341  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275346  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275350  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275355  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275357  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275360  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275362  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275365  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275367  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275369  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275371  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275373  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275376  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275379  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275381  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275383  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275385  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275389  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275391  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275393  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275394  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275396  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275398  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275400  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275402  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275404  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275406  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275409  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275411  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275413  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275416  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275419  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275420  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275425  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275429  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275433  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275435  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275440  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275442  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275445  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275447  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275451  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275455  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275458  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275463  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275465  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275470  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275472  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275473  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275477  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275480  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275483  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275484  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275486  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275488  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275492  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275494  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275495  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275497  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275499  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275501  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275505  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275507  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275509  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275512  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275514  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275520  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275522  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275524  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275525  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275527  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275529  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275531  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275533  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275535  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275538  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275541  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275544  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275547  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275551  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275555  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275557  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275559  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275560  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275562  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275564  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275568  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275571  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275574  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275577  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275581  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275583  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275585  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275587  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275591  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275595  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275597  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275599  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275601  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275603  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274909  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274910  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274911  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274914  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274927  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274943  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274980  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275017  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274471  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275607  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274504  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274498  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274499  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274619  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274622  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274625  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274623  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274628  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274562  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274564  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274568  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274574  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274627  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274525  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274527  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274529  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274531  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274533  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274535  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274536  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274539  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274630  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274633  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274634  | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274639  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274642  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274659  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274662  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274636  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274640  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274644  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274646  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274650  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274651  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274674  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274676  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274655  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274678  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274666  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274683  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274668  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274685  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274688  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274653  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274680  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274690  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274672  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274664  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274694  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274878  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274670  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274643  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274661  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274663  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274638  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274641  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274645  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274648  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274652  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274675  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274677  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274658  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274679  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274667  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274684  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274669  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274686  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274689  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274654  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274681  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274691  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274673  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274665  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274879  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274895  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274671  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274692  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274693  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274696  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274697  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274698  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274699  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274700  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274701  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274702  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274703  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274704  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274705  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274706  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274708  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274709  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274710  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274711  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274712  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274713  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274714  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274715  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274716  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274717  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274718  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274720  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274721  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274722  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274723  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274719  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274724  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274726  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274728  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274730  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274731  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274734  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274736  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274738  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274742  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274743  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274591  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274837  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274745  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274747  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274749  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274758  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274767  | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274811  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274817  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274754  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274756  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274757  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274763  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274765  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274769  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274772  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274775  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274777  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274778  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274779  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274782  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274784  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274786  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274787  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274788  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274789  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274790  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274791  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274793  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274794  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274795  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274796  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274797  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274800  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274803  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274804  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274806  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274809  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274810  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274812  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274813  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274814  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274631  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274815  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274816  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274818  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274819  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274824  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274836  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274838  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274839  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274840  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274842  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274849  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274846  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274854  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274856  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274858  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274859  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274862  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274865  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274868  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274871  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274873  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274874  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274875  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274852  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274834  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274876  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274877  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274880  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274881  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274882  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274883  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274885  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274888  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274495  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274890  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274892  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274893  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274894  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274898  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274899  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274900  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274901  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274902  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274903  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
