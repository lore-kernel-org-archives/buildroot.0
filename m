Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF00BEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 04:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E26D834C7;
	Fri, 16 Jun 2023 04:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E26D834C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kp6QbF9LuJ4K; Fri, 16 Jun 2023 04:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268A2822F8;
	Fri, 16 Jun 2023 04:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 268A2822F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 988371BF30C
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 04:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6826F40194
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 04:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6826F40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uGW87O1_IRv for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 04:39:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B95BC40135
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B95BC40135
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 04:39:46 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCB4560008
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 04:39:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 04:39:43 -0000
Message-Id: <20230616043948.6826F40194@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686890383; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nfj/XM+h7apf1Y5+HSHqmQOEMP1Wdn6vg9iCnQ2TJ2E=;
 b=QjC4rh4R5w7fZThORlEQ354MpXGa8LLHkiEqgsA5io/gayLpR449vwYIO2nEAcy9aCFQ1g
 4pAl4+VykksxZGOiZtOhnnv8XcfYxn0PAzTk6uYjPvDcymA7e0uns1mbgunQkEfafrVNoW
 6U061/YnDmZZg9DmTxaLaWjKbRNvS3r4NGa4tDxEuk52EnieaR6MZ9KZVFl0d6qSC35aEw
 5c9Yn20uKo6HcSBIcVYJWcZE3FdE+ilQUU7CuVe3urLkmH3+uwTwW3dM1rEEGTOIExRvTC
 ARz3y95ziQyzGUEMoLy8HZD6qUHFtk/iswwzuIBkcGQ1OGtBKTIbUPQ6mjVa9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QjC4rh4R
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-15
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

Autobuild statistics for 2023-06-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  5  |  0  |  7  |
    master   | 76  | 44  |  1  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                    strace-6.3 | 5 
  gobject-introspection-1.74.0 | 4 
host-gdb-arc-2020.09-releas... | 3 
                 agentpp-4.6.0 | 2 
             dahdi-linux-3.2.0 | 2 
            host-binutils-2.38 | 2 
               host-go-1.19.10 | 2 
            ocf-linux-20171122 | 2 
           uboot-tools-2021.07 | 2 
android-tools-4.2.2+git2013... | 1 
                 coreutils-9.3 | 1 
          dfu-programmer-1.0.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
         gobject-introspection | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.37 | 1 
              host-rust-1.68.2 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
                     pv-1.6.20 | 1 
       python-stack-data-0.6.2 | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1afabde9afed753ebce79e1970a72e272d77f139 |     
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7702476a3cb79487cefafdbf2debeffdb5065b08 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cb44b39dcd2d520c20c9dee9c377bddab6b053f1 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/04dd90bf35d1ea1eb1cf5819a99631493bb6170b | ORPH
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e8b8c55a482a3ef87183a2018eb167bf970b2f86 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5ab57c5577bb5929692ca3add48cae2464e7595b |     
   sparc     |      dfu-programmer-1.0.0      | NOK | http://autobuild.buildroot.net/results/d38d617eb663a3477a8f17eb50711d20a179ecb8 |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d4a362fe5973209baed35b2db6de304fa55daf92 |     
  riscv32    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/923c9a5296cc6d0b9692daf047e2bfde0bb97854 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/359de3c332f6ccbca528c144b980d98f6f6adbe2 |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/87f4327906711f751c508ac0c1e0bea5e9bfab0a |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c30281390a4b6f034b39c622753d287cc7c186d8 |     
    i686     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/5fde899cc8e4bc338498c1c10d2177b3b83f593f | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/4aa0a1fe4b1688217d77f39ab9a211f63effdeec | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/79c93dc5e8eb35f015bc3afba4708df4a07a2a77 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a4e44dbd49a34e29a769d520bec7721abc7984be | ORPH
    i686     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/cd9c1d218755c01a9145fdbadf10e6f0920bb453 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a089f1b113081e631d13242904b920f4cbb39fad |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/87af76f0026a500b2904bc714820386b958dea27 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/221c9f5e266890e2ee68b4a0656626a91506a37a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/00e60a359022333b004599ba80dd6734505db944 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/32e2d1d0565be09452ecb10f4bfd03d770b4a079 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b56df99300ba3db47445526fede0d0f1a86d392f | ORPH
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/da0d815334478710986fadf83c4232713d543afc |     
   s390x     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/1b1b94c38e90d111eb1ab83e622e16bf306a4f8b |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/fdc6b2a3edf88e1f0912420d0411783deffabab8 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/3db0afeea672be6f7b83a89e887918733e100e3c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/63fc3b6a4be5c0f7de8a9caf0f7bfbe5cdece6ca | ORPH
  mips64el   |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a578bbfe8fed6eabfa03146c80f1e1d565802bd4 |     
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/10765d8e982d934d470090a0798e71f7754e9ed1 | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/68a5d2a07f6960c35e801a1e7a5da887c8ed0a19 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/723d7dde873ff86a3486a61ac4e639fd12dcb97b | ORPH
  powerpc    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/158dd205552c08f4f5b941ea47410b2846c48c7b |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2bec0e4ce14a279b112ae4afe785c5fb8b7a8f63 | ORPH
   s390x     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/005125b1ec8c0e4a5c3e384f6a3d139d1a315a65 |     
   arceb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/848e482974506235f41888b7c8483a519abb3580 |     
 aarch64_be  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/fc6a9b03368d64e1a48f8310f46a0935570c1fa2 |     
    or1k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/894b6bcb7d2ccba1a6082d19cfe22015e176b9aa |     
   mipsel    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/a50aac38faebf2669b03440a782530f8b68077d1 |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/9a2684a82d7beef30ed3542987f385deb75b207d |     
   mips64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/58156c039722414b1dc17512535b62d49a4965e7 | ORPH
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/65cef0a03ab4ea37d11819ae63481d67efa9cf83 | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ac072b6c9c840e4adba40b72965a57ad115211e4 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c3ab218ba08c7a9db0717df3fa59aa33aae5abe7 |     
    sh4      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/74bf942dbf2546a729176b265c15c1cf488bd5e4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  binutils-arc-2020.09-release | 1 
               libglib2-2.72.3 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    olsr-0.9.8 | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/5e3e8680e226797b93e25d707d041ad9efb1d290 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c84d0a96d940a4155129548ef76c1b4e81bcc401 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8a5ed0ce28e38bfea139b0cc0c4df31b7ed9efae | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/78f4615adfca83585c1ef0906ebc25f884d3a2c5 | ORPH
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/d210935b683c578a88762a7f0be715dfdbf2bcc4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
