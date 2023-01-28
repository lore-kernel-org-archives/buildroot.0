Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F01C27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 06:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F66403A7;
	Sat, 28 Jan 2023 06:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F66403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VIOaX1TtT_C; Sat, 28 Jan 2023 06:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B41404C8;
	Sat, 28 Jan 2023 06:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B41404C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4BAC1BF424
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F449404C8
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F449404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bHll7LlIoUm for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 06:48:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 729D7403A7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 729D7403A7
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:48:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34AD92000C
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:48:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 06:48:00 -0000
Message-Id: <20230128064807.6F449404C8@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674888480; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d4a/RrBXwf72lv4fB15CVAX6KiXrVBwP5GINDDj45k8=;
 b=CGtTqZH+EXg0BaNkTe3H0GrWZ9L5fwdBPUMCbJUHzx3TlQLKXS16b9OQWYGOCIVjj6JoNA
 DIfo/mqGuaQzg5BVHjE5H0jHrB9Lm8Wbaqh9WbY2AAi8wCIm/m6hzm6modGIr4DlpvWtYQ
 VkyOonz/VDDhF12fNrR4z0QeQmI/YrODqKurtfLqXNCTjYiKAPAQVuLTge1C16Ya8gl982
 LBfdB5lAn/ODmmaj1eEud+b9SP5rfh9y7/W8B6mXLqIzJs3m9Mnh0WDYye4dbU4kC6XAI7
 Me/EpmYI6z+O4tQLW9ko+K+j2CnBcxiUYaXTOQq+ISZB7j/nX5abUPKsu5ozkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGtTqZH+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-27
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

Hello,

Autobuild statistics for 2023-01-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.11.x  |  3  |  2  |  0  |  5  |
    master   | 122 | 227 |  1  | 350 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 18
                    fwup-1.9.1 | 17
                   bash-5.2.15 | 16
         host-sentry-cli-2.8.0 | 8 
                  jack2-1.9.21 | 7 
                    norm-1.5.8 | 7 
                  xxhash-0.8.1 | 7 
             dahdi-linux-3.2.0 | 6 
  gobject-introspection-1.72.0 | 6 
                    pixz-1.0.7 | 6 
                host-go-1.19.5 | 5 
              libostree-2022.7 | 5 
                    dust-0.8.1 | 4 
                     efivar-38 | 4 
            host-binutils-2.38 | 4 
                bpftool-v7.1.0 | 3 
                  ffmpeg-4.4.3 | 3 
             libgpg-error-1.46 | 3 
                    opkg-0.4.5 | 3 
            python-bunch-1.0.1 | 3 
    python-cryptography-39.0.0 | 3 
                     xz-5.2.10 | 3 
                    bat-0.19.0 | 2 
                elfutils-0.186 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.72.3 | 2 
               libgtk3-3.24.35 | 2 
                   libnss-3.87 | 2 
                   linux-6.1.5 | 2 
             lirc-tools-0.10.2 | 2 
                  mender-3.4.0 | 2 
                 openssh-9.1p1 | 2 
                    sdl-1.2.15 | 2 
                xenomai-3.0.10 | 2 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
  binutils-arc-2020.09-release | 1 
                  check-0.15.2 | 1 
             containerd-1.6.12 | 1 
                 coreutils-9.1 | 1 
                  delve-1.20.0 | 1 
              e2fsprogs-1.46.5 | 1 
        edk2-edk2-stable202208 | 1 
                   ethtool-6.1 | 1 
             f2fs-tools-1.15.0 | 1 
                    flac-1.4.2 | 1 
              fluent-bit-2.0.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                   gqrx-2.14.4 | 1 
                   gvfs-1.48.1 | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.0 | 1 
     host-moby-buildkit-0.10.6 | 1 
                  kexec-2.0.25 | 1 
libdill-32d0e8b733416208e04... | 1 
              libgcrypt-1.10.1 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.2 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
                    mpv-0.33.1 | 1 
                 nerdctl-1.0.0 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
                   perl-5.36.0 | 1 
                    php-8.1.14 | 1 
                   rsync-3.2.7 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    ruby-3.1.3 | 1 
     s6-portable-utils-2.2.5.0 | 1 
