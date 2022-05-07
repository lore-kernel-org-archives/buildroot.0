Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133FDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 04:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A98D405A8;
	Sat,  7 May 2022 04:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLiMO2SPlJ64; Sat,  7 May 2022 04:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2FDE400E5;
	Sat,  7 May 2022 04:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 541F71BF25F
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 04:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA30829DC
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 04:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McODfwt73GvO for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 04:49:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C489982848
 for <buildroot@buildroot.org>; Sat,  7 May 2022 04:49:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 993574000E
 for <buildroot@buildroot.org>; Sat,  7 May 2022 04:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651898981; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MdwJM9c3TsiR87n9I5Q8dDEW6OAXQu6f/gdRgQ99Jlk=;
 b=KRFhUXVlPdPTS2qNLH/pNd5kFTdMS0u7l5S5GsqOXi0t42OwHxxu+pnf/oiqASgY3QKIxk
 PfPqDksj/wy5aHdsKrEg1WdPk6/rppTKZYzd7xI2JNReTiJcMPi3IkiJOSG8/+yTRgpSk9
 is6wpf+TigKOZTnYgYAEIDMMm43ASTPMLM8MPXi1LeG37ESs9bagCks/Ig6MtLB/+R3JfT
 EgKEepfy1IqqpSCiqe5Yd1DMwGqpkeMAIO5ZP+SQhtM87yOcgE+uSIOzMRYtw8kAs03/IJ
 SSLQRzlGvp1HhSjtIpkzeuwXQNzfxiTK/m+uZafTG73vFrAorYn2wxgn8cctnw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 07 May 2022 04:49:41 -0000
Message-Id: <20220507044948.3FA30829DC@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-06
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

Autobuild statistics for 2022-05-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  6  |  1  | 29  |
    master   | 205 | 279 |  0  | 484 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 27
         host-gcc-final-10.3.0 | 24
                    git-2.31.2 | 12
                 linux-5.15.37 | 12
            qpid-proton-0.35.0 | 10
                 uclibc-1.0.40 | 10
glibc-2.34-109-gd64b08d5ba7... | 8 
                libressl-3.5.2 | 8 
                pciutils-3.8.0 | 6 
                    bat-0.19.0 | 5 
          host-gcc-final-9.4.0 | 5 
                   perl-5.34.1 | 5 
                bitcoin-0.21.2 | 4 
                host-go-1.18.1 | 4 
             libopenssl-1.1.1o | 4 
                     refpolicy | 4 
                 zlib-ng-2.0.6 | 4 
  gobject-introspection-1.70.0 | 3 
              host-libcap-2.64 | 3 
              libgcrypt-1.10.1 | 3 
                   libnss-3.78 | 3 
           libwebsockets-4.3.1 | 3 
           linux-5.10.104-cip3 | 3 
               protobuf-3.20.1 | 3 
               aircrack-ng-1.6 | 2 
                arp-scan-1.9.7 | 2 
                  bcusdk-0.0.5 | 2 
                  cpulimit-0.2 | 2 
         host-gcc-final-11.3.0 | 2 
              host-rust-1.60.0 | 2 
                   json-c-0.15 | 2 
               libglib2-2.70.4 | 2 
       linux-5.10.104-cip3-rt3 | 2 
                    musl-1.2.2 | 2 
               openpgm-5-3-128 | 2 
polkit-a2bf5c9c83b6ae46cbd5... | 2 
    python-cryptography-37.0.1 | 2 
    toolchain-external-bootlin | 2 
                xenomai-custom | 2 
                    4th-3.64.0 | 1 
               acpica-20200717 | 1 
                alsa-lib-1.2.6 | 1 
            alsa-plugins-1.2.6 | 1 
android-tools-4.2.2+git2013... | 1 
                 augeas-1.12.0 | 1 
                  bitwise-0.43 | 1 
                    brltty-6.4 | 1 
                busybox-1.35.0 | 1 
                       cfm-0.3 | 1 
              containerd-1.6.2 | 1 
                   cvs-1.12.13 | 1 
                 ddrescue-1.26 | 1 
docker-proxy-339b972b464ee3... | 1 
            ecryptfs-utils-111 | 1 
                 freerdp-2.6.1 | 1 
