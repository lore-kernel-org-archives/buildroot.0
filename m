Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F392C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 04:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E1483E68;
	Sat, 14 May 2022 04:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoABkpy6UiCn; Sat, 14 May 2022 04:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D13C83E17;
	Sat, 14 May 2022 04:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5B51BF271
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 04:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 091EA83E17
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 04:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2X1h4DIT6Giy for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 04:40:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B096D83342
 for <buildroot@buildroot.org>; Sat, 14 May 2022 04:40:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8B9C6C000A
 for <buildroot@buildroot.org>; Sat, 14 May 2022 04:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652503252; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qA1PW1TYkViuTRqF9lOcapCOFnElE4DoztkKoRkko+A=;
 b=Wj+n2mhnGbyr8E62GkAlLf9m+4p1fZzR8hsHz9sEAf0CITQwXrCSOmxMqkYe1l19Nptjx8
 FuVTQuG/MgOBNe8D/fu/nQGzIWgBZcJsziGoozftP1/eSMHaUzkPIggNNdje9Di+SU1B9p
 2kfJc7Ifqb+a9iLVCRXXdR97d3ZLlr4l6Ll6yiY3+nhtr/KhT1MjsTsHj3Y5rzc4u6zc3q
 0m8B7Re/I6QhUwoCTEsKTFZuc9AMwaX7ntYsZ/cmxexLupwISxMd7sbT9VNGJ/TASlD53R
 rDzhNGmXItKJkC0J7Wa4xtCLPiEwPaDvJA8cnL9frEdLncDPHuGikx6dI3xjhQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 04:40:52 -0000
Message-Id: <20220514044100.091EA83E17@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-13
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

Autobuild statistics for 2022-05-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 32  | 10  |  0  | 42  |
    master   | 139 | 260 |  0  | 399 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
glibc-2.35-6-g491f2ef1f0ff8... | 20
                pciutils-3.8.0 | 15
         host-gcc-final-10.3.0 | 14
                 uclibc-1.0.40 | 13
                    git-2.31.2 | 12
             libopenssl-1.1.1o | 8 
               protobuf-3.20.1 | 7 
                libressl-3.5.2 | 6 
                   perl-5.34.1 | 6 
    toolchain-external-bootlin | 6 
          host-gcc-final-9.4.0 | 5 
                 dash-0.5.11.5 | 4 
         host-gcc-final-11.3.0 | 4 
package/nodejs/nodejs.mk:28... | 4 
            qpid-proton-0.35.0 | 4 
                       unknown | 4 
                bitcoin-0.21.2 | 3 
  gobject-introspection-1.70.0 | 3 
                host-go-1.18.2 | 3 
                 linux-5.15.39 | 3 
            ocf-linux-20120127 | 3 
               pcsc-lite-1.9.6 | 3 
                alsa-lib-1.2.6 | 2 
                busybox-1.35.0 | 2 
                   gstd-0.14.0 | 2 
host-pahole-73383b3a39afe86... | 2 
              host-rust-1.60.0 | 2 
ktap-23bc7a4a94bd9e4e1b8b7c... | 2 
              libostree-2022.3 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
           libwebsockets-4.3.1 | 2 
                 linux-5.15.37 | 2 
                   linux-tools | 2 
               pipewire-0.3.50 | 2 
                     refpolicy | 2 
                sg3_utils-1.47 | 2 
                  sngrep-1.4.7 | 2 
             18xx-ti-utils-8.8 | 1 
                  acpid-2.0.33 | 1 
               aircrack-ng-1.6 | 1 
                arp-scan-1.9.7 | 1 
                     aufs-util | 1 
                  axel-2.17.11 | 1 
               belle-sip-4.4.8 | 1 
              bento4-1.6.0-639 | 1 
              containerd-1.6.2 | 1 
                  cpulimit-0.2 | 1 
                 dc3dd-7.2.641 | 1 
            ecryptfs-utils-111 | 1 
                   eigen-3.4.0 | 1 
                elfutils-0.186 | 1 
                    emlog-0.70 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                haproxy-2.4.15 | 1 
              host-delve-1.8.0 | 1 
