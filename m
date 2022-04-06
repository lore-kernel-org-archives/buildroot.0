Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E83C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 05:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40F740B2B;
	Wed,  6 Apr 2022 05:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukCzyOCvoo_O; Wed,  6 Apr 2022 05:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F5FD40B24;
	Wed,  6 Apr 2022 05:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A33F1BF962
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 05:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA8D8408C5
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 05:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5EZRM5BsWyI for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 05:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D46F402D2
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 05:29:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C10E6240008
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 05:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649222956; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3i+XIL3HeAy8oMj5YGoTUGt18iuTW2El+Y1RaC2eglc=;
 b=L4tH0J5PFNWuAJbm1Asr+NZIBn6rjZSPgwcRu4FbNdjTpYfmk64cy+jmpsuDujxmfUxOY1
 ZwJWjWoo7XIxDAIS4ZRjk+scEnI9IOwcdB9YGkGZMBDN7hcg92khEiRIiQur8g3q/evDR+
 +N/4pi4aTbis0ECOfqYSXEFA+Hi+EBigT1li4sWue1qkFP7HNVGfhirJwbREe1GleOG6sq
 n80H+MOL8DdeMzGcqW9DAVCvu60g2F+QrgbkWeNJwBwc5jJinMYaLvpQ9o6Ue9CS6rvX8o
 cKgK6xVEVkr7K83+nSynRO++lNXwQn8jFbXXxS4tRDvbOXuUMD2icuS7rGNgng==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 06 Apr 2022 05:29:15 -0000
Message-Id: <20220406052921.EA8D8408C5@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-05
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

Autobuild statistics for 2022-04-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 61  | 36  |  0  | 97  |
  2022.02.x  | 31  | 49  |  2  | 82  |
    master   | 161 | 464 |  4  | 629 |

Classification of failures by reason for master
-----------------------------------------------

               libcap-ng-0.8.3 | 54
            host-binutils-2.32 | 53
         host-gcc-final-10.3.0 | 34
          host-util-linux-2.38 | 29
                 dhcp-4.4.2-P1 | 18
           argp-standalone-1.3 | 17
             libopenssl-1.1.1n | 16
host-elf2flt-7e33f28df198c4... | 14
                 uclibc-1.0.40 | 13
         host-gcc-final-11.2.0 | 11
               util-linux-2.38 | 8 
              fetchmail-6.4.29 | 7 
glibc-2.34-109-gd64b08d5ba7... | 7 
                python3-3.10.2 | 7 
toolchain-external-bootlin-... | 7 
               arptables-0.0.5 | 6 
                     refpolicy | 6 
          host-gcc-final-9.4.0 | 5 
                libressl-3.4.3 | 5 
                 minizip-3.0.5 | 5 
              bubblewrap-0.6.1 | 4 
                    git-2.31.1 | 4 
   linux-headers-5.10.104-cip3 | 4 
                  acpid-2.0.33 | 3 
                   host-nodejs | 3 
                 linux-5.15.30 | 3 
linux-headers-5.10.104-cip3... | 3 
                   perl-5.34.1 | 3 
polkit-a2bf5c9c83b6ae46cbd5... | 3 
    toolchain-external-bootlin | 3 
                       unknown | 3 
                 wavemon-0.9.4 | 3 
                bitcoin-0.21.2 | 2 
        edk2-edk2-stable202102 | 2 
                     frr-8.2.2 | 2 
       host-gcc-initial-11.2.0 | 2 
              libeXosip2-5.3.0 | 2 
              libgcrypt-1.10.0 | 2 
               libglib2-2.70.4 | 2 
                  libnspr-4.33 | 2 
                   libnss-3.76 | 2 
               libsigsegv-2.13 | 2 
         linux-headers-5.15.30 | 2 
                  ntp-4.2.8p15 | 2 
            qpid-proton-0.35.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
