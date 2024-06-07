Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF1AC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 04:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E6041948;
	Fri,  7 Jun 2024 04:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WUiAsXVOEUr; Fri,  7 Jun 2024 04:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA7B401B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA7B401B2;
	Fri,  7 Jun 2024 04:00:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF1E1BF8B4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 04:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30984613A9
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 04:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Abkg2i-08WV8 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 04:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 934C1611DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 934C1611DD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 934C1611DD
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 04:00:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 668C9E0009
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 04:00:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 07 Jun 2024 04:00:18 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717732818; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AolxHd9ecMp4cMjkgi3h7mmxsMRiqbERDjzhMQYVHPw=;
 b=hU3RLQ1ZTS6Uvo7UthOWaKFhHT8aLltsQe8wcBuqjbRzoiX+/Odbne9xHnvUle8vL6Ni/A
 34++tT2AZd+jkKf1oj1gnIJb6j9JOp7f3HTUIv3yjakcBcKXm/4Z9t1rQ/B8oyuFmjIBxg
 UsoAguIR2kQRQ+6I+4CP1SgU9RUoYGYnWWsKLo9/alREqUaxlqUH93B8JPWSR7JUGgez/r
 ZiSMFx29QgYU72ECEvi7ZerGeq9gzdkbygFen2iW8A52vzGcf4iFIL3JmZdJP9OZ52DjjP
 Jn8i1iDINXs4zAaUZ1qCi0x+sS69XAmjwkqSX6tjY/XzEMWDOWSLvJbtOdufNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hU3RLQ1Z
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-06
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
Message-ID: <20240607040018.eGR1OBIzOrWQhbUVPnp9apw11mTYPssx609-Cmr94dU@z>

Hello,

Autobuild statistics for 2024-06-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  | 11  |  0  | 21  |
    master   | 119 | 371 |  1  | 491 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 61
            host-cdrkit-1.1.11 | 31
                libressl-3.8.4 | 25
      host-riscv-isa-sim-1.1.0 | 13
host-vboot-utils-bbdd62f9b0... | 10
                    mpir-3.0.0 | 10
                fail2ban-1.0.2 | 9 
                host-odb-2.4.0 | 8 
ibm-sw-tpm2-5452af422edeff7... | 8 
                  bcusdk-0.0.5 | 7 
                elfutils-0.189 | 7 
                  ffmpeg-6.1.1 | 7 
                gnu-efi-3.0.18 | 6 
host-android-tools-4.2.2+gi... | 6 
                host-go-1.22.4 | 6 
 host-softether-4.30-9700-beta | 6 
              libarchive-3.7.4 | 6 
aer-inject-9bd5e2c7886fca72... | 5 
host-heimdal-f4faaeaba371ff... | 5 
                 uclibc-1.0.48 | 5 
android-tools-4.2.2+git2013... | 4 
                    attr-2.5.2 | 4 
                 coreutils-9.3 | 4 
                  linux-6.8.12 | 4 
                       unknown | 4 
                 apache-2.4.59 | 3 
check-11970a7e112dfe243a2e6... | 3 
            gdk-pixbuf-2.42.10 | 3 
glibc-2.39-5-ge0910f1d3278f... | 3 
         host-libxcrypt-4.4.36 | 3 
               ipmitool-1_8_19 | 3 
          libcamera-apps-1.2.1 | 3 
               mariadb-10.11.6 | 3 
                 openssh-9.7p1 | 3 
