Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD08C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F3F60FC7;
	Wed, 10 Jul 2024 09:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtBYWchghTBQ; Wed, 10 Jul 2024 09:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C7D960E9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7D960E9D;
	Wed, 10 Jul 2024 09:13:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E30311BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C533F403AC
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zCtAtcDCpdi for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1FB04035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1FB04035C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1FB04035C
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:13:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C8724000E
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:13:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 09:13:52 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720602832; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fnq/vaCrQTlMPOBmWu4KjzwclSP0GqKfcYOfSbWNCH0=;
 b=DIi3173AX8sQnOC/EcB9qSzrxghW2qx44hEkwBgmrC3odOjOEiPMJgRT2+hD3h4fxY7d+5
 vUCbIBf5AgycMWCpMg0K3qD6UCUsV5a9LKcqKkWl+mwzm+eZdE/IWUapUEretazWIoOmm2
 6WlZdWdvxbkBFom+YChI/Nt1We6eQeWH7JJrqU2fiXhCbDhHDxlIQHzw1OEclvbkOhTirN
 mh7q2Zck3iBqJen5+H78C2sM6zA5rcqlFsqyXKb3u3Hjmvw9MmhmoBx+c7Uly6TNI4y9sO
 IXr02KwiiNkn9ZblQDvQH5/zlPMQ7xZYuLPrTSpgJCbJSkpu1jvQGJf1qW6zug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DIi3173A
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-09
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
Message-ID: <20240710091352.Us4XtrTSDF_2le0GRWBKE7RD6_3nqrP8oEmS5MZoa_s@z>

Hello,

Autobuild statistics for 2024-07-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  6  |  0  |  8  |
  2024.05.x  |  3  |  6  |  0  |  9  |
    master   | 75  | 312 |  0  | 387 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 41
host-prelink-cross-a853a5d7... | 36
            host-cdrkit-1.1.11 | 32
                libressl-3.8.4 | 20
               cracklib-2.9.11 | 15
                elfutils-0.189 | 8 
                   evemu-2.7.0 | 7 
                host-odb-2.4.0 | 7 
ibm-sw-tpm2-5452af422edeff7... | 7 
                    mpir-3.0.0 | 6 
                  libffi-3.4.6 | 5 
                 libssh-0.10.6 | 5 
              udpcast-20230924 | 5 
                     avahi-0.8 | 4 
                 dc3dd-7.2.641 | 4 
                fail2ban-1.0.2 | 4 
host-android-tools-4.2.2+gi... | 4 
android-tools-4.2.2+git2013... | 3 
                  bcusdk-0.0.5 | 3 
                dovecot-2.3.21 | 3 
                  ffmpeg-6.1.1 | 3 
              fluent-bit-3.0.4 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
                   host-go-src | 3 
 host-softether-4.30-9700-beta | 3 
                 openssh-9.8p1 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
brcm-patchram-plus-95b7b691... | 2 
              cache-calibrator | 2 
edid-decode-6f117a8f8c0e76e... | 2 
                  fbdump-0.4.2 | 2 
                   foot-1.16.2 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                   httping-2.5 | 2 
              libarchive-3.7.4 | 2 
          libcamera-apps-1.2.1 | 2 
                 libcurl-8.8.0 | 2 
                 libp11-0.4.12 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                   oatpp-1.3.0 | 2 
                python3-3.12.4 | 2 
                unbound-1.19.1 | 2 
                       unknown | 2 
                      xz-5.6.2 | 2 
                 apache-2.4.61 | 1 
                  assimp-5.3.1 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   botan-3.3.0 | 1 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
                dbus-cxx-2.4.0 | 1 
                  dump1090-9.0 | 1 
            ecryptfs-utils-111 | 1 
                gnu-efi-3.0.18 | 1 
               gocryptfs-2.3.2 | 1 
         host-gcc-final-13.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
