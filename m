Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B40C3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5833A60786;
	Mon, 15 Jul 2024 08:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsLfwqy_7UGg; Mon, 15 Jul 2024 08:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE1260712
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE1260712;
	Mon, 15 Jul 2024 08:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B41061BF36D
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 05:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14124045D
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 05:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTfCyfXadqlR for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 05:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BB5840141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB5840141
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BB5840141
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 05:31:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4BDE2000A
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 05:30:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 01 Jul 2024 05:30:55 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Approved-At: Mon, 15 Jul 2024 08:25:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719811855; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Omd89UwFubmyJkIcD/2e34JG4OyzdiIcM99CquWbwPw=;
 b=RhqhlgkisxbeLJT3wzrXdlOEdZXGQen66TTKiupzKfyc/vNdkRlJkqdCTm2L7HjNK3+HA2
 RIitukgsYoGzfYvqDPRwul64KCTFepaGvrJX6xcIdBgjPZNiYrD6UNd04uLWkDMj2ZFosI
 kcDGC6FjuVeHuJky5s5WXjnbMPI7uNbs0MSyIoBh82xpuIwjhN/rKZDH6xi7Hbr5BDhIJN
 9oJy8U6yqiyyvQR8dLuT6cgVxk0M09qUI/AD0Sab2p9INuATXSKhU52tOvz2Q73xCFYDNC
 xcJWPhxWVKKBKkzi0XkKKSoDYZgc5rYhgxlfHpsopamJGk7hTwuW80i668dUMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rhqhlgki
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-30
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
Message-ID: <20240701053055.wtd7bYXilbvxTsRdCyqB9fQ20yLtaxHBLz0tQBh5Fzc@z>

Hello,

Autobuild statistics for 2024-06-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  | 12  |  0  | 20  |
  2024.05.x  | 11  | 22  |  0  | 33  |
    master   | 60  | 866 |  0  | 926 |

Classification of failures by reason for master
-----------------------------------------------

              libgcrypt-1.10.3 | 71
                    gpm-1.20.7 | 65
                    zstd-1.5.6 | 65
            host-cdrkit-1.1.11 | 58
host-prelink-cross-a853a5d7... | 57
                     cgic-2.07 | 31
                    yajl-2.1.0 | 29
                libressl-3.8.4 | 28
                 libfcgi-2.4.2 | 23
                libmad-0.15.1b | 18
               cracklib-2.9.11 | 15
                dovecot-2.3.21 | 15
                libssh2-1.11.0 | 15
                       unknown | 15
                 empty-0.6.23c | 13
                  libsvg-0.1.4 | 13
                    ficl-4.1.0 | 12
                 haserl-0.9.36 | 11
host-android-tools-4.2.2+gi... | 11
aer-inject-9bd5e2c7886fca72... | 10
                   host-go-src | 10
                     mtd-2.2.0 | 9 
                     flite-2.2 | 8 
                elfutils-0.189 | 7 
glibc-2.39-74-g198632a05f6c... | 7 
                  ffmpeg-6.1.1 | 6 
              fluent-bit-3.0.4 | 6 
                   httping-2.5 | 6 
                 libhid-0.2.16 | 6 
                 libssh-0.10.6 | 6 
                apr-util-1.6.3 | 5 
check-11970a7e112dfe243a2e6... | 5 
                 coreutils-9.3 | 5 
                fail2ban-1.0.2 | 5 
                 libcurl-8.8.0 | 5 
                  libffi-3.4.6 | 5 
                  libnfs-5.0.3 | 5 
                   memstat-1.0 | 5 
android-tools-4.2.2+git2013... | 4 
     bandwidthd-2.0.1-auto-r11 | 4 
                  bcusdk-0.0.5 | 4 
                   evemu-2.7.0 | 4 
            gdk-pixbuf-2.42.10 | 4 
                gnu-efi-3.0.18 | 4 
                  libsepol-3.6 | 4 
                   linux-6.9.4 | 4 
                    mpir-3.0.0 | 4 
                python3-3.12.4 | 4 
                    attr-2.5.2 | 3 
                     avahi-0.8 | 3 
              cache-calibrator | 3 
                 dc3dd-7.2.641 | 3 
       freeradius-server-3.2.3 | 3 
             host-clang-15.0.3 | 3 
         host-gcc-final-14.1.0 | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                  jack2-1.9.22 | 3 
           janus-gateway-1.1.2 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
               libtheora-1.1.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                   redis-7.2.5 | 3 
sdl_mixer-d1725fcb7c4e987ae... | 3 
                      xz-5.6.2 | 3 
                 apache-2.4.59 | 2 
                 augeas-1.12.0 | 2 
                beecrypt-4.2.1 | 2 
                 cdrkit-1.1.11 | 2 
             dahdi-tools-3.3.0 | 2 
                   eigen-3.4.0 | 2 
           host-gengetopt-2.23 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                       kmod-31 | 2 
                  leveldb-1.23 | 2 
                libdrm-2.4.121 | 2 
               libglib2-2.76.1 | 2 
                 libp11-0.4.12 | 2 
               linux-pam-1.6.1 | 2 
                  monit-5.33.0 | 2 
                    norm-1.5.8 | 2 
             rabbitmq-c-0.13.0 | 2 
                   rauc-1.11.3 | 2 
                  snort-2.9.20 | 2 
sox-7524160b29a476f7e87bc14... | 2 
              udpcast-20230924 | 2 
                  assimp-5.3.1 | 1 
                   bird-2.0.12 | 1 
                  boinc-7.20.2 | 1 
brcm-patchram-plus-95b7b691... | 1 
                    brltty-6.6 | 1 
                  cairo-1.17.4 | 1 
                   cpuload-0.3 | 1 
          cryptodev-linux-1.13 | 1 
             ctorrent-dnh3.3.2 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                   dhrystone-2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
              e2fsprogs-1.47.0 | 1 
                     file-5.45 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fmlib-LSDK-21.08 | 1 
        gmrender-resurrect-0.1 | 1 
            host-fakeroot-1.34 | 1 
         host-gcc-final-13.3.0 | 1 
              host-grpc-1.51.1 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
               ipmitool-1_8_19 | 1 
                latencytop-0.5 | 1 
             libblockdev-3.1.1 | 1 
           libfreeimage-3.18.0 | 1 
                libnss-3.101.1 | 1 
                libsoup-2.74.3 | 1 
          linux-5.10.162-cip24 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                     lxc-5.0.3 | 1 
make: *** wait: No child pr... | 1 
               mariadb-10.11.6 | 1 
          ncurses-6.4-20230603 | 1 
                     nmap-7.94 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.7p1 | 1 
                 opusfile-0.12 | 1 
               pciutils-3.10.0 | 1 
                      poke-3.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.14.1.1 | 1 
             sofia-sip-1.13.17 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.13 | 1 
                tpm2-tss-3.2.2 | 1 
                unbound-1.19.1 | 1 
                    ympd-1.3.0 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a85f6dfe9041b105af76ba7ef00eca2b6ea6dc78 | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/898a5a19be415cd277549bb47a671437f383a974 | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c2e54ac14d241c5a1629862ad84b004c03be9577 | ORPH
   sh4eb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5f121cc1db5ddbbdc62d8d2cb618bd64f8a7cfda | ORPH
  riscv32    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bd53518cf3e952c70f291904041d47112d201160 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0e7fd3e99f8ae11d460d8ad1b61530f4d888ff7b | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/99d54c21d715add7364d59b97e32896815dd99f2 | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9ed59b8ebea7ca4c1f0fbd4e1944901f75d7a0ca | ORPH
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c201650947d9db8030912c466bc020c763950dde | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/71bd37bbdfc3e43fdcedda555eafbae2c17c7ae4 | ORPH
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b1901671797875992c5490353356ca01afb3e1d5 |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b22350e9176b1a1baf5b58eb8b3b593ab2bd194a |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6d11ecd08c084a71d7b68b11d492ea6f92ef8803 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cf63502356d7ecbc37fc8f1f73e0c9eefd2da5ca |     
  powerpc    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/f9507420e9dcb1e49d29607cb4d5c71b1398c93b |     
    mips     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/6fc5bbc1bacb20c9f54696553d73e722cc87977d |     
  powerpc    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/3bec9f182008b32c50041fa9d4f15ea4d4f11dc5 |     
   armeb     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/4508c29ee30a7d6caa34b1f215dd00adfdea459d |     
powerpc64le  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/c6a82d3b1d139072124e9c948656a6e4427f8dfa |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/bcd7b361dabe1d9cca1aea4e0c838b51ffcc2e7b |     
    arc      |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/5650f699112b6890b7227a341cb518f77e0dd03f |     
    m68k     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/ec757493454879e99abd4e6de255b101230b5d6e | ORPH
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/4f9bb2da9bbcfb20329f470d90bab3606226d92d |     
  mips64el   |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/d922bc1c24a366a31c3095ca4118aeb26ab794a7 |     
   armeb     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/537f7937cce7236e0b32038439249b36b459ee1b |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/32e4e28843862856cf9a2f6dd07af5be5e1f553c | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/2689043061a5405e02f5f2f5d9d606b9a4d30bb4 | ORPH
   xtensa    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bf88e31467e2e9f393692759b2b2cc57bc1f1c45 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9302566f2f554c3bf141787c0f469191083f3ff9 | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d5e649f398b9b2c9b39216c45bfec2774630a67d | ORPH
microblazeel |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/3a6d55706acff9f5103ba2a48dec324c66d1571d |     
    mips     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/c5352597d5dbda5eea52c4074cfd2e7c76bddb44 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/f319c9688d8d6b519aceafe655229af15e6b029e |     
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/3b56352c53c3ca415addc68bb00f37e58be64b3b |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5b5d9bf88d745b33b3630671ebf3608be9636d35 |     
   armeb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/752bbe0363e39c3128c70cd108b872577d3a74e4 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0c60f4fd816044d4c181cb9b7f55b3f47e788532 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/aba33a194fa344a81a8199036e28ba8d948a2bcb |     
   mipsel    |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/4ade0672e87d4a7bf9a7a03287beaaedc18f71fe | ORPH
microblazeel |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/d11c8ba016840c4dbe681fd4e1b788a5fa3e25b5 | ORPH
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7ec0638e5463fd5fca89dc23665262e21493dddc |     
 microblaze  |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/36a0d76ae9e2619976441cf6188aa48f831eb584 |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/e737a66ecf64bbb641fdd1bbb689039f819e0286 |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/6a0d7606c189a4631b32b50586f2a96227cd8852 |     
   nios2     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/7ec8d8919c8055c47c605969ba45c1a01a8d73e2 |     
  riscv64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/c839cc8589e81bdee44a05e8ca81384b8379fee7 |     
   sh4aeb    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/3ebc5b6f2e48c3dbba84f0a02b4a27d2659358a3 |     
    arc      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/b14c86dc2814e2faa4d520a8e74523e77adcf11e |     
   armeb     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/c13274c34e692ca31d62ca8bdfc01bd8933eedae |     
  sparc64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/c7113d1296c4b747203737c948b40630ba40d632 |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/f560b250f5d55b6fb187b4181850fc1445e59ba0 |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/55028ecc85fd6f6d761de3daee96b5a86bb3cc93 |     
microblazeel |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/49d92fca245e473ecce0fb87fe49492a0e0f0da2 |     
    or1k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/93ef2c49d58a88dff11f4a6ce6274b29748dedf9 |     
    arm      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/908c16a18626ec32ade9b49c8cc004996681b7ae |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0fb60db2822b491d9d5bd32db00421aee423c43d |     
    mips     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0caf9efa9565ac26b7a02656fc9c6259d1d9c42b |     
   arceb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/52e9918d16b96b9e8b3ae45b24f407c572acbc09 |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/2bb8e31cda77503eb326a315d59949f9bd90bc66 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/8cd5763eb6202d9eb08fca9ec4bded4f2509cff3 |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/17d99995c2c9729e690456e435d2cf333da01794 |     
  sparc64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3f683220df637a6d12ca2039a022f1b27541017f |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/38c54c1b7a90c700e1115662c33d5e831f15070b |     
    sh4      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3d2c446541c76180f7c65cb929cd986b1e6d2e72 |     
   mips64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/045e36540dd34eef4c83f652515c4dcbb6d16ee1 |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/b19a9f06aa2e93bcbd02bd9d694bfcfb3c20f1f2 |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/4cf2ae0c07f1622f6d3c9637ca5ac90a15b497a1 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d9e2dd3ac6531f65baf2adafa7710794a8a2619f |     
   sh4eb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/9d675e2382b8cc7ce2a2bc93092fe02908b0f268 |     
    sh4a     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/35e34e94daeb5c8b0b3a707a513ac5c91bdcf85d |     
    sh4a     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/9d4279cd64d545caeecad2e27b163569c1f6894c |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/4cfa347f8973cc6750b85aec7c52170cdbe49749 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a96fa601352f95303a3a533390ac24e15184ca67 |     
    or1k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/c810ce9bfddc6ddad745fce1ade0c197bd7b7e34 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/b04a0a389885bef6b3b409405143e6e539d0a573 |     
    or1k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a532de6dbfe0df99288bc7f8fb04bdcd80889980 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/522207585e6072c7a6c9af26b321e8de1651a0c7 |     
    arm      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/dfb19b09d91fab64b7f3427c77c8c249ad1ff3f9 |     
   x86_64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/5d6b1eb0fa6dedefaecc84da691d63315ca0e6ce |     
    mips     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/24cdf41c7140418e89c4cf468c267f02ae7e5e9c |     
