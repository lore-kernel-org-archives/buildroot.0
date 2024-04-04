Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD63CD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 03:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6670441944;
	Thu,  4 Apr 2024 03:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L308Q8AktBQW; Thu,  4 Apr 2024 03:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A7C41971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48A7C41971;
	Thu,  4 Apr 2024 03:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA161BF239
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 03:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 823568124B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 03:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfZWUrhH25uU for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 03:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C0C480EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0C480EEC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0C480EEC
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 03:59:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8F571BF20B
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 03:58:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 04 Apr 2024 03:58:59 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712203140; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hJ1oPGLeOmm8Slk0cXezEk9607mIBGY3+V24MIEwLcI=;
 b=c4c49k0GA09iD9FzP60aCBWGuHicC2lXI2TNKU4/tuPFO6rvzcFS/8Hjec60b+5ZdrPIQi
 A/vh4a+ZcECHLG+TJJv7gMNIaMj12fzNTRG6D8BY7M4B+O6H1aEl66reUe3agfA56+oaWA
 uHptmhSRtu6NRLVAK9wia9FfhLrjgmm3yoQe7Aqh8/oVHVBsp2yXpkoy90GwWPLv46Re/E
 g4pk5OTt030oBRPn2QcVubC7skpf0tm7Uzn7lOztAfldzRtMif3aFoy3XQ+Uph2DvAjRhU
 u5/hHjKKfGE6AoSicSXhJtNDjyJcy6jLbcU1Noy0BZZgi3FHJf0v2seezu1WLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c4c49k0G
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-03
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
Message-ID: <20240404035859.yDGsvTtC7UX1LEy4FWNvTnf_ksnydYkII8k2QKqte9s@z>

Hello,

Autobuild statistics for 2024-04-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  | 11  |  0  | 16  |
    master   | 57  | 117 |  1  | 175 |

Classification of failures by reason for master
-----------------------------------------------

              host-scons-4.5.2 | 13
             util-linux-2.39.3 | 10
                    apg-2.3.0b | 9 
               linux-pam-1.6.0 | 8 
glibc-2.39-5-ge0910f1d3278f... | 5 
                   dante-1.4.3 | 4 
               apcupsd-3.14.14 | 3 
                fail2ban-1.0.2 | 3 
  gobject-introspection-1.76.1 | 3 
android-tools-4.2.2+git2013... | 2 
check-11970a7e112dfe243a2e6... | 2 
                   foot-1.16.2 | 2 
            gdk-pixbuf-2.42.10 | 2 
leafnode2-ce7d3b13fb285c9fb... | 2 
          libcamera-apps-1.2.1 | 2 
                 libcli-1.10.7 | 2 
                   linux-6.8.1 | 2 
                   oatpp-1.3.0 | 2 
                    pppd-2.5.0 | 2 
                 sysvinit-3.04 | 2 
                       unknown | 2 
                 apache-2.4.58 | 1 
                  clamav-1.0.5 | 1 
                 coreutils-9.3 | 1 
           crucible-legal-info | 1 
                     crun-1.12 | 1 
                dovecot-2.3.21 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-4.4.4 | 1 
                flutter-engine | 1 
       freeradius-client-1.1.7 | 1 
       freeradius-server-3.2.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                gnu-efi-3.0.18 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
              host-rust-1.74.1 | 1 
             kismet-2023-07-R1 | 1 
              libarchive-3.7.2 | 1 
                  libffi-3.4.6 | 1 
                   libnss-3.99 | 1 
              libopenssl-3.2.1 | 1 
                libsoup3-3.4.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              liquid-dsp-1.6.0 | 1 
                 minisign-0.11 | 1 
                  nginx-1.24.0 | 1 
                  ntp-4.2.8p17 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    proj-9.3.0 | 1 
              pure-ftpd-1.0.51 | 1 
           python-numpy-1.25.0 | 1 
             strongswan-5.9.13 | 1 
                   trinity-1.9 | 1 
           uboot-tools-2021.07 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/037b8ff8f404d19e483f307dbb6f92103b754419 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c8c22ea6c69f5f949746f3618e9d31d9f82fd836 |     
    arc      |         apache-2.4.58          | NOK | http://autobuild.buildroot.net/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e |     
 powerpc64   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b03bc4f57cb4db1bac799d23e6dd2b435b6fb687 |     
  riscv64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2e4b1e1d524c9dfc26145fc1c7efb3b867f72ddf |     
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cce717162effb114b9285bb25eebf0b162e9aaab |     
   armeb     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/32dc57abaee2b0af989ca699cceb1bc92fead38e |     
   s390x     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/815ac0b13ffcb7452d1d1c52ac80b6d4e8a7d41d |     