igh-ethercat-f5dc109176400f... | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libcuefile-475 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.3.1 | 1 
                  libsepol-3.6 | 1 
               libvorbis-1.3.7 | 1 
                   linux-6.9.8 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                  mbpfan-2.4.0 | 1 
                  mender-3.4.0 | 1 
                    ncmpc-0.49 | 1 
                 pixman-0.42.2 | 1 
             rabbitmq-c-0.13.0 | 1 
                rocksdb-6.20.3 | 1 
                    sslh-2.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/188824ff8d6a8f023917c732113d96b15b27fbf8 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6f843a45a6d33fb62dfefab2490291adbf06aa72 | ORPH
   nios2     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5965ab0c8cb0ae9d21b23322ba494af776e65ff1 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/daac13d1d403884151bef79241de70b4da2c915b |     
   s390x     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fbceb6e0506509874680ffb149faf589e6fb0c98 |     
   x86_64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/40e0f1c3d0926c1a99032d25fc98c1be61bd3168 |     
    or1k     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/856ae1676639932484308d28a565eab4634f1bfe | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/26b41284be89d3c1b061e6b73583a0e7bb7e4564 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e3ec7736fa7a258f8c4229a7cf1615887a61b2e6 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fa51948b6da853652f8a7493774a32f7444efb0e | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fdfd7172d908af656565c17aef7676300837b7a5 | ORPH
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/6477426da28154669492edc694c846f91043dbc7 |     
   arceb     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/0841857145401a93dd7c11f16435bb85ce62140b |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1cbaa663b1e94fad2b191a2bcc62971d75970fc4 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a843f643959a58635f2c26ce5ce39f5793fab98a |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fe625ea3fcf151daf22525642b5d86e5e05d5180 |     
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2f63f778ebd367cd40541f1370ab4a21a4deac20 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/dd9359bb549d6e90b6a54784fb4fe4156a485bf3 |     
  riscv32    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/fb180e31cbf1929a13f58400538308f655472d89 | ORPH
   mipsel    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/6728167e59d332b416e1dd457c56648f6834dd0c |     
   armeb     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/6e83c56cee0743f6af7d0976e7f5249eb93bdf8e |     
    sh4      |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/540aa61f1def18342bec8de1ae054e058d7d19fe | ORPH
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/805c95ac62d36e23d06c64cc37af5dd4671643e5 |     
    mips     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/10df75e0e47a69c013557a7b7cac90fe2603923c |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/782efe45f1e587bec1a2d5528ffd3b4f96c17c8c |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9205ac10e849e85271188431cb2ef5611dffd943 |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/eaaef044298f3eb85bbbdbe0a388c0635411ed9d |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8b5be04300ed211bc1358a026bb866b565b4be95 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e0a7d12550d44d6610f6fb620554e6e9367613fa |     
  mips64el   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c86cab09eb2140265847cad9549796a7441126f3 |     
   sparc     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/b6dfde34715fd32df72937af852c555711835880 |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9c98f4a05cc40b237bfd83d52eceacc003655a8f |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/4581de2297d0b85ee2e23b45b8ff8c58b575b088 |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/2ee2e80720d7cd9ac46fb1e0b8da38058e3ee3e7 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0b3c32a879cbbf6942058029e151944a3242c4de |     
   arceb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f961cd0f9ff317f5a38ef9160210f7dc5757e9cf |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9620625e55029b2d15f05a93654791d51cf71316 |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/26d44a27cd89fd15dd45e1b35d29aadc43a2abfe |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d130332b1380e9e5d3665a8f16f4bbefeb06482b |     