pppd-e1266c76d1ad39f98f1167... | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
                   bzip2-1.0.8 | 2 
              cache-calibrator | 2 
               gocryptfs-2.3.2 | 2 
                  jack2-1.9.22 | 2 
                 libcoap-4.3.4 | 2 
                  libffi-3.4.6 | 2 
                  libnss-3.100 | 2 
              libopenssl-3.3.0 | 2 
               libunwind-1.8.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        ltp-testsuite-20240129 | 2 
                  nginx-1.24.0 | 2 
           python-zlmdb-22.6.1 | 2 
                    zeek-4.1.1 | 2 
                 avro-c-1.11.3 | 1 
                    bcc-0.29.1 | 1 
                  boost-1.83.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
             cni-plugins-1.3.0 | 1 
           crucible-2023.11.02 | 1 
          cryptodev-linux-1.13 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-26.0.2 | 1 
                    dust-0.9.0 | 1 
        edk2-edk2-stable202308 | 1 
                  fbdump-0.4.2 | 1 
                   foot-1.16.2 | 1 
         gobject-introspection | 1 
                    gpm-1.20.7 | 1 
       gst1-plugins-bad-1.22.9 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
        host-sentry-cli-2.20.3 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libapparmor-3.1.7 | 1 
                libglvnd-1.4.0 | 1 
                  libnfs-5.0.3 | 1 
                   libnl-3.9.0 | 1 
                  libsepol-3.6 | 1 
                 libv4l-1.24.1 | 1 
               lighttpd-1.4.76 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                mongodb-4.2.18 | 1 
                   nanocom-1.0 | 1 
                    ncmpc-0.49 | 1 
                     nut-2.8.2 | 1 
               pcsc-lite-2.1.0 | 1 
                      poke-3.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
            python-scapy-2.5.0 | 1 
                    rtty-8.1.0 | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.12.0.1 | 1 
             sofia-sip-1.13.17 | 1 
             strongswan-5.9.13 | 1 
               syslog-ng-4.7.1 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
                    vlc-3.0.20 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/49088f566ca968e799cbe27edc78571f7f1abdf4 | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3e9f2b5a6925b25ae5a267a8080379bfd2a53ae4 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/05cdd832fbb41eaf7f5a1740b8156514974b5132 | ORPH
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/830b6775f85f353d56fa69de407a164583976355 | ORPH
    sh4a     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/600796a19a272c97f74f754938ea8e418162325a | ORPH
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/47a1ebc55b32217f796681090b13d5e6a4641c0a |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8bbc953dc08d4eef89abf4ba306c92d58c4242b7 |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d05f38748c3f11e25f0e2336f806a3373b090aee |     
   s390x     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a9411222ef5072b81f104762174c0667fd8fa4b0 |     
   armeb     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/c5811ab29f38fa7ae415ef2d9bb7ab6e1ad94dd0 |     