powerpc64le  |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/5b1c3fcf11a447b2fd2f21096b64ebc0d20248d1 |     
microblazeel |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/f536daaed3590af6036eb48aef86279df79c062b |     
  sparc64    |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/047582a179105c067078828910f5fd1c5e7d2ec2 |     
  mips64el   |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/9863cfc53e7ffb0b671ca4d092d55d3bcaca77f8 |     
    or1k     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/3ae35d874b6c2965ae8f894045e162fc7096d872 |     
    sh4      |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/daa5196b8ae681cec080792aaddaa23b9b9a14b9 |     
    sh4      |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/fc1a298b229569ff60eae92afd5eb83f71a65c91 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/81dc5f088abf49328caa4052ac55d2e86c93bfad | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/151a826301bc6a1efc0ceb30723835dac7950f08 | ORPH
    i586     |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/fc9f1b6a373fa285152730b79eb190b1b4c0a451 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b0c1afe40f5d152e08b128359289225d06eae927 | ORPH
  aarch64    |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/14dfa0a47be54929c527c12fe9b95f34c1d8c7f5 |     
  mips64el   |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/7f7956c6d85f6fdce380ff45f50c04eca30778a9 |     
  powerpc    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/9cdd9191643c67b1b259b5aebb5c92887294601f | ORPH
   x86_64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/656659aba445cb6b0fb4097b1a57b22599191578 | ORPH
    mips     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/bb36bc30c833c63c850a219e51286ae3be458e64 | ORPH
    i686     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/75df29d5e405dbeb5d678edbd67dc45802d4389a | ORPH
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3dc43d834152281f9cd4a628814579d7b26f6295 |     
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1b7d91346bc159b24e1a9ccfd12cd7a4988b084d | ORPH
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4709367a39a8ceb41b58454fc9638441a40624e0 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8fae0aef8e958fe0e8b7c51329138aef7a7cb2d4 |     
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/583805eb1751bcbb20f3a26fa4545c3b142b1a03 |     
  sparc64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/b50673ce97168c73bd47783f08ed14de7ba6dbb7 |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/7d792f1363f2662d79941e8aa85a43ebbe6d8bd8 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/bf87442ae8da2f552419152340bc6fe8427dc646 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a15e2f3d765feb28bb81e891b141f3bffd1f88e7 |     
   mipsel    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/c23984fd2995ed99f8f93850beb65ad44c034df4 |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/45c42d07224c0fb6cb8cc2c91782e61992d0e664 |     
    arm      | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/4f29f997ad1fd6f52a621a4046d1eed7fee03edc |     
    i586     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/3f76f3e95c55461efac15b024ceff66ee799235b | ORPH
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/c74bb61edefcb8be0edab0eac47c2ad749484328 | ORPH
  riscv64    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6abd5eea1e8388425b1f2b969ef2e7f32435a651 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/bcf9351f2cd9b8cc3acf5a2bf73fca710c598389 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5348c4d3df38925938c7dddaa6c280ada0a3a592 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/7da65899a2fad309fee733b1129cd3945db26afa |     
    sh4      | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/a3fbecce0093e5db6bac0c5e19cecec5f4a5e3f8 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/57c619e6777aab7649dd514d2a7a23f27a728945 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0add0ea0a68ba92c387061545fb17e5489c66cd0 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ac2980147ac4ab8387a895c6d5a0c48256ad5350 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/21eef56cda1d417b45111bb592afb5be3d00dd8f | ORPH
    or1k     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/00c33db37e3511c0650ee3229b108b88a5ed6c06 |     
  riscv64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/a812e4c714d3123f2251ec8f8471d97036eb6a67 |     
    arm      |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/08f6288a5859a93f078761da68b20979630a20a5 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/ca46b31dfcfa936309175426ab4c36857b46f71c |     
    arm      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/d22a672f448b7a69b55b1d4c1ed34946132af06c |     
    arm      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/721b90f2681e6739aba6468b886b1a266b4553ff |     
    i686     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/051fb039f2aac6c6caf07203e18c61537cb6be78 |     
    i686     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/2248e20a6f89dda2ea3b8331e64d52ed28b6b7b1 |     
   xtensa    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/dbe866a9a649d9b550d5ca8dcbcf723b9cb103e8 |     
    arc      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/08af493a9a328aa27cef653899c96efc5118bd01 |     