powerpc64le  |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/faab89a7c4195c81800ce25ffea66bc81387c3d5 | ORPH
    or1k     |         dbus-cxx-2.4.0         | NOK | http://autobuild.buildroot.net/results/a3eb9ab62c90ddc2f505057689fabba9e0d4c5af |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/23764653d14ee84519302437c73e367ff5a972f3 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/39b291fba399f0154b786d883d698aa25af8dccb | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bf61f831d758d906c5c8763a621a07caddc9d9b2 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d25c732454e78b0af1fb59e6e9a331c9dcd2efd0 | ORPH
   sh4eb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/e794f351a68cd3cc2af2261241ea1365d44f76b2 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/ae08478d6e9f7654b9f5739e4f9238c714258376 |     
    mips     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/2d5997d042aaaf8a8db2e309c6bed3b19071cf60 |     
    mips     |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/81faf875f6977d213052ababd9c95dc8aaa6ac5a |     
   s390x     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/c13e9e03cb01f453334dc926e593080b8e9cdde9 |     
   xtensa    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/aa03c70046d377ab5bf525b04b1ba0fe98fa4f4f | ORPH
    m68k     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/6b753afea3b6a117809d7b1c08c420b3a2c160bb | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f1e50aced760b6a0238901a46f6cd891e5729987 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b518741777a1c3cc646b03ccd4e1f7354e714466 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/284badc5cfdcc9eaa03995f599a0ac5e26aa8af5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9dd2e7f3713c824cec6a53d0a67ade3772d08af4 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1af29ba6c2d5a217a140fb03b324ec44f723172b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/94a23ea073266d6069bc441ee9bb7f25a718a755 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7302dd93fd76dd01b6b1ccb0cee1e4818378b19b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/da8c8ec59513754b11074f752dfa1672a7c07adf | ORPH
    or1k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/53799e5b96b7113699a26a0607b0a6d6da91d353 |     
   mipsel    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e85c783c385c32dc5671fad193010e47c4f5540d |     
   s390x     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/5f2b518a8c9a161c61b470a908d32c8a825dfe30 |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/87bd8b69ff27b853bb909dca310ef7d385cac9ba |     
    m68k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/4367aae896adf951918c64f0030c9e7af3651c98 |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/4d9ecc3eecef420eefc2c5df5941b70d21bed8ae |     
    m68k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/9747300c3db894ed5b270516488d0993c0584977 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/db52d80448f1a0a526c072391d4c568954be273e |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/61695343c9ed0570c711d1c94d1b989ef1edb8ff |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1833a8ca3dfda3d257ac7cbb684fee66260f9987 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/bb7e67bfed6a894565b5853c0ee712675fae4530 |     
  sparc64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/b9eb26e69ac2f9024b87f9ac64b18735ef8bcd4c | ORPH
powerpc64le  |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/9fb629a22115e4f900382e16433587d3cd884705 | ORPH
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d55f5ade415d87dff11c5bb179069dba78f73ebe |     
  sparc64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/543a7a190247790b09b762f6df3a3e6bbc0b8df6 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e3fad4a9bdcfeafccc0483c9fed68d8d43b3ea48 |     
    mips     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/8b3e504ed506ccd9d740ccd50a5f646efa09c3c6 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/e1bd92751fcddc90a6d4ed5d622f0684f4a475d8 |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/076287cbb15792823c9853f042a824b52fa2b3f8 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/41ea5d9a35ed506259720b9fdb7eabe2774f270f |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/db3110836a59e5a455a5c51631d2358460025175 |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/91af4f98e997c0946848b26fc9fad7c6ca672a0f |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/4cbe3469419b2cceadfd5f6628aa9dd0931a3e0a |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c0cce71553632eeb815f702aa57d5124c790f829 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/af84cc77c752fca5ae51321ff2842cb4b3c40d39 |     
