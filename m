Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9826CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2327141B50;
	Sun,  5 Nov 2023 07:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2327141B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPw7YJ3IolJd; Sun,  5 Nov 2023 07:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A778541B54;
	Sun,  5 Nov 2023 07:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A778541B54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82B4F1BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1C460FA3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1C460FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rP5LrYSg3RfY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:00:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F0FD60E82
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0FD60E82
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EC3420016
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:00:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 05 Nov 2023 07:00:47 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231105070052.2C1C460FA3@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699167647; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aV1L4jo8kgUVHwNCR15pdGYTkfzHYm8EmaOpZqVMt2M=;
 b=AcQcq+AnRZCqGNvTRiF5z9dxOCyqzjpyxwVYi1oAmelGeytWrp/pcEzkdib4aUp/vfT+DN
 M77HsnbCSdtCdce8hHTKgTZHSMJbXhgfOnhDHBg68BLVcbitugkU7VS/AzMZMcGsrDDp0t
 J11MkpssgSYZPjvruw6VxDakXjhhv5QDh5p8UW03COUR6m8JzBjKnUEGohPDobr5a+IvY5
 XOT06HWWSVdcgTcjZBVvvpRKV3WorldT5GRnt8E1O56zpD2euySHRL75ol57BgWWC58kOx
 Ng3WqQkG+wp0tqrlDnHgdVk4eWa+LBwjTsK/EK46sbvqGWssaXT6Py5lpOXRNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AcQcq+An
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-04
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

Autobuild statistics for 2023-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  | 10  |  0  | 28  |
  2023.08.x  | 13  |  8  |  1  | 22  |
    master   | 34  | 74  |  1  | 109 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 9 
                elfutils-0.189 | 7 
                       unknown | 6 
              gcc-final-12.3.0 | 5 
               libglib2-2.76.1 | 4 
                     linux-6.6 | 3 
              gcc-final-13.2.0 | 2 
  gobject-introspection-1.76.1 | 2 
                libselinux-3.5 | 2 
                   openrc-0.51 | 2 
package/nodejs/nodejs-bin/n... | 2 
       python-matplotlib-3.4.3 | 2 
                xenomai-3.0.10 | 2 
                    atop-2.9.0 | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 civetweb-1.16 | 1 
             dahdi-linux-3.2.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 erlang-26.0.2 | 1 
                   ethtool-6.5 | 1 
       freeradius-server-3.2.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
              gcc-final-11.4.0 | 1 
                      gdb-12.1 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                host-go-1.21.3 | 1 
        host-sentry-cli-2.20.3 | 1 
                libgdiplus-6.1 | 1 
               linux-pam-1.5.3 | 1 
                nushell-0.85.0 | 1 
               openblas-0.3.24 | 1 
package/nodejs/nodejs-src/n... | 1 
             strongswan-5.9.11 | 1 
                 systemd-254.5 | 1 
                 uclibc-1.0.44 | 1 
                    zfs-2.1.12 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           atop-2.9.0           | NOK | http://autobuild.buildroot.net/results/d3acd53cf59f936b7b93e1a6f360bf95a6288db0 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/cff10fe29eed76a8d83f05da1bdb550031e22e4b |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/0a668210264711da904f6a13050b5b60ebe4ebec |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/cc9eaaa6650a183931729efc9a57d2d45de38931 | ORPH
    i686     |         civetweb-1.16          | NOK | http://autobuild.buildroot.net/results/d33a067b829d896b6df3e36bf953daeef688764e | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c39d9fb570dfb16df77e0726c47b4718775540f6 |     
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/6ccdf9d158636b733713cc0a7156c7b3ffa38ae0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4412417c4d6b0fb75a866818648cd538473b6c03 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b854d715d5d14668291035183c26b65806884b74 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6781b3f1999769e3ecd01efed18b693610059f0d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/73d818d1ac879713959e0bb0dc44a1d5cefe6508 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab784f77e246f98526dbe27a05157173b484a7a3 | ORPH
    arm      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/39f35431b966c76898b615be30ca6f97bb3c0e27 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4a4a8ad529a822fd212e8437d22b0a67ea05f556 | ORPH
   x86_64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/3dd726b1552329e63a654ab03987dfb0d7a3bceb |     
  aarch64    |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/43fe46cd2a5f93e605a7f46af200a50befef0965 |     
  riscv32    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/36143ab06b66a047aa2247ea66b1df0d6c1cbd66 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/133ffb5a117d5592bac1dafa59813b5d23a8fd63 |     
   xtensa    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/55045c55f821206091f10745efff466f1354a414 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/5fd2243e52a1d24eed1defcc71ce8f6b6b1ca3d2 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/b6ce37578512e8c96bd87b7e4ba79964d38c7ede |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/bca55e14b3175955243974dc98e4c0eb539bd0cf |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4ed85d31e4878a20977505914978ba6770bddc7d |     
