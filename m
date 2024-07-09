Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F37C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 05:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22B660AC0;
	Tue,  9 Jul 2024 05:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkTywtyNPXpY; Tue,  9 Jul 2024 05:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B387B60AAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B387B60AAE;
	Tue,  9 Jul 2024 05:18:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 442121BF97C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 273F960AAE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Qg-hNuhER6k for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 05:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B23960AA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B23960AA5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B23960AA5
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 05:17:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45ACA60007
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 05:17:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 09 Jul 2024 05:17:53 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720502273; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ltLrakiGaId113E62iCNHvvPUdfXpcABWCnqtusqr94=;
 b=Fic8idg+3XfydohkUJHCxyfScyxsIbYCfT9+Gyj0iOhq8bpsFnleS4liLuXNmvhAD2UmFu
 970Ct6RwhTfxg+STu0eRTzTptkWqbi8bO8KjC/cpdBpbMbgFYUzIvFo/17cVZJrEw7CqTk
 FL87fSF7Uf3TB2uN9PjVGj+dh1fjm6ci84BEZ0XtzKEJLyU8GcNIYWbXRRNl5hNIeMP4U4
 bAWdLvuGS6PIxNQDIK+edrHPRGW9kTo34NJdPuY2tKSPjXWHWUSCVEZr3WcBLuCiwHrsNF
 opg5Iif5G1xqjEwELnB2P2ujxRAcQfUh9Ce+qE5cwS2MRrgcEq1G1kXsarCyvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fic8idg+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-08
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
Message-ID: <20240709051753.WH3PLSPj-KmABIXtrH_V5MuseqBar_mgODZL_8lhtuk@z>

Hello,

Autobuild statistics for 2024-07-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  5  |  1  | 10  |
  2024.05.x  |  1  |  2  |  0  |  3  |
    master   | 52  | 459 |  0  | 511 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 56
host-prelink-cross-a853a5d7... | 42
            host-cdrkit-1.1.11 | 39
                    yajl-2.1.0 | 38
                 haserl-0.9.36 | 14
               cracklib-2.9.11 | 13
                libressl-3.8.4 | 13
ibm-sw-tpm2-5452af422edeff7... | 11
                elfutils-0.189 | 9 
glibc-2.39-74-g198632a05f6c... | 9 
                host-odb-2.4.0 | 8 
aer-inject-9bd5e2c7886fca72... | 7 
                dovecot-2.3.21 | 7 
                   httping-2.5 | 7 
                 libcurl-8.8.0 | 7 
libsvgtiny-ea9d99fc8b231c22... | 7 
              fluent-bit-3.0.4 | 6 
host-android-tools-4.2.2+gi... | 6 
                  libffi-3.4.6 | 6 
                 libp11-0.4.12 | 5 
                    mpir-3.0.0 | 5 
                       unknown | 5 
                apr-util-1.6.3 | 4 
                   evemu-2.7.0 | 4 
                fail2ban-1.0.2 | 4 
       freeradius-server-3.2.3 | 4 
                   host-go-src | 4 
                 libssh-0.10.6 | 4 
                     mtd-2.2.0 | 4 
android-tools-4.2.2+git2013... | 3 
check-11970a7e112dfe243a2e6... | 3 
             dahdi-tools-3.3.0 | 3 
                  ffmpeg-6.1.1 | 3 
                gnu-efi-3.0.18 | 3 
              host-rust-1.79.0 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                  jack2-1.9.22 | 3 
           janus-gateway-1.1.2 | 3 
                libxml2-2.12.6 | 3 
                    norm-1.5.8 | 3 
                python3-3.12.4 | 3 
           sane-backends-1.1.1 | 3 
              udpcast-20230924 | 3 
                 apache-2.4.60 | 2 
                    attr-2.5.2 | 2 
                  boost-1.83.0 | 2 