fs/btrfs/btrfs.mk:55: /nvme... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
            ghostscript-9.55.0 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
                   gstd-0.14.0 | 1 
        host-gcc-initial-9.4.0 | 1 
host-google-breakpad-c85eb4... | 1 
             host-libbpf-0.7.0 | 1 
       host-libodb-boost-2.4.0 | 1 
                   i2pd-2.40.0 | 1 
            igh-ethercat-1.5.2 | 1 
                ipmiutil-3.1.8 | 1 
             iucode-tool-2.3.1 | 1 
                  jack2-1.9.20 | 1 
     kvm-unit-tests-2022-03-08 | 1 
                 libp11-0.4.11 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
                libzlib-1.2.12 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
               lpc32xxcdl-2.11 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
                 mesa3d-21.3.8 | 1 
            mesa3d-demos-8.4.0 | 1 
                  mxs-bootlets | 1 
                  ndisc6-1.0.5 | 1 
               pcsc-lite-1.9.5 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
          perl-net-ssleay-1.85 | 1 
               pipewire-0.3.50 | 1 
            pkcs11-helper-1.28 | 1 
                   ptpd2-2.3.1 | 1 
           python-orjson-3.6.7 | 1 
                    qemu-7.0.0 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                    sdl-1.2.15 | 1 
                     shim-15.4 | 1 
                 systemd-250.4 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codescap... | 1 
                   uacme-1.7.1 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/d183fa15304aa84fc423431f39d9f580307a7f43 |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/aaef302a5d613af07d34ddee4489f97d431f4614 |     
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/34ad6c880f161bda7d3ebe18a5f2590baf74cf82 |     
  mips64el   |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/cca0609443d0342fa36e466c7d4769aac9da0ff1 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/f5b9400566eed4fc252717fd61878de778b89d0a |     
   mipsel    |       alsa-plugins-1.2.6       | NOK | http://autobuild.buildroot.net/results/aad67c929ac3b0b597529a1bfbde7f6bcc0ed3ac |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ba3006a89715fe45129dc8afc0875fcfdf9dc12a |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/96d8955790d3f0f35bb4e7182774b551cd0c1921 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/7da4807141fd2e3ee56d48ab50bdacccbe36a928 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/652346bcc7d7b1d0f2cae6db99ece12f2fee2ee7 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/30e38c1d7e4a2b4995ba2eff50db9df3c1478123 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/086daacd2c0206dd2ce88e1032c1d1f0d3bee914 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/72d06a9c9080e765a79ca0aa753b2648d1ee7b71 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a4e314a338e0969d9602a973b979eb9eb089634c |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a111128609cd734e719bab824640b85d6b51a285 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/68cebe1ea545ba13d1d568797c94cfd906ce66e0 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/62975099e70869c3ca1a10d861a4b98aac253693 |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/845852f47e723398d661c6ae014dd1ed81e8d9af |     