powerpc64le  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/653041d285060b9b2552ec53d8283650e374dc5e |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a727474fc502513f87dc75634fa27be205d87d4c | ORPH
    i686     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c51d77029d17c9de9a7b8f24df20c6fc83109888 | ORPH
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5f053b0da1bd359d226f37075f97be82f9534c10 | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5a5183fb3385437793f106accf5751c9da60a71c | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc9ef2e8ab752466ed32983e4d8f66fa7617dc69 | ORPH
 aarch64_be  |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/194c970c6819fd5f4ab6372fd469f8fc22afcf01 | ORPH
powerpc64le  |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9cbf6fb289490f5eff1257445f0c4b609a097843 | ORPH
 aarch64_be  |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0483e2b1d7692121df5e97443422ea937305f610 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6fb63ad5ac7aab28a29f53a8a0ca304b70412b3d | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/75c16d0032aa37aa43ef885c1f41ee5dcc90f9ed | ORPH
   nios2     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/e93617f89b73304088a8ed95c3254bc84316ea10 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/70940af4a0d1c3ff843875f770583f3230a68343 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/a247e2d0b459ea1f3330b1e83d92cf7ffde2cd6a |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/808a8d14450ed9eba1d2f44dcd88a12cee903b38 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3a3febcad2646d1dca5e910aae683d897e29af11 |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e0ba39a6085013d776209fb28c9f6840029fcb3d |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/32081cc541ca1ef27087093456797caa5557f511 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ff83f6cce7c5b404e08087c109544e23590f05ab |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/81810a01b0532d726266803f205b55556b447f40 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ee14e4185d73eec25739e8baf4e6821ad010a7a9 |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1c160efa665575fcf5c017c5803f4cc3b10a5fe9 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/6e2dcba7fca60e53f1435e638c3a0e5b6dd4e7e0 |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1aeb28a821b8e3471401f97b835a417d2781ee34 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1f21d4cc50a779c9fe8b8b62d314d6cebec55464 |     
    m68k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e853c6f4e41f1d37de899822d7d18d835bd0a4b7 |     
  powerpc    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/a7f97a034b67289db2575d36df26a673fd2d90a2 |     
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/a17b5dbd0307f7346e432f2c93ab4b626d3a7de3 | ORPH
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/6d1708972bdddf89b8cf7891a0e3bc1ebd84a604 |     
    arm      | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/b173e9c2a65b7c3b87c8ff685b0cd972ee4d7d79 |     
    arc      |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/4982405d719060b03287c1315fb7fe6d2f0b1639 |     
    arc      |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/c320be78e1d1dfb78168434601ae78a101c4e661 |     
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/98063e98bdbe1316e808b76284ef2e43e698d3e1 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/998a467365a2590b535277ed11dbbf995a68fc66 | ORPH
   mips64    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ad1ecb457d19bcd0b0d1bc5c1758169afd6addf1 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/aaf55ad5f215ee640cec7b0aab421cab9445d26b | ORPH
   sparc     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/e704872779107a8187e1720a660c29cd94ac09f4 | ORPH
    m68k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/8993dd597ef422ff13a169a2d95423842be070aa |     
   xtensa    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/2f6df235da8c4c58fd1f63d1bc5f9c4e7daa8c65 |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/1e44f44b3efe7e9b003fcfd54eb9023d9c5085fc |     
   nios2     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/d47c363fe7ebd2f7b670c5a9572566ce5172611c |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/238953d2adbb2ce2445a1035edfd7bfea9267c5c |     
   mips64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f9b482730ad5853d0fffe08d24195ca5da916f7b |     