brcm-patchram-plus-95b7b691... | 2 
                  cairo-1.17.4 | 2 
                 dc3dd-7.2.641 | 2 
 host-softether-4.30-9700-beta | 2 
                jemalloc-5.3.0 | 2 
              libarchive-3.7.4 | 2 
                   linux-6.9.4 | 2 
                  monit-5.33.0 | 2 
             rabbitmq-c-0.13.0 | 2 
                   rauc-1.11.3 | 2 
                unbound-1.19.1 | 2 
                      xz-5.6.2 | 2 
                apparmor-3.1.7 | 1 
                     apr-1.7.2 | 1 
                 augeas-1.12.0 | 1 
                     avahi-0.8 | 1 
                 avro-c-1.11.3 | 1 
                   botan-3.3.0 | 1 
                   bullet-3.25 | 1 
                   duma-2.5.21 | 1 
                  dump1090-9.0 | 1 
                    dust-0.9.0 | 1 
                  fbdump-0.4.2 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
               gocryptfs-2.3.2 | 1 
         host-gcc-final-13.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ledmon-1.0.0 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
                   luvi-2.14.0 | 1 
               mariadb-10.11.6 | 1 
                   nanocom-1.0 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.24.0 | 1 
                  ntp-4.2.8p18 | 1 
                paxtest-0.9.15 | 1 
                   perl-5.38.2 | 1 
                   redis-7.2.5 | 1 
                ripgrep-14.1.0 | 1 
                  snort-2.9.20 | 1 
                    sslh-2.0.1 | 1 
             strongswan-5.9.13 | 1 
                      tar-1.35 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.49 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
                    vtun-3.0.4 | 1 
                    ympd-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/62f28bfb59da0ad7cc20c8dd73d72ee94035994f | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4ddf0af21a0bf7275b7e7ba80cb828986a9613b5 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/37df99897bb530a420e151a01c7e0e92b6f61d92 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/40b132ee89f2f57ce90dcf5a2c718e42e277a12d | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/fd6019e2d766fbe686c692bf190c650c63e6e726 | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ba3afe63495dccda02b924148ece029ef5657a7f | ORPH
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2db7279867ea2e0ae911442e8d050ee8d7578499 | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a95ebc0a6e7bcd1188c53cd01845f5ae2e899571 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1a3caa95000331daf39dc00efa3a662a917b6b5e |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a60edfa16e7477ec0a3b4a0855f35e233f7f7af9 |     
 powerpc64   |         apache-2.4.60          | NOK | http://autobuild.buildroot.net/results/f48c24d2aea1cb8b67a858f1a7e73e925b3f8ab8 |     
 aarch64_be  |         apache-2.4.60          | NOK | http://autobuild.buildroot.net/results/2b23317f3c0d6edc221288abc3070eeff4132d68 |     
   arceb     |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.net/results/2fcc012b965da0cae9f34ab8c75255c0a597a321 |     
    or1k     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/8f506fec974eada270d755b723ac03cf579bb98f |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/c1141273f39b6bc1ab820fe0e5bd3a14e50a9da9 |     
  sparc64    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/e2cd9345b6a41d7a9c7aa9fea455dc9d67085e61 |     
   sparc     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/992b177969f30c732b18318b95597ca9d7f9da82 |     
 powerpc64   |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/703d04d44e8d68c9869447f40c7b7a5f429a2c56 |     
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/1f11b235499c96bffb033574d4461adfed243058 |     
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c2fb3e667c6688526c7825be558eb432f9d93352 |     
   x86_64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/844acb67d0ee3c7d558dc6bd28c9386448e12f85 | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f3b6511d5e1815f15b8343d6644a8e0af43389a4 | ORPH
  mips64el   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/9e2ca17cdee097fdc29f9372071a2f8bfc28959d |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/e63172164c8c0c7fd40103595e33369411fcc4e5 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/99e4f636285ea2512daaf1fb9ce812a7365bd667 |     
 powerpc64   |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/ffe9896277c8c6333d0599da3ef58bb975065543 | ORPH
   arceb     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/36d0eca0418bdb129b3d809a1d109637a58f071a |     
    i686     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/3a8b2f4d73c5b4178b8cadbee2c9a7fe6bfdbf4b |     
    sh4a     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/c843666eb8d2595c4322c1179c9a277f395516b0 |     
    arc      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/7892d98e0e32915b50438113c04559603ca76eae |     
 microblaze  |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/e7ae3b44e67cca7150bd04666676a45f494ba2c9 |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c3a0d1ad42085d8ec892237c9ddb8dd8076e92d2 | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a1149320367323fe889d6e040e7ae84f99339f38 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3bf643707ba25aca32ddeecb94ece18461b76018 | ORPH
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3d1caa15e62b9d55b4c3c338fee5b6d459f98220 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d6176de0a226498d3e7278eb20765fac00fb628f |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/27a1941bd1886c358c94a7226579d8510b435901 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/29da17f5d4371c9a7aa8b8d82b2c834106abb0aa |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/7aa540c6015090a451421918fe45208c5cd7a7a4 |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/803f096eed05a697642c51455d7fe0d5722506e4 |     
  powerpc    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/7d27973c3149229033a3e19e051da2d0efbfe615 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c78bba8fa5176916b7702c0723009c3862277f78 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/95cc201c2d261cfb13911a0bb6a663691b2f127f |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/48bd63d3f7a5db01021fc52de4b6318277ce59e8 |     
    sh4      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f554a78cc37d6ebfc05df4a116b9a93bee5d56d7 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/54a0abcd8dca59b322754c22fb620d0b43a262d3 |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3a06a5c20ee6a541f2ce0ccbdce1969d715dada4 |     
   armeb     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/2c578b5df06c2791048f009b20076911917a6ea3 |     
  sparc64    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/81e08512a047ec33b53829cf1dd3aebd6275ffdd |     
   arceb     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/9daf1f0f72361f950516fe7c2f098919fabdaeab |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8bb213b10858b3765b4b76920828836477269a64 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b61fa3eb0b53f73cb2801e82cf2e95973e84ade2 | ORPH
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/82e570c49205f98975aa0b064152db75ad8687da |     
   mips64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/945d2b6accc1c3a69c6036d361eaa62f5d111fe7 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3df918484b255e696d18af029fcaefdb167eb924 |     
