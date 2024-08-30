Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E41FC5321D
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 03:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1C740BA7;
	Fri, 30 Aug 2024 03:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02cV0xgnObLK; Fri, 30 Aug 2024 03:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5230E412B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5230E412B0;
	Fri, 30 Aug 2024 03:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4144E1BF85D
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 03:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC38840D2
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 03:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmVQ7t1afaOS for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 03:17:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17EBC81E5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17EBC81E5F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17EBC81E5F
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 03:17:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3718acbc87fso763327f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 20:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724987846; x=1725592646;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Y3jJNT9qlnrtBCQU2wqVzOz8heMreiuQKY1gcb4Uug=;
 b=bDNRqdtZv7+6+9suuppNSRYtJSSGqwrHB7pWQ3ILtHyu0yrSGcSoxlMER4YFXFfqNO
 FNq3mCiT/D57t1Wb4IPZ/uSPoIQTIK8mjWLTFwxbvX+KVCYsldSU93yUzcV9lyWlRHKe
 /yLGJZdojj8Z0hk8V2g67yWtPZBxJcyBPGedmFhD+1p6XMVgzrkpF41m6VZhCOPQLd7w
 Xt1dqfQPqWDne2HsQynB69wQUlt3dHHwZMeQAZRud0FRyZVwV2kUueTvFe4E7/IBX5Wc
 NKbTzXlP7iXUoER1d4+MrPJLTdM0ibyjIbcoR9zVUnqivACjBQAASzHPOVbwTU36t4ps
 JxRA==
X-Gm-Message-State: AOJu0Yy0pIDTNj/0GpheltNZ+IsfUNSHSOTa616YDrRAtk7lMkNH0N6y
 R+AOGMJ8rt9Qce6fF42h8uLZoUXsSKPBreM4MbGW+jsag1caKHuV+kPnSg==
X-Google-Smtp-Source: AGHT+IEhGzViJ+6M7ic2xFCEMj3na2U0IqP/9Hmq8X+8ld2f7PGoJi9SloHEwHNq1/MT0flMHbiOyQ==
X-Received: by 2002:a05:6000:4020:b0:371:9362:c286 with SMTP id
 ffacd0b85a97d-3749b52ecc6mr4018206f8f.4.1724987845945; 
 Thu, 29 Aug 2024 20:17:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9ba8esm2775705f8f.50.2024.08.29.20.17.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 20:17:25 -0700 (PDT)
Message-ID: <66d139c5.5d0a0220.1300b.7e17@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 30 Aug 2024 03:17:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724987846; x=1725592646; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y3jJNT9qlnrtBCQU2wqVzOz8heMreiuQKY1gcb4Uug=;
 b=SKrVfASgv38rHE8++Swh67O/y68sWtNFTggwH+q0a7cd0s3T+Qn2ur3+y0gfvuFKIv
 2CdZlzW9GxoUn70/r2ilKBO0WxvQusXp3/a0nMIUORx36enf7soFN/8dWY/Noda+7SK3
 DDEepQMCMWy+uPXpbkkCCJ8SUnFHvJxL/K5Y5H1FTNu5l9XN+7SPQD2lm+zd4m0ZIecj
 t8rOq6mGCOy90R/2e7/Sp1dep55WO0jP+SRGv3NPtvVR1VS4NRuXyDuYG01wFGBRMcsE
 VKsOVqEZ9B5JVjMx9DXJikK1+oleZxoiKwGIwAT8nobTO+WsWPvKm7frzp3ErCVrkzA6
 MlRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SKrVfASg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-08-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 10  |  0  | 21  |
  2024.05.x  | 12  | 12  |  0  | 24  |
    master   | 25  | 44  |  0  | 69  |
     next    |  5  | 13  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

 host-softether-4.30-9700-beta | 3 
              cache-calibrator | 2 
                 gnuplot-6.0.1 | 2 
               ipmitool-1_8_19 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.10.6 | 2 
           python-daemon-3.0.1 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
                  babeld-1.9.2 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                  fbdump-0.4.2 | 1 
                  ffmpeg-6.1.2 | 1 
          gitlab-runner-15.5.0 | 1 
             gnuradio-3.10.7.0 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
            host-ccache-4.10.1 | 1 
           host-librsvg-2.50.9 | 1 
     host-moby-buildkit-0.11.6 | 1 