toolchain-external-codescap... | 2 
                   uacme-1.7.1 | 2 
                    vlc-3.0.16 | 2 
                 zlib-ng-2.0.6 | 2 
                arp-scan-1.9.7 | 1 
                     aufs-util | 1 
                    azmq-1.0.3 | 1 
                  boost-1.78.0 | 1 
                 dash-0.5.11.5 | 1 
                elfutils-0.186 | 1 
                   expat-2.4.7 | 1 
              fluidsynth-2.2.6 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
             gst1-libav-1.20.1 | 1 
       gst1-plugins-bad-1.20.1 | 1 
          host-binutils-2.36.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.17.8 | 1 
                     host-llvm | 1 
                   i2pd-2.40.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.15 | 1 
                  kexec-2.0.23 | 1 
                libkcapi-1.1.5 | 1 
                  libsepol-3.3 | 1 
              libuhttpd-3.14.1 | 1 
                  liburing-2.1 | 1 
                         linux | 1 
               linux-pam-1.5.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220121 | 1 
          lua-cqueues-20200726 | 1 
               mariadb-10.3.34 | 1 
                 mesa3d-21.3.8 | 1 
                    musl-1.2.2 | 1 
               netatalk-3.1.13 | 1 
                  netsurf-3.10 | 1 
                nodejs-14.18.3 | 1 
                       opensbi | 1 
                    opus-1.3.1 | 1 
                      pigz-2.6 | 1 
                 pixman-0.40.0 | 1 
               poppler-21.12.0 | 1 
               postgresql-14.2 | 1 
            python-ujson-4.2.0 | 1 
            quickjs-2021-03-27 | 1 
                  rt-tests-2.3 | 1 
                  stunnel-5.60 | 1 
               tcf-agent-1.7.0 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
             transmission-3.00 | 1 
               trousers-0.3.15 | 1 
                    vde2-2.3.2 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/daca163055a0ebadd1429c8ebe7ce417fe6d044f | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/fc45b7452ccba73824c891c85df9a51e2808073c | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/3a8143a9dbeaaf54d7bb31fa3302c797a34c7de4 | ORPH
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4c4902c10c461edccd9d19dbd707f5d1a54b553c |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/de643c272959bdb2abf492dc6355b3f070700dc3 |     
 aarch64_be  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/62627d4caf26ea779a83015f84de32eb9f933c8f |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/abd285457025014c9edd188c896d047a9c6036cd |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/993d4ff30ea1307139f1d61a87774a6fe93ca5cb |     
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/98b0460badfb25d61f2ded4bd8d514343f8c11e5 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/56bd4a08daf594b077cdb711338ec661d62b2d4c |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4688b1c928926559df95b999fc46a1364b00d4f0 |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2e7521e0ef558c311c9f5d816e40a4fbaf4d5403 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2bc37b6d39515f3e55ebc1e5de039ff00423088f |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/ec06546ddad277efee9574ec3cfab9d214ce26ca |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/bc711e2306ee163a466e1266e0680f310a8acd7a |     
  mips64el   |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/3a3119c75874c54f4fe716d6b76a68f178fec26c |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8c12a8d961bd85c35faa87a21373c22d5f0de707 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/bb22ff237173d4bf823462d5c3be5d14830b502e |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/53edf33d3f92e1eba634b1c7f4e3a006053026a2 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/1bd7fa7bdeeb46dafa93d74d619dedf0782efe39 |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/81a1769cd171dc6a0222a5d2815722fb54fdb5bf |     
    mips     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/58fe75adc3fd7a03f89a20fd7770067868d395bd | ORPH
    m68k     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/08e1934491e2bfaf4dbb88563cb0cd0b59c57350 | ORPH
   xtensa    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/cce400da857bdc879d4d08722b58af03bb1d8b91 | ORPH
   x86_64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/d34b19dfc85fe14aa48aa2587f47806d7325f7fc | ORPH
 powerpc64   |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/eedddc7837b6f82ae227291110324b4952e985cc | ORPH
  powerpc    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/36d4a0cd44996e604a48968eb83a6cee5391d237 | ORPH
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/045de2159128efa04c569eb33e2cdea635e614f8 |     
  mips64el   |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/ea35c7ba2dc55c2abb9ce80475d582a84a5c1857 |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/aefc9671012be95185fa11287cc34dddbcb0164c |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/18d5fceb06dc5e0c548e21406247e4f7dba93702 |     
   arceb     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/e7d1211f56e19eaac90b736acc9890860edbbcf6 |     
  mips64el   |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/0a061b99e76334564275d7c72a1f75bb92680bae |     
  mips64el   |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/ed6387873de4f83104fe0d292bbe9d1acb864a40 |     
   mips64    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/6eb391de2739adbf9f682f33665e40c4d7b73af4 |     
  mips64el   |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/1a2c7ef066e917905d253ed1132453f2858373f6 |     
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b44312c180f176e1dc820f854b5de16afd14495d | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/517513461b1d72e9a913eeff358dae50fd322f31 | ORPH
   arceb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/54fc7a34cf11c82d4095e30587840653202657e5 | ORPH
    m68k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/71b713d02993fb7576f8dae0e632cdc589a9d8d0 | ORPH
   arceb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/13ff97aca0265c51945e85ff86bffb59cf86d304 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/6d8df3d0746cd837609118a0142a20dbf9dbaa91 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/e75c4781d9830df3bce8259b826f5a0a05511c0a | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2833756fc0ad9d44fbe234ede709bedf43919c90 | ORPH
    i686     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/edf5d63d780ad76799258e38307fc43d29b98e8e | ORPH
 microblaze  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2ce6a327249930dc69ec51ce5913da3e998a7b80 | ORPH
 microblaze  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/e6170fa98d51671c95317ea10c250a08f9027fe0 | ORPH
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4d04d0b3eee050ed547b445116d5930d68e5dbfc | ORPH
   arceb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f83f22667592c1371d91f6ae2fc0d8e2700749d0 | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/7b5b4ccf52b0b414631163315b51108ab4e31675 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/b3e68143a3131b711a7a931ffbf8cf3c768d1068 | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ac46880aff9ce3b98200d313af9e08a7fadd46d0 | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4d38e28bdd2b2089809a20a617323073e943dead | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/75867ce4a1c9c85d8fb2c371aaaa558b1f31485c | ORPH
powerpc64le  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/92f7505b91aa3a0aa048ccbf77dcf1645f86882d | ORPH
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/c4ba2eb6e189c60eba3a9145178d55a3a9f3257f |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/61cbc98b394dfbf2bc43086ea7c08d4d8e4fa473 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9a9fb889d9ebcc77f291b75df6799d0a73b3c430 | ORPH
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/50d4d8ca7998a17242554b7dd6b28792af0cb7f8 |     
    sh4a     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/91cd6965175b8f045e5b19c7f9ed7dec8e07b20e |     
 aarch64_be  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/685d2382b83703b6ff52b7166a32592f8d264d1c |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/e85ca363583dac22ef714a0c64ed65b93fa6252d |     
powerpc64le  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/361aa495b367e10eee8eb2dd5605ff45e1442aba |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/2389efc4178533a051a077f5cdc3663a1cd45553 |     
    or1k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/b5e017a0bd744aaa93966e94c0aa3295fcdf5c78 |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/402ac2ceec34ba110ac7736078bcb2f2d57f3b7f |     
 powerpc64   |        fluidsynth-2.2.6        | NOK | http://autobuild.buildroot.net/results/7397ed790848bba92b576e4d1c4d3c3bc109de20 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/74fc23820f34477fbbb6191fc9de0325d492e3ea |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/e23db63ffff8560b990b1bf34db236b2b7a1ad88 |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/b1847deb59c58b9f454cef1e6c3379da132cf82e |     
    arc      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/6c8271198d4887482a2596dcb8a99d1edd7d6987 |     
  mips64el   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/e0ef9e5e299a257ad5ce6da90d2154d6a7d90199 |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/e8f616075432d7ce16cb093b0ecdc358c813a3bd |     
  mips64el   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/58a7ef0a54f55a6e2264a8e625063186b44b5ca5 |     
   mipsel    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fdf3fd8987338ffd382d9df7a13b36f6288ea169 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9a439099deb63a7cea61b82a44c6e9115e5cc9cb |     
  sparc64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/34ba772505b6229b060c1e6bea5c5455306587ac |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/223b369cc3ecdbe62c1a63b96fab1bea835b44a2 |     
    or1k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/f3aa44d70c2b61ee5dd4afa5c85aba89ddb0d281 |     
    arm      | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e287a1169a1ed7d4c9d90f835ecaee8cdabbf183 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/37bd129a59cd2d55acd578ea4cb8ae8897021799 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9cd61b5c8dcd009511c3de3716a2f9f2ea5169a2 |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/465d37e771bbdd53899e77a7816ddba37bb479de |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/ff7441526eca6fdb6fe2d853e6b1df6ace3d4fc6 |     
   xtensa    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/834a03303dd73abec964e39ee130909dbd34dece |     
  mips64el   |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/152831fa2a11e4df0dc72b7a7f05d08921d059cd |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/6bd0f1dc3681a37f433a549784dc74ba2032a74f |     
    mips     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d106e211494bd3fa9c4dbf3e48af605e77bacba0 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0aebe8992e1754a24fb88c034183334256f7fc42 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5ef49d11d7a30c2a641341f9ab0a0841d2ae5aae |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/506dad3ce843f7ba2c0865ab9c480801d54b3697 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ddf9ab8e3f0d08a4d8a273896243a8260474da2a |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/638d08c7855ffacf254d5c30065f0aee4967a8f8 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/2fbb7a7c42d47143d6c3b79f67faaa5fa79b5107 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2267b98f3bb5d003c6fd2e539e44f38039f05be1 | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/15b27c22cfc6b3425a4b848b299ad50affd7850c |     
    mips     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3a3a612815af8f752c2dee7c8272813b2fe8bc3d | ORPH