powerpc64le  |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/beb24bca158d3ce3321385cee53c286a8f098cc5 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ec95a75f85732df14f92922d22c5f40b72da0e6d |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3afb993e8b300841f5c981710ce4d1b6a5a2efbe |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ebdf3abe0ab750dedac2104b40b39f98001a67fd |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d6ae479d12107217dfcca3abd09617015ae63969 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/40d4ec4601fbeea25b101fb72c3a6d8f2fa78c0a |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4889639134ad9a41368beaa0f672e37d2b8d9296 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/42770ff9acb40e42d69f7497ffed7cbc3eee4fc9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/22eeae0235ee1b50f365746644e86ee506aa4600 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/64643a25d30a9898a7d42d6c0dadc24722a84496 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3226fd658a74ffa3f439e6f9cd55d699f8f9658a |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a1130d00378b60bc303dd364a78bf0b2a57c02fc |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/071b98b52561f1adc474f9afd13ebcc100f116e6 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d5625f697c02d722e8cfc9f6b66e8a065c31fb6e |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b1939373a8405a2a17843147eb4025e8013bc285 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/12f028dca8553489a7a44c5408cf55615583aabb |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a530b6f611e8641d1872626da437b360e9bdd5de |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6112a3460cc0c74993d3fe4997350c49738d52f3 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0be9d6280aa4c04827be7457f91a867a591b1bc5 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/edccc7fab9a177057dfabe71c6616ec2e7b90262 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac29f25f02b0d8ad25960508fe92604801aaf107 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b5f5122c1fb17f420e13349fc7e40479004c78e2 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f44b7bbfbd5e823e195732e06c017c5944923a41 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/54b0475039bd0bae986ec84859b564a24ef04bf8 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a6114732c1cdaf1f66e43a9e17b9857704d6ea85 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aec2b432c7c099ba6ad6e00c7854bbd4be6b3eea |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0dee9de5c20bae4c2da2aa3363ee7bdee5f1794c |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/39589feee4a5957fbf24f666a767ad29328ab899 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b7d175d314d7d600eed9ad8f299ae4c4df6e108f |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/60655ca0f0744d1618b3d38c51d35d287e748fdf |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8f724d842012aa27853716f95d8a24880a13cb6c |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b98ea3a1ed1486e05c4e844f0bb40627eb18aa72 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/db48569b99c0b183681dc359b1b3797681e2fa0a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a96c85d46aeb2f2043cf1706b879e1ddbfde576f |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3a2396153bec0063c7226ca2254ff5e7dbcb7bbc |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9b403bfe23ef8af2d44f762e86af020c0c401b43 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47136d8849e7ed4f9a62c5b7ff68a7c7ed7d2ecc |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/bcbb44d6fb22cafe06637d6e62817b6fd9d300b0 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/cf2756a6997714d4bfab17ddb87c20e0141d4119 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/32120556177b29ec2079a2fea12befead6cb066b |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9a09ff5b584b64e0ef9bab0476b33969666dbb7f |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8a675fa8506980de26e5e76ffecaceabd45bd7a0 | ORPH
    arc      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3f5b84425ed71b82b735ec27c7c425fe405b16a5 |     
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c45ea8da16f5627193bea9acafd84b12669cd026 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/81fecb276e31ef5e50a49fdd950064ef867becd0 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/116ee8bf1250a4fea2bebeb47cc53b6f090b321d | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/225fd4ae5a988fa50d48c0f82bc1d790af15df89 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4204a73122d42dbee1969796873e48fc9595fce1 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/89dd81693043423b8920691e63fe1e826ec5ae72 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/648a5b8b0ef6a26373a389aa2e22c69101d443cd | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/81fc25ac170572189600e6a19927e1f6390807b6 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e05a0a8f0797b612c6cd10c6cb18c888ade58e77 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4dfa7c8b218820d28188cca8bb51b0375f32d693 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2b43a86d3a5673ab7f4587968fdc318e74af22e9 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/86ee476cfe7eaa76c43da102b72e9a6fe15fbc65 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e547dc0c939bef7423307c0afdafedb3a6d2f51 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/de6b05bdca49254b2cd8f3364bb7ae49472764a8 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/916853948bd918d744369f699a85c69ba28332c7 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d6f6142319f15d583bd06e32e719e8edea97f9f9 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05b457ac6bc4fc2d3efcfc559634d20ea3325cd2 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0723abc1ca5329739cd452409d52da471389d67b | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1249739ec965397b9dc56cc717e995780c28e443 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/26a5c8022711929b5df64bd352a9adfffaa7bf7b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e69efc7fd4ca820c74f23ed87a91af31d01bcad9 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/353a5fdb2eca243d6fb7401d89bc995436edafbf | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a33a53ce1c1736bea019044e2cd4a113ceca5407 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6ad5982917e5e7d71ccc543418cf553ea06bc43e | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11dfabe781bc531b5ce656326fde619dc977006f | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f804f6e6f17a19c5d51879a49cfd70e367ba5ffe | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a35149ecaf80cef927a9f03db57374d5bef40ec3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62d603b1babfb36361cbab005c6dcc21e984b375 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dbfdc1cadd9a5547f48c5e375fdafb2fb46454af | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c0183b88182fb3bf283d5a647140bf7e0904c82 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/04a3e5cbd1ffb9ac7193c6ac1db8a87dedd5ea39 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5e4548988382dfbc85a7dd0c13f948ed33d361a4 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/33e08646e67485659567a7718e465024a542c6ee | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/55ec6e27da70b914b5773b51e9cce8ba4d472258 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4a49e1d1a34f4c17a69c2e292fc4f5c7776b7169 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/72f551dab2a20bb25dd65ad7da40e17a7ebb9b0c | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cc0112bed7a2df7d813b1c2c6878fdfc4cee3c2b | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9cb4f7de75db833bcf98cc90ded5f75070f6a2e3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b772615eda271b8c6c4a5e1b093bedd31062eebf | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7daf719f23be24967ad48425ea184e62e628f4d4 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fd5e56c7cad8af3b138c683d7e6a129bcd561223 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8138938d4c8c298da50d7ab94c34bd3642115648 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62c2d1afcdcfe3d40a8db4206388a7f6131da663 | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5997045cc866396f7eecef9fad7954ce1a9f900d | ORPH
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/0a3a26fa8941938cc97e5572df1d5c7692255571 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/89dff85b291ad933e8d99cfab773a894e4ff8fbb | ORPH
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a59e486ecf282a0feb69dcd11486f92d208508a3 |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/105e1f2e3a8a6d368331e67abe03dc7f29713c46 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2d2c901099826eb87c6b7d43aaac1c91d31a1c98 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/c2d63fd978b61b8f7e02ce165f468417c20ce682 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d8333373633de4f6b7a385dcc3171ca61adf9002 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d0d45496caba8306bdf03e58c8689646132f052d |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c7e1a7594cc8e7a6981941b98edae5698f61ac6 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d77c1256555513c56bcd774e1e0456de245b14a2 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/47c4e8bc82916fa5deec5584dcd491707bea6063 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fae2eccebcfb6a96420f70c9adea3d39ae53989a |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/297954549c824286bb7527e35464a3385a20de25 |     
    arc      | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/5d1c90acb256564b7fa4d6275af462b6d0f85c09 |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/4ad14192ca9a1226c58e6ff9cc48878482cb57f6 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/eefa0952f0d47380e1b68d0c6b0009cd6a603878 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/c7a4c93a19e776d11237e0b62296e282b436830d | ORPH
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/0ceaf793a517ad1e5900929885d22d5e0bac2d8c |     
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/9fbfac9e87e4912a0c893e304d675dfd28900f3f |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2306403c796099c3cad2bd11faa8941732112af6 |     
    mips     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f9da2a71542bc431a113889c366a458fd6cf68ce |     
   mips64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/d8745337c26fb074e81c4ba5d52424696590cdbd | ORPH
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/a4114dba608b6baae17aeb92ca880137e4bc7d83 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/a1b79d9dcf862103cb1d3682df143e441f343097 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c65ea9f3c0c5056328d24608abfe929847da0753 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/097fd2ddbaa29093880cd1775bc11906cd8879a5 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5917121f41921548fbd42044e683d5965d1f748a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fb87efe2e0c4e6bf08a7f2b34edef3e3112893cd |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6342bb70db56cba0ae6996bb917a85c01c3053ab |     
    arm      |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/e2ae05cdd80f678eb15fadc49bca22e30db9bdd9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7413f8b24960d92aa42964c7ca63a54db5869428 |     
