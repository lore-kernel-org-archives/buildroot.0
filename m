Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E0C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 03:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5162E60639;
	Fri,  3 May 2024 03:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3dgvH7BbOjc; Fri,  3 May 2024 03:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2507F60903
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2507F60903;
	Fri,  3 May 2024 03:58:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7911BF3B5
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 03:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CE2832C7
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 03:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L90FSe72ebvi for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 03:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C4F9832C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4F9832C6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C4F9832C6
 for <buildroot@buildroot.org>; Fri,  3 May 2024 03:58:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F52A20007
 for <buildroot@buildroot.org>; Fri,  3 May 2024 03:58:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 03 May 2024 03:58:20 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714708700; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cMsjqhGopQThcd5NyNnl7LA4alIEZw0d9rNlqBC7cu0=;
 b=Hq6dCJ0Fidwc6gtHdiTJA/TBjdeLl7PbiJY6Rl4cYluNUPym4JRN7BhR8PciEeSUeb0ykf
 mwELw9Z8XetUyIPnANRWABuqBA39KaMh4F+W9iwEz4lp5diU1g1dz5ng/K4loXgU8Y7JE4
 EAyBXVRv5yf9K0wLGa1CjH1yTfRr0gDGXqhvevLuKgZnQoVXWR0Daql5uf9azM0G2gGNtG
 RD8bKb38ubAKWbCfBLfJ+7CuiGs1K44XyjBsQbRaGGK+71G+6rbXZiTAdtsE0mGxvIsvfv
 a+ywX2e9Z+DaN/IHl884eWPF6a6RL0xOlPXIYpq+/BSPi3OeDKTXdAruEVridg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hq6dCJ0F
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-02
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
Message-ID: <20240503035820.Eb3wEErTaFixXWrjhl288U5793xi8bk7I0ITJT7fYQg@z>

Hello,

Autobuild statistics for 2024-05-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  4  |  0  |  9  |
    master   | 22  | 41  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

          host-libglib2-2.76.1 | 12
                libressl-3.8.4 | 3 
                       unknown | 3 
                    bat-0.24.0 | 1 
                    bcc-0.29.1 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                     crun-1.12 | 1 
                 dc3dd-7.2.641 | 1 
                fail2ban-1.0.2 | 1 
                    fcft-3.1.6 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
        host-sentry-cli-2.20.3 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                   libnss-3.99 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                     mdadm-4.3 | 1 
                mongodb-4.2.18 | 1 
                  ntpsec-1.2.3 | 1 
                 openssh-9.7p1 | 1 
         python-remi-2022.7.27 | 1 
             stress-ng-0.17.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/c61914f43c4c35831330b761de1f4c6ccf15dd97 |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/75ddf0de7b35bd17ac03adca427b4e1108cc7f0e |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/67d80aed39c335974972c5440138964ccc1630b9 |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/283a9557ec0c9347cfa56ef00c7bf111cf3c0bac | ORPH
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/e76667717c6b3e5b8ec3c2f71866aff3a72103a1 |     
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/921b24368974d6e40093b950878bcc871b7c4d6e | ORPH
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/740be93840c54e198973546e2b42177ef1fbf136 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/dd40eed68c74431c96fa257f331b54bd184947fd |     
  powerpc    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/8843b80d294c5b92f91f1ff068cf1233bb157abc | ORPH
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ceba04a4449e40d1a97c9786d6a2d020efba95ff |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8f05d5c46f7364254047a32958734f398948b15c | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/e7a3a4977a0ce47afdf8c984b6eb27b62f68bf82 |     
  sparc64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c10229131083ecdf7cf426e0652ad4c302210fcf |     
   sh4eb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/1dd7e9af5d2a18529a7d54fecde14f15e06a415f |     
  aarch64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/e474e6dc3ab01d6ead8724180e4d59942cf9ef6f |     
  sparc64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/58f5c1d319d5dbe4c775594870b72d4e5eeb3cea |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/280c5b6afe4343635da454447d3048e6b50d066f |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/3ab229705a686bfbbc6a83acee6089ee5ca1477e |     
 aarch64_be  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/a79de7d7f5a48a9a06fc38a4e554d1065092b48c |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4d87b049df24d4322ff69c2e00896e94aa0ac4ae |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4fb27d10ef4cb3894e0d9544c3fd06e87db0df30 |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c4e0448bdbff5cd5bb634f415b7151a145e0d0f1 |     
 powerpc64   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/34b50beeb0184a1f1aa4e417676e87d6f1340114 |     
 aarch64_be  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/a12b9c4436594818f4ce128595b429adf7d90e31 |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/fab1bd4ba915f6fb9d399e8b58763a9055c2ebf4 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3494a7fbca136d76ce6eaa0297ae1ed8f7d83d1d |     
    or1k     |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/ad7787e27339b0db164d118ba00303558aa5ffc0 |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/30607d14944325d002394f2e53c0b0e6a83bbdea | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/48d58c4fec87a03a7e8d2bc1f73c75f9ae7ac995 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1f6d3b1852749a7e606373afe870a667683c9c56 | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/dacee0a4634088626a7c978d0fef4b0ecfbe5784 | ORPH
   mipsel    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/28aced8b4598e7350eb5663aebeb782c79f0f292 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b0bd5e24739b17506cc7fe66fb4d1926115fdef8 |     
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/dd096ae316bf1310c40b0e30abaf6069c3abc446 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/cd485488982c1e4c43ae6e1c8f6526867e81fea8 | ORPH
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/01e6c6467878465e3d0f2f1de176093de6815434 |     
    or1k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/8b4ab64405568c78488efb098cf5700cbf16a84f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/781a409e64cbcdc34a75745e5be9f1d44c5c41ca |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/33c8e00106bbee07dc7a5bfaab8b141104584280 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/77701b2a334bed0d675d692d588f41efd9ab0f0c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  cairo-1.17.4 | 1 
               libdeflate-1.19 | 1 
                  linux-6.6.22 | 1 
         python-pymupdf-1.22.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/afddbadc96484d54b298322cdfada7ca8e421475 |     
   armeb     |        libdeflate-1.19         | NOK | http://autobuild.buildroot.net/results/7318a4450eae6a0a4a413390d92a04cb65c75ebb |     
   mips64    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/d48105bbeb533cfa3588ad2215936b9cfb8e6ddd | ORPH
  mips64el   |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.net/results/d5e7659fe262a795e24758eda4d1534a25b8cb27 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
