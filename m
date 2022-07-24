Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD133C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D60D40B3D;
	Sun, 24 Jul 2022 05:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D60D40B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQWTGLDSWUMt; Sun, 24 Jul 2022 05:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3B47405F3;
	Sun, 24 Jul 2022 05:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B47405F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 295EA1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4244186D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4244186D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FavBq-V3nEn for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:41:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9CB41772
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9CB41772
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:41:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EAF5C0002
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:41:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 05:41:39 -0000
Message-Id: <20220724054146.CE4244186D@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658641300; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QcXeh6Afh5+Oc4WF9TA+3pPLsBJFhs2i6chaR7KKwew=;
 b=XWrioWoxbizsn1G9/bQI+AowLqLjL6wz5cQWzsGxizYLpSicSl+SH9asH3vzcnbn5w1FJ1
 CvEseXwdbkhLeXMsQcFOfrZzck8SVSFmbRmZs0hLQLr6n5F3sIDgD8aqKaAJbAsb6Ht9La
 H1Ab3IeuCMgoYE8q659X5JzmvLjINxWti9DqSqe3FckS1LtEVMvvBx/blzBAXJpaLDjtWs
 yrfEhVT2PGgIqmNeLpj7JbhhiDNlcL+arMCRVhg2l/abkEAVVU2U8kTeHnA3/VAmYk0S16
 eNh4lSyfSXOC4WVG2hOr0s26kcDvT0z8KsR9jHqlYL5Iwry1m99YToz0Nu58cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XWrioWox
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-23
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

Autobuild statistics for 2022-07-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 10  |  1  |  0  | 11  |
  2022.05.x  | 29  | 19  |  0  | 48  |
    master   | 146 | 216 |  0  | 362 |

Classification of failures by reason for master
-----------------------------------------------

                    nettle-3.8 | 21
                   speex-1.2.1 | 13
                 uclibc-1.0.41 | 11
               protobuf-3.20.1 | 10
                host-go-1.18.3 | 9 
                 linux-5.17.15 | 9 
              bluez-alsa-4.0.0 | 8 
           libfreeimage-3.18.0 | 8 
                python3-3.10.5 | 7 
                speexdsp-1.2.1 | 7 
              alsa-utils-1.2.7 | 5 
              open62541-v1.3.1 | 5 
glibc-2.35-134-gb6aade18a7e... | 4 
host-pahole-73383b3a39afe86... | 4 
                     refpolicy | 4 
                 sudo-1.9.11p2 | 4 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
                   libnss-3.80 | 3 
                       unknown | 3 
                  acpid-2.0.33 | 2 
docker-proxy-339b972b464ee3... | 2 
         host-gcc-final-11.3.0 | 2 
       host-gcc-initial-12.1.0 | 2 
                  netsurf-3.10 | 2 
                     php-8.1.8 | 2 
                proftpd-1.3.6e | 2 
                   tor-0.4.7.8 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     aufs-util | 1 
                    brltty-6.4 | 1 
           docker-cli-20.10.14 | 1 
                  eudev-3.2.11 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                     file-5.41 | 1 
                flannel-0.14.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
               gocryptfs-2.2.1 | 1 
                      grep-3.7 | 1 
                 gtkmm3-3.22.0 | 1 
         host-gcc-final-12.1.0 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
              host-rust-1.60.0 | 1 
                iptables-1.8.8 | 1 
                jailhouse-0.12 | 1 
              jpeg-turbo-2.1.3 | 1 
                  kexec-2.0.24 | 1 
               libcap-ng-0.8.3 | 1 
                libcurl-7.84.0 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.3.2 | 1 
               libgpgme-1.17.1 | 1 
          libmicrohttpd-0.9.75 | 1 
             libopenssl-1.1.1q | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
make: *** wait: No child pr... | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
                    ne10-1.2.1 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
                   perl-5.34.1 | 1 
                    pppd-2.4.9 | 1 
                    qemu-7.0.0 | 1 
                  reaver-1.6.6 | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8723ds-76146e85847beb242... | 1 
       shadowsocks-libev-3.3.5 | 1 
              skalibs-2.10.0.3 | 1 
                tinifier-3.4.0 | 1 
          usb_modeswitch-2.6.1 | 1 
