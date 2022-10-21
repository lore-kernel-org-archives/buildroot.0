Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A0C4332F
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 05:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1713C422A5;
	Fri, 21 Oct 2022 05:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1713C422A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efqiezn1L-TT; Fri, 21 Oct 2022 05:49:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F3441E4E;
	Fri, 21 Oct 2022 05:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F3441E4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0FB1BF3A4
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 05:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8640783EAA
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 05:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8640783EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CN_RUfsXXzyg for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 05:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C4481368
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18C4481368
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 05:48:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F35C6E0009
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 05:48:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 05:48:52 -0000
Message-Id: <20221021054900.8640783EAA@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666331333; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KXAqZaOSwcg2+LH7rlMrQ+YU4QlqibLfp3tl60n670A=;
 b=f8CbNjUuw8+C3vlOIvKWtXmuUjL1hpxtp3D0D7GX6ct1wHCyvD3jgXa5gyOWAwWl/SseIY
 j7Zewm9EUk0MbR2SOqzdiocxmi+tNfitEcFV6wONAe568lpmLROTGgFbIHe0PFiWm9tNDT
 ZzUG283W2RxcrmU3VWj0VOs0QgPTrRSwzp6F8qWvdYkrXSXWjcJpw5DOcsjS8x4WDWwknQ
 4iYyHT7EzcJnPuVUZQTQxyKdGBHR0IcDeTonNjbJC/ulY9en00WG70tSf9Squ9DX1jEgJd
 H46LaAeogEQNlTyfNXG86gvY0O1kmKdZ/9sq+UOH6jyjxc5uRWRmvQINPhD29A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f8CbNjUu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-20
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

Autobuild statistics for 2022-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  1  |  0  |  9  |
  2022.08.x  |  8  | 13  |  0  | 21  |
    master   | 142 | 251 | 15  | 408 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 17
        host-f2fs-tools-1.15.0 | 17
glibc-2.36-44-g2628500f5dff... | 16
                   libnss-3.84 | 15
                        brltty | 14
        host-sentry-cli-1.59.0 | 14
                     efivar-38 | 8 
            igd2-for-linux-2.1 | 8 
              libarchive-3.6.1 | 8 
            btrfs-progs-5.16.2 | 7 
                host-go-1.19.1 | 7 
                 systemd-250.4 | 7 
                 dash-0.5.11.5 | 6 
host-pahole-73383b3a39afe86... | 5 
             libgpg-error-1.45 | 5 
                 sysvinit-2.99 | 5 
                  gensio-2.5.5 | 4 
            host-binutils-2.38 | 4 
                   perl-5.34.1 | 4 
                      xz-5.2.7 | 4 
                  autofs-5.1.8 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                     file-5.41 | 3 
            host-binutils-2.37 | 3 
                   linux-6.0.1 | 3 
                    lxc-4.0.12 | 3 
fs/cpio/cpio.mk:117: /tmp/i... | 2 
         host-gcc-final-10.4.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-rust-1.64.0 | 2 
      libabseil-cpp-20220623.1 | 2 
               linux-pam-1.5.2 | 2 
                linuxptp-3.1.1 | 2 
              open62541-v1.3.3 | 2 
               openpgm-5-3-128 | 2 
              traceroute-2.1.0 | 2 
ulog-0389d243352255f6182326... | 2 
                       unknown | 2 
                     ace-7.0.6 | 1 
afboot-stm32-3566acd582e553... | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.19.0 | 1 
             batman-adv-2021.4 | 1 
                  boost-1.80.0 | 1 
          cryptodev-linux-1.12 | 1 
                 dhcp-4.4.3-P1 | 1 
                 dmalloc-5.6.5 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-11.3.0 | 1 
               host-runc-1.1.4 | 1 
                       kmod-29 | 1 
               libdeflate-1.12 | 1 
