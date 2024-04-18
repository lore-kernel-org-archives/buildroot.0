Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCB8C05024
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 03:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13924042E;
	Thu, 18 Apr 2024 03:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxFXscynTZ7t; Thu, 18 Apr 2024 03:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2152C40503
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2152C40503;
	Thu, 18 Apr 2024 03:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A747F1BF4E7
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 03:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93CF840503
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 03:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SQKTehA4hjR for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 03:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86CF34042E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CF34042E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86CF34042E
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 03:58:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB8B1C0009
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 03:58:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 03:58:27 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713412708; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LezYjHrLknfSB2OIvUCNxZq4Ucq+Kowoc5uZ+7yzcFk=;
 b=ArFpgsNXOjmlKGFnhnmBZs4nnxJnXFzqo9VQyisDQ5fPkHV3TsbbKY+wAujqAFMlQGmrr5
 AJHGnfd9KcWpugvdb9yF5sBXZDRBWVBm8Rbc2YqFd5EAK8XpddLMfvvhJWcSqLCBThZfFw
 Sftlra72wjpdAQ2c4C3ggNQt2xdoXeIctCrTpudjJ/TxGyjnxfe9rzyXi/t6X/ZexEdDqz
 BoYKVIpbdQfOM5bEa6NyPrj021nEDCGdevYW68URLQv7+i0wFz0X1lM+D1Nc/aR6d0c8WD
 OL2ZWtlO+qOJhkn3G9e22WFoNw7Xl+CJNe816NSZNI9Gffp6zTDMMi5WrU+qHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ArFpgsNX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-17
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
Message-ID: <20240418035827.h6sNtKzgCla924BrZ4H0VhyabXa_DDtkA0RC2RIAVYw@z>

Hello,

Autobuild statistics for 2024-04-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  |  9  |  0  | 20  |
    master   | 65  | 74  |  0  | 139 |

Classification of failures by reason for master
-----------------------------------------------

           dmraid-1.0.0.rc16-3 | 3 
                fail2ban-1.0.2 | 3 
  gobject-introspection-1.76.1 | 3 
   host-flutter-sdk-bin-3.19.5 | 3 
