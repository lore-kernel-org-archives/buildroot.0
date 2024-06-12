Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A640DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 04:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0143781A15;
	Wed, 12 Jun 2024 04:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4yoq1egiFok; Wed, 12 Jun 2024 04:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792A881FF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792A881FF5;
	Wed, 12 Jun 2024 04:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51B0E1BF37C
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 04:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 490AA40454
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 04:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyr6pkg68BU5 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 04:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A79B40286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A79B40286
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A79B40286
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 04:06:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6610B240004
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 04:06:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 04:06:24 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718165184; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZQNNOuMw8nQybIRcYxG24eRMrvNVbxFkfrPN+Tw4fVk=;
 b=GDyFhEhHhYr+NXjCBouDeXAaUvvtt2l68MQX98j1ZUe5CrZ0CQ90JaMEfsVfgIN3HLm0WI
 sprxTHHi/9MV0GxpsT6Rg/o+LVPY5SOXBv3nf/Gs18paVftZmcd638SL9kPYLJs/XuO8pA
 u3+qdGnABuix+fGwzA/0a3Me9zmyRA0PJlJ3OSwT6dJaXBVc2rgrfYR9OjRDSCVghPTd8p
 4WYCE+ZR3tWmcXddkVvs+2D0mKsAU39uWwEapNrAja6QMuiV5KJnj96IBAipLyGfQYCvQf
 KXHt6Y8uFpUhyLnuZ/fsVDv5D1ZT1kiKZ/HgwcuKu6SRABNY/tmWPTtA3i/abg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GDyFhEhH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-11
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
Message-ID: <20240612040624.mFR-4YO7p54xSSUAZdau2z23t5vWMurvNexSjSB9ul4@z>

Hello,

Autobuild statistics for 2024-06-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  |  7  |  0  | 18  |
    master   | 143 | 322 |  0  | 465 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 45
            host-cdrkit-1.1.11 | 36
ibm-sw-tpm2-5452af422edeff7... | 18
                libressl-3.8.4 | 12
                    mpir-3.0.0 | 12
                fail2ban-1.0.2 | 11
      host-riscv-isa-sim-1.1.0 | 11
                host-odb-2.4.0 | 10
                elfutils-0.189 | 8 
host-android-tools-4.2.2+gi... | 8 
                  ffmpeg-6.1.1 | 7 
                       unknown | 7 
host-vboot-utils-bbdd62f9b0... | 6 
                 openssh-9.7p1 | 6 
                  bcusdk-0.0.5 | 5 
                gnu-efi-3.0.18 | 5 
              libarchive-3.7.4 | 5 
pppd-e1266c76d1ad39f98f1167... | 5 
                 coreutils-9.3 | 4 
                   foot-1.16.2 | 4 
                host-go-1.22.4 | 4 
                  linux-6.8.12 | 4 
                 uclibc-1.0.48 | 4 
host-heimdal-f4faaeaba371ff... | 3 
                  libsepol-3.6 | 3 
                   linux-tools | 3 
         python-remi-2022.7.27 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
brcm-patchram-plus-95b7b691... | 2 
check-11970a7e112dfe243a2e6... | 2 
        host-sentry-cli-2.20.3 | 2 
          libcamera-apps-1.2.1 | 2 
                  libffi-3.4.6 | 2 
              libopenssl-3.3.1 | 2 
               libunwind-1.8.1 | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                  nginx-1.24.0 | 2 
                openswan-3.0.0 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.59 | 1 
                     apr-1.7.2 | 1 
aubio-152d6819b360c2e7b379e... | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                  bind-9.16.48 | 1 
                   bird-2.0.12 | 1 
                busybox-1.36.1 | 1 
                   ccrypt-1.11 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
                 dc3dd-7.2.641 | 1 
               ding-libs-0.6.2 | 1 
             docker-cli-26.0.2 | 1 
                    eza-0.18.8 | 1 
                  fbdump-0.4.2 | 1 
              fluent-bit-3.0.3 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         host-gcc-final-13.3.0 | 1 
              host-rust-1.74.1 | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.28 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
      libabseil-cpp-20230802.1 | 1 
                 libp11-0.4.12 | 1 
              libudfread-1.1.2 | 1 
          linux-5.10.162-cip24 | 1 
               mariadb-10.11.6 | 1 
                     mtd-2.1.6 | 1 
                    ncmpc-0.49 | 1 
                  ntpsec-1.2.3 | 1 
                  octave-9.1.0 | 1 
                    proj-9.3.0 | 1 
           python-numpy-1.25.0 | 1 
                    ruby-3.3.1 | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.12.0.1 | 1 
             sofia-sip-1.13.17 | 1 