powerpc64le  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/80c9de1f9e7b205573f879fbc42e5c736552459c |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/3748f28421771adc373d8d2bb189addaa4194da6 |     
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/23ac4aeebee96845f127b6fb5a891fd09db108c7 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/ecf2b706d51cd81eba4edf0cd405fa0eb0ec7ba1 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/e19c8ee3c5f4f918e180983581c6f6b320e1a2c2 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4f26e2850a4ff2eb2eba04c89714c01dadad6cc5 | ORPH
   x86_64    |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/8d2c0b14a4a2cac73bf979cfdb1c476c43b7220e |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/493e8cf01523e18ae2223d2cc9b5bd621db33f81 |     
 aarch64_be  |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/55e1af96f01a0786b4a95665736453db72be9c13 |     
    arm      |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/2e50face429553a6431ba5e8cda9527e5c876699 |     
   mips64    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/01f86065b7ff158c156511c18347ac28a1eeb77c | ORPH
    m68k     |         ddrescue-1.26          | NOK | http://autobuild.buildroot.net/results/a47c6c617bbdc658480c1d0356029f67f0ce6a1a |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/461ab0560e909e1a3b2c6f26252eb733a1a4ca9c |     
   mipsel    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/f482000d433c1748c597935ebfd9a484ad796f1b |     
 microblaze  |         freerdp-2.6.1          | NOK | http://autobuild.buildroot.net/results/7cec46d5b2076254e0239c51cab388b3a4e9523f |     
  sparc64    | fs/btrfs/btrfs.mk:55: /nvme... | NOK | http://autobuild.buildroot.net/results/0a923f5848f54f28e42f134422caaed27430bc92 |     
   s390x     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/aa87d39711a8c33c0d417da59562b1bb456fb2b6 |     
   sparc     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/f0973c229c8b12a9f7a87f087c8d7ca296eac933 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d161a96cfd3b9c34d30e2289d68c33d5c300cc9f |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c4e7a859743c8775928afbe0f85da7518861e002 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/030d07346293d472fdc5278e9af3c4b48fe55610 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/7a9020403a186bf3f25d8225af0b3d776891dc4e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/755bdfb471129b44b83b2e3921415b680cd377ad |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/03a233cfadbb567d1dcd9aad7c41e694c4bc3e8e |     
   arceb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/e449be444394dd9bac9a52ffedb4a95db2786ffb |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/66c860d477e55ec23dff0772fceefa8a1aa2ae4e |     
 microblaze  |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/387da49d0131579507045b8d503e51e2871bbdd6 |     
    mips     |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/6c1685e3bba70391848125574c9c528b53909935 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f68c681aca0b64cc857bbf87034a95195b415427 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2ea6f0506d62cbb536bceb732b9ac62782e66b0b |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0397d2801656afc51a38d5824031a5b97db4ddae |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/50af73a089babe58554e556908b247b2ae1f20ac |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e72d687a41227d41b3c8cddfb8832302e90964de |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/bf778613a18253e4bfa2dd857410a667f6ab3772 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/747a5331751f688290572f97843b6356094b889f |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/22dbd2a1d44aeeba570256d989ab55772a49761d |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5d950162ac06967aec3c74f3d50cb0c3ffc77306 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/be455889bca330cbb7b13d7aaf19ca541c1b4d5b |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a45ba7ddcedf08a598cd742e478c5f4d63266386 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e0361f19a5078318c32ba59584db4dd6ffee9f64 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/450ab5fc96d84c0ad2b2fa79eb021bbd81dc6b65 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ca9ae8407e7004fd9b6787a1bdd6abcb39b7f381 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/36b283579488da292cd2a643a17102b87e00cf45 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e6e0a70ce55e08169780c9a4d708b4c79f44120f |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b3788a069df7d7a5425531503abbad9077216314 |     
microblazeel | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ca97030b272168f5bde36f9a321bb5881ba79dea |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/06c832c1bab3cd10f5444a1649ec9c835f3ee5bd |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/163f20e52d368a2aaf251b2c31d1f621825c8fb2 |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/28ad51dde8cdb39c3aaeb305633a68286c43402e | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/de7a693c0d47367223fc4aa437763052b9cacf94 | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/7d1da60bb95ce38ca0196009478b692ceecf9860 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/794f92cc2f9a9b691d4834ba76c9adae3a211426 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/235b0a4b5e3f4b1e8457523e9a59752004a8335e | ORPH
 aarch64_be  |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/7b070bf95d6876d02e4632fdf1b5a91e2f98ab81 | ORPH
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2b90e35eb90c45eb6241d7e31a073487192fe9fe |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9d1547afdd91ac9010b6f7046632d56b41b484f6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8ff0eefe4ab9f9a37616864fd4fd1d6ef77b6a4e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e1b16943eaf013a2503b19854f957c44ce16a2b6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4da59af8193376ec893321c4c2aaf1d25598502d |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/52f738f28c83a6b11e0447b219cabb0f3c3e65d1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fff7f54a848316bb86a1eda5db9f8a87caf1add4 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3c1234e356eb58939ede67c17c83bff237cc13ba |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/94c495957b3715b7e9556be14782f7735b61a396 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f6be08588415cb817ce28e55811859878e0a8a7e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/efdcdd1d5b0b1d3713151a4f58b1cd00a793c415 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e143f2a74526f5ef9f8e53c33643805179bf67df |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/97e059b7af28ad4c2709c7538bff7a82ec48f413 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4ce278e3e7b8a85a030e195ce71041f2a51d0608 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/518bcadebf477c603d4c2c1d76f30ecc3f702dbe |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3101d73d7de2a1460aa8ed1dd4c173115f82cd87 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9a8d4c674df4755d409fb91e3706c9437a47094e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/40e64c63a290c27b178bc5fe4d1f6be55a5f5286 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/10211e5c102aa6d1a796e3b85c371423aa078620 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d1edfef829f07b69bcc8704b6088a951971a5d46 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7b8808b6db37c41b2430c86f3bcdba5f5d36f8e3 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2bcd956d5f8c079eadacebc7aeb90a2b95ab830f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/38a8dc424d097e88c12b01626195fc20acbd397f |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c4a05f9b46a5034e1bb1060cb8dc0b47852feef |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3ae8b011e363a40b9583db0220d5d4681faf4038 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c2e7360d4ca0bb79c788ce1263ecf5e207927572 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9e70a6076e9d523bd709e704496daf68f0cd69bd |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a568701270ae67cd165787a04a424124c5930bcb |     
    i486     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f1afc1a93d677df48468163dc9d3049b60b39b48 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f9e0a09a9d9ef5b6a628ec76fcc2111f2e7a64a0 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ea334d3acdd3cbc797ff93f041b046f131da3169 |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/aaf81447dff61066efb1ff9c8ab76b49161b88fe |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/1b206b65677714d2ff50d4980df3bf638ce92a66 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/41de4c0fd57e90dd3197344ac30581a1e797ca59 |     
    i586     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/e97ffeb4915c0a0e5431964270e328e4d0a952c0 |     
    i586     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/73f695b9f703398b5f4d43dfb4942e5c807cf04f |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/575ea344610f13cbae3740ef891182a5921bc804 |     