microblazeel |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/15abac3dc3d28ffd2c8c6f6a37acf250d0552094 |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/142c298359dc2c40faf982cd76734999a8504c7b |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/723c7909e602f2a5c2a78b50e5a3b9658bfb643a |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/280726d6854bdfb6230a10d129cac7019606ac58 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5bf2670637e71b6d204baf1f677c319975df30ab |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/fcafc2126cadc54514f666d22876725b94943a60 |     
microblazeel |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/8279a218103e8a75ce8497e2064bed90508e60bb |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/46ab247baccca264f51b350791635f55abd0876d |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/a4ddf70c04bf9f39e7e3865a4ece5219988d33f4 |     
 aarch64_be  | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/4295159d0fda7be321475aa6c0a20e20cbc52c4d |     
   arceb     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/1d13350c2a27bb8d151cf51ccfa6dc046287c3d9 | ORPH
   sparc     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/588a03e229b4f7a9b43b49200da033527b66b179 | ORPH
    m68k     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/b902250a393e1904d9d7d0f26e0e0405e17fdb5f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fe0e8917ecbc873701d8ea25a66eb9ebd47cf522 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e0886fd471ee4c36e543974050c94b6abfa55439 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ef7fc14ec6a64d92bfce6dab91f9b19c817a9cb9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e12ac162b5e0e112d588fb40223789e8983249d6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/280b4611f981347a603ff9cc7f3755a72fb06bea | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8235571f4429577e4d8c160ec43481d3f56029b4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab9716bee6555a1f05531e6fdc21dd86e3d2ac15 | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/790f9a5f09387398c49111095a9418d1bc3a89f1 | ORPH
  powerpc    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/82fb17e6b44600e37a492955146748b8ea11fec9 | ORPH
   x86_64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/038248460e0b96b79544d1e5251e626fac19c762 | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/0cfb3597ad7dac7e06ae96a7b0fa79981edd549e | ORPH
 microblaze  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/35b87cff7f192d835934a11abb34b2aa46fcd38e | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/71714148c07900a23957ff84d636e6a0ee14c931 | ORPH
   sparc     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/693823c0ae310a31fed2176d73a129667b1500ab | ORPH
  aarch64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/ee279e5165917b0c5e3599a795c1e5a9b072bab4 | ORPH
    i686     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/b94ca71c26cf9da1501eaf04a601ac8cc04a108b | ORPH
  powerpc    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/50ec3562eb0ca391fcb9a09378d2226d06cc2bc5 | ORPH
 aarch64_be  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/2554aa7dd7f6d471d7fba74b06229c980eb17a55 | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/c54523307662064c13d82cf06c295fbab8831928 | ORPH
   xtensa    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/df85720f2592a21347bb83b09dc49e6fd29af487 | ORPH
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/49fbe332345460cf93ecfda8d436cc3991c229e2 |     
  sparc64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/5cde1fd56df7c7e35ffcc94be4ef86ab82b51b72 |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/0131729e04443ded330d8f9de7eb3d18413a1c8f |     
    m68k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/36f2b3e8da83eabcebd070c0852b6ccaac151923 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/19e1a47e7bb360819e936f2027a10761d07cac92 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/875106c810bcaca524cb2730b9b053814390b5da |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4d61f6b6a76a3882978e3b715df4eb89fc73a4f9 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/419b7be1a8ecfd54e9b70338cd7321bf7a6e680a |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9bb7682194aa95e7d4169b161719c270fccb6eb7 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/993e1fdfc7fcf4e73cca5f0a8204355549d1f2f5 |     
   sh4eb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4d13abe7ed63d6429595b57171aa401e21d112cb |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a7948aa925e069642f4af7a884e17fded545b402 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e2de6ebc63d4933b9c1b7fdf7b80caf6264dc96f |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3d2fc44f9a253983c3ddbaf883ea1f53a1cf36fc |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bcd62691972a0bfa8a6d06d111a3d7065378d7f4 |     
   xtensa    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/57c38edf13a6bd1f8090fd9be180504c362758ad |     
   sparc     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/1b8dc83eeede8e889ed99d2e1ff63753b1143281 |     
  aarch64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/3fb0f7a8da49ae0a401d547450b1745e63db7383 |     
 microblaze  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/00ce8388bb24d0d31239b4f0faabb8e4a4f22808 |     
    arc      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/697ffb47de3ae30a770d6891ad06f4d8ff568774 |     
 aarch64_be  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/cf8d57a86649b9d38d5095743c62fb9b47f8263c |     
    or1k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/986821a47de41063aec3a5cf6ab0e6f0d7a73177 |     
  sparc64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/a8427d8cb6a4f811a1601a725cab3fc4e81d8b9a |     
   sparc     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/878a2352ad5c7c1dc0b463bd33e33b1ee9ba2c76 |     
   nios2     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/c89368725fba1526d49718fa632d12508d1b7710 |     
  riscv64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/a408d593ba6bb089fa4fdcddc0a6228541b16865 |     
 powerpc64   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/f2ea86b1fd5a14de5f433db2810087e91fcc2fdb |     
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/53f5af22f08c7df54bda8932ba92c922538c39bf | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/74341c6384f08068590d28b0d479b7cea01dbfd0 |     
    arm      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/2b01326ca6954b5f6bf49838e2ef61fa4b2af096 |     
 aarch64_be  |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/43c604f1ab53d590455b8f00b7b554fe08900697 |     
  mips64el   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/0dd064a2594aa9276f0898245747e6a8e23a2982 |     
  aarch64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/5ec8742b3ec5e1f933754f2b2ea84fe641802e0e |     
    arm      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/4fdd042ddd97cf2d31e9f71acc258f2b8f24676d |     
   nios2     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/f11a11ae1321d7bc6b04217a4eb4d5b8a5ffa9f8 |     
   x86_64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/cada199ed7393869168f697240bced170fd0d5d5 |     
   armeb     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/4dac9bcf38070f24f166ac65c7eef8d4e62a4348 |     
 powerpc64   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5c6c3b9bc4b8ff73670b1c46721dbdc2b449fcbb |     
   mips64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/570836bc486aa49750406636a6d2fbd678a7b898 |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/56229883c7c44f6be6ded05ecb6d507d54079675 |     
   sh4eb     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/cd27f0d749bdc560185379dc0185da3952f3639c |     
  powerpc    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/8e34d520d442dd48d8486feb53ce203383f20533 |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/95292db546b38ff6b2f42290bf91739a9a5de1eb |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.net/results/24f6b336db1a0340c59d3b645119589c093e0a5f | ORPH
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/64ca15cd912fe93d81ff7539e086e051c8e263ff |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ade4b677f2a961e51bd81b6b2a8963bef8095619 |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/b6ca1e0924335d11d7347132f2bef8d7d0ae3e0e |     
   s390x     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0fbfd40989ba942849563c6266fc10a52a6fb00a | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e5e876a7797efbbceed9d8410fe04b7e0b47faab | ORPH
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0a557aa413f1fc87a48a45993ec11cae74d2153a | ORPH
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/c94bf9c961d86e03d28e73c74408ab6d6f125013 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/6f275cff3148f36517892e25fd60ecae43a71dca |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/4daf2239e66d6bff95caf5efeb7e5348e7749384 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0f08f73c1218ccd53e02954cfecf3ddb77435124 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/90cdf03fd1aed529d17c228f8911a8f6c7b16f7a |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/507550281b8728a00f5983d2496298845c49c8ca |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f33877b374ef7e3d3f929d5b13fbfbc9b8d08c1b |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/6c48306eb09d187a10dd4481a70482ca952afb87 |     
   s390x     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/65445ca4689a3b89e62cb69546639a6b93597469 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/dea712b53f2618c03398e43becb2894bfeffe8d2 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/dfeb17a5a10adec1e3486cc44e059737ba4415aa |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c7e19ae6e88d34d619cad1dd381c962426ea5ce6 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/84150974d7de2f5968a364ff0eb8210af07a37fc |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d26092dec48ae80a9ed04e33f463806380c986d7 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/885b94e4da31a8e5b464ab03a3fb9f30ac6a4bf0 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/161d8206592b2aaddfb610e373b3a16235b6b3ba |     
   xtensa    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/40044684aba540e43aafae2a072491e8b1f9fdf0 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7ce426689b1d3c0f0e647b8a8c2e11c95fb3ae94 |     
  powerpc    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2487808ec7b4108aacb0e8391bb36f00314ed7ad |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f57e873c06fad008799d52d0f6900547d052e65c |     
    i586     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fc0939c44d0ed10337b5ae102afa66140eb6c4ff |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c9b9d3f1673be74dd381307ab49d3ff548c09a3f |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2b3c5f31354d42efc14fa6cc42b518277cfa901d |     
    i586     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/15b818172e4ae0cbe3cab9b0f583c0ebfdbf2b96 |     
    sh4a     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/753a340defe2558589a952e3eab757ecaf9ff9e6 |     
   xtensa    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5c3d1c0373c2aa1a8ac1613bdf6b9fe7c56b1813 |     
    m68k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0e2a2324001decfc944f9330bee7481be57f8ccf |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c854ec78611b1cd429d33349f7eecd0f78a31e13 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/10cf202e9245bf9c3be80443f2aecd18a82b7d59 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d45766fd5e42a6e228b97ecd48c55917fa11709c |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/714a8f6288edca9ec764508f0e4f9d6646ec08b4 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a8c7acd0185f17877fcc2bdcd36c7aa91b719a96 |     
    m68k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5c60f1b293652e3c0febfb6accfe7ea86e19f386 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b0fad5aea29f46f74b2dcf568e5a1ae0249a7cd1 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f6bfab772729737820196c7a651a543fffd10c46 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/35d846f770e6a6a36717d874208a2a06e14affb9 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e179f931941eabf30d37a442fb5bd72a7a912e59 |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6bf78ae9a9351d9b813e72d251ca0c7eb6c29ce1 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c1369b55917c7c24f37035b5dca4df6fa05042b0 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ae4692146dab888639d30243b8ab9070225b85d0 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fded9c500f9ba30e0c9a173d61c77edbc8a1f998 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a3904e2d95091aeac4ef2b94525ef3f1d0d81869 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c71a7dff9dc2a92405d5be06f85cca50aa25193c |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9108061954fd6ae5613fca80ce68e8bd1e3a69fe |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d32de6ed06cbf6e46adb078f452f681560526ee4 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b830bc05f0518c10f43ae071dd065cbd45d40a3f |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/526a332f3c7dd5d55cc85ecb65b2a17b9f409e2e |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1d1892b77253d632ca38fb5adfec10e50aeaed18 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3e910532da7c7054aae842298cad082bfa51a77c |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/775db4f887241656d791c20ac3f607e0a78b4b2f |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/38291cd2ba6879ccefa45987d1533e6813341fa6 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7cd71b9804e56e33f79fd85b5bece3181e51743a |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/43b3860445adfec089df2fb32322dc9ad78dec5e |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/bbf55c3859de89d73144c00931aba20ce9034f00 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ada8567ea372178d7dbdcdcc183489457672a738 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ca82f5a88fb079d2d17b43975d0b6ec6adcf303b |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d879f31312735ca38a97fe8e79ab6acf2fcfef44 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/194296b1c52037f852847850d96c37756cd10f1f |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c1dbc1cd76cccb3e84622439d1446eb362446881 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/943660d4f74db312969933c97434737c0c9a8790 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ed8dc301290537a829ea4cfae16b06e0f972beb1 |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/191223cabc29dad8955f26fbd49f20890f2ab679 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/398ab0f7697120181e3e8ea523ccd5924aba6cff |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4b69a7eeb33982ff72cca59d75344d1bf302d628 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/938e8fc91ab90473744f28f8b17dc50e71c331ee |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c5db122fb16a0150b8ac2fecf816a1617ced8cf5 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/47c779cdc39a8ae79f74cbfa654a62f7cbdec28f |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dfdbccee97f9e274d54ec1d976420fd8ba93b40a |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f8879ce308eb055c6c64383f4b8b0a36e3898a4d |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1ad17556dea6c747ecef2bf953e3d7be786da513 |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c92d07112317a6bd0a148c7cb52b60d16d9cc3dc |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/24706e35977fd8a71ee7ae950f202e08e6e06db8 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a871aa52c123c25294a672b4cebf5f2a421f8678 |     
  powerpc    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/80768b3b276b225ab257f184f4648529a50eb535 |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6473714708d5d052fa2f514daf25ddf8da135814 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e8eaf971c75fe07a8a43ec4f47ddfe610a9cefa6 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b25ef4cfdd82b98331a366da6bf5232ca7a24df0 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/68b72ba7c9b26f62b9448ecf7cda4eda4da53c7a |     
   mipsel    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a5eba7afa5177c219fa40d5d5beabc1f984daddd | ORPH
   arceb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/925b3cce58040d6459a0bc9277f51b3d09d2cedf | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/dd9c34196bf6fa3a485c1de230984763c361fc7d | ORPH
   x86_64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/6c99bf1a37c6e5d18ca7fbdc3cf3dc14da716de0 | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/df26bbcb88d1753b8cb10b059c7a5c918ddddf78 | ORPH
    or1k     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/c737151380ce5e3a0b540fbcc2cc82fd6c9224de | ORPH
  powerpc    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/52557e2de09e46a0dcefedbcdb18fb7d563df744 | ORPH
   arceb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/90ac09187019cc5896d50fe817b2cb737992aafa | ORPH
    i686     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/75a647e168882fe2d0aa556ef847a8e514db8ebf | ORPH
  sparc64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/05e8ff972ccb3c7e0b65fcc938ce93c7a4731971 | ORPH
   mipsel    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/2b90784694861e2307f2fc1cbf87ffb04cf5a32b | ORPH
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0ef70da56f45bd914fd2b0ee93442d2b1ea170d6 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c2e0c1d1122894d675ffe403ecb4abc773503c03 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a4569c7db335bc76c42482efcf8fa6048f8bccd5 |     
    i586     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/10ec4e273c91cd4217c5efabc67c567797bdc057 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1ceeea61a1a02650224b7b7aa6376248ad7c04b9 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0e7956bd8b3697a3e7fbe57638cf7d0855ba9399 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/adf3f7a59a86657a73cb978076c3305e7028b843 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ada2e4eaaa7485dcd1a077b1e9c28d86b7bda1d9 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0885409bd8f1f2f789831f4bbb2cf72f52721e9b |     
   sh4aeb    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fdedf9f6d5264d2f1859feb804c8e74ea42ed54b |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/af569206d992f7a0ed9180c69f4e1ba6f1b6c6e8 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5eecb5ce2b0c363d85a6b64cb6be5a639db83549 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/76271b65fc0a9dc9f1d3e19f09607908a88b172d |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1f141d2e042a3e19275967e8b8d80b64dbe332c1 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bcbea5b2ba63f411495fc563490b120f3e4b550e |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ddb01374b3c223c0be7f61a87750f2bcfc9375a5 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f450c48277cec532805e8ce21da8f8b0fbdd5eca |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7fb0fca4d52f27daa84682b0dc6d5c483d9dae77 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/044d4f88c98eeb7ba65d302fc145bc95d92b2400 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/675cc05cf19a70ee5bc2f67d730b9f2a13fc7569 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0519a44083a34c31c6ad8f7059096e730e3e3133 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c3b63619600bc3bed026656960b7318c418f1c76 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3af1465633bfdbe044c5130af00815aa63e29ae0 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/29961b3cc8a8f666b7526cd202fd49445f2738e4 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b1b7dfc35ff133c5e39ee3c55271e8103b323075 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5f4b2cc7950aaf9f8cdbe474d7d21838b26a783e |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1edf28c8a608d2f2c797f0339adf8616bdcfffa2 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ee9c040b69a90e210429e2a614059a7b9556a48e |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ced93cb06c09f4dc2ddb1f353875524c062c38ec |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e2898fabf5f514bf2376fcf1cd4912d9c66acc96 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/75095e9455ed2bb90f6c8fbe644ebb99f5f10f0c |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/120bc5259689e833235997de7aee3d35981b0c97 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a99f9dbca2ad5554f40baebae97f36cdd3395758 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ee8dca4cf67e4d3c28d781007263a6019cf34382 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/044543c72516f73f164c8bfbb9652810b739eca2 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/43e2df329070ae4937afa93a4e5ddedc45ae6c4b |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/25e2eb7de32ad1976732108b2541eb02feeb42d3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8cc8b55ebb5d3d15f5c630761faffaeb95343643 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/513201f5e2a6889bdbaaadea6b6dd89a8de315de |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d1e40421ee8f92010b2a1699fdf9bdf43f782594 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/14b42aa6077da81867546b68feffc0d02800520a |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/50c99cbbb85251bb68a49d6f26431a804bd85757 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/83260f587f9bad7eb0b44b7ed34bf993b6ca3791 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ef9930ffc3e2589f10598db06b7e5b7265fd9ad7 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/92f724cd1124f346ad10c28188db5e6b92c91542 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/35c1e8c7f82e89064123442043d2e5799d8eecfd |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b21e04405eb81bf585070ee723c2bea306c680b8 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/82f17de161ba0592ae16e87bd29d45dec9fb99ee |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9da9dc58586d4bc1ba346b339abc24a076abe87e |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/40de1bcedb6f78ad4d0391f5cef9c696a9655289 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6c506aa1d9cbe99d0a26c51c824e981e8369b461 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3744cc5b3f428f4de5bc1eadebf62e6a95489877 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c715d6e098945b112d99b6692857bb2871687809 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/483c9cd7bb6ee632c0a664610f80ee5c1e604bfe |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b07393a9cbf05a9509c3473c0e5795ffbb6e1280 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/36eba16f3d676d5e85545be4a4cfa5c968ecb02c |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7da763e1b0ef17c295e3db046a49d6e5e56f2b5c |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5f5f87be523540ab2c00f7fe24f76f405300cf84 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e3d31813c2e2c9f08987ac06bb8b907ab29fe97a |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/29a80757f2dbb1c1dc947d151c156ce78c0a1c84 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3eba1c8bc9641a8228c7ce57e906d569ffffb6aa |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/99011eecda9c38d04fc9b36674d1d0ff884bca06 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1c625a42b76efa8c56911ae9316ce242c74b6ae6 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dd5192baacc29609709c540cddd64f1e579544b1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1e5a1f931db6df08295057d1f93889e7efe1e070 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31e02c9835ac20f499608dfacda1030f1274237a |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f3b83b28ee3c49851b1275df0aa165c950efc6de |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/41fd7373f76a50438bde8339eac64cb9a5ff9f24 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f8673e7ea13cddc03b81831ee865cd56f40d81a9 |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/75baa62275d64c699d9757f7c756fc03ea717877 |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/03e14f10f048395f19d1178685caa8f7065c7b0f |     
  riscv32    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/9612e422f095957e2672e7cce0f6b1e064be5eb6 |     
   nios2     |       host-fakeroot-1.34       | NOK | http://autobuild.buildroot.net/results/79b37fa4eae7677b6757139de9f4b126067ff157 | ORPH
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/bd7dda4b91b06765dd0a165b8196ee4c9e148282 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/f5167c55a0f7f7687c7bc39a99feac42d812c57b |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/2b64467cc899236f4cc601037bfd70fbdbb81c7e |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/aa409f381362d2b7a92867ed8e0d9c26eed37c0b |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/65f0ac581cc4aa32134b2a5e2d44462336d2c299 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/9b9bed836c58087264ecc6cc632fc1538acb9f03 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e268730ac9fa98bb96e11b4ee3d626987c930377 |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/037b52c48c19a4ad07b214d3d5d3df16015d46ac |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a2ca47cb15df3083806bc611941ca494fea4d238 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a9d919cd57dcc61c7fbe831bbf40af03e770fbd6 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/79e7ad5ed14ed82eaf5c0b0a2b36112f6cf07879 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/feeee8e77d18959f55768fcbfaa6117170ae6535 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/58589d05fae267307e9f8bbf42172ade29f2c7cb |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7e4605e4d4965b3cd769ae3d7544d4f67083aacf |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9b82cef1fb0f76a36a3c251e2ec78be5ebe50a22 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/d0ef0069ceaf91ff88cc23e4e3ac872ec6317bb7 |     
    arm      |        host-grpc-1.51.1        | NOK | http://autobuild.buildroot.net/results/18e6d102ee8871c1e84726c052ab1997ac9269bc |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/54722723d17f8843671880df59c7630831a2af79 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/62f5d79b0489e054bc56c33985b0d153a1035c03 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/803f48454ce53e1818457d70ae88e932f19b73a5 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e011144925e5017648a3f56524355132a22a23ac | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80027101265d72cf580d53abf3d808113aa56183 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/53719d0c5aeac8a7b32bb82dbbb8d80d9cad4157 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff182f34b235465a036206a819364db5cfa7f11c | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/755cad70457c4d20d260c31d467542ae03e60330 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ba8a9dcf56c7d43ece03bc699eccc23571c62fed | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dde9ea67ee566814cbfae80f4a1e710bc093b0ab | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/67e10b733f08c5fd6c927f9002464849d0b33c6e | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/892ed985d0acc493f68c219282a43263fdfe37e7 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/218931526d081addf07d54fc7763a8c2f2ed2134 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5a236c3f67bbe16644e6c5939559c83e883e5b9d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98c0dc54b58465450d853306fc3c15b2dc50b2cb | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f7c0a89188971609580732613dc3b5fddbc94d3b | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/805dc43cc5e3eb6c56ccd689be409b02a75c0554 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f7a899c7b35899510044fbd01bac5729aa20da25 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bebcbe2478d5a546da679013776474b26eaf88fd | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f0598dcbea7fc95cb29e744241e854569094669 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cfb717f1c7ae732469e163b59fb421ee58defb8b | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d186bb221abf0e1d545803ee786a78bbf1fd0f10 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b1a2fb5f8f7282dddef6ef412227f8fb2e106c6c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/793839f2282ed02fe1d9c300cf835a7cdb8491a2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c11f4311ec1019b69ce4b1888e08999255705e65 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7bce2d02dd3dc60df2291e3afc19988701fbed67 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4d361624e60458592069bbe6372b572fd55704f2 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2af758ff28cf56ce7934495477bb44c76c788c45 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b469b25cc89fcbb928f09349b9aa6bb4ac61e5a4 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/983619616fc5376c765550a64434768e5d83622d | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2429fcd26edfa93269e422dcc5078be229957d6 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a7a2f7ea80b4e7c4f25f2cb9b24524b8663557f3 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/01e7be58246a014d2d2b70fb97aea5c7c2a875d1 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f7f17bf70cc1850341f391ad3f8beb25e64112f | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/068b61336d013d05b5fc9d5c0dfca47cd6899c9e | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/38aca05bfcb1102d559fce843bfba673f0191e56 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80e397f6836e6072f1f1b240b11903030752eca6 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6e75fec85d67bc52bf5d2011fea81967314ed913 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0207aa3ce180208da48a9b41be23f5a1869027c2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7217db13c4894a84dc2a8fae029986b4236166d | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/728af504ba7b089ef679fdd3ba66a32f81163880 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/00307efae8515d0d37af91be8fad5705dcdf475e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f0bcee98033afe938d0a6b88d9d19820596ed971 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aa63ff05b156f4581390b16bd7c0da018d6b803c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cca434b21ada68dec37c48ee03417edd4614816d | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4017b642c24adf548413c7ed98942c6fd05d057 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c8b1dc4aac189ad998f553ea19ea0ef2325c8cb8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b4a598ce7182c902d2ff9909be99ca815f210df | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9a74df2ca33998ce50e87d55862df2b92aaf1c27 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/824391a8b2db9571f50398ec9d752b084fdf087a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c86e4d349fa72681ffa15a9ba1df31e46b27dabc | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dbcf769a54d9abc9bdc312539029d215c8b3b3c7 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3fbd2674324bd550bb5208c50a6e76e19df04d8c | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b16c8596a008fade834ce255b17d4ab91c495378 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7cc4384215e47bddba76dc10a3614189988d1ada | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/35ddd2e0526a79a22a116e554a2a3f2793ec2b93 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/56d8547a0a7ed841fcd07e91125e9aa44fbc386e | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd915d19d2080ef95c895553d8965ca73c670fe0 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/84360ff1ffd779910cfa3b617fda0e46f8b0eec0 | ORPH
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0f77d413f5850fbd9baa19457d4d40a4b82e3c73 |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/c28cd9ac0d0a005cad8d61352c96a87d227cc714 |     
   s390x     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/004a3a67f420511ceaba67a92fe156e3aa935bca |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/04aa19ea97c67c85b1aa30c8bb800a9e872102d5 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/584bb2c8f0ed88aa3ada58244688f59c7e62b4b9 |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a45f7417d8fbc4af749872e1dde3fa6751e75f0a |     
   arceb     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2ef96f2714c311d34d28928d24fb36e8e907073c |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d62837b80723868a388b261404aa622cd1c227aa |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/41e0f35ab11e0285979d2f3e3ad89597a23fd9de |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2e8fb27083202451ccd7f81e332eba6098b82fbc |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/85ac279e8fd8be01d8fb4df4b153d9b949b29531 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/2c86c4a1aaddba437307f283e59639df5f11f926 |     
   nios2     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/f5747327b97112703f8f6ccc0806f304d70a8bd3 |     
   nios2     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/2df5839997b56fc8a7e7c5c2eaf492c73387792c |     