sconeserver-8d1935919a20133... | 1 
              skalibs-2.12.0.1 | 1 
       ti-k3-r5-loader-2022.10 | 1 
toolchain-external-codescap... | 1 
ulog-0389d243352255f6182326... | 1 
                   ulogd-2.0.8 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/edeb7d97f44af5c847fa3350e268b819de5657f3 |     
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/66619ebad9e2110bbfb893037a98204bb0241894 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a9f4f2ea0a0590f8219af3ad162c031aaa4e84f3 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/08fc496791b2c0f0a95ddeb639dc57d32661c922 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3c0cb10d3480386bb45091b3d4ed1bed4da4f463 | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6641ff48eba0987f8767b79804da281ac6884a78 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9d4f9cd4c21e68e89f63692173229fa727453963 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b7c50171cd8f8395def6220e6e5c4d0677944bf8 | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e3526e335d841c7fbdace534dc6e455aa7651e27 | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ad0ce94c2f7f66b1c60c4dda7a3472b0bb03ad0b | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ec11dfe085d03b8231ceee3725f80e1523693fb2 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7d289edb242d0a002a3cd7c2f2857c8a4897284c | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1fc92d044304824c0fbfa52ae5776e72a390d34c | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/949d08d0c0407107e47027a4d53a269d3182fed7 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6cab32c33c1b63b38755ef156a3b384046d95256 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e728f68f3f0add890bc83bc3df5d73eb100b3c69 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/acc6b1bce329b68255dc5f900a68d60de8588bc0 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8ae70cad6c5815e700d68957a2a63e61171bd165 | ORPH
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/30ff0e8202c8fb85f6871bfb0b97218ecc79060f |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/86c170f0beb849a73e4ed4567a3611e18c3845aa |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/8f8d2ce920455a18cafafe5b238999d8e3ed6964 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/29422b2987d943ebffef410e56541bd35ddeebfe |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/74be6581a4fda79ec691bcca9bbbaa1cea6a4600 |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/502144dbad910efdb133370d8361abc65228a797 |     
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/4cbd11a78a0ea1d6726eb7e8d7ef99929637e35a | ORPH
   s390x     |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/13f1668327b0ffb15cd1c5528c9cb834ef02a61c |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/85bc02054ba02403b9492c4a532e6c181334b669 | ORPH
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/1b51103a3b0115e6c64dca7b9e59ffb9acc623d5 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5db2c18d0c7eef41188a519201065f12d7302a1a |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e373c942862e17c84390a28e0effe61adfe6c368 |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/6ef0c78808b1dd5a2347cdfbf8f285c1f6b1d483 |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f2602f13a3dd37e41321d74356427716ab579658 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/2f6b07c540d57ca972665b5b0b93a1c5b5e8991e |     
    i686     |          delve-1.20.0          | NOK | http://autobuild.buildroot.net/results/1f56753a77ee2662972ce98b5aa82adf9cef5da9 |     
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/493ee545ec0346716ac24593b74463c726adc8c8 | ORPH
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6df68aa5d65ef68a00d064fed2d4e06f90e7ddd6 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d21065300833661dd6bcdae1f06c5d21123e9c19 | ORPH
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b7de63409adfb69026bacb7c4344a4b1da54a245 | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/a4e1e8c123bb45826166a74ec67b436ba9c8926b | ORPH
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/56847a1b7a4bdcc2d63e05e530ff54da370bd1f6 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c3e093c74c30289df7aa7d89163dc0fcb509c813 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2026146a0ede4b173f96185e8c6678fc945339bc |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9a17b2acc6f564328604b2e728f22519087e9cfc |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/02e618bfdf435b7c13f2f9e6ecddf6db7a4cbfec |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b19c70b531319fb19ceea08a3d8a215ba1782f87 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fbe08307434544c13a1dc0ef0af915d7fed0be52 | ORPH
    or1k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/b4c76ead933de3989e97b565cddd00fb25660c7a |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/cbd31ae9c9b25c72e669b93429f6361b247124a1 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/7e6b6620937bd8422c25e3f21a08a31393327eda |     
  mips64el   |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/9c5d7bbeb42d6b7854eed8e4943777d161eab426 |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/b90c68e6ff68a2903ed95b9d5b458ac8c7e0ebbb |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/db1656f3e8f2b11a5cea1322b056ff93106303f7 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/9c5ef3d59ed77e7e18ace17657e0e669735aef10 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/048a36aac9c1cd755391297563dd4ea92d82fc04 |     
    arm      |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/9437b9d4cbe167df75920db74ee4f3ebe166af2e |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ae56113880e988a23c9a90a362b610ad93cd2ebc | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/bd2dd1e2b7a40d6202034f6b4dbe29b43ca1a058 | ORPH
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/92c3c5a70d1ad7c5047b64737e1df262665c750b |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f6466733243d1a8f42d2b0a34999694a6daacf69 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1fe66bf817232d0fbf4d460691c7df70566e56c8 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a8a6cd987a52163bc166448cd43dbc7f99271749 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/80de7e52d121e49ca902067f61417f32f57752dd |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e903a18bf0a597470ba707414e845a906cacd1ab |     
    sh4      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b012962b897edda8b581616abca6f9b83a87cac4 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8c2e8b537d1fc4f0a7138bce752d32e56e7bb483 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3cd1c4c16611284825baf40185a2529bf7ed30c8 |     
    m68k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4c144a0a4c72585be8483158f7e96be62811107e |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/01fb6e180b08ece27c747d3e831ae7c77cc4b857 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0cca363073d8dc7c954f80134e34d11fd42b4554 |     
  riscv32    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ad55afd32e4a177b274f79fb88ea420e460b8b9b |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/11d7474461020c2d2e7b03161038fb79110d23c9 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/29d28dd745a89142786a8cf72783a2e57d615189 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c5ab009c16fd38738e86a4053fd3ab14e6e4b027 |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/70dfaa00b66d0d51c7454909e7dd06cf0da638c4 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d979401d804bda927350a25d07de34159d51f09e |     
    i586     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3c629a902fc038d8adc326f381cb42ea6c3f07e7 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dddc4d01aae09cc551cdbf7223eaa7251728eadd |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c9f29d663b479bb0b535d5da99c49b8afb06de38 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/49b193529bbdfe0c095df5916fe4e8d07f43ac63 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4be5f47c30f298503fb2b6522ef7a9d4720e1680 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3af56d351a97fa56fedbfe6f8bea978a99065194 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6e047960e8d612511c301d56c7e0bf284320f881 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2b34beba3630ed72d617d01b6f1dde6101986fdd |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4797cf5858e1f81976e7e42bf1f769219f6e0d61 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fb2dd1ccfef8e9cc7a4fce1b2f8b414379be44af |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5dd249e56d162c1b592c3b2435804b2b28c28822 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5cfac77be7d52788d345cb0909fc61dbe3d31ad6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e0b4f9505907cf0939e781fd7b6d7ccdc80f0f8b | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2c6e7d75b6e5c7583a600ce92071904562e3b587 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fa54f699403b72e16663230d1e360aa2d7df84f9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6fc01e088721b91ffe01873baddae4e174500b67 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bd447ca6fa5aca3842a0f18fc15b8d87bd2590e2 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/1ba0102748028473cbb068566e9b9f54b362bf9d |     
 microblaze  |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/cdf1a80bdb08031c56bdf306c2879e3fc99f8d24 |     
   armeb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/e51a0ef9c9428106063d003629cdeae16bb3760d | ORPH
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/18aaadb1569f6528f125a268d11153ce80117501 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c926ee1c93e5ecb2ef112f564902cbff037d24d8 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3902394c0c23eaaf412308ddd6bd34bc06ffd94 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/328fe9e878116bb566d93d355e1ad1e4c5708dac |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/39f0ba7e1bb657a2366e71fdaab88b8b81e65b66 |     
  mips64el   |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/6ef5af6bedc0aa56d7cef7d3aaad73b125375740 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6d70e3e1fa2f4b20e38ae47da1898ac851799f5b |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a0a57e08e1a2e773847cbd333ee740a5303cf8cc |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/622f4500d25e1f96eee8efd90b3131a69489da07 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/094035e1f40f7dd642f7f28ac792ddab25d6f927 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9969933cf8cd62c7c181fa8f934bf913c9f2ad2f |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/341d69fe265cd15dfa68e4e7368ab2bffb978371 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0a3761ca85774ccc73600cb8320ac56cf9303a22 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/90280bfd7b642afce12e4507d9d728bd8fd2b2d6 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/90d847c0f74050578b17e23c6e8d5efa013da344 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/da7ffb26565319256c83925b625bd9099377b47a |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8e4fd3c5474ab02c35c9788214bdea2dcce8b1d2 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f78f642144256d9cd7be0dce410d73c9c9ca40ed |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/db912cf6b2934c1e8697c3c6238448306bd094bd |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/159fde8c8f475584dd523df766eb1b6885bb5ced |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5b29198f5771c68fb359c7c80a6eb401e06cf65b |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8bb4351ade5a507a409b0bdecc50e83590a7ba91 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/20754254689939cda6929da04385c57d61fe5a3a |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dd048f338445a50bca064f0074d89d0ac842d0d0 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/8bcab9878f0fa478c65ce580c044bb735da141d8 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/9a6562f5e2805af6e035ec3548d876fbbac42521 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/be28789b0fca1b328fbcba7d21b3fb831bcd13e4 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/b8789afd0271706d966f7a14e741237443ab7cb7 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/642cffd1a7ed3fc6362ad2188eb2dc37f13b72e2 |     
  riscv64    |   host-moby-buildkit-0.10.6    | NOK | http://autobuild.buildroot.net/results/4f3685f50d0a8e407c942cc0f065f0398b40c242 |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5ccf6800bfb8a8a57ac11e990333018ea8c43ce8 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2e22d5e1e93f4dc0fa84bcbf8977bc3a1e72edce |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7beda22ad5e269b36b4183530e1ccff3b8f9d02a |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9415458efacde22bf80edec68e0dbb6bea515b06 |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/359a16c694cca100ee8d895efbac900e43c5305e |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e8b7388749aff13a174cf2f24110cc6cb8f06e26 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/42fe33a3e5d003431c7d95062868d48c99a6004d |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5f5c9a994371676a8ac25acb37c33a2e22cfe9bc |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d8d5ef0c6baa3266536523022c0fdce58b37fb57 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7ee0d14e1dea6a1ee400953afd8f7a684353a8d7 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7a43a03e4dcb149f87a9cd976a752f8878cc49d9 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b213d24d844c128868298ab9873bdc33e5ccb323 |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ad2e40478e9dd417b9bcd4e47124932dbf50feec |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3c9a12447b580472765fcfd200668873b10a2c73 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2ef08fe7785cf054c210aef8a4ae714ab23a1d7f |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/0937242ad4c2b724576efa7cc67e3be8ab8ae510 | ORPH
  mips64el   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/eb23aa1a8cc4c4ff87bc80a92e452874964f41f4 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/30d1c16384f47ae4e221ddeeb81d3373c2f52cd3 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/5850079bd86f3dbdd68b9c94f69aa5b46fb71933 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/92209ce239d5ce5cf638d478ebd3ac1684caf184 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3f39bef6a90507851542f929f0c7c1e6260c1254 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/01c7df6b166bf95f22d509cacbefe700e7ca65b5 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/539adcc63b704b190bc00278190919b2d8953366 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/559efbcf944668935c10292126d6fc155f4e09cd | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/068b1bbb3c40e573dbb2e2b7cb41c0621afa3eab | ORPH
    arc      |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/0b8b3056ab2f6d550aab47fa9280888a4f7f8167 |     
  mips64el   |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/37c7db88622c93f1c58aff7431b638143ae741d3 |     
  aarch64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/19dfec2f5fc6997409ecf52b3be29fee0d745ba1 |     
   armeb     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/2adb89dc25d90cfde31b0c35fae8cda35595adcd |     
    arm      |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/020f7c4646823a0ba1c6f49d351d1f88a7b9441c |     
    m68k     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9a916ca659cec9ba3581ac181a121982cba747b8 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/fd483da624eb3f0ee7ec4a4fc017869ff0a0e585 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/88d805d68f15f90c2a764610c727b2e6bad039cb |     
   x86_64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/a841920f0b611ad727ddd7a256519a6b5e8de147 |     
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a5c85f62472d1777640ed2785d91011c2ed09270 | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3cdc77ae609d65a5d067b9c4bfc68d2207c3b3c9 | ORPH
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ccf77d67c44aa980a9e9d791d662314486d91793 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/8ab6c05365b711089f2209848b1a1aa548a50786 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5f5e66d8774033054e785c71b79cc8858ce5929c | ORPH
  riscv64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/7a955c6813b5dd2cccc46eeb6315ea7c3a3a9587 | ORPH
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/6a8abbb31b3bcdd406e0a2f42d89fa15391ea9f0 |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/d6d1ae9afc6b66d1f33776d98594804e167b149c |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/bfc650a6291786c7e27c9a469c6ca804ea0cab09 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/0bb5ffba10bc0a4a39d938c1d1344554859db0ae |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/012c6f6a2685da9302834b4383b3ed874e24e26f |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7beb284e9b7675cee781facdc185d53a45d2aafe |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/56b19beca3cf669678172471707de16fa95592a5 |     
    i686     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9d01fa6eaa351d206bacdbede5cec49325d23d48 |     