xdriver_xf86-video-glint-1.2.9 | 1 
                xenomai-custom | 1 
                  xvisor-0.3.1 | 1 
                zerofree-1.1.1 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c0a852420060b0994a810777abba6f67f93ee171 |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/aff4b5c23f7478aef2393c4178391f4e3b37cd68 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/49443754711cfa6c1a10b65a1fc0f4849f93605a | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/7a6297debe32c808a9c4c00615fef4b884cee678 | ORPH
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/67dbfa8645d7fded7ed2e6166bc3d2f526ca8155 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8c46ef8b04eb276573928e8e54b587ffcd417bcd |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/00a0c02f90501fe1bbd020a11456c5878f03c011 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6a222d2bead0597e0bff715a9321afa495be12b6 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ba8c799d09356c0e0e6f426fb74a14f76ac7f3d3 |     
   nios2     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/853e83de8ff7d563973aeb1dfa6b98c5b8c7d1e2 |     
powerpc64le  |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/e1712fa9f3d149f4c307e5c9749f2861ba93b8bb |     
    arc      |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/45f435699455da06beaa234beab2c89edd36ecc5 |     
microblazeel |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/5f2b05b751c9d6e7dd38f0af83c44e42acd513bf |     
    sh4      |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/41f077b7420b7a3f026295f3fbdc475329d4ceb6 |     