host-google-breakpad-c85eb4... | 1 
                   i2pd-2.40.0 | 1 
          janus-gateway-0.11.6 | 1 
                   json-c-0.15 | 1 
                 libbsd-0.11.3 | 1 
               libcap-ng-0.8.3 | 1 
                  libftdi1-1.5 | 1 
               libglib2-2.70.4 | 1 
                   libks-1.8.0 | 1 
          libmicrohttpd-0.9.75 | 1 
                 libp11-0.4.11 | 1 
           linux-5.10.104-cip3 | 1 
       linux-5.10.104-cip3-rt3 | 1 
                    lv2-1.18.2 | 1 
                     lz4-1.9.3 | 1 
              memcached-1.6.12 | 1 
                 mesa3d-21.3.8 | 1 
          moby-buildkit-0.10.0 | 1 
                     mtd-2.1.3 | 1 
                  mxs-bootlets | 1 
            pkcs11-helper-1.28 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                   psmisc-23.4 | 1 
           python-orjson-3.6.7 | 1 
                    qemu-7.0.0 | 1 
                  snmppp-3.4.9 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codescap... | 1 
ulog-0389d243352255f6182326... | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 
                  zabbix-5.4.9 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/a707dead09fdfa77f682f9ec20ead554739ed354 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/4d180875b3ba4c99add536948e2c0784f28279e4 | ORPH
  aarch64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/d7eac5c5b4ee27f8fe8e561dc792e9cdf3988e37 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/abc3387cf8db7eaf4b0b52da667c62ef9bae6d61 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/8812fe3d9b7a0d8aa1b953b283d983e032086049 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/5c2aa53b7b6a3b3a66c386fafebc6d2bf01ba9ca |     
    mips     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/bf2eb6b634d5649247c6419977365b3f28dc8b2f |     
    m68k     |          axel-2.17.11          | NOK | http://autobuild.buildroot.net/results/7f9791e1b4f0bb75039840b320537ed7da878cb3 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/d56776be2619e0148f32f7fc2270f3ea41a99474 |     
  riscv64    |        bento4-1.6.0-639        | NOK | http://autobuild.buildroot.net/results/e92e94ac2e2d79218afc5d37398158a429e54f61 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/6f060a6b79943906f02a5fb02b4adb96a9c341cb |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/3041b48fac5b4b20dc87c5f04411234536a14672 |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/385c320a053ab3c06e85877a7e2b9aaffc41dca6 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/778f3b1abe27eeb3d1b09ea94eb71f90cd33cae3 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/01d6b9c862e988f25c5388bd95f9e644442c4e7b | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/4105ddc7f10be83a555fa8418c174bde74c477cb |     
    or1k     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/da738400bb561dda638ef25b4259c6b183b796ba |     
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8ab3638c372366062c0dd3e5d2974134357a9761 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2db7b74a7880db476cc5304d0e65d2601701c3ee | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f90e05d0308966d0b202daa27366fd03a6a9ba8 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cd1e0ddb383591d8f397370240372715fdfff562 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b6ba52497bd5fdbee2fb292165997f2acdb00cb7 | ORPH
   x86_64    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/ef6421d15b279ffec30f1884ad9f76bdb761be7d |     
 powerpc64   |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/47ce5e7f6f24a8905c59a7b05992d59b9f20b850 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e874841fb1a1615962ab43ffebbaef62add3aff1 | ORPH
    mips     |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/76b8e413de634a63cd906e8926fa40cd27cca3e1 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/f4dc5718e77eed9f3a8877c4f07ee79904b63081 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/47a4c17969a1fe9bf380ee254050a59ef87b321f |     
   arceb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4df8c71e95fc7bb9c40f82f9a5c02dca8d45aa00 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/5d8526ebebda58c08c29daa1a9469049e65dbfda |     
   xtensa    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/1a4f87adcab63aadf9e0a00fe6655ef60f08b9ad |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d3c1e9dac243f546e0058fcca4371c9a74905303 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/45e975f7700ca2207a4a815d571287689b3051cd |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/20c2b6bce6242a757128d736774187a0ad185a8a |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d53e7a4e1a2a2ae122578c6afc033721601edb1f |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a1f5748dd6ecddec99db729e7aba1863fae863c0 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/16de7063319ee330f5ebd9bdab1deb5a90c0b5fc |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/05bc378fc9f7b3211b8cf6e1df595a5032725219 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/645c8b5193164181ee5ab613a644f756c091a01e |     
    i586     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/9e88da7969949cb437ad717691bd5f5030be5dc9 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f48feebfe08c2a8614ad944cc2d39f8ed9a588b1 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f4ffc62a1d7392c0a6b14f36a5070282ac86c501 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a14e45e0e2859e18f41df493c73134898c693a14 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/854bd7caca326988b080243a0db3080033f9bb0c |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/9c7370d7abf3dd273b4e7dbdb6671ae07dc595ee |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/ad8085639b0fbfc9cd14b6f68fb94f4a71d43543 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/d90317ba54e5a8ccde86742e0691bea06c2836ef |     
   x86_64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/9d372e722fa8b962a972591f6cb0026a3b079556 |     