powerpc64le  |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/ab87c5e14568f1e2a2b085458b5193e88b2f9051 |     
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/603ef488d11aef21fcf6d45a942e7bce0c42e7c1 | ORPH
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9f8c66b0c1f94c9d6f31a2a01142630f75114039 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/90d5cffb54882da2707bab7f0b7f2d7f67a8971c | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3131044c39e4dda6e62e86c71ec529781105de5a | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f69bcacbe698698ca0bc2b51a899f30cd663cf03 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b8647fe3af7a28672517c14321c272a91f99e5d6 | ORPH
    sh4a     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e65be22c46c9d8c8565bdf1d690c9e6943f06209 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/fe52599fed70df8474d4edfe59d204e3bb38ba99 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/d7193085f0b2845e08a5f3db8832f1a8da883778 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7ca3fa8979576e9d8e5a63ff0e7ed94fc6dd06d6 | ORPH
   sh4aeb    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/bfb394562495aab533486c73e8c86a61c193b3b5 | ORPH
    sh4      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/920cc8828a69629be08f539cc2be2d815f2c6049 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4795b4cf774ee0a438dcc3833553006254abedec | ORPH
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/ff6f81e2562075c7be6423d8a65699d3214ca8ad |     
microblazeel |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/67c96555418de5bd32f59e603bcb9295665093c6 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/de5a9494412c19c123d48311d5698a457fa657dc |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6f8b0cbb60c28605196d7e0d963df7638553e5f5 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/acc86e620abb4202e462bcef0e85d7bcbc27c88e |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/02b87fb21f7a3bc81be5d3ceb9590dd44f481357 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/10612e99ca7100fb723f0e5fd21d2514af3a4462 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/996bc685d8b4b5b8264c8beb04705b72f385e561 |     
  mips64el   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ca59f95ef3a2bdf1a39fd5c73fbc717bbce17375 |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/8652898004cdfcc1b74009585b67df4a2efb82e2 |     
