Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD66C31D97
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 11:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719CD60822;
	Thu,  4 Jul 2024 11:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s0fGF9N3uMo; Thu,  4 Jul 2024 11:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5477F60819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5477F60819;
	Thu,  4 Jul 2024 11:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6451BF2AF
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 11:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FDB9820BB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 11:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0LnkCT-eh2g for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 11:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EF83820A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EF83820A3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EF83820A3
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 11:31:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 360FFC000A
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 11:31:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 04 Jul 2024 11:31:04 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720092664; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQGY4cicxFO1GI3SQl/TZoa4xu+FfXMlGihd8EPnlX8=;
 b=pugOrusxT7Tg4mSU5gJStoX5rzhpXfgIVba+wfsuL/zG0pharM7Qgp5PV/xz8elv62CW8z
 dFWW/P/7AMwdoVa/ejquNwFst2ao/ydov2PImwaj82W2Zdi226m4V8Ji6IpAl/dxgLwWth
 6YjGAiSrMhtuFc1bE3QLc+QXioUH86yuxxz8hJYpRXkfJdG9J7QP4Gi28ep99vS53Gxu+K
 +j++/x9eQQ48hJcuJNUEKo92+u3tgIcZzfqUGM5X7XoTFsdHgtcApHlcgO1HeOXxF73R/t
 sNzpqh5sgjMZ+8e68xGh5IIjq/7PwmC2DDvUQQc6Cw/yyghMPVzZAyKv6Frfng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pugOrusx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-03
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
Message-ID: <20240704113104.sKNrQChK4Vv5pX8VF2jsoqRGNm_tlUS4VSwY-vKWRB8@z>

Hello,

Autobuild statistics for 2024-07-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  5  |  0  | 14  |
  2024.05.x  |  7  |  9  |  0  | 16  |
    master   | 61  | 580 |  1  | 642 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 70
                    yajl-2.1.0 | 43
            host-cdrkit-1.1.11 | 34
host-prelink-cross-a853a5d7... | 31
                libressl-3.8.4 | 22
                dovecot-2.3.21 | 20
                libssh2-1.11.0 | 20
               cracklib-2.9.11 | 16
                  libsvg-0.1.4 | 16
                 libfcgi-2.4.2 | 15
                 haserl-0.9.36 | 14
host-android-tools-4.2.2+gi... | 14
              fluent-bit-3.0.4 | 11
                  jack2-1.9.22 | 9 
libsvgtiny-ea9d99fc8b231c22... | 9 
glibc-2.39-74-g198632a05f6c... | 8 
                   httping-2.5 | 8 
check-11970a7e112dfe243a2e6... | 7 
                fail2ban-1.0.2 | 7 
ibm-sw-tpm2-5452af422edeff7... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                   cpuload-0.3 | 6 
                elfutils-0.189 | 6 
                  libffi-3.4.6 | 6 
                apr-util-1.6.3 | 5 
                     avahi-0.8 | 5 
       freeradius-server-3.2.3 | 5 
                 libcurl-8.8.0 | 5 
                   memstat-1.0 | 5 
                       unknown | 5 
host-vboot-utils-bbdd62f9b0... | 4 
              libarchive-3.7.4 | 4 
                  libsepol-3.6 | 4 
                 libssh-0.10.6 | 4 
                   linux-6.9.4 | 4 
                  monit-5.33.0 | 4 
                    mpir-3.0.0 | 4 
                   rauc-1.11.3 | 4 
                   redis-7.2.5 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
                  bcusdk-0.0.5 | 3 
                 dc3dd-7.2.641 | 3 
           janus-gateway-1.1.2 | 3 
                  leveldb-1.23 | 3 
               libglib2-2.76.1 | 3 
                 libp11-0.4.12 | 3 
           mediastreamer-4.4.8 | 3 
             rabbitmq-c-0.13.0 | 3 
              udpcast-20230924 | 3 
                      xz-5.6.2 | 3 
                 augeas-1.12.0 | 2 
              cache-calibrator | 2 
             containerd-1.7.18 | 2 
                 coreutils-9.3 | 2 
             dahdi-tools-3.3.0 | 2 
                   dhrystone-2 | 2 
                   evemu-2.7.0 | 2 
                   foot-1.16.2 | 2 
                   host-go-src | 2 
                host-odb-2.4.0 | 2 
                       kmod-31 | 2 
                  libva-2.22.0 | 2 
                     lxc-5.0.3 | 2 
                     mtd-2.2.0 | 2 
                    ncmpc-0.49 | 2 
                unbound-1.19.1 | 2 
                  zabbix-6.2.7 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
                  cairo-1.17.4 | 1 
             cni-plugins-1.3.0 | 1 
                 dtbocfg-0.1.0 | 1 
            ecryptfs-utils-111 | 1 
                 expect-5.45.4 | 1 
                    frotz-2.54 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
           host-gengetopt-2.23 | 1 
host-heimdal-f4faaeaba371ff... | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
igh-ethercat-f5dc109176400f... | 1 
                  ledmon-1.0.0 | 1 
             libapparmor-3.1.7 | 1 
                 libcli-1.10.7 | 1 
                libcuefile-475 | 1 
libest-f8a6e5b53a5f70e72fe4... | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.9.0 | 1 
                librsvg-2.50.9 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                    norm-1.5.8 | 1 
                  ntp-4.2.8p18 | 1 
                nushell-0.85.0 | 1 
               pulseaudio-17.0 | 1 
                    rtty-8.1.0 | 1 
                s6-dns-2.3.7.1 | 1 
           sane-backends-1.1.1 | 1 
             stress-ng-0.17.07 | 1 
                      tar-1.35 | 1 