microblazeel |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/45a5b115727b54a7d05c9753070540f802e7c7f6 |     
  riscv64    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/bf61b8713e2b9eacf88261d3d67d69a03bab4cfd |     
    mips     |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/317d303cf6c9613ba0801feef29d0324d2367fc0 |     
  riscv64    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/f1f080ea96fe1a134cf01e85e21c871994e01b7a |     
   mipsel    |    host-libodb-boost-2.4.0     | NOK | http://autobuild.buildroot.net/results/11b5bddf135f0b3988767fd8ebd0ce47c2e3c053 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/538177d74526e80627ef8dbbffb2a50ca06daaf3 |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5ea2f87483f49cd9416e475faa713a74c3bd66b0 |     
  sparc64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/8da524dda4a548de9b006ae156fdc582b0cffd47 |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/0a3a8bc0bc2ec5e0f831221de588acd83f5f9d0f |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/ea397d33213833cfeaf0e2b5fd2471cc32089622 |     
    i686     |       iucode-tool-2.3.1        | NOK | http://autobuild.buildroot.net/results/5dfdde3e9acba2b9b8b126ad9fa094541db386e6 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/32855164b7007d1370b86d546fe7265e5790cd11 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/a963d674a84523dd244aac3392d43c3da28e67fc |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/672b4ac8df1df5e20706e8f4d52f0d8af7ff4b7b |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/79d6f50d2cd5616e549c1d18444e98d86eccb6f4 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e0d19892d0daf9b9cf13be997b2e287aa5b18e88 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e36c1a52dfc72f7e3cff77d19b25e51555ff802c | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b2d5a925dbcd0dd37607421bc356096bc9949ec0 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/5631db505d1400f129f05a3f1dbd432252440f90 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/a5d6d9c836801efe7304598a5f1ed5e3ea063256 |     
   x86_64    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/ff2631b105fef3af3ad34c33617f7e26ae848a84 |     
  mips64el   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/54e03d23c998e6efaedb61c9f7ebfe532a2b46c9 |     
