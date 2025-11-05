Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC1CCFA04
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 04:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 761B86126A;
	Wed,  5 Nov 2025 04:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBNQKsBHsnRb; Wed,  5 Nov 2025 04:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A5D26126C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5D26126C;
	Wed,  5 Nov 2025 04:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2DF7462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 04:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AC26126C
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 04:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyVDyNvVKNsQ for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 04:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 131486126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131486126A
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 131486126A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 04:19:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429bcddad32so3827758f8f.3
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 20:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762316390; x=1762921190;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u29381+DpHBwIYGiQaNpPlF8ghlqvC//k3W2uRfgY6o=;
 b=Go4e5VGd5IgTXNp9htWBH3577KEpGojzIwKtqIGVG+US9O5m5RwDjNf0KnDO2UtcDv
 fE4ysQfcO4CQ+yqOUc4nJwOE9YOMP6rGe8scg9eoBepatRh5/AOuDlujf1RogbqT7zVc
 aHgwkVXT5BnHl5YTnfEd72qXoO8voaDYT87RUX+2nY/tnvbvazpY8SZ3UercVVxmpf1i
 qROKsFQLHufPlTZI5jgQ0OynCsatrP93OlefWbhK4AuhzJjaanRjT6PtAvR/+BManb3c
 DA+JXl/HI3L0h92KwvXhxBi13zKspXCaCB3KZPDiZ5Rze7xWq2jVpH0zLXg8xYkXZhye
 BRnw==
X-Gm-Message-State: AOJu0YxVcGi5r1gg9QuJIsvFaCh6BNim04E14OuyFlRMq7YiiJmLX0Of
 sJksQsEqda+kJdMJLIJKz1EiwKWZqRajDzDI/tZSTxAhcjpHlLJMl4DOvGpyCQ==
X-Gm-Gg: ASbGncvBQC9CikrtRUI8EKZfjGzhr6CsVayr7N1+fzdTNW2k+qWBBwdmY0DxxFVC+i8
 Je+X/OQIdeaeGvIRrydfOHdFs5IQZeByz+lvEyWrhPVAoNgJCmNFr6TlGTeEo704XvnQVLIhwEV
 TLxhSXEdL6euNdRggn0ZC7LFXGZN/XYUpdchoclrSxDBY5y76mdeyKxaDtLfGCIfqt54zVqdcp8
 kzojqDru/2fvhtXOzm1OWwABWqCs4dOT5tdnqfPFP9dPa+gan6Yyix6srV8quLiX90O4X9+G5xZ
 CIZKBIZPA5lIz/K5R14gbxXCMeVxpp67CMab21A+ZVhBxAnTlLBPcAoKdYCQ66a7rp9sJTBUH08
 anooydkQpexhFlrlJzLqcYn+1l/LQOMO8vSsfn2c/59N0E6dxDt9LZsDc/Xcl6UOOBsP44r5/B/
 n64uLMSrA=
X-Google-Smtp-Source: AGHT+IGpKRk5I2GOGoWcVHzZQMCIQz6QD6qMG/B/2RmV2GQ9+tO94AkKo3N2R4npnmXNGnpXCLSi8w==
X-Received: by 2002:a05:6000:2681:b0:429:d2d9:6cbc with SMTP id
 ffacd0b85a97d-429e3305ff2mr1486649f8f.29.1762316389518; 
 Tue, 04 Nov 2025 20:19:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc2007afsm7948769f8f.44.2025.11.04.20.19.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 20:19:49 -0800 (PST)
Message-ID: <690ad065.5d0a0220.31ae0d.7dd8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 05 Nov 2025 04:19:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762316390; x=1762921190; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=u29381+DpHBwIYGiQaNpPlF8ghlqvC//k3W2uRfgY6o=;
 b=mC3FariePLa4Ps0vsyqNJXDRS3TUbzZ7brHz34CcMR09T39ehobK/8H4vfk2AcaQ/T
 PcORB22VqaZwuxmwfkDSV2qBO/AptBo8/06Qip0016XQGoobqYjeYH8YqmerWlIVrecP
 PF68SJnQ+UnogjxpOpaZXQ3nMlgGZr7jpa2p3wcBYdeWLz1tnIsYuK3CQ0X1Gw+BGsvV
 DCRWe+EDNBEh7ggsCf0qAM6ucOIMCQxKwhBvrhqBFM4fzpKhqcIOSistFZmfCWsCwBaA
 9sSuLDBjfEnI/V+mi//PdqsSHYh6r+K0pqYVZoQJnQyOAw1CISUG5AMhKi11SuEMNqG4
 yCzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mC3Farie
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Autobuild statistics for 2025-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.05.x  |  5  |  3  |  0  |  8  |
  2025.08.x  |  0  |  7  |  0  |  7  |
    master   | 24  | 79  |  0  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 7 
                       unknown | 5 
                    mpir-3.0.0 | 4 
           host-openocd-0.12.0 | 3 
                   libcap-2.77 | 3 
                  linux-6.17.7 | 3 
                enscript-1.6.6 | 2 
                  libnids-1.26 | 2 
     libphidget-2.1.9.20190409 | 2 
               bctoolbox-4.4.8 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
                 dmidecode-3.6 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  dpdk-24.11.3 | 1 
                    dust-1.2.3 | 1 
        edk2-edk2-stable202505 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.41 | 1 
               freeipmi-1.6.16 | 1 
            freeswitch-1.10.12 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                     gmp-6.3.0 | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
    host-mender-artifact-4.1.0 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
                libgeos-3.14.0 | 1 
              libopenssl-3.6.0 | 1 
           libsoundtouch-2.4.0 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
              mariadb-10.11.11 | 1 
                memtest86-7.20 | 1 
                netdata-1.37.1 | 1 
                     nvme-2.15 | 1 
                    polkit-126 | 1 