microblazeel | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1d7d2179f0ef4f6f8d186c0c5faac3c2eb66f928 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/ff3b4844df82a274c6b4964810e95e3430c14546 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/a069d0efdffbd5be12a0e5ea3fc48b825bb038a7 |     
  riscv32    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/59695de60ef0d900c29c8be9b442279265a4bf45 |     
   mipsel    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/686dad031cc082f300302f86448dbd676f141919 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1d3406d89178947efa23ae52c853a07c35d3a9b3 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/10d94bf41250beaf4c44f3260ab6bfee76a8f410 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/dc5b20ad060f8372e6433bebbe5794167416f087 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/74b355aa5761494c0a315cad1d9483db53543282 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/356a4471db63bbab4a9ec47f0b17c8ccd999aceb |     
 microblaze  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/335a07f13830e75df56ef0d3fc02001a6fc2b502 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/220811615ce1a9eb9e43c34db5f51f918d18c7a2 |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/0dba0b219aae53d949e2e22fb07d8ee5eec0509f |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/b108298c86912a0a487f5b4f3366e1c319b6051a |     
 microblaze  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/e873252e72e8f0fd3e7fd0968531e2ba03ba6704 |     
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/72a81f0f618721449196afd143161d7c652ab59d | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a7a5e49d06083c61955928eb2d101afbaca5d642 | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f378208fb21c92e516b540bdac5a92be0dc8551c | ORPH
    or1k     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ab72320440fd5ac805c66a142880d16ca87506b5 | ORPH
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/8f0a014176d140e13c4574b74f6a8d24a813db86 | ORPH
    i686     |         haproxy-2.4.15         | NOK | http://autobuild.buildroot.net/results/b91af86640edd9b07dce19becf701b1673db6ee8 |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/721d1cdf020ddd3a7bdabbf1235b41c7286b55c6 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e8ae9a3972ce8afab8b53b31e6515772f1dfaf84 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c828e10ff42d545c7b618dbfb6a8eecba00f628 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1f8b1cf2a9492753068ead449633f1406bdab6b7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/220a96fd58f8f2b3de7e9f5fcfc485886f4288b9 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1c5c2af2c72e552c6e8e174bfe9bc5363b9bc1d3 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6a73fe864f495a2667c51f1055e30955b8768af7 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/686af7c8a01eeed20d15deb2d4c0f8e7b4ffe8ba |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b960dc7ecf7787ad9c2cecac945b6e01b7c77a88 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dac093f9b040e7e6ab6561456046c3bc9cba5bfb |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1c919e3d7c3aa56ed012d6a1ea0cdfd690abf1cb |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e9781effc665215a096815b52bda2352aed65cc8 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/016d638ecf2376050533fd175a01eb3f55a786f2 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/14a55ed6ca00b40a4a6b2f147215ed4bce4f498e |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e20756f0ab1b9b8b325347cfa2c1f1532cab5fe |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c2bbcdd8193d932afeaf5e349f19867c4955293d |     
  riscv32    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/74d738ee8889faf73ffca26c56da538da7e3895f |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8de4a6bd9c906b1ce9a479049ece4c187e487106 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f7da78d8732b7c466f9322edf94a2c1cfdd9f756 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e6efc5256fd1b8a178972c6da5c2cc99c6b6ba57 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/01def1ac90535122a5e14c4183a2215ce084ea29 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a7e741ccc686bb0f771243593520ea39b3d73e80 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0c366e71c8f17a43bc2cac7a8487dc63906a4610 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/695e7f5ce334e0ecd051eb0b1d7166f7c488f2f3 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/46f3a249cb8c468966ccdc785c94762273f76587 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/97d16933951c59f465edd4103a41f0dbdbbe8794 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/64a3d9705ceed5c9e7e842dc2c7ca70aa85f3261 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/106e397de8d5924a4ef80843e76956fe86344cbf |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bc2de5e418f36048f69ec56745f4255da38d3f78 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e8a4cdf13736eb6b3fbd8696423353f70ba778d4 |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ff0b8f3a577c452487d6cdd4b5b50f2ef524d8a2 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0f0501d3ed5b57f15c995a31d872c7fb48f8bfd6 |     
   mipsel    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/603d2b26813c423709963510864d6ee6694cdc5f |     
   nios2     |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/92fe19446b40551c0139254d9efc6b3904fa287a |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/c2fda6c6f3a57e5fb607ada17f0ff04e13e8dac1 |     
   s390x     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/089df66be533a318588cc1559bf82c9c26ad2f7c |     
   armeb     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/06ec0488397e377361bff86cead698ec28edb097 |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/cb5236fd64fd0d159a88df905e2d293bac4ce6bd |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/04c26a4ba57787acef5d7dfb4db781627bbce26e |     
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/7fcd1d23cdcfbe408ec73fe891cbb74510c54050 |     
    arm      |          libks-1.8.0           | NOK | http://autobuild.buildroot.net/results/e61a683928795402375165adf686687f3305e0c2 |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/10bc372da8b8d2cd36afc11d0030a8df3351ac14 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/10cef363af80af2880ad44f348c67fd327d1996f |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7406b6b349bb2453a867b4bedc67fe122b5f0ec2 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1fb06a5604a606b586aa4ed7fd62357017a66001 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ffdbe58d601fb16fd0bdc625c279f60589841ef8 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6dc485c4a41c2b57f3d98a99178ec51e4e48a995 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/40503516918e22b5e2c9a52706fcc20af2029112 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9bfd1277955669d60dcb0889c72e53d7c0e3287b |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3b24971e85607e15191b121264e06029967cedfa |     
  sparc64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/d8c3e415ce940ad7a238f8d5047559ab3c7da633 |     
   s390x     |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/334e8dfdc5fb1d9b6ef8683565d63762a2273f76 |     
  sparc64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/55c25a614af269e6c9fcbc55d3b9378c4fec8d06 | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/caea6c69a96aef3499b1f067d04ad64690abb325 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/7804142089df90759103ede4d29d760ab4ca9bb3 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/2a1a3e2989bd39d497514aa19b533600e450fbae | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/b79043efa7ab20d0f15a905c10f9a0123b5b9ed6 | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/f9722e1ab0710f762afb6c33685e80b70c2981b3 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/402b3de02dde4ce96fb5ad38d1231165633bcae8 | ORPH
   mipsel    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/193a501f121ab53b22c695a2dc060833598ac311 |     
   x86_64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/980372a02e6770dfa843c5434f3416ea0673f45e |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ec15276416987d3b45e89ddc526cfd991974b035 |     
   xtensa    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/49d73fc2215d5a135d19aac7df866d8241133949 |     
  mips64el   |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/b500b4403bf2a5ca07cf3add02180a4d826beee7 | ORPH
 microblaze  |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/0bc73d5bf48c5077360cc7326613b3d8b915f3a1 | ORPH
