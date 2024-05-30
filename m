Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE51C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 04:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC5C83A5D;
	Thu, 30 May 2024 04:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leGIUOjDJ8tT; Thu, 30 May 2024 04:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B4683466
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B4683466;
	Thu, 30 May 2024 04:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88E5E1BF2BE
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 04:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75E2E40342
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 04:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvypH4AGzfxX for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 04:11:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47C48404ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C48404ED
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C48404ED
 for <buildroot@buildroot.org>; Thu, 30 May 2024 04:11:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E7C824000A
 for <buildroot@buildroot.org>; Thu, 30 May 2024 04:11:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 04:11:43 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717042303; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JPCK/beO89GVIUKQqvqmvSK9ziUVTFIJYMzC02FhVGM=;
 b=fpoUhru0aqKfjYuc3m0wtE+Inyhhtfjxjpro81S41wQPxxz/JPsu7ZkRIv3QMZ94fxz+Gl
 gqu1s5OFOfCb1IH39ons+4sqqigYwYGmqZdEcd1Hob65PZwVvCraNdSCBUkzdofm+HjbBC
 KzrLhLD+LMS5wQKOw/SRLm4MjtQLHwkuyAjZcJHRUS+iBpjOHZfUWzwnnd3IGnPasr1xl0
 YyJ621Sww/Y78LoPf+oaTjeu3iAaBNDuujmY7sMlk5EOkm+K2ajkLAkFDo36QXNk5rXIwX
 pUu9OViB8xIDzGWmgbOj+hzxKNk0CafcmjERQ31p5guoq1K1PyNX2klahFXsMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fpoUhru0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-29
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
Message-ID: <20240530041143.wAGVDpDuTLgIo_40uuhY-jPRJuBQBvEu1k6Td-NG668@z>

Hello,

Autobuild statistics for 2024-05-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  7  |  0  | 17  |
    master   | 23  | 67  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 5 
                fail2ban-1.0.2 | 4 
          libcamera-apps-1.2.1 | 4 
              libopenssl-3.3.0 | 4 
                libressl-3.8.4 | 4 
                elfutils-0.189 | 3 
                 openssh-9.7p1 | 3 
kvmtool-4d2c017f41533b0e51e... | 2 
               libglib2-2.76.1 | 2 