powerpc64le  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/87bd83a12278131fe9af713ed5ce3c023183b927 |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/0b913e690242d8d9c807d0e7b823abe061004031 |     
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/b182b9a3e8c9834b231ed2d2cae454a4002b470c |     
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/76f20f533ee5ed7ead57e32773eb09ba4d0e3031 |     
   x86_64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/0e965e7018ff27ed0782bb426981632fc1898eb4 | ORPH
    sh4      |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/536655e0c8e2ef411592e5b442fecacb2e1b9f66 |     
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/459e50ea58fbd4554848166bde937c7d3212b71b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bc7848e86c2874b3487c6fd232c68ccf7349c177 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2f791d13efb72503b204bfc207afba5b4648adec | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7d5dfa8c003e199880fcbfe4796b440de0066845 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/26a5ab4d6a57fa00431ade05d4ce94c077ed409d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9aa628f387e223d70834c07f8383da6604691a4d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/db6fe910187d1cb4a480f28c1134a025a3a79815 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/67ea8633ece8b2a24c7fc942db6486383678c614 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fdfeae03eb2de41666b3fea23ae80d1280306084 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9862118ff409d769a213fe1c363eb6be27c8b455 | ORPH
 microblaze  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/856790ba7b54e807561944229f858569960a2610 |     
  sparc64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/a6e97bfa2a85c155b07f9a1dfd4a3fcd06ae36f8 |     
   mipsel    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/470f648c955c028f486af9776bb1e6b3b039051d |     
 microblaze  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/c647d7b44a6709e1aa1d075826141867a3577893 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/36c496fc0b1c45d02361d88059459633ff1df639 |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6efe7ef9b2e315816640a2bcbca471b9b1ed87b1 |     
  riscv32    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/60f415a391d6cab76998531798320adeba42f299 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f9ff3ec9ec07a73e6c90b084daad6d34a105760c |     
   x86_64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/6d6e78b0728779f3b08736d9acfd40161140d5ee | ORPH
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e6e740a93de2172f237fddbc5d86453c5ee6c2f2 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2620ee1c9c03f9297a6b336119fddbfbb95ddfe3 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/db90262efa58585e65b40eb4d963f640cc33aaee |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/0fb77f1404dc7add0d92191da1ef0fe3a4e58709 |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/10a6368900c765254ce34ba0229d8e8979cc2e78 |     
 microblaze  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/46116c76e72ebfda6eaf12123c6ae908fb0c0a45 |     
    i686     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/04648f5b4424840525867a41670b1523464f09bf |     
 aarch64_be  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/43889f76c2eac7edd86fd7e7737f21b021a3f122 |     
 aarch64_be  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/c08c00f52b8f42fd408a1e84e41606d75558c3ce |     
   s390x     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b7fc72ec6d765699a644820b2495427863150355 |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/14d7556a118d8b48885db47ec25cedbd5c6ad4ce |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/1ade398926800802529d685b92af606f99397225 |     
   nios2     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/fc0feb9f104b039b2688c5c6be1e823337dccdb8 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4366773ee944aa2b27e481ed4f7352a4426b8287 |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/74b6f33570eb68ff6f7844b35c2cdfec9e524f67 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/ac7de3a3bbe259b5feddeaa6678aa7f0142be634 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/02943ae82cf828b0b5f245bfa01a7647cc8dd132 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/935fef3df34c09e2193ac48128604f9c7267c60d |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/05d6f522d234fd6ca19d724f950eab960af037f8 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a0dc159ed6909e3afc7220e2da6511f9d46d8fdb |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3f2cdbed100356b6d9d0d130fdd9611b1b4a4422 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f04f777cc15044f71f44a5c2266c9698a9db564b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2a8d83321d9b80aa66dfc0755df1201d416f534f |     
    i686     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/45e5da95bea3f342f501faa0fafa35653906ca1d |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a82f839b6f2960310e58674be3f857f5f6f49ba4 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ec6bf7cda350fa6e9c0fb078e44d294b1bb4febd |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/983b914e744416813106c6ba3cc0411843ccd288 |     
   s390x     |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/c6fb9b72d98efab264c96bab81e7d0890874b2ee |     
    i586     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/d92b19fdfd90534b1e66e38662aa42ff524563a0 | ORPH
 aarch64_be  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/1328c1b015384d769b1a15f5431e642b36479c6b | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/cf9c01c6a9ff9e544681a9986ca5ee3e930b22ee | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/4f20d40d9c3f5352e71b266ce4e329107b17f4c4 | ORPH
    or1k     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/244afc111f76e5f01904eee7540e0114f962baee | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/dc7a3827a7d0da1fca4d4e278dbd0fecf43c1a34 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/c5aa49c5dbae1f9f9d231a53accd5e1496cb869f | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/90674a7ec7f0acd16b306b3b67995f56f9e1d9f5 | ORPH
  powerpc    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/07c06cf4c1fd5cd352f03c199c3f6419b9412f18 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/91ba5e1c2e9c2404ffc34baad2e37de8c88e9fac | ORPH
   mipsel    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/452895d69192bebf86b1dd01a8d69dad09958196 | ORPH
 aarch64_be  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/c141e8411556b127036880c97ce7060b4b585d75 | ORPH
  powerpc    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/d5fbea3dd8911cca51706d7ffdd36516a57d1142 | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/f832802839d915a6472708a7b1cd0b4f9826e846 | ORPH
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7c624780eddb39e1c4b432021ef1082abc9e92c9 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d6b6a0d1286b894bede003d3684a4de7137dbccf |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d89e80866ab09d85795435467f29cf425eed6968 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/cf442c8d97d8aa9b5ae42b2d927ece45120332de |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0a648c6e72c5442ca3ffdd353f4f3aa5c842825a |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/acf7f62f6b5952f9de2a8fefef1e6cf464cfb459 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/12c144b9bd0eb79a5ed0c3b2a3a8e1fe4fffc09a |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c37089d11686dbd8f86d11efb98a77bd43da7859 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/87bc3a328dda0c77ab9052de6b5066d8faa9f739 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b1b266cb9959923d55ef2e8248790bedf6adfa85 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/53d636a395401cf74021bf5d17e4bb0462dd3471 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0aeffffa7da2253d4bd12663d3a4f9b6d79b55c7 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a779d2c80058c5997a41db17feeb055d261e665 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/36bfd47ab50e9174f81a7111b209f4412e896041 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4fcd66c622e3be1999e9d5b355020c29a707ff19 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ad969f62cb66ee3cd98517e4806ffecb4474e187 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c540158033527e5ff36a6425f04ad9071bfd233f |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b2f5740d02952f9880212759b297221b1761b9a9 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2d712365bb5020a9ef946167372ece72111be87d |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47ed8e17dc60c073ec65942c9a14a1810e8d5b82 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f36ba65bf2727f811aa1c5b69e40d9662006e91e |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/24cd2df3f41d5e2591b6821fbae84837d8af96f3 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bf21f59720596e55efde67fadbbbb149eae9d92e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c2db1ee8387bb186f20a179be79d35e71d6cd62d |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f5749e5084a5416a02950a5c3dd3b6dd074b728f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b7033ed5319079a5c6894de89337eac8442bd6c1 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f4bf1c6a455621abb4c28fbaead9810ca7f50832 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fbd9eb56b2e4573dcefdfab96fb5a911c9d5200c |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5c1decd5b6bfd9c73eebc6aa987a40304d12472e |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/06c991e74886ca381f22558aa65e05b75659b658 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8376c443d6af8994e83839f1636bd32c0b79338c |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/48a7f5e61e7df525bac70527ce21f3b8ab86daad |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/33eb0d567017119d8ab0b3c922b4df0984503a86 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9783ee46c487423d3edca2bae1a25c4bf549ed3 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8fc1127a1ff763da300f560fc9e02d332f072568 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/83ff207a2c856967c73897e8216c1555c86d9a82 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4033d9eb9570d5c5cb2a0f7120574508a95941c0 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4cb142fcb3b914ea2c610c37bf901a7e1b978daa |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f5b3b934d8f70f20602ba702a9a9725b2d049d97 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0329a16505e38a8d45adac8ba33a7a287b9305e8 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/da5707ce44ab253d759f96576cb3ad833d8531b8 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d70212df49fbe7401ef1019032af8e68b86e0fd3 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1fd516644b320ac139c71c9a85de6d516655346f |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c3a8b459a2e25f957de5039ae14ca0c34c8718cf |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/85a07a2d6961fff764ffcf7021dfc09a9deb2cf9 |     
    i686     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/7ee83ba1d3859dd4dbe6a5930b2eeaaf03c34a2f |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c2ecb6eff18ba60f3db83785a0d487803758bdfd |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9a9fc6f24b1f21df918839ac1c38f854e31795b9 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/4902c83deeb04255633e3e8215ac562503e4123c |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/013d668ef723618144d77be45fe487c29ef1e3d1 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d00464d880b57d388cc6f510489bac22d8682d83 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/00f40f3e2ee0d549e038ae1fd194fda5ddf30e00 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2422885f3b98701b53b361dbbb2bc6907edc1cf9 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/145347fe52ca53d28feb18afefc57038cef6f9b1 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0225c446e4071edc28ac8cece71a185a5a082cb5 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/de11d20c7195de34bd04127888086690dd586a8e | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/726134ec49a0e9b7c3a22a93911dba1926a13415 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a64a49a4ecf24da07005bc805eec4d18c675af6f | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/57a72df4e0b5c39a2c1677b7f0142f86e1a2c653 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/241837f919420bc8734703156debf8270d3edeef | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7c08a73992df3c9104429efd03ef163cc7c2876b | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6d138c2edb2a3f808db82cf11aa400ca4c8b4199 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1c459c7a05423132fefdf853a2cec9a047827f13 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a2e8f664b4ae3ab6f405d51415b6eefcbc71ef56 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/abac9d015381a6c3fdb6a67bb7eb4d733fa9d94e | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4d2efe908d516fa479a6d50381df450ff02fcf87 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a6dddc70c5ad77d7355f44b3bce69309dc5a17bc | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/09b45d603ae4ce0d03d2c40e67ada45de3954494 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/595201dac8b8b76f19489ddabcfb0d3c838a6fd6 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d43a63e39fc7e45846545e35f5c923d2c183a6f1 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/050d2770f9772d5fa47b1b3e8944e0fe96141dfd | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11c9355515a1ae4c6173eea88b4f26324d0eae60 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b36d07284989e16f0d39308e5b7fe92bdf5e1044 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24f7dc2d22392cc7df5d3a143aa2c5365fbd0a6c | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8731b9aa30615c07f7285b0ae349e72896462375 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49d11ed085e86f56e89b3ec199c05dc17d1a84a7 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/54d3a427cfc03ab5e3d4714a09cbc0fbeb481179 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/52934f0c618e78769d47dbd91ca8358bafc8debf | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b1332903843fc00862e5957f798a750e364fba92 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/946dd3df7538d016624801cc51d11f0573dbeb14 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/90b1c1017c824b16a870bac3679d37e47c938259 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48d577cfa33dc318b129542060d1d19ec4f67688 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eb5b683d47f20d5fab9e4040bc2071634c2e337e | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c7f3a8a3af11a5acb7fa6c97fe103cb8d8b654b2 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0af971554c611cc9f85ccbf547a6a49fa09f2edd | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c37726a922f1e0334450769d3de9f464a57a18d | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/787589601192dbbe7be371d344c450b423fdce29 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9f50d91ae8b8e75c9c5fc625d8c98061dfe45a72 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e1e6e2a8c9edda7f3ea748b86a929e27817d3637 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1387c050630681b4d0d214347ae2829177fb8ff4 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/848b5b105f6ba56a656ae0398dabe5a22a6db3f0 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8ed686f38235fe2f823214e5fbfc4b2d6b0eccbc | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0140badddc87c00a237f95b97d6637f82e17c1b0 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36ceb0a5a1203dd9e9bdb6d86f64cc781b3b3d05 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5c6a371ecead12ea143a7e51c6d3f64656395d2a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e76d647aa97a011a9f94ddd2c4cc450f3100f05 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a293309af992d478a21c692f11bb126ef8c24c7d | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3a8a109fa18796f6d32e978976ce5e4dcc9a14b9 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0fdece227ad07ddba2869557b9e9ce5d742d5275 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c4302c53082a3b01139651e27bd13977937cd561 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7eacf73ea7bc90ebe91d58cbdd530b816463e80e | ORPH
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/99c67bb8c41d54d902f6a133c6ad8257c61534f2 |     
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/b9cdbd0dab3bcafcb79ce07bea3b40743ec1c8b0 |     
    i686     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/68d0891d6d06f2c08858622dfa502fee6723e29b |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/1685b13028da574ff8012fc17d93d2724303b6c0 | ORPH
   x86_64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/14bb5452bfb9aeeb990cb40095fad9526e4e83ef | ORPH
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fb13a5a67aa5e9978f3c1f66aa3f44f1432595e2 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c7cb984577ab6e9b61458f652769b6eac9dfad3b |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8acfbb87836ec145b261ebf9a2ecb0a3cf7833ff |     
microblazeel |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/58b913a07951e42383c108afbcb8a6af44670742 |     
microblazeel |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/abc0f9c0d53b197d41bd01ac69bb43deb0f1ea5d |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8429e79c05b41254caa5320e782b6afc69428909 |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/9358feb07538bb10437b47fefec437654b4376ea |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/4fff808ed975b6781fbd38f9fa9b10a6ff9dd3c6 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e83157bb611c09e839016dd7c00005f906ef2016 |     
    i686     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d6fb7f243faa750b3c1024f89d23559597731bd0 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1dce874dd76916b7ab55e435feb25d6afd67fb00 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7a02d2d2d5de832117bdbe3b7fd80994d7c33b75 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6a1d6c19e52447ab29ff8590e867a1cb1830eb71 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bb76c26a9dbc537a1a4a96a07823f893f5480908 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c32925bbf6b516392216dec0da1ecb5873a5d861 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ebb8119fb113e495cdc5e2756601c674eb3cb219 |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/434ab1d0cd3b172cf0ed8597c970707920ba0edf |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/835c762dfed8323c15257042c2c184d98a69dbc5 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0dce641b37ae58f4799d09e3ffd30c2c7da5ed44 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e1a87f9388671dce1697efd951c3edb2c9b1dcfb |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/adbbb740daa036a16521b9359c427e9e934ee402 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/4cf4bc1a0f1a3862a03395bc864cd96ae15673dc |     
   nios2     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/2cfd91270d5a6bed139b0f90d64015d847d588c8 |     
 microblaze  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/5d90ddf2eaa35edf951ad55ce1650c1b4bb2f69f |     
   mipsel    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/48bcea138687dc3ce9d9839d3a8800e5c5c17a38 |     
   s390x     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/a25935649c7fe6606ddb6648f65083bd57c2930a |     
