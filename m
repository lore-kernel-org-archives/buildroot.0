Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7763DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 07:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5F9403CC;
	Thu,  3 Feb 2022 07:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MNeRo3yoBq6; Thu,  3 Feb 2022 07:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9F241570;
	Thu,  3 Feb 2022 07:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F215C1BF361
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3D941570
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 07:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaQyj6WC_sJl for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 07:05:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD3BE403CC
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 07:05:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9C1D240010
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 07:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643871952; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mk13JqjyWjpaFpgQoGwXzSyXiejauvKZjiC6+9dP5mQ=;
 b=OLy79rHQNoQzC8Y9BN4bLdJUi8CkCrJNef2HtYP93or1aVvcnydfE9kI+QJIZAb4gvDiwo
 doqUvLLCU5yongKeGTk3reqj5TPs7lcF7v9UjPZB9vPGFexAXgq7DVc/KKQKoubSws7wUy
 4r6gGrENa1kE7tjH6bGamtIQA61sKnflNjrp5xq9Ok8xFYva7KmnRLs+RLSztar7d1YhrV
 xjc/XR3iiXt7g76VCRxAL0J2fA6NOnx0u5wklzvQD4bhF/f8NRE7Dj3GSBeH7t3RgDQJ5Y
 Q4qDq/Y8D/IXStMqJN0TPzs2tHPSMW8C5aM/VSfMlapbUb94b+Ia8UrKsKDDxg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 03 Feb 2022 07:05:51 -0000
Message-Id: <20220203070556.DD3D941570@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-02
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

Autobuild statistics for 2022-02-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 76  | 12  |  0  | 88  |
  2021.11.x  | 27  |  4  |  0  | 31  |
    master   | 66  | 93  |  0  | 159 |