microblazeel |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0fdbe238754e69be71f35cceef66f78d3b4cf826 |     
  riscv64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/46e6dfad37a38d85276e0d2b5021b23f3bc3894a |     
   mips64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/50a78332708cee20429956e74308b53e7df20aa7 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/2112095eae3400658635ede6f2210e2d61069cd9 | ORPH
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/c32c4fc3f77b1569c0e336b03ea39185907290d8 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8f6ff1470b0b37e52f05933f7529cedc26a4bbce |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/768fe2af5b529ef489dbb7d052e83de908a18e99 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a5e10f514b6867528885de3e80543e4b7854c561 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/3ef17422a535a7234d1ce314ff258c97d47da499 |     
    arm      |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/6953eb18cabec8cd3842dcbffe9295f7ed6b9715 |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/86e580d2eca5e2663be6b191e3d64a2910305aa7 |     
   nios2     |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/3757921a2160ca209089a0b47414a445cc42e35e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/22a48efdb57a2d2dde8a1758b63a4f3b58d58da0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/67e8d9e05a11545f4034b2196a6fcbe485bc557e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/82bb49513105a0bf5a46bb956e55e72423b189cc |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/180a7bc7673ecce7f52fed514f524eae7c5cdc3f |     
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cb69be1c1ec3e5d5d7b10f82fd8027eec9980868 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/97150db64e4b6bdb2c86a36138d198461b6df2ff | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/46a81663db3b7a717849503b992d2d1a1e28ad60 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0f940379b704874952dad71289b5b95c2bd6d064 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/eebc181aa69eaaa2721521e5e6276d867fd36de3 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a9f996c1da306b786664732bf6e2438e5d553153 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b8db99e6f6488f6624971dcd15535049af6307df | ORPH
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/999113ee8bfb00d808d38ca44d6f11ba3b47c7ae | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ca4b8696b975f7ea00ebefa3c77b6bc385977966 | ORPH
    arm      |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/676558e79e909e898bb64affe5f9cd63df71ec7b |     
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/e440229d354c86a0a3479cb7a36576f709f8b5ce |     
   mipsel    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/43321079a3b99f63fdb2c8e4165cc3a264131ee8 | ORPH
   nios2     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/c511472ad52b39a6cbd462d794744a6e748b7dc2 | ORPH
  mips64el   |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/40b65ad6b35ca1d446fb3686be83e1711829078d | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/464db8de90a6fd6d62f88292e3ff6ac4e2833419 | ORPH
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/c0933b7043cb834fee8450a162ba3d73a6f96e64 |     
  mips64el   |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/efbccc0097b5e70db498cc7905824643f7445abf |     
    m68k     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/bb6c7a8e6498e6497d59b71dcec3f193b4b1d370 |     
    arm      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/e69b125397d0063efac5629de93db5c72bbd2d50 |     
 aarch64_be  | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/50e61ffc734c999e6275cc573aabc735b837890c |     