host-vboot-utils-4b12d392e5... | 1 
              hyperfine-1.18.0 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.6 | 1 
                 libzip-1.10.1 | 1 
               lighttpd-1.4.76 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
              luabitop-1.0.2-1 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
    python-cryptography-39.0.2 | 1 
          sphinxbase-5prealpha | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e43cc25f4ce896d7f640bff7456e3fe22e29b6da |     
   arceb     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.org/results/86ab9eae0522bb28b2f2f6f4dd62d1a6c89aabfa |     
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/e5b628c3c7553b6f7f259f245a8c6a378378c0ea | ORPH
  aarch64    |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/55ea1dc5546b652de04cf4e9c996618fede6107f |     
   x86_64    |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/0d8baf0cffe6b61f8a100102489dc03c9990214f |     
   sh4eb     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/339397f9b2a038490c61b99e2791cde65f443ba8 |     
    sh4      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/724e44e993e6e3c3e84eaf17ff370bb950e397db | ORPH
    m68k     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/128cda5cdf08eb321b5cff8ee04a14e0c6939570 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/42ada58c4f463e3b1d59972c02664b6ccee34ec0 |     
powerpc64le  |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.org/results/294117b551fd45c12f8b5cf4a822a7ecbdf7410a |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/5699eae1e73ce0e641f584755724c3fa81d7499e |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/7f54f623dc04c60f6c0145e1ae7f757e737d33e9 |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.org/results/ec819b4e70eb6a7b47b1cbbc0a1db83df06e5d7a |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/1968201005e9d81a38c36cec2e1e16c614935435 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/ba0d7530db864e45df8649f7f7f29d27ae2faee1 |     
   sh4eb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/165ba1d670288e269b79c98cea221db55030f692 |     
   arceb     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/f2af709cd32aeda960a426f3b1092219adda35fa | ORPH
  riscv64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/3ebe8c4ecddeb6d412caa06c3625ce05f2a3af20 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/09d68687f84181e8c00b7fbc08539bbc4ec41b05 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/ba32a353a24ce2c21901879d9808334ff0100723 | ORPH
  mips64el   | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/f489eadc6b2c5633253530482e58c0bac265ee9c | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/3f1b6fc0824fad9c296e93052270923f47ea2705 | ORPH
    arm      | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/2b8344eafa8ce22987f31987ae6a47aef082d263 |     
   armeb     |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.org/results/c75d786ecd00ade8841445f6eae232f10a2f1ba8 | ORPH
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/14230bd297d5c30b39a04dbb0f5a2d6a1cbe22b5 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/30f788e7fffb506877ae0d0ebfe6fdf4970a09f7 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.org/results/34678ca2f1e2f3e0d4f6a347c5a5aeb715b1f9a0 |     
    arm      |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/c1cc9f2a98cca4d9ac05b66e7fe94ecd7479fa42 |     
    arc      |         libzip-1.10.1          | NOK | http://autobuild.buildroot.org/results/d1fa7e072eb5e5e5e25b0b8d33d31c9bbab8180d | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/26d5de211f304d437f70821f35db8190faa6a103 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7eb2cbc0f1166cecd7c211ae8a4048a04af6f4b6 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/8c32fdf02e2304788160a884aaa10ea6f5254bd7 | ORPH
   mipsel    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/a3f20486a85822ae3f94df3ff65b43d7523dc6bc | ORPH
   x86_64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/b18c992bb62bd5dac5a978a709d03eee2ab1ad59 | ORPH
    i586     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/3f457b6104ddbcc8c0f351083fbd9a0ce3307be0 | ORPH
    i686     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/5243c37d8b8672ca6e54a3eb03ce3118c29caf2f |     
  mips64el   |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/70c3b69bbbfa38a6b5e47b63159a4162b87d757c |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/52030c88afc28efab3e7e5c62558497ca063b02b |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/f07572c9d10ed72a3ac1bdac1fe9420e6d9258be | ORPH
   s390x     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/dfe4656df5937e2013cc0dd561c5f85457f5a57b |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/e9be27180d592097193fc3c05af883541ff4aa3d |     
    sh4a     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/170404428172dc6bff14ce6cecd17495c223cc65 |     
   xtensa    |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/5d85f1b89b84eb98afc5a9fdd59a3fc9067dd3a0 |     
    i686     |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/a71c2d33a8a96649aa013adf3bddb8f7b6621bd7 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                  bcusdk-0.0.5 | 1 
                 coreutils-9.3 | 1 
                    fcft-3.1.6 | 1 
              fstrcmp-0.7.D001 | 1 
                  linux-6.6.37 | 1 
                 openssh-9.7p1 | 1 
         python-pymupdf-1.22.0 | 1 
             strongswan-5.9.13 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/cd9b7c4b5d09f68381129b87cc39301195c8ea8d |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/393847ad01501919e1e134e00c3a967f42165181 | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/f526b2bc9eef9e2e3a7e41dd36f55ba196bbc737 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.org/results/6dbdc01b1b5347422d090ac00f3ee47a106e5103 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/dd0691d5d0e210759a837d049ccb99ed94e4d3a1 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/7f982f39ced94bfd40d0768a61c42c2b31252a20 | ORPH
   mipsel    |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/cea6a134c7cfc7f541b451aa830c9f895fb04770 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/3d217e522994ed79f0ec13f2d564540db715f3a6 | ORPH
    arc      |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.org/results/90842ebe5a02e99f7517c9fa054b6c7e427d5d0a |     
 microblaze  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/67a648f5b99f47680a22bc146ea5f61fdca241cd |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                    ncmpc-0.49 | 2 
                       unknown | 2 
                   bird-2.0.12 | 1 
                     crun-1.12 | 1 
                  ffmpeg-6.1.1 | 1 
                gnu-efi-3.0.18 | 1 