squeezelite-71c012ad9ba102f... | 1 
               tcf-agent-1.8.0 | 1 
                tinifier-3.4.0 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
                    volk-3.0.0 | 1 
                 wavemon-0.9.5 | 1 
                    xen-4.14.6 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/461d70b7534993bc5f89edccf91f70930d792508 | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/af2a8a7e49cbd29d8d23ca5266c3f13f2fe7035a | ORPH
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d664f194ff4fc5f942ceef506e5882274244d9b7 |     
 powerpc64   |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/56aa16aebafd17ab76efbaf3536407bd369773f0 |     
    sh4      |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/ad9e763d01960bdb7997e3b358e6ba8954e2650a |     
   sparc     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/589c990701cdf4e53e1fb916c28ba703f1025f04 |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/29722ae0e5da71f8ecc540b1759c31389c5331e3 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/bfa16e9633a6a02c62030e7c2c35a8dabd0cb2ba |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c1d3e57290f4e98d71185b3ba873984f43775ef5 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7b9655bbcb2f8cc5fe774f50e6cb47f7c6796420 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5f289fede77a027fc19e8d71c935b671f036f70c |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e62ad9dd1ea642feb3596cbb19baf2d567704132 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3d2a4d1f1cc01cc5f32d308eb531855b03783cca |     
  sparc64    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/94707e6620527f7198a6f3dc39a4a174588e9560 | ORPH
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/42829b0e1905a54dd8883f0080634aaef5065d8b |     
    arm      | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/211c93d55331132883f20adbf6f8409099b5d333 |     
    i686     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/8503ec878b3599a81b43addfb09c3bbd66f919ff |     
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/a71b9f3c888207d30af5dab022f7f2d315ce0b02 | ORPH
  riscv32    |          ccrypt-1.11           | NOK | http://autobuild.buildroot.net/results/7c0914190f700724327aa02a8c485e437a17ee08 | ORPH