powerpc64le  |       gst1-libav-1.20.1        | NOK | http://autobuild.buildroot.net/results/ac246245351d473ad1d297efbbab99195e104862 | ORPH
 powerpc64   |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/4e0f02ee8d4a5223cea5ea9981c3e530e0fb8bcf | ORPH
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/067c86b9d8716d99e3cd12b134f03b69df87a65d |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4cb1c4855ffa85ccb30d575ee186645dd516c90e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/193d5d952f85b8dd51b8886222c8aea07a24045d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8c4c535768a55a4079f33e6198a6a8fbc505e91e |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/89fee98c04ec86463491eb559d395800ea5faa05 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2a2fbef243a9e2cd801d86c48bbb555dfcb0c511 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/75fe8dd263a01f780babdd114bad6cfa0f0556a4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b97d0a5b4956b8af6ee8313a6f1497b29b87266b |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fd21a5139ac835aa3c56fc021a5db0fc04097fd1 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c0671c1c0b2d2c030a53186eecd11fb84db62f92 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f2a4059a371430fad0b04491acefb2078ff551d1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/754b237038f2bc296cbb45afb1446243259e7934 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3b3652b2cce75e0f5ec0452abf3276df5d925096 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f695f0fa3b841131a57b290ba3ec3a8de2b0b126 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/16c4d058a4d6510518636e6850893a53620ce80b |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5158e7e54c218a6de9bee87edfc1ac8952a1bd12 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cd7945196c549110373837b978454388a0b35660 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f48cd77ead2ec9a6e86a9cdac211d7263dc866c7 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/13ecc66dc6ef95631bb1c342950a2336849e1e68 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/79b59f88b11eb6e8467915976412c2f6ecd46f1f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1ce6a71d75cc30b91149f4d042ba808ee97a0f6f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fd202773c5ec64484d9b054b61ac2b4f040a9dea |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b9d3c84f74f6ffb3b1fb214ce2d66a5163280e0c |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d4da98c214801af51fecf26a15fcbec3b71cb053 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d4370720b5cfcd5ad7410f006034a497a6cc89f4 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fade1fc34ac4c09a81e8502e8fbaf87d58d08658 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/903da6a6c6ee19d9731a239bccaf2aa8d2278a85 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b3fbe0ff1192ba49bde134f3830dfc6195c0c68a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d05fc87a191419ae2ac77d35142a3e07e600a9a0 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9b5d3ddb79aa101e741b9afd029df24375b50bd1 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3cd2e95be6590af001e067c46ee69b7ca73dccc0 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8f72566d9dedef90446bf51379b765d81a043e88 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/577b46468816c102d051a573b987b71959abb3d1 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/45bc90fd2dde7bb201d7f999db1a8024cf889a06 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e90db70167afef4ef4e0e3192c5921beabd05ea8 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a86d8a0708be02d605796a9fdabf9593eb5e0903 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/90707cbaeafb5aabc5aaebf0aed6ca01f8b97349 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/13edeeb6956f9cef1c2800089230b4c789185eb0 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ac4bb9bf8ba2b408ef51301d36126175d6704dc4 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f4a4c41acba692677f5de979defc69e651130b34 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2615a3e11ab80a74c06793fd9311d96e4ec60547 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ee04afc8f1b21519a6d5bef5832d009f26cdddda |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b5d7f84e33a5b2e9bde4b11dfa0c82249ac462a6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ce52fd397cd7caca4e3db146f3d4c1e22b9450ed |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1dd5b318fb1adf547309fdf4cc9c1ac40daa69e3 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/56ad075417d7cb4b879c63d294c46f20c4f6d7ad |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/773f7a76e1f95de4247624dea6d009e3442017bd |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/eb795ebdd210da07fb5758a22290a112d65cc766 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a4b4b99b254c10939224a458dcd78ddb55aa48d9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8cab41346f8a477500af08840725d84bdd0c0697 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7b1a3d8d40010b7ee32e6986bfd4976d35fe8036 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b349cf899b753909c443b1116ceafdabb519ba0f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/13d980f7e1040dba4d07057dee9b3acb523d8210 |     
  riscv32    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/9095f133cac009ce312885c8601fc058ebfb791e |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1517c536453a4b052cb1cc29cddd8e1a96973fb5 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a2f444e8e562497a72d63954372faa9efeaf7dfa | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/032253a9f76c09757b0e9e6c05dacf62e44bf8e9 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/4e52f6eb4a56b89bcb1d82a9af2328ec520d3b21 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/851274a79e961918d67bed11e2042eb479e7801e | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2d6bdd4c73361e60342dfa0c5f2de0b81ff700bb | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5cbf7ce8d26249a40f7f0cf04e975a913b9b7e00 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/42eddebe4fdbad03aa09462a3e96c3d22661eaa9 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/790eed236d78a1f43d8f9cdae55d0e0d09538036 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c054b7b3d36b1afc6d38708089dca186a516d0fd | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/be2abb408396bd04a0f451ebbd477fa515ae7f16 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8cb2979b75a0cd546075218d13f3f40360a0e39a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f7f9b14218b8369a668811b5e1467c21905e8635 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/acd47cdb66d942e873c2e4c10331298734d0ef67 | ORPH
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/289c09db42de8f3734daec7107eaa11c540173bb |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e90abffc373ec5c7ac6f496dd3809ed825c224df |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/217637a9fc930ae933255fa3223438e027e177db |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c0b922bbcbd646eccc9f7b071494136a26d8e016 |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b5a19ac799f765e50a255c94252b1d6500c84522 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/89014a9ff4f783b6b25fed452403b2c9bb012612 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7791655d27ec12a2309d4abc164ef3f6e1bd4ac2 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/766421760835097977f9b56cefd479804db4c9be |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd8e25439c51d52c89118a455f6aac6c35e76899 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/de7c724ff99c3a6fcc4d310864e3e4922f77a955 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ebe07b12d0bab2e433a11d6ddd38f2155f410d1a |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a514deae3251e5afc5e97946290add26ab3d036a |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c892cb0641cfb37dc8a0c46ea4db8a4fc34b4654 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bff6660353e735cad5580d39b8b0057cd4af2204 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c032f4d8ac1d35ec7b37a801af735a9aad70f05c |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eb224f5e4f927fcbf730999627250a0023a23843 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b1ffbddde5f68e767fa5754e1acc5dea2f175544 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b9f81a9bccf23ffe831c266d40a712ed879b2983 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2bc548ff68a6cf5b0bfe6c57a85d2ec825f3f132 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/59188be9f3d8c5b142e03134ee7c0ae9fe8657b5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/277e1df7bf5e4b7539ea0b1b83a707fca35f879f |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/94ce2b27615012dcf46f237860dfa1d5277e89c1 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0a9ec42ac9f1ef1fc6187db63063083a65a254a9 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c031a9c1e7e1deca427c2718ae83995f94c6ae4c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cc43c2810ea92676e2bc85ac620cb66b562a8324 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a97f62bd8635b6c957c038a4a1e4ef0f3c331044 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/990ba75b2ba4c799ce9645e73704bc3b5160da5e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4d9b759de7254dcb13d480777fb3e615adf07100 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/21694d985d79e91224dc70fa2193fec02dd0c2ed |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/df3b25b5d7c9292b6b7a88c2cbe42d69420e269a |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/453381d1c313a1b8186fbcf42fcb27715f6365f1 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8e314bd590ecdb3de894a8d62f9bf408adb72dae |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2839a646964fb19c5c2ba1ba40cd7f8c9d45e3fe |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/196c15d79133b036b71472caae2489029138b637 |     
    i586     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/5f9e1d18dcd475c49001fe8edb8a42f7bb2176c2 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/56b8256883794b20352c99da324f50b2b8769527 |     
  riscv32    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/daa9fcaeef34640b2b11de46464a06fb68074071 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/50a7a78dc25a1acbb49d1edb8c85a14049da7818 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/14479e43874df14f0ae5a272114b7f77baffb475 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/35afb5b94506708bb4cf36b442bbd0a6a826561e |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/5b01505ab62e166284b8a50fe949ddd2ad5f5ef8 |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/efb1f95a90704fd69774cc0e6843cc136a58243a |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/8977b98702c5be377c355a9ac4988aca69c5aed9 |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/2bc55e7e2ea4bf6e284edfd72e12ce59c4bbe638 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/cce5378dc4742658231ed427bcbc32c4fa78d1b4 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b9352a8e80fe4aeb964599fa475bbbb1911a17c6 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/38ae790c2baa8a9bf2d14e51750c14d2dbf2fd82 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/17eebf9e5fd0f7048fdf6f59e7bdd566f148cfba |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/538b01b03efa96a34a63a6e6ae2ff138de5ff81d |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/fd134be4bf39c3fd8f58c13123d6ca76a38c986b |     
    arc      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/6703c8b3b9bc6c0ce89a2aa2af18dd7adbd251fb |     
   arceb     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/88a047aacb7706f6a5b11ca59af6aae8485b45ea |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/1c1f5fa2c6fc87b98884041ca27c675913a1cb2b | ORPH
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/b14eb160e1692fe57140fd98265b777bd59b771c |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/27f871838fa68890d71b67dfe1db84257817b111 |     
 powerpc64   |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/765f5df367564d8d9e5f7b043611b984246c7fab |     
 powerpc64   |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/5ca9f753214363e81b3670149378a15178551f15 |     
    or1k     |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/c21486ed11eee702262fafab70469b56223250b2 |     
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/83eaefc2d54bf99d2a255cedc28be47b75091e4c | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/163c0523b214b832cf35f9de570c1646b47c012a | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b91fc8024dfa1c9ddcc5fcfabff8e1b8dcbf4076 | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/199b0c876b57162b49980beafe81d7bd02ed05d1 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a5009454993edb53ece124bd28423380a1064a0d | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/614b29ba10f813bbb12542a4192d4e4b04ace8c3 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e373a3e23345d5ebee613be49f4f6c00d604bf3d | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9843eedcab294f1e2a59ca35c780b0815cf48871 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/78a4599d54e614cb860daf11dff65facabd96d76 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/760011649b1accd13c3e158f4cd535c6b0bf270d | ORPH
  riscv32    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/64f8e7274f99035eeabeeffa0d8a98de5207ca18 | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b16d5961fde3b89acede85f8cc0361dc2f9511c8 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ac9391894f40cef931e2a5a2ae0708da9b7dedd0 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3bb2416436847906c8a5a300d5de853eb31f80f9 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e82c3527455e16802447db01eaac9bb52a66d2dc | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/acd85a165e668da1dfb6261bbfea68f1325f58c9 | ORPH
  riscv32    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/05da8176fbd69635778502c106c4f225d3a688f4 | ORPH
  sparc64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8d03efb31fb0704b02d788e0c838fa5db9795816 | ORPH
    i686     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/01c28d06e549d7634914314cbab7f21a3911396d | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/20829b670ea844c00e7abe283b71643450480e3c | ORPH
  sparc64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8d48d395b8c43457a7146020bc6ca86e0d0b6dd6 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5ead2baee8ee6fbcb87b9eeefb9f47d58dd56139 | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1f21f3441ac25db0a10a641f386e050dbea9f351 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/738602b9c6e813d57143637ce5cf36aa972b2e6b | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/02eb9a4bedea848b6641499a711e845c3c5a57a8 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ccbde436f31ae38d87572cb3fe3e1dd0e442391d | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e258c368bd99acd5058d8d377c4e00a887d295da | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a357baa17d8cff2768b478d2b352bc2332a5f757 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/6081f7e2a89bb3d62e4fb725c1c3966a4afd75ad | ORPH