Classification of failures by reason for master
-----------------------------------------------

        host-util-linux-2.37.3 | 62
           host-libselinux-3.3 | 6 
                       unknown | 4 
          python-aiohttp-3.8.1 | 2 
                rtorrent-0.9.8 | 2 
                  rygel-0.40.2 | 2 
     adwaita-icon-theme-3.37.2 | 1 
             bluez5_utils-5.63 | 1 
                  boinc-7.18.1 | 1 
              cryptsetup-2.4.2 | 1 
                       frr-8.1 | 1 
   host-python-docutils-0.15.2 | 1 
                 jasper-2.0.33 | 1 
                libglvnd-1.3.2 | 1 
                libselinux-3.3 | 1 
                 mesa3d-21.3.4 | 1 
                   mp4v2-5.0.1 | 1 
     python-argon2-cffi-21.1.0 | 1 
           python-brotli-1.0.9 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |   adwaita-icon-theme-3.37.2    | NOK | http://autobuild.buildroot.net/results/0e00059b09b4445eaaec1030997883187c6a80d6 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/c39c0e9b5411bc586173b47324b052efb110fe3f |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5816378705c3276e97dc8c030b3b0f9a3e391aa9 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/bad4d01fde3191e4d481a8e9dae18df3b1a94537 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/885f01b447ed4de75dbbc4491f0c6bdd3997700e |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/84bc42a947cc2c68c9d601e98cc8954c88e33b11 |     
   s390x     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/29fd227a36b6493fdfede4d224daa193ec77ffaa |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/b23eee490b9be140e019933112f1f7612578bca0 |     
  sparc64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/37f11633d96729f0d8020ddbc13b9acf0120c0a1 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9362ea8a085c97ce3c9a37c5a00b42e0644989b2 |     
 powerpc64   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/23d2e80704debd4d624c63661dcc20c0c1c488d5 |     
  sparc64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/02dd94c09dabdbdd8b47673393577a7fd3af3aeb |     
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/cbdf02d6d44c1c0ea9b99fe9a53dc451c02c6d45 | ORPH
  powerpc    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/35fc4e922d7d5ba5e85dbd376d9a0b954271f59e | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/5f43ab24b9b49b020fffbb59489abed55c07f5c2 | ORPH
  mips64el   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/7a4309bc894be152a85d8b25bab17ffd993617bb | ORPH
   sparc     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/2227d8aef44fc3b082c8e93ef3eef94087f7d2ac | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/23fe38ff0be9d4d25f512bab033d9ddae8fd4354 | ORPH
   sparc     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/38eb5ef2ab6ce6161487a660b8756858f29f31e7 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/13b74ff23b18e0b01a7cee57b9584d3880611dc0 | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/38325617007308c109020f75679994e14b0015a6 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/bc6aa6156d2f48c14681e260e61b97d339bce76d | ORPH
  aarch64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/3923bba9148638414a0d180a9e1feb17e0171f64 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/aadb130fc7ad7c5e5df0700d48f32d2a5a944452 | ORPH
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/130cf2ceb980a86cca86ff6a7a945203e486a9dd | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/eaf9a3a4f8c226084e6e21501a2d3e13d0e742b8 | ORPH
    i686     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/6cc15972eb4cb6d771597bf98e176775b253dfa5 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/3708db3d397332a939a8276d957f0fb51f0360fb | ORPH
  mips64el   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/d4bd6fcb37d566bdba7dd9c2b46fe6b007259652 | ORPH
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/3bf0471e2fc79a495385f9202171e2c8ae4ace5d | ORPH
    mips     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/ec01e80449ecafe015c9b693ba3a7c2b2917786a | ORPH
 powerpc64   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/cbdf8ef931a63b7a5375778c4927f6ca28bb999d | ORPH
  aarch64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/7bdd64e7c031a4bc4a51569bdacd0f12000d19ea | ORPH
   x86_64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/5282e9846785d8e03dce2c05f0e678b8d9cb610c | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/4649d72ab7093b60239e8210d3329587148c129e | ORPH
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/7216879730b1a4d27bb3640e3e4b95d7d06f80ff | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/ec98d23f5f0f60154519a919a30a86a820a18ea9 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/15cdd73c29306891c365fb35e580043191fe54e3 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/c101c4033a456cd23c724db7ee178dd771cdf3b4 | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/d617bb3e5aec233712f53dc78476119f5454cbd7 | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/7bde5bf714b4a5007ea2b06124f514bfbc41301d | ORPH
powerpc64le  |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/1ec43c2e9fd529dd99f8fa8a1d160c9b5a5fa736 | ORPH
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/5589845b14a47c29918e2bdc93ccfb74d0b7c73d | ORPH
   xtensa    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/739399b1bd664a13e1a4b81fdace8f45be95f096 | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/e498da3b10b2c4f24c74f7a14a7941ed2b451ec6 | ORPH
  powerpc    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/c85cd1634e940bb242d72092fe68d2d05a33f03a | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/28d792f74d0ce34c5f751a0ba1b6edb40d92f1aa | ORPH
  aarch64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/23afe9f1f13b7693cca24e3e86f9d04fd095a50f | ORPH
   x86_64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/4dd133b0cf5d2d29321bc38a875e909544fc114f | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/5ed83936207623190ed65f61996c4917b6d5cdeb | ORPH
  powerpc    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/af8bbe1c2019066aa8baf7790f35887b9c4c1ef7 | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/0d20979df14c7fd0307c6bc78d0c6e977191e9ae | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/47780646faf8cbd1cb1b1b7560cdda23134ac24f | ORPH
    arc      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/187548fadcc66e8cdbc24a3ef2c45ee6a8a853e5 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/52dac30516ca65522c424115573e7ddb9361d8f9 | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/8b9e5776768ecd77c0798534aa7517d5e230f53a | ORPH
  mips64el   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/c03a703745152fff6690087871e22370dc55c669 | ORPH
 powerpc64   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/07f6daaa46538fcd938537949078c3a1f0ae6929 | ORPH
   s390x     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/dd4d28bf5a8a618d992b4cae9423af4947b46fd0 | ORPH
    m68k     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/719a846c965cf09b9a97abaf4a877698d791cffb | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/8dbb4e0cf367f6f72c07c57c66535a560b4e036e | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/e52f4dccae02f7264c2bfefbf8f5e7d83dee04af | ORPH
   sparc     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/55e1809c78ad46c8bdcf042b39a858022e65d636 | ORPH
   x86_64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/b8cb40efc036a01802c914544cd4fc29dfd67af6 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/ba1369703e3c5b2d730bafcb5faea90b0ba27dd5 | ORPH
  riscv64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/cb06fb63ed8700af2d3c737a5e8e8a11d988b3f5 | ORPH
  riscv64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/f0c87123ce569e46941339359c1a624a99c562f0 | ORPH
  powerpc    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/a047476142dc27681d5eb9ec60a1f6ed10531457 | ORPH
   x86_64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/2eb54d77d883d1ab31b9f61ef4e2411c9cee6d75 | ORPH
    mips     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/de8dd3f7c1f3e5b91af3d664edc042646812794e | ORPH
    i686     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/29f273a14b2d3d44fb74fefc987cf271601e65bd | ORPH
   nios2     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/26a59e826ec291b35f9d8a4aaca11b127146be8e | ORPH
    i686     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/97891a7bfd78c8c87294617ce4a7d1f3d2fc6731 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/0f4e11ec2046c29acdb1e4c9bb93ee2291dca9b8 | ORPH
   x86_64    |         jasper-2.0.33          | NOK | http://autobuild.buildroot.net/results/b106fdf32ffa9e0ef1254e0a29fdcdc821020e08 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/6ff0b80de4a09bdd34d3f627e94a4fca9d9c3514 | ORPH
    arc      |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/1395f1b29bcbe30fa47524736899917892cb6bf6 |     
   x86_64    |         mesa3d-21.3.4          | NOK | http://autobuild.buildroot.net/results/51866218f9ba7aa7ee3c1acf10aeb31c9d70a266 |     
  mips64el   |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/8dfdf0888cf1d2904b610bfb4c8e2d75562b51c6 | ORPH
    i686     |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/2e8093e68d04e8cbb20b095068b24c8bbe5f69ad |     
  mips64el   |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/6a0d2e3db7c573cd0ca98d953185f71f9ec044fd |     
    or1k     |   python-argon2-cffi-21.1.0    | NOK | http://autobuild.buildroot.net/results/3207bb214dcb0c8bb96e3994af9875a2c4e8cb2c |     
   mipsel    |      python-brotli-1.0.9       | NOK | http://autobuild.buildroot.net/results/9e3cfddb651a59d7f2d04bc88e6fff2a06e9b465 |     
    arc      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/2a563299c8668d06ec4a1684c06512520819923e | ORPH
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/e614db8f94eaf6fabe45856ecd75af3f54d8361d | ORPH
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2b2ce3bc565f1a5ea14f1a3eb2890670f1fda9a6 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a60073e472d2130fadd25384306385215a09bcf0 |     
  mips64el   | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/be043792e6e5501631517881b10096291a654364 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/9cb6aeb34e238e141515d9c27b5dfaa462fb9ffa |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/d7b8fb91f92c361bc0e38166bcb49ca58a58dbbe |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/aec2eeaf29dc71adc955461d0391ef3125349217 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/22bc42bba9ac87e72934e8c29fcd69c60cbca77c |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/94cc1d71bbaecbda41c7ab325fb4ada30dc4cf0a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                       unknown | 4 
        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
                  ndisc6-1.0.4 | 2 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0aefceff16d609fbc6fceb02612355907de1b771 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/52f6ae114ab020c1d83d03f168e42b18fc1e6bd5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5173137747b60eefc8429e06d75efe52632b0fbe |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0d678fbfa74a2385d7a231ed6e6890793a700483 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ae9b9cc180d35261d14b31650c5aac4f7e1eb0e8 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ce203db04bf0a1b3933f5ce563a155120d7fe5f0 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d3e71c97cd62495accc667e97d17261f3d79e479 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/35273145d382bc4ed39222a76b3b366a1363069a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9f4f4db18063cc0b7e21e92d948c7c73f9653909 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc76a4fd44cc45c234df25b9dfee7998be0b3268 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/44d85bb4341d1a5060f10a3b4677e0b5eb857ff7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d5e70c6c8fb8b80d48c4cccaa9eb15eeb9c087fb |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                       unknown | 2 
                 wavemon-0.9.4 | 2 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b1e0884d5c54196d626cb25d42cd9b84b8f3e432 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/325f3be7398e5fc2a0e47c7c29be0a160638bbbd |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e75a5dfe638a282ca86514d5398e1451847e1d61 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d7bfd6d04038bd4ef8c806d8f540f7c6c36a2531 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