powerpc64le  |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/6a434ec55cb419fcf6c1f1c1eb590cef1d2282f6 |     
  sparc64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/52755252bab16cc6ce11e97a7fc94065f2370314 |     
  mips64el   |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c1eacd622469920eff80cc322ec4263fcc22bd2c |     
  powerpc    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/6d0dc277a2cfa23e6dbc3653a88d1c277ebad8ba |     
    or1k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/5d37923f9c2190a80befc46d8dd422bfe5db6982 |     
   armeb     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/178499af41f149404dc0d8ea4fb87449948ff15d |     
    mips     |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/c6f7ba041a44fa4ab35d029313df46e55240955a |     
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/43a2736c4d39afac3b87071c8e18ff283edc18e4 |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/6b9a449619bc04f502d633f30e4adf743d22501e |     
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/706d246346e7a0e290adfbb735e8f8f068448574 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/44fc68d51eb01ae91abf8a0cb44ca0d03983bc89 |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/36599f3064eb3f7081b443f7888f2e47b565a53e |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/51e312218783485d8330197ebab3dd9ef0143084 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/eaceb5492af51ad1cc359cb5ba9d23a2655df511 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3d8750748f8600b3116ab3319519730a4f1abfb4 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3e78b37181b78e256bf719a68a89ef9dc6114d6e |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2b26406599e12f979b8bc85c2622ee8fd6f3a9bb |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/0c5f0b0aea8d82d1faebb8a6bf5d3a30c7690326 |     
 aarch64_be  | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/63256b498982ce628a07c421dc4da696a7b3ef06 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/5e784f1a5f0834cf16d4878707143ebeb85f30a5 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/8fe56c302d73cb5124d6718d8dcf611372564807 | ORPH
  mips64el   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/d13ae9f432754d17949550b7aadc8b73b24ab5bc |     
   sparc     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/79e339f02d2f58484dec046b9fdb7fbaba54004f |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2ab10b0b90c4bc280466bb6177e4ca14fd657039 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/76ac989f1cdb284f13538e082890d72cd2b82474 | ORPH
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5d60e94f3286b9a03e0c982215cb63b8fd0074dd | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/26a42c216f71d083de10369e4ea68074d1bf0f9c |     
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2c02d7a8ae5b6a4ca229451a073982b54cb52e5a | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9d0d2957d91230e43ce1433709cb5f995be37395 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/41edcf8024f6a978dfa3cb3c9a9adc0f6696b09b | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3d0a2bf7e16bddc10e14a0b65b14f3d79f64150f | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/b8d481a388994ed34c2ef521c5892ffc3e98673f |     
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/93c9ace0ee44b012163cb10f1755b4411d19c8fd | ORPH
 aarch64_be  | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/98097803d1287c22674a45450e3427da59bff6fb |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/8c1ed3981ca36304259bce3365a02bd37f4b0a3f |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4e2ac2db0464c21d1956b0c2a786d99a7df37ac1 | ORPH
   x86_64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/566e5bc00d782aa3ffc38aaab26c8073a4932b31 |     
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/1da7c3e4e7d8f903c441b21f895c793478ed7717 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/d74bd6d378395d836a146e8511396f643cb1210f |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c62772e444992a1158a8d460a26c7f0d23291816 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2a500f0c1316a131e212a7ed3d988cab2cb0797b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/556199e60bf7ea19f2e2c9f2a2e7ae33bcd33ae9 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/90bea57d34fdf0466b8bbb7979ff94002b0a86da | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6fa7577362d5060087920717f807919c121d5470 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/10966315fd96b90267ee0d19dd06bacde520d376 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e6ef385ec4ef2f983f75747a9cfc0eaa0d8de578 | ORPH
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b209bb173507db2ca855167cff282750625b9158 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8223a6cd11bf34dcb58aa9525aeb7c97d6d597ca |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5ec520055ef14a9eec74294bfe7ee2e4890a7fec |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/360d377b72aa4471f52229811d8dd7ac765a139e |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/04fd649e3bb8284c5732f2cae6109492801f0670 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0cffeed1c56efbb1fa979150b3865d1acf5fee10 |     
    sh4a     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/248c38998073a51f925318947ebf1325069163c5 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0cd33877dbfd4de1f713c86a19b55959f197ab1e |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/bce117d7cceb6d835662589b96c36b60318f0a03 |     
   x86_64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/b4e02c67540b1461fad62c933c3698fa0d68fdb9 | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1f24a53d1342341c3cf5aeb1de8df1566ea2ce03 |     
   mipsel    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/95700f82794aeb063e4315c58dfe86529c79f924 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b47372b50828fe789e035faa2197c600a58b5942 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2e1a0e954221c9f5461b74edb9ef47d6be28ec4f |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/568933302472ae7d797fa2752e56ef21b3f86241 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/70813188470f2aa7070780319ebe7b6a8026b18e |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/94cdad784b5adfcc2ebeec75fdfa0d7a1c339995 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/dd2d56ca80ce5aea066bd7f34deab36b18fa1385 |     
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/7a6e8009f3aee9c2fbc6a3078804f2682767398c | ORPH
    sh4a     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b711e5398b1431f7b6f95da98349754d02569356 | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/68bfcd523dd585d1e1f4c2876565ec76525f18aa | ORPH
  riscv64    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5a68992d78fd25fe206290ddd7adbec5bde8ad75 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/1c38a9df5f694a5a961275bf552e79adf5063c04 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/89c4a46080edd535c9231bec2e2580d9fb576983 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5400e881fa9e8597c765f8e9ff417961fcb3541f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/97052569b96108acc475cc8ba953655452f5068f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b33f6549275e1323c9a0b7bd1de03aafdedbfdda |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/74266439cd87c79dc6e030182f404e682c62c9cc |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c736f2188f82995065b96b477fb8df69f04adc17 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6c68cb9acd51fe8c1938035618f99739a5adf851 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/607862581ad0e0b740cae2a06fa33cb21e14885c |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/8d4b9b85489eb4f1aa5de0ad43bb98bbf8d6b527 |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/34a0b867a1c90f5da217c9c5813b58db621aa815 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f82ddc12b70c049e688feeb0684ebddb7f0198f0 |     