powerpc64le  |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/09eb121a09b3d4cd6f9bc7bc21ca8b55d919c734 |     
  sparc64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/02307ff529ef1b9fc85a39fc8c9eae7d9020895a |     
   s390x     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/07c74fe4942f919d7189c66ea768081162ac5632 |     
  riscv64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/8ba0a0a8b8918da811756eedada5dc0bbbf4900b |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/85813c537b67effa06e3f54d76faf262d483c25a |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/39cd0b19954bc21c6463d80f3c6e80d8db7113ea | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e02c30d84ed363da252799144df90785e04d227a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ffcffecedcd4e600c3481609813f27de1d8bbf61 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/50f8b27a036dac3e8ccf032ce3508deac1e574df | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5598b5944c5b1c473b42bf00a5f10be730fd8846 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c1b2f1305a056ae9321148234f290f4df621aaf2 | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/46eb87bc69c6685f12a29151d10dbefbfc229e25 |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/5763858466820c30cb61303c8d39b841e3530bcc |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/02f10f389561e3dba1336522625aa53bfb7923a7 |     
    or1k     |          eudev-3.2.11          | NOK | http://autobuild.buildroot.net/results/d0cbf0b9943d01c5e0ec7ebf9e46469f5680cb4d |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/52465b2c906c608a10439e55419ab1908dbeadee |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/c202d2ea7ab4d14d0a43a3dcee3926f57d9f124c |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/df9704253fe51d1daf32ce802b498252663a4a8a | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/b20cec7bafa281a7a6c69352158ce14679894eef |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b014fc69c8e95813e0f36e6441ac366b63d7817c |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/20d65366d31883a5880b63ad7f717362c15e8055 |     
    arm      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/f633277aab10bef7273c4dc5ea082ca23a9e1209 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/8204506e27261a3f8966d28047d931ac7dbc8339 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e8e14290ed762f5f1ea04910187389ef640b9ac9 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/264829d86cebba298ead4b4fb854df3727f00b96 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1ee586f37580dde6be0c49019e38b0507024b263 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/08af23e08a3505f9ab08945ee04ad238d334057a |     
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e9e6e2531b8820d92b95741a6bbeec5287d0dff2 |     
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/3fcebd5bae93fe1a2ecfff4d84f0dff6067df42a |     
    arc      |         gtkmm3-3.22.0          | NOK | http://autobuild.buildroot.net/results/363a191f65038b94cfb59834d9f2922b37c3d080 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c02fce9c1d5371ce9384fe58b610b7031d564758 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/345d054c5c0818b0f2eda8772ab0726a8d162dca |     
   x86_64    |     host-gcc-final-12.1.0      | NOK | http://autobuild.buildroot.net/results/409a0f499773ea803a2073912ebc4af32843dc49 |     
    m68k     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/478136f2aaa883a0b8a7b96dbb3763708f90e2a2 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7e4888626934ce40d4b61199b73f19f90e23e269 |     
    m68k     |    host-gcc-initial-12.1.0     | NOK | http://autobuild.buildroot.net/results/3dcbd8a36c2fc3f90606826649548868ff41d0ee |     
    m68k     |    host-gcc-initial-12.1.0     | NOK | http://autobuild.buildroot.net/results/86d98966ed0c8f4acfe5e7baa98af5e10d57b892 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/67ae5d789331232d1f9d51e927872043fbb1e1d7 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a4f678177b4ba071819c31975205c3236f5b82ab |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/762c679f32fd205b6730124e2397f62f1c71ef76 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/12f56b0f06cf041bb350361dc7dfa7f430be0cc4 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4d31d414cdf16d464f993f373a5a0a82af384719 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3313940d38856fa0dab6d78d4408aec771115206 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/176145f0e3ece0cf5351661d65b4559e9aaaa672 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7ddc6360039b7fbf8213fb17cf3e28f90ad6e61f |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/958fb4abba81a13aa5718ef6a68d7e4fb7dca212 |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6192026fee4e7845f6fdb4ec1f41d1936dd6380f |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fe10af68d24d0658eb084cad473cb8d994cf93f0 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/631d41c388e6052df2816b60c3fb24f04de0b928 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/79949301104943f28a6cd6313d7a508b79e1b497 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/7ea2d1dccb61e60951dff7f46f6161430161b7d8 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/81874150fea6aa2da0b96a6f668cb84941377022 | ORPH
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/9c7dfe6f1d5766bc723c6d1dc541ee9347b87aed |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/e8875e7a0a30ceda9964f6a907e6dcdfa5b0d461 |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/cba059f6114c0ff0502faeaab0a49eac090c58b6 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/12af0c46567fa8cb47fbc592f5adb8079e3bf6c7 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/210d013ee47a10aad6125539dac3787ab53cf961 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/7785934c1eb8fa34b4af7f71bce1d325a795b0c9 | ORPH
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b50b70557d3d5331bc50db6dbf8a76f31867592e |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ec8bb416018a6ca1cf6f837d7410faf31cd790d7 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f7664cae1d3120cbc34cbf18d8554a8d837998d2 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c9b7ed8003a965ffadfaaf33e2b53c321b1e3c98 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6b91309abc43c94e34213aff1d8229f4cb4ba92d |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9f45f85bc426ff5c7265da115d8d27769536f0f0 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/719cbde668ca51db9d84e641196eb1835c686f56 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/63cedc8e2355fb3599e77e810d16eca557f96f1b |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ce098185ef0f168a628de8e07b2dec9cc3e51c57 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6a7be67fa02c21ad9227442c861d2cf8f808e606 |     
   mips64    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/b7ebc0d1753973d587574db3832edcfae9d65e07 | ORPH
  aarch64    |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/213d6f05f250e355ee807c682940442f9c987101 | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/bdc0d4f1063f668e2a55a676be73a70c97b36a26 |     
  mips64el   |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/c46dedc6e0f861cd42d44b9c33741f8f03035e69 |     
   mipsel    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/c5b440bae5cd6dc6d5f1a632a6b5950b32d13f66 |     
   mips64    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/adb336f5d899d910eef69f470459cb0e7181c898 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/59cfee0d5a33042b15ab2a76be43deb16cf659ef |     
  aarch64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/d87c565be379fe9bc3a3030207872176500a2b4a | ORPH
   mips64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/d7caf528f7424e70e78b4f34767d286276910214 | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6b5e88fb735ea84cfe8e3b3d73862371c6e63198 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a8d52fd1438b71b2d7c8d5a507a69151f42ac51d | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/66c683e6126c1f631635d3e58371b87e4f1e2f36 | ORPH
  sparc64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9c023fbf233696e19fcaf3a8fc1a75bef375cfaf | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/69ec50c9e71c9194a26a9f7af07e27d44be7bbb9 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4eae5d3b0bd05d5df58635643b813c0f3c0df579 | ORPH
   xtensa    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/178a2a6d936733ca1824d81bc14b22a0eb861bef | ORPH
    sh4      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9e24f6dff33171c330fdca1467ba8f95896f24e4 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6c8c9ae777e8cdf24aeaf7366ede9c80d4d5b333 | ORPH
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/d798945d0dfbd33045e46b179225f5a84b3efd74 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/172bbed20d0276cf98a6a1c867164d9587491598 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4b57eaff518a9e535d0520281873469a8acb557d |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/72b9950089fc55c1a8f81adb1ca88d10fd8c8b11 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/487111809c5ec1225056dd2be9667ec0afca60a3 |     
 microblaze  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/2388d373173377fe7de7e53ece120b964287bc37 |     
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bf6dc432d0a82cf3d46ddec8729311795b60af87 |     
  aarch64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/a138fe78e5c0d73d0759fd2d5729453da34d204c | ORPH
  aarch64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/dccee93276764316be76d90cc9211c3f165cf4f5 | ORPH
   mips64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/380a54f5c528fb077aa55d8bbb15d7f1fede1daa | ORPH
    i686     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/2204682c19469e7fc16dcbfde8a974136fccc3fb | ORPH
    or1k     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/8f5324d887585509bfda828fdc7af831e97b8fed | ORPH
   x86_64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/24e891b7c7fc109fbae5411ab3d3819bcb9bcea4 | ORPH
   s390x     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/e01e4e43a8b70f45c746368301b76171314e5694 | ORPH
  mips64el   |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/46c14412c9e639e492615512d59e75138d357c91 | ORPH
  sparc64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/b2cf9941f3acd934985c1e2009325b8ccec9fca1 | ORPH
   s390x     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/1f2f6c2c2452e0131c2fbda77c6dbaf4289cf91a | ORPH
   mips64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/17fb1736e559c5eb343ddfebf0a5fd677850ecb0 | ORPH
 powerpc64   |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/89157c4ac2176b7cfc9aceb272571a4dcd2883c3 | ORPH
  sparc64    |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/1141185b9abc7f6c70edb8ac7da9afa24cd25444 | ORPH
    or1k     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/ae1b7da70a84cd41bc2b07dce0a63f88168a0364 | ORPH
 powerpc64   |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/9b5415bd9f8cdeef3ad45f79a1169f2de6bbfa3a | ORPH
    arm      |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/a88ef10c71c75a744dd7fff21f12d973db2c2f8b | ORPH
   armeb     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/f33ba0e3c20922a2cf1bf5e76bc69d28806c6fae | ORPH
