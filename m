Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1616FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE0341685;
	Thu, 24 Feb 2022 09:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8q6LKy_TqEK; Thu, 24 Feb 2022 09:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBB24163E;
	Thu, 24 Feb 2022 09:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400861BF5AE
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 09:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35780825D3
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 09:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0qyzme5KGF5 for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 09:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C153881C2F
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 09:55:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0FDE40004
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645696522; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iaVY8KQjU5B7f4V7JIAg29zTtY0xxGubR/QqBx7XX7U=;
 b=QYJnHa4igWlwyT5/tzIqOW/hgZwJvZsIkEqQkB0kGzMDmUV5EwU+AyiZIVsT4874o/oZdr
 QoJ2/D9algP+WCxctQERN6aL0DMjSEAlH+THeEMrJln6qi2bfyyGxrs7txMYsVCTAgvc4F
 XF/c9+WaIUfn32spjrDTflVtW2PuDviSe1lXVg0Wgyw8I2wWv1QUEiB2CKw6kYFEQoIvjE
 B6pXZ3lz6JkXLaQPhJ16sJyA5NIVNRzl4dEg2rszIZhYefKVXmrMb0FC78NEFdaQX2IGeI
 eMIhAHxSu7r0rM+wGT1XfVHt0rCwjB5eNlGtfpQ2B3zvWzVDsJXK/6MbiHwFCA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 09:55:21 -0000
Message-Id: <20220224095527.35780825D3@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-23
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

Autobuild statistics for 2022-02-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  |  8  |  0  | 58  |
  2021.11.x  | 11  |  0  |  0  | 11  |
    master   | 64  | 38  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 13
         python-greenlet-1.1.2 | 3 
               target-finalize | 3 
                       unknown | 3 
bpftool-a7f0e7f057283ae8af3... | 2 
                       frr-8.1 | 2 
                suricata-6.0.4 | 2 
                    bat-0.19.0 | 1 
             bluez5_utils-5.63 | 1 
                    efl-1.26.1 | 1 
                  ffmpeg-4.4.1 | 1 
            ghostscript-9.55.0 | 1 
google-breakpad-7515ab13768... | 1 
                 opencv4-4.5.5 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                safeclib-3.7.1 | 1 
                 weston-10.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c7367643f2ca3ebf2aeed453ee210434b0f6a1d7 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/76beed20c7b218b1bca7bbe0274add6dd701b8ee |     
  sparc64    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/b8a63bba0d75fd3cfed53ebede47a5c4464c6145 |     
    arm      | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/62244f13564e745d702a217b0a67cd0768fe840a |     
   x86_64    |           efl-1.26.1           | NOK | http://autobuild.buildroot.net/results/ee8e650e28a1dcebee36c8e1fdbbe3926b56a92d |     
    arm      |          ffmpeg-4.4.1          | NOK | http://autobuild.buildroot.net/results/476ee51a6e8a819cfdb61965e7827e6e053301dc |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4e1f1ef763567ec1cd415055916d25284a18e6c2 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7bde2f954214cf286d4561b01b45a07301b8260a |     
    arm      |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/74044a08ace770ea63b9a86f897c6ec2626aca40 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/ebb8b3bc0e656fafdfaf2ef34fa32c8c3f7143b9 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0cfafc65f4dde41c709e8e3e25845dbbc8d458d7 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e3e4712d835ea744d58949760e6b562b88d40711 |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1e52d191e18cb1d2015bf63f5eeb7995b14727cf |     
    sh4      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/abebcadcab55a0b73b9462e20fd04c18cdcc2e39 |     
  riscv32    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/ce93d336d2b011c4697c90a5f0e1eb6c076b26b5 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/84758d4ca7d846e3c7a9601c2d487415eca34918 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/fd01a3405888b72da1d7aa11292269e12f9c30cf |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/60a8a107c4d3b4e2b6568ef0036d8c5cdfa2dc41 |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6a328a22b07cff68472ce997e7de7371e60276c0 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/2aeca17751a7cdeb5dfbc5909187464ba1a227ee |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/254d84c4e9fa35dff6436612d2d41c9bf97d62ac |     
 powerpc64   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/2f4001271125341adfde293a83a74020dff31314 |     
   nios2     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c75e3209f9ccaef3ab86c4d7da40fda830157374 |     
   xtensa    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/c94a18a0810e449fe92c9b5c30ecc6c10b864ef3 |     
  powerpc    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/04449db582f8c258244f29897ed27bf334199f46 |     
  mips64el   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/7d7b70b77588bd1a212edce05c19e1869692d693 |     
   x86_64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/7c9e6dd6217b735f465acf0c5a365756feea06e8 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/0364a1e2cbd0f47914d287716f846e770ccf4dfb |     
    arm      |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/e66e0669129eede2f10d81994249f2d2d6453875 |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/82df49727cb359905359524520fb7b64e50fdf34 |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/d21d2f887f845b2605bf642184b47c35707c29b0 |     
   s390x     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9bf6dcbc67ff75977b55ba9d5ecb0c39e3044d92 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/78ee9b31978bf199321651312e6cc4e1684f3e0f |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/bd8d32bcb01a1a5419eb018e76f9ef3d2b0c238b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0b22ae831003fad27d31768e25b3f0b1c1e7f19d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a2a979382652fcee7847e41360a310c2edcd2825 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e5067885b0072a4327737270cbf192e6ddd4821e |     
   sparc     |         weston-10.0.0          | NOK | http://autobuild.buildroot.net/results/3095e15e129c15b2bccb56e8841b6b2d285cc572 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                       gdb-9.2 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/72407799606c5a34894938ae8418e3c9a8442aa7 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d4c8d95ae421cc600e703f2b9ec9d78565b31131 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8ba9306b0a7484d74c4ee7357ff850cd1be86b0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/85d6fbe1757dde8470cb1f374d5a25b02b045673 |     
  mips64el   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/a8eb04e4a155fe43e05fa9fc50584bc2283b5fb7 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c69edb7d4cb1af59ff289630fbc604307d1972a7 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fabbd8f745c6b863277f4a72a487d7263dd5725f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/557a844678bea226d39204bd4daf7e9644de3dd8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