powerpc64le  |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/9e5da35094c290107615bef950feb44eaa2938d8 | ORPH
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d9b6e34a644a2217222da05441b12ddf9acd2cec |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3a512da9aa232fbdd0a9b8da4266280e76df1aa2 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5c4851693b1d1f5cdd9741cd060d86f3a9b616fe |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f6017a56af0dacdea8ef24060d6990c68682a3c8 |     
   sh4aeb    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6ff2bc25a346a269c7bc1d440efc2f24e1d790ef |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6132d9b530c8708b2ac2bd34d2c59bdd7a5b5ad3 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0ef4b25b00c15f901711029e63209643a33f8369 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/153455e3c4f6e29d92e02146d6b8f96d052e005a |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3283827569f6d2ad1e44442548ef929b50b9e83b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9195d5df0ba75112eec3b2616554cd58a313e9d |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c568bb4dda579418c408d9cf8b6c9fb5ddb03b01 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d68f7f1eb791fd28f0a960a24876f80c0bfe1e93 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a69e588dab163a4ee39a982983557504213512e3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/04e65114bc71253448fab0aaeb55193dc0e5e8fb |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b33e1b8de43bd2ba993f2a239ebea6239e20a0e2 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a8f21f85e178fccba267c67fa8487f38ab25fbfe |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4dcedec50f29cb698c1d8146141832776e99f4c9 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ca89b7397b11961a44165f273f21869fdcdb312e |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/16fd5902d78d9b03926ccc9b54ba0e4df0bd5c06 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0881248c75f578bcc6d8a09c9d391055bd25b8e7 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a55bb8dd4073df3790a816758ec4797f7bd4348a |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e7ee09aa21e640e1365c85845686928f7a830c0d |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6b51a4048de1e1b61dcf0648e6e9df09f697bfb1 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/62f9202ee3f024d8fb494e7d540cd735d8e6dc4f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a4651abdbc56d6e4dcec7aa6ab7f1a894cfa7ffa |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec8a81b593e3922bb92df92508c54fcfda037646 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/15914690cb31cbc69d6214c5c86edbe4f985b4f8 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9e18ba3efb9de8136ad88b866dcfcc52f4e565ff |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f1d130924d0ee32a7d5220d80dea76217e49f93 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6f44bcc86c4cea0af016bb5f631a41f8a4fd608f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7c56a27f300faf1a049de05ce95897a8eb2ef503 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/71f54c9d32dd5ab9161ae76e037b7eb4002cfe69 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b0504bfa17480c342837999294416d7b0ffaf063 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0cb499de13b3fe3e8a76936be3e8209cd6abe3c7 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9f373b514d5477378d9df433acabe918218fc290 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dfa8975754e9f2bf8829887b6c26f662f73f35d2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/75d254efece37ffa091a7dd660ceaa31657f26d0 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/5cbbdf34476c910206915dd33f7bf1e966b48058 |     