microblazeel |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/335ce16c0a564c396b7761aa540d07673a98061d | ORPH
    arm      |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/8c7b57a2f4beb02df86511f7b6c505e985fb505d | ORPH
    sh4a     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/c568c75dae6804ad7bfe31aa979d2619a2e4ee9d | ORPH
 powerpc64   |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/29d0c8b760522d28f3f4721294ca2d11899e51d5 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c60d7297bb12c93da66f4bf75220f2c33dfadde0 | ORPH
   sparc     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/1ed39efc285d4599ef5ed1faf8a14abb8defc7dc | ORPH
  aarch64    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/79f8ca1e0f1700ab906158f6fd63f7f29653c15c | ORPH
 powerpc64   |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/284ef620d3416a38d96d2e9d0d1e733dfe5c3ab4 | ORPH
  riscv32    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/8e03216ae90be0669639bc406d20df34c258c26a | ORPH
microblazeel |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/01378d8ab61f6487a9b08d103899275c778c8728 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d3aa3ceb89de960f799794e3016806ef92ca90e4 |     
microblazeel |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/bd5416ce20b39c053dbe929050d01810509c7d42 |     
 aarch64_be  |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/36beb536714e9f7a12a442d461bbc0af9df5a7c6 |     
    arc      |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/27b290a310f2d1b3883dd51de90a987aa52da162 | ORPH
    arm      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/f28a06b16c5b150908e5449b3a7c8137cd45ea1c |     
   nios2     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/fa657ee4f9522ae995c957edc500e7c7f45d860c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a91d7ae1bbb04a2b1d312dc793c507c22c520dd0 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ea74dd3b39697509e5e6f9bab1b68b54aad54710 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/03792141a471a790184dac26c438b3d18d719284 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b8155355a0916fd79deda74c0cbd91399bb3c68b |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/aa656969d95e5adb680e72e0a31b0b3a4bfdfb17 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/cc343e6f8fcf0b5293cb47c81f5bc80dc37e815b |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3f9782c61c5271f3674dbbd7e998d3448ff91445 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1ce80a25faa8ae16bdd922dc4015735afd31ac4e |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f426120fb6b1e56a752716897576ef54a643f7c2 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d37e19e6dfc22093a8c0337eb0dbb62157b8a315 |     
   sh4aeb    |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/0fe0ba90ed179e03e9fc7dba02e0c42497839383 |     
 aarch64_be  |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/196e750560107f2c321b5622dce64b1497a35210 |     
