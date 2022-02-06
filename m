Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 07:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED388400A8;
	Sun,  6 Feb 2022 07:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhSbYT-jmjZC; Sun,  6 Feb 2022 07:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BE074015A;
	Sun,  6 Feb 2022 07:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4D591BF3E8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE508141C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PY8E6HQIyq3Y for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 07:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2D37813D7
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 07:09:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BEC9E0008
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644131340; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=29zG/pQLQOrKTp74H5Y3RaaX2GQ6j0Xh2o0FnNSwYDA=;
 b=T3ovIAU86vFdHWbNP4qXlXp09s77PkT97otzAFWYl/EujfM652Z88HThXoDp9hdKbe547r
 zZhZb/49Ei+ddRVWSBFPH2yZVeJ8seUNLw/6h4GBqwjwOq+4L3wYvICbj+nW8o/G5zNx3A
 AI27hW6AozhYXavnRqBa6yX60gzUL6CtzCYVnJQBsxtSkSsICzq394mGuLut3CDY/8kf+N
 62ZmPXCs3d2PVlAgysOjnisE2JgaUQdRJNJ849MuWwplQ5eBre71Ap9S4RoFRQ4t0JhL73
 B9+Rb/nIJN9N/Izjx8h3XFZwKxNSja0aoLU+zxQ7J4RxmORSmu0kKcr98VSiFQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 06 Feb 2022 07:08:59 -0000
Message-Id: <20220206070904.9AE508141C@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-05
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

Autobuild statistics for 2022-02-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 52  |  7  |  0  | 59  |
  2021.11.x  | 23  |  3  |  0  | 26  |
    master   | 64  | 54  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 13
   host-python-docutils-0.15.2 | 10
                  rygel-0.40.2 | 6 
             bluez5_utils-5.63 | 5 
                cryptopp-8.6.0 | 2 
tovid-87c676f4aadb7303d2cd9... | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
              cryptsetup-2.4.2 | 1 
docker-proxy-55685ba49593e6... | 1 
                   guile-3.0.7 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                   mp4v2-5.0.1 | 1 
               mpdecimal-2.5.1 | 1 
                    mpv-0.33.1 | 1 
        python-docutils-0.15.2 | 1 
                rtorrent-0.9.8 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                 systemd-250.3 | 1 
               target-finalize | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f6b8f966295c6bdb8753a601b7936d4a37a81abd |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/4c756fb8c36a64c11d559a6eedd71561fb15e8d4 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6482f4195aa546d0d160eb20b0fa91247cd2bc33 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/c24807c247a682889fa28df5342c348a0ac4285d |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/dd267013faaca1d5ebb6cdfdbc7d4527725006de |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b745566790bad48b3d6930cc93fdd5d7b8680999 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ac7ba633fe96d72c848acf1f43544ba6f897055b |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/e33b13e7a769febf28152a09a20295ec80b44164 |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/9e9f8559b12b8e2cf99cfab435fa7dd5796bbcd5 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/5b6a522000e7b6081bbaa595dd300ce4c47a2852 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/59c103c6b552bcb6d5d8722502f044e9c938bad8 |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/97ed6412047af3b3b881cf217210062bf4e4366e | ORPH
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/90f2e99833e50b73d1f883bd2a4dcd62b0e16491 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/361410a6f843a7e198829b059eb9b9099852536e |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0a3dc4bf48ad842df4bcb4b8a1a7aa7425db0463 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9491e9e270441a8e9f118cdb165121a375e53e15 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9074cbfcc6ef54f32bea1eb8232c6e50f2d48081 |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8202804e3779908e6107c8750135869f6ad93c8f |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/66b78774776aff2af09aec477915eeeaac289189 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/eea09d68e1de44b887099fa4c27df7b8dcf190bc |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0a49e46d2d29f051d0eca588643f90bd1c439b20 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/7a0b385a9363f6b0dd4ab4ad561ec0b7e681eba6 |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/702e64ae020e6ee10d4dcf45e23f9f6d082be3ba |     
  riscv32    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/3731dffcc22cb96df8804901a9d94531b9b42dcc |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/effd0f57649ef8753a46f889025819765801050e |     
    i686     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/eac4ceede674914506bf6a38b4ab528e3b66c70f |     
   nios2     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/3eee0fd5468c4e064cca1b493fdd9ae85161cae6 |     
   x86_64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/81f772a48394d0eff2d9589b182f02f3f1af58dd |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/8cff150298dff135c8d073516b02c627a167506a |     
  aarch64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/4cad8e1c54584edc9b28548c797136d239fd00a4 |     
    or1k     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/3aaa1bf531d73c9901643d6b4c42d30e57f3c6ed |     
  sparc64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/c5917cba0c56be8827161e4473b8246f80994673 |     