powerpc64le  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/2cc40180a64f0cd22bdf578702ff940ed7e7b4ae | ORPH
    mips     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/b0f52b6238137e936b27192e3781f6851db276bb | ORPH
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/1db12580b6542bc9db9f2764c496b4bd2dfbbbd2 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d46942f962ca331be8b9f74e4fff04911b982173 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4b18d3c50d599cb8e3c4163bc87a80d18ba75f58 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ae80822f58e0476f81b29254cb28a2e0662206c4 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b8942c5825ab36c8389ab84e39b15c33ccceaac0 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9bea1cf7cef837533b6830f594c6862c525d953f | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3926680cd626ca45c91720fa6c0f29c51cd41eda | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dd8049440498f6c1e65aeea7b738ce36e873d572 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8614045fb03bfc4a0dcd7d1cad9c2d969bdb2887 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3e02151636f6eaaee0900689c431335a4bf229e8 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f09d0322e9ec4a7eec58d6282b330dd15639d520 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/37602e2d8241cac1eb6274e8380bb13da4b5698c | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4e1a934812077953b03d8650b57900a3df378c9f | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/20c1f59bd06ec636cd179d831862c9224814b4b7 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68ea0fe0410c1122ee3847c5691745e722b11fe5 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/32f484c21289dcb62a2c233afc08bac71e9981df | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a8ed1556cf14042ca3f9f2cc9c0a96bcabc21368 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a94a421e9908831397b896b0e1e65891c3e89a93 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/741a5dca534f088413f75f5c6b099009064eabf1 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b66f4d99f439fe93bb1004ba035be969d823670 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c995f9a0261b71bfca8c336816153ec3f8670568 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7fe91ac21da5f0ff60a550d87d4a7a104f115dea |     
microblazeel |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/04b5113d32e9c27391d14491fb4e0e6356e6478a | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/8431db84795e12cf770863fb8f3ce888074ab5b9 | ORPH
 powerpc64   |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/ef893ae341fb7fb69f6fbafd9c7be52d8a5b625f | ORPH