powerpc64le  |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/d9826c707aeb03a8c3006caaa94ef356b031d8ad | ORPH
    or1k     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/334c6ffdc4e24fef5afdb742b6033f01a1af0b2d | ORPH
    m68k     |         linux-5.15.39          | NOK | http://autobuild.buildroot.net/results/d665d90b70046e243d94a5ba2767bae3b7d7c5fb | ORPH
    m68k     |         linux-5.15.39          | NOK | http://autobuild.buildroot.net/results/7e57d959576a394e502cdcec8c9b428a1e753bea | ORPH
    m68k     |         linux-5.15.39          | NOK | http://autobuild.buildroot.net/results/4fe8ae5b0f1b6713cfb9082704b2e25ff69a38cb | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/94ed14d22052603c870fa5053c784d6e148e02dd | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8aca2a5792bc906bb9f05fbe266e2e232ec39018 | ORPH
   x86_64    |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/b2a105fbdf03118f24ad3b199206e85ed72aceb2 |     
microblazeel |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/76105a6899ed3b9cce7a1e730cf0afcf4c1e0b79 | ORPH
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/23e5f6581763d026a50a0ec7c0935873a8f5c4cf | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/ea0ab94cfd270531ca673fcc75a0d0c1166ece65 |     
  aarch64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/c6dde9336e20f16f9a06a621629de17a37246c7c |     
    arm      |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/f3c7169137b1db15b8095cc5315ecbfb37b8c962 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/55f961b9020de4ee442a1120c294a651f5ea26ff |     
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0b63cb1904bf84a39f960bcd91747655086a64f8 | ORPH
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/2308996ea17d50fa49ab84b62965e991d77a9bb1 | ORPH
 aarch64_be  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/56c90bed3f668ee6a375c1b40d468a0ab8b5ff83 | ORPH
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/68ad8e629c3c09f5f5a0c2ec93863d0c0b2a1aef |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d1b8cfa8b397c4c8cf91000cd43a26cf331e0fa4 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e3c3bf2552a9b7c8e461c34b47e779a77867bc62 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/462499b51e5dbbc5d80d406277ac695451fe5f17 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6317df4bc9badd4efa10cedc2cb92dc232233148 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7e315999ff0f7b2a1dec005aa0d28211e80285cf |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f66288493ac48ba1be3e096ef1061402265647ae |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7395629dc96648d068c636cb00e3ec55b9c7f8ad |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1363773bc3d4dc6c15b029f65a548b2205016a47 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e1edff9e059d7d78ec69d6886f99314fc54eaa06 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aa7de37bf1e00fc9d50922814d30d154c07e72ba |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e260095a505d5406d6497cd80a82cda653e0396e |     
powerpc64le  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4a85f1a38c86cbbab93da32f1a1d74f43cec69a2 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/84d5ef39e4a8db3b6e03452c504f8c8390c4a976 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c60d73c993b77e8c10245b75fa830e477d63d6a4 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ce5b750ae1cda1259d89384a4cb11af93a15f055 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a78ead52055f6f5b507c73d5823e7c6eab2c0e4a |     
powerpc64le  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/900897059f9112dc42ad504d056a33bf80857ad7 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/23ce1400750ade40cc70c97d65b0852aa7465fdd |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e7aab14d2ab023b5098284be94c1d59e6504c313 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/21f4543c38c28b99e31c85794b1efb7e3844f251 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/02cb4c6e8697fd68038b8cdffd1eabef5ff85465 |     
  sparc64    | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/a6e67ee8596d8154ad12f657f8b21f4dae14c07f |     
 powerpc64   | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/2a9b2110710ba2ce833c729233c591bd7a531c2d |     
    arm      | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/8dfdf9e4b6835f6935bb7eca547c320f523f4623 |     
  riscv64    | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/1202e87429b4fe6fcd40dfcc47c47b6fb8f37214 |     
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a5989cd92e28174915b877ca9a3b0a9e568252d0 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3e59ad5e2d09c2cc6bca4901a0c09be175ef3298 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/670db4645fe9358d489419fcc114297e7f537cc4 | ORPH
    i586     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/46baea45f856aec97ee8ef8dea205ddafbd43d5d | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/54236774ac5115468568be9ba7ed19f78901e5d3 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/7804943ecb083e8fd2a13fd2e93885d442c0758e | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/480774386d01ce28631cc7b8f1262857ea2c7a7c | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4209ae101d1dd6c9009e1901327de3048b3ed6d8 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/8aa0900ce458f721c6210cc17556f4debf218c56 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/855c2068124933be272829c65f67a8d4ef290b7f | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/703526d8e73efe6cab9c386e93e03fd7fce73dae | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/6408f6df87a21a4c54585fc465ebe79f44740baa | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4df7ee3066d5619e79b2b7f9f16b3990b9bc72d0 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/05707be43f3b996958baf28a868b399cbc3bd692 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4b775bb6784fc4bd56b62b6e6e447dd7af7fef29 | ORPH
   sparc     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/e6dad0f9095bb8ca59734b01205803c038fd301c | ORPH
   sparc     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/e7a60d61c6341a0c87465e5fcb269032818189d6 | ORPH
   arceb     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/4b9cbc816e57ca6d4654c69aa0f028c03b7442c8 | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/08522aa63c1310dad3894ff5e9674319a17baea7 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a72a90d8bb74f94b616c924c97732b8aa8c9e253 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ee664be671ef24b10aa1a1d9d481da3ee9cce831 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/59096061cbd7ed49f7820076699ced13b4dabf38 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/782274662927289920fe03bec721cb190dd6e79b |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c1358d72446d08c0fc05144357d92748cb429e36 |     
 aarch64_be  |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/c286e661a4bfe253db983c98560d30f9c0f4393d |     
  powerpc    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/8e30476adcd92a018b9343dc835d0629be701c13 |     
    arc      |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/945ece70db3576f088689e8933bfeb34cc4c8fca | ORPH
  mips64el   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/8f410fc545ee5480ac3544f70b98e10cee63f3a3 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6fedf80bdf1357869e419882ab75ebc763aab677 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/adc02e07f2de23f4786d188797cd1a8c98717b73 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7ce1ebe1cfbf6bc74fa0b06de3be5b8db72b27e1 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a2102fb1e6be7c6b1a71616149fabedad5632f1d |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2475c9e0052537ddbc4c5f554111b34a721c1dab |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3db690666a5c7d8c612070348ca306f0461e390e |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f18bf4caafaecee95079eca5494329164412ee43 |     
  aarch64    |          psmisc-23.4           | NOK | http://autobuild.buildroot.net/results/8e3836f20af2f6b87df8e2c68937343ae4fd0e9a | ORPH
    arm      |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/95da1ab2beca5b81c62bd63fc516e1aebd229d67 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/22d3b584b704613d030e1ea9e6b709b713e4cc26 |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/541eb5c762f79d060d51f77ec7e478d8cbf998bb |     
    sh4a     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/47ed4644746217c0b8fc8e6737830045b59636e5 |     
 microblaze  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/4ae9a9dc3ad4fc5ce96696508cebc41d14f130eb |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/e0e0f5de61ef49e1ed300701a0e4d073a82898c4 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fbdb3356a2f4366cd5b964f9240b4198ea658e28 |     
   sh4eb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e78f1186f141a3bb7bb7141bfa27d0185de569df |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/b444880dd472586fe493c7e939111fda18209fa5 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/25eabafd83291020c7906b8ba4e59c9a3c58dedc |     
    arm      |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/7adb5c891641062e27a0282944b242b3804bdc8c | ORPH
    m68k     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/a0a073edfa4fcd7960e350984a186cd297ffc898 | ORPH
   mips64    |          snmppp-3.4.9          | NOK | http://autobuild.buildroot.net/results/b50b883c03e82564198a8b7e91bd14bf007772e0 |     
   mips64    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/21319481cba1ce395c9a783a988ecb4b69d1011d |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/440fea81ec412b0f48aa35921e30aab196e0b1b7 |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ad139c657428587c1d7eb634df5ea0e59c4a9633 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/7de1194e93803e645a59a62b0d2b1945d4d97b34 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/62f7be4d52820921221479288c7b76da62646f3a |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ebdb925cdf50f95bb30e4bacaffd300d0e068015 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3938a013df12797119970c872cbac5d26013fa84 |     
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3ef503cde0a9a3ff9f99d9604685850db601eec1 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9fd402faf4cabe49419f632d0a7a82cbadc54593 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/561c9191bdf48cfb1617b8c0af7937fecd7ffead | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1f8eb29712888d9c8785754bb1cc051cde256bd1 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9a012a7ca5b1f04a2f4bf5bd60bc2b7f2bf45427 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0cdb5c0dcb9b99e2d9a01b48442af8422c3f20f2 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c699ef9b52bc63c642f92c49f1e03cba22d41446 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2b62788ddeece3e5ec6a6d1eab617e51d697d420 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8297178b52038663114e8dac12eae498b2149ba1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1b7db9794ca078b5b294fdb7ab1ff38f59c96f6c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c0f9e363ba270505b9f847ad76c79aa38fe06f02 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2771bae460aa0c3ed41cb862f9128caa2138fd36 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6a4c6046e8102193883879821878e37eea34b869 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6e1c286c999d5d70abeb6c7768bbdfe8dd179d8f |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/dc4524a7dee644f55f114bece183aa5332cde15f |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3f0e117f96a4fe0bd30fba03892107130138cba3 |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c731fe0e9bdbfce0823f9c48641f1ed710fa6125 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/20382d4f4022e08592aa395722cd9eefe0cd04f8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4218619d231afeaf6ed21949462984134f1fc84b |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e21827a2108e1cb854d16f5c6769b6723c518ffb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/52da8bceb42e9c615711e6a16d882b390a1365bb |     
   x86_64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/023dacc28c25a64aa5e5bd623213cc289ed917ae |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ead709687255fdcd5fc0f00b9d81cf2df609ef09 |     
 aarch64_be  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/3a368acd3c49474b9dec30dc0cadaa71070a5ce2 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/dc08c4be4bd2c0f02bc70b9b0b8da91e9cefa86b |     
    arm      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/8922efbbbfe79e8286a411acce4086b5c77c57c0 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
             host-gtest-1.11.0 | 2 
                 uclibc-1.0.40 | 2 
                    bird-2.0.8 | 1 
               poppler-21.12.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/bf1044a50e85da141c102e8c018ac170dc54f55c |     
  powerpc    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/5c0e7959a309c13ce29b46970a341e90c189393b |     
  powerpc    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/6c781805a9c9675812c57f8d59147fd274abdf8a |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ea3c564bbfc0803e6bf1a4523b1ee7f14166c292 |     
   s390x     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/ab2db547751b5d1cf4e4c491e01bd1d1da050dcb |     
   s390x     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/ac257d137813f38a00bf5117858f0248f8584c29 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/823ac64952df652c2bf40277734635db2c94c176 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/43ad71b40794a5abc2cce44eb4446736ee1c2d45 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d53af6b1022764516dfbfab4ccb402c03679252b |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7b0f6f5c2a01ca8690a42aa584d8fba61e9bbdcf |     


Gitlab CI results for 2022-05-13
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793619  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793660  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793661  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793662  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793667  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793684  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793703  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793705  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793707  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793711  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793713  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793715  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793717  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793721  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793723  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793739  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793741  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793745  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793746  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793748  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793750  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793766  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793768  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793778  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793804  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793852  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793856  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793860  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793873  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793875  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793876  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793891  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793892  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793893  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793910  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793911  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2445793916  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

