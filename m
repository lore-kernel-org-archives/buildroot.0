Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49908C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 06:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEC782190;
	Sun, 24 Mar 2024 06:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjt7RFp28ibz; Sun, 24 Mar 2024 06:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8B782193
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8B782193;
	Sun, 24 Mar 2024 06:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A515F1BF5A6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 06:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C9C340835
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 06:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcKJFU2mRp1P for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 06:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54890407DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54890407DF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54890407DF
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 06:42:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B3554000A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 06:42:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 06:42:43 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1711262563; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1nc8r1Y9sfzadvFF84AIYghYjmb0j8zlI4u3y0r9U+0=;
 b=fVnjV+XCJuIknZlO2YGfJkMUeb3iOcEVFbovi23kLalSCfyVztOYK5VYFtZbE9fKFNnh3s
 3rDIj53dncL4S9RbyZT9SXKfMSChoCszI6E0z11y1jhHE1mSXMqP2pI2e80mGExjW0CnNV
 8gkFZ5pi6cyzy55xOJiFTVXDUSYTqhEpqc2O2jve5flWNpVPswxV0O1oyQjN1n9dqkEV1b
 cm7RIOwyK0UTd6Uzuch8v9LFufoS/vHiwtdYoNkzHHCTO52oSh9qvguqpCczUzRLxCrtCC
 ghDTvqUpCRYiM5Qhj7b5MWhJNb943uSP0e3ucFIvnyQBB7/Y9JCYuMFwN/vbWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fVnjV+XC
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-23
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
Message-ID: <20240324064243.HDMwfcfVm6I2mnKGhlA8rIRFZ_NA7zfnylitgMyTHMw@z>

Hello,

Autobuild statistics for 2024-03-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  7  |  0  | 14  |
  2023.11.x  |  1  |  6  |  0  |  7  |
  2024.02.x  |  3  |  7  |  1  | 11  |
    master   | 47  | 43  |  2  | 92  |

Classification of failures by reason for master
-----------------------------------------------

   host-flutter-sdk-bin-3.16.8 | 4 
                 coreutils-9.3 | 2 
           crucible-legal-info | 2 
            gdk-pixbuf-2.42.10 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              libopenssl-3.2.1 | 2 
                    ncmpc-0.49 | 2 
             berkeleydb-5.3.28 | 1 
                   botan-3.2.0 | 1 
                 dhcpcd-10.0.5 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                        ffmpeg | 1 
                   foot-1.16.2 | 1 
 glslsandbox-player-2023.04.05 | 1 
                gnu-efi-3.0.17 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                  jack2-1.9.22 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.2.1 | 1 
                   libnss-3.99 | 1 
                libressl-3.8.2 | 1 
               mariadb-10.11.6 | 1 
                  octave-8.4.0 | 1 
                    pppd-2.5.0 | 1 
           python-numpy-1.25.0 | 1 
            python-sip-4.19.25 | 1 
                    rtty-8.1.0 | 1 
                     shim-15.8 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.15.07 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                    volk-3.0.0 | 1 
                    xen-4.14.6 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/74ead2bcf1126ce3ce17e7d62614b759486800a2 | ORPH
   sparc     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/0413bd80490cabd1c3ea539b853ea47944d9faf9 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f913e05d6dd79190291c4da80cda86b1fdef42bb | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/06308110f792c608369fb70ae45f2055dd8c34df | ORPH
  aarch64    |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/fb64da8254c6b8b073034bb02ad2daacc01327b6 |     
    arm      |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/546a84f9e1fd710cd5f331645d35143523909ccc |     
  mips64el   |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/169822e748bb876d2eff405447e5348e2017e5a2 |     
  riscv64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e7231929d6d69f3b286301b17264ffb65250003a | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/851985e85d5097306e8a252e093e9a4e6ecded05 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/1edb5fd3ce84c18cd7b88c3b4ee59719daf9d416 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/8718ede951d49f941d83c6f096eb39c7631a3cb9 | ORPH
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e939e43af5a52f88e58554efe0822c1cf188ec24 | ORPH
  aarch64    | glslsandbox-player-2023.04.05  | NOK | http://autobuild.buildroot.net/results/da362296a253cc402910e6f434fe61f9bf31212f |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/39b922f9b878d6744cf35530b7cb1baad8ca552a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4d4b53efd85eba3100fd194e8c38706f95370d8d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1437b6ce0d6fdbc293dd2eb88c713b100d0579ca | ORPH
    i686     |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/31f985b1bab4a1592b109a2bb788af4ad67b205d |     
  sparc64    |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/3d5fe08611efe10c8de1afc92c973b7686031577 |     
  aarch64    |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/5327fe8eb2446af03f22a5a0106e3e1bb0621ed4 |     
  riscv64    |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/36c4ab5d5969b61aeb3f3bb9f066580894576ade |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a5fbe36be954536ae22e58136319d5647070345d | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f4cae1e4dcca0ec3da29a288b2002ed00fe79a93 | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/bb6ef6eae95e08ea74f4e684f09ec6d2d3cfb2bf |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/bfb850868372bbc075c03db07ad60b8e422af6e5 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/fcc84cc07694ec00865b0d5d6a911a859926125c |     
   armeb     |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/606a25558b78e8e09f6aea1fca0d8fb3277f2333 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/aa62d99396ed5a585c53a0c712d84c6418c5dd92 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/a398af7491a5b2c935cfd829ff66e25a9bf12e7e | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1ae38eea596175f04d7fb8b6fd980e668d8274d2 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/80f78ed17158d8a86380aaf2676992984100e73c | ORPH
 microblaze  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/50f764c6af91c305f3d4db9266b45c7ed587ac4a |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/b06632d4f110bc1c69faeaf88c4b3ba949acd5d1 |     