powerpc64le  |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/5b0d4698e29318f7c283a805038a1fcd021d752c |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1ea57bb23fcaf0de9a2d43a1f8fa259dabcbfaff |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/8ac5c1d7c216878937b2e840c5e42e074840ee83 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5d58a9f6a79c45cb7fa5386f24df442fbf3a7ea1 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c0964e3e10fda619ba2ac91fd7a9dfe93eec612d |     
    i686     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/a64483edcf9fe31ee33cd037433a460dc59b2b20 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/0de5925206387bb88c533fa0ca33d2c6926a50d0 | ORPH
   mips64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3d1b79203bf720bbeed1c8dbf6055fa725b13108 | ORPH
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/f11f1266cb6beb923bf586e9f4bc8f8a27cdb67e | ORPH
    or1k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/00c6ba90cddea3f3bcf05246ac83f221e87f7e14 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/36a1615e1e68be558e10dfc83a68f06fbd7650fc | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/950c28511dac46dc09abb9070b42e3efcee7aa55 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/07e292f8a1a2a5e835179d987b4dd16225a3b6cc | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/ea9102f060248141aaa8ac1d2d0da8b62d31bdca | ORPH
    or1k     | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/db7abc78d5d594fb648657a0182097c06928fb99 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/8d8b6e644d155d535fea456b1ce5a6c4261b0c2f |     
    arc      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/7886f9f94a0cefd8bf7817f47bb0adbeabef5b39 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/79c474170350f00a92cd1336fbb26bac9e9bcf68 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/8e9cc02bce0a7e24bb6756ee4e5c1b5bcc615c5a | ORPH
    sh4a     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/78ed924158f6a281c713e7c55ec9dcaf1c4f3bed | ORPH
    arm      |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/92e516bdfd919ab888d476c93c44c39b35370d76 | ORPH
powerpc64le  |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/702683ceee3eb7ff590b7131d22cafa9d69e5d07 | ORPH
microblazeel |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/973fb37ab222828e9e246e116d67f2686af2ab60 | ORPH
microblazeel |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/975cceb22ffcde321557eb68c3c82280af553043 | ORPH
   mipsel    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/d6ca2c7877184c144fdf87c742f996f8806ce3dd | ORPH
  mips64el   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/ad67502f5b42239e8f4dc175e1a8e1dc529cb250 | ORPH
    m68k     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/dc50cdecab2c7ef3de053bffdd71f7379e7aa797 | ORPH
   mips64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/bd6b611ce6b74825949bdb150b1fa246ee2818e5 | ORPH
    mips     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/7b26ad8bb65ad0f0a86650edcef9b4809195b932 | ORPH