microblazeel |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/e6e3b10bd617260583f281b32beb54b8479eb047 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/3e5977648dd164d79291d28ceb61ddcb6d5982dd |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/4ea316b7d5e9601224c1e68c31e379e725cb2534 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/ae42515ea7175da934c2cf27e4a19d6a19ad05a8 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/944799b023f554b8443c6bc9f06d9440275784fe |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/2de3711d393ad2a428041a49ef00db07e0d62697 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/290de56a994ef5f373dd52e1bf98025d4aa590ec |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/bef988aeedb85f80c0fa0526f44acdfe850a8c73 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/45ef3bcbddc47b6d26eba70798894764248a65a3 | ORPH
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2889bad351708f376339d03bc8038bdd75d03039 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/cb134a662d06bec211e1e25fb4630e545f7448ad | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3facaeb24eda566f32ead77d3419651b82dad7a3 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8f94316945fdac3e8897c5926449c6f829169096 | ORPH
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/184559500da020eedc552b7da35f3b64beb2b513 |     
   arceb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3df9523cfdca06902359d52ef046689af93a2577 |     
    m68k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f57f5946e5e085191425a84ff3f9cdaf59f63d76 |     
   sh4aeb    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c7a219e959e3e7e3c653c832ba1b12999b8db4ee | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a5d988167ad462280f59e863e8661e093dac6d24 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/509b9f29cc4b5a90bc739bda39af1bb593b7d400 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/95119499f569d6508d982ae5c0aa9f5ccfa21255 | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b1bd6f8410516a7003085c526e9a4661aee4ceeb | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/066b719d8eaf9e02e3f6752b54826c363217d292 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9ebcbe42d05dda9180e83bf3f88f6096e1e3554c | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b7d7201a5c6c37d6180529c0f27ecd4006caed43 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/269acfadd1fbcbcd37ae1ec8850bd35efe5ab96e | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1e3cc0342c0b08fffdc4f5d854efc4b68f21334 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6310fe270d3aca30e36493596ce039d2bab9285b | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14eb7ec3521de893f651966818b63cd715e53f7f | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dc890af6236cf94c3cc29df60e89cc29ffa82787 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7a27f5dcf2dec57a42abeaab5440db1e4031779 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cdaa40606823785322bfff3be54e70514b1f3741 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/431dc9cc1bcf709016334e62378ddf0b23c2d8b5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/704ce98d87dd13d0f729c93825b61b1b7c8f592d | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3e39551efeb92e99194b7377553964dadf467be7 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48fd762528c0fa6008e3f84bdf114ae682cddf6a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5fd44b2a4361a96e377d7faa830d3eb6c91625d2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b1ada601bc9d1782c1246b053e7ced466a8a818 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2c509bfe01c4341ec6a701f3874a36046b0fb341 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/55d0ff4bd202ed2fb2fb221ffea9b30ffcef0294 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eaa1839307f60e5ecaba93d96c54518fa74a7a2a | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cdb709b169cb8814e854126efbb11c6677b7a601 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e8d4596230370241474baaaeaf70debd36930275 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe1a7682163e9fc915842e330e8df2a7fff6733c | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48578b42d7d509eaa3abf313638fb5f8e3902824 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c249c90fe10bedc8cdbed8bd7b36c43fe7c74cb | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f813036ddf153310e471fb952f5fbd16ff0250c6 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b8c2169f316a200f14846e668cea488cfc4fb17f | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/425d25e7483bc5fa5990a6767a8c86164ec46ed1 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/54d57b1a2149eff0973f7612d51ded04f22dbaf5 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4be3626891796915aedafde016486d7b77d8512a | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab76ec720fee1282b19688b3dfbd0ae1ae1a6e85 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2fc528ef4f2b76411d327a597906e0a093e39d05 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48c5773dc57f97ab50e9c2b948674152e8e49046 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62cd85d4837a65333be01073456988a4c9542271 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46194b6d7391f83098fd8ecc02d6928ed27f7e84 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d60733f8d9b806caaf5f5c62a1387bc5e5e7465d | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a67f1869dc74373f3f8bb5cacf05e55233c80794 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14737cd74bd508728e19a4be66954ab24efd1048 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3ee82f89ad9d8251556e08807c6ddfd5ad28d05b | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b39c654b16e24c51d076c7b95483a65ca6bcb899 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cad0b01e1cb12e8ca53a8d121975c6c11b9a8ead | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/82bea6875d59cae6a1db92044717d3e3b4dad8af | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1008a55d69a695a37c8b5d63e1a06a4634038c8b | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9e9670f6872bbe12faa8a09247d432645884953 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/57c646aad3595a9cccd3dc143af3fb64d50a8bdd | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/922fb584b394637f80732e9eee38df3929087614 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4b224fb9f8784c9491725fd61e1c9d7c34af382f | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6a12aecae310f851fc0a9dcfdfd69f4d1bcec6ab | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8aa77e026fb360b1f3ded6001ce6fcd4bcc10022 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/851a55aae63179e7e63ae0eb1ff39092db0cc894 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2c9a618a3ceb1621f80674d2dc6a233ea73a660f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/898db3e3668cfa3ba8d4fb4f485d4fe0670cd977 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ffd591b6f045dda451a28fc2efc569285a1b1813 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c60b946bfd8dc295b0649e40f38c0ee16066f687 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9c08be75a017c9493d9d3e7d373ef5c2c54a553 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ece17b367224a692bc1aeacfb98363b045bd88b5 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a7342a68c4022603ea1f31ef09532c1e0d4e3be4 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/222914c88c7c77de8b270456a47bee3581397975 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fdbf54cbfcf0cd02a92185fe31d0fda022f1abd1 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5820c5037be80da6b193605affbf03c17c6266ee | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37f9041fa86b3a87f33ecb3383372f75af9a48b3 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/214200a7178ba79948d7fabbe56cba64cc8b95da | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9ce80787930b4b707013ec841186703d6b664d89 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8af1748adcb2ed67bdaa12eb4fca33dcc88a7aa7 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/504a0dcd9a3825c445d15004f0373e9d28cb342c | ORPH
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5b8024850b4950f815960c44ae289073d8250197 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/008bf5d1332bffd4038c158d8602535973d83519 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/57e316bfaef3379d9b133c7f6ce804399e1e290c |     
    sh4a     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4de5df29563f583534f6e550ae88fcdf7d86d616 |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c8fff2d7517f0a514b93c6640b75549b3010573e |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/27a0a2a55c668c674bcee3d569a3b0260036ce28 |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b3c052e9627cebf832be03b7ad75352724195297 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/853a7ac25ca5c06a7f2f1f67ed8bc282620ce7cc |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/187fe83e23396c9ef61e137bfaf0543d12a13f45 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c2dd12a9bbcb8bdb5b676588db89a349c1810035 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/74763e415281fb2a46927a155e3b014bf8b121b7 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5d7140b46effc0f3a9f7a3fb5bf9f97471033ea5 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c6b278d063fcbdb32c6dbfbaf8a89e72bc7e9ef0 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9b4174b6f326271169e467f8f07a3f3fe993910d |     
   mips64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5aee3a8ca115b07dd23feaa1eba7d9597b44e243 | ORPH
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/168f5ee8d057fdfa6623667f08f427ac7e2af0b6 | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/2e0c0f9f6684426d448e039b4b7f9aa6614fdbf0 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/124f58d0b497d70794318a25cece1f6c54258e7b | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/eb5a2eb4d1944f417329df707d29a3bc57152258 | ORPH
    mips     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/0fc7280cb15253a6c3ce4d9e03407f9134413b07 | ORPH
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/20b53af2b393bdbe8527a952ae9211a9b63e985a |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/21d14bf10fa2512f9c765c6c4042990fdbe5298f |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/81f9c5f26fb772063c27a4c93019072f56464446 |     
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/53f7e114f8114a44251cd0722d564f4f7be083af |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3181794e9d8a63fc9ac692fe758d99f540eacd58 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/730f2ba2f573d0ad961596344a91a9ff08beda52 |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/46a025741c67c7d568de9f42d8b6a44ef9a0c4ec |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/96926c98c7d657102076e1926ec84547d9077fd1 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/617999d771277af6ac9d907c2e0b38e06faf8857 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/371f3d93bfc8051fffa129d92f8e166553dd8204 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e647424f6b085215bada6c1b788924513cd85f17 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6a92d60c725d6e819f636860a1c905d5b02bbe88 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/44fd675c8e7b0387ca5ba0bbd075e2ca66ba1bb8 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0e03ee88154e89b914212621998cd54dc6f63532 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d6631a5b5e7c0bb2db3fbd5e593c688c7702dba5 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d5c1352a3d841f4114ab946136a3ee8c61ad765c |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1235a8c17bb97377e5f7149c5f89d7798a110a39 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1f3f29c5b37e9c85a1e9449b6f38e70d08e40ff1 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a284c569b9abc516408cb69178800cca7994d0f4 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/25a7d015fb278ce79fed4aabc51c4d9b0b2234ae |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ba9bb1a4523ab4b8489ce41fa9e63381520f9604 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/688116aeffd732e2d0578573457006568a5d7c15 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/a0e1e99c5e244e23148cd0a60bbf75e76721a3c1 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/48753683c3e0b5d3ac02a67a796bb824f73487f8 | ORPH
  aarch64    |       libapparmor-3.1.7        | NOK | http://autobuild.buildroot.net/results/95bdd72fe51617b958e710c8b0395a9635a89341 |     
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/86b3f29af0608551b746b1e1268ad05de190adfa |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/befba39b98f2154d7861f061718fecbffb546556 |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/6cf3ab27a5ffa802161b829300fe19bfa0ee5a6a |     
   armeb     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/88e3d8fd8bac5f7af1a450ffe23f12867cd5a4f8 |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/949020f9cf6f60be70eb9d7f750b35ee90e27064 |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2d57325d420dd8408a9916f5d808b6a81e78b5d5 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/46469d3cf1398329ff38f3c75bbcb52093ef991d |     
   mips64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8c48bac9cc845dc16af0ce78d49c87822947143d |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0fa8ee8435de88b858d6d4268dd875085f99fbec |     