tftpd-b2b34cecc8cbc18ff6f1f... | 1 
                    tiff-4.6.0 | 1 
                usbguard-1.1.2 | 1 
                    ushare-2.1 | 1 
               valgrind-3.22.0 | 1 
                    ympd-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/cf388015036869f15033f8511a3efb21e807277c |     
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3ec01646cb351e4bde6dcdbde58a8ad5bf7ba8c7 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ac381a51bc3f36a6ea8557a1df54e42d92b208be | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bb3213028003e804c4fd2b1fe5bfb612cd548466 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9bbe69bf77473056f5ca583ad0f3e1dd7c8618fe | ORPH
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3cbef5c17cb9f18a60779b64702c5889f9d5f135 | ORPH
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/96869f28a1eebe5be2340e2a0766e221bd07d78e | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b9a7c1f01d0c7099faa2888c8bc01e548579618b |     
   nios2     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/e149dd38fb3a92da0741fc30fef3e5e31f90b904 |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/e59365f9b4faf486a1b93753a1f8f20e4b5eac12 |     
   sparc     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/81475b83daa1dd7932d71f485fb0dfe4497bc44f |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/e290a7d33de1ad4f7554c184c17bbead085d6888 |     
    or1k     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/d3ba4668f8eaeba3830150138197520f48b9e755 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/5cc958ad270880c19e2d98ac19676b39dac607f1 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d1bc4f2c8a69303bd39b30d4dfadc24ed8603a1a | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/41fd48de6d7ca3e0659488c13eeca07a51662255 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/df3a30d084973b1f1f4bbe02f1723bfc592eefee | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ab26c8f9eb688e51d38b82b5e51ea37a7de2ce8f | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f316a6556859dcce07c3d0324c630b51eea81042 | ORPH
  powerpc    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/19e33a0beb327ea4b5e36dffc1651516c055a80f | ORPH
    or1k     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/bdbaee24a3a788c305f9f15310e79bfb951f1b3f |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/ac9eded7406f79cf818a29a9981da6e786bfe112 |     
 aarch64_be  |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/fa3b09e0c70f521ecd626e5cefb70b774765cd85 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/bd0f0cfe89707e12affab1eae03b4cbd62f8e4b4 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/88ff3bb9a4466bf241739590f27f7266647c0912 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/24fac54b853fe92f9542dc2fdc1b6ad952200da4 |     
 powerpc64   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/81bda495d9153bb3abd8c2a96abbc5254579192a |     
    sh4a     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/e1fd069b6aad96c0aec6591d0c8a908293060537 |     
    arc      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/4b62f10d955dcd32f460055365ee39d0f6a6f222 |     
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/170bc03091fe9b168ad08bd49bf9f76c11c10fbf | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/82891a5f514dc0e709360b19dc868e2fa041fb8f | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1b971bcc11174281aef1dce8e5208a1d5566362f | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d2e616c367512b66cf37bc414bc3c50b16a51ea2 | ORPH
  powerpc    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/276fb81b065748617b94c83c1f3f4e34a5a5dc6a | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/46833e9d948dccf9891d337d3c627cfe2324ccfa | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c3d420294a956350a93f7b843b59d651b1fa71ae | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/c7946252b93a919e8379b37f7665073b1a5383dd |     
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/6095b306f095dda725b386fadf810f58ef94fb7b |     
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/b30a495336909ab547a5e427ccf6e0162acd655e |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8761e1742c525be252c2742e30469396a6c2b28c | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3788b7e9994d0668aba17535f3b443cf09f1e8b4 | ORPH
    or1k     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/fb5c924813bc12cd09bc4d35da5ad0abf63b9899 |     
  riscv64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/6a7ce8983c03b54cb0145db8b60616f90aa3c78c |     
  sparc64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/58eb9b8e59628248da6f382e4d1a65a42d88283a |     
 microblaze  |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/988f151fa4a16650318237b45ec4e1fcf6653a4f |     
  riscv64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/9286483834af99869cea8c68932a4f8bb2b2b3cd |     
   x86_64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/940adb8043d63a18f42a7796386af6411350189c |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/60eabffbdc35bbb004081d8b1e08abdd58528dae |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bf81f16e2f7873760f129b8ef8b6d6b72739c371 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/eca166c0b6407a9f721eb24b1fbf7c88185ca2d5 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bf8f7785646c7f6fae707c0ebba5968d9c9e6c05 |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c9dce499a9fba912d9a89e3b6a520fd105af1556 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8f8264015f93763eb67ba07df58393f402ae94d3 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ba2f4a0eb143c87502f13d70ff43f493cd825f63 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1ad597eea0a64b6436c1b0b4203bc08a9e3b19c7 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/49f8e16f585cec94743b24d2c6a87da7244cf95b |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/116a95f9323c60542d46b5b06ba2a20553768eda |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/20893b11e4d680e9bc54caac18c9d3c4af9a3575 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ef9413feda28627918dd1871f83caa53b24d501c |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0df76be5ea713e058e393c9034de892837229cba |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/db3a1aa11bfd686a5a7a9450aa58cfff7cea85e5 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5c997cdbe9c9f24e5443f283e8110ad04aad7c6c |     
   sh4aeb    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3adc8d895b7da61c70e6262279db054f652ba739 |     
   sparc     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/d5f625e03240cfb6f70e25446fdf3379d766c202 |     
  sparc64    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/3e8501a157fb457f8d6475c0c3824fa681aa4372 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e43c969c208a0cf2069dc0b068823191d9d51fe5 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2aa40d982f942706620a510fd1dde08d11472469 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3c43c613f3f9922063e1af16b93c0a92e1b2d0b7 | ORPH
   x86_64    |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/1a4dbf501a936ba8afceef30e3b71d2d6fdf546e | ORPH
 aarch64_be  |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/530d76f051fe49c26e814e90e335a9b5424d9a5c | ORPH
    m68k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/c042087a9c8ede06eea10fe7c534eb6c153b6295 |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/b3376192f8fd27834a1d2e5befabaa8b487a7afc |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/dc5915076511b2e2bc32039d7cc99dc5867acf44 |     
   sparc     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/2e0090eeaffc220064bad19b8965628be3938db2 |     
  powerpc    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/0f52c5a5f78f077eaf025b28b0c4455eb1989ef8 |     
    mips     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/a4b4fc5418be1dfbf447a8ef4f2d91cecfceabdb |     
  riscv32    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/56cede580be7586c41a46cc39a259043a7bdd09f |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/b6fdf92001c0d7fb493c6778a86ab6cc6650844a |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f72382b5a34538849c055d265aa6072a990bed07 |     
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/d2cbd1e65045a9330262a7d4cb067473ebda0ea1 |     
  sparc64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/7dbe0528395477be12a8d0cca1b92dbbbfcb9253 |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/003e08945129331f4627769f3d94ae28c4be2bff |     
   sparc     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/685e3b1a3606ba4a51db762237dd1555db1b06ad |     
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/36609f68932324903858726fb4dbcd36181db718 |     
   sparc     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/87b8bf840e9c5f45df7e9ae6f8ceabbe02c0ff87 |     
   mipsel    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/75bf44afaaa634128eb70dc27166a861f1521661 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/915ca7ad9883b18dcdae32439d6607843a81465c |     
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/1d061c9c6ad2e507ee229362fbd0d0b795faaa22 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5ddfcb329f5e9c7ff96be0da6dbb00f44297d359 |     
   nios2     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/dc87220817e8ac188f41ca2d3be41261e54985b4 |     
    mips     |         dtbocfg-0.1.0          | NOK | http://autobuild.buildroot.net/results/7bebb3acfcf4685774bc816f7b6f3d5d19a56edc |     
   xtensa    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/7b387f4d4fdcfd2a608b0169d972d598520b9433 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f4521276e37d4d4e07821352de09dc050bda3f50 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b498a8ad7860bfadca0dfca5c29c31c0d53a5c0b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/af13666168740fdf72157fbcc92a66d8f34b2e77 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/53dbcc650120d4b6a8edab6e5dd5102a904ed9e2 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bb6210e8b5dd3e7f4970fa9f331713cf3a7d22f5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/257bba2ddd20907e3d0700e920e3ac876c526b53 | ORPH
  mips64el   |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e0c0834ddbdd63b478358a228168501b498e023f |     
 aarch64_be  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/4c1bf3723346d73afc449211644632cf61434a41 |     
   armeb     |         expect-5.45.4          | NOK | http://autobuild.buildroot.net/results/d14edf90225466e5584afd6be98e9213f719c249 | ORPH
   sh4aeb    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/758875ec8e02af4bfe6049d4bfc5c8e05b2f665a |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d9235c119bed3dcd780a63c6059a2f04add45349 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2277266e1c57c6795014cd5ee62c21bc54ce04b6 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3740638fb77653e14a7f0891ace37db84d4a8322 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ab3f127f01089e79fadced66a20089234ccd2d4d |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/91b58d3656e75d2de514d12613f7ce6daf043e25 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1f0943ee7deca045f82ca3e8e1ac5ccaa9facd6d |     
  powerpc    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/f44d477712f84330dec60b1d012f1e9736822ef7 |     
  aarch64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ebb80f821369466274e18cf0ca2eea7bb93e431c |     
   s390x     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/469808d8cc42ea0f2c13f3537123d35e686aa909 |     
