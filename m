Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD23C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 06:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7172404AF;
	Thu, 28 Dec 2023 06:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7172404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkGUuIvIBJhM; Thu, 28 Dec 2023 06:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABB640493;
	Thu, 28 Dec 2023 06:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ABB640493
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03CE11BF372
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 06:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06FC40493
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 06:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06FC40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty5dRHBJRKDI for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 06:38:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FDD340491
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 06:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDD340491
Received: by mail.gandi.net (Postfix) with ESMTPSA id 453111C0005
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 06:38:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 06:38:09 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231228063813.D06FC40493@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703745489; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W7e5lsnbWgNSeymz9s5xQ0W1CMiMLzRlRwsoU9d88E8=;
 b=WJOUdFO7SK2Y/DjLw1rYusAhc7jyLukT3RpxDQfB1NfJhC+GDqvdhJbBI01CEZC9AEMpA4
 nhdZOlRcPHWX7HS5ZW6+VOC9axDL77A2JuUbHpbccg2ZZIQ4gHagPj2Z52uf9T4YP+PUnG
 9FGqi78S0P6phkVm4ytSxN9qPyFJrLbmD6YRGwx8ZVN9t2U2fV4IpMbrQI6NUKYWWPIogC
 p6Be6EDmbM+XTpyBcnvT8gfVBHbnibQB0fqBjTZWSH0zmd2fva5j13gyg4TKA8+HEOKfe6
 inO+mI/nm/+9Lui3SkdK1wA4ITYhnTPUtvrh1IXqXCm5aVx+GySgqJWeffVjPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WJOUdFO7
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-27
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

Autobuild statistics for 2023-12-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  4  |  0  | 10  |
  2023.08.x  |  4  |  4  |  0  |  8  |
    master   | 11  | 14  |  1  | 26  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.2.0 | 3 
                     exim-4.97 | 2 
                       unknown | 2 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.5 | 1 
                libressl-3.8.2 | 1 
            linux-fusion-9.0.3 | 1 
        python-pysensors-0.0.4 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/dc2a59adc295418d1eae2b76ef5b0c9e30bdd845 | ORPH
   xtensa    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/282882371e1d8c224c457bf65016f8abd11f8c45 |     
   sh4aeb    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/5d76dc80f1eb830d66646985b72e9bd24281bf2b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e3da8b2cd3fdfe440184bd7f65221475988190fd |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/344cf634937446512b78ec54dc03070e5874305e | ORPH
    i686     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/69eb2f13784a8f7573c1606a79362f6e6f2a207b |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/e15112e0872d4dc3029e74e2a373845709fa3102 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/503d4d89fa7033276f8eb53b26098e62eee42b65 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/6a5b671f2f01ad84deecb2ac67736b503d43059b | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e81fd70bce5dd680a8e657b8f75ca8bed6f4b2cd | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/33b618e618ef679fb059090f026b1bb0cc4780fd | ORPH
  aarch64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/f963995821117f008989167ac95d048415d9c187 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/54404b231f78be06f75e48b7d55ff2a9487c0898 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/022070d7ce7bdd0c4334a24c42f271d34f1d909d |     
powerpc64le  |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/09ebd9c51d6884c0bda8c720fedb0f057574a042 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 coreutils-9.1 | 1 
               gupnp-av-0.14.0 | 1 
              host-rust-1.67.1 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/7b6b5679cf1cd1a40acbcd4382fa3a4ff3ea47a3 | ORPH
   nios2     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/65f0d4019e445e8f82bc7eb1288ddbb15fc669e6 |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/e4036ce596b20b7c66b4fc8686fc3705f4a97f3f |     
powerpc64le  |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/e7ba21a14ba37b765f2557bc617b49984cebb184 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                    brltty-6.5 | 1 
                elfutils-0.189 | 1 
          libfastjson-0.99.9.1 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2ab22c8469872fcea27d1262c577e86f83a7bcb3 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/67912cc10f070e7a662c97c4b3c30e85c5f1aa85 | ORPH
  riscv64    |      libfastjson-0.99.9.1      | NOK | http://autobuild.buildroot.net/results/89709d8186ddbc9426367ab8acd84df76536e8f7 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3ae1976bda69fcd5005949ae9386638fb5c45c41 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