powerpc64le  | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/b2df0328e5e0fbebd3546c7607f13a678adb56b6 |     
  powerpc    | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/fda1e895b375a70085c2fe84c886500f55102936 |     
   mipsel    |    python-matplotlib-3.4.3     | NOK | http://autobuild.buildroot.net/results/46c86bbbc4a51e388fa354f4c0de00335a95e907 |     
    mips     |    python-matplotlib-3.4.3     | NOK | http://autobuild.buildroot.net/results/655db23e958694f5108ffcbfed45a06c19a3786c |     
    or1k     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/10b2f6d91ccd2e1a9d7bf1e6d517db95c2b07c23 |     
   mips64    |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/25dc57db27b1756e8f6b0a233b5a2e424c3e0bcf |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/ec048be54458ae231c992172dee64585971adddf |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/978eec22033add955e51a792c1c96520e18cb630 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e8372b2d1f524687849fd158ca23fd068e90f0c8 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b94dc262b822c6e1eb4fe3773232e4ddfb7b9812 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8df8daec5704929e759302a31cbb79e4b214b3ca |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ff61b7eb0967615285fb36181d927810d9d7a86b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9657ee803889b7a186146a6fd5a5bdf8bf816b8c |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7b3cfd5af2ce9435e06bca97855c264fb20a538b |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cd5bd586ba00224fbf92771edcefe9687e809694 |     
   nios2     |           zfs-2.1.12           | NOK | http://autobuild.buildroot.net/results/03b9f12a106bf100eec695a92b83bf09b22c68b0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.20.10 | 3 
                   bird-2.0.12 | 1 
                  check-0.15.2 | 1 
                 gocryptfs-2.3 | 1 
                libglvnd-1.4.0 | 1 
                  libogg-1.3.5 | 1 
libuci-4b3db1179747b6a67790... | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3e0fc375a59f3f91f6fcfd699649bca4a8c45722 |     
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/e241ec6bffac49d3d35f31439a898993d0209263 | ORPH
   s390x     |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/ea4cda21aaf154688a3002b8bd4b7eac498bb4e6 |     
   mips64    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/1cf61b9d0cf894360ac6e3892bd8fa58c6d37ad7 |     
    mips     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/aabdfbee5dd975eee54fbee42d19d0d23d4b3b44 |     
   s390x     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/4f41b54e57e5c2ced0e32081b33402a820ec0ad0 |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d47d83b4e1437de57ada15d1e971993aeaeef22f | ORPH
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ff56bd547dc81b0834d47843181897d1a9adc9df |     
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/30ae8ea9746d63186bff2079d66307a512a44be9 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/6f6d23c17774f2eb81f4dcdf19658518e40ca90d |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   libnss-3.92 | 2 
  binutils-arc-2020.09-release | 1 
                elfutils-0.189 | 1 
                 highway-1.0.3 | 1 
                        nodejs | 1 
                    qemu-8.0.3 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0910c188212d94e9e9ef8af646dc647d9809eae3 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4f12ed94464d7c48566e00f19d4065ef4c331ab9 | ORPH
  riscv64    |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/b5aa93e6cd214f71ebb7184248d3c5fe5fdc68e8 |     
 aarch64_be  |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/6b274ae7c5b9aa2e4e3e348c1eba147111321bae |     
   mipsel    |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/26d50f85aca423ed259ee5afd820249a116d0ff3 |     
    i686     |             nodejs             | TIM | http://autobuild.buildroot.net/results/cd3eb420426a754a54ac5ecaaf937be36b5ac257 |     
  riscv32    |           qemu-8.0.3           | NOK | http://autobuild.buildroot.net/results/42c1800b970c325d2774305df9943bb18fce80af |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/85918992cf6965e7fa3ec6205f82b93d10a082e1 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6acc06fa5e10fc79763cf3d9cd3df291600a0ef9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