procrank_linux-21c30ab4514a... | 1 
                python3-3.13.9 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
           sane-backends-1.1.1 | 1 
                    sdl-1.2.15 | 1 
               syslog-ng-4.8.3 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
                     unzip-6.0 | 1 
               valgrind-3.25.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c33b0e4dc372fa61c74450dc3ffe569f36fab161 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/ea8522cbaa67ed33670c1ff240035b6b987be306 |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4412ab954fac1a168a8b2ecca5facbcfa47ed9ed | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4f9626e773c67d9cfccfcb7d4497e9c6a8509792 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/979a3f0492d20717ba5331ad54eec8b067057212 | ORPH
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/4bca68701d953fdec4b8a15cab52e9d377f28039 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/0c59e80fb1ae3e828e036abba2fe7737b245754b | ORPH
   x86_64    |         dmidecode-3.6          | NOK | https://autobuild.buildroot.org/results/4569901ce25225dbf77c8d683b973abd20ac7dd4 |     
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/0d910d1bf2a253893d9a32585e9103e2f05f75dc | ORPH
   x86_64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/6c316b4b911861edcd70ebab37bcaadad812b0d5 |     
 powerpc64   |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/e2224f4e60b00b226bdcccec158c5378e539676f | ORPH
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/4c81283f992777a0be7fe981548110f9de536907 |     
 powerpc64   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/20695d56f9d53baaba82133d3055bac6f3a47d7f | ORPH
    mips     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/70fa72e789259b05015d3c7e264021c49a7f2615 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/819eac724109a580b67bf0679c222b451c098849 | ORPH
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/cafdd538b83b020a005ad477eb94759768c343ed |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/1c8a42d524de058bc5ced28a3a2e83ff84ddfb11 |     
microblazeel |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/93ce6277f05b9d89ce042d28ce198c5cf4c4518d |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/e5bcff08b8bd13178bf12b94e8d00fe2bcf9c11a |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/057141e3da0e4d650e1194d672fdede9088db079 |     
   mips64    |           gmp-6.3.0            | NOK | https://autobuild.buildroot.org/results/517a6ce24ea166329a01b5665cd615bc6928c555 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d94d0841a76e2e390ce30a2e4aea0ee2c5618e2b | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/9fb0d5103c3ecb6aee8a21de3da24cb603246a40 | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/7cc269b110d095d5ac24e07a95874ca8d794cced |     
  powerpc    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/1f1d49630a45f2b9956a877aba6c0d4b73949ded | ORPH
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/8a01f7b6f93fbd7bdb4815b026230a666e7f799e | ORPH
  mips64el   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/7105a6c74c5b098f0bb1e64fe3a5e1ed122b764d | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7456c0f1f9b968a7614e5a6c160f395f16a2dd32 |     
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/7c20353256721349b0a09a5c5748a5944d4ae0d9 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a28eff9ba67428d414ceae3c52afd96c6210bc7d |     
   mips64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/6583edf7c2046ae8b912af6b95a1b1aa33b5cd3e |     
 aarch64_be  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e94b6932e668ba0df0906cad8b7f7960043b3919 |     
  mips64el   |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/47d70c6521b473a0a2672e2605e398940a484e8a |     
 microblaze  |         libgeos-3.14.0         | NOK | https://autobuild.buildroot.org/results/ef7cf1d2e08aef4e22e94260f92b894d5a852036 |     