powerpc64le  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/aba5e3f40c71f158e4d2b8f2bc2c2955b7d8e125 | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/5bb845be7f861dc3540a8dc618ccd1a0a759f2d5 | ORPH
   sh4eb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9e5c77cd4aa3f7ea2b33e6e0c2c265346071cdfd | ORPH
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/dc8a7f1a5dafd2e5e96ed5847f9201fafccdc110 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/5483f0cc6d2bf276945117cbe8fa564dffb754e3 |     
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/ebb95b50ab82e4cda724ce537a31ca69281cf43d | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/6e3d2521222166320a629271db30ef894d3d59ab | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/2a20733a1acad4d709e3d1260b8f9fa2443e8046 | ORPH
    mips     |          mbpfan-2.4.0          | NOK | http://autobuild.buildroot.net/results/d528dd6d45fe78661723bfaa360adeb898e70c86 |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/704bdfc839e65aa945951317aac2b54785ed0a3c |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0fd595ae4f8c84298e643414c1021a583e4d41a2 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/168ad3df77eef68b192297664606d1c495fcd74d |     
    i586     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/33b773fc124fd35eb8d2127b36dbba80dcd79d3d |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/db8ce8adbc36fffc60e7856a4564416e00b085d1 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9d60c67aebdc60aea8582fd3a967fadf1b0dd86b |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/57559400fe6dfe2604da6ae2f5313c58a506a1ec |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/b15045cde80207fc46697142e9e932faa15935f2 |     
   mipsel    |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/6895b3ff8e165ba07571a8e43aceaf9d9f9fe105 |     
  sparc64    |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/89b9052f03075fe2f89f4211a97dced2a8dfff5a |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/1c02f57a084ea283fccf49275acec4ad46dd0c68 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/db1686c62a08e508e44281ed07d7f5dd54325af3 | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8417fb7dd9978199d10cbf7606687f72d052f694 | ORPH
  powerpc    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/12d7094242f6ca5cc17c7458a77b858711e52b4f | ORPH
   nios2     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/44761a9e0cb277507450fad439589816b260ca7a |     
 aarch64_be  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/a2428ba4af252de627a63143cb429c2f61cc721c |     
  powerpc    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/5f451add9d8a2827a7c80c61f2c062cff41b2785 |     
    i686     |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/d302df3a80933db033ea9c012b3353dfb1d31922 |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/e5e32eb009364bb596e15594bc7e8787cac39a19 | ORPH
    m68k     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/a92813905adaf8c701e04eb3a077c489cb030112 | ORPH
   mipsel    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/8c7caeee0d73123d5045f918cac7821e2615a985 | ORPH
   mipsel    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/687003c6d5d87c7c4a4c4a824b45ba5976447535 | ORPH