microblazeel |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/02d35c45571078e45d65421f028a64a02a09d29e |     
microblazeel |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/e8122e9d7c13d07a6ddc7d9a2d3a078c21521ecd |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/d5a09b2e9cc9cabcae1d9a1b18a6b3195b495b35 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/a9ff5d03f9e777dadeb733eaffaf9a0ad2ae4c77 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/b000f078fc5d63695a124ca02061dc3386da36d5 |     
 powerpc64   |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/9b00a09608920e0a042851f16e18589164e7f9cf | ORPH
    i686     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7e1da7c0ce68bf035470e392f6b3553f962fa84c |     
 microblaze  |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/834ddd3ed704a5f8ac4b4414096c9350426e26e5 |     
 microblaze  |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3e41e87d76f0177778b6a09655f046eca0dfe839 |     
  sparc64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/14ff4dac7baa5812fd2601953412265d030edd8b |     
powerpc64le  |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/229ee476709c3ac9605ec96ed909654222445e23 |     
 powerpc64   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/56b42dc70b76a9c55db8fbbc7f40d62ef36e68ec |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6cb7b88eebcdc9dff22857f65db1e6874ba867ef |     
    arc      |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e343c07ca04e37f3430966d6934b2a7671a7f864 |     
   nios2     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/03f9e7cd3ad9bc60feb1f931a93a7c4d31be4190 |     
  powerpc    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fa5f638bc76f1aabe313d1e132d9280f120fd68d |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d653572182d0ddcdc169f0c048edfe662719a3a7 |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d8e9da07b0bfa1a56825a5e5163fcb8ba6a48b3d |     
   mipsel    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/985cedc2ce8c57a331f23638e1bfa9eeeb61391e |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/06a9dcaaf6ce9dd3920123cc9adb53cf3968ead0 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7d2b4949840e793ee37c4af2742b2237a928b2dd |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/225dcc419ee37da0e8bb792634584688491a54fd |     
   xtensa    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a88f1c9ecc8c7583cd144907ca38ee6f78610094 |     
  powerpc    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d0b4f0b29dc1383f9bcc45e4afc19b18a5a1b2f7 |     
    i686     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c992454185d223ecec636848e52854e3752265e6 |     
  mips64el   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/cf6776a8dbbf53fea22f9e2a7fad0ebb53d98953 |     
   mips64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0f885011a64229c55813bf720f5f94ce5a1e84eb |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/1561b5d4f35264acad563417ccc49db19a74b316 |     
   mips64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/99752a541b7e2d5edf04c7e817b9cbc642c8074c |     
   s390x     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/25f6b9c85b9791dc91085d78a1c368dbb2341607 |     
   x86_64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4f1846832b99bfddf6b1ffab3a56da3700e98d07 |     
   arceb     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e9da11b3a5738937cbf9483c3bb5b3902f9f30f9 |     
  riscv32    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a349d9b3348e45739709a0c2c2946352b646437d |     
   mips64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/72e475d5421a3b1ec94909cfee6f563a4d48754a |     
   nios2     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4a30b2e8a3186969ab8df7d69181c005d66b514f |     
 microblaze  |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/5bf1b8e34ee9456e2642b08ee121266040c2a87f |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/900a3fd2e755d4de1e467f878a9d416d58e63d03 |     
   xtensa    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a25dcfc737da349323ccad100d6eabb14e4eeded |     