powerpc64le  |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/c137ec5a5385b002d72a26ac2f9e254144fe57a9 | ORPH
   sh4aeb    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/878eeb68c40b21357f017190fb3c8af25c0e63fa | ORPH
   mipsel    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/9ebb90f58df72f3cc2bc7447f747c48e6366fa84 | ORPH
   mips64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/acb4478dc3ddac2b80fa59fcf3bc06250859bd38 | ORPH
 powerpc64   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/98feff678db45b827f495fd5b79c80e40df52eb5 | ORPH
   mips64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/b540808104a3e036c3fddbea769b0b5ec5306016 | ORPH
   nios2     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/61345b4e64c03153fcfd8b88cc1707c8db3d2ecd | ORPH
   mipsel    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/56e1a02ac240df47505c57f462bfca3f8d9ca242 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/de021ddcd22720808d42a52474c99fb577a2d380 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/deeaf70b763cc6737ad976c64be2ceb48e9cf287 | ORPH
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/9601eec7322b54f2facb12bc7415d5f333fa3282 |     
    mips     |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/8c0dfb760f84757172d1c578700e6b963e259af9 |     
   xtensa    |       mesa3d-demos-8.4.0       | NOK | http://autobuild.buildroot.net/results/9ff24eb67f9f4f894a3e6ec7758f58bc033cff22 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/0715521ba68cab6fbe3d418a365e779d69f19aaa |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/4da34ccaa3f39fdb185aaef98238f3db0edf80fc |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/5c3193ad82fab8f1247ecc63385429b253191d36 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/6e0d9062a3c89d4f59d21b2f8d2acd6130f515ba | ORPH
 powerpc64   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/9c7763b7a2456b62821aeaedba51007cd496b99b |     
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/703fc76aa55064daf4f6556c40dcca0d83e3e482 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4d4dc52a59cb514d4d8f0ea3b899e4089bd9855f |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/743e7487cc019c53f2ba94f1e0704bd71646db47 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/734f6b33916c0d24e04a0936c58f0e11c56c6fa8 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d1148f08f9d370352c9e093a39e442d53be4b3c8 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f93b7e6be80debfd19c5b73b7faa265422f4a274 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/be2f2e1738ff6cf9eb17973237bc953abf0935bf |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cdaac118d840bdbec75736520b2224ed574db2af |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6d207dff8bfb0fb5411bd6452f2bffb7deab711d |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6866ecb10ea1ffea3f84b91ba5ae16b40050b4cd |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5618c914d562baf22d6a51a0f3592bf2c8918af2 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a6418a77bc9d82332bea05d48aff95e561bb3e76 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3f8c320ac97ecb27479267d7c254174826a8cd99 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3120d191b1d1307fc364a99d04f320fd8ab5c86c |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cedacfd6bcc7eef38dfd9441a9a31b17ff649cf9 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a5292e6c64e8dfc0f46fbbb3a39ef70431c9175a |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c7770a54706460f6cf0a59dcf51ddaebbc00d8f5 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a364d68b05fe93c7320c77b2825a830dadae1e0a |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b8669a8cbd8e261751f37ab02053e8a9c5b49a0d |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7cabf8f48f227bff1acc20e818cf50b294ca34d3 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/31d115d7c28e976989409020cdb2c7ce07567e39 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b6586f8934c6da49d2dd79b0c15b46b11f2bfda6 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fe686e9bb21ac0dbc535acf056f630c72299ad02 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/55e83323b46279e02282b6be0715e20641cd7062 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4f3d186ff65ee4509af031927f4b93c295f2a948 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6ee74f6cf87866ea39cfd6af29bbf96b990f46fa |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c85c3cd239b242ae69a746a1826eb50763f7c958 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fc3d2982099c1217452d43aedc741934735bfd2d |     
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1c0b59a6f944db31633460319211c8acff405345 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/dc387ec2e0cfec2976c13178eafdc7c497ef514e | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/f2c1bb2436bb510646449773a202b19878d1ab63 | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/592820b958b35722e427bdeb6e8e0fbd3b47a813 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/5ba6a7222733091467fcf02cab02ce5fac137d08 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4564f406d0bea8ea0b566d93152da39cddcfe004 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/5df43653dbcc5be39e292ddf17932dacdb042a16 | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a5e1674b163c300a812851765c2334e5145b824a |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/959a958f7b86b2aa17a5982d2ed884565eeb27c6 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/43f909da9e7638d4b2b8f17df7c52028e7be71d8 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b49f56975d9fd9992651d14b9314d541e208fb81 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c566b151cc5469f4eb260b3f292be959dd26b2ea |     
microblazeel |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/2900792ead907ad5cf444a2fffbe6ba2db71f1ba |     
 aarch64_be  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/5174028a156d2cf58f456fd4f124e205248a3d60 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/82bc3bae41c8f05130270fbcb2c36928de83c3a8 |     
 microblaze  |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/8e82fc6f180cd86b0a86caa50f41390a7afaf588 | ORPH
 powerpc64   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/bf485f7f311573fa41978afc050f1a9d7c6c7ffa |     
 microblaze  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/ec0a94ba91c8d7772ecd7451afcc30b4e4488989 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/760f51f4057b1c320091dad05e76c3eafbbc762a |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/00b1745c64f1c02a92345b756d1ce2a54488b87a |     
   arceb     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9fb63fbfe74a6f83e9297e59be219b49f58b8fbb |     
   mips64    |          ptpd2-2.3.1           | NOK | http://autobuild.buildroot.net/results/8e133cdcb2a20b98c126a39fea8e8e5a0efd19a7 | ORPH
    mips     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/011b58fac742c28f61a44cba7c80416c3c3ae747 |     
    mips     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/575302d88bef7e07a383459a726512a75e3c0b47 |     
    arm      |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/054801d9b000df2e850bdeda436f4e5d2d30e71d |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/b4c1454d46bdaa37d2dd3b34279c80a75b1ff91b |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5f0705bf87824d61556b7eccac6353e4ec0d6003 |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8b290bd90a5ad1ebd85f3761ac0338a500b5c335 |     
    or1k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/f571d6d1d2e51b141f13481caac2dac5d04e316f |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5e4ac21ecfb575955559ab71cc06846e82b8c64e |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/259ed1108dd864ce70e0b5498ceaebfa0aa51eb2 |     
    sh4a     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3c745218d8e1b2a78686e3a36def2d261e9bbd7b |     
    sh4      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8414a4ad23fe04c7bf9e59d0a32a64490699a1e7 |     
  aarch64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/0c9d5942732ffeca883b4a5efc69faffe4f0fee4 |     
    i686     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a1bd45ec6d435dc4468146fec0857fd5ffd331ab |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3ee681c3425328a6056d53cb4b483f05a1752c0e |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d3d2e651c0a13dd8b5e8b2e2084a1b11ac8e1776 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/48b33937e3ff515a5341d7ee99109a6aec255a4b |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/db79ded5edf8a43c7cd3ffb040a32b2aa3868aa9 |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/19abc220754e868cefdafc364c7ff1e32391717e |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/12b04e6e59350bc7da45afcb1af83ab160869937 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/48b7d2a1c9d5f8e75ee6a7fca66c5d42552984a7 |     
 aarch64_be  | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/8ac7921926ab48aeb95dc4ea20f3c9970094c71d |     
    arc      | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/38840901159c8eac72aed64216e8aadce2144bce | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/eeb2a10eb4f61a10d09ef4874e61de30770228b7 | ORPH
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/02b3620f8506c19189faf38ce6733de4f83fa64b |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f15abb1d9fb2fc23f2bfce96569417bba5d31b47 |     
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/22f4e104d89ceddbc5f56aa0e3ecdbb39e169300 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/fe5a3d58c9354a34eef473401cffc3b4256b0ec6 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/11b103263b236c4fc2e59f953f441865cba62af0 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2cf9a77bf84f8757c925f175f34d65086a6165eb | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e35b2045a0052424fc6f7905466c90336decfc37 | ORPH
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7ff7d426902010153b992f045ddb86ddb4cc7d94 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/25774ea83438a80348310cffbbcfa21137269a98 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ce7563b0d0ed5b1b5c210235076e50356bc0f1e2 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ac901f3bd1335e9cdf11e256755b9b835ed5b053 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b3bc025e3306ac2badd82b9abfc4d47fc4f290b1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a4b800e836c7f73d5411757be6ff1cc229c229ec |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7fe81b872c178dbcc292e8962f5742587dddb96f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/83dc362560293594f19b2e18bb76848909ddc56b |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a9c7625a8eac77a6926410f12b290dfe440df8c7 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ebef566ed4edd4a7778eb7280d16dea2f20e12f4 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cde89c9487b42e598c45a4f25e73a62a16c3d1a9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/24e1487c1b2ac06c2efcc2ad9d62d332c9f39d77 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c408b90f9bf8181abf6546875fb962edf40a0281 |     
  mips64el   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/08992bd0414b73273dbd994fe2b40d4b2ce4b942 |     
  riscv32    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e3ed1c4e34a13769dbf7c8c26c1a7dfafef0cb6f |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/b4134caf25bcfc6675dfa6ade548e3dbbbd982ab |     
  riscv32    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/39face35a616c9d772edcd3ce1b7b75e62c0ecec |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d156eb18af72e8ee52933945a4586e8caf522bd2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0aa0311063c0b397c980dfcb82c8d2cded0884e9 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9211569d4fff8a680f84bee8028ca113ce7ce907 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/be5cfee21acb46f6ec076c442124450701fa1407 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 2 
                       frr-8.1 | 1 
             host-pahole-v1.23 | 1 
                  jack2-1.9.20 | 1 
                       libuwsc | 1 
                 opencv4-4.5.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e2b3f6a4d5cff30e7b3d091a2360e6ed6a7b4751 |     
    mips     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/5f31411f7f13dfa815c5e8943451714d975939d5 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/f92d93c03ab097a6fbbb755089b820790cb7825c |     
    arm      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/a46c71f94612ed65a4ab2cae52b6ec65efb739df |     
    i686     |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/163c1f134952d349b8bfe081f4dc0b5b4df18b94 |     
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/6be4a50df5b6e0f32e63928d5bfc0a01b5582467 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/80efc8dd4cc66dd442423fee9c09c04eb481b0ef |     


Gitlab CI results for 2022-05-06
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876028  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876085  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876087  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876088  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876112  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876129  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876152  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876155  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876172  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876173  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876179  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876180  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876181  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876183  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876211  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876212  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876220  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876259  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876345  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876354  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876368  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876395  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876401  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876403  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876447  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876449  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876450  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876458  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876475  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876478  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876487  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876498  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876523  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876524  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876526  |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876539  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876542  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876558  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876561  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876563  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2415876565  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