microblazeel |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5bb5455d0b423da6071b92cc37c6d8fc62560bf1 |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/33e719cec3b4078f63326fd7542041179145b549 |     
 microblaze  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/cfdc8ee2d323719391ea0c019e48a002b0567642 |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/36f7d31da17999e4ea997eade5d5d92af26dfff3 |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5f2bdb00da60a5cba574b0398e44847c1d67b150 |     
   s390x     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/80c170be57dd5efe462c7d8d51f683d56dcfc0de |     
  sparc64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ccfe77948d4c27956e191ecf34093508bbdf3a5d |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/e342ca319799d957edaca5e63715c98fbabee35d |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ee8beb111c19a5ef7016cf605b44a39dddaefe56 |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d55c46d67abcc6e00651bc387001593d0f7faeca |     
    or1k     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/f27c125bfe97f5b6eb32efba78b21354cc9478a7 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/26185129c8c5fddc695837985908ab57e9389173 |     
 aarch64_be  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/e3eed8695caa389182028d8ddeb3d68fc7a86aa7 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/79d304f66f01e4a7ca3a5f0f7420030ed2820be0 |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/b0af342448c82ede26b94786877891100eb98199 |     
 aarch64_be  |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/940c758c52a971069260e029f00d2462d15fb602 |     
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/462bba15bbe90b0577bfa35469f19a1060250661 | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/902b3c40699d01d61d453610fbef18d787a3e8ee |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/4a9059fbaf86c416d985f535adf7e76cabad31a7 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5d8170a88eac07a8dff15939af0e3b42f22c874a |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fe3e097a5e2f162fb562a97ac622c83f0e4cae28 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c4b5e4ae393974ae37c2c38e7cd10c20bb1cc7b2 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/05f0a0411edca51b2cf1bc67ec3b3c040fee2a9d |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/463b5accbbdf5b467c37c617fcc31cc5e853633f |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e559952fe36469f952bb382906441c5bd61b1090 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/026cd02e81949e82eaaabc2f7b049273199f2408 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/571e18f426daed45e36af615e090c8cd7c25c3e2 |     
  riscv64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/117ea3dfcbff6ebfbfe1155690ff67eff51e1ee8 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/120b9c31883cce0d275505f4e8ed6b0e889fffe5 | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/02b3042e2b28d7f0983670321fc954fb3536fc23 | ORPH
    arm      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/be72d8fdb20be6cfcad2bd42d3b0b3e8a39aca70 | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/23a2a86240a1a4de841426009b77a044ca8b308b | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/b525c6cbd42eca1d0b9096a4377ff32452ec7cdf | ORPH
 aarch64_be  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/6b55386040eafd78317f8006abe32f177da3af4b | ORPH
   s390x     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/14a67727d87876a7db3d66c37b961160178469dd | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/fd9347b72a5af5a2071a8e55c47806328d1460b2 | ORPH
    i486     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/124cf01cd23f81c1714b1531579b67b2801c6255 | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/f2363ec3065290df73d869c9a72f7bee723e1904 | ORPH
   nios2     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/ee4a1cf69ff700ff3437d19ca2e50f3d46df3ea6 | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a8f2555a9aecb1f69fe66870c2badbf06512b2eb | ORPH
  aarch64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/c9e935be81e07150c87f60f16a854f8d8c781c84 | ORPH
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/85bcd7878d239051c30f4a53474ba41ff999fcd6 |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a4f8d39bad69ad6c2ec1b368d66aa867cd66b3c5 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9cbba15c787cfe7c14f91b844524cc25065023d6 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/bb19b9b70d1d8dc3b5cf088c70e8f08a93313418 |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c6401dcd24e10b1fe60b19fdbcd75a97b31498b5 |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2f3f4e6f1c3c2d933612eeaba3dfa9b376794ef1 |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9ec379efc585efe0ebb4bbaf79bacbc06db27e14 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b5b0d5f2e92f7bcf4d48fa064c536fdcaa2d6cdc |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3fcbb90c9891107027b6d60ee22f3c2addcedf24 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/10cc7a61ee086fd08c1caf316ce3ab8a63bc980a |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ec8c3191bc7c234659dc601eb5eb2588d65c475e |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a552417fe669e40eb26dc4871e5349337251d43a |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/aa6f8ee1b507c15eb6cc0658e8f25cc815e10e89 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/58816c9051dc272cd4be41ac60a821846e7e1df1 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47ff684bca365dfa658cfc5975b046299ebc7f19 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/16844fec2027ae349ca171ebed13c4d590ecfc74 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7830d8e997ab917ec6e86d47cdb48b6d86b37cb0 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aca263565946e0a2fa315e2388a4ce79403039fb |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/98d2d4cb5d838f6e4c55c39886b517c8a1e012e3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9b04140af91b21a5cdb831e117d6bd1e116ea11 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4b1f417662f62b09abaed3067a4fd5849d8a5984 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6e40be0fc6ece3d377bd27959e9485d31a08316d |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7078d55169bf138fa4265c112046ae2a68693a89 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e052c60226d75f3a7816149576d5d3886b6a0ef1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dc4e9915d108eb51993f8cefe5cadec647bc8c14 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1360902675e912c51a8b18c75f6340723eadf21a |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/60ae86d9a2601a8011593ff5fbeab3a0b5259ed7 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/794fc773fbaca029c4306d7b978bb6e9f14c7603 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fd5db09142e9e6a5e2bf6b354db3b85644d6f1d0 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3b3bc7ff9bc997e6ff480cee25f57d7f574f9420 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/821727b1b3b6dba3c0ea4fed3808cb8aa400ce8c |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/efda8a81b12e7cea0f6cb62e1adef5836c84acbd |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6c85f52ac769bdcf3dca91de6e3d7eca28ae9262 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cb95824fbe71d96d820e67a563db892a392408ea |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e0b24a39df79af0edc2730a92ac9e2e6315857de |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/64deb09fb85522f1b7c0bcc84181dbc85f25741c |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/09a83aed418958ba8a71dde2787eedb69348b00b |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e24572ff410cf20fc117c9b1804fb56fa67f3037 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1345aae7b7d19cc87cb7516bdfb02e692a79b783 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/efda66b7f48c608726a703ce61a40ac726964422 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a012a9f709d0c87571f0af9e61eb43f868c983e2 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/af1eb521eafbd17eb410bd597335a0be3da7a4cc |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5832284044d79f2b07b2d3eb5985a9834f52c121 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/416400e9a27d78366ee44c160c961d2f6a5c6f73 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b6fbdeb6a3a6d7a412a441f68b4abedda0b93469 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/66a91f01568e40d7b7dd5bf07e20b9ee80e9eff6 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/faf89ef740afd0652ad2688afa9810858ba34d2c |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e405663c1eaa27b606834b34f4f8c6d2c703ad2 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/32af22ee08463b5940f663d03b0518615228ea1a |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/35f3c0fec6c6fa9d538068472011d586a330af37 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8775191f4dd5c9470e85643204b120d264cf83e7 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c8038cf47ef39052cd8cf342897742de94fd951d | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ec5de5079aa0f706f3ae19bd8f37bbac8b659129 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/195ea060c50dc93a3be100e8ace84a2df567c1c8 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/830e1a574193858860a8674122ad7425a4dad5e7 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e6efc66994d1d8b18d54e3a555b1e4101595e65 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c24b3478b83f0664bdc04094d428079ae9678fa | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6c9cf16978dbe3bae272236969c142e80b8541a2 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f5303d5da7a5a3f8321f0c74c71ad26e802d12d9 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b315a2ef44d008ac115e6b44735f0966d6bb2d9f | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0584c006e0635d632ca7252cda6d4d0f1d6803c2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6b11b9b732d9750479c5c761a31923a6785f05ec | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/297cbf476de0968d74585d962710b10b88ddb559 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e5f72ee802d2520a3723aaa822491bd3e004439 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/735abc7f43b05c6af2319251d696103625674d57 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a226a8ec6fe6fd45f90bcd50e76acd7a1609e843 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36517151c94e6601ed9e5264aa80f370dde63cf7 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/88b80b69276302f59a3caa167a5caca5562fafef | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ae18d8d067fc5e39cc923556f5d36c945555e758 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b5734a581ac892ce661a84f048c9e61822d19c5 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a214e186d8cb88327e6cc9a95fc7c937c2ab273 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/058007560b1f40e062ba9183a1f57c0607b4b654 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/689b234c1ed4cf0e89549add1ebe39cbac286522 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe79a4e0e3e6ebbb89556471f1a700f9eab4cac4 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c9699faec620ec95e38a252ba5ac1a6f58ebbdb8 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/97ac57d24eb5a32a215295e6f3863fc11ecceeca | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/740da4d6dd0ffaa1a1b9e53d641aadd9a6b5f9cd | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7b82c44ee6125e1cccd843820d92515c85565c0 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9d3aeecd9a7d8faf979e6dbd63f6e89235878091 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/52f1cad1c7ea447267ff54fca8b9dd4895066c93 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b5d27e9693add4d65b8ff04eb3d2763c4c5440b | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/83122236537967ab54f89712c626fa0bab31d50d | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7ba8dba8c4d67e9fa426b3f3f1a2b5d3ce252e6c | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/64fe57cda9a7b5fc844c3d9ded43e616c7ce16e1 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c33b279c5b171e995b9aa8d9d873806a25791a16 | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/88fe34e6a74b88aa1fc814b884c2e0c4cefcafa2 | ORPH
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/23390117d56344560d21c10f5dc5322053c60656 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b8d328a59660ff2a285fadec59503850d72b8b10 |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/58f0e5dabd4fab467fab839beda3110fda35e7d5 |     
    i686     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6c7dc21bc610c06a43dd7b1c37fbc0d96e14efcf |     
  sparc64    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/40d811d1087fd90d8d64f7a652d3a0448f62caa3 | ORPH
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8e471e37356c8925b12a1362257a008c719f4741 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/56bde654dac1b633af942dceba567a1a604ce3c5 |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/bf2253208c2059d62a0852123d103722dcad4898 |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/663de5a4a71413d2df2b44bd3506a26558627f00 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/37a25b68a343e6a5ead10ea293ee023af9bf1078 |     
 microblaze  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/1535789ff213808eee8f4a2dd37716a5de0c664a |     
   sparc     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/9be69787d3ec568e1e19659b9e375652e97c69a5 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/3a0b9813131039e82cca83a69d3fa9990a6ec143 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6e9c50c4e87419f543eeff320addff11fa1debfe |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a57f819b02075b4d8eb01c3610021424db36515c |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a6781158f65ad8659b5d10171b51314ded24b117 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a6864f984714d14c9ef8a15f5f3255a3137257ea |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/308abfecdd25174c64b8711f64bac0e087b97ef5 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/deeffb16dd6312d9ec8183472369491b29d6216a |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c38239e3b6636712bc70d1985d59a0f74fb81d4d |     
   sparc     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/07fcc3702ebbcaeb45a6035a3d867d416ee71811 |     
   s390x     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/19c823850090e378b911ca5380aa50717d4e0a61 |     
  sparc64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/01d18fcba89e683adfb22e6082e6c05b78594e01 |     
  sparc64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/5a56fb951c9c971a94c53e7f7033f7e43b4ec5c0 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/3674f3d32a4edfe538d74d70cdc4b4ee9c01f9f9 |     
    arm      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/08189f7fae812872a5a92afc90f9f6f5bf5a34f8 |     
 powerpc64   |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/7c32798fed15b484bd6c53596a3d5eef96d48c15 |     
   armeb     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/df4df1e07f106a9d3110f7056bf52a31c57fd6fb |     
  sparc64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/ca38dbf6b76b412874dea2400ae287830de91c7e |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/d9ce3563fdaf53477f27ee5fd05fb3c01e191a2b |     
  sparc64    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/e4df93a8380e4d00519ca5e0433f29dcce560b11 |     
   s390x     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/4701356c7bcc0baee75a0c1680efd96a3054c457 |     
