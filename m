Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9F1C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 03:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518878233F;
	Fri, 12 Apr 2024 03:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4G-1Tfmzcl7N; Fri, 12 Apr 2024 03:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EB982340
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EB982340;
	Fri, 12 Apr 2024 03:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36D431BF215
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 03:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309996062D
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 03:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGv93twpx8MQ for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 03:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36E9760615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E9760615
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E9760615
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 03:59:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0E5140004
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 03:59:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 03:59:46 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712894386; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fjJDjGJlCxCWP8b0dYdpO0zeQyec0fQ119ws4Ft9gKg=;
 b=DxpOPDkwsJYvK2ixb5hd4BeZV4gzhxlmPehg/q27OM6eXGzy2Ri0w7RrEC6e7XQQMWf4NX
 WHtifhcfTj2D0fraJo14ajWBtMrFuoN091q3XpOok2/+LIf8dOsHMTBnPJkEie5UNofY2v
 ioxLClKwPjxTl/LQHvaZEivfEWQM7kMdKsaZWdfoWGN2uks20dz7WccTjq6v28lV0np/zr
 EiLTAY0V4IzB69UtslDa7SiIyKQEovfyucLXIBVECvVx9bXPadSEub/cxgpidv6/HluO1l
 Jh0MfXIGen+Eggup/6pBZvK5PLl4NoffuBqcycypDzJ/qno3wlOu58z8MjlIYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DxpOPDkw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-11
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
Message-ID: <20240412035946.lJfSD24Fycet6zB9B0NNkFMiaBCSTEEBKPpmP2F791o@z>

Hello,

Autobuild statistics for 2024-04-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  | 12  |  0  | 19  |
    master   | 75  | 77  |  1  | 153 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
                libressl-3.8.4 | 5 
                     crun-1.12 | 3 
           dmraid-1.0.0.rc16-3 | 3 
   host-flutter-sdk-bin-3.19.5 | 3 
               ipmitool-1_8_19 | 3 
          libcamera-apps-1.2.1 | 3 
                  libsepol-3.5 | 3 
                   linux-6.8.1 | 3 
         python-remi-2022.7.27 | 3 
               apcupsd-3.14.14 | 2 
                    ncmpc-0.49 | 2 
                  ntpsec-1.2.3 | 2 
                    pppd-2.5.0 | 2 
                       unknown | 2 
                  acpid-2.0.34 | 1 
                   bird-2.0.12 | 1 
                   botan-3.3.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  clamav-1.0.5 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
                     frr-8.5.4 | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                    glog-0.7.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
             gstreamer1-1.22.9 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.99 | 1 
              libopenssl-3.2.1 | 1 
             libutempter-1.2.1 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                     mdadm-4.3 | 1 
                    ola-0.10.9 | 1 
                privoxy-3.0.34 | 1 
                    proj-9.3.0 | 1 
           python-numpy-1.25.0 | 1 
                     shim-15.8 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/627560f65e399e0104625e244138dd5d2a8242b2 | ORPH
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/48db439788a8ff5c40ecd07ee8d704186678af85 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4bc4e2e9ef5b52124ab1dec600ed92132b1e8beb |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d6f9f5f9e6931a75343e9ac27dedb0a3672e98d1 |     
   x86_64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/97e823be213871f1a472608d1505a3c31b55e6f9 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc2f4d6993c4214771be098af21d37c4f17b2c4b | ORPH
   armeb     |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/541d9a19cabb3f59824932c7bbfe86cdbefa1a00 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/77bb6e5ac5826406b1b0c23f5e0e46cc038ed3ca |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e13c85be1ff6bd0075b5ed8f937ea21206a3c826 | ORPH
    or1k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/873536e2899cea4f98666a42f907901ecd1d9507 |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/e0de8145aebeb8a1b2af5dc7b266fb8dff5243fd |     
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/d38a35b5bc85b216d7dff7931ba53478f0d6f886 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/25508d73f0074826ffeb867b44fee35341d3bfce | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e637e63ae37504eb013aa60e923845657c77c6c5 | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8315a3cb0f49307331b876fc6e693547a7666af5 | ORPH
    arc      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/acf0aac17cb92e5213e29e4f73d1dc5e5124ef34 | ORPH
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/45bbfb6ee9cac8e82326f05574ba597f85e2a435 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5767de10f0746d5f69d934e2bf49455e7bcbe58d |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b5203dae63e19ecf8568f0bcd651635940e9cf17 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/40e6eae6fecaba3fe870377e8e28b917f9122b33 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/be32e0f4de24fb1fd29c24f7c14bb6f7df9e9a5e |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4041ccc640c745eb8600e45a933a1a3533ec0347 |     
    sh4a     |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/bc5da457f71c03229062bc639da0cd5ff56a4c89 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/9c1ecdee7f04df8a8b33a6ad071985eb8b74f7d9 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/6f0d7ce54ae88654c796f191d74ebd840f0867e6 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/048e17b65c6bcd78f719aee62996d634e96bd893 |     
    i586     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b3e34b9059e74ea33a8feaed80fc464172d0f456 | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/16c8a8aa650ea8ec1ae53488801f411220a80d0d |     
  mips64el   |           glog-0.7.0           | NOK | http://autobuild.buildroot.net/results/8d5e105283ead1057545b46726385f4ba4dff29e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/befc53f9b9409e0c77ececf0d52a1997142bfc83 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1d8f495b9a3ed9ca5f83e419ee749e1c39c8e056 | ORPH
  aarch64    |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.net/results/d2f72e9c847d61f67f8e9ae45d810e95affeff2d | ORPH
   s390x     |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/5d6adfcd6df0ce181c16021827ca76559f590e3f |     
   x86_64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/bd42343eb997218d82ca2f5cf2a976033564e591 |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/dbc8c699c94737657dac239993846de60b1b0de9 |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/9fc2dde951cd5b20dc5ef091e2b01746a0d01469 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/16921eca752937bfb0726ef88942cbf37ba4137c |     
  riscv32    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/6e69a6f4949ae08c1ab60dc02779a018be181096 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/eccc3899d437b70f7b56fa255d5a56bdd83fee94 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d483f6054df48ef58220c99fc74b6271f1be3936 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0bd751d1b2315dd84f9442c68187782f64d8503c |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5e16117469b08bb48d71bde6870b1b42a34b5a06 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b7dd2e097dcf3969d1168ba7e2b48ced78952f03 |     
    m68k     |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/1e43564cefc72fad23e42921d6799df506d961a9 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/92afad8b1c21631f296c17f5ac5b970815db667e | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0f2a93043b6f454312888bc1ed291fc3e3b88cb2 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/96305f5bf8f6a1d34952406fe48db18568e49f86 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5f9387a9d5583ed35b78255cd8f49484f389f92c | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b46d4f72fd5b8afb670f14d2c84cc99b10c68d0c | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/508c57562f41e239afbda927512ab60d6ac29ca4 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/ad31f836e5b65b1bc2e556fead2107958d3673b1 |     
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/eeb8c0098fdb1fab52a6bdcc5d2b615de9723751 |     
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/994da8467f40851a8189c316e27108fa109dbdaa |     
microblazeel |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/8f33f2023ae820be4462cf51e223c0af3d5f9d56 |     
    arm      |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/7ae89ed3b85706e3413a585c2734717d5f7df95c | ORPH
  aarch64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/1f63fd5a0957eee00cb673783c74a96b265a9da2 | ORPH
  powerpc    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/a8688cc8f4f1a1a7a954fa0d37142cacba9e2139 | ORPH