powerpc64le  |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/91d8a0b71241d50ce70e62b0f55c4772d95305cf |     
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f60595446c526a011a43ec0f3b1bf8c33ee585cd | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dd787e0ebaeaad4af84681610a393fde79800ab2 | ORPH
   x86_64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/651bd3a1510fd87074982343afd1b18cedab7e32 |     
    i586     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cfc7d5b4d5351c240f8bbf552e185729ba0bfe2b | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9ad0b4bea8f3f21f0ff5a40efcd8e65921397b58 | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/616ecfdeb6fbe1cc61feedd2b5ea1b286a1f54b7 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f3e9735f88915aa61d524f263df4c4c962151dad | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/406802a8375b2b95c7f458d7cd887ea937df9a83 | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/c6ee735a50582738fdef5cc18ed53b5febbfc9fa |     
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/ad0eb4322f015ccb7e34f8a447a0a6360c0de4ab |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bec8d7f802460f0f820ba3984804f1ca75424aa1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/75beb91cafd68c93e53009991bc68fae357c2a56 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/017b6d54dd2af81867259eccc1785e92248d9bcc | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/13a2c42ccd26de3c924a2036671de95862693deb | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b7b69e11ff2572e13beb940e3462d2e56866d6c4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1286ef3d0d3e93d6e8f26ac60e5d378dd24b52fb | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/67f0de41ec5e9b8b17201035a4cfde96a600e4b5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/954cf3403d564b8644ee089ecb2b7731b7eeadcf | ORPH
    i686     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/3f164e1f139d148573451b3323f244bb0ff3e869 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8be345881694d94e1ee269ce23624a46070782ac |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8c8eb3c3083c8c6b01cf81c7700271fd7aebc25b |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f527bbcb74dd63cb84834bc489b1a4e2dd89d75b |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/34bff064e2db19eab912c5ac4c547a40b0a1d03c |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/acdb4d4600e4f172c3aac96152874816988ac03c |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4f57af2d6cec6330c4a91214ad7de3f5458055bf |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/be3ecf121071e9352a156b4c6cc37daea84e02a4 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/522b4be37a3362c9c0f3091d5eb8230e710cf13c |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cd3f6c9ef36fa4f9b38c2b8903a1579e48c33da0 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/67691db246fc75a9bffb319b0c9041aff3a9c2ff |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0a5381fd12240e464ed8577807ed9a98bcf51a7a |     
  mips64el   |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/05269c7ef9cce976a8a871ab9d929c99cba221ae | ORPH
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/048b92e42a8a0e46c47d83cc7882967479ec1906 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d04bd3ded60d8a9243169f2831aef8c1e24d85d6 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8d8e81b2a35a030011a7bcaa409e3229c4e188b9 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/aae051193d6e011020c4f432ce8ba40a9c3729b8 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9a33510c5a915a4aa50bacea0e82b594435d2b3f |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a9d48f4b474088ccbae0d163d508a9ff1b0a3af4 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e2a3d44aee5e326529ea4cb30c92d15494630f49 |     
   nios2     |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/f64b326e67f4ee7c8979668069af57a452400202 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ef2d493ef5aca3d92ec83cd480bb0b51948ef8c0 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4ec90600a0719823ce34aef16e36a23a71ede6fd |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/30c8c257c9c7e1b1ae32309c926a9014a33869cb |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/5b53e79e3d4cfe54965c340a88382b8a4694d413 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/e3f732a067b68af6f91c81ebeb60cb08ba5e1ab3 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/eff9b023439a6c2e9de5b907078bcd92db4e83d9 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ef76b386842b8b24bedb31e6e605d205439d5abe |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3750fe4f7e546ce431f1c546c9a6661e231f7a18 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c4ca57f22c25ae4c20650c2ecd0c34b6bcfa1e5e |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1c99f1ed5137579d0cdf8e6c07d06de5f3c3b1d2 |     
    sh4a     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d89f033dee6ecd805752f0273e88a2bfd173295f |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/101940b7fe7b764417e56c82832ff0ba626a25f1 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/94e6b62c37fe0adf6bed11f11e641bf6cc1f8eb0 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/274ff603ba294ad60d02511af621cf03f65a58cd |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0eabb42942377720d27bdd94b3ed95d7940ad620 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/21800eff701258f461f648cac1c91bceb7bb4587 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/42b30e39cc23692a582e7c297e4c472fe28363ab |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/159f39b3efe39346362a2d09a8591810bfa6539d |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b412ae729bbd700bbd2984859ba53e6c1a46ff7f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2db6b7867cdb5abfdcf3c982fe11eed038a28b09 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a49ea6559fac4c9a73bb48382f17338218f8d628 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/34053bb84e9ac8f010b1d3296494d58646f7396f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4a358a51f2ffc26e3dacd204e5d0d532e0c9b744 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/97b7c8ba8ce7cceba445bf75f2d0fe15af55eccb |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1696a5e07b56b1ae2ee08da9cb8e4538cf442f0e |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2faee379c0443ce0ba8b149f568a42741ea9b6b4 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7ce12ada7c2ea43c6a1799cea0f14a8fb795095e |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cdfb19750e1efd30d7edd9b48b0a55fc7b8165ce |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/996e8916c34a91016849d82b275bd266762052e1 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/de1db1d848b483a4d782dc4f967bbb5e76ad4098 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a2914321daf855de0d0129b422618329e035875d |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b2ecc0738e02b7664e8982d7a41d10e83b44faca |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a544454b49ec35f0bd5cbcd47f738d61379f7fc8 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d55bc65cce33598da3abf8a9fef176c5ddca75bd |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/33b9d97dcdfe84f086a9881025ac32f11b0d3b2b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2f68b8be7bf20cc24e51aa85efef6d11a33357ee |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2ca6259885ce5a3485db9be6ca1fc69b53a28f34 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a478ce87bcf0b1222dd542f094102e8aea07106d |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b48b9a54a662e599274bcc9c916dfc6558cc96ad |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e36f22a9f1eff40757a170b5f1e60a114d85c8d7 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e3207e8173e70b9f838cc3778a7b94c8016583c8 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52e69e951d68be7292685871ac322ba9826d48fb |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0c9deee2d82b974e464cd0d5e41896e6811135a4 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/18f5f0db2668d7de9cb33400b1d8f8989cf6ad64 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1428c67fd5b518f15dc587544241eaae94e2051d |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e7b83a6dc62409771ff75ff767712379cd5ce9e |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9c66d28887cca6ed74c201b0df2eb80d0ea5b38d |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/60a7ca6dfba10f80b1badde03ec9b1781608ad24 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6dc98bf634f79681facf3e36bae4f9c7340c703a |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb87dced5e28f4a940b7d1aead3a3b806eca7c3f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/67a8c3cc5a9a3785b6785e0e4a9d4da68f55231c |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7bb409c268b77865931de47d3aaf965afe8c1da4 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c82e81a6093f31ee67dd1e82aa97842439c5251e |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/351c7fbba8fe6aa7934054f7d9af189d16d4c09e |     
   armeb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/f907a6a1a8193c3cb8402dc9a091856f340da55b |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/201f69cfdd179f16dadc68ceaad1e8ad94bfa49f |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/68fb0bde1ed17ab50483d4e16edddcee6f3e7636 |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/6ceaa0f048e310953c5b92376649b059bdfb9fd4 |     
    i686     |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/5511a3eca745522097c03e5af44ef559a503dc65 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7c0fd32df028c22ad487b704190bdb2bf2cf3f83 | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/31bbaf0698c9e0ee5dabf00b3348fb8fbf2b42a5 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/085a4a4ed8930bb439503de374d8312e255a4eed | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/53a4358ebe462c620b42fef50ca408dbe019e38f | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/13996beb26f27d4152e3af7b83e516a82c610aae | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1113c0cfb3a94fdd6e9efe6c772b0d3e22e3925e | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7e819525ca50bcdf88de21e17769384f7b601237 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a5c3740b62305f341a8aad1a3aeca83a2af8cbf6 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/07d9f3caaff68e93754a639ce8567038397b2ce5 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b4675d62afe8184cb23076517981675cd1ebdcfd | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e245dd90184084c625fa9a956b7fb3e168d0b808 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/53f62d263771cf9ed7ee59d668a8489fdff3d902 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5b8033fd2a8e1834423d6851758e422da595ad5a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f1872bdc3f34e5098d60fedd7a4a6d2930d9c28f | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/981f05cd68cfabdb638aa805915716313383c64f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fed2ebe2d3512286c9d0dde59b1a14823c39a11d | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a29c0335dde8f5d9e142169cdec1ebe65970d9fd | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/765c08010779acdaeb81802fc31fc4944006690c | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c61fabb2820ffed1c789a89b13e951efc0e36cd | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c984fb8018d708fdca8a309e5a637b1515952855 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e0d9221edae18ad11d2c7db1826397b8025049b7 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2b95203013c3debfdba0587b7954e6fe8e4786a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0834accdc2f8843ed67cb2309232f5737471bb27 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6f0bd0c09e9230c04d57ae343f247169b59dea8f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0e3e2cbfd8fca98829bc7c756a7c79f1297943ff | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a3a55f6fdd00ac09dbd0165f0716ea111c120bfb | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/697a0c7f07a48612d70a7abc9e2f35dc9e9c1575 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/785cb7a876ab375f8768ae2dd61ab079a45a8f27 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e1867d95a135c98c909aa5ab791c14fce570ed69 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a5dadc4ad0e391edea71cb203bba85c25f655bdb | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/74751980b5ff89977ab8a7de38b5797dc43e6ae9 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5d31b5451ab8b2ef22802fda31a922e1c5203e05 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/af68a7fcb04e37b92ee10b9c4c550f8185cd87b3 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ee145fd4fa39aa018071093391d6c6e7f9e29700 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dc4667948128e936f984d360c0797ab9198200bc | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b9750c7034b9fd61df64ed5ee17ddea4dbca5d6 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24161826648e8d6afa4a922804fe0883b77a130a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2a1ccaf69ccc4d40ebe2f5dc7d887bd9aea55e4 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/533d99ef580312de5efee63129d7f4c226fbadea | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c55b5c60ca050b185411726f5fa5e3ba8c5205f8 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05ef7b7957d51b5ba2cb0e42de8de29dd4def24c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e87369bd197948079a190c6b2cb4aed9dc77252 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/796526451a0ea7a90afe6706fddeafd8838c7f52 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98e66731694ba326f43594dd75d0c20e4b47170a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4f8ccb8b01509ae253eee12c2c67a44e0dd0dcb0 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f104b2903d22fd48f2d4077f258210b2ec2f5f6 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7a5f489c77a8a6e086cd96aa5982c5a99605aaf5 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4b859cfc7930086d0c7e25c93728fbb068d5f69b | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f8bb4bb5f76c11fc42a3c22bda5920387c92a18d | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c58e4d49f4f9ae2dd39b2980118b6db97877b136 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0703d09c9a77a399d68bc2a0ea57c2b4747a6fca | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c0db35db64a4e8789548a7b0d620bc4a0f66c3d5 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b8f111cf98448780305603ae8c642af2bb05ca9 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5cc64a11fbea0e4b9c0db0875e40131309e31514 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3399f05c87fffb06dfd7c2ab1adee9f109911dd1 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e167b73c867c98127631f029235780e5add84555 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4608012ce390d76fe39cfdae05a48a356b3ba8e | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e122c44ec48d86f2b4bfaa93e08a39a03706b2ca | ORPH
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3327d50def949b60afd38654d7ea27ad803e622d |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4d73daa2acf2a3148399a7943efca9353533aa3a |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/cbc407966731a7cdf9cbbc4826e22e0fd1efdb31 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/57af81bb334c060969c643770111b1a8414f3274 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e6a2c7d44c63288f07fc26fc04ac6740d8e00e55 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b80b36b1f78107a87b66aa77d744c7ad1dff90a0 |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a11ece68e74f648e352ca6c970243cd18acc77cc |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c32fadc599b42f13b94342c8f1c37cb56ccffa95 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d0ce951d8c0d3863a1a6a502fc816e038d096c79 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7c757b646b601315cb6d228e3899e18480bdd219 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1cdf2f5e2a830f604c4aea287ad6cfb9e8d077db |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/e2f3970c8ff5e20b27c1814f9e8ae812f34f3ebe |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/6e4cf949e0e0fd899a73766afc80db3e50d6394b |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4e5887160a3cc01a45caaf0d6e0dea5ac4dc9ac8 |     
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/07696a3bea927a034188cf68922f70d543a42126 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5010ef6631d56f666a7352f9dee4e57c1ef226f3 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ac467be0d1cd1793e2af552e21be19ac95264bcc |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f133edbcc3c61cee5b0beae6e030296b96e141e9 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f9e5348d34d2326e1af75b2a4401b098fa7c7839 |     
    sh4a     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3670840a7b64a2bd79c88222af179cd6e78de479 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5b85af2b3886b1ecf3906c2091b89f98726f7847 |     
 aarch64_be  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/a96018b152c75525b777f161658d91073a25e9a7 | ORPH
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4c96d56570213bb53448035d0ecb7bd2fc0d0cec |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d0b88826327285573ceef485d94bd68b29d1260a |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2fe6c79234a8c99a7479e982332ea4845eb6876e |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8a681b077a4f4edbc532bdf079c97b384ea39c04 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c1625984ed0ad76e1e89af3454e211df3152699 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dfa6074def13105442da2c24bbab629ecb0632c2 |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2673fbe2d1de217c757de6a417508820681a562d |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9224b797ed6de12d688126ab704879b33e577c97 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a9b1f7678c22265225c68cd01d0d33af5c60ef64 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7148e7584405b873ca222783cece49d0f29d2dc0 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1adbc6f4fab10830564c39a4593b294253c7d7cb |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/92a88dc653064ddfff67caa23dc459e9f0824fbb |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/15c83811036c1625fea9dafcb671f4876ab5eddb |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2b441790cb0508889501c946d5008a1439eef650 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/08367eaf70e84185bec6c33ac0501d82458d491d |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4aa7baef768dd2121523dd7144071eea2d3cef14 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1d1087a73808301f1689b72066fccc6843fe5db4 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e1d41819c67199c00e958e187e26a11351179859 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/656407dafe3bbbcb541e2851ade140b49077dd31 |     
   s390x     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/0129a25310d34ffcccaa5e3b68fef42ecdf46f3c |     
    i686     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/af72e6ec9aacca6aafb6042babc886a331ecb07f | ORPH
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/4b0da264ec4f3b4c359391951d3dff3e2f0da33c |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a24d005917db10060f2ad0a05f3c822820730d45 |     
   mipsel    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/ff43847616506df3ce7a46f4628e8fa37d1fb4c6 |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/fa6b7c82cfa6bc3676b2089d78fdd592c3c3f9d7 |     
   nios2     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/bcf1d8dcbbfb4bb605acc5647409878eac1f0c1a |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/8f4e51ddadce32eeb60bcafc03f25d9aa5fd587c |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e09687584305b67112111ccfd28c86428eec2100 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8244351b32ff2876daab15435bf550a533392535 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f2ae26a92514bd8e89293c1c070bf55bf8317e69 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/03f88b1562899acbe7726a93c42cbd2ff5e2c619 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/6fb260491d9c3c47c88252502011d4bda4131516 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/7ab802bd5588fbb68cdcbc3c3886190213a889b1 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/70288844507a4c32bc953473838aafef8046fc6a | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/39a3a4654f64dbf952985910d581c6c52a0732b4 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/23a1419a5b9d623a0ba66357be759bf103eeb9d2 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4cfe29ea67aed18753f9e27a27fd92e10f423231 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a6764b4f8f7b2f94fd234c425d895b5b59545300 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7590175e2f110eaf4dfe2a17bb73e798e2a9fed1 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/762c0377259205c5a385ed4b2a1d97223e4c7220 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e863153b048fe6bc44da7358562f0d885dce339f | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a0a150dd2f7045875052a8a9486369ab5af8afe7 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/54616e011300c6247a41b190047cbb3895b9f311 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0d1c6e45cc98b7e7e415d5a3d86f4689701ab68c | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4eb61654b47fc35194df97fd23f19089010f0366 | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a79ababa8460af8e2b674f7a48d975e0765ecd3b | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/3ee143d456fc80a90a8839a1d134802d92d4d0f6 |     
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/0a2fb5505b74324277679457daba5ea44ba2a1f9 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7c22aad3faa8b6c61f539065c38139ae95450bda |     
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/75f4d8f4f0584088f016009857f5a082e42919f1 |     
    m68k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/991b4cf7ff4a4c1fe4ea1a844c9b9e8e45951f79 | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/dcde51835c6a8d621231b80eecfa18367ccda8f4 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f4923d13b19723e726681d34d9cc196a4e8c66d7 | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/731edce5a9092f5915f7277e88b0000f5411792b | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/e21e6ce16406a1169d9117f6019469e636912ed5 | ORPH
    arm      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/18376949690570d31dac2c74c9eaa75d78da271a | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/277144ca32b3d9f8d4b91b08bc58606d09fb518e | ORPH
   sh4eb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ca559bb815a1b7eec47baefc874b61640c761823 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d2f127ca6674e9e810a9dad8e22a0a817dfed232 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d162d0300bff08f631e90150be08c233f98d0829 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/278e826100c09be148086d64a2f455cd9c1268d3 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/5370a03d5f5498adc3e22642ce0fbaba450483bc | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/722f9d8360073eb089b797f8172136e9ac8d2583 | ORPH
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/03ae4a22a3d2a9c6b08b4b5c6d06a07a6a075ef4 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4690969896bccd8f5ef19e7b632467f9346ed569 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2e186ec516479a3a317778dda6d9c72f4caa3179 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/49ffb97d098eb5efb0acb209c8ae8e6e49a83787 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f25f9842ca0f6d20da8dfcb19ea86a9b5ce520d2 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/05d3cdb23d5c86ac3a352f5964d20dfe7f7b5e54 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/09efd5ea43027cac4288666aabad9fe5c03ad699 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/bd1dcb570ac5419ef453e86a14f380a0dbcc09d2 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c5b14f9bf027f1da86c73665f7f9180f93b3ad3f |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/68148d2f83633f3fe5b8b0a0a627a1e80e4bd3ea |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/21972e299b6f0c3b804fa9f2f6c287b21be6244e |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/88424505bb34e0b27ed2c83f95cf0cdda1d97e78 |     
    or1k     |           mtd-2.1.6            | NOK | http://autobuild.buildroot.net/results/9d7dbfb5e16b0311b0a34484526e3b55e5be8135 |     
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d416abafb1884b117d8ab5c3ac9cc940430e949a |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/82ca08df72a65d45b26a6b79f50dd7ba1a5d7352 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/79a3584266f6f38b15e91de7782220641556bd8d |     
    m68k     |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/1c2bb95d6fb40b6d339a2effc49e50b777e07242 | ORPH