powerpc64le  |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/40c33e0adc48a6426257b88897b03212d2a84539 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/2703c39832946a2ab2bafe94159bbce0a29e54a3 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/97d7928a69284913ea764dce2fb83cba91edfdf8 |     
microblazeel |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/52931c682484146420941e33b6fad05d5b2cf4dc |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/696d7454ae751e0e7155a5288176564f772f979d |     
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/79e94b5778461bcd335f1e0c865832112acbdf10 |     
   mips64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/832c82e3db0c21542a12a3068258e9f3dbe4c5a2 |     
   s390x     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/5571bc04410e8c98bbb751fc41315d9132002110 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/075aa1082ea04d75b1adb228466d2b7dd3124176 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/9d961d8411365d2b0065f35405d433cb56f04d24 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/cb7716e83968fe44efe8367241c119dda5a25b14 |     
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/29125dae02eed610536059fa13a7ccac8b23b4f7 |     
 microblaze  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/9e3f6dfdc442581a17726a449c811a2c1850a32d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a7d29e5d49ff480ed31680a6aa2a931258e95d4c |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/53b1c25efb39650e7cfbead54c17515733183a7d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cdd4b3612a768e252aa3162d52e7ab6a345b1107 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1b8ed382ac786778fe6f016ffcd40c39efb77023 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3c282934fc060f69ab65ec3639dcf700b5c40c92 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5e896a6f0961d9de50095335130b6e10bb99ebd5 |     
 microblaze  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/795820014f95e1f63a0081b0e759c3d2610ca6e9 | ORPH
    i686     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/9793cd2acb10e715266942ed7e0b5c6b6a3aaa9c | ORPH
   mips64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/4043595128c7b1abc1af074e6bd1b8bfa5384b93 | ORPH
  mips64el   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/03d871080840180040415fd34016fc1b755ca0cf | ORPH
  mips64el   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c823c53c362c45611c86380b31e7a97b7c29da2b | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bd202e17fc210d16b282942b2be801f4d5bbd0bc | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/66f009f4b85bbb07869a75a8219f76d08a2746c1 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/29faf938c745a8c4bf11215569604262eed59214 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5e805bea4a1e3412b80fae8143bf010a40fe4091 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5f8d6ab4721d9110dd575291c4e4eab024e2d976 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/da7ba94a19c6f640652ec3906f36af12a5c7b745 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6e849d8635145fda2e0655d5b5cb8ee305ee07c2 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7095ef482b0011e202824c37f0320cee50c0136a | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7c01c3157ebedc03ceabef44ae6a7de20b70c8eb | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/55c834fd38e42a1703f2ab3ed848cdd27134282c | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c7182994eed244fdd9098ca98eb13ed14a4e5ec2 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2f9895e6d2c71f68af0b80e852087a2a9e262dd3 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/64a32eb02e544729702a8ad41935355f096bda52 | ORPH
 aarch64_be  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/ca0e2621b6e7c4b8a55bd20fcc954bcd909e7162 | ORPH
   armeb     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/d74aecfeac0c3987ceaaaac6da3d2e973fd2e774 | ORPH
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/26b1e11c8d3ab3acad7f7be9c066d85a253eaa1b | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/85d7afabfdb6ef1dcd20c8d3035dcbcebe8339cb | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5e4578d61b4e53523a5b5bfb2ab4c78dbcac1434 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/931f6f017ae85c077af07b54b67fd4a3e071303e | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/badfacbee8423858a712cfd22d9f6d1c22cb9dfa | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/09587c1295f3ac1f749b508b16afa674c911d363 | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/414ec23bc360a548d9b7fe3d7d699f3f5176f748 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/fdaf055666707e47f0db6f8a1eac4c359110485e | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6d753da78f28cc139c3d7c22746cdf8e5c65f87f | ORPH
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/3f3b76aa15b66d26eead12a7f5c1175a18483db7 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/2a95ace71ffa3181afd7be1718e4f7a711b5ab03 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/98ea5ffce14389dc2ebb14bcfa35b2091bfe7891 |     
   sparc     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/56de5903b48dd0e41f8f22cd3a64469f6d498f13 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/5f8a66deb27e86282d48082a5cda87c7f531801c | ORPH
   armeb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/bdb7be87950961bbd1b49e253d66a859e597ae33 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/7619266c11301d6ad74d3641615214033772a2d8 | ORPH
 aarch64_be  |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/722c767985d75b82baec8c3ac55f8eaf1ed6d07b | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/74828b228310ff0aad8154413cf1aff50fb94721 | ORPH
    i686     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/ddcc543a2c83d796f5d29b441c9c808291adc3a2 |     
    i686     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/779d3e3510f1289a9cd863965cdbe1cb408a0d13 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2460495aeaa90dc80feb505fa5e7dfb70b8924f8 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/43dce4b93ef8823f4cb92ba8239c0e60eb2457e0 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c174e859034b4b9077c9d774ad86a4c046db177b |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/44406f1c946e08448cd190872ea8a5e061eced88 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3abc836811c9c655f8304fe819efc6650079a0b8 |     
  riscv32    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/228998429156546b72d4fac53de46a78614698ad |     
  powerpc    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/31870c030de4943aef4375ed4c695f580a0f9ef7 |     