microblazeel |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/69b322ac7236d3bb4a686c24239808117ac69d77 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/f9471556fdbf7fc1478b7961c2fe6eb692a010ff |     
   armeb     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/b5b9af530f49036b5e42ad6697386888ffb670a5 |     
powerpc64le  |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/3d026347eb91fe682caf78c39432ca16912fec0e |     
   sparc     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/4581301ea48e81d7f5ae23ec9170d94f28084750 |     
  aarch64    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/52bbe6c5fc241f48ed7eeeb99cf283b6f073b5bc |     
   mips64    |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/542cc1ec57df90ef47ba44533cd6e217aee3f91e |     
microblazeel |   s6-portable-utils-2.2.5.0    | NOK | http://autobuild.buildroot.net/results/0a46af213f0c773cf61dc12cfdf705a83cc48678 |     
   arceb     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/be583b786cca9b6744c1d72f0aafb627695dfc25 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/019916a642006ab2ba20e937fc43b108e759b325 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0cade98bd4f8bd254d4282e6178052adff5c7ecb | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/56f97cd8d4709972aee8f9bffe70195980fbe2ab |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/d01e8efe26a10124406c87b32bc7be59d9df98db |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/84bad3c4076ef8b40880e2866a76f5f91a966686 | ORPH
microblazeel | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/283a285451e91c5eaccece203874bdd65388b889 |     
   nios2     |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/d4f1b5df98f30ac38d6f7b9612fa2243e9ea037f | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bba0928ae34020112fdd23913dc2c5e374019346 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/10dfa54b09c4289dbcebeb5f2dff41df41ff3e9d |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/638f880b3c47825808e97d73bb8fd3acfa020ba2 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c8b8bfe358c8393d68e0846d4ce8628c62ed3ac7 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e42be5bb1346a03417e84ec84666f95841f5dff4 |     
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/0db6273b9963fa1d6fd5dde81159736ea17107c0 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/282fd04198fd6c8006b2cf2f5442cdb90fca7f07 | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/70a0587d2658494fbb09c718582bb575c125234b | ORPH
   armeb     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/edba7fc4e8f4d7efbf7c250e1c2468618bfe00a5 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/c91e290712e2398d65f15d92bf05b27841721766 | ORPH
  aarch64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9cd4c5ffc98be0452403215ca508cc3be46c025d | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/084248321ce746bc22d3ff7e2a3b751e6bf4ac8d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a8123148ccfa8e128ac1293827c0e8e00a396e7a | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/79a72cbba284c429f62c9a89533900969834d5c2 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/12a8e58760ee906e9d7d1bf8e7c7573d328acced | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4b42027c6c6025ea20ee4d6a7a9d6ac0ee52d004 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/57a37db3010c9100ae2c943fef790576e990aadd |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/f005ac20c25816b86b8e738dcab5b6c2598d2b81 |     


