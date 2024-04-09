Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE1CD1296
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 03:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9995140A5E;
	Tue,  9 Apr 2024 03:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u2lTVcMauF7; Tue,  9 Apr 2024 03:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A02A4040D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A02A4040D;
	Tue,  9 Apr 2024 03:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCC8F1BF39F
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 03:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C980A60B8F
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 03:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSQv9qC3vvK3 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 03:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C735360B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C735360B74
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C735360B74
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 03:55:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 463841BF206
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 03:55:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 09 Apr 2024 03:55:55 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712634955; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=STMdAVPnQHelE0T8PcEUPd4+8H04hek54n1rkxEgAiM=;
 b=ml2lzp5OMbVbcDNaot+vqzecKPvF/Z1FKWh4UoGmnPqO6bZk/a7txoEnL73W4gMn3GsFfQ
 NoHNQzPFosRn+l077/PhRGLw24hxo+mybjK3MmULx3WLt6TlYOrmQMXvB1C/6ZJnoueKgL
 /+LJrY6MbdQOIUGzYM7ufMgq4Ldhq+qT5nx2Mq8G0kOMMfyVgXRBF7v7W8cvVj40T09q+H
 AITV2g/jMeUX4QxxlZ0Si00KdjN0GSwOo/aTWRBkKSGGigKivnL9+pW0bTVdBvHuMZLiqW
 4u4cMv3U81xmWk826UAqB74Zov9lTENTjMdYMoL+3g/LTYhSq4YVQj81n317oQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ml2lzp5O
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-08
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
Message-ID: <20240409035555.DvZBqKG54UXz4L3qhY3kSxMK1tHMMAgwcGSC498Pa6g@z>

Hello,

Autobuild statistics for 2024-04-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  | 12  |  0  | 19  |
    master   | 68  | 83  |  0  | 151 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.4 | 9 
  gobject-introspection-1.76.1 | 6 
           dmraid-1.0.0.rc16-3 | 4 
               apcupsd-3.14.14 | 3 
              host-rust-1.74.1 | 3 
                   libnpth-1.7 | 3 
               asterisk-20.5.2 | 2 
             cni-plugins-1.3.0 | 2 
                fail2ban-1.0.2 | 2 
                    fcft-3.1.6 | 2 
                gnu-efi-3.0.18 | 2 
   host-flutter-sdk-bin-3.19.4 | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
               ipmitool-1_8_19 | 2 
          libcamera-apps-1.2.1 | 2 
                   linux-6.8.1 | 2 
              php-xdebug-3.2.2 | 2 
                    pppd-2.5.0 | 2 
         python-remi-2022.7.27 | 2 
                    volk-3.0.0 | 2 
                   bullet-3.25 | 1 