microblazeel |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8ff55c32413edc15fcf19ecb1cb6240d976e8429 |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c864a52e8ae38365eef70a96a00c54399cdd3cb9 |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2d260fc03933d826d1c30cecba8d15e085d67ede |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a3ffd6f3cc3f3e4296fa5fb6be4124394489a98c |     
 powerpc64   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b67c5d3107cbc491819c6845ef79d6d6f2f3820c |     
   x86_64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c5bd925c53325af9eeebef4429a687ca51f50640 |     
microblazeel |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b59a29e50d82221cddec7797ddec72e726a3929d |     
   x86_64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3cc54b67f9fa08da2cbad90c64653a12d7e21ef2 |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7f5ece5c42e2093b5e6e3f855369668785de3ab6 |     
   mipsel    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c8854917015f614c98edcad3cce3ab456511d4dc |     
   arceb     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fe46549a452655f75ddcce37120bac7268f5ece7 |     
  sparc64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ae10b7a9bf1da3a1c970f86f5477eb8d9e236974 |     
 powerpc64   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8a620cc4ed9bba411ef776e531aacca594464e9c |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/dc2a4ceba220b5b75432c0f513be964737cd1ba0 |     
 powerpc64   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d5de62fbe05eef4a8159a06640f10f440a2a32e8 |     
  sparc64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/87e5a81bd6acf0e5cb9cb3b42ae58e88a5108d62 |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/1de31128f6023a965345bc77551ad36aa63cdaff |     
   x86_64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ad1e91b04186ef9def9c829667b02a696b423e27 |     
   mipsel    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/de221606fff83e638adb4136d545a7a8180d924d |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/759a42e9dd2583dae9a7e864bff7ffae7cabaa69 |     
microblazeel |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/94c57d57e9631263e80a9e66f4b6a0bef3622f34 |     
  sparc64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2e76bb60b29f4713d58fc6a09781114da541d332 |     
microblazeel |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/a655356ffa8f9ad96a8b958b2d58a534e3a2ad3e |     
   x86_64    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2 |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/2076e83e50fed120fc478b82bc3525d864644cc1 | ORPH
  powerpc    |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/c44741ac569c0702de5f16768020ac2fa0fc6f5c | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2d22b34f17ae834e8371266efb03ef295d486e7b |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/86025a4f08ab310877e27745e9d95132e1ba4f2b |     
  aarch64    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/f202e0dbe0420070da133cb558c97d205c2f69a6 | ORPH
   mips64    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/26d6898b54d79f220c6d69e31a0702953812f595 |     
   mipsel    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/a8cfc55f40edf600eebffbc2b896fee593555a90 |     
 microblaze  |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/d394272a04d8a05f67e40bf98584691618123f66 |     
  powerpc    |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/6bedb5b658f6c9c16c26c73a524a995e5e84fcc8 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/eb0006f5e55ffaf46525a7ef8625f84af215dfba |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/97d8bbd3708255deb3052ef80685f53d9882ff79 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4854523af57d2e784e6393378027ee100b6c2d66 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/63681881b4735a12d473db6cdc9f178ac39e4f74 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/299ed49ecd3ba6abd5a8ff72489b99340af71386 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6f4a3ab634da0893e00a6d7633db15dcdbd661c8 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/341ec05640fe36056b8db205d0c044b9e23ca9a6 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c72840011cf2b0125f36a5e092e6fee4f918be74 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3b73fc535ffce2bf8a342087dde3af64ba878b6d |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/243b9c5b1c48d1073af66ff04fc4584487a50554 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/39c799334e88c2e214497f059837860e44e76083 |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/311e407fb1b120fb531bed3fa9e69bb7208cb819 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9577d62225015ac9cd583dc1147c196a5dd04fee |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3516524c7219c4d33a5650178496220a0816c9c4 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/11f685990dccb2e3a010a2f19509fab77674af13 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/49112190d3cc88ad34e6a4f9a5fb6c3d909f4c0e |     
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/91c8e1c2cdada3e5c21546d1c8565e016fd6e3df | ORPH
   mipsel    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/7bac96d1f98d1656d007163cde423090c642bd82 | ORPH
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/73062d2461765edf726c67f8576cdf6bb0e78dd2 | ORPH
    mips     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/03a2f646a0a410ca2d413f58c0885db2ae32eed4 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/09ba0aacdac1b133795f0665c057a1e22c8777d2 | ORPH
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/dcfc36d5e3958092fdddadd28b8bf9f13ef6341d |     
    or1k     |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/f830c8ba332b7d5bd44b40ccd694f25fb7b4e39e |     
microblazeel |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/36d44e4126dc7f5de47bc1d5b56169b5ac6c4c61 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/4b2327762e55a61c9cd638806ff82b2e2261c1af |     
  riscv64    |          liburing-2.1          | NOK | http://autobuild.buildroot.net/results/33f3c58e98daab07139b4f400b85f87c0e314240 |     
  sparc64    |             linux              | NOK | http://autobuild.buildroot.net/results/b2edb56a295a4a79ffba489a5833ab65a24cf595 |     