Gitlab CI results for 2023-01-27
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363104  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363106  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363108  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363111  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363115  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363119  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363121  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363123  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363124  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363158  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363159  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363160  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363161  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363162  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363164  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363166  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363169  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363171  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363173  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363176  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363177  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363179  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363181  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363182  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363184  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363185  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363187  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363189  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363190  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363192  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363194  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363195  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363197  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363199  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363201  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363203  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363205  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363206  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363208  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363209  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363211  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363212  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363214  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363215  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363216  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363218  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363219  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363221  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363223  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363225  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363234  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363235  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363236  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363237  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363238  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363239  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363240  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363241  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363242  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363243  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363244  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363245  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363246  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363247  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363248  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363249  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363250  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363251  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363252  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363253  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363254  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363255  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363256  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363257  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363258  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363259  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363260  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363261  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363262  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363263  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363264  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363265  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363266  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363267  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363268  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363269  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363270  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363271  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363272  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363273  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363275  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363276  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363278  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363280  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363283  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363287  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363290  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363292  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363311  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363314  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363317  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363319  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363322  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363324  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363326  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363330  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363331  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363332  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363333  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363334  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363335  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363337  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363336  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363338  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363340  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363344  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363346  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363347  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363349  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363348  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363350  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363352  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363351  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363353  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363354  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363355  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363357  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363358  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363360  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363364  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363362  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363366  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363368  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363370  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363373  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363375  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363378  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363380  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363382  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363384  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363386  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363388  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363391  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363393  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363395  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363397  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363398  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363400  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363402  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363404  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363406  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363407  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363409  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363412  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363413  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363418  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363420  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363423  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363425  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363427  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363429  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363430  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363431  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363432  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363433  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363436  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363437  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363438  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363439  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363440  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363441  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363442  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363443  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363444  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363447  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363446  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363448  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363451  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363484  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363454  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363459  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363460  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363468  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363465  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363479  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363483  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363481  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363489  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363487  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363492  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363495  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363497  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363501  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363503  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363506  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363510  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363512  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363514  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363516  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363519  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363521  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363523  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363526  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363527  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363529  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363531  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363533  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363535  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363537  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363538  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363539  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363541  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363542  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363544  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363545  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363547  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363548  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363550  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363552  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363554  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363556  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363558  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363560  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363561  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363563  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363564  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363566  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363568  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363570  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363572  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363571  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363573  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363574  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363575  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363576  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363577  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363578  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363579  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363580  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363581  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3663363582  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