powerpc64le  |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/4a1c19b2a1620c44e49c1c86ee2a880e2d5c8089 |     
powerpc64le  |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/5e6aebd8d2a154765f09859c675e5cb01e283de6 |     
    i686     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/af480bd25d941e748c1f157c08da95de46038e5f |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/0fab243a83f4769ad7518878776ac0bbbe533c86 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/cd8bc1d5246d3fd98cca74f68cf3ff3e02d150e8 |     
   mipsel    |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/db552afededb6144292a472fd536567eacab6bff | ORPH
   x86_64    |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/3161769588d8957724c763b8c2024d0b98cf4539 |     
   nios2     |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/835eb85eed8350c1557872778524770c9c928bfb |     
  aarch64    |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.net/results/cebb4f36cdd7b2f31fd5cbaef564c6fa91e682d9 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/58485ca2d9b2516d9c30b9046e6d906418e710d2 |     
  powerpc    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/b7179affb206e755ff366d67ac3fb56d6d34f8ca |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/d842c7b10568aee914f04d463a97108eff0a00bb |     
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f7910ffbcc58f467617b0ec9f88db847d3d2a650 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/52e7f439eadb65e6c35d7aa77ab9cf3a3911acbf |     
   sparc     |         libdrm-2.4.121         | NOK | http://autobuild.buildroot.net/results/9525cefd85fa3f0fb4593a0f93eaf94eabb11646 |     
   sparc     |         libdrm-2.4.121         | NOK | http://autobuild.buildroot.net/results/42419cf0bcb7e9229f654a42d156fb4471dbdc5e |     
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/fa50437deaf66e634454f4336f0bc040008ffef5 | ORPH
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/6bbdb3e99ae0b0ea0f49c7754fb402716bc70e79 | ORPH
    sh4      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e66b77cdb3075d8ec801fb7f28ec6475dff1beb1 | ORPH
powerpc64le  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/b1190270cf73165baaeaeeecd4b643b78a8f7df1 | ORPH
  aarch64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/197e86316fa91073d97ed09e219b723854bd164d | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e190b9bfcf08d1a3c0e4bc5d9497a34e6b34303d | ORPH
   xtensa    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/301ad9ca2d76c322f32a6715192aaec44d5e266a | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e8d17b714e301d1eccccc3ad681d2e3b9ecfafb1 | ORPH
   arceb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/ed39d601a3deb5f3e91b4b5ae66a5858f57a0379 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/26a129ce55a7cd0c4927b0aaf95d78e39a1f3f8e | ORPH
    i586     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/d89d48e0907f3da41cc08947dba3306a4c6f7412 | ORPH
powerpc64le  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/9c115939a5f236c7905a2d1037a17247ac3ba305 | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/a40749023dac002dc514a9ae701b1e61d1dd47b2 | ORPH
   s390x     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/557f1f1ef68b5511de22bf7bf938f6a5ffeb8f38 | ORPH
   arceb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/611081408ec7189c85e77a56f10c057c7778287a | ORPH
   xtensa    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/42a25eeb0bdcf9b600e4fda1574f00a604e6cbdc | ORPH
   mips64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c40a21caaf6c0d991e19eb9c663f4e2eea4ad412 | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8bf3184c1964c1628e88c01548c5be276d3cc570 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8e04d451726a11fcf750605e7fb097e74b539872 | ORPH
    sh4      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8e7e3913d3ab05a0cc3973c7da582cde8a837615 | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/6fcfe9f6d730b127ad6a5a8cd362664d8ac71d4d | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/58ac4b6b62276f2cf385f7a9c17a75aaf541427c | ORPH
    arc      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8184bd54691811d0752f0ffcf5661ba67c2486a4 | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/05044a802e08566b27dd2a87af5a365d7a268ceb |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c516e87a61084ed86b44090d811df0e54efc03ee |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b7346652b0c6a325bd070e1ed103be91cb8dfcb6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/626d6faba522db0fb8238fdfb3cb74152271e886 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cb2a84945802275d7461491146d1af2cf45b2f75 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9434174d3885735fdecf60ee700ecc798b1918fb |     
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fa283a14a13daa248571fd86e2bceebec433e10a | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/50cabb39bfaa45a3363d81f6183b023bd99bdf71 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bd3e5eabf77f92f655e9e074dca664c2102eeaf2 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c01089ece693d8ba114ce4fa030fa044d5e269f6 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6373d78534c985df0bed147ab0bf7b3ed69171ea | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1e030996594c64f91d04dd5052790d2d95a224f9 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fdf307bcc5fe9fa50b2d2e620a77bc1322f8fb38 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bb5a464ca5b279d9e79564dec1b21fa6a41dd53f | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/204a1cefb12073afc185652139b093d5b8614957 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/11e84472ec57f1c2ec527fd9088633a0c7e62cd4 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7ede7db2fb44ac0d3f0752336af3115e9fa017c2 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e386e9a3c70f96989a8c519761599ecf0f0b0622 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/65cd4a56f737edc1fe3907a2ec58b92e6a8fde1b | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/050c1b3ad33c34f18fad46c9a7f28399d1585197 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1d2b9deabcc5107bd1e1be53b2d64a4b0dc895bd | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1adcaaf2e8b0e52db9d4f1baf2e9e6a82145df12 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/883090817962e5c3ef7121d0f165a78b696ddbe9 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/582c5d543b5f071195ca0a918e29cf2d34cb2846 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fa22c7bd91c65240024efc1598f975a1405cfc04 | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c33a11b8440c63bfb2670d937fd1cfde1f52da6c | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8e2536c56faa7a21a0c8ab0eefb60fb0ae855618 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5eb0b2c56a49fb417037cf1ff17d6d0741c8f488 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a001a7c1c0769ea9b504fb52879593fef49f6e35 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c3e211e2e459da8222245f14adac7f31e19c99b1 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/845c51b0dbce480fc0fce1cb8cb86c8bea1f996f | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c38f9bfabd97e5d6b6f2779105be50643e2e1020 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/91764f880c89477c98e0179cd4e05a25805eea3c | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9554f859da4c925e4e0d2ada0f5c82a12729c412 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8f5fd3cdd8726d7d486e036521e0475e886b318b | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/30e6727c577de0ba475f169894ed67ba5ae81856 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a007bf1b6d45e2f5df9c6a5be68ccd6d4399bb2f | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/da63333781695ee4c06d4d5bd77e076aad2a2434 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e58d232da437afe40a5b529cf6074a4277fb3201 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6988fc944bc7c55356a28479972696a7b69e8bcc | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bf3225f0b3311761c07335e77f7322faee6811f9 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a2c1639753667dbd0c0ac84a8c0a49ceb681bb14 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2f0be53ef38ce82de5aa3485468625e015c9f244 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0043a4070c20ca79b1e7a9e9053f379da0a1f389 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5ea440ab570bf3a30b4213bcc74f963dc3a975b9 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a807433507096fdc04da87694d616bcc167fd311 | ORPH
   sh4eb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3a2f146d2b5e44d2eae05bbad5ba5a118b2eb76b | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4f099074655ab4ca62e0cee865206b8520301b90 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8c8e82be4eb49dbb9896a37d02424fa558b0d09e | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b10fdc28f707107b6a5b6ba2f3af00d09c6ac389 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9c53f1052633d523fa630a67b72e20a537313a87 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/100803d82cc186673b3e7743b454626411258b85 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ec07a4f4b671d862aae844bcfbac7428946a5a10 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/928c037827c3c0b55a84c3dbd8c731f43649ad89 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/dcfc9402594d0e51762f1f0888958b75adb474fa | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bcc11e504e15abf7e9e9d861a45dccb8fa6ada67 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/94bdebbb418569b7b5c8d41f7142ef9c64100a7c | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/90b3b10fef6348051bccaffa4f083564c695d86a | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0e659e56ab7ce6585cbcee616d2be58d05cbdaca | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1e83d44f0654614739618b91774e9c199eb1bac3 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9143e0ced35f18e3e72d595e1612e988ed65515c | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9586faea56fef5b243b5c77342a93d3050df9b36 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/289cb2a2fc20b4080917a4505f244f13c2cbb0f9 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6ad53ed15ea827fd29a9dcd5091f49ef306785f8 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f5eefad56a760bf4657f9234df47bdc4fc7a48ec | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ece58b0b9bb913df890b83b971c9eeec39a9c06a | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2333030086ba2b2410dae479b93119a10e06f744 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/adc8fc69ad26d8f5e1ab0f0c892b75d011d1bf0c | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/aaa6c9704478e2d5966f6370019fe2d943632369 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ebdfab2b18ce6a4f705ee006edd3eb178e4ed140 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7f7e0d079e5e4bd01b9e03d44d8ea14d9b1bba93 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/811e824dec9d06ad52a9ec34f11d5c10f8fce01f | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c948ab0c2444c6c69ace3aab7af1ea5da9467c4e | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5c17e8b440dd1822f77561fcd4eaa05171d57aed | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1c71523ab23d1e6fc6fddc87a305fdbd8e93aeb1 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4b5bc762770fcbbdd81bd01f6315f7ee2dade2c8 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/35b02d7fe662d33aada8ce01c4e87e8f82440b6f | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/20974a88ea3d165068175d0dd4bb64fde4dd78d6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f7544cee36e82728856b45cd30808ebff16ef6b6 |     
    or1k     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/ef38f479a60e97ff657f704ccf2d40b8db69d4c4 | ORPH
   arceb     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/fcf6eab3fec6d38bbcecc1e7ed51ee587239ef76 | ORPH
    i686     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/501a726ce0397d2debf09fdec20c1df5dcf873f4 | ORPH
   arceb     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/c5cff80b36f3a2e148cd5ac1880e136b80405ae8 | ORPH
   nios2     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/006ddf8c56cceae8c4e677831139f0fe1d0df813 | ORPH
   x86_64    |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/20490745da4372b62e2290df7d4a8bf325df4c29 | ORPH
   x86_64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c006ff99010b47b90ea9354ee8eb2f9fe54fca81 | ORPH
  mips64el   |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/dc9f8424ef94d7aebfdf6c50592858e642ee6477 | ORPH
  riscv64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/bab1c144c80220287f9e2a7632a50bd5a40cb874 | ORPH
  powerpc    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/349c0fcfee8f0dbded8ab2414d28d78aa1e5c972 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c8f156f1a43a5d0b16f63f3f046e7d652c0a4e98 | ORPH
  riscv64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6a6d11c34052d84d3738d048f666dfddf6b49416 | ORPH
  mips64el   |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/e174aac6d481f6e121fd200c571565362ff56b6d | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/97155f19388fe471b92e5ee2730f596ad8267f3b | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/445176675a3e3e242d79feb35ed16c646d84fa4d | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/d2808b7c5fd2694ce096153d02e71066752ffa65 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/40918397781db67637dc7a32e05f5e2f99ab6ae7 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/263b1b9c85650acc736f45a54e063ccbaf1dc3c0 | ORPH
   x86_64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c338819a42c86867abc249ab7687d5efa635c25c | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c471084333349d65688e18e33b463dc968368880 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6ba78d30a6659ca2998377e9ce65b4626dea5970 | ORPH
