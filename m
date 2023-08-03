Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A6EB64DD
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 05:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE69C6124C;
	Thu,  3 Aug 2023 05:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE69C6124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTF_vAIXUxBK; Thu,  3 Aug 2023 05:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B234460BDA;
	Thu,  3 Aug 2023 05:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B234460BDA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10FF51BF3E8
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 05:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B4BE40272
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 05:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4BE40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv6itwd5LeMW for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 05:35:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4A6541D9C
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 05:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A6541D9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2501FF805
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 05:35:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 03 Aug 2023 05:35:43 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230803053549.2B4BE40272@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691040943; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EbkhAHQ3O6JCOdGEQjSzYCnIhw8wtTZucRSV2Cj+EfM=;
 b=dQBHAwT7EREJF/f9WLeI4vkX+DMVZa6ABHfJowAMkMEmg9a4TvSkUZheLlSTjNU7m8z/kE
 ZJoBhfSZxuDvEHXNYjFPso9PfRb91M1KwJIWOoVaTsFjRSBa5D3eP74CzF3qhIP0gae77H
 E7i8BfvUbTs0pryMGH8tXp7pXo5F2tCzdSnIqVFp0a9fKF1dAfoxklDMcx2KrKgJuD2lAC
 9DJ5D3i8x07wEme4eH4UxP2SIlwPIKQ7fMvntPFE+5lRWAC9/z7zyZVtvhrSUh/mDUwoZA
 qJOS6CrjO2ypSwsAKbYCv89M5Vaw+XTz9XI0t3uPtebKLCFJa6iwp0JI56la4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dQBHAwT7
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-02
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

Autobuild statistics for 2023-08-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  1  |  0  |  2  |
  2023.05.x  |  4  |  2  |  0  |  6  |
    master   | 56  | 53  |  1  | 110 |

Classification of failures by reason for master
-----------------------------------------------

         host-sentry-cli-2.8.0 | 4 
                  check-0.15.2 | 3 
  gobject-introspection-1.76.1 | 3 
                elfutils-0.189 | 2 
                host-go-1.20.7 | 2 
              host-rust-1.71.0 | 2 
               libglib2-2.76.1 | 2 
                    liblo-0.31 | 2 
                   linux-6.4.7 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
        at91dataflashboot-1.05 | 1 
             batman-adv-2022.3 | 1 
                  cairo-1.16.0 | 1 
                cracklib-2.9.8 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202305 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
                   guile-3.0.9 | 1 
          host-elf2flt-2021.08 | 1 
              host-guile-3.0.9 | 1 
     host-python-maturin-1.1.0 | 1 
                libgeos-3.12.0 | 1 
               linux-pam-1.5.3 | 1 
          lttng-modules-2.13.7 | 1 
                 mpg123-1.31.3 | 1 
                 pango-1.50.14 | 1 
                    proj-8.1.1 | 1 
       python-stack-data-0.6.2 | 1 
                python3-3.11.4 | 1 
            quickjs-2021-03-27 | 1 
                   systemd-254 | 1 
                   trinity-1.9 | 1 
             util-linux-2.39.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/68bf2291201ef1882d8e8d3eca2b1a5ad731e4b0 | ORPH
   mipsel    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/dee6d2bdc830d6c74109f5a4a80e407de54f3ef5 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/488e5680cc7dad59791bcd8caceaa819157d3ff8 |     
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/d97f00113ea9e4414f8aca0ff7ff5ffaf2b76f9d | ORPH
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2ff0cffd69622826e7bac4c4cb900e378aa75db1 | ORPH
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2a20d19e3dc57162836fefbe5dc7e2cdafec57d8 | ORPH
  riscv64    |         cracklib-2.9.8         | NOK | http://autobuild.buildroot.net/results/a0a8e296d44bd5d08d6f9da36f9f8eaf9073d3f9 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/936482a5c92fbab756228a16349602a861fbf19f |     
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/e93dd25e4643da19af95cbefafcf2e87f1346128 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/044aafc8855a0aec048e02a9e6db2051d1c3e8ab | ORPH
   x86_64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/02209f97c8efcecf879ec0830113e9fd15a6ae75 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bad86e6a6d358bec38ec8fdf0463508a0d8351a6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d1637f0c303f6e349592d1b1b1ffb604d69da7b7 | ORPH
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/9a2cfc85d2b9d611b53d21cfba17b93d4ebf5353 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/76447cd95caed6b2a6d61dc0418edb7c15212b80 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ce6a898dabb736878badfcdda0c2a25387062366 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ad9fa06a058e149c96e7812a6a9d303829e06880 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/caed4a603c78aeba26b7b4253da5004d6f11445b | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/48ba02c04e0c747ae19e7efa6cc3ebe2724f2c3a | ORPH
    arm      |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/f8067492ec9ff07eb498046eef842808c26e0044 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/fe4b9032518d7638aab9f09b6eb322c959aff963 | ORPH
  sparc64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/2a2adfc6474ac047890fce7980309b03a91d8942 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/068f1414accb17c93af4f3cdf3426695364f03b7 |     
   mips64    |        host-guile-3.0.9        | NOK | http://autobuild.buildroot.net/results/c60fe2f20c41757b394f7058a6a89c7007a1bd9f |     