powerpc64le  |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/feaef79ad27d0c983393986337f6cfa64bfc32ff | ORPH
powerpc64le  |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/98d5cc52b99ffd61bee6f97aa8e3e8b10a16b9a5 | ORPH
   nios2     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/c37c30d7c9172ee88b09ac9dbab5f5f9373cf06e | ORPH
    arc      |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/b4fc56e48125c862135a06c17f76ac82b8797b2e | ORPH
   mipsel    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/ea269b766c47ce9b4b786f5c5545f226cae713a2 | ORPH
   nios2     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/6234e2a07e1d39f9e35b2af3e790abc6bddf1336 | ORPH
  powerpc    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/bab1068e07ab02150f533eebbc1135149cef5b1b | ORPH
    or1k     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/aefbdf2bef98e271fbd3d5abf9484b4de5f57ecb | ORPH
    m68k     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/682c2f6b12ab3565ca27a6cecf966266e155dac2 | ORPH
   x86_64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/1a770a67a9e6f7fa39fef33cebfda851220ff9e1 | ORPH
  riscv64    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/b2e465c351478faa92f4e5b893041f34b194a19c | ORPH
  mips64el   |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/7643839d0d1191c37510358dfcbf88aeaf320dca | ORPH
    or1k     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/2f1fe98997d83c2d106bf9f5646a60d71cd195ab | ORPH
    m68k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/fe3094623062d283d28cad188bb27f49116fa6c2 | ORPH
   mips64    |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/33539520b8bbba6d5644d467663c61b8ce5f92f5 |     
    or1k     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/6b8784b29a395d16124a60275778a23951b074fa |     
   sparc     |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/dd09214e9ad85e1529bb9005a554eca723a622d8 | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/927c5918ecb4772d2cecb93b09e5c7d91370f179 |     
microblazeel |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/1c565e2ab6c5e2af1ef3097f1cef8a38462291c1 |     
    or1k     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/4452bc35b41414a5e8a0e9831b0854228df5fba4 |     
  mips64el   |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/f18827b57e2620042862aee39b5ad15771c8b6b6 |     
   arceb     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/c66f96d4ad8e1136c4a828e2b69ee213717f2640 |     
  sparc64    |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/ebd66dec0f055e3e32a323e47e9b41e1fc4bdc9d |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/6397e40d4afd138cb58c3c6181f52d53fb58d80e |     
   mips64    |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/fc6e308f346570f8198542602bc8c1bdd0a4869e | ORPH
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d1b13fb687870cff5df7d3a896895e0481241661 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/62ccbac40b2f204a0a054af2b2ffc145484ea7fa |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/15e5906f4d82f3a9c9b0e39de9d1a13bd139cdd7 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/7bdc48044397d4972e00945e6f92324874a7c191 | ORPH
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/268bae4d0e6a85257fd943c2100520ac0e926bf8 |     
   mips64    |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/1941e194e1f5ad0bc4982ad39c3e34d266bc49c6 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ed53011b7d8bc0070ed516522f7b02e0daad96c2 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/afe36cf1e1f0591e0db184df686d92c93ab537f2 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/29c8313959da19748dc7aa74f401e1e20dcd6208 |     
microblazeel |            pigz-2.6            | NOK | http://autobuild.buildroot.net/results/505586d05e5f482167031700ef4007713a7a883c |     
   mipsel    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/457381e0737e02915f62e63ecf4c94d3c2d9ab7a |     
   x86_64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/edd1d38cbffa7854d6114266b98bad71445a008e |     
  sparc64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9fbffaadae44fef750b0a8c55f43a5963527bd85 |     
    arc      | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/657c2fba2bf7b1e09d314e844c6dba4acdada6f5 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ab0c3c7b1e3f711e6c57f9213b9ff6e0917edd14 |     
    arc      |        postgresql-14.2         | NOK | http://autobuild.buildroot.net/results/70acbe121236ef0905c4466d4f7a0839723d2c49 |     
   s390x     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/2783680f7b879adb4f5a7ce6eef1b76d7d37221c |     
    mips     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/4aca4b9a4d2fa28dd1ab42fb17f3186cc9c049b4 |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/ce21b651333b6928d24eb7df6a3ddef624fe3726 |     
    or1k     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/a60b201ab5649456eefd507e1b89956f610dda7b |     
  powerpc    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/67ceb89760abf6c2f94ca7dd0c98570c47e9d1a1 |     
  riscv32    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/0c4160ae0bddad82040ef91f3d456b5f7c9a1e3b |     
    i686     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3cdcb9b3679c83208146beebf4e32a07db28fea1 |     
   mips64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/6096b55f3855f8a29b399042b56ae7550ce32a05 |     
  sparc64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/35b5e5ba2fad0a6749cb84fa13533ce2acba98d2 |     
   arceb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3725dd843efd0ac4c8594a808b0632144ea9999b |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/12dedb1d95f7d43b73a7f2bc8997b0341c783f82 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/21521364196d28b85601722c4102e1cd91c2d558 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a57689a7d648c2e8b8617839375b46e8a360ac73 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/26be1d7839f1a75da77b971068884217860f087f |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/99cf7744a5d5cd9457df79ce70ec3d18a925196e |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/5e96e25de59d1f3047cbace5298a54802465f955 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/389ef1133d16157156f7c9d4cf1b4edb6a20e15e |     
   sparc     |          rt-tests-2.3          | NOK | http://autobuild.buildroot.net/results/9b065ee7611db3a404863b85161f46a2e9e8ddad |     
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/25dc0b1a55430e5cdcfc754ac23bd9643e98b3d7 |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/3faebf5518b06f33fcbf953f06096db2b9864d25 |     
   arceb     |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/c48ba8e71dc917b2e11051088dd252be81b3609f |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/ba942099b7b1c1951bcb0ffc94393da96ecf3c5a |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/67411ca3db917dc5a3afd2a996930e1c83e65d1c |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d1701d3cd579805429491ed00c5ebb8d27eed7c3 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0c54e3304802212ffcdc9b2256eada5772cc93ab |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e98239b08bec776e1886d7e56587fd62755a2b88 |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/24e134e6fc92b77c6c7ba6a562e6d04d8b60616a | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2bbf4782f833e543c607cb40d1137baf3b7ffc56 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ec56b3d7e8d4011f5ff60d885bc0401b3ee60634 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/61ecb8ef67345b78ef89364b2fc543ed225e3927 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3263d0bceed9149df419cd9b2f512ce3fb7808a1 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac0a74d9d853f69756c768fad16bd182ea5c563f | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1bfdf2e5ad328de3ba44b27918f024ccc4a32785 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b6dc01e0f45ea76299e790d14e6aac2ab0098b32 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/af76ae4510eb4df0053d1cdacf8a1ca7dc967308 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/701e8a5f713f7bdd1f32a4c549cdaac580e2522a | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/ece7cc1960ed8d359b0255e54f33c47bc074b5dc |     
 microblaze  |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/e10467180259a04eecb7796977d0c8e4c9ab6d03 |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/71724e0787b4d8d5a385dfe066e81905cc14e4c2 |     
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/2223e6c8f5daeb398cc1d537cbd65b2e5cc38612 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ea9c8d7e92229ab588d4f03d986f5b4d694c5e4a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7acc79b9cfea53ea5666eb34f1d6ea04b1e52c04 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fcf18381f646bf82f95d2002e8b87a6533dcb7cb |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9063360f7c1a292e9c564e2a973a7c8cbf2f0c20 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d81392433011e7d4d3648153f763de90380151df |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f9eebb7651da17741ed169f8795fe4b2da08ae3c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7fa1ff7f232a0c13282e958d0adffcea9a969aea |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e1078a170a6bb18d84525debaee18b1b83ce8d11 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/839fea87623396716ddf84ef778114a02069fec6 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/808278bd95457ab765d2311e5dd9ce825c9c048b |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/76ffe8f861aea6073f7f8597febd5421f706332d |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/45a8607a726e96ad5d835e227c92713fbb0221b6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/78f397e9254183cb2de6ee8f76cf10ced999d8a0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d16866c76e16e05b76f35d4c1656f5e92253af5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/30df848eef3606d3741f77e3e32273cb31232123 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/83e4866f61506c4ef3e44a1df79d24b6e0a01cc6 |     
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/09ee68b90de34074b891a740d4d61dde1c09234a | ORPH
powerpc64le  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/572ecf8e37ac733a4e4265f4f78f35230337278e | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/aa6265a9708a3a0802f11254580d25fb6e14523b | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/268ffce1f3eecdd276a839ceb4983846e119bf53 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/5b8ec91bb359353258642d7638377e7eee4f0ec8 | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/fe45244d9aa5ca4337fdc82695c2bd2b94be19ea | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/74864d6ae381fb4ae51ee74dd4bd2afe107bb21d | ORPH
   xtensa    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/3206198f6b30015245d002392b439840187b0efa | ORPH
 microblaze  |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/2208d46f5beb3a24503777c330f5fc5af7410906 |     
 powerpc64   |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/1eef5e40ef5000562eb85ae6cb781485414d12e3 |     
    mips     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/046f767178b18eb19185390a117400f6d7392c9b |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c56a8f657783fb9c193c77fb09ca2b8fc1146231 |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/075db7ce9716a475e9e88adaadde19a1a0a65beb |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b4b28837fb65bb1a2190ec9c7a9b73c20e2c392e |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/f844a862c94f912377973af1fca7a72c01a7422d |     
  riscv32    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e73d775ba208aaaa13c60abccd949ebe97c3a207 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/09d1fb0dcdfdf890b98523ca74fb8bacae555534 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/da6ffe5d42bcea90b06a96680373c457b58b312c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a02b9a21f0c01a765d059b04a6824430b0e94ff7 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            host-binutils-2.32 | 4 
