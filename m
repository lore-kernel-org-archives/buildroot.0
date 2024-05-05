Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E4C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 04:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4043401FE;
	Sun,  5 May 2024 04:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCxVIg23YcTv; Sun,  5 May 2024 04:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D2E4033A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D2E4033A;
	Sun,  5 May 2024 04:02:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A383A1BF284
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 04:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA9A409DF
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 04:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJsUq8paKX9Y for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 04:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E64D740992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64D740992
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E64D740992
 for <buildroot@buildroot.org>; Sun,  5 May 2024 04:01:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16475E000A
 for <buildroot@buildroot.org>; Sun,  5 May 2024 04:01:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 05 May 2024 04:01:52 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714881712; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2SJ9XlFdMgd1cgx+NDNxOasoZXX+PG3IscrjAzNnKII=;
 b=ZuhjaGlTyB+uHzsk+4R3NTWLnqXoX7dMekqwSLUsW2vck00wAwLtQVHCe2xX1wqk9UTSQ9
 BGMwhpmGfSsFPqkJCFXLERABNwBvAtyFyGcq01QjCjrqu4GJPJyBjOjAC0EDgUTTevC0Cm
 Eho5NfYrR2YDSQliAgjboRP9v41Zh5+qYH7ogxuC3sxZPwDhV7nvbs/seTQ+OOV8mm4p5J
 FkUn7K2XWie5zNZEGx5x2/VINw6VdbStzBXgr8XOjZFAh7df2I6Y1GggHseRxgq3hVvCCa
 SuqMqGZcxRdYnxv2K/i7V/sye8uhk0Umg+nyrKCtab3d9/oM/+lD+9eKAS7wDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZuhjaGlT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-04
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
Message-ID: <20240505040152._UHL_QWbKX18wqcz7xDwsSKsg1fGFWFqmhEaMSNxzJE@z>

Hello,

Autobuild statistics for 2024-05-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  | 12  |  0  | 21  |
    master   | 62  | 109 |  0  | 171 |

Classification of failures by reason for master
-----------------------------------------------

          host-libglib2-2.76.1 | 29
                       unknown | 8 
                   linux-6.8.6 | 7 
              libopenssl-3.3.0 | 5 
ibm-sw-tpm2-5452af422edeff7... | 4 
                libressl-3.8.4 | 4 
check-11970a7e112dfe243a2e6... | 3 
           dmraid-1.0.0.rc16-3 | 3 
  gobject-introspection-1.76.1 | 3 
host-heimdal-f4faaeaba371ff... | 3 
                     mdadm-4.3 | 3 
                elfutils-0.189 | 2 
                fail2ban-1.0.2 | 2 
                    fcft-3.1.6 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
          cryptodev-linux-1.13 | 1 
                    eza-0.18.8 | 1 
         flutter-engine-3.19.5 | 1 
            gdk-pixbuf-2.42.10 | 1 
                     gmp-6.3.0 | 1 
                gnu-efi-3.0.18 | 1 
               gocryptfs-2.3.2 | 1 
         host-libxcrypt-4.4.36 | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
                  libsepol-3.5 | 1 
             libutempter-1.2.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240129 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
qt5location-0ec8f5e82da7369... | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
                    rtty-8.1.0 | 1 