powerpc64le  |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/83e597faa62c2be33eafc8159934251ed7c7f202 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/2c8b6c53a227030c2647526b3d5d8efecc57716f |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/254eebf216758e13edf139dc067158c3895bf3a7 |     
microblazeel |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/80a6af5e173cb5952ab871c160fc916c499e43be |     
    arc      |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/16034bc030b22d7d6befadc1b098d72e973df347 |     
  mips64el   |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/e49893f16b928f0e934ce1322af8d62f94998b62 |     
 aarch64_be  |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/7cd0d090f8db315f7cf3a0f20eedf5478fc73751 |     
   s390x     |       libapparmor-3.1.7        | NOK | http://autobuild.buildroot.net/results/505ff8436b5e95bf98c26134476187c26dd22ce5 |     
  powerpc    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/bcca6292d345ce6253ab419cb908cad582261ef9 |     
 aarch64_be  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/f99f2dfabcf5138daaacf8e90c05a62c8bd22bcb |     
  powerpc    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/10333db702a5e339112e5eb58c7dbad6eb1c3577 |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/efea0ac79574dbc00a0e2194fa7f65e36409f52f |     
   nios2     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/b145c0dcde2bf538e2fd4060a994985b2168d582 |     
  riscv64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/2895e3c451b869a951b023d9bd7e0142c9b8eff4 | ORPH
    or1k     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/ebe97f2bfeb5ee698056e2e457c486ba089f72e4 |     
   nios2     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/42fda4719f398e43ef6967e64df2e452c6549844 |     
    m68k     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/4645e79a5003888d49897925f4d336652624df7e |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/90afd97b49b678b2eb40df723eee75c8958ade84 |     
    arc      |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f099f5e8d3088c82428eeadd8217d8ed2ee9ef41 |     
