Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D33C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 04:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 868994034A;
	Sun, 19 May 2024 04:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b7fH5zsdOoi; Sun, 19 May 2024 04:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24819402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24819402DC;
	Sun, 19 May 2024 04:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4B681BF2C9
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 04:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B522581F5C
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 04:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS1vZnVxXJXU for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 04:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1451C81E97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1451C81E97
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1451C81E97
 for <buildroot@buildroot.org>; Sun, 19 May 2024 04:18:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1295A20005
 for <buildroot@buildroot.org>; Sun, 19 May 2024 04:18:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 04:18:15 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716092295; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M/YuXqgMGpOvyNHU9lxTGbCo6IeJmDvEGf7jJNQf4Jo=;
 b=cNIvf7lN9St1mNw2M30dP2IX4J7sBsmF1uWXW/73HfvisiZ81D6/107kVtdvc7j/0zfCtn
 GFTTYEngEbhoZpd0v9MXr22ZnPDvLXZ9qnkuZ+VmezAayY5AKeBEd+Z2r6Pssi2UgEitFn
 Z2ghF80p0SuMZTYhPXe8CDEnXh6QyUIV0ljhvzF4OpEzG/aS+oXG8p4r1yXVrSKS4mkj1m
 xNxX1PiDmk/6rxnZW160oz8+2E/t316WqIU2bRCXxE73SFcnqA8CNI7WekCHfrS5VNseSt
 g5CTpTCg3CRAJWTnzvq2naCSlxXRR8pEv4iS7xCC/A2ksc2SGt3nAHjq7JH4Mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNIvf7lN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-18
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
Message-ID: <20240519041815.yxtublUSYP3Byd1LsI8GMb_TgCJIDqH9s-PRrCjJRGg@z>

Hello,

Autobuild statistics for 2024-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 11  |  1  | 18  |
    master   | 31  | 42  |  1  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 5 
ibm-sw-tpm2-5452af422edeff7... | 5 
                       unknown | 3 
             containerd-1.7.14 | 2 
                  ffmpeg-6.1.1 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
android-tools-4.2.2+git2013... | 1 
             cni-plugins-1.3.0 | 1 
                     crun-1.12 | 1 
                elfutils-0.189 | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                    gpm-1.20.7 | 1 
                host-go-1.22.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
                 libp11-0.4.12 | 1 
                libressl-3.8.4 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
                rocksdb-6.20.3 | 1 
                    rtty-8.1.0 | 1 
                 uclibc-1.0.48 | 1 
                 wolfssl-5.7.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0bd78dd73a2f49a0171e37f1055d35bd6fa39d2a | ORPH
    arm      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cecf78e06441ba8c05029835fbdc933f585a4b90 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/f4d1c29ff96afa662af87a8942122798e2d77d4e |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/02b9aa110eead3bb09812aafbff8b2b1032102e0 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/7830e8c584a73a505abf916dda2713c0962490d3 |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/4d96abfe081ee59a927516aee246514ce033ba36 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/772340d4e1a58793f67271914ace872afdf317b5 | ORPH
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/eb5677be9b91a9f93cd6e97e7e6bdc64bf72ded6 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b36a93656d54de1aa0c75f8e3378be727e60588f |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2523ea17506f2d78405657562827c08dff07a4a9 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/889fdabf7859541a903ca01510cc59c6b837f8d2 |     
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0e6333eaf0d80dbf46c2fbe2387f1e3b2cafcb01 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f59323d01ceefc6e887c711b5256e11ba0a140fc |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b3469731a9d8bc649f0cc3cf32692d37607fa68d |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/37d0192ca75d658f7fe3373b20051594508e4744 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/ecbde5b61a53af8b7dd5297d628894410f0ef252 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d810e4385cb696493135fe22881baaa32e585e63 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/64ac737424c7705c53d7187ccaa3d1ab99890eb4 | ORPH
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3192740863d57e72e90e622683e7b9fcc057fa8b |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/b02e20aa3ba71638bbcd07521dece2c31ba93c6c |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7f92c768d27e75a5d4f1cc08e63e18b1a9f44008 | ORPH
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/38fde21fc71f93d01d9b3aa8e1ad708234fb47e3 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/97861326cd41db53c6177cdc252d1cc705926f00 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/74c22a273803fa899afe84ad26903745aa12181b |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0ba5cbbec82ad4934587674ea5405b82b4d3e7f5 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5ad3d936de4e063410a760ad82a0bfe1780fb2bb |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ad3ae41f1d03269e2c9072715f5bf66002012205 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ac87a7017389fa344942ab1cb031644f11190bc2 |     
 powerpc64   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/0c61dcca104d77ba52ef28c3b23fc5253e5489c4 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/33cef196ca227a1302aa650c6d86ceb5f7417ddf | ORPH
    m68k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/651c3e9a2f4f80e235c779945688158489670675 | ORPH
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/9ceae4f040dcacd38e2738af654c9e1774a6facf | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6e7bf7b7400f5085480f16176103dc2abe39fb3b |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/e9abc7226332565edd8293eb3224bd843301c913 | ORPH
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/7e643c8e98430cc505885dba9fe7d369c56ff02c |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6db042c1a67074cd7a3ccab184af24d0941c28ff |     
  aarch64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/d5743cdfaa0fbbff611e04d90f5f051eed34c3a0 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/8b59f5251bfe88de5446bf6b226f225be604238c |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/3702666a69495db2870cbe1d0008b9f1db426e0d |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ce2aeb55339db1629205961749a2185149993e17 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b388aebd01bf00f0b0f9aa52c307aac4e814d0b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/140351aa50fd16b41205cbc44caa54f28b29cf29 |     
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/97d0a44a4517bb2893a0d37934edbdb4cdd22bc2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 2 
          libcamera-apps-1.2.1 | 2 
               asterisk-20.5.2 | 1 
                     frr-8.5.4 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                libressl-3.8.4 | 1 
           python-numpy-1.25.0 | 1 
                 shadow-4.14.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/4134eafb89cefbe03a36a9ffab5886c6417842b4 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/96816dd936196dc3082f802c2b64064d46d375de | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/560d86bfcd95113847db961d491335934de87421 | ORPH
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/f60b1529457ca7d9b71238b64caedc119ce817ea |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9969d7a4bbe4cacd51c1464821601bf31a0b4653 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/183fc7c7d1f957774c97d9169e52d6ef537cde2d |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/89a7825b7bdfa1186c1c8003fbe6e3f9dba7e353 |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b9325d3621fed485a6e32049f1ff8ea4b9e935c4 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/db8aa79ab65ffcd0df6935561fa8f8035a17461d |     
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/88ee8a8c6ef73e504df44a45c3e5b8e842497ac3 | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/61065ff3b27071ea0f769dacb93a8f58470069be |     
  mips64el   |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/100de96c05ddaa348ec40f151ffae51b0d7ca9d2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