microblazeel |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/f96d24d704fe38959ee2065869cab27d22519d71 |     
    sh4      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/d248faf5e10396f71becdcbfc57b07d6be14cf7e |     
  mips64el   |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/080a9a9cd896456ed2a6b15fcfc0f61ceb1fc6cf |     
    arm      |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/694a2322d9161b55f5db66d1ace57d836360ed84 |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/178f1266396d44c6659a67d8e68cb99e36d544ea | ORPH
    arm      |        mpdecimal-2.5.1         | NOK | http://autobuild.buildroot.net/results/b20c090f2ac5ea6d1c761820763037b87bde137a |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b46b864c63962466ce14a0906d4e54bfd8703281 |     
  riscv64    |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/75cabbb22f702fea9d9b75a4ab45eb389cf56ad1 |     
    arc      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/522fd76e0edf575d6546dfa7665fa8647dfcf1df | ORPH
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a33a91e44d35219fe256b1c43ef20898ba3a7584 |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f3d2b17272e642ce657836289d44094a9dc3fb92 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e7c578e473ff1bd36fadfe25076ae44c8ed89663 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6eca1e0f81621c4f91225bdf19c726a9f2ada37d |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7564c5d1210b2997262362d53a568328191230dc |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f1b6faefb5499c4c63c05d17fcf556da1c8eb86a |     
    mips     | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/2ec3114b6db6fb15cda365e1e4a332fd664818bb |     
   nios2     |         systemd-250.3          | NOK | http://autobuild.buildroot.net/results/c067a59b41b22703e402fc700ce6884ae32b576e |     
   sparc     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/70b02e5c7e4f71e5e7d898dc84b759a2bae3ecdd |     
   mipsel    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/003bf2c1ed85851e68f4d81017582f559e342949 |     
   s390x     | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/817aa1585cc59a29019ea1a8541d581b8d97ad2e |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0b5c2ba1b5ed76983c5b0ef121daa965c9362b48 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c149383bc0b1e6c0022958213bc2752f34e21c4e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
                rocksdb-6.13.3 | 1 
                    ruby-2.7.5 | 1 
tvheadend-febcf9818d7c37fec... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cad988f300e150bee71c7fece3827cf2f57523bb |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4c12678290af91cc3401b8f8fc8e4c931171a7a5 |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/dc0a1c6ac4df77a4d87e24618c7118c9b2f561be |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2965a328ab73760e17793542d003defeb3e40b07 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c760fc779ff55a1a373e16ce45f5d9d591cda8a6 |     
  aarch64    |           ruby-2.7.5           | NOK | http://autobuild.buildroot.net/results/32aa592c2e596278abe858959885f68e0c776097 |     
  riscv32    | tvheadend-febcf9818d7c37fec... | NOK | http://autobuild.buildroot.net/results/ff61b8d86d325552176abff2e7e70b938b29d2c5 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

           python-pybind-2.6.1 | 1 
                suricata-6.0.4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/9e19cd111d352440960b304eaadf0db14d02802b |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/cbef9bfc76b6b7ea890fffac2c663aa9adfa5ca9 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a6bc18d284014275446683d84a62ba6ae8aaf667 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