powerpc64le  | libest-f8a6e5b53a5f70e72fe4... | NOK | http://autobuild.buildroot.net/results/e9ab2a04c19288f85aa5706b993bbbfaeb8f138f |     
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/25c9e6b41275bca682580fd15a18242025d73d72 | ORPH
  powerpc    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/54e98cc5de83de0bdb16f4637dc5eb30397ecf3a | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/add34b2939956f73df6442374993370c26286f01 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/80b55bc8b971659f018408f5a00eb4bd69c95751 | ORPH
  aarch64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4d4484b1123339a4b3d45334ba6b4f6af5c1ba5e | ORPH
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0b3a0714daab12e31dfe8fc2f830a0b7aaf43aa0 | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/a3ea8428bc7ed56cba5f70db9a6e18bf372906d9 | ORPH
    sh4      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/9458bd85ce6ad70988f48e785336b3fd0a7c9510 | ORPH
   x86_64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/1c2f0263f1259624a0dcad1366fd1913798060aa | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/b816aa28dfdb1f274a075764b9a192eb53cbf99a | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/180f2c8d4f79e8543afd6bc7df45c547cd7c80e7 | ORPH
 microblaze  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8c8c78ce24d27664c1e63f6c3b36207737f161b1 | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/323f98923031220b2030bcf6c68301807ff82726 | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/cca98f14aa3328aa152a813483fc12331d42c199 | ORPH
   sh4eb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0bdc90b5bf83ef3c1dff2ab5ed193f5322dd43bf | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/309915b92978bc576a408f9b33b6c5d2479b5343 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/89fbcdfa59f345875825dc670867453f838a9335 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/64ffb1a0f6a2757316b9a9f2f8c890acf9b945a7 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4f19959890716684783afd753c5b126c4a496700 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/298b3ff5a9a8c4a66fc8aaa63bf053c39296da1f |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/afa742c9bb01798918ac14d1762d734315d6e088 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/27c03445f97b6d3070341b632690ff5e6e2b979e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e023af424abe67ea55a041083fd5d75a0f6e27d0 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d32b42076fd0044b1faed2528d89564eff984531 |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/1d5e2209ff8c219eabb1e9ec2a0bc343298cbaa8 |     
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/45c453282c4667823685d3a464356e377dc50030 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ed6cb311e9cd5659bfc2991c0ba146d28b14b50f | ORPH
  sparc64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/7cbcad20a2cf929f62ffbebce662b8c485c88140 | ORPH
   sparc     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/41a7fcfb1b61750d28b1303847e12945e2f33242 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dd5d64cc2331790c65dd90ce3307d14b72d38b83 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ed271e3203b7cade3045e3be7a433cb175d1db7 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b7fe13e49f0131cd037c1a7d19f13efad12bc08 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8f1cd23149e437621750367f8d55ce18601dce0f | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cc6fdc8e9dbc3befd625c1366fe9984b2f2e9ba5 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1c2b0e88ec943680c511d6dfdacce32df8b0113b | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ec9fc352fcfa3688c74ff7223d0b1b342c48dbc4 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/47c665f377ed63e066622b81c6682990147bf76d | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/52e03395de60a08ae633d8e28d9797f88146cc4d | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0ecb79e06497e7037376824cc7dc15e97e37228a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ef5cf132746f2770b694c4c2491c30b5ecb8d141 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/952416d810e3a3f762402e62f11ee399009a1743 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e05645770a64fc634eadae38c2ef88c0cd69b0a3 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f734efc746ac1fa187a3c29e183f947c35c0bc12 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/900aad83dcb792e9563ad3a483e0a9134e3eae2b | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d5c046482edbf9e5f9153cf4f2ae079bad372088 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/99185692c7c8ea181ed237f8c060974e55e8a8cb | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7e7525acb29e58b51175d6479e731ff9a2c5679 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/44d06f4340070010e0e347f92daefda5cc596413 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/595d6cee6e6349c7117d807b5f67ed66f0014977 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/10846fabe0fa8c7417f01fcae360f34636382660 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/63c4ffe45686b0ece56bec3b30b9fe1c9e1a70ed | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/b7e3f1fb971ea957f12f7a624d76ecad7331005b |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/2476bd99da9cab8e3af14f3ce3e279a128f4a7af |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7546feb311a6825d39379253025a90a971c9457a |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/e5a531aa39f21cecf22dee9642ff7da37f9c7e83 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/ee3dcd5ac7900a9f06f83de8b406bb72f21212e6 |     
powerpc64le  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/26cf9a5fb807e3a563cd228169323c2e957b7169 | ORPH
    or1k     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/9cc8ee360631fe3668a4f0723d6af6a2d567b333 | ORPH
  aarch64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/27eadfa9655762b5110118685349fb28b7492647 | ORPH
