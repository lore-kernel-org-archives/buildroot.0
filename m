Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC57C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 04:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC1BF40127;
	Tue,  7 May 2024 04:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcCj5RNqCLcs; Tue,  7 May 2024 04:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291E740185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 291E740185;
	Tue,  7 May 2024 04:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26DB51BF86B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 04:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF2882A28
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 04:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjOsbyuBfCDX for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 04:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C795F82974
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C795F82974
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C795F82974
 for <buildroot@buildroot.org>; Tue,  7 May 2024 04:01:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2142B4000B
 for <buildroot@buildroot.org>; Tue,  7 May 2024 04:01:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 07 May 2024 04:01:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715054514; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tQvza+dhnVd8x2HhhHd2oic8BpBGKvFqJrZp43wc+YY=;
 b=cCOrwEDoYFJFLioQlwY4piW5ugD2oasB0u9TYF5/WkFssPSu7cGouWSQ8tcTXI1hjtdf98
 Jdm40pQjWqXI/V7eki2dZe36uHwwY8NbrGsxu710xae3hmIOwERZfGdmSxf65SFDRGkzPm
 i6LbaixRSbBNjxbxOzYhHSitaBNwzxFCiw2s6/6FKcN/FPnAMDC7rQ0Vvao0WtblJCrm4h
 NFg2EI4eJYUDNQ1XEFQwPVLG8N+E9PyKlaSSgT78mJrUSudoFo8oPiZ6IBX/+coKLOiVpa
 Rq3ffFhSejE/hJhavCdYduyNlf6Rilvcdr3NosdcrEdZxP+9aGPJ71QA/BlnBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cCOrwEDo
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-06
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
Message-ID: <20240507040154.6XxdC-sr0RTzDOBmPfs1FSObr2f3Iu_36gTiGjTQJa0@z>

Hello,

Autobuild statistics for 2024-05-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  8  |  0  | 12  |
    master   | 86  | 89  |  0  | 175 |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 8 
                       unknown | 7 
host-heimdal-f4faaeaba371ff... | 6 
                fail2ban-1.0.2 | 5 
  gobject-introspection-1.76.1 | 5 
         host-libxcrypt-4.4.36 | 5 
                   linux-6.8.6 | 4 
        host-sentry-cli-2.20.3 | 3 
                 openssh-9.7p1 | 3 
                elfutils-0.189 | 2 
            host-binutils-2.42 | 2 
                libressl-3.8.4 | 2 
                     mdadm-4.3 | 2 
         python-remi-2022.7.27 | 2 
             cni-plugins-1.3.0 | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    eza-0.18.8 | 1 
                    fcft-3.1.6 | 1 
                     file-5.45 | 1 
                     frr-8.5.4 | 1 
fs/axfs/axfs.mk:33: /home/a... | 1 
fs/erofs/erofs.mk:47: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:50: /home... | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                host-go-1.22.2 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
              libarchive-3.7.3 | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
              libopenssl-3.3.0 | 1 
                 libp11-0.4.12 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 openal-1.22.0 | 1 
                openocd-0.12.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                oprofile-1.4.0 | 1 
                    proj-9.3.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.17.07 | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/df01c1f03b8a900edf835c50a310aae4579d436b |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/c4a7f74679502856072070d4bb661083da339794 |     
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/ed914ec0f5783ced0d5c180a29dfb63ad6b54dff | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/87d14187a7c6f4a3ccf4d66cfced85561185a507 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/47f8fe910a88b7517ee335076a5e2431f5c00e98 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab5639ea1f7fc9dcfcba00c64cb90903e8be4d86 | ORPH
    i586     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/c28b729e71641a0844e6a57d3bb43834951fb0c9 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/627f3c1a39e74bfd0da2bcd88201b6f0dcbe8a70 |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c4be4761350d52397d02db54a9fceb540aa15908 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1b0ae28a4d3e634e098b2b64f02b0fcd5b2f59bd |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4d7c000e8df7dc14ae1b7a2cb43d9393888670f8 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5e6949a36457b76c6a7467056ff1e559dd761560 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/6220a4ae399659d1523a2c73da752665223bd94a |     
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/804abc4a839e6f8d3f1cb62aff11dd76afeb7622 | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/f37fe352dc2dacd13a9a6c81e25b4f0f9b3b500b |     
   nios2     | fs/axfs/axfs.mk:33: /home/a... | NOK | http://autobuild.buildroot.net/results/8f456915676eeecc0d2e73633f6356d6e13de2fa |     
