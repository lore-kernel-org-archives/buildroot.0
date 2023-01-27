Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A4C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 06:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4CEB402F2;
	Fri, 27 Jan 2023 06:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CEB402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XawNS-QCWk9a; Fri, 27 Jan 2023 06:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D34A402F5;
	Fri, 27 Jan 2023 06:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D34A402F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D35081BF3A6
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 06:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A62CC402F5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 06:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A62CC402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DL3ha132VuwX for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 06:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D55402F2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7D55402F2
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:44:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1174FF808
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:44:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 06:44:07 -0000
Message-Id: <20230127064413.A62CC402F5@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674801847; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yH/qwoU69J0IHOKTMaKt5K0PLUrdR9yOmZoqw5juM2w=;
 b=ZV8MmdmkeA/d7tjt1e+pKsGgQODT635icH/TZviuqKM8Hn5oRWsFzc6G2KNNwIxqgmWi/7
 e8mqvYjII7pn8x7kiMwy3ezalumyo5ecEGhP5cLcDpWVypZluyGhqdGXscak0g+bMKCeGm
 ysXFXM49lMO5cyQGIOG8seVa96mBfUhoghuTAmXwLQIodWilMa2rOBs/lFCPN31btIlrZG
 jE4XXwPRXA3wk0AP8LQ/HUgRAT1Mvu9WFD7cSxqLukYgZwGnBSqBG3miRbIA8lmAbBphTr
 TXQdioVrlunn/w1XHqxq0VRJ9xb0FFxaMCW9AwEvKWiQ2IE2bm+lFjEE+CbqxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZV8Mmdmk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-26
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

Autobuild statistics for 2023-01-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  1  |  0  |  9  |
  2022.11.x  |  4  |  0  |  0  |  4  |
    master   | 134 | 212 |  1  | 347 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 21
                    fwup-1.9.1 | 19
                   bash-5.2.15 | 16
                  jack2-1.9.21 | 7 
                    opkg-0.4.5 | 7 
  gobject-introspection-1.72.0 | 6 
                host-go-1.19.5 | 6 
                  xxhash-0.8.1 | 6 
                     xz-5.2.10 | 6 
                   gvfs-1.48.1 | 5 
                   linux-6.1.5 | 5 
                    pixz-1.0.7 | 5 
                    dust-0.8.1 | 4 
                   ethtool-6.1 | 4 
            host-binutils-2.38 | 4 
               libcap-ng-0.8.3 | 4 
                    bat-0.19.0 | 3 
               libglib2-2.72.3 | 3 
              libostree-2022.7 | 3 
             lirc-tools-0.10.2 | 3 
            python-bunch-1.0.1 | 3 
                 wolfssl-5.5.3 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                     gmp-6.2.1 | 2 