sconeserver-8d1935919a20133... | 1 
              skalibs-2.12.0.1 | 1 
             stress-ng-0.17.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2c1bec9057835d9804a0e2ae15cd5172f143724b | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a3e4ee7862bdbca4cf89d503e84824ff66d79be1 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b9c61bff027c3311a5788cc18717e7e1aa0514b6 | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/bf30109e10da3e59f2a0986181ee05a92e0a5fef | ORPH
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/6a282b98c04f255525a4076d9b9f37d70375ec45 |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/d32d2a9a65b8e63873853db273a3f6ebb33dd54f | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d79686fbd0767778776c26dba6d0284ad35eeca2 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/3c4704160a7b575498022b5ba73f755e4f432e87 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8d3ba6fc8b2bd4cc4afc74a2b49c914e567f161b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/de5e5332bd152efb0512a897bf1d6cf787fd87cb | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4cd68fff051d05b3a304f68966c8f5d6946a4e74 | ORPH
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/19d0769cceb1460fd188d5081f1c939158ce11bd |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6f0b173e8bc42488d89bbb15aeacc2664f7b61c5 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/89d12d1dd5a5e03291996e35e5d702bd225f01de |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/e00b5eed221aafad5c8695881b6396c46e2fc894 |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/18d46400c852caeb178e80a80d0722d8b9b4e9fd |     
  aarch64    |     flutter-engine-3.19.5      | NOK | http://autobuild.buildroot.net/results/8b6836046091d22807f5f23a65835ed4cb4475b4 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/426699a33b55effd3fc3043f5fed62e7517a29ad | ORPH
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/330923b3346d5a7a1e5a7b82d0027945ebd24a78 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6a6e83947891c9d97a77f5e7cf28ee54b0613bd9 |     
  riscv64    |           gmp-6.3.0            | NOK | http://autobuild.buildroot.net/results/1407f2eaa311878dce78f92c6625ad12d6a053d2 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e3c8af85397cb907592be3af2698d0cc18046834 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a1d1089ea3efb58703442c61fccd90ef5bcb5a52 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0a49510c31e56bc917066528b1b8782137b3e319 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/71ddcfbdd7714c7e8e1638bbc2a5a8b33dc77c43 | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/92dcb5a35d3fe918758b79736f53d2c126e6285d |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/332f51bb71ae3b3be7740cb5771dd8fe65b9de06 | ORPH
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f6e8044ffe8d349c4058b9b8bd90c4e38e57c1f4 | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b6e208676135d9c2f733113937a4a97b64079c1d | ORPH
   x86_64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/419dbf07b03407afea615a789d3bd575ef176516 |     
 microblaze  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/088ca1f327e4fda1883f73f8da2fba86ae45f102 |     
   x86_64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/3eb65bb28cf86b816328a0fd169dec0c7d1acde6 |     
   x86_64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4205404b449ad230ed16a3ca2395e20fc04f2e23 |     
 aarch64_be  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/d86e5e761f9471eb7eb73a322f3ba7ebc4b8accc |     
   armeb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/7649794550a68c2218a5ff9854745fc76c17c766 |     
microblazeel |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/88dc6a8d444495fdb642cbe6be768af464ca29ad |     
    m68k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/aa2b143ae98ac31ac055ea592db9c67f5bd6f72a |     
microblazeel |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/fc9197b6958c66b5a800e27ae20d7a58e240d315 |     
   armeb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/ba6742a8ee1cb1d7b4f9632b322d1d668ccce871 |     
  aarch64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/6991f8e53f0a3b5dcf957b4976e719002c5bb216 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/42a6c2c9abd3c63b55990fd7e94d357d792e06f6 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4649d1ea59a284285d5d9dbafe4fdac76cb7f76f |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/bfa02fc9e7a5ec26678fba96d8c624b8312bb432 |     
    mips     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/455db70867fa951963ff05acefb8dd456839ee24 |     
    arc      |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b9e822610ff9ef13adb7b588f6b5b7fcf34b9558 |     
   xtensa    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/6d605253b9ccf2f33277256d036438244fe1a705 |     