microblazeel |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/b1b6c8d2098297a4c838b75639b46da75ffa1355 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/a104ab4e8e2f50257da53b8402904b5409242e07 | ORPH
    or1k     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/827b714deeaf091b368d59791e4306b85a8f7f26 | ORPH
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/a042596d1e6c139a38c510ef9110d68812f29af6 |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/c5a9c389cbea970cfc0231ee0dff186ce8e91011 |     
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/979c07bb0efa9f13cabfd2da2cfab03dc5c032a8 | ORPH
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/a164ec8e6fedd806957da6b12f0fc77c1f8d969b | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/61ae694058e2b566ae8f123cddf72193d7fc97b0 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/8edf7b6a8c2eed95a0851c4e90e44202294bec99 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/4faad58e3b0e16534219ed4655171137bc5dcf9b |     
   mipsel    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/511f3de3d3b08709ead5c528739e908c6d2c2eb4 |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b2295db438a2d9eaa209828977d0faa492d02ed2 |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/56681ac19b2c335b79693a1ee49edc5947397115 |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/3327314f01216a073fef0aaedf84c31f59dd3e4f |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/349bd3b102a72010e68eafca6ff6ec5018f1acd9 |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e4eec986ff3d7ec31c85e7604075efff8f1b0354 |     
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/61e4a2ea19614d7ad04e4a00c7901b1646489d44 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/3e7c497e02453c01fa9ce302421dd5311c89f09b | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/386c6c23d5a4f99e26ee2547d71fa35b289a4f61 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf7724ad28723aad1d12c41bc1d05c010942b1db |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7cac2fc510f035ee2d36b3efeea2981dad7ca114 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  boost-1.83.0 | 1 
                   bullet-3.25 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
   host-flutter-sdk-bin-3.16.8 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.2 | 1 
                 mesa3d-24.0.3 | 1 
                    ncmpc-0.49 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0a04142ed2fd508bc8b77d838fda33aeb4e243c6 |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/1388e6108d543cdc7fab7f64c19afb09897cd88c |     
    mips     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/4d816bd03f0302e27d59dba705a5df52f63e63e7 |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/843cea0add172df29b39bdb1b31ec7b9ef9e9f07 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c2e3af1eb879687ff24bc360c249ce6f4df57eb4 | ORPH
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/1d79a35aa7d67e6bbcaa0c94f12747957fde41e9 |     
    arm      |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/4e357d256a4841298a215461ed9c20e7d0b2dee4 |     
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/acfe1d5d903350a60377c35d69ada5cf73c4c474 | ORPH
  riscv32    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d5af91421085c4f1669c633d3c5ee20d8de25a6d |     
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/70060e84ee4f0fd26aa3dd5f99b0451adf09d36a | ORPH
  powerpc    |         mesa3d-24.0.3          | NOK | http://autobuild.buildroot.net/results/fe22511b81f5db6c4233c9afc20d3d79bc32146c |     
  riscv64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/dcec078a8f2cf223fa8aa6bd7f4dfaa206399a8c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
