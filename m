Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 06:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805E34059D;
	Thu, 14 Dec 2023 06:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805E34059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrM04O_foxoE; Thu, 14 Dec 2023 06:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B44441E63;
	Thu, 14 Dec 2023 06:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B44441E63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2381BF335
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 06:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B919408E8
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 06:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B919408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbewAaIBIlIY for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 06:38:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A87294047D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 06:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87294047D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7631FF815
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 06:38:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 06:38:11 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231214063817.2B919408E8@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702535891; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twNyP+sJhg2ykxoItga6HhlLJ+dLQNnyslWEvMyg7L0=;
 b=YO+GrjAp6g9yMlrUMEOzHq3p23c+Xjkxvnlvg/zD4a79+LW7csLI6eH2vHRtKzeaqHV4mo
 uFWxxuj9frJHywPyKG64DF8ZUaKErbidO0TDBdbuHxEGkiBjsvXeNgaUtzpwOLErlghCp5
 9htQ34byrJqOikAyr2bmwXzqZOVkHmyYoGnQbhqXtUcNWs1nFSLyPNJzUfH1Sl6Lh8Jz4S
 MZFOWVNrw4pMorhuktur8XsRgibVU7u59xfZweCbkc2xnNZ0EPfJ2jJeCyOjJjdTZB69dt
 gxxj6vaeV3Do6dcIps6z9JUTPt+1twVSarSNdvId2z2Ui95dnubLIMSIrst04g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YO+GrjAp
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-13
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

Autobuild statistics for 2023-12-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
  2023.08.x  |  4  |  2  |  0  |  6  |
    master   | 47  | 41  |  0  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
              host-rust-1.71.1 | 3 
        host-sentry-cli-2.20.3 | 3 
check-11970a7e112dfe243a2e6... | 2 
          cryptodev-linux-1.13 | 2 
                elfutils-0.189 | 2 
                host-go-1.21.5 | 2 
                 libcurl-8.5.0 | 2 
                libressl-3.8.2 | 2 
                libselinux-3.5 | 2 
                   linux-6.6.3 | 2 
                    ngrep-1.47 | 2 
        balena-engine-20.10.26 | 1 
                    brltty-6.6 | 1 
                 coreutils-9.3 | 1 
                  delve-1.20.2 | 1 
        edk2-edk2-stable202308 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
          host-fakeroot-1.32.1 | 1 
              libarchive-3.7.2 | 1 
                  libkrb5-1.21 | 1 
               libvorbis-1.3.7 | 1 
         python-rpds-py-0.12.0 | 1 
                     xterm-384 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |     balena-engine-20.10.26     | NOK | http://autobuild.buildroot.net/results/b7ef127ab637e801a8901753b6c4397a8614e991 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/7b363201a7a7d7cc7bca94762f683182c63c5781 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5c9694ec412010d6b425ff8d79b0ae52dbe4c17d | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/864602c7652d9c5768f9d8a231e64ec82cada920 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4fb40cd2552fcd48d4f88b35cf277559ad741592 | ORPH
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/53939e217d2dd39c508279e04bf01b9f6e52da95 | ORPH
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/acbe6ea26eccf4e62ca6a7c8c908775f85239e4e | ORPH
  aarch64    |          delve-1.20.2          | NOK | http://autobuild.buildroot.net/results/7b05da5cadc3be698c75682dcc7f54a81a64d04f |     
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/1eacab2d0216b604b852ff577bf7cb1bf1b23ede |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b9a6a51f84e891bbcfadcfabcd305d85cbd8b692 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4c1241e7a7a03cc0f91f13cc14a26f09d6c66b1a | ORPH
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/f8516051953d9693afe7083eaad91b5bee3ae793 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/474f2ae544fb50ce4fc9431ecd5fd875b8c4b9a8 | ORPH
  riscv64    |      host-fakeroot-1.32.1      | NOK | http://autobuild.buildroot.net/results/c128844ae4a008f49d0e4ab641b8c7faf9554afc | ORPH
  powerpc    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/39f510c21a2345f430609ab2a1f47b18e738de44 |     
  aarch64    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/63f96faf9c4aea1ef6f967d64127c626d6ad4990 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/130a0e558c31b5d588c02d2f9110934d9e5f2cd5 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/19cd5ab954517b9ced3ebc44fc59f36283d5e948 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/70bc74ed6c217d3cbf3f68322f9ff8a628ab8e81 |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/64bdaf8fcb4905f86ff10d77ae2b074d50ab8f40 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e9d8cfa6593e8f972db58417213a5219370922c3 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8e8dcd8ff5df83dad99c2ad94e2631cc9e6eff48 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b182066ebc98311af6ec4528c3f407be151a482f |     
  sparc64    |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/373a72e2a8a260c30df845814324cd2b970aaeab |     
 microblaze  |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/fa9d4c8a879f54bd4c3366eae63d6f98658bb0fb |     
    arm      |          libkrb5-1.21          | NOK | http://autobuild.buildroot.net/results/e3f1b59b4aec4db16d8548570a55e03c356884dc |     
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9c192cb93837b51ac99f4d4438465b217fc46d3a | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e0ba6d410527345de974ba04e69409bc0e51f94a | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c5f92646ae98ddb0a7f971bbbf7cd60ffcf7ea90 |     
  powerpc    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/e88b96d068f384c92e4d853a7bef1e551880cc6e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/9b7fea2b7c65a9b2e825a153e353a9c50467ffa7 |     
  aarch64    |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/c7233cf4f9addde84884fd96987c2ddc83fcc1dd | ORPH
    sh4      |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/d76b7f5f2548cb4c9b0a59a899bee95d6a2f8223 | ORPH
   xtensa    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/009fb43fdb32e38e0c43b8143e16a5b3e74b7b3b |     
 aarch64_be  |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/f6253da6be117da597d4ebab898bf14d070146ec |     
   mipsel    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/172eb8b1bc01881a9a016bc97ef869e007532f29 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/5c2d12013012cbb2decf756a53e735abcf9e391c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ebab96813de7aefe2378a90150993359b4c2beba |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e29e49877c4384ee99950850c54f23a28b5e0bae |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/63f3d252e2e01395e7480e472e3e037ee41a4c17 |     
   mips64    |           xterm-384            | NOK | http://autobuild.buildroot.net/results/9a9766d3ed909aeaa605edfba079dd82ff230f62 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            ocf-linux-20171122 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8a7a5891080f18f4451cc7d2ececf85927af00e7 |     
    i686     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/7097e3c08b878fed0c1b10feea93d5c587c7149d | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6f05bc0a48b279cbe827e267fe7d9b891f368e27 | ORPH
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/856585b3d08821fd2b26fd267141b66055d83c49 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