host-heimdal-f4faaeaba371ff... | 3 
                 openssh-9.7p1 | 3 
               apcupsd-3.14.14 | 2 
                 coreutils-9.3 | 2 
          cryptodev-linux-1.13 | 2 
                elfutils-0.189 | 2 
          libcamera-apps-1.2.1 | 2 
                  libffi-3.4.6 | 2 
                libressl-3.8.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                     mdadm-4.3 | 2 
                       unknown | 2 
                    bcc-0.29.1 | 1 
                 c-icap-0.5.10 | 1 
             containerd-1.7.14 | 1 
                cryptopp-8.9.0 | 1 
                 dhcpcd-10.0.5 | 1 
                  ffmpeg-4.4.4 | 1 
                flannel-0.24.2 | 1 
           flatbuffers-23.5.26 | 1 
          gitlab-runner-15.5.0 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
                  gnupg2-2.4.5 | 1 
            host-binutils-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.28 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                   linux-6.8.1 | 1 
            linux-fusion-9.0.3 | 1 
                    ncmpc-0.49 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    pppd-2.5.0 | 1 
                privoxy-3.0.34 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
            python-scapy-2.5.0 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
         spirv-tools-1.3.261.1 | 1 
             strongswan-5.9.13 | 1 
                   uhd-4.3.0.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a4a59d9cde52a999013db00d82b3bba1570a5751 |     
   nios2     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6b4bc681385aaa6b2c7bd6621fc2ff109b847896 |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/8d33aa3f2f1e8e50267f8c8ad758b14698a913fc |     
 powerpc64   |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/d877da51952fa092293feb11877e3733a74919dd | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/68219aafc4c4d105dafd7ee2ba7cc0d92c31aef9 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b4951966422ab99a382fba017027ce8550a58ea1 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/32d0b2cb9b1e81c7c9b35d6e94f4cbe73de68408 | ORPH
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/ad3c04792fa83270b2722d63ca6a8a10056a53d7 | ORPH
  sparc64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/bfdb4532b3fe41f45a77dd4fe9f1c64eed438dbd | ORPH
   armeb     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.net/results/699fc9a8373a26f00ca660833de63686062c2b61 |     
  riscv32    |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/2c493f793d80b886765e87f828f02e09f52cbcd1 |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/6742454ad6406a133fc3c9be9d0df64f24d160d0 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/24538872f9bd2be7de884383be85ea7088f880ee | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/c6cc64a8a8b2af8e2266788a2c5a28dfaae754f6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/51171da9d8cc5c8f61d1f1dd203fcb10314d153d | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7efae649bef2defe74bb70b87360cf0c3092369d | ORPH
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ecfd87593932b2940b542b857fdf3c6c9c0464b4 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e55013f8599989bacd1454eead4eaf56c0f9ba4c |     
  riscv64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0f092d421e847e920270f8cf46bba2993d5bf628 |     
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/c45acb3e905458809505e7a5968c9783172b961d |     
  riscv64    |         flannel-0.24.2         | NOK | http://autobuild.buildroot.net/results/9aea99174cdd97ab894077b4a772f59daa7a3e33 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/68958d447090a0889b441ce1ff671cc6c4a28600 |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/9b7a5f130c0818cf000b63a09ba65467ab17a475 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/cbea5676876621b384d22fd06b7d0aec5ef35207 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/33b870b17600b084c0d66826bd76907b9ea77ee6 |     
   mips64    |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/c11a3c45e622de8f631ce3dd98b425db6998d578 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/85346fd0d83d0d1096fec3949dfffa64b1817929 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/91aac10a0f361cb24ab7d54aa1730766bb4c2920 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/23164a563c84e7bffc50b33acb19b9686ee881ad | ORPH
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/c9fe4854f3787bab6d50307b177e364ce8fda129 |     
   x86_64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/e58caf36ebcdb10a7a2d02cf73986dcbab79c0bd |     
   x86_64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/7ef7e907f88dce5b3ad2195eda19495a0181bfe3 |     
  mips64el   |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/b31aa73935d9ded7fe22026b751f58688d319e7c |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fa0f230a3b37df42ae867e37ebc8f56534e80ba9 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c57bb9e626a965390f62bd17c142fbdcff36ac30 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7b04aec9dbd112b274df6fc68e06f6946c3acb73 | ORPH
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/c05858d31756e91ee3272f7c6360cc3bcb1ae1c3 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4a84f5b15ca9478a6fdd50d5a1a86429c26ff6dd |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c144eb1ea1eb5541793c3a8e9cfc82f020728bdf |     
   x86_64    |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/5212acad27cc92b5428b01dbc1df8ee26a17cc82 |     
   arceb     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ac8f953b5519c116dba23df0828e54774246d796 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/53fb1a03739865497a20f52c65b93d2e9e5a2192 |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/523c5022cd3844f00fbf08d46a021ff05d2d6ce6 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/bc7029ae6f005a77dfe7c19b04f5f74c8214fe2d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d8ab9633c3b1b5076f2fb3812bd2468c96359614 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/fa815223b54bf295109fa7f324fe2d521dd15b66 |     
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a8b8d5bf6db15c93575308d031ec84eeb6a5c68e | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0f6cc0a5da5a1cf111360d39f032888c4b1072fd | ORPH
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/aaa2a3625888e67fc705b384cbfdb0b83f7b18ce | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/85b33246e81355558304ea33fcf2a6241df9f026 | ORPH
    mips     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/3ecb1b53a13f91edd1f0696e69119dc136cfb9ea | ORPH
    arm      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/5ea810f63ca9c7f0daab775fffbe152b7d830eaf | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/44230be78dbf41c557480c7dafaf5b53b30114dc | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/3587a374e72d2b1c658ae66de21beb91ef3caf80 | ORPH
   arceb     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/6ba3a423a7ce41876af94acc2d202f2830da5c78 | ORPH
    arm      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/424bffad5d949aa585839fab387ddbc631e72c94 | ORPH
    arm      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/a0ad18cbd8ffd70a3b29300c68f5aba3649a8190 |     
   x86_64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8566d025238dd6d58b6330041bc0b74e88d8bc50 | ORPH
   nios2     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/a85a0dcdc1a72f1b355f2424a7f9dc524a5b7a29 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f69fd4597355b236e43e7e5069175426757a86f5 | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/d4769499e71d270e8ae40dd1eeceda83c30bc531 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/3e216c81b5d944c1faceeb5abc55d64a37e98fc7 |     
    arm      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/4f3484db3b18ca847ddbfe373b6a865a57eddfdd |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b0da936f48758fc248f4cc536cc961e36c3c3580 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/fcdccc6eac2e6a2e308df98f2bc7ec65cdbc6413 |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e323d2676aa9290239d28ed1c660e6fb45a622f3 |     
   s390x     |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/e977c53da6fa7b32556f16af475ea290467dd477 |     
   x86_64    | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/c2524c7580d97f7387ec22da62be71d77f2ed8ec |     
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/52861aa193212ede74429a39afa5e08e8aba443f | ORPH
   s390x     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/aedfc7a25203f8897854ef2abbbe8a82af689cf1 |     
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/2cba1535b42e36a62b611af01088622912b277e7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/cac08adcf1a38e17b77d286921afc66ada373f54 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/e2601813c75f0368373b7c6c0037b1db9e8413eb |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e5833bfb0141ed175c595d700e0b41d69b8da978 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           crucible-legal-info | 1 
                 dhcpcd-10.0.5 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
ivi-homescreen-5ab78a19e95c... | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.2 | 1 
               linux-pam-1.6.0 | 1 
                mongodb-4.2.18 | 1 
               xwayland-23.2.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/01b70eaf42cf57ce97912546fe55c8cf9e8acf74 |     
   nios2     |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/d302764709bdca6655982fa7b62d9c64ab311bf9 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/8b2d9dcf2633b339b3890efaeae32d4e2d5ce8e2 |     
  aarch64    | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/c3f6c5438349e346c154dbdd4b52355bb78d3f68 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/952379017bdee58f84a27eeadb5b782bd72cd9d3 |     
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2ddcc6989649e3013f9a8d2c051a1e69ae3bd1e9 | ORPH
   sparc     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/f424404dbc3b48e25fa2cde88b7e9fb4a6fef529 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/a7fc6149a74afeeee0f2b8202469328431884641 |     
   x86_64    |        xwayland-23.2.4         | NOK | http://autobuild.buildroot.net/results/0d9107d20326e143f8a8a0795014283db3aed714 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
