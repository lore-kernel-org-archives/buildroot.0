Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D0BC001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 05:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66ED706F8;
	Sat, 21 Oct 2023 05:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66ED706F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DnFRE3KZcXQ; Sat, 21 Oct 2023 05:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F811706FE;
	Sat, 21 Oct 2023 05:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F811706FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 338121BF5AA
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 05:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C590640A18
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 05:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C590640A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bu4K49AgciNu for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 05:34:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69698401E1
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 05:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69698401E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FE061C0002
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 05:33:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 21 Oct 2023 05:33:59 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231021053407.C590640A18@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697866439; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ttU+i1tfoSETowHefbQEboN0gAGaTvlrF6G4PJbigC0=;
 b=D8YnpgjLS67LeUrO711YeKNTRR1s0RInUj8sau4uDW7DZPRtQ825/m5j01Zbd6Kdbwzh3X
 WKKk0brfbFiix+zUzJ1Lsg4FDrrOL5qApl4wBu/aFVyzYfZe/nFNqY6VXppf2k7xS+OP1T
 mVKq8qkZ9SCjAXTLBN1oT4AmhwnnIMCZTJuAXE+ubVLyUteoYnwKYh/fKP0hf5ml8RsMn8
 hyjs+olvFi0PGKLurboBJnSZrqi08YJvRoubPnI5KftSb8nGkmCjOspheCmsSrtrWQrAsf
 yE07eqtzCTe0jjZO4SgCMEIQjDL7nNNGGgTtkGZcxVhLeosMHTkeMzpRwa3xww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D8YnpgjL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-20
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

Autobuild statistics for 2023-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 12  |  7  |  0  | 19  |
  2023.08.x  |  8  | 10  |  0  | 18  |
    master   | 40  | 64  |  1  | 105 |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.0.12 | 4 
              gcc-final-12.3.0 | 4 
              gcc-final-13.2.0 | 4 
                host-go-1.21.3 | 4 
                 openrc-0.43.3 | 4 
                       unknown | 4 
              libarchive-3.7.2 | 3 
           dmraid-1.0.0.rc16-3 | 2 