microblazeel |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/37bebfa7405972144712e9502d10dcfb2077d2cb |     
    mips     |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/2a489678848cec05130b2d6728d92c363be7c453 |     
  powerpc    |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/4940d511d5227335ea2fe1c3f005fbb78d12aaf9 |     
    or1k     |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/2d2b5f6bd2acd9617ea6ae12f691b14ce9559baf |     
    i686     |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/ee72fc31ad020767a0059a9911b109bb5870da49 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/bfca90e19b2012c218cd55dfb3b9ac4998e4f238 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/6a97efe212f5c134980b22fb7fd780df0f7ee9b2 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c42a65ccb2d782d498e336f2d14b1888ae64b762 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c8359b7cf50a4124d52fb8c4702300d6067af77f |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d1bac1fb3fad84529ffcea55586d415cb22aa378 |     
   xtensa    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9bbc8328f33fd38c99ea31867a9509428f6e154a |     
  sparc64    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/bdfe26cdeae6a9b18833c7828b24159aab3e90ba | ORPH
    i686     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/ef9eca5eedea18814a8dde498c50af4c6e57f60d |     
    arm      |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/f3ab8689c36dddcbee92b3b5ed6783840fe2d6f8 | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/8bcf0c9d3f1fab133ec69ba4391601f426250cd6 |     
   xtensa    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1aef9e61108f99e9a28b5073a38a6d1471074a4f | ORPH
    sh4      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4fa74818cac0315a40ed3f0a33b9a8f1c408dd93 | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/69a351a8c398ebe86ed88ed94723d14e506c985e | ORPH
   armeb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a831deceede3e8d3890d14011c7a9814db2b148e | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/02ba99f9821f353b125ef0eb65cf090495bb667b | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/816c59a30f01c85d44817be082bed573ddf67dcb | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/21e6b13bd061f9b69540ac8fc96cfec3580412d9 | ORPH
    arc      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/42d75e0cffe0233a311f3f624e295a80e67eb037 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4902ae294da8717482ccf432d24ed29c3e06d97e | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/85bed3c089993b98b8a46ce76d4bca0c7944a9b4 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2a72f122fa748aa8134b4e12ae8f8c154a251741 | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/852499a8ce9bff6f2ce35d0023e712085834aec8 | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4b021aaabb8853fa045b02c65bfc9b1fdd395440 | ORPH
  riscv32    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e3970ff18906241b128b8600b169a0c37078bc44 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/62928b59770e36008fb797aecb3fb2a2293aefea | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/566b1e4fa17d31d930b23e8bf1c1698d102fc827 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f901503edbc7d38674e3a2481289bbb9bcdc29e2 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/849a16e631f106c3ee88d12fa43d8e41203954e8 | ORPH
  sparc64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/018eda086f4d73b6415255479472f9ea449d21dc | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5aca9d45fded9ffd5361523ba670f34326eabda6 | ORPH
    arc      |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/5f6ae802fe6adc33562cbe228241779450212e30 | ORPH
  mips64el   |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/b25f921c9d6166afd1c0a1f49040ddeef21ac4a8 | ORPH
 microblaze  |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/dad6a99569f83f21e973a267c8d9bdd6a1b3d8c5 | ORPH