powerpc64le  |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/a44b862c1020ce38e6c8d6b49c0edec9e0d02dc3 |     
   arceb     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/2580c7d3204272f8ed152a0b19eaf1e769b3c48e |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/45fe4b187a7f7cea810983b0a3252fcaff44e3e0 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/12aabf08db05c29e50c3da3dc92f6df395aa0705 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/98579d0a367269f76e8ae787accb1db0422aae08 |     
 powerpc64   |      libsoundtouch-2.4.0       | NOK | https://autobuild.buildroot.org/results/16788317badcfdb3d1973dc3f1bb89ea05d3fe10 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b917c733601b4d75c9a0d7b10f0bd60c8a6cf7b6 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b895ffb21b35ef62b4adad7df931d32c0e6979ed |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8ca557a9fd40cfec79f6cdf9dabe5fff2e1fff36 | ORPH
 powerpc64   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/752c8ff8c76fcbb34cf95e5678f6ea98737a34cc | ORPH
   sh4eb     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/518c3d926882532ceb935b032b3a47997cad7551 | ORPH
   mips64    |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/0df2df5a7fac6b40746437b73c3af6a698605a98 | ORPH
    or1k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/a28579702c08e29161603a0c383464a8e8b2b7e0 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a397da2fffe1bd69fde8b8d4ad51cb7a05e28632 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3bfabae3c325894f2ff91786eda4535571fc63c8 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/04a8f31fae6b112b965563b453f1535d538b4753 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1c3bc4b7f9dd637b0380da2db30960baa1c3df32 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/43e0a05cd3583491f9fee69ae3182b3ebc5bc81d |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/60b52e300aceabff87cadec1196eed45b7b12ad8 |     
  powerpc    |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/5bccbbd7ad4ce4a6898f6bcfd0a92c09e61324ca | ORPH
  riscv32    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/881b420192541f7537086f7e4fac1f8c1e83b2b5 | ORPH
   mips64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/988b0578fa35d1b58f2f1e6130de1ec0f199e3cf | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/aafdb1fdf97da05835159be902c53e2aa3e67f32 | ORPH
   mips64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/be274fa56df4f792e0ea6c82a9277bbe0214d77e | ORPH
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5b23b4eb7eb27644d8f08daea1ee9b7550453206 | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4be0fcc42f38320c8f66c99ea13b9a9dbc318fb3 | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/48e77a49d9b783afeb088e1df322f1913ef8d38c | ORPH
   mipsel    |           polkit-126           | NOK | https://autobuild.buildroot.org/results/27e2399919896e3db0d8c0aceb25be160fd3c953 |     
   mips64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/601feb6d7874f045ebcd7db22668a0312357f5d3 | ORPH
   sh4aeb    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/b4b8d1b26d9d9ef37669e5c313867eabba0b5eac |     
microblazeel |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/907c9c81221f3f0dc3b9212ae8a03bbf2db70ff7 |     
  sparc64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/2aa8917302aa2a94191c7cc8a71e049ebaa06e5e |     
 powerpc64   |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9 |     
powerpc64le  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/640fdbbac6c232ec89c8b6cc5d0fb60587b50964 | ORPH
  aarch64    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/617f2c09676ff83a64e0206548fb2227dd982cab |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/650838e2eacbbbf5ca7dfe45c89d000bb6b5e486 |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2dbb57570e582574e7a96b5a302e1ee6d3dc04c2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/31fa3b13753cadaa02674039f1c8b83f592b218b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/cd5de41c998523ec3099803d5d925df769b87544 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4d3afa1f9251d2d746e0e45c5bec7cc115d900e7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f3a46f190acb21b47f6f2bb678f9a6b438097dfc |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/48e7f29ecfe1e07b12a48ea3b35328ad50694fe7 |     
powerpc64le  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/5a8e92e43732d13c9aeb530c1ed245c04b6b3d85 |     
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/cf0fe5e0319d14f74e1b7e41430a352fe565a7ed | ORPH
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/5452ae0191fda47cafc7b0649d2dce6bd5d4467b |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 linux-6.16.12 | 1 
               syslog-ng-4.8.3 | 1 
                 systemd-257.7 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a94431dbd0b110c4cd6ca264907ef3371992ef8f | ORPH
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/de8b55df5519e8405772f29ac4793794b270c8e0 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a5867f19ca7a1d2ff7116100610ae5ebccd6bbf8 |     
   sh4aeb    |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/a5f2e31a53dcecf70e41cd0463a149e72ace572c | ORPH
    arm      |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/38614851cad2a37c97ccf0bf1194cc3c2604cef5 |     
  aarch64    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/4ec25ad53a9e506e0c0dbef75d59b8d2bf1158a7 |     
    arc      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/d83df1a6a520a7c7b81335664703c562d8dd831d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                 libjcat-0.2.1 | 1 
                 logsurfer-1.8 | 1 
              mariadb-10.11.11 | 1 
             ntfs-3g-2022.10.3 | 1 
                 openssh-9.9p2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/80eed1210c14d3ea26274d9746d68be4d1dc0656 | ORPH
powerpc64le  |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/c7797f65be06c04727eca41b77af17ffca320020 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1bf6e1881b46f7fe0fd9aad86b159bee47895b2e |     
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/8eca6c10bdb589d6528a2839b5257c0255401234 | ORPH
    or1k     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/a6d1061454a58798355789aff7192da6543ae4f1 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/62da69925b37e46d15a9885d7ec281b59cb63e10 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9c4f640b0adde479e6cd174cefe59287f3ffdfd |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libselinux-3.8.1 | 1 
              libzenoh-c-1.2.1 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d9e6f7aa1dbd603900e3a6bfc7f9d05672d85c47 |     
  aarch64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/04a2130a20f92eda96bef1f52b087589f1b16f7c |     
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/e70307a4e8227652fb0d101b30c55eb27d4fe087 |     


Gitlab CI results for 2025-11-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11957806703 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845858 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845739 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845733 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845705 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845702 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845663 |      
                 TestGawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845541 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845538 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845536 | ORPH 
    TestDockerComposeRunc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845502 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