android-tools-4.2.2+git2013... | 1 
                    attr-2.5.2 | 1 
                    bat-0.24.0 | 1 
                     bc-1.07.1 | 1 
                    bcc-0.29.1 | 1 
                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
         docker-compose-2.27.0 | 1 
                    fcft-3.1.6 | 1 
              fluent-bit-3.0.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
 glslsandbox-player-2023.04.05 | 1 
                 gnuplot-6.0.0 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
      gst1-plugins-base-1.22.9 | 1 
                 highway-1.1.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.4 | 1 
                libdrm-2.4.120 | 1 
                  libffi-3.4.6 | 1 
               libunwind-1.8.1 | 1 
           libzenoh-c-0.11.0.2 | 1 
                   linux-6.8.9 | 1 
               mariadb-10.11.6 | 1 
                 mesa3d-24.0.7 | 1 
               poppler-22.12.0 | 1 
            python-scapy-2.5.0 | 1 
                    rtty-8.1.0 | 1 
               syslog-ng-4.7.1 | 1 
                       unknown | 1 
                ustreamer-6.11 | 1 
                    volk-3.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4774267966061f333c1ac894b614583894380e44 |     
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/8adc64225b00cae1a9f7d824bbd7ea8637ca149f |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/c3282de56b53f082146f2c73092b8b6be7438f86 |     
 microblaze  |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/e0e75d628f30e181ef2f3186248379e4f8157acf | ORPH
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/699a4bc92eccda7c405da0e783bc129cdd726e32 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7e9cc4aedbe7d9de7cac228019293c636e5abed5 |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0705fa40637bb2c7c2703ed119abf9f36d446b55 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/79eeb1988e9e145522418eea52e33d97bc4fe5d5 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/47983d62bd9f1c11695596886e68619639bbdb66 | ORPH
   s390x     |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/60030626a977eab7d3a9b5c0628170f7dc027e68 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ea48a8e920a86de7204180873d95e6b45c333ad1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1a56b2de1c7eeeb4e2ab0d5e888a46036f9d8264 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b4f75e036752b12f9ffc2edf82e3926decff2ef8 | ORPH
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c035611d794e95c0d8f8f7ea291ad202f9ada292 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/dcef704af68e70050f2713c0c0c82993627ed878 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6a51c8520885aa6e524d8261bf810bdc152eb4eb |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9b8b67f2e441645966730a00e07c12e31ed7331c |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/afad7d00d3c9e78fad79da7646ac1b33afdc1d63 |     
microblazeel |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/88a584a5c5ef725c8299044b0f3d1730fe4f7f67 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/161056327569ef108aa6262b77b0f1d4e663ce37 | ORPH
  aarch64    | glslsandbox-player-2023.04.05  | NOK | http://autobuild.buildroot.net/results/cbe1db8fbecfd8668a874356dc83b99da5deb85c |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/dee13c35cca8d84e33dea05c31589b132e55c289 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0bd76737bddfc2b19d77630d248ad45d7238da74 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/476df38c7afe4c8c0cffca8d3170213ad9405d92 |     
   sparc     |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.net/results/30e0d78aadcd83e4a858f97a43fe9417c84ef95a | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/aa2d8a897e53ae8b33a9b0a771e47dee42add9f3 |     
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/60680c0a0979d15c356df2a094b0f513fa0c43bd | ORPH
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/837e8449fdf935ddf8aa60f5c3a69358e1fe2791 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/357858171c9452ebf16bbdec44b08ac10e810b71 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bd7349c1cd72f39d1f99330336fdd5471fed5f52 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d1a917641707c182118c3816c44f1c3c801ac36d |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f8b0ff0d1e3652fbba32d9b214a241a7b4fb2572 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ae4f3cee7ea368eb95b65d424ba3cb1205f5acb |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/5748bad438c0e25fe72013899757060703dbad48 | ORPH
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/65f8efa4594c0dfb6e578848244d77eb0f9b53b7 | ORPH
   x86_64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/aa8f95dfb42464004ba24be1aaa161b5f066fb07 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5b604a26e6fc7f5f50d9d3e771b5a23f5de50748 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/79f6f3c99f70e75a83c9c6630f96361f5d7875bd |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4a633a88541746c204d324c15dc34a76e0e721f0 |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/329c7501f53560f0af8c949a05ffc36e2fa3e5e9 |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/8ff4e16bb79294c5e289989855b5875851342909 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7f87050bf90a050c19c3cd447d430c2078e0e6f9 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4a6bc411914e77e7d8881299d9ce0c47f54860c2 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0e489ff07f8c37ed4c10c22121f4036e40154a2b |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/04e9c24caa54cffa123114f9d9ee9505734efdb9 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/e0efcca455e7661cb66140b41fa4888416e5c760 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/b06b0e0ae36243e7416a9b8be6058aa103b7e2f3 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/ba0ba8cce8d8f4f3da25e19f48b43640cec72d5e | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b0c7782b0a45884e85018df007f2a7afdc218db6 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aaf19ace0159336916fc667fb7ac6669e1910daa | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5cf80587d125e7f1b02a0f79246c74821d6c7e98 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e01b456b142a24554a5c1c7e3f3ae1e73c9281c7 | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/da6d8478e3a36f333dfb3eb1df5b30d1faf0e123 | ORPH
   s390x     |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/6a3bd76a3e2c621e6ac48cc0791df343d69dcfde |     
    arm      |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/4700fc8b0ef2d24a0f98f125e86dc237fddc78fb | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/85f7231516c18070078107c8a4ed12f84d022ce4 | ORPH
    sh4      |         mesa3d-24.0.7          | NOK | http://autobuild.buildroot.net/results/1e508cc9d35333373ac32b02ecc060453707bbf2 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c9c4a0ab375605a65ba6215906359b0831ac4c92 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/fd590987b4d682ae05d66ea5257adee2dedaef20 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c25928611d91ff1e372e55be62ca5df139343378 | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/98dfb63544dda31cb03e6b73939513499991c219 |     
   xtensa    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/8567da4cbea428f7667c596ff7ded65bdd58987c |     
  powerpc    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/89d64789851f3d1024114b9275ee65fe013a2cb9 |     
 aarch64_be  |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/24f94227391e423a25d1e9817232cc9097a3d449 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd3e07be044b4a31e54b7a6da351b33720a67697 |     
 aarch64_be  |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/1c26aee582600e2718ae4385b036a95901bd9313 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/2ddfc28e782adf9a3e9caa216edfd13b54f80666 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                    fcft-3.1.6 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/11b35af702a7a62b08e6ca789c65dc6f6f7d79a1 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1f152809d935340d2bd1ca78c7d6ad40e667add9 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/81d94328f7f33594b907bf2df038610287071b6f |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b8904fbaf34def7bfe725dfa56a779824a4418ea |     
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/635418b39cfa4fe2b1559b84cc37d072a0e7b69d | ORPH
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3e114d3448ff34b9794e1f57a46bdb761f400577 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5db1cdd3506b0b8ae0fa4c04e32269d2e1f402be | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