microblazeel |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/6ec530fa18fb6079397dc6de7d12965feb51b9df | ORPH
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/5e74f8932fff201869b70a80388c3091f8018ae2 |     
    arm      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/60408bed36a961122f864ddf37e1297577c8ee53 |     
  powerpc    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/2318c9dd347bcf6cffa384ef01a1e9871634a7c2 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/89e13097dab0d2df89ee30e3bcb537b582873cb6 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f918f87777dc801abf27d7b25fb5d94f414ec1e6 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/14d1f40502d8a24727f4908254115f3570f8acc2 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7bc3845fbc130757c792356e7ff4c0d76941598b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8bb4311ba8a3eccc3dd901a355743f36021de287 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a8c2352c3b02b2fe63d3753c3b9ea1bbb57d87b0 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fbbef99f2d01aa57f07e409b6cd1c1c471ea2889 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9573d96a0a57f064efcc21da7697bdf0403e29d3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3703e98a479f6ad9a3a8ebb3a5f742cb15b86b37 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3af324a10eeed5620265cd942b60c2cd6cbf52a2 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/abe084b223bdbc570fa10c128012a9647e6732c2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d5ec957699131ae92b38d44959e576bafc9fea09 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2893c213f49d37a0878dcf14ec68ef991471c70f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1590b07c7cc298e8b701e74c4c3b057d4ed97258 |     
    or1k     |      usb_modeswitch-2.6.1      | NOK | http://autobuild.buildroot.net/results/1edc2a029fb1e442a55409b8b004fc9494f175e8 | ORPH
 powerpc64   | xdriver_xf86-video-glint-1.2.9 | NOK | http://autobuild.buildroot.net/results/f9d650ccb4173085cfc8873f1e52ee56caf982fa |     
    arm      |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/8d759644c06e98dd9dbc7dd836277621d2411386 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/aaaa851f6586330d78acf79e8d54a19507799264 |     
   armeb     |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/8be4c7a6fc44deeceec0711971d2dcfd4d210b61 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8260762632cde9eb5bc2154084680b5bec034aa6 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/c69642af4f18116769a7c5bb90de8e1a1d2a5da6 |     
 microblaze  |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/7433a2ad111e2f014c81f196d3d1e2f63dffa858 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3252da1915db68d67bed48313737ae717c6a2302 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                       unknown | 2 
               acpica-20200717 | 1 
              containerd-1.6.2 | 1 
         host-gcc-final-10.3.0 | 1 
                host-go-1.18.3 | 1 
host-pahole-73383b3a39afe86... | 1 
               libcap-ng-0.8.3 | 1 
           linux-5.10.115-cip7 | 1 
mali-driver-a742530232d1de4... | 1 
                mongodb-4.2.18 | 1 
                   perl-5.34.1 | 1 
               protobuf-3.20.1 | 1 
           python-orjson-3.6.7 | 1 
              swupdate-2022.05 | 1 
toolchain-external-bootlin-... | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/77b0ec07545d2162dd272b8635ae77bc1e0c62dc |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/5e3963230fff0d9b0ad7a29798a1cb1e4e5ae636 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b9a780520156df3ca54084f304d23be8c9df833c |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7b40b85b57ccdcf3448d648a3eda81f38943f4e7 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/94fc30962573db55570fa39f7911fd53f780dd0d |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c5594aa52ddde2eed5b03e9468803b1892f3522e |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f8ee2e04712e7755e6dc6a9c8b2bc59a4747e539 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a856eeacf1bb5da0a880aeaa094ea68fe860c6fe |     
    i686     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/40873fb823b2a1b904d1619a6cf17ab19874ccd8 | ORPH
    arm      | mali-driver-a742530232d1de4... | NOK | http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b058e9c4fa33378d4c6f6c3d7e149effe39b7f7f |     
   sh4eb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/457d37a986975a615b82e4cfac7470fdd8b99a76 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5b0c22af79e5ddc5ab6418c36876fbf6db5fd525 |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/ffed12e9cd96a7142c17ad88a2b97cb290522272 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f68f64559380fbd9fe9a93d1b6117643c6de84e6 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/57c186b67dd3571b13c66a44756ae69d41fe2f5f | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4cba4ffa13ccc3175168eaa58d7eb1be8c3b57a6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/503b8e732988bed339ea1d1309a3e138390f8501 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/452ef4083e3cbce73c1e683d87607742f621ceac | ORPH


Gitlab CI results for 2022-07-23
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