powerpc64le  |   host-python-maturin-1.1.0    | NOK | http://autobuild.buildroot.net/results/cefb5f46805bd9085a095f73982f3de1f8a25e0b |     
    mips     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/2b5bdab56afdf94e00dfa5f67e4ab6417e8816b4 |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/15ee969923bc56aabfa5bc005d72915073ae08f2 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2adb4238e82890342eb72023abebbb6be4b92efb |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/165f7ff83bd4bd8c020a7a8d72804e1bac39f4b6 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/daa5e5cfb1718d3294bc01774f8b1294183fd119 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c423dd0808ef4103306a8d852da815b288cbeabf |     
    or1k     |         libgeos-3.12.0         | NOK | http://autobuild.buildroot.net/results/483c772574907959fac018a79703cd79f4ac2f83 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6747ec929c7ce4e6ee18bdcdabca061d3ea17e8b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/914f2e9f052e4833ad254abd4062877248b80bd8 |     
powerpc64le  |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/a79af42235d32df7acccc45f802fb88dbdbd6a5c | ORPH
   nios2     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/c98c21093714542d4c0546a742fdcc48f3f07d04 | ORPH
  mips64el   |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/184d883d55dd6855011b770ebec0dea0cbda51f7 | ORPH
   mips64    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/0bdac1e5028c89cfdf28ef19e9eb6261d193e451 | ORPH
   arceb     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/925e873cde492490f71b27dc5818c40bc5f367a1 | ORPH
microblazeel |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/ea78c6cec9a4727027042301ac2d2b29c61d3847 |     
microblazeel |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/52b07586867ef1f1a8764a199c73317a92d1cec7 |     
  mips64el   |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/8f74ddf5b5c8f6c5e127e8cde1ac2f3db032803f | ORPH
   s390x     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/03ac00236d1503338a4050a8f0369a194c1d1720 |     
   mipsel    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/e3fadaaf46ce7c995421a019d3c7beaa8e215938 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/e8a1b3452fbef0a3765fcb9d0ec9ba9234305a70 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ec81fa51396c6aaa4f6286372492842012d033ac |     
   s390x     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/db56e527fdc7f24d13809686ab5870ba881f4260 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/beeef73b0ef23c87bf8092ab1e6d3db412d7f7d3 | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/97254c6bee2b7a4e1a2405e25e8175ddd4253448 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/99e4290b5bc4971d3fd789d0809c371a93e319c4 |     
   arceb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/36701874277237551251682e688343035cb2b038 | ORPH
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/43d036c1d0e05224f2651ce68cde00cc46bdce5c |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c2d25dce70a5ad93bb412f32b637a41c1ad043a0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/40c6bf6c1a88c1a3f38d7a6b13b39571f89088c0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/ad95615d4ca07a7d427f78188e53c7f972df2db3 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.10 | 1 
              host-rust-1.68.2 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/e5caf792a4788b3a8023cf7820464a73b5417b0d |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/28686dd11172cb6ab566c69146bdec2344164f1e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