powerpc64le  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/b144a2140d5779104c23237d1d82bde86a9b186e | ORPH
    m68k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/e92ecef0ab2c02df215d8bb8727309078243b91a | ORPH
    i686     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/df8cc8fe85de8642c42b80216910aa7bc2d090b2 | ORPH
  mips64el   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/e41ded83bd53e73b3f88966bcdf6ad89815c31de | ORPH
    i686     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a3e5f4994aaeaf13f74681a0db74acaf632c10b5 | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/c890d2d8b1c375a593d92d234698fbd5f20e8e46 | ORPH
 microblaze  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/307964f644e49ab675d9c419861f91c6f789e099 | ORPH
 aarch64_be  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b109efd6ac089b14eb1612ecc4e47b8b9410040f | ORPH
   armeb     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/cc45dc8cb6e5f770f7dd1d8e443a6536d034e334 | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/463320f10850b9866b89f5b06709cacd5b34bc6c | ORPH
  mips64el   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/ed1d59efde182a95f66ecafa2047c1d53d54b812 | ORPH
  powerpc    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/c774a7fb04f838c64e56d5a89b388f096f81398c | ORPH
   s390x     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/0ad7035ae02323f75c9c4720a9c998119412ae8d | ORPH
   s390x     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/830e4f6351eae644138975e557341545b324c4c0 | ORPH
    mips     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/48911e30df562faded72b31f9b5d405d1a9b2d08 | ORPH
    mips     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/59c01c6ed1438405a2c85a1d352ccd04fe02182d | ORPH
 powerpc64   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/0a0f8d12f89e600682f2f866ec9905f41a2e5a41 | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/05aa40f2680329c12e14ddcacc9aa6b0d2a7cc48 | ORPH
    m68k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/d0977f6eb8156e838d0a792c33541a1b05e44ad7 | ORPH
 aarch64_be  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/9c7c92df66782be9e5a2129244ceb24b4d6b220e | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/455541a31abfc4ba45030695d6e5dd492c45da8d | ORPH
    arm      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ab280d85a07e3cf5ef4e0bb29c1edb52c21c51d8 |     
 aarch64_be  |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/b12c7603ac76d23e23c3387af5528d1dae2c6d95 |     
    m68k     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/3bd5461dc5f7463abe9f82c9a3cb93f1d85bbff7 |     
   s390x     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/9e28f54ca19e25f77c6a651a58919ee8f2fbb87b |     
   x86_64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/286d491cab0662d0d5dddaf8760842f62bffb02f |     
  mips64el   |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5254364ac1ae8cff11923fee7e485afe9858615b |     
    i686     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/1ebca2d11be1f3328ca3d99c56b4d8e70e530648 |     
    arc      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/172c3cc27074b3962ffcb37c9bf50fb065c8be89 |     
    m68k     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/f5531e9045d05616358e186adddd1735f0912b5d |     
  riscv32    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/187981a4c9f5825fc8dd9079b0d78c62f7d5776f |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/4118021ac95aa1b5b940cb8c825ce9686ce7b683 |     
 microblaze  |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/9e2735f179e21fe2658ce597e3a8868989af1c44 |     
    arm      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/08bc63b59d3523f217ad97a892292fd33e928f7e |     
  powerpc    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/44915e45825291c7c25797bfc868974807937739 |     
   nios2     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/657f9d0eda2772aa569482caadd48519c86a0ea1 |     
   mips64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/cb6f0c15cd286b45b5108c2ad306ca064dc4ee0a |     
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4b3aac52a88724cda9565acfe4adbda391456320 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4b633ec57d488f309f3621eb72220173d4526a93 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/abbbe9d34e7770a32720fe51783399f2cf7e4b74 | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/7f5c5dd7c9e5653da845f1668ee8a191f0fba2c1 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/56b69b3a029bdb7825191b39a0b1db5547b69201 | ORPH
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/655e043208387a7f3df0575fa01340affdd0091f | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ba3ac6af848b4361422f70ee7142d86dc0df98ad | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/81626aae8de4fc25f96e7200573a007c3937772c | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5e2a29bce15252fa4be222208ef0468ef5b4227d | ORPH
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/01aae47881226bfa38b0ed519bc8ce2cbcf765d6 |     
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/00dcd42a4a44c8671a390e1c2721de41ba515016 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e5d38643ca981e571b3aba56bf16bd5573cd2f1a | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/eda3c95342e173b4ee9fe35e48eafbb559661ffc | ORPH
    arc      |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/13510ae5c8743b62e6eeb6956f732f415b890360 | ORPH
   arceb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/60637ee98f0bf46a27ce26f5c3e9f7687a7ecfe7 | ORPH
    mips     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/07662b8648a2d106be5d3c2cbe0af05f9214c947 | ORPH
   arceb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/792beeac0f9d5b1ec235e1e3538e4f3b5fb2c318 | ORPH
   x86_64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/0e07674dacd69632a5c8eb3e88e8adb26ac6d46b |     
  riscv64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/ccfa88fb715efa6351468938df5564dc83665d54 |     
   x86_64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/9506a4fcab1edfa4e52bca67c02f8d29b99617bb | ORPH
    or1k     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/c0e58e612cfadd9ce95028a1bd25308051f91ed3 | ORPH
    i686     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/94ca26fabb83ac4c13d4ecaabf2c53c8f6f0d0d8 | ORPH
   nios2     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/8d37fbf6cd88833230a1ac82df8e05063f847bc0 | ORPH
   mips64    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/a9518450e1fb0e500f16d226d23c7a940d5beb2e | ORPH
    arm      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/6b94e0acb12d9a40fb31dd920808a756da790254 | ORPH
 powerpc64   |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/e47decb977e77a2488e24f6632d753e8fce2e111 | ORPH
   xtensa    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/7dcd0d678e4dfd5e8e9a4c1f0c57fbc7dd2f95c2 | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/e45db767fd44276ab74aaa0277cc3ee44688bd71 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/7a63d924a56a42c86a0686d8910c7a2e7f9101d4 |     
    arm      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/cbe8cc15f96d375a7153b2781eba5ea75a668682 |     
   x86_64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/fd02139fe74696d2429dca1b969bc376b910a4ba |     
    m68k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/909c5738975553afb9146a0b8316ddd72e0e0de7 |     
   x86_64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/a615bd7344ae7b574221fd86581e303f4b5eebf5 |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0458044e1e1cbb4d2380580e5aa30f0fce14c60f |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9086870f9941d9d7de7de460e07995d01208a94c |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a9ff2ca6b617d91314f5ddcdbc85819598c9ce90 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3a44963cbf31f46cc3df5655908e2245156d4c61 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/cfe8e4fc9aa2fcb4edb5542f180bafc85b495b14 |     