check-11970a7e112dfe243a2e6... | 1 
           crucible-legal-info | 1 
                     crun-1.12 | 1 
             docker-cli-26.0.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
           heirloom-mailx-12.5 | 1 
         host-gcc-final-12.3.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                  kexec-2.0.28 | 1 
            libmemcached-1.1.4 | 1 
                  lvm2-2.03.23 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
                  ntpsec-1.2.3 | 1 
                  octave-8.4.0 | 1 
                    ola-0.10.9 | 1 
           python-numpy-1.25.0 | 1 
                    qemu-8.1.1 | 1 
                     shim-15.8 | 1 
                       unknown | 1 
                    xen-4.14.6 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/57a8513b97c31636a532b5e9e3d6bc994341aaaa |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f886e942123fd105a4e8c50ee38ddbe09cfef021 |     
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/55bcb09722f9963213de53e0186c850ae118fcbc |     
   arceb     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/7e4cd1861f71ed0f703d927a12075e6935e4e6e4 |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/bf20ab61c718a8046c9a8ce30fcb3b1e155fc95c |     
    or1k     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/fb1c52c40641aa46209f0cf160d9041250263941 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/da7a11ce94c1cfb86a2f8fcda73f6b5676184736 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/3fc91dc1ec410b46bf0326fcb4e8377148efeed5 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/9cd6a610d306c0e255e9aa089760fbe2b5b6d53c |     
   x86_64    |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/6eb3f26ff61fe43b3f850b9385466983de241122 |     
   mipsel    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/a8672913fbaaa7fad57140d1470379a84a3c8f61 |     
   xtensa    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/b248af57fe9f158dec91c0eedaba391b74ee8d5d | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0349c6bfd66f5e50429e4a5cc07fb7abf2b07345 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f02c073f2947c08e84c66279bef61ecedcee66d1 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/ffcb30b165833b34f37742559fac325eb2d13391 | ORPH
  riscv64    |       docker-cli-26.0.0        | NOK | http://autobuild.buildroot.net/results/c5580ec31de4587cb92fd97c5d57b49ee1619d71 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9912484bace716434987a806fd751afdd4c04c7e |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1dd85e197406c03637535d2c89548295b56438d3 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/b43a0d7a9551bba0bc70f2dbab3609cdb33de58e |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/7403a993f20d663819ff214759a941528666511d |     
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/4c4aa68d4f6dc8274a9219531d064a2c53599137 | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/83f44efc9c29fd86ffa2003983f90840fbc2c784 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/8d1a41888515abb64790874e945c1e9111e149b0 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/df656571a71c4354e5b8f009f4f51b6abc9dabed |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9e2bc0df8f78f0204cc90cb10787fe8da60ebb86 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7b6f629590529a2a302b788f8ec93c635e9787a4 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8a06316b69e81bc00a50a46d9fe9038aaaef1615 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f6acb99fe74a9a36e2acca9eb256a07e9a752c40 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/86535fd870ebe38ffaba5bacecf32117d92a348b | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a2929884ff661bd3daa4011c757115ca044bd817 | ORPH
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/149dc42e4321be18032489f56335d391bfa74b84 |     
   nios2     |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/b0a593a9038bdb2c136ae89082c00429ed4b4aa8 |     
  mips64el   |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/e8cfedf344917f3d11482a8f90c19d31af3055da |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/0e4fbf8747247236f7b01f424b5948526f385cfc |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3c566ceee0d0d0bcb03d6a72d06a266a491b116e | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b279db70e37175b62513979ade6faefef0ba82e5 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/80d8f5b8d18de212a8bb4cdcebb01526aa8ddadd |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/432b3213d754a0ccfd068254f004a266dd5e8578 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/e88a46fbcf52499725380bcd3af1e298ec1b0aa3 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/698c2d80b57c6d0c7dc5fe751acf281cd3c94ffc |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/ec1ece4e753cdba288010e3213d85d070d9a98b5 |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/12baba80209e9b47bcee539607884f4b18d85e53 |     
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/695f96e05254d20183ac4b30ce56bec270e6af35 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/67bff9a3b1f649cfd4590c90121e7dfdd6f944de |     
   armeb     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/4b191a087f4140ade08aa3b5d4ddf90e8e93b6d3 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2987a2992cbd6f4db90d720b414e783843ae8d96 |     
   sh4aeb    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2362da3d1a203649503c00ff2797d7bbe64fa5c7 |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/3c5ee59cc032c700e01c4ac84922d749e0370a4a | ORPH
    or1k     |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/be8732b9c4ddf806a61bfd1ec683877c1eb20d2b |     
  riscv64    |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/17a32c8794803554b4ab00689e078d0bade81fec |     
    or1k     |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/952374f7b2c894457448589bec385d7e42190077 |     
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/617e1a1835f0a87a94462aedbdb3d98f499ecf32 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/083c3155d67819ea831bf1d3d6aa6a0f833529dc | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/10f5485fd28e34ed17df34dcfc10f4a079b4dc63 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/20e51ce0de5549458bb6752ca3c131d52de198ec | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c6a9d603d7e674b15bca6bd054b85b686cd45cd | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4e78e568cf28b5badb93c9d200e1d6481b4821f1 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9900c2829f63665209a0feaeb914376e61eecd1c | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/378f32cc7dabbb01da8e7eb871ce0d37bdd42408 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/02ec1c27704dd406f649253732b00622a52be89e | ORPH
   armeb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/cb884bdb1e151eaab8da0c61e1175a7efc34ce8b | ORPH
   nios2     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/2b15763619b1a796f297a423c661537e1eeaed5f | ORPH
   arceb     |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/69ff91d4ad28de5723cb94f3cc56c47527d8e96a | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/551627560ed2442f43373e0c5bc05111843c1da6 |     
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fbe3bc347a83a810ffbbbff93a45994963712bee | ORPH
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/39dd0102f3779d08b7b79ea9d18ccc3993534a15 |     
    m68k     |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/821b33f9c1d30ac6a939c136a3a11d50077bcb8f | ORPH
    arm      |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/0971d0d2718c613d7b35203ae759e66bb78fa69e |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/dbce6b86b48073e45cf57d8acffa52ab0c4c35dc |     
   nios2     |        php-xdebug-3.2.2        | NOK | http://autobuild.buildroot.net/results/fb7b4843bac93cc51c831b15d5d315c909373b88 |     