microblazeel |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/b87ac462feef43ec192e0216e6d72f76833c90d2 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/0a0fb057d81c705674decb5f0e067114f67c79e9 |     
  sparc64    |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/cdbebfbe11efa74f2e27b97e6b61889d009a773a |     
    m68k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/4637fbaa8ab1daf545ce3894ac278b41b4e1d030 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/37df22ccfa5a72f7d845d209ad59302f2863c5c4 |     
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/75b65183871b52948939a0a30cbe15acb8add634 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/39f08f4675a0bb667625f9b5cd6f15f8721efc3f | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6ec2a4d3f0d21685c31c7081c817b88b8e3a95b4 | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/4eaed68dd50b750c8be88c7ca29b4be355de5ada |     
   x86_64    |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/a82a68a336d10cef6a81af5ac58fa15e679d8d8b | ORPH
 aarch64_be  |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/d1c1e222bbf98cff0bb693e3cd219ec47da5aba6 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/d698915a4d90ae1683428a3ffed35141926f8e59 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/56edb5eba948156f93281ef9a65dcff765da0abf |     
   nios2     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/d21d66bda64a8cda827ee817145a09e2ad0526a7 |     
   sparc     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/1fe3241c727db63cad843964b135b4c33e094d19 |     
 powerpc64   |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/3dd864f17217d948b93cb097e733b934df1c313d |     
 aarch64_be  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/2eb28ebcba9260278233bd10118fcd3c18742bd3 |     
   x86_64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/c7ee3d6902210013851b8d7bf722fbf6e76bfde0 |     
  sparc64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/32896102c0bb7cdee89940588318402e4a25acc3 |     
   armeb     |         ripgrep-14.1.0         | NOK | http://autobuild.buildroot.net/results/7c5556f9a900065499a5f73b0f2c42889d60f18c |     
 aarch64_be  |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/b77e0ce3bcf26e8bcce248827bfd427b6de9ceae |     
   x86_64    |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/478118743f8c09d07ad545db471574839236ebd6 |     
   sh4aeb    |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/f1b0f268759017791e1a6830af54fa0b8f3eda14 |     
   nios2     |          snort-2.9.20          | NOK | http://autobuild.buildroot.net/results/475e8be350b83bdd213e04a1a1c19370bd9322a0 |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/2b1078c127f5adcd653a387fcd22d9e8c9c0cdc4 | ORPH
    m68k     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/9e148c54ee57d52e68321006642d26eaf25cce9a |     
  powerpc    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/3e84d4d0b14d257fc3ddae12d610e3603b6cde2f | ORPH
 aarch64_be  |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/99d837da7d7dc07a237f1e2d74e1dc916184363c | ORPH
   x86_64    |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/222bd8e6182d43cb425b32d7c76f0e22a590f2bb |     
    i686     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/085545a74cf0592818795f9a58f5568353986877 | ORPH
   s390x     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/402370bfe52121855c2eceec570b16cf972636a5 | ORPH
    or1k     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/26fe218a79137064dc0804dec88d07909a6d343a | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/9e1b2ea55bc99f636980ba4391edbb2c44bf812f |     
  powerpc    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/58efcaf9d6c5ecb253b195cf4a6fd45654959242 |     
   mipsel    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/78d8e63a047a53cb9f9f4043880f93f0172fef8c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/01d2a18ac975d0a8ab5ce05fd0fe8f03b25775f1 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ef72c7a06b0a92af9eea428a687d618461e9eda |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2fb139d28307a1a585a2d05292f514f92ab2d140 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1b7b19b8f2fa7c510ba553e7e974cf03b849f4d6 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b8b9dcc31a60ecba93fe96557c0b8d41cb0eefc |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/717bee2f3dfa8eacda43bfec659003dc99f67c23 | ORPH
 aarch64_be  |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/ab33eb1cd6ed57b298f4e66c848c90db47c8c508 | ORPH
 aarch64_be  |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/dee157494a05700d220773dc6d872be82fdefb75 | ORPH
   x86_64    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/5541f7fb8589faefdc700a66c69142b1323b7895 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/04f48a6be800567601c01c8e496dbd42ec65efb0 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/563e23318cb997cdda496453681736c1c82c946b | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0950569b478fb57a7a9d14660ef3dda3b8fe6e98 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9ad476e52fb395041e4279af28f013f04ac8ea69 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/40fbbb51059893b06cd48288af3c07adb23919df | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/456ac5fcc642c167f4ea973d00b39acacb417126 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/117106bbfc5fe97a6bffa31e964754726d36d305 | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9df5f9dd33ff91bfd6ab4d735d0228b4eec1913f | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4fd644b0263f4c68850cd96fc63c10be0a0621d6 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/54a41c047a8f07abdae8580aae16d08f98fc45aa | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ae77b330bb738cb64642f05ec4b80be823a345fd | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9e23beb0847499f2573e2342f54fbc55129ebaab | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4346897a9fca435c4b53be0021348f291b861bc6 | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f45fa4b32fe2fcf73a54d678d38f6bfaa80fea69 | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f34397c25e196ba0b1719c3aac10b7cca08f95b0 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/aaa6966a9a63232e834f78cd2db82fc72ed5804c | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ec9e12ce12470a02caa9f9c0e4d0984e83c01294 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dd2b8234204de32e8b9c9cfe8dc29d9cb17516cb | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a8de68445e4510c73685783838bb50da4756cbdf | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5b5567b461dc1900e52cd69d42af5ce6ff7a191d | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3eac24d805a565bd611801acbe04dc648ca13b8c | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b9d49481efed547685da9528a9c95b1367e7c707 | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/31527f947d1b9f4d895c332f9a1ac7a678be0e97 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/1f1ed60033df2faa2327b02c3214128e72e5fcf3 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a5e528f01ac89ee2093ba52660a718673e0b5c7f | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/90d636e5d5bdb64e3fd6c070a7060bd9fa9b63b9 | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0e0419ceed5ba06b3fc6b8c7514dfe9d294a97cb | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/70b45901075f0809002b462d6e2535230f3d1760 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/28731e9a32afa74a5858783366cb7ed4f08e15b4 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/56ad2c44e7d812c6e4b285796a061cf3067ea5e6 | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/249976ed6dffdb6137977522970951feebaecd15 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/919b12cfcbd71563d20dd2e9d50c38ed6e8fa2d4 | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/44f94d06231e6b6689a4c4dc1ce63f1f384900e8 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fa1aa2ad1c8b20a12cca8975cb5b7c0b16c79e2c | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fa6589f0a1fd78e6f7696b60712b5647df49a903 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6bbdb92f9e08e09f2a35e0fa37e818108129ea62 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6a6f758e9fc8156f5a3b373ca05e7733dc63efaf | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/aff670ace063a67ddde02012224f9b9a889a6f52 | ORPH
 aarch64_be  |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/a6f7de0c419506628ac1b3d9f7e2886e7f822f34 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/98e3ddc959ba0de1ab18fa54cf8cea7f5a3a60f1 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2b53eae970b7f105bde17f595b8ccf8276e3333c |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/492e8267b857e847ab3908b4789e5bfc39178692 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6fa060adc086e5298292a6148acf3afcb242b3ef |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6aae32fae1611ae93b984ddb81c516e1a3fe2dfa |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6d396ea91bf3f965a1904d258d1d750df17d51b2 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/613e26713f086aac494e1c06f7463a5b8ba72ba2 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d8f17363f0deea41ab5e35a48ed931ef0124ad41 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/07555e0dbcf38d4f5d75cccc79dda7ee848cbde2 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/593347dba47ac2fffce7a4cbbbd7c1446e8b92f9 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0e7737ef3aefdbb1014f9ebafc4730f781e3cf33 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/70e077204737f2fe31e7d993d9879f53335f1653 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b19d94347027dd6dbc14b4c3d37e4a6e505fed24 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c83c6fa24088928d0d7cd91f106b8db74585fea8 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/88ed13001ae035efe08a05464531662369f36715 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6b8abf2ad0e252d0a70e5f2d05b1d4c8bed80672 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e3be184db3b36a4196d3b3a247d0420c3e271534 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/58cc3c9f1a01e830135ae2057a21be027d46460e |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/998e22b3c5850f977040a1c1df0e267d25234132 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c409a9b5552d455b3a005124e72a6e1e6e737c4f |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b8c3176eb0a5a538bf2b558a64341ef8d3cea69a |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/499af4fffc2b9c50f01c1e82aa9761dc975a55f2 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9d40c2044c1fa920a29f0df22d1424322080add8 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9d8c69d1c00c4d4cf7164225a7aff14878fb8a1 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/620da0947965e764800f4ce2e49ff634e926fd05 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7067a2ca17a7c74237c312f3961f71c05f61913d |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd52de0db6e2b8fdab8f2e41c4272b5c19255cc3 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1e6a105f88e798d9d24bfc3d4a8460f418c3fa2c |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0ed59e012ad7b74e3d2370eb2f93e8886983907e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c8f48d8720dea4becbae30229f18f9c05f9528ef |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/56d17d2dddd1f30fc3a0b379a8e420cb341aa776 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1d80e0ed49825fa41fa94654fabdb6985335dc99 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b80b37ece3a369dbe361b1867926922658998845 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8b0031985979f227c1a718f8e9514f7781cdde0b |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/75f2b22ddcf4d538084edab2f485f3e18a56c169 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9f69fda91e46d2f14bb73cd27123e10ca95ead60 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/afdabc4ec9db3df62a7017ccb00ff3f9b7c4e624 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0356dc50adc864c5b77f685728fee48eeceae7d0 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f75169be991bf7d08d94010ca1ea00de5cc26793 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f11cfced728afff15375991594e418d2e0fd3f2a |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/55325326ca4e2d5449b66af415bdac8b6708be14 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c834713d7cd525a40b1c024907a68ca4e3ecbe0a |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/46c8d3967c99e4cf107ccbbac81f42ed0b2a9a5d |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/af627efef20f7b58f9d147306cedafc5a8581b61 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/61b7014616a9b4e9ecdf4f4ee9ff6c7f4489c821 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f71c8b805d8e1c47d308aaa4b04d9d5499f698c9 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e0182f34a43c0963fb4400139075a90e24b3a204 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/852b80f40cac1b8737f17df7bbfe74a0a988e136 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9fa4b588762062985e43785c090cb91d987780c3 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c162e43388ce1c6006b5ef37212cf988d4940a0e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e176e08612bb3642828f0982c3012444a794c644 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1520b28027800f8e0e0824576e1bd9473008ff5a |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b951ece48cc89628244dd967c169c4151c27ee62 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4b3dc3f2237dfbaf79b0d149013a7a2443c90bcd |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3681924fdcb9f80fb4e57fbcb9baa3ee91ff46ea |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/10eafaac6f2b397496a66d866f408a4ff9ee6fdd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
         gobject-introspection | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.33 | 1 
                    proj-9.3.0 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/955b6b7fe855aaf6382200fdd76299d23f03ff8f | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/892a80eef64bd05d9528d9c70e3b3f0b7d1c00cc |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/174a8341a668526d2fe50fa4e368fd354932fddf | ORPH
    m68k     |          linux-6.6.33          | NOK | http://autobuild.buildroot.net/results/6c3c12b57e08aa951e1310b7dea80538a38023d3 | ORPH
   mipsel    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/65b6a767850e72d1be19b7543c2259b93e099755 |     
    mips     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/7cde67e08974329801973a1c5d54790e723bb40a |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                  libffi-3.4.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/79f0c11fcd0a5ea3fc1c2f0961f4b83dff193921 | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f589868aaa166ec60d9da5b6e05730a9c5e70443 |     


Gitlab CI results for 2024-07-08
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122575  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122577  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283121621  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283121752  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283121767  | ORPH 
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283121804  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122066  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122110  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283120805  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122128  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122133  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122137  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122195  | ORPH 
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122203  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122209  | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7283122214  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