microblazeel |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/7417d8cd80ac562ef71586a77a46ab264dc4eae8 |     
  powerpc    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/6e8ffe88c7014fb106fdfccee5f4ee01641e0ce1 |     
    or1k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/363b259148bddfbd2b7455d0c4fe9bb20e3f3b1a |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/25b4398316de5c6fa44ed3d99bc161361050b8ea | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/2c0f8be174bbb0d2e825dbbd1ae40e9e2fa7d3ee |     
 powerpc64   |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/1c6de878ac662c37ad24e7ddd66e294780789b37 | ORPH
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/bb4f680efa0106bed357973bd28bed5e74095530 | ORPH
   mips64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/d38f7231357e340db0d870fa17195c0a09d3446e |     
powerpc64le  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/2ed28b51df5fcc8a8ff3392b4cdded04ed5acd88 |     
   mips64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/3a7d8b189eb5efb4b375671ae48bd62a7b81c08d |     
  sparc64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/11734b6b97348fa30508f57bd522554f41d278e9 |     
  powerpc    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/aff6c0b353b36d4131ac2f20f3feb452126d87ba |     
   mipsel    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/fd63928f1386ef7f56f6306d40ac12a00f1f360a |     
  sparc64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/7a4eb91f803f15216f83286d11a107b7e00c9716 |     
  sparc64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/d2aab80c52f2eb9df7c08178cd451fb67f9471ea |     
   s390x     |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/929da1a82afc6f3f20d81763de27ac739e6e79c4 |     
   mipsel    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/d9b14f91a4d457a8ca4e647e723dcc09adf84828 |     
    or1k     |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/cd41a4ded9f8c127a6f0891fc6afda1eb45f53a6 |     
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/6b5300d95f6b6f34740f556d9671fe5888790cc0 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/320aed1c009560c157f258d9aad9751cc5b87e3e |     
   nios2     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/1ad1958dd1044bf0725da097effe4670703b4bcf |     
  mips64el   |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/13ba2ab63221d29f411436ed282509c64cbeed83 |     
  aarch64    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/30e6ec67ff8f45034542f81a56556aa4e2847b2c | ORPH
   armeb     | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/21af608aa6230db0e0d59b89f30e11d15dac283a | ORPH
  mips64el   |           tiff-4.6.0           | NOK | http://autobuild.buildroot.net/results/b7db466e1d055b8b61c40dbab826a9f91925557f | ORPH
   s390x     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/8d7641396d1dd7f686046f92d0b87628b10b09c7 | ORPH
    or1k     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/9ff18315d9dd82664a588f6b627c823566b18784 | ORPH
 powerpc64   |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/c6f1a3718e6215739c83ca0ec8e43fe5c53912c8 | ORPH
  sparc64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/e9431eb40ff3a76d2afc6490355f79610aab98ce |     
   mipsel    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/36cde96577028986af23b8ec672c89939c9cb644 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8472bf0ccbbc13b571bbea7b97c9d2f291ae34da |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1494f81a4573a011f688d63d3f87851b214ad8ed |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/837fac6c54309d3c30583d31b036fe48e092bde1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f01080f7d8e9f43f62783b96c2d40bd30659d2a2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd2c0f2e6a7eff204be4d59b40c81d0ce4f59ecf |     
    arc      |         usbguard-1.1.2         | NOK | http://autobuild.buildroot.net/results/a19de8196a0830d4e73b17045d5c37cd6f936661 |     
    arc      |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/ad3faad2474fda263c9ccebb07c72b7b95a1f2f0 | ORPH
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/cd8e79ac97069787e45f735f9ba930b642c9ee47 | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/39264b055c1bb50dac91fd21a769db3fb17c5cde | ORPH
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/42d000b2299ef294d94399a3de46c6b5fa850c65 | ORPH
  powerpc    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/2c32b734ed5b469cceedcb1e8b2afb1b478d9f08 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b01198e927f7ab2c6258971526f0beb09cd3011c | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/bb2e0e5997e861135f34dd23b479b95b550c8be9 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/98468edb588af1f5f356ddb61fbe6c14fa36e0b6 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b56b627c1e32bef7a97363345ae52921e59915b1 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b5decf3a93dd7034a25d59584975a2a89d0bf67d | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3724e75f9b7655fc207952009ecd8351b3672828 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/59dc3811779a8893ad1c3717efd28ffceac4d71d | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a20bf0d25416ed5b1dffd6853b94fefd5fb5c5b1 | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/10ac9f95649199380da9ed53df4686680350d22d | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/950efee32306cb3bbf499be1e22698a4c4fd7c65 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b5fbfc0c938ea2cc1848ccf35d33ffb78877ae3b | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/eaaca6b8a1ac24b7e35152c497ebc6c147585290 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/090c7dec56b11d95df70d66a849053726c2d8206 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f75a28a820f0950b5e25fce0051e3ab00a58e89c | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ded2f4fe2701a5f54801fca77029202b84ed6164 | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/abc18dbde1610d60614c57d8337c2fc5420bf08d | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/170ded9c68bcf3c3393dcecdc6a3374e69822433 | ORPH
    m68k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8fe3f9bd3f76c8492293f2abf46eefa3a89de8ad | ORPH
    m68k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0d75db40c39cd41379a68f12dba5bcc34b98fed7 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ac521b64baf4b4ab53291242c0934f50f1174d9b | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/354cf7da1169852a1583e94f11514dcac28dbd29 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/581f8fafe0b07e5cd1c3a5aea699c45ca0914625 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/ff86540e25cee488242bce30ff8cd20aa4e77a86 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9fe8458d112f4b84d16a512685a29fa0b06fa3dc | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f75af21d71451eae573bf92d8142a6552ee23b1a | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/cd5382cd8b2e6fdaed9a1cebd1b2ce169eb82ff3 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/2f6c7d561f7cfeb66d3e652f26bcbee6dd630590 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4c92ea143f33a8413a8f7c3785d660774defc7f6 | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/22e760e44e27182cce9b9a8a858db224675993d2 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8cfa42d6a282fe2de79ac96ab359c6d994dd5d12 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dcf53adeae8a37dfbf009812a85622808d265def | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/395950d4b032381fd5e2df76c84b18c081c80319 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/128f8315e5767a81cc7c4603bb3a704a1791a108 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8ab9351807a8b5f0952ac89f34a74884ad5f4bc9 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5fefca4c2cf6fe3f3348ee671a986eeaf42c092f | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dd78f412ea6358b3676d04864d8fc732c58342d7 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3fe22af72e08c637498a7237a78e6979e360e650 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fd98fed46d07b399251a6380e38ed4d91bc6fc6d | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/608c047a592cd2e924fec63900425386cdc85893 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d895d896dc4d704d3a9d48f879f1931f012d0d0a | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/2af6719810537180af7b1ec37431e7d18a788ac3 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b877fedcf9d2d9535e56794e807b25b5855f3b6a | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/add88fa66268045794815bb269c9657a0fe09f37 | ORPH
   mipsel    |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/2a42dca1af655dc700a5cb87cc4edd641c72450b |     
    sh4a     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/dae2899ae1ae3cf7efd691f3f8bea23aecdc38b6 |     
    arm      |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/de6658a2355dbe8f66e76e24d16d4faf4939942b |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e3b3ec11e1c35a6459a81167bd7bf3e776268528 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fcafe56a2f82f09bf25aef7d6bb265070663cc1a |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ff303bbdd3c5dc0d929834497df0735e35a0e704 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4497ab3cd504b147fbecf8b580b833dc656c5abd |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9878e176894134971ffbaa62e86ea8939520125 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/edfa66778e7a2ab5312f11b2a8de7df13475e450 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/20825a051d1f17fe5f970be78a1d2470ae013a26 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0cee001803fc1766f64103eec83bb573e3d8a614 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7bcbfb7936a7e9468a8b8f137d8f713112d8bab9 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e7a2581b98554ed82632e2952bbab2895ca3fc4a |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ef9077227fa9d5f9dc874d0797212546782cb3d7 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/50454995e9459530bd8ccebb917d36a257a1e58c |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b5ed3fa4bc514ba6c1d9e8f219fa4dda9aebdfb7 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/692ebaab7de56515202c6fc65f765f7018a2964f |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/32dad3acfdfcb13b8a8b47c3557eaf65cfed9a90 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a1050e98c0b46de9b0625e27a630d3efdcf9bdab |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bc55ec0ebfe64a71bfb8630264e25dcac67f5a7c |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a2aae470462f6332f383ab8dd5773b9ffc53b6d1 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/202042a2f89085d6a62b21ea358e024f87179133 |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/45cd38d59b93c7655be331083c4a639c33cbf27e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a1d6f11d07682fafd4c83aa5e00651fd783b73e |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/00832061e7ef0083d80d6601fca5e877ee1e8c6f |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b8cb62f1fa49d76d1821463b11b78f7dddae8c39 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0e8bc4464b0e1a90c27370067d13c1ec48ca06de |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a2d721932e7a5f04584bb6750f6ca4817dc37dbc |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e4afcc55f16308dd30ab3e8cb61fbf77b8e88f02 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ca243603e1e5a1bb9272677bf16ce47d1c063eb3 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b6ee0cb36ef6e7074c30ad86c52d7eaf5de623fd |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e7b2490ac85586a908b510b04db10f655e76a169 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8d71456974c2520acaa330f13d88a19d813b941d |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c70a47b93caa5e3fa2de7e524fb2ea76af9b7a96 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e78c7f240ad484ad9b87ca9fee1eb7cf8825a43e |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95f6f720bc76d41c53e2a69f88ac3918c3cf9220 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d4ffd14abe744573be85b516797146543ebb0658 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/849f3ebac5d3871a24fff1612185b1b2f234dc99 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/253101e249db7dee07d176894564d2ccbe5bd135 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/72ec8584081bfef4cb2789006b2a4ae6cb3274d7 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c87c53a69bab1a10699bc9fc08c0641eedd1c4ed |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8c7c36cc69ed54c5281b0e33e63cb1b82fc0e4f8 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5c9b10f2f7b2623dad0b049f72ac5a66c5f435e3 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9235fa30db79953ff8cdeaf24b6c386ce2f608ba |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e829dde90f8ea0732018a1df774704efae59ad87 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2a8ae6c9d6f3e1baa77fe3c5d9a9ecafde8dad02 |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cd8ccf6d3d988deb2c6a74e1513df88aad22aaaa |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5ce967f58e62cdaad9fc83c2963825f371a4b861 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dad1bb485595073b22d92ac06c087e8faab0c9df |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/867d3fd49ce625e07b21c16ebdcb257cdf9ffe40 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/71246ac889c6202f7c0c158fa19eedc98f9b3875 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/634bc918647d345b7e3ac4e10ddfc20bff69a425 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/06d8c174f695eac871633d056d9a609f0b66b270 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a933e364d0843321b5f254e46e91b3eb79490fea |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/579cfa2d96607a843c4558116c616846a1835fed |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/49c45813a906cb5c3c3216541368776d20e99dd0 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f78c20cd8c3a8dec5e828cb344e50ccd71ae9eec |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/37e578f7854a383dee54e682af011915ae933142 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/21f20ede8efdc2ee5a47567b18568d326b523c0d |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/03bae72788dc4569c7ebed7d89aee9875de45532 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bda30836b35f3de737941f3e3df977b21b63853c |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0b5e68473f616277b28440dd2271ff163add8609 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b84ecae42860771d6261866427aaa7b157450f3e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/473c6ece864f2a77d755fff38005722f711797ff |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3acf1d93340d3f7aae425348dc786ab97ce91111 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bc5ac0cc3e857677a94710c739158159f0c39547 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e4c5519414f97833ad5871e89ebd11708a57c23b |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/064df592ad2650b3a40497aa999d9ef504ab9a67 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f7e222e4a147a33bcd226aebe522f3b3b7f3f011 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/49c01313d67abb27c0f5a066f77a5098b05fbb7f |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/43bab76bed08ecd96f2814aef10beb45e8a5c2c2 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4323182d8769391873e08817d1d690c2fb54c99d |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3232e904c44e1c0e4b0f4a9e0dac9a91d9276446 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                    dust-0.9.0 | 1 
                 openssh-9.7p1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7dd2853a42d77c182afec712cf31184644ce32d8 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7f703764f71b208bc14dd0a24e4e2090ff5f58a9 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/ee0875dfb15ea2221a90e14a73809ae086574e75 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/08a1ef79b472ef85b2398f62fe59093e7627eb73 | ORPH
    i686     |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/21397b110fe02e5711ecb1d35be2108221751b0a |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

             containerd-1.7.14 | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
              libarchive-3.7.4 | 1 
                libressl-3.8.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.8.12 | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/b0e91c22f8d72af5252bd2f6a0e5d69b660f1b64 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/b477b4c308caea8be1368f155b5e4e000a84034d |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f199f4ad08b8baa0fa9b5cd339a9181495919520 | ORPH
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cb2b7d926873ebc222a07afb53fc188b7058c0b1 |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/7ef5dba7cf2a7939970e7224e82cc7f3c4164ce6 |     
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/402b363d98e127adb5265ddb8244a4b187b11b0d | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/4bbaa072df00784fc2195e2b2446b0438010e413 | ORPH
   x86_64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/11ae44c60bbb7392ab64550d331e866ac39f0ddb | ORPH
    arc      |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/417b206ba9981132608173e870eda2c52888cef9 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