powerpc64le  |          octave-9.1.0          | NOK | http://autobuild.buildroot.net/results/118ba45fa7d0cac88fe6c4c02587a574ebc50e89 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7e900c726a2842653d9820683a3d25f0af86003a | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7a06cb7216c6f4ce592fceb6920f51368aa99a1d | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/9178ccbbecbb121bb65475d0a672fd31ce542046 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0d860b8ecc9d340c8b39645da0a6b6fe6a662e6c | ORPH
   s390x     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/2fd8db5e889256846533bd8a82e6bb4f03ee55bb | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8a5bfd8379043c14ba7dfd5f73f9084514b68dbd | ORPH
    or1k     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a9b7626b4ac20bc1eba9d2a84ae1119871a8a434 | ORPH
 aarch64_be  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/20d89a9bb06b7a3866fbc6e45fa7376f96c4d0a0 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/bbca453f39ac3b3544a47e276a4ae9091b043eac |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/00dd4d060537a779061819a4336251cb05db5c9c |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/3c84939d5dd9f9a8271b805a126906fa04cb52fc |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/a3d41ae4a74ede3f9754ea0197f842b4331841bb |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/165e682d8320abf9e25e1838c3bcd870f36860ae |     
    sh4a     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/291fc5608dc4a3be233b2f40064604788d928137 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/75fa6370e250ec40094563cf961817f9e8a813bf |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/fae12a68446af9d0404512cbebf3edc1059d9f3e |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/03c0da419ccce9e31ee3914ba734ece78cce41f0 |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/390476f855f0c6cb66c73ed979893ed7d92b1ca4 |     
  riscv64    |           ruby-3.3.1           | NOK | http://autobuild.buildroot.net/results/705227590c287f84d52ee953826e11165245b310 |     
   x86_64    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/d9ef01f2afbda562838cda8c30190337249f2889 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/e6a38999ee34c99df6ec58fc1fa41651d03dc49c |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/80146d4646c233e3b8d2847ee54a5113a86259f1 |     
  powerpc    | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/ac370904974cc9533febc355820e239548c375fb |     
