Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B355C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 03:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A66264155E;
	Wed,  1 May 2024 03:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pYikGY34TAM; Wed,  1 May 2024 03:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B834157E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B834157E;
	Wed,  1 May 2024 03:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1BB81BF20B
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 03:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE06560AA6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 03:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Lebde6JUeSL for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 03:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DFC660670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFC660670
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DFC660670
 for <buildroot@buildroot.org>; Wed,  1 May 2024 03:59:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3984440009
 for <buildroot@buildroot.org>; Wed,  1 May 2024 03:59:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 01 May 2024 03:59:29 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714535969; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e/Ia1gMcI8VUrbppudyg0DzUbz8UUKPay3zhP19yolc=;
 b=NgaZfk0jc97wZPjKZmu6lJLmIYKMq3f9GMcReCIARGaG6y5IGGg/08tffrEcUoPW/ztJyU
 gEvu5onGE5ZevgGEqqxX8HrZ2JFx8epgc2xb18N/QMwrLro6FFHwYbhsjc/dFYXPU669gX
 NdBNKGoB8iLIrIAo4CF4BevwFqo+12XhY4706Q+3VpYdMN83xB5xoTemMrnPyN1rTnDhxO
 ysyfYIJJag2sIbGkuKtSCx5J58M9u02UAMQMdsIMhIeG+IEQhjMtkQZANNjChVusZjVkF6
 e0Qzks7q8vkDfG0jbGOocU4RPgnr+SRkaGqK83ZV+4HlVxRP8/BlqKsTq520kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NgaZfk0j
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-30
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
Message-ID: <20240501035929.IX_s4jSalVgYD7NnKPN4gvcLCTADKuUONPzQH4yUubM@z>

Hello,

Autobuild statistics for 2024-04-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  4  |  0  | 14  |
    master   | 19  | 37  |  0  | 56  |

Classification of failures by reason for master
-----------------------------------------------

               apcupsd-3.14.14 | 5 
                libressl-3.8.4 | 4 
                       unknown | 3 
          libcamera-apps-1.2.1 | 2 
                   linux-6.8.6 | 2 
               asterisk-20.7.0 | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-26.0.2 | 1 
                elfutils-0.189 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
             host-delve-1.22.1 | 1 
            host-fakeroot-1.34 | 1 
                  libffi-3.4.6 | 1 
              libgeotiff-1.7.1 | 1 
                  libsepol-3.5 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.0 | 1 
                    ncmpc-0.49 | 1 
package/python-pillow/pytho... | 1 
          python-grpcio-1.60.0 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/24e73bbccf35b20d131b88e24cc6efc5c724ac79 |     
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3a880ae8ffae5210041aad88790976902183b278 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3327ccaa36ba465006d0564f02d75dfd3451c349 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/12e6ce21f5920becf71fc2a7180e00bdc8800931 |     
  powerpc    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a89bafbc93d482b6bcf6548a77abdcd708d71b30 |     
   sparc     |        asterisk-20.7.0         | NOK | http://autobuild.buildroot.net/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/1b4fbebbb366f8267b114324320f48915c9ea9d3 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e80bef4b58e096487901fa9af8ed5754cd6d31ff | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/027a4aac2fbe5a5155714a5ccb179aacd40fb959 | ORPH
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/a14a3e666648c54c3764a693e252abed28a82d19 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0f0bc6c0ef52a6cbbca2e763f75bfeaf99bb2452 | ORPH
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/918e041885d4765496be72b41d4c7a540621711d |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/72a02676abbe55050e7ed11e847fe5ab003d4dbe | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5fc7b6b84dc293ac4bcd5a450ffa6e09285d21bf | ORPH
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/fe63967abf6b081140552b2e922632bd82709d61 |     
  mips64el   |       host-fakeroot-1.34       | NOK | http://autobuild.buildroot.net/results/3eed99fbd4ad111eab4ff8477b50c942f0686a9f | ORPH
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/66a2e5c6df5d4ac5cda16ec41d559095b021404a |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5eb014e211ee4a93b5e4ccb53132fb2796cdf8ea |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ed4c6a3ffcc1cf909e22f7a8b8750387a018199f |     
    or1k     |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/492f6e71e82eebd5dbbd95f12df2eb41016cbeac |     
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9d2fa14df8bba3cb9c00e9cc697fb90117e0ff0b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4a233cc3a62d7f1eadd82c92b2c37d3b6e17d184 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5168ff125ce1af1931e4cc4d916e4fb047ed56f8 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/25c8591bebfcbddd57d3860eca70b7afa4814de3 | ORPH
   armeb     |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/e2921d3ca5a91b6a761896cccb6e559588523e32 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/efaaa54b4efef029654a629df372139cfe797be4 |     
 microblaze  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e590b7884fbad5d311da87ae8cbea0140b15ba67 | ORPH
microblazeel |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/a7409d0c6550c6502d1feb919f69f8e4b2d3cf20 | ORPH
  powerpc    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/94defc2db527d060100202cd6ebce060833d6a1e | ORPH
   arceb     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/856ae5ee8241e8b2b6a787c2dc2180143bfb29a2 | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d3fcf3e09d990ad57c23616e23be523f8ea3c12b |     
   mipsel    | package/python-pillow/pytho... | NOK | http://autobuild.buildroot.net/results/4c933419c0dc6f5ab5ca9f5bf99eb87ea38d79b4 |     
    i586     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/5a2594a3e7ccb80368cb0dc58ac34017c3e170be |     
    sh4      |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/8619963db75c9929e3a29019f045e90eb023387e | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ceadc2af25de8412a5626df4451753c058d773be |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/30b07951651703ce93e055256a5975496aea7277 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b7a35699d60a923db6c8930a94ed91610cb2a830 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 1 
              libarchive-3.7.2 | 1 
                libressl-3.8.2 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/db0eb2b709881a75d352147170ecf4d1b5b19164 | ORPH
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/8d40d4d6bc7b5f9d2f5c3f00eea7c0ecd3de0517 |     
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b549e57b9a37c095749cd0a7edc144668b319d75 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b893f5b56a3078ed10332b0f72d297d1a325094a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