libg7221-dbfc29d4806ecdace5... | 1 
               libglib2-2.72.3 | 1 
          linux-5.10.145-cip17 | 1 
               log4cplus-2.0.8 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.16 | 1 
                nodejs-16.17.1 | 1 
                   pcre2-10.40 | 1 
          perl-net-ssleay-1.85 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
               poppler-21.12.0 | 1 
rtl8189fs-94a61cbf46ce87b7c... | 1 
             stress-ng-0.13.05 | 1 
               tcf-agent-1.7.0 | 1 
                tealdeer-1.5.0 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  vlc-3.0.17.4 | 1 
                 wolfssl-5.5.1 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/bbb8ece5f48ce299d523e1fb2a1b13cac1876080 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/e9d07d3f53bae1a40faf0d8d65edacd87abc66d4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/18f11a29b8bdd6f1e09124b72e003df9ca292b65 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/4c3edf71897b4786c7cbe35e7c2857f38869df6a |     
    i586     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/aa29f52145e9554ee82915b83785677ee4565777 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/16b6dff41f9103c70cdbed4e200f31f730803716 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a03d142b78e2dcb23cf64aab1364a4b80baeb046 |     
   sh4eb     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/2a643ecde68ea487203aa7e18c2bfe785bfd8e83 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/77e615ce20ad8878147dc7f3a5ef0122561aee21 |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/b12e6f29fea51d26be649d505414d4c0530a93fd |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/f5a3fb0555ca3771dd6436f47f91ce8c97d63f06 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/54fe1df4700a5ab7fc3ba2b39d42da32142a76d0 |     
   arceb     |             brltty             | TIM | http://autobuild.buildroot.net/results/8d8fcb7d4f36e2c78c3427e1b3c603b7263dc499 |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/85f189edfd372fa7d00aced5151ff1ce543ce211 |     
  riscv64    |             brltty             | TIM | http://autobuild.buildroot.net/results/871103e26ef4b64793b910757d4b1026d485e5b8 |     
    i686     |             brltty             | TIM | http://autobuild.buildroot.net/results/c6825b654d8996793a1db3a90ad4c7f038b06f2d |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/90b06d662d5837a552a0c50aa144adddd416470c |     