powerpc64le  |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/0165e10803a85eb26b9dfe5fbfc5b07c9a6646b5 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/53253c5b6fecaa1997f179ca6a8ee3b2dfb9c814 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/6f9771aff88b3ac47ecdc00b824984204b43c712 |     
   s390x     |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/de60f903e6caaf3538c4e263bdc49abd8a8cbf64 |     
   mipsel    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/8f0bfce51ea73c78f7b5f5aaa06adf1ab71fe6c6 |     
   x86_64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/c81ee99404658e2b7949635a6e434f6c6678ab11 |     
   xtensa    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/9dddb64e0c66bf795a22ea4418fbe2eee5181e47 |     
   mips64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/d7238b1e74749f45ef7022533eb681a0c974f362 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/651220936e6f35edb5e9d6f57a1f0e4274351c85 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/d6ac10b63bee0293f2f97236d4aa3fc4359b7849 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/e44876efd1095e30d45bc024e2611d14b3f3223c |     
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/2f72688dc5f643d61dafe9264c0e73bca1d4281f |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1e0acd8b352a845edb0c2f75e22a92a7412a6da6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 raptor-2.0.15 | 2 
            freeswitch-1.10.11 | 1 
               gupnp-av-0.14.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/119cf3c8c350e0e0f98265cd2c43042be4cc43e9 |     
   x86_64    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/a3569634cb4dc0ca70064729d6cd0b208e47ceed |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/ce6e66fe174bc957fe73eb31b6edba2a9d92dc07 | ORPH
   sparc     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/6ca4958d7def8d5e719e9552b94b800d3cfce9d2 | ORPH
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3afc80e70e1b7f23e4ffac8716a5db8cd6843abf |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ae51c39c7847f460ff807ea132086551b72aa906 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0090dfa93bea0fa061573ea0b766c279629340ae |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                     file-5.45 | 1 
              host-rust-1.71.1 | 1 
          linux-5.10.162-cip24 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/587177a8c1fc0221ca21ff11d9ace335419ea29e |     
    i586     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/785487a74b9ddb035828811577e9ed4ca2b75529 | ORPH
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/812904b25cf9ae8e0f97f4d2526a88f487afe9b1 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6229f737dff6559e95fba8cbaabd542a7481f6f1 | ORPH
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc07ec007ea068f2a9c97d5231d643e9912d2c14 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/df53142f6f489292e66555885df764cce1023b00 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               asterisk-20.5.2 | 1 
                   cvs-1.12.13 | 1 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
                mongodb-4.2.18 | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/c21eba7a682fd13556339b6a804e65ceb1f70123 |     
  riscv32    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/55c2fa772961b01075908a8dca23845258d94040 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/877dfc64e9b15bce776a662b7823f7d4d84d1e83 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4b02da6c2225196c707a4427ef9a19037ade139d |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/96b73d466dc8836acd731f8a8d3fed0c3597567d |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/11c1ad0f70903463f55de44b170e511660aa4a97 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/588a272e221573960e5649e3a7e9f4e643398d2e | ORPH
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/efc7a5cb4d4901b52607f990e2c59027a1986845 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
