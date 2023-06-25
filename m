Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7299EEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 04:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA44F4174C;
	Sun, 25 Jun 2023 04:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA44F4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVkVopiAks20; Sun, 25 Jun 2023 04:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4BE4176F;
	Sun, 25 Jun 2023 04:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4BE4176F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B20DC1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 04:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751D081E68
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 04:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751D081E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AA8h4noyeffh for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 04:41:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE16E81E65
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE16E81E65
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 04:41:52 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EC2F1BF20A
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 04:41:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 04:41:49 -0000
Message-Id: <20230625044155.751D081E68@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687668109; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uUUJX9XtFjeA04UinxfSSW/ZBhITAuPK3oxXp2zxfjM=;
 b=Eun3aE/FU+asZtnkJWkQGfG4ikwMFZIf7A4gPonRqwc99+Vykl1mrA1hcyVu1g/Pvc+NHe
 V1O2IfKRIfvopurcp6U1ZHZ/FZTLvcUC9wRitOgiaWbLNWIKcTY1iMyxGmLJC7ixuuk+Vx
 w6lnE7DTeVt5mQqj2RL9v63wQcQrDOuI9nAqtxg5zi0yO/5ppLLSqHAzJMQJvf4gkCSh50
 5E7nzJMAcz0rwGVXJ7TWhnXlXNmoV6VXZYn2OydgKNk8dxC+RxHS6ciHnPjtZHdeMMSDPt
 qlFT/I9Ki5pSvrrtEkDwCPqR+OqP10wp52dn3vpfMkjakha0fdad5XrqLLIomQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eun3aE/F
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-24
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