microblazeel |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f0c26320e5bd7244731e2de9805358fb9c84716f | ORPH
   xtensa    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/42665350fee532f2859a98e2b81e884706fb6ca7 | ORPH
  riscv32    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/fff7bb63d30e3d6df72a8b4950e75c0cc8caaa7d | ORPH
   armeb     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/7e77c32e684cfbb234cac3a1526366697aa6e675 | ORPH
    m68k     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/77eaf01d8d1a882d4e7d3f0a92c61706d8a7a26b | ORPH
   s390x     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/a584c71df8cb867f6cef7a64b442716f26843c24 | ORPH
  aarch64    |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/9a1dfc361e058d4fadfec843da70309ef1ccce87 | ORPH
   nios2     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/662bd29b7a5833c7d5d5b78c7766fc8e1e5700ac | ORPH
powerpc64le  |         libnss-3.101.1         | NOK | http://autobuild.buildroot.net/results/db806548db76947c6a8067dfc53202c397c89a8f |     
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/a1edaae32a53ead037f4d7101db9fdcb9c08719f | ORPH
   arceb     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/198f3b5c66b8f3e705f45f75d0f3f6dd5a6408d1 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/02c54738b61c5585fbacebca488aa2c4e0a5ecfa | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f45437ceeb64ba0f3c6d710f8dd786c95a76e8fe | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83fdd6b20108bc58fd9496bc6581428a0b771277 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b86abfa3931d037ac19af099a3ac0a0982c1e0d2 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/250d419b8228ddc68fd70f0a3e45a074bd8e82c0 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4737d0d05b0ac599d5dcc403748c3bdcc40eb172 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a2fc9c887267ad5bf17b9bd957dad9688e8e1d2a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2be0c3e82ef1f85eddac61c0ffe09373f79d24ba | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68ae01f0492cec3cb369bfc79992b44aa3733db0 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e94c12c55c276cc31b0d0f8497c56ea8a3f4a264 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/907a22128e180501daa4eb7e220223a871ce477a | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7c544ebe31f0fbaea0093efeb598f2139f3f25e | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/db1a6386ec338b98c80b7cab194e68cd7d79f1f0 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/47509172be936fb271aedb33b1254da886b464a2 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c8885fb00a97b4ad65df622bf902edafae03ea06 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8460c78d8f415634ed5b3fbf5d077b62fcfe5c39 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2be64e4bedec41014de0549ea5b842310bf8e11a | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f0a92bf161eab55269ae599403ab1a98e4273e4d | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1d3af797e6177f2e2d6c0f3fde5305188dd8d5c6 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8752f2f449334b929cd77a653b888c0193bb8b91 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/da6dca1dab09efaf0816d9a017fc9789ebfd0484 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6639d024fd1b96fbdc73296185e4f0c37a3d3ce8 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c0ab1ae1c191df72a84f89f35e5fab9228cb6d0d | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e753f73c41997fcda42f3a11906f5104e07125f7 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8449dd75f1b52cdb20d2cdbf2a3601e7ba83b6d9 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fd42a80390035e215fd8793582e398a19fedd8cd | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/46f098ddcf0498d2ac06fc9599ea378ded04f5d9 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d9b61428c64ee2ffd7eaaaa97a8347a8cc7ab3b1 | ORPH
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f27839ac8156ba6a9716e0b0b7889923d975e03e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/e0915c347ced1b5f7ae7ca6be312acb710fb2fce |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/eb55f4cf4b71aced37cc8d566e1e5f87c139a5be |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/588bf93c4c016103f4c28136bea7142cb99e10e7 |     
    arm      |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/f141fd09b91b1b12c0cba301ed2cfce42c6650de |     
    sh4a     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/82e3fca5b5dd0db14d66658ff18324d01309ff85 | ORPH
  aarch64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/661bda2951ad033950cde64b8aa764176007026f | ORPH
   sh4eb     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/0a91feb194e00d22492f8b7087e7fc0af67d3794 | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/8039771924913325fcf70978fc95541d052fcad7 | ORPH
   sh4eb     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/c117afd2a2be6676b2eabc586c098adca2fe8c47 | ORPH
  sparc64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/e011a36af0c164d8060c2c99ebb3cc8bf8066321 | ORPH
powerpc64le  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a25d3a0352592c9f54ccfb2444b3abba86018dc5 | ORPH
microblazeel |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/0487fbd09c70aca82fc62cafc0a344caa083d950 | ORPH
 aarch64_be  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/d925e697e5944fc733476185a88649f173681b12 | ORPH
   sparc     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/d41e9f53e12acd865f335c1eca576b74d18f5dfb | ORPH
    i686     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a111551207d15fc77571c0a36ab080cce41be93d | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/590b993b237ca4e5b827a1c09100e9be9204edac | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/e5cad5dfc13a0cc64a83359166efe28b03fed9ea | ORPH
  riscv32    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/fa4a7dccc6c4c5a8c5749c0c85af0fa8614ca10f | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/5026505d0d9447ad4770d45ebcf34299c8dba664 | ORPH
 microblaze  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/32322e24b2cd45160753db2dbe17883be5aac0c1 | ORPH
   xtensa    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/4f19298b326a6345911fd26d85b3ccb43bc36f64 | ORPH
  sparc64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/0829b0532a0f8766b1f567636bde05adc5c98a18 | ORPH
  riscv32    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/3a3650a55b98030f73a79983b88460342380c87c | ORPH
   xtensa    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/fa84e146dd300ca90cb40d3d7b18f9618b400dbf | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/141a17a2c4a4674f0cacdb9d5a5223feab550d74 | ORPH
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ff80c0987235384059ba6415c9bf7c8eb2318cb6 |     
  riscv64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/8cdad9ad3fbbfa4dc167ac60ae0a1d44e1d57f7e |     
   armeb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/f962c78d6d7025fdcc82703ea0bc0dee6a4ae857 |     
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/899de1b3d5344a6b7a52f72dfb18add06a755dd0 |     
  aarch64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a739196baecd3d5f3b5d17bcea9af93af6755056 |     
   armeb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/e1ef523dbd3c3ad903b29cec62757f031dbb4cf0 |     
    arc      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/d2aef9cafa34bd3b54ad64cbdf0fb522b79eee91 |     
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/2c798275c6ce0b51d24dc4fe4bf2238cd0ea6022 |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/8d1e7437de13bcc41b5f6f16004fc112c60cbdcd |     
  aarch64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/0ce27b107db45b5236cced52c118aced960bdb2a |     
  riscv32    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/44fbe138fe9afbb5b630de951bd9efd6cb9e3624 |     
    sh4      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a39a377272dab4b5dcdd3802de19af710c9ce601 |     
microblazeel |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/f2ccd20c0884a107aeb37a0c7f6fe7c06d841157 |     
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d172a1a6cc42a7a25da85764fd565cbbb9df32ca | ORPH
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/60f03f16682298adfb720004fbf928b53c2ebeeb | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/40c554731455c77a0f29e32da4d8cda2e692243a | ORPH
 microblaze  |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e1e1017e2276b3d4bf58fc082b6a1a9232eea6f2 | ORPH
    arm      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/90268fba31fb6c43c3c4e6d29c52db7b9160f90a | ORPH
   sparc     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/081032d21a0afa3c1071d0625f2e323b415c43a6 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ea8b28197db22c75310aaa41b04bc7d4d77e11a8 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2456c19e2858b73296b47fe9514213a9bfedc2c9 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7a469c78e09af34e5bbfe3ed21d8c2b50aaecba4 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/bb9ebc8580164369c343e156a254b18edb5c0fdd | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/10524d81b304d8c76372ee83611f8a229e41ed1d | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/316f57bac34b39f3cd81d5c2a2671e5e6d325ee0 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/6528e12fecb7f726485630a344d16d69a76f09d5 | ORPH
   arceb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/b4c13821f0f0cd8d08daf5c202dcf454c1422ee3 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/b81e166cffe05ded9b4a9d6de221bc32f5bbfa8b | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/f785e2bdb232ceb61ab2e6509ab7ce3c47b09b9a | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/6f2dc9d6cfd8abc2f8d68ff2e926826077ed876b | ORPH
    i686     |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/b2b5444e917a39fc9af3adc56238f696fb556489 |     
  riscv64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/142a22ec15ec70cb852cd5f0ea2ac3b5a8b3fe47 |     
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/5d7467be4d2aa82e068a414ac94f6352345ac4fe | ORPH
   arceb     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/de89b075663f75c049ca7b9963fd75b117c605cb | ORPH
    mips     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/8fec9645f16d0a72abd08982e549d9b4bea49cea | ORPH
    mips     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/74436bcee2e211e3bd390e0ef3c53cb00900c0c6 | ORPH
    arm      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/1377c8e191dd6ee4ea247934f023dfbc44ab0bd9 | ORPH
 microblaze  |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/a46dd8dc001c08519a2c018012f9fc0c96f1236d | ORPH
   s390x     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/2d317f54eec85d27df9b6bfa835e2dfded141198 |     
  sparc64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/06d52b8723702f294f2b90f5c111ce671fa5366e |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/53e2754489ab9821cb629ac67ef685c9c4bd1787 |     
  riscv32    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f0b6ecde28448c2f48c4320321769b6d17836ffa |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7be73a5c0c2ec7c8d74ed44f8f74d4e546f5af94 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2314211cfea9e4a94e1a75de8bc99e706f50cc36 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/3bdac543c61ec401cffc11a4238d06228f04e6cc |     
   sh4aeb    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/323ee41b3d8280ffad521478f4a8f3422b150429 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/91c3aab918938bd26304d179ff7f7ac31bcd4768 |     
  riscv32    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/230352f688a5824b3f7e303978cee00b53b8190d |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/ad5f97ce035abdb98171140663ed7ea296314ea1 |     
 aarch64_be  |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/5f2af05210f504f9e66d9f9bb4b29d3d22c24165 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/1457ee6fdc65f59cf9d21a4827d85d1bafd5287a |     
    i686     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/45c700e6e6d4d067157c7d6f7c2149815a2155b6 |     
    arc      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/4643adae9f7cb73bc81d4e2e575050e2de7d4c78 |     
 microblaze  |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/406a43e3764dbdbf030f5bd9940c6ec580ca20b1 | ORPH
 microblaze  |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/1de4234c95c6378e9fbb72a3126c5a9e8ea08827 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/66c46ad4206033dbe163b866ae9705c4f97d7c10 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5509a89cf154afe8ec9d566208e3f4291a3cb23d | ORPH
  mips64el   |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/f9e1fc6a9a2df2226a24fd06483223b242eb1993 |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/1f5c3e3d152241791cda1353bd671e31ec76a02f | ORPH