google-breakpad-c85eb4a59b6... | 2 
            host-binutils-2.39 | 2 
         host-sentry-cli-2.8.0 | 2 
          linux-5.10.145-cip17 | 2 
                    norm-1.5.8 | 2 
                  zabbix-5.4.9 | 2 
                alsa-lib-1.2.8 | 1 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
                bpftool-v7.1.0 | 1 
                  delve-1.20.0 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.22 | 1 
              erlang-22.3.4.22 | 1 
                  ffmpeg-4.4.3 | 1 
                 freerdp-2.9.0 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
         gobject-introspection | 1 
                 gocryptfs-2.3 | 1 
                   gqrx-2.14.4 | 1 
            host-binutils-2.37 | 1 
              host-rust-1.66.1 | 1 
              hyperfine-1.14.0 | 1 
                jailhouse-0.12 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
                libselinux-3.3 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.5.2 | 1 
              liquid-dsp-1.4.0 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.3.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                 nerdctl-1.0.0 | 1 
              open62541-v1.3.4 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    php-8.1.14 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                protobuf-21.12 | 1 
           proxychains-ng-4.16 | 1 
           python-numpy-1.23.5 | 1 
            quickjs-2021-03-27 | 1 
              traceroute-2.1.0 | 1 
                   uhd-4.3.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
                   ulogd-2.0.8 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                    xen-4.14.5 | 1 
                xenomai-3.0.10 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/39123b316e83e16be48268dc47b4f1cea806e79c |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8c640b222561dc69e4afead0553284c3248ed3a8 |     
 aarch64_be  |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/67ba6652a5f014da151ee18dc0d212763a0949d6 |     
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/19f4796c2f8c2488e5e86d853160d8bfdfa7c740 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5a103a92e2c19800716a8eb376e0a0f6f829c4d6 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/26d2f807adf0d29d044c1813385b4cae6feb10f5 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/72d77dde56a9bec7e2b96fcfda19c3daf9df5894 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6465ab3d900c4075d4571140aac4f19bb64f7301 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e7c99e062abf162ac7ad993df0900df7c2debfab | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a2ce8dc749988c68272feaf1cabb0df32484c8ba | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/133ddcbc37512e6bcc5daab669ce316efa7ec4fc | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ce58c3e0e5a4655c70eaf84d3c75a559ede3df1b | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/854473bb73ade32fb7f1c82f5a25600102cca6b6 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/70a72df45ff29452528f006c20331bc47b8462e7 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3c7aa0aef3bfd32e30b8785b5b8127711f8698f4 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/99cd6c3177c6bb568ae5859339510597c91bccea | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6d8e0af0496bf6d89a5bc0ab6852931850414525 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d7e5bf1de8c01098de3190cdcc3eafe75a9bf253 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0d0a9d99ae5bba12daeca4ea946519c3c5af0070 | ORPH
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/9261a4145e946518ef2ddd7f75640559217a50c8 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/03c9578d6e92e640c82012ef8b27200de46accef |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/79c5d957a0ccdaa417154a18382ce6e63dd6baee |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/e78e33e07170fa8382cd10994df73e5523a16000 |     
   x86_64    |          delve-1.20.0          | NOK | http://autobuild.buildroot.net/results/aebc45a2ab04a3a952b227ab99acef30a0007b2d |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/77ed9372d363b7d00d87041fbf04bd02cd217520 | ORPH
   x86_64    |      docker-cli-20.10.22       | NOK | http://autobuild.buildroot.net/results/26ce9e000fe37547cc718f6d3b06152c37612121 |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/3b23321ba56fee2c9222d542c618b9235fd9f04b | ORPH
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f6b3758643aa4c299f9b68b706767a7437ce7e4d | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d38c06d8af5beb379e8613e6c864ac0fc64814ce | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2f080d213781df4e1c18c79ef138cf95de19d26c | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/a2d1fa12b4a73eb67f402242402436c487e562c4 |     
    m68k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/94a29c415927e599f460f3a04cd6e41c0dae577c |     
    mips     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/71a2231d319b2dbeef6f8517a75773cb63fe6c72 |     
 aarch64_be  |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/adfb792a6c3693b6a3314e6232e3891c6efde25b |     
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/76c5951c6bd733f77a3bbbea430e366bd6731212 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/9a8c5d267214ba061f7cf57fe28e34da5fcb65d3 |     
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/3c43f26996cac1aff5baba8a30f4e817896d4241 |     
 powerpc64   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/0fa8135dcde6b16f48f206b0c69b4655a0cf5cbf |     
   mips64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b6bb820f9114c147c5e13d505d08886cb61399f0 |     
   mipsel    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/f14c6c474a97d1320d895b9b099f0500847d0d4d |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fa0b941b02ddcf17ed948c3437211582ab1f4405 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3989c55859f26db65f68cd4b58259aff568dd08c |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/61120e1da65dbe9c8a92f14f498cf66159ec8414 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b4797929514c57485c4d3a56dec0589167beb7b8 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c6acad29d57ce2fe8d1475b7fe30efe53e15361a |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9ad5690f88cc7acc0a8c4c85d1d24eb88eaa6293 |     
    m68k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c5de41d3a2f5d1593c076d3c09ddd28b9c79e911 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/74bfdf29af4c41d6e37d548be228ff6f89d542f2 |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1a0d7b296ab99bff7629e91ca5f4b9f8115427e8 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c4ad901a8e1e5e31969fd3f06caf13c5853e8067 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b51f5a98084704ae56c1a45c3235cc251a4a2ba7 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9e039b7e7f3263e8358a2afdd1e1f60be8fef1d3 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ded30d305c5ae3d206061049676242b479cf8e1c |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e18becd2a09bec7649dcc785b11172c973776158 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/418df82e72f5a20c07312cc59a0262d88839680d |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/285a301cd985439df59bb5dbfad20f7bd9e88f99 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f932476539cf694faea080401e2afc050a282e58 |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c0deaa1bb95443d5dc5f8cb0d3cd62d45db86f6e |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c48c0fad330f692785d0b5d08932bf064b5246c8 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/29ded8d0365af57da708b5af5066f263aba20495 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/507333d1de21300c68de06fc6805184e6fc0e22a |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b9d895c77a60cd29e42e9865f291c1d5abccd6f2 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7d6150a3965acb5b83e979affb4db1d17107f900 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/76b720f1e85eb8fd12c20af9698e351a1f9ee830 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/40a7a99c6b646e27ac91663daade2fd40caac8d6 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e2e5bc1f7cff8537673a1b42b7c67b170e75229a | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/f9d8177b7dffcc5acfca98c2ee0a277f644b1fc9 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a8f87e5e59d210d48ac4dbf72a6aea28f78ca7f9 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6e97bf4f5abee45216d50b0162d85eee858aaac2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4057e0fc697eee094be551f917b4252cb9c0de6e | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bbb447822900cd7ac3c27acdf48298e4aeadeae0 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2bafa7ebaa2c395280a82a6cb4b58b9ba2975ab7 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/728a7824321747966793ba2843a1efccf46450f8 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/056a68bf3eb97dea9ded868e080471400e53fe4c | ORPH
   x86_64    |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/56f090bac8473e49e759a7d094942d0768d986d7 |     
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/a644c3395b1b47023b3a34eea9992ba74c71e80d |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c616649260d052deb5a5e5f289614d6835515637 |     
 aarch64_be  |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/aa4edee2cfb671dc5c6b0e55cfabc964a608ce49 |     
    or1k     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2d5c431b65aa06bc4680d016f0db5ac0cb51582b | ORPH
   armeb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/e405dd183e7366932a1d5b081a01bf8739368dd9 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/f4092ad63d251139a4e0dbe6a19405f5ef27b611 | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/76d5c3a304ad94aad267377624de01bf366cefe1 | ORPH
  powerpc    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/feafaf5679189e7361ad23db0990262804ee9fd2 | ORPH
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9a6102902cd5d854bc4608e5c53474e3c043ff64 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f1b9a7bb42c50804c93feb7f320ad8fdcbb17966 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c0ca174307c410a5b707303f4ceeff0f4549c742 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5b5818e5ff6bc04f107bd4392cb35cff205772dc |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/637bc7bcabaad935d298dd5315131e7d24f99cd8 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0d15e194b6528be07431c6ddcb04da4d55da73c5 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/35ce495d0775ef03aa0157d95c403ca507797557 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f5d84f9a1e6545aa037b7c3991046be2010b2dd6 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5e77cdb811126a1f86a78b2f7ee2b6c6856e9c73 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/db7f64eb6cc9681373c3f4cbe1ad5a3ddd89ec43 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/667f35cabc9e6d733fa2d6bfcbcbcf80daf3cc0a |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/db5e67b005ec8be91e9670e4638927b2d2ca4548 |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b57175d74f67995289c48da519de3822efbb974a |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c1a8094b2362aa9d62c9e501beb8ab754f66a872 |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d7073b93f346de5af19248f38f440a01b86cfef7 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a4dd989132ca1178ad2b40d7ebd4e13b2b3024e8 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3dfc39603f6ee7a945cccb8c819258ff5c52393a |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d28403852b052bc65811c7055fd951bea0868473 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d095416aa343e13e8cabd3af6b5ecdb3513b713 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/20ceecd35a32a537b57399bdc54456cdd162dcaa |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e0f0678fa65390f2e7a5bd9f755684bf286ddce1 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6d34ba8877e33d6b1b0f5f712b4715161c428199 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c0bab87f744ed6290a7d294985fd124289527462 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/39eade23805e68c2a4a021cd85f57e74d00f3d4d |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7676f1cb736b3d36ac62c006b02a7b2946c43141 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/beaccc6af21a8417073b870d6169f25b03990d62 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2c1ea501226534a42314b725bbab1ebd38bfd78c |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/30f624c3b9875ad24cf241cb9f54a996a0e71ffd |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/ac1a0b97ebddffc800f4664ed9189b6972023789 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/2beaa602520c5d06e91160d85e804f07d1d132b5 |     
    i586     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/833d71d16e1c0491d0567dfe3e4a438cf06e022d |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/d5ee434a268fbdef12f0cdca5e4ef005463c2106 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/31bdfeff69e080c1f1e27af18b327f491422b94f |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/61d9f632283f2000fc54404eac91be9e20743b46 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/e6f87b041dec4a01c558dbd56091509ceb91c6d0 |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/507a49d7a88429516fa0cb071d890ca2ef7a7a72 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3280e2b43b5c5355cc34a04cab4e01001b5e9891 |     
  aarch64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/6330c8d943aa1709b8c9abe54b17426507274ac9 | ORPH
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/721cf389753c4a4f26fd8902d5f7a644e84a6e31 |     
    sh4      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/534b356567ae24eaa23dbb309721daae3ad0e569 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1f103c8488ec87b54c948b4c2e3f1cc1dee7bae8 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bb6d0930e934b90bbc4a83f878def256b3a5025b |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/50e08cbca6318f67db5306158fc82ac65defe354 |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5aa4a01bc8027487e3d3dd233d80a6918b5416bd |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/81ff56c1cbe36f31722e0ff6be0814abe6f103f4 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/b0b0ea5e834446c4378d4f0d02ea8a8d00374e53 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/19bd9ec72473504b1c91e4aaeeb3a95aa168bcf5 | ORPH
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/2a1769ae3d9ca253846eee4fad823bce5c28c3b7 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/0b5b53952fa1191abf3ac815b7f5b9459fcc3711 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/70e2767c65bbc92fa9570dcbb9da43924026244e |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9b12f0cbb0dae64283558d477f60eb7387a153f5 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c410c233eb37a1e95f08bb91c33675d058480e26 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7af2a1e9c640ddb205b52e12ad084665a661a574 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/48b98542bccbe64ff6fc76409d76190496a4bd50 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bfa9f026098cb539df4a4ae53cc757fd1450086b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a21bbabb0d03ea610e93a2988e772ce58793bf9b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/41278cc4c536767b043b04fb7855a9274972c27f |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/a91e490a8dee7e9969ad7d9e200b5be22f199aff |     
  sparc64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/ec502cb35a5960be8a0384d01fed73aa2cfaccef |     
 aarch64_be  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9c2ab3735b401ad002becddb4dc82cc5b90ad29a |     
 aarch64_be  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/97e9e0cac7358de99106cd8dc692fce9800d0ca8 |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/166fb0c2860050c7aae56fed89c917dbc416f574 |     
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/fe5dbf136153e9beb5f61853d1f8912a9a71590b | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c3a6458559bc6bd97c69859c21ec5a7b6550fcfe | ORPH
   s390x     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ecc4bc6e1de281481a89501f7eae035451397de5 | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/070d629db0224b1caf5d0ddcfb303b35f847ae3d | ORPH
    m68k     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/fa3520a96cccbed56722865099cc16a1862b957d | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/8f7d20619f3e4f796832c6ea421d6d955761b819 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/8a7458e52cae6917d9669678d509c660d1f4628c | ORPH
    arm      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/52efda8c2dfe468e296c6668e31c3e211ce651c0 | ORPH
    arc      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/0a6cfca756f150fa786815d5dc3d1765fe2433b8 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/83a9ecd4bb0f59411fab68609a58c9be45dea31e |     
  riscv64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/42d895f0f062f3224b3ccf73e061eeb857a38846 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/7916d650f958a64a0ea5972163090e932d9df549 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/8dfc1590416b739fe7ae7b9e47c55a667e326db0 | ORPH
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/77cf371500660f0e1ffd815a8e5b5a2527272149 |     
    arm      |         mesa3d-22.3.3          | NOK | http://autobuild.buildroot.net/results/4acfe9849156dad9363d996ba822a113bd69886e |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/bb09c9bb39650b30c85a6ab4c57a1d57a94f8931 | ORPH
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9d8919a170e18fe4dd3eedca613079e61b3ab2d7 |     
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8d10a770019af80192868f83e7c55d755b5a848a | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/91a0c32f670f187a6eed2b0b8d73056953047b2d | ORPH
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/be09326ba2c36c95e4bc65571af1f74407638161 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/8e6cf79a8c4d0fa4c79f202cde892cd4d1163207 |     
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/149147da62e8a530391e8461b76c5a81519c1f19 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e46b148e42507f59c5bc4b6725c2c9d578b9cdbf | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fd15d920eb46578267fb7997f3b025f97c8a3e34 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/bc72795b4c57369e042b4ff3490a5b7c7c236bbf | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ad10963f9f50582952c9f6deb166aab1f0b31e15 | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d9a42a7cac3c40e04a151cee6e53ef3daf8ccc01 | ORPH
   sh4eb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2aa465f0a2309b1f65e899d6edf68f140fb331d1 | ORPH
    or1k     |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/c4a1765d502a8fc633e5e7061c402a140faa2ebc |     
 aarch64_be  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/d7cd398a5e82d86ed683afbee6b28432f938cca4 | ORPH
    arc      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/0c3a5d46f2dee38b6b536bb6a750bc4e45381e99 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/f541527a0ff4d884cf8739cd30bf7af96c75b1e3 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/367ef8c2a2ad6267522c6672e19f4df5784b546e |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/dbfc98c00e2012c4be31a5b5869076271ac426d6 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9382222d7785a0268cb906266b66c0de3936c437 |     
    m68k     |         protobuf-21.12         | NOK | http://autobuild.buildroot.net/results/bae8a956761a5b2d25c4347cf4c49f9dc7166024 |     
   mipsel    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/6ad1897c4adbd6930ddf7ec21e71fcd9eb1c5e06 | ORPH
    sh4a     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/57a67950a2a53714c9d37dc49b9c63ade655618b |     
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/cdbe887f6a328af2c2016a340e5eeeea528b17b4 |     
   s390x     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/7a9d90c406a25a78fc551265c8a841a19009dd69 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/d751dcfa69405802a7caf82d6a1fc4311f5176f2 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f9956e4cc0e5b3962e81e640cc13434b45a0294b |     
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d871260861e5f001b1dcd7ba8557b105f02735d4 |     
   s390x     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/77a46fe3505bfdb4ca00f1a9971b25bda258646e |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/98c7b67719ba87477436555f669eb1f144b8cb76 |     
   armeb     |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/b069fd42a29837952044c0694f49d142e6d88cca | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b3d31263aad14939f7e76ba1b885fe392131d15 |     
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/61fb89f4ca58917a04e297305810505b8f965367 | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/47c956ae03f6378016257847c7809cbd2b29af75 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/aa0bb2ef582b64c94e90ba85d247a6999998b861 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/8f44244c9c0d1c692080a4854d545dee121f1b71 |     
    arm      |           xen-4.14.5           | NOK | http://autobuild.buildroot.net/results/346d40073df25975ddd2654ffe16540c8b06ebd1 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/be9b57dddfeb766c0ecd951a81a389db7ec56091 |     
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/147f907d7223e262ef148ae192040abc740cfb57 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b004a372ac93e783f38d1677e030c0059a949093 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b68795915b9755055b69028eb1f7cdc93427d32d | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/3afbba6ce91a7ba00cba7354f49563caeda2c8f4 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/8b23bf9e0cc7d961b689ac9f66ffbcd718ab6db6 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b84a5bfd077e95285fd25eb5dc7274c6e1adf3d6 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/24e38c0e3b9c2c55f0c18f2fa6b577aada267f3f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d206e3ac11beaefb1efe2a00701540da82b4a111 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f1d38c97ac9e634dd7afc282193610467e37c3bc | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/95256c6ae72c9c6e784f145dcd5fe3d7c23ab4d9 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/80f357f4eab5770d2781bcbd0455f60e4b89efb1 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/222f0e7ff741fe587afa03418ac49fc5747f3fce | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/6f458c3e93e1fdcd874d1b5b3c9313f44e20a794 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e0f5da265f9f067764d8a636968a54d74dec7b8c |     
powerpc64le  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/b3b0e83f6d0d8278b5586b2478ebaf8a5376188b |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ade16ae80babfe2e4985dbc618583091fde090a8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