Autobuild statistics for 2023-06-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  7  |  1  | 11  |
    master   | 115 | 144 |  2  | 261 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 14
             host-ccache-4.8.2 | 9 
                 raptor-2.0.15 | 9 
                    strace-6.3 | 7 
  gobject-introspection-1.74.0 | 6 
               host-go-1.19.10 | 6 
            host-binutils-2.38 | 5 
                     audit-3.1 | 4 
              host-rust-1.70.0 | 4 
                   trinity-1.9 | 4 
                 agentpp-4.6.0 | 3 
                elfutils-0.186 | 3 
                     gmp-6.2.1 | 3 
               libglib2-2.76.1 | 3 
                 mpg123-1.31.3 | 3 
                       unknown | 3 
             dahdi-linux-3.2.0 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
         gobject-introspection | 2 
          libedit-20221030-3.1 | 2 
                     lxc-5.0.2 | 2 
                petitboot-1.13 | 2 
               syslog-ng-4.1.1 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.23.0 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
                 coreutils-9.3 | 1 
           crucible-2022.05.25 | 1 
               ding-libs-0.6.2 | 1 
               fftw-quad-3.3.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
             fontconfig-2.14.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
                glorytun-0.3.4 | 1 
             gstreamer1-1.22.2 | 1 
                 haproxy-2.6.9 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
      libabseil-cpp-20220623.1 | 1 
              libgcrypt-1.10.2 | 1 
               lightning-2.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.4 | 1 
               openblas-0.3.23 | 1 
                 opensc-0.22.0 | 1 
                 openssh-9.3p1 | 1 
                   pcre2-10.42 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
             s390-tools-2.27.0 | 1 
                    sdl-1.2.15 | 1 
                 uclibc-1.0.43 | 1 
               valgrind-3.20.0 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/13bcf7c07a94026bdc3d5a5fe5f94c1c46b63ca8 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/bce2851610f51ecae565e2c5abd3bebccd689bed |     
  powerpc    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/853937ec844fdf7a488ebaaa1bcc51dc9cb5480c |     
  aarch64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/7f34f7cc954fea3b91d07fb4b90e4491a14d94c6 |     
    i686     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/9282e74352b1353df581e688b651807842f2dfa3 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/a52ff08c3373ffb253b89e9197671583354d1360 |     
    mips     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/f20f740e5588bf0110ec8f69f637e3087c279db1 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/0256ec39aca3c95371d58b55bb7b35abb37ef839 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0eb6122df00276b0d0cef52b4ca92bd1b986c38d |     
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/c3c88212bc7db44ac2cabcc31be0616375d7f647 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/09a744130898174f52e2998cc6cf4b925eb197a9 | ORPH
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/b92f0d225407b830a51f3bdbcc0ce452d0dffef4 |     
    or1k     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c29b7a89b9ee79bf67ef525140fcdaea378f3004 |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/fa42c0ff2944719d6f2f470170515ef981797f96 |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/464239321be6b6a8de3e5b5fb77789f701c1e955 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9d4c159d97e1c0451cd4b239452a52a92b7d1505 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f508a83ee402b60fba93a9ca9845dadb45e40c94 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c307d5139299f60adffa3ab9fb9acae91fce6f3b | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/bebbfa61731c1b1eb6799098fbbc7da40c169398 | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/8b60291b7eac5352861cdd9617d512b3cf196c10 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/82173b5ef4e19331f09c0b3113d6e8d0547e1167 | ORPH
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/414cba9ba2855cd4df916e69d9d68f187a432fd5 |     
  sparc64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b87fd263ec6561378af5f2e516ac3528f9caefaa |     
   sparc     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/1ebc8bc93353913c70d74a71c435cfbc3aa0b21f |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/04ce259229accfa0b4ee231b230ba4b6aff5505e |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a6f66d4ce9a29ba856b01b13027cea33fde1ed8 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7b11be5b529a26da277a07e9e0b2a54f9e68ab4a |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/afd9618bc703f36ca7dac21aa2cc61a46775f544 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f115a50debaf3472ac435eeb680547f4f1fdce5a |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/fc0bd10c8102c54810798269d237d5816f5665be | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/0b50f3b8a335ba7c53aebe4274c2fb85961c2216 |     
  riscv32    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/64b2ab39f19268dfa4299429dacbdf5b98f9a8ad |     
 aarch64_be  |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/b30b8d75ea4608f97ea4cb41ba29e5547f7e970c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8e73c21a65dd8aaed970caf37fa52ef0795aee8c | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/5c5098dfb6b9a1588db98e62adcf951501a3e300 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/df3355d43546d86fc605e490226f42e7f77ad583 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0a9aa6c67c47f3ccf5db56f92a060d5798bb551d |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8e21710d8c621973730eb7816aa5406fb6766d2b |     
   x86_64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/7918ea41ed18ef67c46b5e1a45330e6871b91050 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/08ca9628c3a3725b1200ddf9ac83243e098e4ec8 | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/cfde49e314930c6c62795eb7d8b8e55a7540e8a1 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/e1a7477713f852ed76a0e92773f119d3139ac27a | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/2396669fdd1e599c12f497db0543396ef8f9ddac | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a348222d537bee8f9767c22ad02cdf92fc8e5a97 | ORPH
    i586     |       gstreamer1-1.22.2        | NOK | http://autobuild.buildroot.net/results/692ce3bfbebfdc40002f4f53361c2a953d577e4d | ORPH
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/f92dd8e4015e49b01ab131051e054c3b60b300bc |     
    sh4      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/fec686dccb6694f16ceb20473176d1e228c0dde0 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/0ffb433e87cd7d5e076113e4130f22c71abf59a7 |     
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/fb2d471d36abcdca4c7c3362a274c55745187e0f |     
   s390x     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/86fa0479567dfaaeca8ad53239003dec79d5ff10 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/cf0757dea22aa951acbea36d0b6c59469789e522 |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/014415718d62206c49ca7fb59c8d80a65dc397e0 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/36c2d5cff902cf5dfcc07dde47fc6c842506a680 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e70178b328bdd79dd08d0337e0f32068ff44e723 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/641b1398e12baeb3a914203d173e66b025f54236 |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a9d5ca0e3228dc8b7ee554d79da6c44a38feee3d |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/88d4dbecc0446751edde6dc68c2e8f56f41a5986 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/9e4d134336b6ab0b85c5fbe19ec07abdf0142b6d |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/432d795bb981ca8eccba47e1cf153bafc523f8d6 |     
    i686     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/f6b2256bc35f10e1f8bf714a671b3d16c2f60cae |     
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/367d335dca438de981ed5f0eb5b7873af14b1b2f |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1b71dfe660b645b141de33e49267a5e07e60b4d5 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e786eae1b5ecb9e3c0774e5245493ebf83335030 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/63265af75276a6729521e3470f99f5d1afe42077 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a180ead10bc260f2cb6323fde8e3afd1fa7329b4 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dcb6f20a7aab7f74a2667051a0b1dba21c8d3e38 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3877505483fa88308d9b2e3a1502c0a5cf5b6d84 |     
   xtensa    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/b43a0ea6571d4f4eef4bfcfdecd59813b22b19ea | ORPH
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/9b6d338e90c7b08c984fc8c1547e072b65af81d0 | ORPH
 microblaze  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/290c574a70ecf76dbe95f3b3bf895340ea3a8e6b | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ca60761c97c2c8ae2fd1798a6635a1ce64f4fd9b | ORPH
 aarch64_be  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/37d1dffaaed207e13619c4b71b5e06e5a790b3a5 | ORPH
    or1k     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/505e36ce5b0d575717abfce4334880e1d7ba3fc4 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/c824de8571e638efe9ded8792127925ad1399807 | ORPH
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/78a7d2ebc597ab010c45842b9ee7ca18a68b16f5 | ORPH
    mips     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/924174516d7df608aff2fcd9f0de42c7f8fc4d75 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3918c91fa2875357ca87a1e357ae777c6b9ba5ae | ORPH
    i586     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/35f706781b9621a58bc9e5aa73dffc64542001ee |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/86f530ecc758126fd275e6474de4eed920d1c60a |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/e3bf3fdf79ea28d3d9d2526e0c09d4af3fb8c2db |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/27ed20f990dd17fd78b63955975cf574a2996270 |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/23d8c597df86d8e1e526db2c4473de03b264235d |     