powerpc64le  |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/d7d8a9ee1b506172d2ace87a42315585d9624854 |     
    m68k     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/819fa686b29f1fc7e7c04da073bc8bec989ca4d4 |     
    arc      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/db6b4106e2e0235674454e5a2b07caf15db948e2 |     
    i686     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/f3ce7390637b109c0bd2301eac9214591cdbca2b |     
   s390x     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/c9b10eed73dbc19ae03f5589cc6d55d464bdc84a |     
  powerpc    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/799b3c160229c40462ba79207e800d8472f88c96 |     
    arm      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/5f242217299b0ed1f5c9e57874b4b2f7818dbc6a |     
    m68k     |       kismet-2023-07-R1        | NOK | http://autobuild.buildroot.net/results/ad49b827da1a31d7f8aed55adda0c5bee49681c9 | ORPH
    mips     | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/ed64962142053c8ad460e3ad2df0e8dbba0d63ce |     
   x86_64    | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/0527c9807ed0bf7c0078c8869dcbe580a048a55b |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d0cca3efa7e2f4432a751e0c7f22a5a4aa5d60db |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/efef685a36cbd7c6ad103ea8e1459603765e8c31 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b1be59b51730a6cbc461b3ba355a829a8fdba6fa |     
    or1k     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/24c0580ced0c8a1ba45192066b87a1036fc6a29b |     
    i686     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/e1777e4721c48db1501ef70c48387df68464b417 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e2c7f1bcda802f8e56a439149566d89939521300 |     
 microblaze  |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/1c1e7ee699328d9976b15c8f3dde0588c647909e |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/574f802246287773a75c2fbd1df56e8cd534ee0d | ORPH
   sparc     |         libsoup3-3.4.4         | NOK | http://autobuild.buildroot.net/results/73670f734c1b164d4281cce7a2c9e6d715feefaf |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/4a875a73c2461a50a82e1418b2270a6ba921ef69 | ORPH
   x86_64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/b2328888f2b56b45447ff91151c772a7afd7cd79 | ORPH
   armeb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/dbab2a97b2a380b7b6667185cfd2c7913b87c077 | ORPH
    arc      |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/4b76418f1aeb296046949d1a167eb9db0d022c96 | ORPH
   mipsel    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/67967dab453e36efd34f5ebf98e246ffbb4dae48 | ORPH
 powerpc64   |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/9e5cc961ac9f4e9b2970f6abbe41b0d70cd951c1 | ORPH
   s390x     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/76fdbf11170616613c34970d1b84dfce49974794 | ORPH
   s390x     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/b363a91f193f4eb6ec0ab6de8e4c1549c70ca492 | ORPH
 aarch64_be  |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/ee05da50a7d18472581802688598fc42deb2b477 | ORPH
    mips     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/14e76f8d118201499a6eba03a2249f8a1a2623d6 | ORPH
   s390x     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/09c3a2a5a55ec525188c914e74aa7af1b3a0089a | ORPH
    sh4a     |        liquid-dsp-1.6.0        | NOK | http://autobuild.buildroot.net/results/0030f70c224aa741b22412446380c05c1f4543a3 |     
    m68k     |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/84d5fb351f3c856d8ae5f98b160e1f380debe7eb |     
   mipsel    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/5ab320af0b72534362a0a746d143cd4a8aea3b79 |     
   sh4eb     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/202f2bf56329441bd2b9e80222063031501d7b4f |     
    m68k     |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/6778b965321d890590f5ed5b7453ab42b37bfc56 |     
    m68k     |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/1587b391baecdbb5a24a0c0b2c33d63cb71a2f7f |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/e5e05d9638e16cc23669971373e73b157a18a94a |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/edbaff32a16da1e64ce3116f6b0d3acad2278323 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/8ba1189ba0f177024338f0bb2b59ef6d83f8d251 |     
    or1k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/217daf9c768b1ece59896deda5b725317cc8f139 |     
   s390x     |        pure-ftpd-1.0.51        | NOK | http://autobuild.buildroot.net/results/5980524893fa5e58bc554e6a365e813a62b94878 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/a0c171294c6438de6769610bd55f0389aa6a01d9 |     
   x86_64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/6717e293f771f3af2ae345c9d81d813e504dca80 |     
   nios2     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/0bd769db31cdb3d868b5a213626aab9ea9e7d768 | ORPH
   armeb     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/3a99389bd7b6db7f9467b34c7bead1d58ce5a18d | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/1432ed09766b493d60b6bd7aab01c71715d8673e | ORPH
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/611d5fcb3af98239445f25d44280b695aee4ab37 | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/63647a197a23359431d93f008094fd9f198f2212 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9289b0863dff46ee7c6a25bd2aa277f301fea8e6 |     
   mipsel    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/209012be5b6fc9aa74028596c7d08a071e4096d2 | ORPH
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/1bedc430c5b3b2d162bc6df7a75981e1db69d4b0 | ORPH
 powerpc64   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/dbee922343d23b80287327f1b9af050bdd3e5f30 | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e162e9a0a042738ae3c97a61f055301f0f2a208a | ORPH
  aarch64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7a359d8379bbe42828d228165919a83eaa897529 | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/86913f47f9cb289506145c016d7cd5630ea4bf96 | ORPH
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/535b218677758f3baf98c3047d4b94a0de0b5c11 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5c9a88155962ac1b02036f2725acad9b159910c0 | ORPH
   sh4aeb    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a052687d3f5480a4f43a408e7f49b97ff5c9aa4b | ORPH
 powerpc64   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/9a02d92f19ec96fe559aafe1c579b80eeb138195 | ORPH
   s390x     |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/00cec06ce5162ca3f8fcf867c876460faa7a5cdc |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 2 
                    fcft-3.1.6 | 2 
          libcamera-apps-1.2.1 | 2 
                 coreutils-9.3 | 1 
dmenu-wayland-a380201dff5bf... | 1 
  gobject-introspection-1.76.1 | 1 
package/crucible/crucible.m... | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/474fbdbfc45be369b9b892beaf1f4d70d9159aea |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a51477e08702eb797b1ee0967009b2472c1d0e07 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/57c6984198dae5bb9b2af85dd46bfd5d16efb78f | ORPH
    sh4      | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/55ab63d35ba52adca69458fd165b55c1e97960fa |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/ba86c86eae3696340cc7ad2abd4bbd17cb225d05 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/58edec7c04d042b9c04e9e546241883cba46818b |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/253295cbd8d89fb58ad199a5a93f7df62c5a7a43 | ORPH
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7c4f58deea41b6b9c06bcfc36d4e8a7d4a516de1 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5151eb1cbe1d5a35370857708a0169b7e09cf633 |     
   x86_64    | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/16b653e9bb3fd9dc3ffad8bd653210a544b053c5 |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/8f6e0736b5e6051ca38ab2b12a806f01022f13dd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