monkey-f54856ce250c4e257354... | 4 
                 linux-headers | 3 
          host-gcc-final-9.4.0 | 2 
                libkrb5-1.18.4 | 2 
                    opus-1.3.1 | 2 
               aircrack-ng-1.6 | 1 
           argp-standalone-1.3 | 1 
                  cppcms-1.2.1 | 1 
      docker-containerd-1.4.12 | 1 
                  exempi-2.6.1 | 1 
                  gensio-2.2.3 | 1 
glibc-2.32-50-g737efa27fca5... | 1 
           host-cloop-3.14.1.2 | 1 
host-elf2flt-7e33f28df198c4... | 1 
         host-gcc-final-10.3.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  kexec-2.0.20 | 1 
               libgcrypt-1.9.4 | 1 
          linux-headers-custom | 1 
                rocksdb-6.13.3 | 1 
                 uclibc-1.0.39 | 1 
                       unknown | 1 
              wireshark-3.4.12 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/ecb7150e448d7abd5062ee81487812b31074686e |     
  aarch64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/9a6db716447d3d89cb215f85fd9b8cf2fed08bc7 |     
  mips64el   |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/b9903ddb357b68e439a12c65e1975cb9a18cc17d | ORPH
   s390x     |    docker-containerd-1.4.12    | NOK | http://autobuild.buildroot.net/results/d557b3c2fe1617d38601f20b9745040770587389 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/19955e5ec732d7a70868cdfd11fbb25ce73bc3f1 |     
    m68k     |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/a7545ffbd43ef8b87559563d3bd9f2e42236909b |     
  powerpc    | glibc-2.32-50-g737efa27fca5... | NOK | http://autobuild.buildroot.net/results/7d3e6728b4621fde50e4bfe45578f3f77c9e1044 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f8553452759e8360e82fda3b9b3cebb08cbdaa41 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f241f9a10a498c904f4979c633661cb169d825b6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/836441ba335ff2391fbb581f69ff52923c12cd8b |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/44a5d99999c174caeaefe7db1deec89f9d4fb9d4 |     
   nios2     |      host-cloop-3.14.1.2       | NOK | http://autobuild.buildroot.net/results/d4dcfa703d32ebac01af9207c4ea4d1085b04501 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2d83b3ed0c205fbaee3acb820449bf94a16fd7c1 | ORPH
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/262b79b0dc5156c45eda6dca176cc071bb4bc27c |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7a008e2a775f86f6aaa113fecb83cc5280ea52f9 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/45dbc548b0b4fb788d8f1aea2e004dd2708cc1a1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eedaa13d3b05ed027c69325730b62fd1a6527ab6 |     
 powerpc64   |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/4e95d9a276f581a5819e6817a1ab13f616e0fb13 | ORPH
 powerpc64   |        libgcrypt-1.9.4         | NOK | http://autobuild.buildroot.net/results/8f10e80a60a9bb58ae5e0e497a3ccd6f394aa51e | ORPH
   sparc     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/1536e65e3142080821af45c743e8b58e5c858895 |     
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/63affc0a07c69f6ebcf3d95dc565dafc97c853f7 |     
microblazeel |         linux-headers          | NOK | http://autobuild.buildroot.net/results/d162670d5af3da6170e9fd3c4dca4da426322cee | ORPH
 microblaze  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/c7da6541832c03e1c60c0a28ca76c29a8c991c15 | ORPH
    arc      |         linux-headers          | NOK | http://autobuild.buildroot.net/results/0f64d278bf3472d294d6d9d15acd9bcbeacfbcc7 | ORPH
   sparc     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/5f5046d45cc62ad5d735ffe23de9d30ffd027845 | ORPH
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d01a453f767e6212cddb2024ce41bbcb2afb507e |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/5b3acf834a35f64a5a4fe51af2eb4247b1c7d2d7 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6cbefeed9c8343b144f2424a1eddda2d99cc1fcb |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/fdc5e94ce5ce8a4f87f0f77dc989d2cfb7a0499a |     
    arc      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/9eaf7ba2e975271c12f5dfff2aec08011b452c00 | ORPH
    i686     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/ccd287c5bcf549e6ecca5d45d03bc3de7a099f58 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a0e9b2f65e45c706e75b2f225b865c6b8814e4e2 |     
  powerpc    |         uclibc-1.0.39          | NOK | http://autobuild.buildroot.net/results/9fd699bead50695d6bb80cf47e2beae6068fd63b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/06c5a340db4458025d944defd02ff826a3aba584 |     
   s390x     |        wireshark-3.4.12        | NOK | http://autobuild.buildroot.net/results/563059d3205fd4f490bed88842f50b659b16e698 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5f58a86e86208dde33ae426d0f4118a40b4853fa |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            host-binutils-2.32 | 5 
         host-gcc-final-10.3.0 | 5 
          linux-headers-custom | 4 
           argp-standalone-1.3 | 2 