powerpc64le  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/72c1726058763fb455b7d6cf47755785d276f2ea |     
    mips     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/71f4ed04267f255ca64ebc1353c2436bc3be6245 |     
    sh4a     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/32fe1c99b9907fd1b5f74622ad03f6dfd81e3e50 |     
   arceb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/97e4ccc500dac9a0a45e21dc44bee903e21a1258 |     
   mipsel    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4cde6bed1d707c1e2a1777966be91d649f4087a6 |     
    i686     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/a6a29b1d82ff5070a8f6f16c492d9674c2c85e59 |     
    mips     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/33d4f529eba946b890ab05f8966e89d57bb6037c |     
   sparc     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/6dde16f3c07469cc9811f8919efac6bdf7b4bb7d |     
 aarch64_be  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/0821211837a9d7f8631346f44e66ef1ca2d72f6c |     
 powerpc64   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/44bc88e419fc10c2ddd30762dc1b53023f8dac77 |     
  aarch64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4c74bff18694c765d4a57ab48225c6f34faf149d |     
 powerpc64   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/d4b13c4f814645289dd1a7f29c2a3c4629cd490d |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/bfcb131712420a606459902aee36defa8df2a1ef |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/35caf9eed5ee2d94100fdc048c49542c727f287c |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5cad65484c98c435711d1ba11455e6aa1aae782b |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f3d2f24ddb64e4f7f4bf8cbbd493b5ac9246c9a3 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/de4206d3df9352d5e58cb98926c39a67f6a51195 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ef90fe0b68928aeaa2b347209e3c3fef4d637b5b |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/aea3c079217b624636649b95f9731fb0656fbcbe |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/83a9ab83dfc57fb11b1a43d910c2a4c5c16b52e1 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/45dfb7c2f0ac3001040c5a3b0921056759eb32ba | ORPH
    arm      |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/96bbfac893d76850d53339a92c5dd09093c1eb88 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/a4743ae840c4d26c65d88276bbf97c4886761e57 | ORPH
    arm      |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/a4fed3fe8ac6f0c9acdae060e8429df4e58bff08 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4920b377d27919857d7a57230312936e833532c9 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a70374d25853fa2875361408dda7b166d65fc81b | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0b2d9b24b63f1c90d759f5c82d0aa31979cd6b6d | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/03c8d928ff9da2ab59d93ae75da814a5fc160118 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/d8c8e2a1b353ce8b354940a9903dcea71e379cfd |     
    m68k     |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703 |     
   arceb     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/98d17f2d1d32beab3d7ba099f06b8f951d882e15 | ORPH
 aarch64_be  |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/8c99bc7c837369696be917d03239caa2b9c5da19 | ORPH
  mips64el   |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/5dc51d52fb938004e7dea459e06fcb3ec2b571d4 | ORPH
  mips64el   |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/7531c2cd954eb23417e24e9e46a10ebe1cf0568e | ORPH
    m68k     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/1703f15f4eaba06f30849856e880f356c3af8a4f | ORPH
 powerpc64   |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/ab31d5baa922c966241ac52cebe943313b727d06 | ORPH
   mipsel    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/17160a97a38b0e480efa4079a3bd741d1a37efdc | ORPH
   nios2     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/1009566b7718cff465a0cdbfbe8c23bf64a4b905 | ORPH
    i686     |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/a7101e10c1a371f2405ff6ba65fc6d2d3d5996c5 |     
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/dbc254892b2af96282bf890f985eba09bcb4c093 | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1f2e8eb7f2fb0d62ceeecf426dd892bc93b572a8 | ORPH
  aarch64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/7c61109df2d58ea1fda5dddf631395ece197c065 | ORPH
    or1k     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/aac8e291482295b82abf7b4d65303a3acc9995ca | ORPH
   arceb     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/6e912a238bec39b5e872ebf9656e7a2ac18a316f | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/d6d33d8556592eaeb07594049f2331735ce6a1a4 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/7cafad4593eb77039db124a5f339f4e9fe9dc586 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/be5073ce6478a05a7d38bbb6f04dea3c76ad0a31 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/503a6d62227262519a0c655773bda9be801e469b |     
   sparc     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/b22cfdbee3397b335a010b7fa4b8deaf4a52c87f |     
    arm      | qt5location-0ec8f5e82da7369... | NOK | http://autobuild.buildroot.net/results/3d956d2be93af7deac86209b309198e976ee2ed8 |     
   arceb     | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/68e9bc802f72dc3ddbd97562e28e29a215972fd5 |     
    or1k     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/293742270e5f022c09114b79dd7e2fecb55341fe |     
  sparc64    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/8a7cb0b10d57cfc022e2e655dea0baae4daf88d8 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/baa17c0624f579a979f242be2290ba2ce5b9f7c0 |     
    arm      |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a5e366ae419451eb2314638636a9cc561d9def88 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d09a40d3f20e199a68ebe9e190ff5116c50c26e |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/676bc9b95682cdf2988d8fe706baca38f76821a6 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/536b57a59a57998bc69a54f5fc680f4cd6ab9eae |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b73940f703e3d0e1666b594f42f6a3bb36ecc8f8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6607d4a30ff1c577ac396058aa67404fc50cbd50 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/e56235be834adc25d266bf0f69c44e3cefe4acb9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/789f1a899aa959a94c28bfa5b6669e76209ad1ce |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
               apcupsd-3.14.14 | 1 
                elfutils-0.189 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
                   libnpth-1.7 | 1 
                libressl-3.8.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/62595357ac268ba5b392dc3a9e6b2c8db7539490 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/563ec958dab2522c50ae0db10bb98c495b2b7c10 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8b554b3aab715eb2253ce14e859a40b240339a19 | ORPH
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/96689edaf6694d4f0ac920af9d7016d5dd74d25e |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e24aca3c7e6b74a8694b5899c6a549334b97fda5 |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/611a381cb4001458ad2777f07476899d3d654266 |     
    arm      |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/5dfa581c32ced9589f9c3abb56804156eb829c0e |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/111701c152c50cd4b26dede8618790f3232db96b | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7bf58ada990191e9b4c7ebc5d734f3c8d78f25bd | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/e87503ffe877fec46b7ba150193fe06a046b2173 | ORPH
 microblaze  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/a8218f5ccf38350de9f3f3db600c3be23b761798 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/61bc88aaeeb683d386560803662957879678195b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