microblazeel |        php-xdebug-3.2.2        | NOK | http://autobuild.buildroot.net/results/1ad46cc793d0abf082c70c2d1e038fa4497f32c0 |     
    i686     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/aa7c1377724440202c98194228ebb660ddbd0978 |     
    i686     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/f20f392510be9975b19bf3140e02921737a81031 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/74d1a3f02a44d5ff31d9a2e8cd69c63ab3cf795d |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/68c6773ed5e4d2106ab3f26a3ba90493be8429fa |     
   armeb     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/80847f801402c489c36e64f984070393cf1de7d9 |     
powerpc64le  |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/a88ab55de47437945d11da46329d4e5645ab078e |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/97b6333cdc7bad24aba7af1b04890679e0058299 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/f36bc64a806a64d7fd989ea1e411023ecffa389a |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/8eadd5b7c88add187fe36d9803012bbde5813a86 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/780cfb5ffc2eb2ce6050897e748826b130cee3f2 |     
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/30634e11a643d3241abb53a43f07ab079ebb08cb |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/591c2cdabf36c3ea2648942620ff2e414027877c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 2 
                 dc3dd-7.2.641 | 1 
dmenu-wayland-a380201dff5bf... | 1 
                    eza-0.16.0 | 1 
  gobject-introspection-1.76.1 | 1 
                 highway-1.1.0 | 1 
             host-delve-1.20.2 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.2.1 | 1 
package/crucible/crucible.m... | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/78eda3c709177c0924f7ef4d6c3793d1fe38537b |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7e68d6c61bcb991be1b613ba72c212342369602d |     
  powerpc    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/563c1de5480a33d3ba061d238a1d54cf3a213d1f | ORPH
    sh4      | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/8bf710abbf8d584a32f9f2237fb0e43a2cbc03d2 |     
   x86_64    |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/3d34e1231cc7d9e1dacb5fac68ba13b236eb2fef |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1751a607f242a66b910837146544850bd760a0ec | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/f751b6fee8ef829239b9ec08e3247afa8a95f331 |     
    arm      |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/eb19825035ded8ebef5e039bb9c8c6d063177754 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4cd234e709812d519c91f2c76dab89fe9bebca79 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2697e232fbbd8d5b18c18a64f2b65e1214757a4a |     
   x86_64    | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/770f169b4c6c9202f86e0e7707f184767d30d7b2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5665c545fb30f25b61ed9fe035352f5c4fb6605c |     


Gitlab CI results for 2024-04-08
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785142  | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785424  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786785  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785446  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786651  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786654  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785301  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785210  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785776  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785320  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785845  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568785891  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786062  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786067  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786074  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786116  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786152  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786164  | ORPH 
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786166  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786169  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