glibc-2.34-109-gd64b08d5ba7... | 2 
           host-cloop-3.14.1.3 | 2 
host-elf2flt-7e33f28df198c4... | 2 
                 linux-headers | 2 
                 zlib-ng-2.0.6 | 2 
                alsa-lib-1.2.6 | 1 
                 dhcp-4.4.2-P1 | 1 
              dieharder-3.31.1 | 1 
                       frr-8.1 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
        glib-networking-2.70.1 | 1 
          host-gcc-final-9.4.0 | 1 
                host-go-1.17.8 | 1 
                     host-llvm | 1 
                   host-nodejs | 1 
                libkrb5-1.18.4 | 1 
                   libnss-3.75 | 1 
              libostree-2022.1 | 1 
                libressl-3.4.3 | 1 
                         linux | 1 
                  netsurf-3.10 | 1 
                 opencv4-4.5.5 | 1 
                    opus-1.3.1 | 1 
                  pango-1.50.5 | 1 
                     refpolicy | 1 
              strongswan-5.9.5 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
  xdriver_xf86-video-tga-1.2.2 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/693fdbc36bb93d1ccae14ad7598f5646baa973db |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/9c49b4d8fecd9d9bbe58b001616d2450c38fac98 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b6e03d72758636a916e69b79d23503c6fa17e966 |     
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/cc0ea5bbdfb6cfb055480267455de58aa2baa5aa | ORPH
powerpc64le  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/47c5f257ec39843089c4f70e1cfa76be422034db |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7665ffc63c22e9f00082de2fade66cf28f6f6663 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/57db91278234a5c836fc1957a3ef92436cb88d91 |     
    i686     |     glib-networking-2.70.1     | NOK | http://autobuild.buildroot.net/results/f99e48e9f5b48f853d33d2bfc05b0149be3817c5 | ORPH
 microblaze  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/298d84f747040079a475f13eba0e6687518dcda6 |     
   mipsel    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6f300ad8bcc61c25d61039a75f6a6893826fabb1 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/091945d0ae6b60cbbe362c11a519fe29e506f1d6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ab9c0a4a62ceb16f4fc9bd9de6c7df8ff1b69d30 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/aa0f3d626dd72db6adb635a53cd7bbd71f652fd7 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a3c5866adadc4e30f25ee700b5f1efbf880c7a2a |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/29ce8893c81267fda7f137ef6d66fb7cfd48fdfd |     
   arceb     |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/9abe764cc0844cc976ffd6b5ece622352956fdc8 |     
microblazeel |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/66a057aeab77484760d0abcc718ecc5817371028 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c2a670cdeb504f1bfae4413967668db2cb47afd0 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e3c1d9d8437e032c9ce825bcecf5282c49adc4e0 | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ef9bcbc4a10e58dd0584fb58a78a238a2befaaad |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2be08c9907887f44accb9bc167a8ec0895456ae9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/84d29673fcbfee1a73c53c7d2789a9c0c5c84db6 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dfea4198cd4a1f8587c2f52e46279605d67c5100 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/934ed8f22c5e1e2cf5cf82cd95b172b7260f2c02 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3c98ae127311c01180b9702919ee4cdecc11449c |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/2502d123e4ea2c3ebeb4a0c13f09309e34db1005 |     
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/09bf32cba1369df101e5f2fb72e40c47ee380fc5 |     
   nios2     |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/b8e6849e336bcd96e38f88ad49aa514e37f3d127 |     
    arc      |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/0043ce8b498a35aff017a140710400c5cf694d53 |     
microblazeel |          libnss-3.75           | NOK | http://autobuild.buildroot.net/results/fa9f76bdd2739c7181ad95124d68e4dd3fbda909 |     
    arm      |        libostree-2022.1        | NOK | http://autobuild.buildroot.net/results/052ee97dba9e320a3e25aa13385bc6e0451839d1 |     
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/ea1a39e2049d3822807abfe5d6f6df751833d020 | ORPH
  mips64el   |             linux              | NOK | http://autobuild.buildroot.net/results/b7009c753ee312607996e1ad63778f5854cf867e |     
   armeb     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/3b0eca443d8092c053443eafc9e2ffa1105bfef2 | ORPH
 powerpc64   |         linux-headers          | NOK | http://autobuild.buildroot.net/results/b2f7980fa13d1ad3e0879f9f3fa1cfdb7bcc4521 | ORPH
    m68k     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/82dd33479c085b601fefe314fa8ad590d0b3a2b4 | ORPH
    m68k     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/cdbbc808b563e9fd92a7f7a80ce97c7feddbb1bc | ORPH
  mips64el   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/029a9ac4173dbb73d4d27d900eb48a0ca6e772f5 | ORPH
  powerpc    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/e3624282e0aeaf03b75b1d8a07bab80d07b4b89c | ORPH
 powerpc64   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ba59d1a9809e2d6900ebc8c02a753e1a9bd7b76f |     
    arc      |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/ea3ca20d32f46b85482c7a5a9ca2734e86eddd94 |     
    arc      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/5a5246aa200b4b0f93ad8787376140cd9a1b3936 | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/8d045e5f6499466ee6712f291bf9288a800d2eee | ORPH
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/21e9606e969604adadaaf384c5dc7b62d15da898 |     
   sparc     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/b2a1dbb3b0587a6f298a32a9137ea9092317ea5a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5b2131b17fb4a109b2a6bb15f5dbfa3ca9551978 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/273db1b7fc0c2a82313ceae50299e5f39e1e380f |     
    arm      |  xdriver_xf86-video-tga-1.2.2  | NOK | http://autobuild.buildroot.net/results/191c5d2acfe128785acd9651ebb670ec849d25a6 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/d6d652814e72d1b71bd1726a3559ba07fc8fcf22 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f1bc3f095f0d3f1a4871ead19ac47511136b7040 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c390c7954b22a78218cd69c5266d2ddbf12b65cd | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