powerpc64le  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/df3b59318db4cd14c67ef98f3716566a57e2639d |     
    arm      |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/45f0fc3b2414bee57eee0a979cfeac31da6bf338 |     
    i686     |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/bac31223734e14eeb254d66b4905f99c6a7236c4 |     
  sparc64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/da8e1dd671d5b0c2c2255397f15fc93ac8f59e00 |     
    mips     |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/4737e8226a1889954455a1a464fda8ee80c7d790 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a590b31d6efeef96d72d29b76b9c7a032b69f2fc | ORPH
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/83a450f0e34aca5b133e195eee8448900c49335f |     
    arc      |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/16eba2b916ebd4ded871007bf8995a9e34b30f87 |     
    m68k     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/eb6d0ffb990126666d48854bd22f84d344672b80 |     
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/60c651e272bbc43ec8a430b41b9e1ed65ddefeee | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9283c1fecd6ee914d105db35029b22c5fdb4c5be |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e3051c38af5766f149a570da566157a0351e924a |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7acbc3972f6606fd49325453e6065deae01c71e1 |     
   sparc     |        lightning-2.2.1         | NOK | http://autobuild.buildroot.net/results/e036b3da6e9e2f7badb6d92b0bf3f1ab2cbae539 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3b86b60c33e8f77caa068700ceddeb67cb867566 | ORPH
  powerpc    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/3da9d243fee13443e3c82a657d93e5b72091e18c |     
    mips     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/b36e4ef46ce11fc821b2b94528111e259ebd7078 |     
 aarch64_be  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/8c8d2c0ba5fd375fe586339750fa954854ecc42d | ORPH
   sh4eb     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/65cc6fcb729ffa091f7ee37f3633b8f63edd701b | ORPH
  sparc64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/1103066a360975f15d4ad30880c876cade3d93dd | ORPH
  mips64el   |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/601044467e9b445c505bba05f9a95b57609585b3 |     
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/37b007799ecba7a593bfd6cac4b719d7ca6cfc41 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/26cb066ad6b6ac376e1731ea578e0b3cf39b481f | ORPH
  aarch64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/a3d97bfa91dbde5002de993057f66f475a73561d | ORPH
    i686     |        openblas-0.3.23         | NOK | http://autobuild.buildroot.net/results/4b7ae72c3644f10a2da3741eb7e12fa720a0cbb9 |     
    or1k     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/91318abb98146dd967115ed6233949daa60d8bba | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/8af036e3d03f7aadd2e038e9bc3857a2f6ec370a | ORPH
   mipsel    |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/becfd7e6f58d176521031d9923c5700a4822252b | ORPH
    mips     |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/5c8c0f483f869d0a53f4efd69c536dca6b79dc43 |     
   armeb     |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/caabd750a757eceb8facd83343c99c09b5a13b5b |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/3a58e78efd08f5a597539f593750981561eecfa6 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3b1b1f91998bfdec65f3e6fb8931df9c8871b953 |     
   mipsel    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/1ad025a36a1c9962f5aac030b8be75f69af08216 | ORPH
