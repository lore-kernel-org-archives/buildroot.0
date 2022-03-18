Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165E9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA2C40BED;
	Fri, 18 Mar 2022 08:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTbQyzU_mnvi; Fri, 18 Mar 2022 08:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E10FE40BEA;
	Fri, 18 Mar 2022 08:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11E1C1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E95B184745
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnFpz0gzwSoS for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:17:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CA5A84742
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:17:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14B221C0013
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647591474; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IPHrzG9kXuNHw2uIJCL89GGFWWkMLafbVK7pFKXgzQs=;
 b=Ic2nYWi2zcWejYtyC0gZxQI7MO8oCam44Lp380X3zHP1QVuSqtdeGtTHrEPW0c2qTUpF/v
 Qfk24KDJ97J8gyP04Wr1vIFjoOGuDABssL7s/39onazfYLRDjdyb1/JKOLNDSrETjSxAuh
 3gu72116tDF21yaDVTn3idHgWjcJlkRY/8q1LIbj/gGYmaJTRpPGdpo96Rw9+iN2wXUGWs
 xr+6eEm5KhBDSgZjl9xW+yxEOronn8ijFHzMHdetl9W/xc0KOoGpnnF2KVVYnUGmCWbPoF
 nw5aguyNkUw8JPPEQvrz1SJNLGtvS2A17B0rIofipjipr99LV02Tgd75JWgMEQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 08:17:53 -0000
Message-Id: <20220318081758.E95B184745@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-17
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

Autobuild statistics for 2022-03-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 49  |  7  |  0  | 56  |
  2021.11.x  | 12  |  1  |  0  | 13  |
  2022.02.x  | 21  |  7  |  0  | 28  |
    master   | 52  | 25  |  1  | 78  |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.16.26 | 6 
                       unknown | 4 
  libnetfilter_conntrack-1.0.9 | 3 
                 dhcp-4.4.2-P1 | 1 
                  exempi-2.6.1 | 1 
                   grpc-1.44.0 | 1 
              host-delve-1.8.0 | 1 
libcamera-apps-2d1009e3badc... | 1 
                 libgee-0.20.5 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
                       libuwsc | 1 
                 mesa3d-21.3.7 | 1 
                    ola-0.10.8 | 1 
         rabbitmq-server-3.8.2 | 1 
                    tree-2.0.2 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/ea8862c7caa96ec9d7bc8665a390f64c6c11be27 | ORPH
  mips64el   |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/71ae24ad1a1de18d4fd4a1e3b2e4876269ea72ed | ORPH
microblazeel |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/6b6024c3e0e9788975a4b9206bc7312c49e6ff0e | ORPH
   nios2     |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/87808f07a8d0f57947b51a3242ec0533725b25d2 | ORPH
  riscv64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/84a2418fbf54bbe0a25eddd2d7a0c29fcfd17436 | ORPH
    sh4      |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/742e67a74412df42f2419add7984727e3421c9a2 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/82382f4180ff2145ededfeb4a86cec45084b4439 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7a3bdef7c8df52b748f8ae69946a1e8d5966e7a6 |     
    arm      |          grpc-1.44.0           | NOK | http://autobuild.buildroot.net/results/775f3ca3dedebff29e212b29dfa896b7613b7a02 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c9b552172660895a46b87d9743cebdf5f040869c |     
    arm      | libcamera-apps-2d1009e3badc... | NOK | http://autobuild.buildroot.net/results/5df48038df5deb4f1e85287cde9a403c5681c28e |     
    arm      |         libgee-0.20.5          | NOK | http://autobuild.buildroot.net/results/972a02911e5589a3dc21e77760084caaf2251860 |     
    arm      |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/8f6debbe240642e9857812b021bbc3650624905c |     
   xtensa    |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/1f40162020d8e70cbe669a3896bcc79fca36f562 |     
  powerpc    |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/9d0b93d5ca28657dd8818df15f7a1a6c56b67574 |     
microblazeel | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/0d525628b29781561acd0443e8773a8947d90500 |     
  aarch64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/c987b45d617a861b3bfee53e2d572dc236315d76 |     
    i686     |         mesa3d-21.3.7          | NOK | http://autobuild.buildroot.net/results/7b24c041e6d2c4f6f99d40dae0c8e2a66933f400 |     
  riscv64    |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/9b476cf0688932e42e2629b8458b243fe640200d |     
    arm      |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/e1f6cd4a4e902d58ebd13a3d70e1213cc0a0d379 |     
    arm      |           tree-2.0.2           | NOK | http://autobuild.buildroot.net/results/364457e1c2a367b3bb13d28adcc1be045523c855 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b24d72244a10d318784b4f4a4585c4dbc97d9618 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/573782ede2204840742d8ab97c263e4f19ceab0f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1016f1ae1704c8fa0a0eb506c76fff535a4baf46 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca80c2ab873216128e4e660cc7e68fb0609df943 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d40a1414b1084b3b17cc1c9e5966da6431840933 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

         python-twisted-22.1.0 | 2 
           docker-cli-20.10.12 | 1 
                 gerbera-1.6.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                opencv3-3.4.13 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      docker-cli-20.10.12       | NOK | http://autobuild.buildroot.net/results/b33827724515625fc970b4397badf4a131103036 |     
    arm      |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/a40a15c3ddd37a23b1dfc5b8d085e55e869ed026 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99d58ae6694ee868959ed9acb6ee727bc14dec0e |     
    arm      |         opencv3-3.4.13         | NOK | http://autobuild.buildroot.net/results/4c2a8d43d16fa04fc2e5b5171d02e36be96a7fe5 |     
   x86_64    |     python-twisted-22.1.0      | NOK | http://autobuild.buildroot.net/results/0dee250637a6da29c3df54e9f36d240e94e170bd |     
   nios2     |     python-twisted-22.1.0      | NOK | http://autobuild.buildroot.net/results/8507d74f6860b1b510dc1525928f5f21593d36fa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/76251acba437c86b93e5a4d2b201139831bf3050 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dfe5f474ca0bc3c58b1c5ae426cb28055a4f09c1 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             bluez5_utils-5.63 | 3 
              host-delve-1.8.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6a2800f0d73e584326eaa24a388da082081bcfa8 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/3142b2d2a8f89ed63ea2dab14ffd51a8044f1427 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/3e5a7a96cd46265990aea4e976a5965a228341de |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c8dd333970847c74cd24b4eee0f4b30050cac723 |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/851b3efb8b7de97034491320b63a34a896b92602 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/62bfc3c213bf10ba0acce641392956c5260b966f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/322c3d7a7609d62dae49d0e2ac37eb2fc17b6bf8 |     


Gitlab CI results for 2022-03-17
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