microblazeel |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/435dca15da213ddaa7e33ff7d865e707ca4a05c0 | ORPH
   sh4eb     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/1ce18d14575d6012842d793aa885611ddc0921c9 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a7c7821e2cd1626bb5d4b299d9f2e643cd736fe8 |     
   mips64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/797911a26c3102b6801e78a47f2b9f3ae8164562 |     
   armeb     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/99d62ab85df04fdf16daa63b35b075541f36c3b5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cc4566eaa6c2047066ee87cc33eec39878253f8d |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c738385e05f33fed9ba454f185293a044a16f0be |     
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/ebe888d5e9b38ce0211891210afa3a863a995510 | ORPH
 aarch64_be  |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/9485e8a97ca21ad6184f418c124e1d3ea4b34aeb | ORPH
 aarch64_be  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/f00f7efe62f601493bb915c31f5e4908e33d9cfe |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4feca053e43a229135b012ce03822675317acac5 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/576a376e78593193b2ec477408803d32cf0b66b7 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/90b3779b78a54be27a85082aaa9648a2be787bd4 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/adab9ad0bced1ad40b93e421667728b10c891a5b |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1fe1124021cce7cbdb1b046380079b618068a813 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e02db0f53a65152684f2485524c5773700671750 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ab49aa6efed50e2304e13650982b2cc2652af296 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/887a8fcbc6a16c36e497f12cad4b334c046c1f48 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f8820771b0bd918ef4b9f026e298d0120f8bbefb |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b0055465713fc06bf3dda0b78bcedadbbb842fe4 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a0cbd49368918a9b05eb936d19eee31ec343fe4f |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e75e416c263daa539528870fe4f0741fe4803703 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1ac2d171d8694c9c6f289450e9dc495b1a864739 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9363e02292e6b2d5169f98a18f6232e6ee217f30 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/255f7768d33c12957f1f15457c55bd7f26155784 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9aded202c8cd42c778777dd3143bc7d2b51ac5f |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/baf12f7668d5e0f5774480e01b35d68f47351bc6 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0e042d13cf59bb1f52be7a2f2c6b3d4d39e5960f |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/501a7ff3e96b011b68f2d3dbfddd29f8a543e023 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5d9dfa790365a69fde5a92715e844468a49e5be2 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/141652d0fe13d2c9780a3dcfbac1daaac92b566a |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/113bc2186f907b90979e6f8fa019b42445b429af |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/99ea97e49a87c044f8974f9ca156f84b607dda5d |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d99677cec0760c7945f5a025437c4e02ff6ac0e3 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4456c607dfb0290aa899d1283d605a9b2597fead |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/94455f80f927489084e461a6700360b94293e13b |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8ff2d1203931c0748472e0ab899de205b8cb3ab6 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c0d5afe8c4a3e9773530403e957e5a8a2b772e32 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd1b1930a9d2c6e54b7bc83b66d29e74f7a1eee4 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/33c7a52e53b692efa7ec2b3a404b5ed7f6e2bc5e |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/61d15bc392a9da87571fa7a597a544d7c6507b4b |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7e0ce6a60f8d693e8afa8c0e02a198c08ab8b27f |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e0db17ac7ca130bf153e9916a23153ca88b52e94 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e6701bd5d93b9a6b710605acd8679fd6367273f1 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a24240506011cae68e0bb913992c1fd7a1e960c2 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/820f194880ac6f2f521a3327204a4fd523f1abd9 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fdc7656ccc4db6c78cc781dcbdfebdf62b4a0363 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/26aad93b8ef93760bf990d9ded61df1f67a6232d |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c1091d42aa39415e57d8a556f48930d4349efad7 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f0bcb060a2b8826e7a192a52e5234b6e7b7d6e80 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/981579856c864e5f45a185d7464db6ea821929a1 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             rabbitmq-c-0.13.0 | 2 
                dovecot-2.3.21 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                libressl-3.8.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/145558c4f65ba1578e23efea6105137972056b3f |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d686445d6695cee28001e0d0a6eaeca9e29e900f | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ab874bed88ef111420ac329060f420a664e6b386 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/15d43f32dcc4739f8139757bf95be1d938acea20 | ORPH
    or1k     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/1074beca027ce439d4771bfb8148d25c0af1d7b9 |     
 aarch64_be  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/217c0f72eaf05648c47ecde263bb6ba211b4a686 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.1 | 2 
android-tools-4.2.2+git2013... | 1 
                dovecot-2.3.21 | 1 
            gdk-pixbuf-2.42.10 | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3a722aef6c971eabcddf66185611c0602c27ba2a |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/57d1ad4e1e26fcc8649a96772c0791d9f5939999 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cbd2625f057a5074d54992a468d68fb012aa1bfa |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b0a73f7b01dafb09b53f4b26539f63a36ac3af7b |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/caf3a387d021b6e045542ac944e2d8383a887420 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7f16358352553bf71471f2c4e9ed5eb47e732116 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