microblazeel |         opusfile-0.12          | NOK | http://autobuild.buildroot.net/results/655b7809a7e103156f491e136f14cbdc4d314356 |     
 aarch64_be  |        pciutils-3.10.0         | NOK | http://autobuild.buildroot.net/results/8529e3b7f349cdeaefd047e6a0dd5af278532f39 |     
    mips     |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/67d075718b6e29cfe9d85430b185a4729f82861c | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/e366ec735e387690ac02dbb6146b44acd8218387 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/c386aa06eb25359a59956190797351d50010d6bb |     
   nios2     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/cb1a2268a8a04d0fa83e29ce843289ccecb7bdc4 |     
    or1k     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/02344200e30386bec5922f221d2815b3e8637e0c |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/a4e9680825f0039dfcee3694cf4e28b7544b7510 |     
   arceb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/0ce1cda6fc37c36d7b9d401e18bc4e4fd3cf1a33 |     
   armeb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/ddeb3430d127c2de1dd7a5b0d00cc805902c7cfe |     
   mipsel    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/00c1c9fa5aaa0264954c1eb7597c2d71557d7658 |     
  sparc64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/0cb9bd78ba3572f195d750ab65ea3409caf3c582 |     
  mips64el   |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/ee733677024758cbb3fd58ea3222839eee185c51 |     
   x86_64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/df8f749c90f70ee8bbf82472149fbf3010b8378d |     
   sh4eb     |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/fac26eda2c2d2e9c051a55f45c924d52de5c397f |     
  mips64el   | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/6810fdedbb4681432afd5a771783496644a40092 | ORPH
  riscv64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/271c99502b03c7762db792689a7551c2d9065c98 | ORPH
 microblaze  | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/d3b9aa821e129adcb03611fa96c9849f4cf6eb22 | ORPH
  mips64el   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/49de412e9cde5b253bbc95227e23ada3bc0c4c63 |     
    or1k     |        skalibs-2.14.1.1        | NOK | http://autobuild.buildroot.net/results/4b19383f0a21b5589c629148afad00bd5879dfd8 |     
 microblaze  |          snort-2.9.20          | NOK | http://autobuild.buildroot.net/results/f138755b983c57ff110b5bc2f9495658734dd3dc |     
    or1k     |          snort-2.9.20          | NOK | http://autobuild.buildroot.net/results/23528f3ba8fa437fb3f5e86b6a4d42f4c16f046a |     
    mips     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/5296357b3e3a127c4298102159beee137214de51 |     
    arc      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/05c780eedfd91e733d3689c44d7aba517b61f754 | ORPH
  mips64el   | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/b976749b25bbff8b257a53b55065b68d73321ef5 | ORPH
  powerpc    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/615c50b4b447de9857b0ffab05bdc0972cafed51 |     
 aarch64_be  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/fb64190852d9f7edfd175350387cc4987fc9bb83 |     
   armeb     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/135faceb111ba26a7d83be50a80c1003592fe759 | ORPH
    m68k     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/c517852cf43ee849faf170233a12db0c263fffc8 | ORPH
  sparc64    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/6a29837338e82181dc89be59a8b679cec41f8a07 | ORPH
   xtensa    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/3947d3392e12d017f5dc1c92c5be580f80b40763 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/15bc85b4ac9f3fa7eeae7c3ff8fb88854a5d51e0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/dc093421cab7a771fa23f42b2ae4ff744d607bfa |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d38dd1a4e1c2ff8fe22f82c11cd01e6a62c7551 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e4e43e6588a1f2ee0e8d238cfb88cad457829867 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/a9a286b90dc2940c3c94b56e6f911f0c92de3f1d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/296556ef80ed66dd6f1a233e52c58cd2b0a1975c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1e0e52d217fcb1902cb27b202f6a8af940f81e06 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4235790f6aec4b00e17fdff235af7a95ca438897 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c6f52123a2a8d4c0885c4edb89d360d7f7f47ea8 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/4598e42e4d6494dbd27cd08c5bf0d38e455f64cb |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef5578c20d096a4467434397e42cbe17dce1f389 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/05e36cc1183ac4396d20c337b4817f1c8a0f3f28 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8edabf95361b2a2588f7241aade249c54666fc16 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/af7fdf5e991ee2cb1d789574e522cf6dcccf4b0f |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed3fe560a5e104048f23c01dd9acb9352b2b5548 |     
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/f07bdd5f17d8823b11a2adc46f81d1db7ec81a4d | ORPH
    i686     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/4e62b5ac5b4786806f13e997eee906b564f16d3e | ORPH
    i686     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/bc88f135b97ed772512a9b31ed4ecfac6da2ca0e | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/eaae381f19b7ac51184a234212aa0d660b6a9347 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/44978f01fe2b9bde0379518c666315ec74525056 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3218cf2b734c432df5d4582ee38111dc7e6ae378 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/eb4f33c683bce2daecc412ce4ad71acf8f64a8e0 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/14ca4c1e36bfa96a917a1a3f6755b03f0a0f6ed8 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/28945b7092ab4762ca9bac005c7a19c6e4c8e9da | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/869000dab20be6ddae4021a3fadb7b9ffdbfe79e | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/74d1ef9101d4f326a86cb2e63e63606f0b14b935 | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d2a3a15744e53a96922c2bdd5a73a8b328965968 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5a7f80c8204d20520d6508e56e5412152634f01f | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/da8d90684bf09433ea5cf3c055b99423bb6fcfac | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/36a24fae07f9b2ec17ebd30dd7b12b9cfedb4736 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/aa2c0ac2c7ad740055b54cb167a3fdcc43e87e5b | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5914cb0c24111ae96fff44e9face0dc06911d26f | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c35553e61679dead99a5c99e87081a7bc61588ed | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c7874f637c234381117c5816aa3cacbb52b1040f | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/be89a63abf6c8dc6258a9204d0450e5b3ea6a068 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/bb6986a69118a15d2040bcd7bc46ce5f5d29d012 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fbc063f5cdce5d1b520efba4664862b897c7e48b | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/511338338cc069f0f90d74b14a89a129e79eb2c5 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/52052d4c352727d90b8b6e5e1986c068200d5726 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/1740057752a4c58badfad20a78f5f1840f2eab63 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/12b2c298e6c5c3106edf0ceddebacebab51ed98e | ORPH
    m68k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ddfa8bf3196d35c46c761a32fcce1a64b19c3c84 | ORPH
    m68k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/92c158f2b42118a09213ee8f201a3b6405cb1e53 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7c2300d8c9dce49903cf414e38064f6fa0992f96 | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9edd3f2fb8473d5136b84f927801d50467594de7 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a90e13f1a67f89883f6744ce0cd8d4c56b6bfb09 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3431c4529a21b760befffc59e5c354213d078203 | ORPH
 microblaze  |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/bca342a95bb77967b09222e25d6d127fcf332772 |     
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/d61dbf5f253221bf8b44a8bad57fbed3a572da13 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f2f478dd14566a0be1300be542705281b6b598c4 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/23f25db875a7575494653d5f43d4695492cace97 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/acf5d68c8e2d51c9525fcb79f73341449fabd4d4 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b3385aa5576f48bc2099375d179288f22ddfc8d0 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b3633c411a4bd960309f351914661fe463501ced |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1d802328f18704e07c3bbc52fddf0c5eaac97899 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c1a193329b4080c72edc6640c46a3fd27b95b675 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4c16b21ee2a2d35eb588a54971f15a4845b0bf54 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fe4e3b1559cb00a2f5033761860747b22397702b |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1f6d97584c5a4a9f4877afdca77f18c657413d68 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/426de1deb7f75399baff2bffb5a51f9ec971feb7 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1e3b3d2f6094cfe3b83bbd6b1e807aa588dd29e1 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/97c02a3dfd525a226d79defb2f2560396dd954ac |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a1981fe307324891c74b7b3a23cf1a1a99b7806e |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bb109703d2e826642d19250ec961b1771ebcf469 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/78a036bfaa137d51323273ba1b1ebc998ccb2b47 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e6fa15fbbf714c25f250497d9b4330395d3d7f0f |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7524b03d364c043105829f5c850d14acf38674b7 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7cd2146d930f2991ae169bf8a5df30b63e6343a2 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9935e0da4858efc18b6660a6d3d39d32b46c85ca |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a905853e887c4815b0ed9a68adf7688fc1a3797f |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eca2bd2fd6436b5005f4b2c2d4cedcfa55aa1a59 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bc8008c22d09d433d0fa93d243bd4c7853000999 |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/68fe90414f062e549bb8ca65af23ebe64a104aa6 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/318eccaa2767baf0f109c3894bd505cedb1233dc |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/445558cb1bfe554775b0323fe9582cebd6a88f27 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/246883e17037360d45c7cc913390a990ecf249ba |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9c67601b0dbed8f594aa04eeb971e3f2b7ac2a3c |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3cf6d8f7b1ea8a571c45358e83a3a03dacc1c4be |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4cfc76701990d063441846f6f5580949b9d84575 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7c298aeebfbc0ec16b9bd468fff8b3e1e0848e6d |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7286e342f9866349807c368dadb7ceec9db06d93 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/79962725a5b9113ce688c4869e675ad20e499410 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1cdd89619a87b94e9c2fe4cc868bd121b794a170 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7f4708b89a2391b99e9daa0af8332e7786e2675b |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e9025251227cb42030c363c8117f9812398bddc7 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b2868d1ab362a11dca71954aa8850602d9043288 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a59c8fed4be227b2ed26f5be9b9f400db1f8e98 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95a6b451646c729c83df80abae7c7aadf63fd97c |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/113f2655b9c1b43a963e93f49d354e62e1f5eda2 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b782d81c16fab6b1f6acc3f0b8d6b3617c4e39d8 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/41ac942c3ff4c2f66665512fc047ba826710d6f2 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6cfa342e482a1ba2f624c0fe86e2615ca359bb20 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d25ccb5d9ee8e3048677f9b8f9eb0ffe4cd97573 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a954a2ebc6a8753c4d7e7d78ddf9caa2fc113c8 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0b333c88bdf0ba41747392cc581b0014d091ebbc |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/87de8efa909f0c348ff429673003ba416a86086e |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ed01064819a84ea2fff98670b277148db7c33f1c |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ad76f97a396bf8d3e3687f24a29bcefc6e24c8ea |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7a12aac78a96cc13607fdbc4ba1b78743738e625 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9a9fdc5d296cb87bf8428f65487a76228b2d0909 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/207977a194e75a3eba166b398f68281139ce99d6 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/51d7570fb880575042b2823e5c296dbe5e82b15e |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f325655d44e2f7ecc390ed454c7ccd3d3410b0d5 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3b4c6d773611e82cb0979a766fd62190d8abfde8 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ef4680c71f36703dfe531d3b72e617587e65e606 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/17e2a812088cab9deb46d94624d7ff4872e59724 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/538a955a2f0261722234014c8dfbe3946b23b16d |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0c55fc8cdc1fba1bb9da75470805e49684ed65fd |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6d8b614913aab4d4c0d0eafd8a03d5c7ef7eb73a |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ef9bfa1a3c2d6ca57c5d6f4a82111353162878c5 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/726c1b1f5cbe9c75d6694f127f060b7541af57f6 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/271c914c5b27accf8e43a3f6eab1577e4c5112a5 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d81b95add17544a7dfc2d042235d31cfbce30583 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/576e1306ce46bc67a954b0b6ad31700ee1888e42 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 2 
                libressl-3.8.4 | 2 
               asterisk-20.5.2 | 1 
          libcamera-apps-1.2.1 | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                 rrdtool-1.8.0 | 1 
                       unknown | 1 
               xwayland-23.2.4 | 1 
                     z3-4.12.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/7bed12e3a7511a701d1c3b7f4f1f49b386595272 |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/2ca1522cb2d09d984385a63ffdca77144d5743f6 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/826fd1ba99b1f6d2e471b96d442626df3deca16c |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/abd9267718909e3fc77dbe84370876e28a42313d |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/67d3376a49491b3d39491342b0f0a33f0d54bd5a | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/54c23655dd8ef1e7945655dd6f2b109b97c4bf9a | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a01e12a20fa1e127b24a5231661f0ee475a82959 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/eb65621e547d39585979fb56fd76af85b347a4a4 |     
    arm      |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/42a63506173236d5ab23ac33f14a5893e796f19e |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/f7243759e1f06481daf991b00bc0f9a4a5fdc9ca |     
   mipsel    |        xwayland-23.2.4         | NOK | http://autobuild.buildroot.net/results/ecdc77c05236f1810ca351515276fd872300dce3 |     
    arc      |           z3-4.12.5            | NOK | http://autobuild.buildroot.net/results/7c4a84631889d446e98ed26fc93dfd0cdfa41b91 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                libressl-3.8.4 | 3 
                       unknown | 2 