microblazeel |             brltty             | TIM | http://autobuild.buildroot.net/results/c8340dcbf684f0784352729d2fe9acdeaae3cd33 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/950c284b3cff4d6dd3e03ac851286af2df20c1c7 |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/f5aa923c4aa07ebd16e61e6cd481d4aea8867126 |     
   mips64    |             brltty             | TIM | http://autobuild.buildroot.net/results/ce367e70d8f2410ea693c54842a872e9a53e0dfe |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/337a7d66744b911941577bac8787a28a77d27924 |     
  aarch64    |             brltty             | TIM | http://autobuild.buildroot.net/results/092b5be3b452333a7ef84d4b203919b25d4b62d7 |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/807bb336cba53aac33ab650d9725704c2f4ace3f | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f7df0be03f4a0c4d8d73a586aad9cfdd95176a8e | ORPH
    sh4a     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1a57344b588e5dba4fcf3c6e5e1896fe87e9bee0 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ee57bc714abc76f559cdb9af5896e3c24d01bca3 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c60e7876565a617d3cbcdc4fd18228f4c6d4c92c | ORPH
   x86_64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/8abccb416d2280f87e6d8b4a3e5d8a0e687fa9a5 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4db8d0353d285dec7db3106a73883f10d6b9dfe1 | ORPH
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3192a4c06caff2d8644ef68a515132ef46d5b7b6 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d322853f628fbe1058756863151dc797f49d549e |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/55ab224e934d6e945b43541b4d2d2ab0cc916a40 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8d58b09928f130880f46caa01df577f948196451 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9c83918c20b648f5e86435560c8072925149a7e7 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e0d4748f048b79c1eefcce2822ddd2ca11a379be |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/33ad5c2ea1625e35149f62efec7fa10831aef44f |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/967b0a9d56f7a3052d5b0e45ce5533800e2acff8 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0a1ce9544231776ba5060fd09e947ce155dc8d0d |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/683d4caa58f7134c131bf830278d7b06c014c942 |     
   sh4eb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8f1739a5ed3891067dbce8cc6b8ce9a204eb3d7a |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4346ea316ab6a49a8a916109369e227dc3d7f5a4 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/71f83e3f271336a30fc1ec4586fa2af09b8c8cc9 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e21d8db473f5f07445352947401dde1f1e93bc89 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ffd46761a9385b21cbf0c27462a77caac44789a2 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b4c4e4f0556eda282de3d92776dbd4cf6cb1bd6f |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f10b4444cc78e740427aa0dc56ef851a9c43c490 |     
    mips     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/1d996fa82b113754651b645ad0f0667c653350a5 | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/a0047f623bca65d3cf0e3babb4e11c0bc91bc77a |     
  riscv64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/540f72f17727f219ac3d63c5a004638eae9f69c6 |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b025f40e9d3828166c3c377e614a279ee6716914 |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3612b02787897bcd45e5662077eaee6e2ae7566d | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7466fc00e13fdeeee0fb66f196a4b74a17d57a40 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f464fb53cc908631ef36d512f14398424bdf7376 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0b889dd99e3f63b2d671af3afdff623e1822e697 | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2e12568c73a7b8a48837efd3dccd89dc53f07ff7 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0ce57951d120d4c53fc920528d5cfcfade288744 | ORPH
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/7170d7345ff87a22d023e1c78a464f9883275e47 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/7f7e4a3a82056b369721674a496a6b7585da167c | ORPH
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3f55304506c335ccb7caba22f9a476a78919e761 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/da98cd951e3feb4a7f877aebb5aaec19663cbbd6 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/662527c274eabcabcc572e4f51ca22f8a465ab2d |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3de0b0524a99e2b98c1905d32e4630000d3b4128 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/20b4c88a131a848bc7ee06fa63f7edb7b1255b69 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ef732debf1178beda3ca167da94e98194ffe7672 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/99f91a750869c98adb02020cb1c716e1d390e2e0 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/711828b511cd726513206e3054f8d79ec2cfd465 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5d3e2119589245262e64b90e72970aeeee0a29f6 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c4eb7aa001ce2efbb184876692b1b869797e29ee |     
   mipsel    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/0967265f5c9f112c42a55e7291bc6f7e0b49df7d | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/e43625faa5183b885fc9f3da3a3e38533611ba92 | ORPH
   mipsel    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5d592702b1282961945953cc03c5e12cb47c2e10 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d55e15065b5cc5c11dec8bd79cdc2d7268744eff | ORPH
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b3d9de3c964d9462c2c3d18363802496004826ea |     
powerpc64le  | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/6dbaaf76c0469d70881e97c03b5afc1d93a49583 |     
  riscv32    | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/397d7d1cd5cac563417b537b92bb26ed7390399a |     
   xtensa    | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/9b7517f5efd527cc2396c634cbc86698e413933b |     
    arc      | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/3fbf2c4d0e778f8b38710f2d5f6480020d9bdbee |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fe6327b0275fc6ca35ea6a73051cd9e5c6783887 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fba1de3529e70e85d44935f4f96123bf081955a8 |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/2c9f9cd066f21b9dc18b3af309fef9060a12960e |     
 microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/ecd1be0af19fb595a3d34c8b4f9b1a1667068d9a |     
  aarch64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/12127d54384ac65b0f2757e56ef861af734b9806 |     
    mips     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/ff774b108d7d671504b05caa5d8f83255c20fdab |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b07ef13606c198455563d9a7e13677af6b4c2684 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a71aa55a4c820e23136dc25cb887683cba7a3759 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/478e31d69232ed136293dcd5eabbba890a6a1614 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00345f218ef90fcef86c7ec5b7ad8666d3fd1d1d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dca0e02616865ef5eea6d824b8eccba943547933 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3c4d825353994e091c220576ce3ce997d81b9754 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4de103b3eaf05cffa2befb7fe3b7f37088d19c39 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3dbe56462e308dec5305e8fcd5805676f5f4e3c3 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d44e2132b1ad62dc105921b2bd21a28f3e78d03c |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bc0f9424db1e70bea76deaf6f9990efb2849900c |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2d8b40a37efed240bdaf43e427ad609ed779118 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/672265c96ca499187c8b6adb98015d0453a4f45c |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eb3f90c9292c9a2ed8956068b8be37191c648227 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6cf5d3ff88b1cd7572b87fda2216f2edf65ede89 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18c334e25afd59259318819fcf89572955594b17 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c720fe83335b01c29ede4da05c5e6ba856220319 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d94fec13b4d861d208fdd52e04720e5b56bebef4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/c8caec2370d3d3cd90682659118a799596e025a8 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/40481abc54f021cf28242623d86ffebb3fbe81df |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/64b8ed9bd4f31a964f2b4e6f2835ef0a56e004e6 | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/d422bf0ea065e0b1053f6e50b665f53e7851297e |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4a214ac239f1dbfd904d5abc9e33e5dbc5479fce |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3b9aa02532f942683cd669d98442250c27406bf3 |     
   sh4aeb    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/71fa2e167b33eecb1dba5933f7a52cb89cbda65e |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a69ecd473c32f3fdfc6d8f8f48d34411b99354a7 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/12d96e3ef902ff89d815d43df93ee089a605bb19 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/505fa4a3086e4d6acc01a64eda7570a915b661ff |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c979e1c39d01152ae0776ea4d0ac4ce2e2ff877c |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/25b9dc0212d07eac2adc6e8d0156dfa1a9f88c61 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/91ea9a771e91b409ed7e2a17979ef842a8acf56a |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d41171a4446c3ccae8cd88c36abfc1f3f771eb21 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/da79f6433242e1f643f90aae20360621e74090c2 |     
    m68k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3feb3ec722703e50d7dbc42bcc893b9cf5ab2f7c |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4ec263f33faebf74348e8418b082fc25ad524246 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8e96672e638003f0bea2651c79388e9915389abf |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/266f90c7c77ef6994e0921fffcf3cb4990bae67b |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d55106f7b03c59d6354db20ab30339b30d24ff01 |     
    i586     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/aeb53a2c4c1ac608e10c905a53ee4ad008501060 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9cad92dcfb31567ed8e2f1fa981ea9f6e6ab1786 |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f8f2f9ff0b89905864de91cbbaee521ca2534245 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a473b8fc19c38b72accf64dddbd4e78a4858083a |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/21b7a7ac397f1cb19fe653db0ccd496726c470a5 |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b41567cb3418103197dc4789d4ce0145aa5fa5f0 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/184739d4eeb66ec6f9da0e8a09ec54a551c51bd0 |     
   sh4eb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/60f684137aa6031f10a84a45d28340a63943f793 |     
    i586     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/eba2e3b8a8e815ef69e651fc6b19ee32093b9bea |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/98138a46c3b618385c702f9bb5faa6418ca61631 |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/161aa81ec178493a7cd5b650dadacb58c50d98bd |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/77fc2075ac5094f023100b3c648d624550619167 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a10a4bae87df204401431a4a075c55721c1533a6 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5ff119f89d0592eaee5f3034700d722609bd00df | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9dae5bab40474d62a39983bbc132f0f279449bb1 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6c70a5dfc2909322f759ecde39a63d4dd2f2b4c0 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/127f6ed56523af84d85151b72d99d2587a44faa3 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/68cc9b15f3594acb7ea117617ba63f77de4f7fb5 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3377ac72a40a1fdc0d7e84d4d30382f6fb3dfbc8 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/dfc6398e21543ba37341989b2844abdac88ca487 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5b6de0a073c076cfd54444c259e2796ca88814e1 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/88fcc4d7e54eb81943df67dde330b3bd42fc66ff |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fa3efa1bba478f1cb91f884fa42af0d335920d07 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ed6a011f0e185bdf970282a4e9d9151ca88efc88 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8dc39b231738028e22673e53960986e0e4796cd8 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2191c341b01b01438fdbaf92f6ecbae4f7eb7d9a |     
    arm      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/25ad35dd4a295b333ac5bfe19230a5651c604abc |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5d64ab1333074ec773b0ac157d0fc5b8dbce2e66 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/77e43b58640f9e7360710bd04b0eeb9dd22d8fea |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/020d6a3f9df653c8ab67003c5ff5b19c059e2fda |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0c2ebaeda26680473956ae7b1775106686e351c1 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a3124ef89bf1c213d242704ce0ebe1cd61960cb2 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8a2357fd1e9563c1e55067ee3f01bd15939f4b6d |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/88ac753c406a46e684600d584d74da5afdd0ba2c |     
   sh4aeb    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b50cbd5d145ff54c7fe21413514a144b06b32247 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/39d2d7404ad079930c98aaab6330188151c09926 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3c9c8cd695492205873c0a71dc7a931c08c3f0eb |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2d77870dc81fe8977b02caa911d0f875cfe0704b |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5c60aebc29f95aad7e5d5eae235069054633e083 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a1fde91481f1db2b20c3adaa883251b18811a2f5 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/686d21a51593d54cfbedb5b1e3f803301c8c9fff |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b8aacfa03c18c7164cc5200cccc6f0d92ef129ba |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8bb899ca3cfa31bceab45e7d5b71d960bfba6235 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/23b19f55bde324cfc4a73c77059fb6006e7c85bd |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ffc5e6bf1b83ac8c36efdffc528b04bcad41d383 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/54ad3ffa307b969a16b662bb4ce68b1edf30fe4d |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/13052a52aa3d251aa7cbe76cafb5ae30466fe2b7 |     
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fec563e51b09edebf21d1cc8d4865873272a93cc |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c1eb89d07d76e896b7dea6078a5ad707b63d7ef6 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6b17f73c98fcaf7e6db4146237f759cde47bfb66 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c7a9e793e07c32678e7240700f2c289563d97b93 |     
   armeb     |            kmod-29             | NOK | http://autobuild.buildroot.net/results/e5bdd8a04d845667f4234867625c3d8e482b3e21 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/54ba419e9a395b3397a31dbac624686ed8c23c97 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/3a2088e6a9511437696aaf604e9e7a0480941885 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/496f1455eca76e3c25ab40f05f82cf7f3930f41c |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/ff3adde0bc617a5e0c709eaba6f904f61c384487 |     
   sh4aeb    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/35293170afdad574fdbabf4ca317826643aabd0a |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/cd727150088b801ea630c5db65b918266690eddc |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/d001c552082b5cea1d58da24b2d6fad676b8f73b |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/24ad8dbdae9e58016f0cd849d56004abb79b0446 |     
   x86_64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9dd8462de339ba04cc5b7828b3501de533ae55d0 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/eea02541c36f9f342a640808c4dd434aff945c20 |     
 microblaze  |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/658207f906337f1b2acf1e77403263a1d3639de1 |     
  powerpc    | libg7221-dbfc29d4806ecdace5... | NOK | http://autobuild.buildroot.net/results/39fb17691dcbdd34f6850451c29c3ba0d2385ef3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/544730b0c72f398f81e69a74c8441777d181e0a5 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6de051b3f1a48e2bad89d058707e2f3f213f81b8 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a41f670ac2f569e004996f6a1f9b4665bfca09df | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2b9d050129d792c5ac302b4b676db95d23a35b48 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d50ba2058d4deb3cd10ba9d8a0b9c6effc862a5a | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5cb557517567723dcd3401470b96d58935886cda | ORPH
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/87017ffc3d8830895bb711dc571e3f25bac60ab2 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cd40d43ec039a92b9ec78fe5a4470a4f710315ab |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e584fa108007f02a91c7e98bd2ec626f647db86d |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2344c8ff628044bf59d1383927dc71df924a5739 |     
   sh4aeb    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8624e353ba197666dbd1126b95bd8615e6ca0c52 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8ce9484c822024aaadd4a04d2819bf75a0c12c8b |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2b3e86e9bf1b834adc1853cd45d07549e10ebf33 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/71b01cdba5987edfeebb5d51d01621b8d1532307 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e0d87bf16ff35d534e178f645483e7af89328b55 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e0c78e59eab0d253cc3b417d7a0dce5f697a8b98 |     
    sh4a     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/812e9effda1c64c6be3d0e22bf122f7304fb468b |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7dbbed8c14a8bc9f3fa80d7b0d984bb1750f10a5 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/84978fee7bdebd660fa3c664067585833a72f3d5 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b91dd6d2c3fe8a32ad33e9f4d2b75e47ab799ece |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2c8f4713e3c22d6b4538b8babc3b9f1702821610 |     
   arceb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/0ec73f00c3eef70817e9974523eecdf43baa1bb3 | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/94e42938a868b9c02fd25af1a326681ef4c9eff3 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/801caa443816428d779cd715c3b3868db8e09bf7 | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e3bb2c9b8c8f96b4b6e1d2c17db598ffcb57e222 | ORPH
  mips64el   |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/e106515860eaa89f2d8296bcc703a4b37c87c90b | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/1d4adb2f659085c329e948fee4c12475b42984ac | ORPH
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/bfc525e6f5dcdabe003c6f7d0223b5f89eed8c02 |     
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/50516b95f5a9d90d26f1ce022d25349ccd3fa796 |     
    or1k     |        log4cplus-2.0.8         | NOK | http://autobuild.buildroot.net/results/01bdb21462d315229cc0a1529a1d207eeda6f262 | ORPH
    sh4      |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/02cec4c9a33f29ac584653b856f3569da0269309 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/626da8961851e08f0721237428541a5735f80dfa |     
 microblaze  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/da203deb2617e2d32a4f3b0c433c55bab9f94469 |     
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/084c50eb26dc09213c28134a98a25e5d4c2c0fc6 |     
   arceb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/1adc41e2aa9e8902f871f83fb46097b7759c6bed | ORPH
   x86_64    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/4f29c5e663b5d01af20d671baf6504332b8c1f7b |     
    m68k     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/8ce521a3020268fb780e079147d60ab9b364e96e | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/55c6109a553a7adc1843c89cec8f015e02d085f9 | ORPH
    mips     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/144659a7f6678fca543d017e1595897c91379374 |     
 aarch64_be  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/46f76d1893d42d74443d5b7b0145566d6b271a6b |     