microblazeel |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/15dbb8730d2df79a0227b14496a7cd3ff62e0a08 | ORPH
   s390x     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/6ed89f45d16fda2b8cd1e86649cfc9f22547e2c0 | ORPH
   x86_64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/5a8112c4f61b191c8c2a0577302cc3acc81c4536 | ORPH
 powerpc64   |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/3137df115d721f93459b4ec6adf97d2105c7b917 | ORPH
   xtensa    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/073162d3794f2fa9edf135eed3cc534eef38c7a2 | ORPH
   sparc     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/f799db5ae80e6517b836e0ec5440211ee2e462af | ORPH
   s390x     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/261078d08dce285e6957e26b8f796509a70c94a7 | ORPH
   nios2     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/1c1fe568b4a34d70c8e7c1d8f8b00ed3eae1c517 | ORPH
   s390x     |       s390-tools-2.27.0        | NOK | http://autobuild.buildroot.net/results/64e8bea98fd4b493066cd97648f3c4f4c253b634 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0af6bc96cdb240ec712493ac00d2c834a9d1307c | ORPH
   arceb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/f2c83cc07c92d68b96b9a63699293c3c1bb38e80 |     
   arceb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/18b619c239180491fde69ea2c6d7a12b82aed7f8 |     
    sh4a     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/ed689fa2a8657fd6a4c71a88fc0d0cc1f34eeeb1 |     
    mips     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/c14b10b848e09cff82d1c96a759937d851c854ed |     
   sparc     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/85815454d64bf69618267d7e3c772d77bd45d6a7 |     
powerpc64le  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/ee2cb46431c47c3b017ca07d895e44f747a9ee69 |     
   sh4eb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/077a99fbf182bc6e1658b44f1c81f01659467b77 |     
powerpc64le  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/daf7cf647b7d289178f1dd1ad3049915ba9200bf |     
   mipsel    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/89704a57911e1e520c6227fdac08b4bfe67ca6f0 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e8f34a0521e1fcaa44737a919e51a9cc4311c03e | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/26727f6f00b293847f9b26b31429979433566880 | ORPH
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c505c3d82e208dd7563006b99c4d8bf3bc558bec | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/fe72ca354d635c2ea3bba6c1d370eb551f9b0a3f | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/bbaa819eddb72b2334afecaceff1d15b3f3a7c10 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/864922c268879ba316786dc103e99e4d2bf0a439 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8638445c01feaf162f430c1a5ef980c4d8ca73db |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c0e5a43d6a8b247f837ad519fc540d9afaf077c |     
  mips64el   |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/fc579a203012727cec0b24abe5f85ec2b8122194 | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/23403543ac789b60a05d0c37785b16fc6ab78be0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 2 
               host-go-1.19.10 | 2 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
              host-rust-1.67.1 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ad29e35da8c44c611aa5b3323c3b0d2db8f7e1cd |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9ddea5e13233acf60165f54faa9dbd3eefd43ae4 | ORPH
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7383c02a967bda6491d3c3f46457cad7654d3a4b |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b742fa9e2abea72ea63bfec09d9883f78ddc049 |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/1e05bcc637baa9b8e22c91d72dc0257f339b419d |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/0bb6ccb7a03b8b8ba4eaaed96f4dbde1111820a0 |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/8e4eb3dea6aac8dcacc5dfd9a996ed8568596744 |     
   mipsel    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/c50a0d678c4428ee2c1180de9568f9af4d78de6f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