microblazeel |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/376a44fe99ae7c219d07ac93f2b8648cb19ca5aa |     
  riscv64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/bf1c377e4e549d8d0a671b32a36c7abdc4dba6a9 |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f7c97f55860ff45c357e919fee65c2a0b764bf9f | ORPH
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/376a74f9f33505440fd473fa751e6e7e7668c565 |     
    sh4      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/107b6c31965e5db8f78a1ad2d666885e268902f6 |     
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6207d7badb5c75b2e5db5d618028b8efb017d2c4 |     
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/fd679c11c706f561590b9e4098a9e9c39dbcadae |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6044d258c3149e3f0aa9d4931017ada6e2aae974 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e494f839cb474a0b65ff51d954bf88abb7c03b6e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ddc73cc408babf1a4233a0b0c4e85c5daee4ba3a |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/acc96fc67b00760579b67257e2170ecf00598d08 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/51e9be9ace268ee21cb0a12549fb6886f19c8ecb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2090fc759e5fcabd9c14d8ab94a14a350c94dd56 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5ed54ebbb48114f7dc8a24f15ffadb4b1708ab73 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/36c8f578a8d33daf0c1afe5728d10aa085334506 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/2aed4f85d100a8aaebbcaab3c1747308d635f837 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/11f742b0c37e698e16bbc1c42be4f102fb9fb428 |     
   nios2     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/c1848fd0d4023eb3711715cd89517ec474634082 | ORPH
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/b32d227739026a05999b3350c7fd3000bdece93e |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/71d864d62cb82c267ad509a6ae1d1a4bd06904b5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                apparmor-3.1.2 | 1 
                 dc3dd-7.2.641 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                    proj-9.3.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/878f11605ed10e096e14cc6d243df1571b34fd7e |     
    mips     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d746393cf68d4c2257adebda806f08c0f522b647 | ORPH
    arc      | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/c9fc9b9ad79d982c788c0ae9cf76b94967c939c2 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7848b345ad8fb96ebabc4a0e419ac52efd3e08d4 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3e0d46db800b1f9e5fcaccb863359c14d4ef3668 |     
   mipsel    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/3b02b9e1f4494db487d676c4795045d6ddf2a8dc |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/02bd5ef32ef06e93a3d97b740ca393381c46ccdb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