host-go-bootstrap-stage3-1.... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/0a086b77a5892f7eac922a2dd6bec22127c50150 |     
   sparc     |           crun-1.12            | NOK | http://autobuild.buildroot.org/results/b367422e2e612e0dbdc55a882b0c47f33af9f3fb |     
   armeb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/9808f6b96a5d0c8c31c437fa3a34c115fd1389d4 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/a557866777a92a1e2a3abfb85f94d97ea0847302 |     
  aarch64    | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.org/results/e7075cfc7ed11ecf0ff65cb8472ed0fd36197895 |     
    i586     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/7906eeeab1060b8103c222d1ad66900192957e61 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/9ca75392426a3c13beed4d44daceb73992563498 |     
   mipsel    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/f2aae6500e61e47d867c939ffe46d38bd55a765c |     
    arm      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/80835c5dac9d2ee54e01192a5ec5b584f4ce8fa9 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/f5e362f86d18257465d801d5c30e0c8d38006d5c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.org/results/158eefae62bef37b21060a320cb289cb5de0bff4 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/cb2bcd71e7eb19f7d2ec0c5f23e36e6b91fd15d9 |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 1 
                   bird-2.15.1 | 1 
                 dc3dd-7.2.641 | 1 
                espflash-3.1.0 | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.1 | 1 
host-go-bootstrap-stage3-1.... | 1 
                libesmtp-1.1.0 | 1 
                    norm-1.5.8 | 1 
                  ntp-4.2.8p18 | 1 
    python-cryptography-39.0.2 | 1 
                 uclibc-1.0.49 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/90bf4a8ea8f4c7584128a74eb1113eaf6c883333 |     
   mipsel    |          bird-2.15.1           | NOK | http://autobuild.buildroot.org/results/7fb4851cdd63bfd1760dc37863651cf23f3c0900 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/6d973726b3c909ec492ba863f98312bb7da1a266 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/2826c6247bede86c01fa129f18f50c269e2ff48a |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/93ffa00d95cd28f5cd25b7a2b82e59335030fa0b |     
    i686     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/66f0893d3335b06fc0bd9d5a68014ba38059dc59 |     
   sparc     | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.org/results/651cad4714bd4359cda20f44aba0818f6bf1a3f3 |     
    i686     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.org/results/d998474f24c6e28edd1862228abcc8c90d982c47 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/d069811d7cda9823928b6a9a2c4126e463d42149 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/444159b2e6ab418bc46b158460d7cdf57f6ba7a3 |     
    or1k     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/c743324f025e9b9c7a2bd22ac65558b7f0d71742 |     
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.org/results/42e919dfd48cea239b24c2322289dce33d5b5d12 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/7309710099756d64e33eccaba14b5f8c9ffb899d |     


Gitlab CI results for 2024-08-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701285  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701287  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701289  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701290  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701304  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701323  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701338  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701348  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701349  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701351  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701352  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701353  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701354  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701355  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701356  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701374  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701383  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701385  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701393  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701397  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701399  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701400  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701402  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701407  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701411  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701416  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701421  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701423  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701425  | ORPH 
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701446  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701458  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701459  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701462  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701483  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701487  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701498  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701503  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701505  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701508  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701571  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701586  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701591  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701594  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701595  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701606  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701619  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701654  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701658  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701659  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701681  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701685  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701687  |      



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