powerpc64le  |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/3fcf8bf19669e3e358ea3e2335bdaa92d33e9ecd |     
  powerpc    |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/871254319cdd8ec58893beae988c78b7ab034d6b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d92c2b3954a16dd7a3fe66ad23cc4f9d3830709e |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/78bcd71dc76f156ae807af501fd2ad050df43d2f |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/c3102289ff15261275976b2e7f773035f43312d5 | ORPH
  mips64el   |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/124b08294ce698b6dbac220a87449fe25e8b7324 | ORPH
 aarch64_be  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/18e177ecfa31213b2b96246bbb890887eb4bbd72 | ORPH
   mips64    |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/c25f1f7655234e28c123e20b91c2f6ae592b4887 |     
    i686     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/9e095e4e36792d7fee634cd2d69eb319d86560ed |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/97e76c8be6439b45ef9eb6d9799d21ef7c9e8eca | ORPH
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/838986465f35c4541b9dc1e839457974857a7b8b | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/53807f40ad78dc41c952bd046b4df28ed4fd7ec2 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b0d80b70cdc8c73ace0ac60f561add0cdbe555e2 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cc3994cd29498f8fab3549d47fe76bb81a6df5c4 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/acded39b23b3b7c96b8dfb215ae415b2876bce50 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/37fbc49c7ea16be6ab6a5bc3995b0cb06baa2984 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9600bd3ec1c27c145fde7453e19e3711a5f905ea | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/59679b149b17d056b5f5b106770f6a00cc29bfe8 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/121c197cea1704a0df4784bd4883f86ff055c9f2 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ed41d7db012b697141551d86c13045655b567d78 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bc71e731e12024e4ae06a026699f32a2429a3423 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3cdafd6ab3c568b57ab66c6dee45bd7b22e542bc | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f021fb9778a29389370d94e67752e476b3743102 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b128992dac63360da39ee2b3aeb06ca5630be1b8 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eac344e21089283aa1f7ec43a46633df728718fa | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/45c8163781cb52cdd82f2efc87b9074f0cffe46e | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/006703fc553c54f518c68a1ae8d2735c34ef9e85 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/03ae2c065c223cf83cafb296be896f3cc68fc067 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/50217d577fff8e13dd711adb1567d50dc64fae94 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/730c979ad7918642fc774654945bddd4dd8ead39 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0162999bdb07291f93a791b16a2428f40235519e | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b5959d563ae5eba290485761301d7ab77070d3de | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/16d3dcd9fc028e8d9b2127630e238943ec79c6be | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/448742f9de06705b2cd3a961c92aaf99a2b72228 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/72b818c51d23f15e3836fc2a6e99f413ab0f8127 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d4ddacd8f5937368283ea442f0bd44d2f4927ace | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/251a40e3ada7223f246b5a030b78112bae66e5b5 |     
  mips64el   |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/5608ea8cbd89d10a8c193b0219f9ae1d670a8683 | ORPH
    mips     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/31390acaa93e0c443b723cb642b8cd903b6369b8 | ORPH
    sh4      |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/cac0877331cbadf74a0ed21449ecd31ea683c233 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/235a6b275fa0fd352645ff26cca5e87bcf151443 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/108bb29f947cb5665a3e2348ae4212ae61d91aea | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/933632ece4d78509d6143ae1e67b0f9ee8ae8db0 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/04397a5622445cc4cb296ec2a7265ec0543ce423 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/5cf0138b7cb5e570fa885ad0ef1083c75f3130b4 | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/3b6e3eb155018bd9ce395fbc1ae1ecf124f86eea | ORPH
   mipsel    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/778aba7867eed3c4ee0976b8a7449d284fcb2d16 | ORPH
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/1ddb5d0574bb23a0f4fa3710adceb5e195fcc53a |     
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/fc81ce3311daa873c3f02b41185a853bc23b7eef |     
  powerpc    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/97758fa2467a2276b5b5e46d3687e31e3653d8a5 | ORPH
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/c60165ee8e79d47dbd7b726d3eaa6fcd6aa0e5dd | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/12719557d9a01645bee27537c6a3e047bc821844 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/b77be3848ad1bf72e401fb83f686f00d86a6fd30 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ada44e8499d5349828325b07c8881147b909ba88 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9588b82b1aa87df098917a75d0182a41afc4a542 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9e1af7aa9e7abcc2cf9364140ea4fc14bf79e4a4 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/30157c97f4a47b34e38f86d064e9b404e3f84f76 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7bd73169301137f40c97c5bedbd0603dd5182b6c |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/15001ccf6c3220f56daac5a6cfcf2005b25343a2 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ba3c21bb502eb66de49e793cf6a70c8dc4f9dc13 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4d8aabf8e9af60a306a9570ab73026f3be32f51a |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7aa9319da4d387d32238bcbe30c66637a190da5e |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8295e239666d3b721d0941c778c305435aa6d589 |     
    sh4a     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/845e91365cf7c911c61521c5736d9877b182fc04 |     
  mips64el   |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/a75cc7999cfc8ae678377c6f807780e9bd55c49c |     
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/f4569daa3dd596e0ddb5ed3fd7e4cd54c5e82cbb |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/a3d8c6fd631b31e272e4d8cc6c3318f2e4151882 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/fc6e97a76f2e31d860e5a744209db9edec7b0d2e |     
    arm      |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/d16a24d60b298d7616a516ec0c6c30696ed93a58 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/1f690c77ccb8092a767f5df340a60d541374aa5f | ORPH
   armeb     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/00dc179edbb9ec66ee72ebf7e07b7f3b82e78825 | ORPH
  mips64el   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/da98c3ee747702cce9e561dfb2e4dde57bfa99fd | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/2ce96c17bf412d9038411b0033769fc465874b72 | ORPH
   sparc     |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/7fdeae1c8e0303e7bb76706ffbc95b0b038bcf0b | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/c8b15468318090208acd21ea72d7dc322dbc1162 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/b406eaa5765c3f793b2e69e4ade7b033921e94e5 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/0316625306e0ffdcac5777d1b4e3487efbd8e54e |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/ad498786ccf70ff8555351ebc36f393459019a99 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e6b730830602b0706adeaf97ab37301af798b1df |     
 powerpc64   |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/8aa1e3f021ec40deb53e6d6250932c2f03c27af8 |     
  aarch64    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/b81e965d65837be0b211fa5e0a62144bf8848980 |     
    arc      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/2dca51b5e12061ac45ae8b27938fbedc75759a0b |     
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/7ee47340fd3c21e7ee6ece46435d5bf821352ce6 |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/e13c5cb4df088036810c458c1f4a674bbca7e1c8 |     
   armeb     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/fbea97723f1a8e3c7c0d765c7bf4e255dda4c339 |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/e5908e4cfa2405eb7041acdec729d41c04bd3f39 |     
 aarch64_be  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/fc8d92e88e555e355c8189e06231f82a9c03c6b7 |     
    mips     |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/35baea8edca1547c406ae41f7e01783e23a5c832 |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/59ac10ff1dcdea1f48e5ce345a46ce1961fe2a54 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e01f3a8a7f7eac9e4d641b7e01f85284e15ca1f3 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/0e7806e6dc46d5257558072b82bd857d6756c501 |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/5cfbc0fdf8a94303d493845dd24a1f5f30e4e164 |     
   mipsel    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/11ae882e4e46e02364790d0c4193d69f49e38982 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c8ca544579a96175bcf9ea82b3eb767f21b4d705 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/85d7ea3cfe621b5d518acef01a091f787de902a5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/892d9b156b92255c8b56d18fe517b238d05e83cf |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1baddf6f8bbdf574d346aacc9717bd9699e5c2a0 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0d58a911606132547b60cb50555a51d8985ba53f |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/c5dd7b17cc512de375e53d8c8d0870b24e0e43a1 | ORPH
    or1k     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/9663c3c359499ca76e9e463f4c927302f1f3d849 |     
  aarch64    |           vlc-3.0.20           | NOK | http://autobuild.buildroot.net/results/c6c3444956c4d03dc2b8483630915fb985306724 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/0a0d78edb5d2d4ff31d694df3b50fc4d8060c00f |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/48eca18ea31848e6f5b758df178144040398370b |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/38e8babc7634c375654d72d92d829ccebd554c9a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.27 | 2 
android-tools-4.2.2+git2013... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    fcft-3.1.6 | 1 
                    gdal-3.8.2 | 1 
     host-moby-buildkit-0.11.6 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                  ntpsec-1.2.3 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6431c3fa1b63d9cfb057959e86adfd0b4bf8b18f |     
   xtensa    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/423d9b110d716873564d129ef3c10b74fd9fc64e | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/6d7e7883db9a63a997eabea9cb187d7bb91ce7c6 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/c965b6f3e35f2008be551b2ff22c7e9355f8a8f7 |     
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/5bb39505e03a8a58fc182fc531b7ef21fd0a01ca |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4695d1783849086420031a2fe3161f97cc3d96b3 |     
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d5d7e0b773c997866a54c38a7cdf297867662d74 | ORPH
   mipsel    |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/89003fbccdddc91152023691243cd4f105d96eaf | ORPH
  riscv32    |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/f13f68c7686bc5eaa243d77d33117b25a7fc617a | ORPH
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/1191b8598159ea385a044f25b1bbefb12781db70 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/6fa2e4b95aa7ad00d2c24c0e744ea4da0946f7a3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