glibc-2.38-27-g750a45a78390... | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.71.1 | 2 
        host-sentry-cli-2.20.3 | 2 
               mariadb-10.11.4 | 2 
                nushell-0.85.0 | 2 
                    pppd-2.5.0 | 2 
                xenomai-3.0.10 | 2 
               apcupsd-3.14.14 | 1 
                    brltty-6.5 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
              fftw-quad-3.3.10 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
               libglib2-2.76.1 | 1 
              libostree-2023.6 | 1 
               libvorbis-1.3.7 | 1 
                   linux-6.5.7 | 1 
              open-iscsi-2.1.9 | 1 
         openfpgaloader-0.10.0 | 1 
                 pango-1.50.14 | 1 
           python-numpy-1.25.0 | 1 
                 samba4-4.19.1 | 1 
                    sdl-1.2.15 | 1 
             strongswan-5.9.11 | 1 
               trace-cmd-2.9.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/75d925f938171c8869cbf7cb37de5e3f5297fdbd |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/dcfb3bb5a8e80a8b6e34ec07e986b38acacb340c |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/80926ab66382a19489d6bd00a765f98f5d3a83ad |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/306706655560fdb2d2f7d5f29bab0b6d060ec9f8 |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5a0ea1568c914441db6554bb3ed19f0dee4b218a |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/60e3d4c1b1e3654fb778bf6d209d128ab40002a6 |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7e65299b2f34d6fe407bb96c4e9af96c82caddb3 |     
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d6f0d639a95cfb26256b5f347189317595bf126d | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/7021f294408041e511ea273c660c83295b037c07 | ORPH
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2dedf215aeb8f96a3219dfce91a8b2f759386a45 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0bceaea005c3ed436301cc69ce3397ce9e0e2e37 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/97ce747e9b0d8295b1361e921cb0f3545721d2e1 | ORPH
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/dca1847ada61829f72d7d9192821f00832b7457a |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f562e0b53893d723e10c0faa6e1e62ff06001e2b |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0ae758e06b1818a2a06612b9ba030629f3445d70 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f4bedff26669748ccbb77141c031625c90168102 |     
   mips64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/68847af0b2d15c026883bfb8a53e18eb5ff5f04f |     
 aarch64_be  |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/5a2872131b223a81b8f4054fc7958059a68c614e |     
   x86_64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/f383cc0c574e58ecd9203318bf23b61755887d78 |     
   xtensa    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/f5bb94d2fe1b54c90d339e594a8e096b76a567a4 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/ad4ac00b85b22940b8dcc641dabc1d15db49a930 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0d3c8c3e43216db52255e794f67566031d897a8d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8d7734c3ceb256a8239c34caf8e64e774a50aa56 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/023de3fc2c174df41e7e1a061989263b26b9dd51 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a819c236ebf21281edaf9d988568d8000c599892 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c9a880a85c411e956e266d66234f2bff525d0d90 |     
  aarch64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/d305f8a5844498729c44791709fec59f55e46b24 |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/958f8308f029e697c3304424efd3a5c1fa52c8df |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/264a67055cb0a8b6d1b91010e020a635cc91979b |     
    i686     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/81fec345761f3505479961881b5b4b4cac55289a |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/744d5b184c7785a961fd5fa1bbe71ff9af551af3 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a85b3af39a618c8ecd39e93b3734e49ccdb9036f |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a68b5debaa90c993b3357873157ef89551ce8f07 |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1efa29488f20fd6fb4c777592b5111cb77830daf |     
  riscv32    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/2da0b10fee6d26f856a11bb0b2f5e7f7b4a14d4d |     
   arceb     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/2c1e23a0e0ab68cff439bdedeece5ee96641bb5c |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c66731b330745ef6f6b36d85f808916547317b11 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/15b7562e7d0f7375e68aad656ceb27c3b86501fa |     
   mipsel    |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/ee7d6deb507cc30e692443b8b35e2bccc444da84 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/72fb47d4de27ee376b2e2b351fa6c8c35271804b |     
  mips64el   |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/c0664e530a5124633bfdb2396ad7014dd5610de5 | ORPH
   nios2     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/2609cd429b9c675e6a62c0415217d11effba7762 | ORPH
 microblaze  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/0b2ca3de0c82bc6320346b2a357522338d659cdf | ORPH
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/ae207b2c9ef8ceffd46c3bc9c61d1cd382533c36 |     
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/41a42a73812e3a7ff12c2328ce4c1dc018756f17 |     
 microblaze  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/54b4964fcc8b59838545b7d94e9299df8becbc3b |     
 microblaze  |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/d137e4f04f54482cb5f2f35bdca946110dcf77ed |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6ef2121b2ffc30541140f256ace933921cf02580 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/050a16d8e8e01c8d9af24f145852ccf25170c281 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/d9ae0c7e6a1313c6eb19bab8915e4f72e4225d66 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/72373818bd7bfdcf22c6d0f6e4d262eef1b182bb |     
   mipsel    |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/83e3ffb2c87e5475e6134240c0462224e049e488 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/2b01b7fab8a930481ef8e8c4b1c12a1d489c9530 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/0b65f99755ec12234a251bff986d9e19697be0c3 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/5afbd6bf998c594189f5a3097e98ed6139de296e |     
 microblaze  |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/6b72b6656f2c212cc1013f2381b04a70346b601e |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c508bf098a590af6c196ab21bf83daba278c34a6 | ORPH
  sparc64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/bf16fc9e180cfc4a9a4010b7cee078cd263fe763 |     
   mipsel    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/951e8e00e2d33f4c4501f69eb256f4918724c147 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f83ced08749c70e0bb04145b13e0ab7e5f138a49 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/dc3d0eb37ffecbed4199a41da042bb8528056cf7 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/68d91a64179bcead776c71f79a525d87cf34eec8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/fd8892391fa79e9c2269de47f696a2bab9198193 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cd8492803b6bc89dbb2522717279b19ae57c1858 |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cb3902d66632596326189ba1e17de859ee89cba3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 2 
               host-go-1.20.10 | 1 
               libglib2-2.72.3 | 1 
                    php-8.2.11 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d89cdb7759a2f87be275f73a0ff8140dcb8a2f46 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d0467e8dcbcce04a7ceffc0b9d56086935b2b0e1 |     
   sparc     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/e8425a91346c707dce23f9ecde4c84cae460601a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/69d99aa6aace0383c9e6d1fa922d0763be346a3b |     
    sh4      |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/91e1e8688b60aa3384711594072ce3dd25639a18 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/df6e1dc0e416ed75d36946b535e689dd57734d24 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/69d5e2c97fb84f3a1c6c98a726aabec9c1914a17 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 3 
                   bird-2.0.12 | 2 
               host-go-1.20.10 | 1 
                  motion-4.5.1 | 1 
   openvmtools-11.3.5-18557794 | 1 
             stress-ng-0.15.07 | 1 
               xwayland-23.1.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/db0761f854edac4832b725c7b9f254bc71cb13ba |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c66ce55662b54178ca36c7c00eb425d8e90e94b4 |     
powerpc64le  |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/b11b178ebdbfc7ec0d09067ba8d5ed756126b2e3 |     
  aarch64    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/b6df04f31e4116f6820ea38a7452580f5672d1b1 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/b7b822e02fa577c711a099211e48f414cb6aede1 |     
   sh4aeb    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/7b0a1d74f3c96c950062e8ac5832a9e73953126c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0880f7fc720876fa9b1206e4e24406eb8c19509 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/53558fcef71d44b281025bc273bf87bc37446f8d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/30fee1f3b592315b2a64920962fa54aa139fc68c |     
 microblaze  |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/e212f62143dd246be10f325a4b43cb8d9ce9283f |     


Gitlab CI results for 2023-10-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374778  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374788  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374854  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374861  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374863  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326374957  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375082  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375101  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375105  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375176  |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375243  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375667  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375674  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375816  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375831  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326375934  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5326376472  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336090559  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336090752  | ORPH 
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091147  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091170  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091177  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091187  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091192  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091206  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091221  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091238  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091258  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091284  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336091425  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336092352  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336092772  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5336094752  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