powerpc64le  | fs/erofs/erofs.mk:47: /home... | NOK | http://autobuild.buildroot.net/results/a017263e64a6f833d2282b6ac3d2b1d829656151 |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/8d8779095e10422a641c8b03f170de2308f58ccb |     
    mips     | fs/ubifs/ubifs.mk:50: /home... | NOK | http://autobuild.buildroot.net/results/0594ee48d2c853b2467d79e5f4bb0c994521e0a1 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f687939771e3295d786cd8b6b68106dd196c2cd8 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2e71228e96141b2378167c9b543c4b9a26b6c950 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cd1004826c3f9f011a0fac39c100586fc778a868 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3d6aa50cf27868440185b572e1580abd3b88c398 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/720c9d20f45887fe8d69d01537422cdf2a33570a | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/effa61b8d0c44106a7bcc0f7883377d10963d039 | ORPH
    arc      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/4a67d281652e3ff40522acc98d551fc106d65167 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/b732267d508abe8d1ebf2c7889383f10de1822fe |     
  mips64el   |         host-go-1.22.2         | NOK | http://autobuild.buildroot.net/results/ba32795558bb5185262bc374d8407187aaf8ed83 |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8e184141bd3c04bc79c01d4656de606e4b0a23a0 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/40f045690ebf136431250613e0119def705027b9 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3daf44e8d636f822d2f19e456f1b49fca92d94bd | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4e6a65a18f4742d165c10993cb4d54f9e8d8eb61 | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/09870284eca8ed8ae643e4eb7aa7f2e4dc6eddc6 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b172020293ee72811f1785a5c8a22d781eaba4bd | ORPH
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/bce7c0a48ee30d0957a4552a29ef5cc8c3d37235 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2d8b669a92948fed1418f2859e509c4b89a47579 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ba63c3f55480e138f7f793fcd1fe2af8d823908b |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7f39b9313a3b3a651778b705274a44dc8958d26e |     
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/82e58ef4872aca7c064fb70216d143f038207194 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/3d54586e990aa621f3b9a9369e30eb493f51068e |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/5ea8b53ddabd98c8011d617fd1f52a69f994d525 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/142455238da7c78d98b9d52331c8183251b49090 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5505680389ffe17c12dfb22f3c7a09c242f72a20 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/94c631877f2841f65a036fab507b1386eb48f72e |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e72b89a051c8cae605fb7bf2fb4d9e2802f26f50 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c997dbef24b8448b6728e456c8c7c999fef1667a |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/82e29b1ef347c95e01da56e0c446788815180914 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e03cc8906015317b59e2ed728396aac4dc0ee94f |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/755ba06e56193b3444f63749af04914f21b5c60d |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/eaf3b8c686b0023e47b7b48c587bfcc39d81e66e |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b84667860ca4154564f52bc6a6c847cb747d35c6 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/47e105b9cc4cbe5204f37b5829694e74e1dab9f2 |     
   armeb     |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/cba970b10d80e7c1c01c924c996fce15b81d4d71 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ec1221ad1103f35769a06fecfa63160fd14da075 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/013aacb9f060cd17c004bdf4527f55b14bcbac67 |     
    arm      |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/c6bb8fc1fdc2ef674b97e8d2676a84de65f1e8af | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/2292465f02be206a3876585a40e56e52dde66684 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f0c3ca9b05f85147b417eb3c42ac0f2aa3563c8c | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/56947afd9170fa6ed07e0de3845de75b7f34d2fc | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1639e6c60c1e59896a0bbf00aec2f0c52ce763bf | ORPH
   mips64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/7bc825ec28ff3ea69fbc3e89a2e533700dd1cfef | ORPH
   mips64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/be4e88672635f13f931a8f46e05400bd377e15da | ORPH
  aarch64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/805892aad41431b18162c878cb8ac7f67e9c23a3 | ORPH
   nios2     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/55cdc8f28b01a0e1baba99fd59fd4106a0bd43e2 | ORPH
   x86_64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/c77ee2615e9d473e93d95c778648c7e897b7f234 | ORPH
    arc      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/942549afb8e9d1a508ec28693a89e0c1b38c1a7c | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/e96cc4e253d3cb2dfe22230a91680958b7c94e5e | ORPH
    or1k     |         openocd-0.12.0         | NOK | http://autobuild.buildroot.net/results/7195e8b76350f26ab3b963702d88b254512e6928 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ed341b0715f15341ef175fffa0bfb7520a8861ab | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/1ae665acbc30a161914da81032563ce37333bb11 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f4b74d023953ea35a43dea0ac7dff024010ce849 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/a2272452eab8a378b0a3a613de336acf233e2939 |     
  mips64el   |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/a9f3e09e6543b3773440c011e93bd41e357691e4 |     
    mips     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/df4ba7b931a3e4f0717133e88fb60080862b963c |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/da4512c0a8aa5869e1da011579b9ec6a1c4f8425 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/593ada0385b939b2208a253c77ac7c20c374e33e |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/c7ca68c1859c4dfbd8d0356b7e85d24a519cd02a |     
   mips64    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/65f5708823d31920a3b16cee6f7956c3c69dac79 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/d13d20146bf059977d55fad134e79d36bc845339 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e77787c7cab442774ef85cf2ba05b4f97458e88a |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f4438327914e71589de9f7ba75c91ceecab56c0b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/53bdcb9b3cab1b2fd6571053eab1bf6a413f6156 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8ee65226e1382c04c3d90d7c460af5c53add97fb |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/96c06b5a5bc436003ed7a9a1e32685787745ab64 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a697a57eb7f38856c4b342fa2540529d882bf373 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ed87605bd407daf77fe59cb0a550cf5a42f46088 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/c804711462dcf600de7c09e0e70142ac8e6780fd | ORPH
powerpc64le  |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/45f0e298593f0488d82e140ce2d92a7c4dfeb670 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d5700ea3562c9a0c23de1297ab92fa83d681fd2e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libressl-3.8.4 | 2 
               apcupsd-3.14.14 | 1 
           dmraid-1.0.0.rc16-3 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/48749ce9b2193feeb40908132fd5750bbbe3e0bd |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/7762a189548944fb418ec123268fca477a3cf175 | ORPH
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/be8df3bdbb21abd13d576e15f48a098ca6570118 |     
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/642a797f11f56f441f663613723f34c36a5ab267 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7dfd2964237e37f3715c36ec863c6ea3e10ec7a3 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/29464b81bdc4b40149f80559b0c964ca4c729942 |     
  mips64el   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/4dc7fc5fcc31ff6472a40776f5e092824b910966 | ORPH
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/ed8a5416fc62e58c005454f92f1136a610bc2261 |     


Gitlab CI results for 2024-05-06
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811249  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783812563  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783812567  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811637  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783810998  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811699  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811842  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811860  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811913  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811967  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