aubio-152d6819b360c2e7b379e... | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                   bird-2.0.12 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
ivi-homescreen-5ab78a19e95c... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
          libcamera-apps-1.2.1 | 1 
                  linux-6.8.12 | 1 
           mediastreamer-4.4.8 | 1 
                 openssh-9.7p1 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/602b70b42859f4062a014fd93c99b8e27e94643b |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/be32886ad277db6732dc4e9d388cb3fd220aad20 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/3684460683dd755f68968de2278d16fc209fe8ee |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/77725e613ec334a0a9e29075940a9342c5a8e949 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/be14a94c751dd9fdcca9d015e1fe19487c34e043 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e9e2f5c93c788d5d2e9d97c20ceab25df1bd1402 | ORPH
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/6bccae1cdde1303be73853fcb17d18cf71cda0b6 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/992742b30f716d8d11d1fdf8cf7c9bc19d7d48f6 |     
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/1b2aed1884951767db3ed094429f8bfde5563bd1 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/d343a93ed0249072de813ff1c60a11b11b464763 | ORPH
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d1f94d82a0a740905d0da7301675d5c6a3266344 |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/329cd7058f1e3b9a031bd9a51a13d40e9635c6aa | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/17ff3ce7b288f527f6984677a6c5c010f8235e02 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ddbab0a22e914a49651bcdde721a51e312669e57 | ORPH
    arc      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/2b19b97940850de6d0f6e58b9b49a4e4bf5d9f6d | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/ffed114b16603d3d05cb512df3f95584c17384fb | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/9f04b4334da662662a09c01079de465b461a7fc5 | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/7e27083b7a796342915f8d6722e60f46ac604651 |     
   x86_64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/24c5719e7aba7ce090675fe63529718a51e9ea94 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0151390c614def3273a0f74f0c984adf969e2e2a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/50bde4a36395fc7b457f8211258675b0de9f8cf0 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/942e5c4290ceda6f402a76d42be8bb9018752f6a |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.0        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 46.2         |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4g         | 2.4h         | ORPH
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.2       | ORPH
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.7.1      | 1.2.12       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 14.0.0_r51   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 12.0         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/00095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 14.0.0       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.3.1        | 5.4.1        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 20.7.0       | 21.3.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.50.0       | 2.52.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.9.0        | 2.10.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.1.2        | 4.0.1        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 105.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 7.2          | 7.3          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_08_2023  | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.11         | 2.14.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2023.1       | 2024.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2023.1       | 2024.2       |     
                           bcc |  DISTRO  | https://release-monitoring.org/project/12803 | 0.29.1       | 0.30.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.3.60       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.3.60       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.3.60       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.10      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.15.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 26.0         | 27.1         |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 4.1.1        | 4.2.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.20.2       | 8.0.3        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.83.0       | 1.85.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 3.3.0        | 3.4.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.21.1       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.9.1        | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.27.0       | 1.31.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20230311     | 20240203     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.17.4       | 1.18.0       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.10.4       | 1.0.2        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 4.9.1        | 4.10         | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.2        | 1.6.0        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.4.3        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.6          | 20200710     |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.6        | 1.3.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 18.1.8       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.28.3       | 3.29.6       |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/11779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.3.0        | 1.5.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 18.1.8       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/09710 | 2.5.8        | 2.7.7        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/96793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.7        | 1.4.8        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.3          | 9.5          | ORPH
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.5        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.12         | 1.15         |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.7.1        | 2.7.3        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.7        | 2.4.10       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.17      | 2.0.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 4.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 2006-10-MR2  |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.3.0        | 3.4.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.3.0        | 3.4.0        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.15       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/00391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.19         | ORPH
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/00421 | 0.26         | 0.27         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20230209 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/00438 | 3.0.5        | 3.1.1        | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.27.1       | 2.28.1       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/07454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 059          | 102          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/21419 | 2023.08.0    | 2023.11.0    |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.0.0        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.47.0       | 1.47.1       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.7        | 3.2.0        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.20         | 1.20.2       | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202405       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.3       | 1.27.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 23.04        | 24.02        |     
                       elf2flt |  DISTRO  | https://release-monitoring.org/project/115314 | 2024.02      | 2024.05      | ORPH
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.189        | 0.191        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.65         | 0.66         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.8.1        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/00696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 26.0.2       | 27.0         |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.1.1        | 1.1.2        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.5       | 1.11.10      |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.15       | 1.0.16       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.11       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.49       | 1.0.52       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.2.7        | 1.2.12       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.16       | 1.1.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.49       | 1.1.51       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.6.2        | 1.8.1        |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.5          | 1.7.1        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 6.7          | 6.9          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.5.1      | 2.9.6.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.2.2        | 1.2.4        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.2       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.8       | 0.18.19      |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 1.0.2        | 1.1.0        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.34         | 1.35.1       | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 6.1.1        | 7.0.1        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/00812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/09989 | 2.0.2        | 2.1.2        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.25.2       | 0.25.4       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 23.5.26      | 24.3.25      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.0.4        | 3.0.7        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                       fmtools |  DISTRO  | https://release-monitoring.org/project/21435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.5.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.17.2       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 5.1          | 5.2          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.3        | 3.2.4        |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.11.6       | 3.5.1        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.5.4        | 10.0.1       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.2       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.8.2        | 3.9.0        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.8.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.12.1       | 2.1.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.22.4       | 0.22.5       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 10.02.1      | 10.03.1      |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 17.1.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.7.0        | 0.7.1        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 6.0.0        | 6.0.1        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.10.7.0     | 3.10.10.0    |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.8.3        | 3.8.5        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.76.1       | 1.80.1       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.2.0        | 7.5.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.40       | 1.3.43       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.64.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 45.0         | 46.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.7.1        | 2.8          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.22.9       | 1.24.5       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.22.9       | 1.24.5       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.22.9       | 1.24.5       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.22.9       | 1.24.5       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.22.9       | 1.24.5       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.22.9       | 1.24.5       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.22.9       | 1.24.5       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.5       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.12.1       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.9        | 3.0.10       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.54.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.15       | 3.0.0        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 8.4.0        | 8.5.0        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.5         |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.17         | 0.18         |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.1.0        | 1.2.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.24.4       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.379        | 0.383        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.9.3        | 2.11.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.50.2       | 2.52.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.41       | 0.8.43       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.1-31     | 7.1.1-34     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.12.2       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 22.3.19      | 22.3.20      |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 24.2.2       | 24.2.5       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20231114     | 20240531     |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.16         | 3.17.1       | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.22         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.19         | 6.9          | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 2.17         | 2.18         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.33.0       | 1.35.2       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.2        | 1.2.3        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/01431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.81         | 0.82         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.4.1        | 3.5.0        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.5        | 3.0.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.3       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.3       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.5       | 1.20.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.5.1        | 2.6.4        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.2.8        | 2.3.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.1.1        |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.1.1        |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.1.1        |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.1.1        |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 31           | 32           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 21.4.7-Omega | 21.4.10-O... |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 21.1.15-O... | 21.1.18-O... |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 21.2.3-Omega | 21.2.4-Omega |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 21.0.1-Omega | 21.1.0-Omega |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 21.1.2-Omega | 21.2.0       |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 21.6.1-Omega | 21.8.2-Omega |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 21.0.1-Omega | 21.0.2-Omega |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/21462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.1        | 3.5.2        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.12.0       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 643          | 661          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240116.2   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.17.1       | 0.17.2       |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/01559 | 2.5.7        | 3.0.1        | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.3        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.7       | 0.12.2       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.7          | 2.10         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.2.1        | 1.5.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 2.0.3        | 3.1.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
               libdisplay-info |  DISTRO  | https://release-monitoring.org/project/326668 | 0.1.1        | 0.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.4       | 1.18.0       | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20230828-3.1 | 20240517-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.13.1       | 1.13.2       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/12043 | 0.99.9.1     | 1.2304.0     |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.4.0        | 3.6.0        |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.14       | 1.0.15       |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.12.1       | 3.12.2       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.80.3       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.49         | 1.50         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/20640 | 1.6.4        | 2.1.2        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/20640 | 2.1          | 2.1.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.1        | ORPH
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 237          | 238          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.25.0       | 1.26.0       |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.1       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.2        | 2.0.5        |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.6.6        | 1.6.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.31         | 0.32         | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.9.1        | 1.10.0       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.2.7        | 2.2.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 3.0.17       |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 6.1.3        |     
                       libnvme |  DISTRO  | https://release-monitoring.org/project/242763 | 1.8          | 1.9          |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.4.0        | 2.4.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.8       | 2024.6       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 2.0.2        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.4.0        | 2.6.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.9.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.6.0        | 1.6.1        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.8.4        | 3.9.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.9       | 2.58.91      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.5       | 0.21.4       | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/01728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/07908 | 0.7.25       | 0.7.29       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.1        | 2.3.3        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.3        | 2.0.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.2.0        | 3.3.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.5.0        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.2        | 0.9.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.18      | 1.14.19      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.26.6       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.5          | 2.6          |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.24.1       | 1.26.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.15.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 10.4.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.11.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.12.6       | 2.13.1       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3176        | 1.59.03      |     
                       libxslt |  DISTRO  | https://release-monitoring.org/project/13301 | 1.1.39       | 1.1.41       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.148      | 2.2.8        |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.24      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.2.4        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240410     | 20240610     |     
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/21114 | 4.2          | 4.3          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2024.05.30   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.8       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.8       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/06974 | 0.9.31       | 0.9.33       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/01835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/11649 | 0.9.5-1      | 0.9.6        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2.7        | 1.3.2        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.10      | 2.13.13      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.13      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.7        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/11668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.23      | 2.03.24      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.3        | 6.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.2        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2406         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.11.6      | 11.5.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.26       | 1.5.27       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/01953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.8       | 3.6.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20220418     | 20240107     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 194          | 200          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.3      | 0.1.6.4      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.3.60       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.22       | 1.6.28       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.9       | 24.1.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.9       | 24.1.2       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 1.3.1        | 1.4.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.52.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2023.09      | 2024.02.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.22.0       | 1.23.0       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.8.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.7        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2023.12      | 2024.05      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.14.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.12       |     
                       mokutil |  DISTRO  | https://release-monitoring.org/project/246006 | 0.7.1        | 0.7.2        |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 7.3.3        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.32.3       | 1.32.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.25       | 1.8.26       |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.43       | 4.0.44       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.8        | 0.9.9        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.22.0       | 1.24.4       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3.1        | 4.0.3        |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.2          | 1.2.1        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.16.02      | 2.16.03      | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.20         | 2.4          |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/02063 | 3.1.18       | 3.2.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.46.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.19       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.10         | 3.11         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.9.1        | 3.10         | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.46.0       | 1.48.2       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.11.0       | 1.12.0       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.23      | 0.52.24      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.58.0       | 1.62.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.24.0       | 1.27.0       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 26.1         | 27           | ORPH
                   nilfs-utils |  DISTRO  | https://release-monitoring.org/project/02091 | 2.2.9        | 2.2.11       |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.12.1       |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16p          | 16q          | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.3.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.3.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/31106 | 0.85.0       | 0.95.0       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 555.58       | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 555.52.04    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.9.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 2.2          | 2.8          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.2.6       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.3.1        | 4.3.2        | ORPH
              onevpl-intel-gpu |  DISTRO  | https://release-monitoring.org/project/368736 | 24.2.1       | 24.2.5       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/10861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.11      | 1.4.1        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.5.2        | 1.5.3        |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.10.0       |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.9.0        | 4.10.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.34       | 2.0.35       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 24+3         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 9.1.0        | 9.2.4        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.1.5        | 5.0.3        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.52.1       | 0.54         |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.4.0       |     
                       openvpn |  DISTRO  | https://release-monitoring.org/project/02567 | 2.6.10       | 2.6.11       | ORPH
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.6.2        | 0.6.3        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.6.2        | 0.6.3        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/11081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.34       | 0.4.38       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.3.60       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.3.2        | 1.4.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.25         | 1.27         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.52.2       | 1.54.0       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.50.1       | 2.52.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.10.0       | 3.13.0       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.43        | 10.44        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 2.1.0        | 2.2.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.38.2       | 5.41.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/02743 | 0.02         | 0.21         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/02747 | 0.15         | 0.17         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 5.006        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/02835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/11847 | 0.008        | 0.009        |     
         perl-extutils-helpers |  DISTRO  | https://release-monitoring.org/project/11848 | 0.026        | 0.027        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/11849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.83         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.81         | 3.82         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/02971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.10         | 6.11         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.45         | 6.46         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.87        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.080        | 2.085        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.67         | 6.77         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.12         | 6.14         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20230630   | 1.20240619   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.515        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/11870 | 0.047        | 0.048        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.35         | 9.37         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20231213     | 20240313     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.42         | 1.45         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.144        | 0.146        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.21         | 5.28         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0210       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.22       | 5.1.23       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.3.1        | 3.3.2        |     
                        physfs |  DISTRO  | https://release-monitoring.org/project/03631 | 3.0.2        | 3.2.0        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.81       | 1.2.0        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/03648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 2.2.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.1          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 123          | 124          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.12.0      | 24.06.1      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 16.3         | 17           |     
                         pound |  DISTRO  | https://release-monitoring.org/project/05436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.11       | 1.3.12       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.4        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 9.3.0        | 9.4.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.1         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.8.5        | 1.8.10       | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.7        | 0.4.10       |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.7.0        | 0.7.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/21245 | 3.1.1        | 3.2.0        |     
               python-aiofiles |  DISTRO  | https://release-monitoring.org/project/12743 | 23.2.1       | 24.1.0       |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.9.3        | 3.9.5        |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/21247 | 1.5.1        | 1.6          |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/21251 | 2.1.0        | 2.2.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/21254 | 1.3.0        | 1.4.0        |     
              python-aiosqlite |  DISTRO  | https://release-monitoring.org/project/54836 | 0.19.0       | 0.20.0       |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.10.0       | 0.11.0       |     
        python-annotated-types |  DISTRO  | https://release-monitoring.org/project/257625 | 0.6.0        | 0.7.0        |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/49275 | 4.2.0        | 4.4.0        |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/37849 | 6.3.1        | 6.6.1        |     
                   python-argh |  DISTRO  | https://release-monitoring.org/project/09299 | 0.31.0       | 0.31.2       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.7.2        | 3.8.1        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.14.0       | 2.15.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 4.0.1        | 4.1.3        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.12.2       | 4.12.3       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.22.1       | 0.23.1       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 4.1.4        | 4.2.3        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.21.1       | 0.22.2       |     
                python-blinker |  DISTRO  | https://release-monitoring.org/project/20042 | 1.7.0        | 1.8.2        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.8.0        | 0.9.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.34.14      | 1.34.133     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.34.14      | 1.34.131     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/07022 | 5.3.2        | 5.3.3        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 4.3.1        | 4.4.2        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 2.2.0        | 2.3.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.5.1        | 5.6.4        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/14813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2023.11.17   | 2024.6.2     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 18.8.0       | 18.10.0      |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/31282 | 3.0.0        | 3.1.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 42.0.8       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.9.0        | 2.11.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.36      | 3.0.10       |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 4.0.0        | 4.1.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/05621 | 2.8.2        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.0       | 2.21.3       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 5.0.3        | 5.0.6        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.4.2        | 2.6.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.20.1       | 0.21.2       |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2023.11      | 2024.5       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.18.0       | 0.19.0       |     
        python-email-validator |  DISTRO  | https://release-monitoring.org/project/98134 | 2.1.1        | 2.2.0        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/62869 | 1.6.1        | 1.7.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/47977 | 0.110.0      | 0.111.0      |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.13.1       | 3.15.4       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.5.0        | 0.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 3.0.0        | 3.0.3        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 4.0.0        | 4.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 2.2.2        | 3.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/25028 | 0.42.3       | 0.44.0       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.47.0       | 4.53.0       |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/26845 | 0.18.3       | 1.0.0        |     
                   python-gast |  DISTRO  | https://release-monitoring.org/project/65692 | 0.5.4        | 0.5.5        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.40       | 3.1.43       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 14.2.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.2       | 3.48.2       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/25386 | 2.15.0       | 2.19.1       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/38039 | 2.26.1       | 2.30.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/63943 | 1.62.0       | 1.63.2       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/19948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.18       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/18429 | 1.60.0       | 1.64.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/30542 | 1.60.0       | 1.64.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 21.2.0       | 22.0.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.22.4       | 1.25.0       |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/79947 | 1.0.2        | 1.0.5        |     
                  python-httpx |  DISTRO  | https://release-monitoring.org/project/27210 | 0.26.0       | 0.27.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 4.4.0        | 4.9.0        |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/11771 | 2.4.1        | 2.4.1-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 3.6          | 3.7          |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.3.1        | 5.3.2        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 8.20.0       | 8.25.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.1.2        | 2.2.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 3.3.0        | 3.4.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 4.0.0        | 4.0.1        |     
                     python-jc |  DISTRO  | https://release-monitoring.org/project/28963 | 1.25.2       | 1.25.3       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.1.2        | 3.1.4        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.20.0       | 4.22.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 24.2.0       | 25.2.1       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.1.9        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.40.1       | 0.41.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/17278 | 0.13.0       | 0.14.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.5.1        | 3.6          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.12       | 2.4.13       |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.1.3        | 2.1.5        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.20.1       | 3.21.3       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/50566 | 0.30.0       | 1.0.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.8.2        | 3.9.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 1.4.0        | 1.6.0        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 10.2.0       | 10.3.0       |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.7        | 1.0.8        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 6.0.4        | 6.0.5        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/18463 | 0.0.6        | 0.0.9        |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.10.1       | 1.3.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.25.0       | 2.0.0b1      |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.9.10       | 3.10.5       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 24.0         | 24.1         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.6.1        | 2.1.0        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.8.3        | 0.8.4        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 23.3.2       | 24.1b2       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.4.0        | 1.5.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.43       | 3.0.47       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.1         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.7        | 6.0.0        |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/03767 | 1.2.7        | 1.2.12       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.3.0        | 0.4.0        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.11.1       | 2.12.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.25.1       | 1.26.1       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.21         | 2.22         |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.2        | 0.7.5        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/07975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20231114.3   | 20240601.3   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 2.5.3        | 2.7.4        |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | v2.19.0      | 2.20.0       |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.8.0        | 0.10.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.30         | 0.31         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.9        | 1.5.10       |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.17.2       | 2.18.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 2.12         | 2.13.1       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.21.0       | 0.22.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.22.0       | 1.24.5       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 1.1.0        | 1.1.1        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 23.3.0       | 24.1.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.0.3        | 1.2.1        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.1.1        | 3.1.2        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.12.0       | 3.13.0       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/19681 | 0.14.0       | 0.15.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.1.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.7.1        | 0.8.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.10      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.7.10       | 0.7.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.10.2       | 0.11.0       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 8.1.1        | 8.2.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.23.6       | 0.23.7       |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/21140 | 0.15.0       | 0.16.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.1       | 0.24.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 25.1.2       | 26.0.3       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 5.0.1        | 5.0.6        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/81160 | 1.7.0        | 2.0.13       |     
            python-referencing |  DISTRO  | https://release-monitoring.org/project/304263 | 0.32.1       | 0.35.1       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2023.12.25   | 2024.5.15    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.31.0       | 2.32.3       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.1        | 2.0.0        |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/62048 | 0.10.0       | 0.11.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.76       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/66067 | 0.17.21      | 0.18.6       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.10.0       | 0.10.1       |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 1.2.1        | 1.2.2        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.11.4       | 1.13.1       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/59641 | 1.6.0        | 1.6.1        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/05645 | 4.16.0       | 4.22.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.39.2       | 2.6.0        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 23.1.0       | 24.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 69.2.0       | 70.1.1       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.8.1        | 1.9.0        |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 8.0.4        | 8.1.0        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 2.0.6        | 2.0.7        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.8.5        |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/47981 | 1.12.0       | 1.13.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.6.1        | 0.7.2        |     
                python-sniffio |  DISTRO  | https://release-monitoring.org/project/18170 | 1.3.0        | 1.3.1        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.11.0       | 5.11.3       |     
                 python-sockjs |  DISTRO  | https://release-monitoring.org/project/56562 | 0.11.0       | 0.13.0       |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 2.0.30       | 2.0.31       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.4        | 0.5.0        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/36570 | 0.36.3       | 0.37.2       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/04923 | 1.12         | 1.12.1       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/97274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.5.0        | 5.6.0        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.4.1        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.64.1       | 4.66.4       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.14.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 22.2.0       | 23.11.0      |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/17451 | 0.22.0       | 0.25.1       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.11.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/88298 | 2024.3.3     | 2024.5.22    |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.10.0      | 24.3.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 22.0.0       | 23.11.0      |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 4.3.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.3.0        | 1.3.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.8.19.14    | 2.9.0.202... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.9.0        | 4.12.2       |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 2.0.7        | 2.2.2        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.6.10       | 2.6.14       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/84198 | 0.13         | 0.14         |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/28526 | 0.29.0       | 0.30.1       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.22.0       | 0.28.3       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 4.0.1        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 59.0         | 62.3         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.26.1       | 2.27.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/24711 | 8.2.0        | 8.4.0        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 1.4.2        | 1.8.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.4         | 12.0         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.3.8        | 3.0.3        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/11428 | 0.40.0       | 0.43.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.14.1       | 1.16.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 3.0.1        | 3.1.2        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.2.0        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.9.2        | 1.9.4        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/04100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.132.2      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.5.2        | 6.4.post2    |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/50016 | 0.2.2        | 0.2.3        |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 9.0.0        | 9.0.1        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.9.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.11      | 6.7.2        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.2        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.2        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.2        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.2        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.2        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/13768 | 0.13.0       | 0.14.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221215-... | ORPH
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2024-04-01   | 2024-06-01   |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20231002   | 2.20240226   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 9.2.1        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.15         | 4.0          | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2402.0     | 8.2404.0     |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 8.1.0        | 8.1.2        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.3.1        | 3.3.3        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.1.12       | 1.1.13       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/17910 | 0.65.1       | 0.69.4       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.42.5       | 0.42.6       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.32.0       | 2.33.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.12.0.4     | 2.13.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.7.1      | 2.3.7.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.7.0.2      | 2.7.0.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.4.2      | 0.5.4.3      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.19.6       | 4.20.2       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.3.1        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.30.3       | 2.30.4       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.20.0       | 1.49.1       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.32.1       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.6        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.4        | 4.5.1        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/04802 | 4.14.5       | 4.16.0       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.3.3        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                   simple-mail |  DISTRO  | https://release-monitoring.org/project/53352 | 2.3.0        | 3.0.0        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.11         | 4.12         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.14.1.1     | 2.14.2.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/96795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.3          | 7.4          | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.10       | 1.2.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.7.0        | 1.8.1        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.5.1        | 3.5.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.2.2.0      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.5        | 4.6.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.45.1       | 3.46.0       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 6.9          | 6.10         | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 2.0.1        | 2.1.2        | ORPH
              starfive-spltool |  DISTRO  | https://release-monitoring.org/project/372234 | JH7110_VF... | JH7110-RT... |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.22.6       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 23.3         | 24.2         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 6.8          | 6.9          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.17.07      | 0.18.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.19       | 7.0.5        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.8.1        | 1.9          |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/20562 | 1.2.0        | 1.2.1        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.1.1        | 4.2.1        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.9.0        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2024.05      | 2024.05.2    |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.38.0       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 46.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.150      | 2.2.170      |     
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 254.13       | 256          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 235          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.11.0    | 2021.12.0    |     
                       tbtools |  DISTRO  | https://release-monitoring.org/project/372327 | 0.4.0        | 0.4.1        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.13       | 8.6.14       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.3.4        | 5.4.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.6        | 2.5.7        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.15.0       | 2.15.2       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 2.7          | 3.4          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.13       | 8.6.14       |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.3a         | 3.4          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.3        | 2.1.5        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 4.0.5        | 4.0.6        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2024.04      | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.6.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.19.1       | 1.20.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.5          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.12       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 4.2.1        | 4.2.4        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/11151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 3.2.0_lib... | 3.4.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.7       | 0.13.2       |     
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.22.0       | 3.23.0       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.5        | 2.6.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/05080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.1.0145     | 9.1.0516     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.11         | 2.12         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.0.0        | 3.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.76.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.4.21       | 3.4.30       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.3.0        | 4.4.0        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.262      | 1.3.288      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.288      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.288      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.8.0        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.22.0       | 1.23.0       |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.42.5       | 2.45.3       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.3.2        | 1.4.0        |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 13.0.1       | 13.0.3       |     
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 9.11         |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2023.09.01   | 2024.05.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.5.5        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.12       | 4.2.5        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.16.2       | 0.17.4       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.2.0        |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.5          | 3.6          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.24       | 1.4.25       |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20240102     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.2        | 1.2.3        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/15034 | 1.0.4        | 1.0.5        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/15030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/21262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/15026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/15025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/15023 | 1.1.0        | 1.1.1        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.6        | 1.4.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/15016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.4        | 1.2.0        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/14962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/14961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/21718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/18845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/14959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/14958 | 1.2.6        | 1.2.7        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/14955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.15.2       | 1.17.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/21711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/05235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/05236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.6       | 4.18.2       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.4        | 3.2.5        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/15051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/17200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/15055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 6.4.0        | 6.8.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.42         | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.8.7        | 1.8.9        | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/01766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/01772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/01774 | 1.3.5        | 1.3.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/01785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/01788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/01613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/01781 | 1.1.2        | 1.1.3        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2023.2       | 2024.1       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.4.pl02   | 1.5.6.pl02   |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.09         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 389          | 392          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/13528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/15037 | 1.20.0       | 1.20.1       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.0       |     
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 14.0         |     
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.05         | 2.09         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 7.0.0        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.4.0        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 6.2.1        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.1.6        | 2.2.0        | ORPH
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.1.0        | 2.2.1        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/13802 | 0.13.74      | 0.13.76      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                           php | CVE-2024-4577    | https://security-tracker.debian.org/tracker/CVE-2024-4577   
                           php | CVE-2024-5458    | https://security-tracker.debian.org/tracker/CVE-2024-5458   
                           php | CVE-2024-5585    | https://security-tracker.debian.org/tracker/CVE-2024-5585   
                           php | CVE-2024-2408    | https://security-tracker.debian.org/tracker/CVE-2024-2408   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                           php | CVE-2024-4577    | https://security-tracker.debian.org/tracker/CVE-2024-4577   
                           php | CVE-2024-5458    | https://security-tracker.debian.org/tracker/CVE-2024-5458   
                           php | CVE-2024-5585    | https://security-tracker.debian.org/tracker/CVE-2024-5585   
                           php | CVE-2024-2408    | https://security-tracker.debian.org/tracker/CVE-2024-2408   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