powerpc64le  |          pcre2-10.40           | NOK | http://autobuild.buildroot.net/results/50b0f8bd22853c1852ed718328606addf7753134 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7b4dc1a5c14073bf683e24bfeb2510f76b33864c |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/54360d104bcfa5bbeaa2fbba0a52c4bf61251dce |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e45ee1d38d1f72b2200b35bda0f69dbe25e1b3e2 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/456c0d26f539a676221868058689c920b04a1e5c |     
   mips64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/fe94e967da34c7e88c3426647b1730c675b34d70 |     
   sparc     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/14264013b74ee6161ae27189adb2894c7e326fea | ORPH
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/cb32cd5232cb8e2632854af79a5252c5977ba214 |     
  riscv32    | rtl8189fs-94a61cbf46ce87b7c... | NOK | http://autobuild.buildroot.net/results/40779f5abb10d0f59a919d6207918714131cdb71 |     
   sh4aeb    |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/c7b08c10b407b12183d3366a6047a401ad7f5c9a |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/380a64dfa48b020dbc3d3c1be111a5d5afedde15 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/347af4dd30f61835f1cfb04a4ade9b937e40ee43 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c79ffe229b5d7c60f368d30e4c95dac4153d4ec6 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6e442d500e6bd38c69a74b6264a51842fe01d756 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a375d27e5fe965a1ad7730f51eb10f5cea9a31b5 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0d529cc2277e93db15e51b97d0e843dd11d63b27 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/07565092a360991f88e4e68d0291f4e7ad561165 |     
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6e7ce6e307ca36f93021944b4d2354318e83eedf | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9082b9e79667e4ecc9140a81566fbc05f869a13d | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/910462427aa30ab7fa52dc84cd7763d064596bf9 | ORPH
   sh4aeb    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/31fae9c858be2beb69d0bf534dc88cf6ff58b48b | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/961028e5cc3db24c1ca954ce0507683bcd11d24e | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/731aaed149d9ab334e5603c831daffffd49b57ae |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/890f650043d0e911c4042bc6d7625a4d4db8bbee |     
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/b692cd361263c3b9797ee6e1d0d17c3360a4da10 |     
  aarch64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/189c7b7ad74cf35f11ad65684c3705b24a04163a |     
   arceb     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/dcc8f9dfcf65cd93f328a101e47424e34ea920df | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c35d6f05fcd60f0aefe2f98c72c6054ee68e6e9c |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4c15633dbee2100f3266b95144284560502e935f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c92f79f51381b116b7cc77c946795e9057e3ac1c |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e2c5d53ecd9025a93c097fb13dc7d3479f41c7d4 |     
    sh4a     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/3054a7f70ab8903403592a842fa4155f005484bb | ORPH
    arm      |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/40cb178ae900aefe755b0a40ba258f939d526e0e |     
  mips64el   |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/b2aa8d5204b5295dc123657e11ed559e3a5a8d5c |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/819dc71268ea0344e527ecc2c26c12154f40486e |     
   armeb     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/15fe86d5bc253f206aa54e0ce3f4cc6f0f540dfe | ORPH
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/d480378bfc172c7196e2980b3921420036391364 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e2029d5adbc676209c2ed15dc796234eb4a9266f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/811e8348f42c86777e92805b0092c383ab5f3aa0 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f2e6cbf56dfea8b07b7c4fe6073035649eac8b5a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/444fbb51d19c75ff6607d401ebade9d60d9aaabb | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  ndisc6-1.0.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/7ad5dc9e0d517cfd13cdd52976451ca74c03759a | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                host-go-1.18.6 | 2 
            openssh-legal-info | 2 
/home/buildroot/autobuild/i... | 1 
              host-rust-1.62.0 | 1 
               libglib2-2.72.3 | 1 
                   luvi-2.13.0 | 1 
                    mpir-3.0.0 | 1 
              open62541-v1.3.2 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b8538bf4bc3ba2632ba62f7735272d789cb7fb4f |     
    i686     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/767ea17e4a10dc3e6e3b857713ce8faaddbabe84 |     
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/e555b15b9c672211bea97c1b57d088995a9246d1 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a082c2fecf9ecf161015910fe7bab110df239762 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/06674219e8c4143fa7455be08842585c5493d40d |     
    mips     |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/fa4f31d728cab8b5234ecdb86dbd0612baa390d2 | ORPH
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4c89e81b6439e62925424c31368c88049be5f7b1 |     
 microblaze  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/b9cfafdd59d5dc63d1ac231813d174120a4c6e19 | ORPH
   armeb     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/39ddcfd5b7f6565854a1dfbd10f62d00ac00fa54 | ORPH
  aarch64    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/e470d130353dd183a7315660c2f3e816e8dd2561 | ORPH
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/21b2bc43c3711e792ff9201ebe4bec1175f54b9b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ce3459bb64d906928b56c37ca6bff9777b674d8 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c4fcdb0f753150c30e50a316bc51e4a76a1021fa | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

