Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D56FCD495B
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 06:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D6ED404C2;
	Thu, 21 Sep 2023 06:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6ED404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Pm9Ol7aGUNy; Thu, 21 Sep 2023 06:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 176A64042D;
	Thu, 21 Sep 2023 06:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 176A64042D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9091BF484
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 06:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEE24042D
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 06:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EEE24042D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWSvtgPBBgYY for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 06:40:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50A31400AB
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 06:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A31400AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA3012000D
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 06:40:23 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 06:40:23 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230921064029.4EEE24042D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695278423; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PROvbIu0J/UhzN3J4qKm3eVZw2CdxfvkGOP13Scx63o=;
 b=JIv74OfSDLhFhj4c8eJCmbMRb6ZGtyDpGFnULMex5qUbvYTL3+264whV4Wm097B77Bu0v4
 a5XE12LIkT0MuMf6r8/tupWNB0cDFeVUV34xGTlvv9bYWfZ6sFHjD7i2qPqVDoPfsG30CV
 sqdBJXPTHZvKtLy2wCs3L3pKNY3lWzWN/wckWydQlqRu/qNSO+anAhDUFbI3Zu33u7wtiK
 st9wfGrB8UXlZRVvVxaqEKKeUkYw5plkVrNWT2izABhSFHdpg61+qlhHvC1JTk8ADLuSm7
 rHQ2uaXZfcPfCrvteEb6X99uBD0OKlajr207EvorcJuemuILiWoWSYz4tkJdvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JIv74OfS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-20
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

Autobuild statistics for 2023-09-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  2  |  0  |  8  |
  2023.05.x  |  4  |  1  |  0  |  5  |
  2023.08.x  |  3  |  2  |  0  |  5  |
    master   | 53  | 28  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.4.14 | 4 
                host-go-1.21.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
esp-hosted-11e90f185a5a9922... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
            host-erlang-26.0.2 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.93 | 1 
               lightning-2.2.2 | 1 
               linux-pam-1.5.3 | 1 
        ltp-testsuite-20230127 | 1 
           lttng-libust-2.13.1 | 1 
                    ne10-1.2.1 | 1 
package/multipath-tools/mul... | 1 
           python-numpy-1.23.5 | 1 
               syslog-ng-4.3.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7c39110ecaa97e39651f5a4ad6c199fea12401b4 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b4f4f0d61817dade86b46a0453973a447b3ec731 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/32102c80fefc50b666e89aa338add2e3ce7c5439 | ORPH
   s390x     | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/aa2e0617d1e35dbee864c14a5125208572853e36 |     
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/0c20cb5e4fc279d7fd82e265089f383616a726bb |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/90c42c22e28be9f0a57b9b1687f83b9a2a7e0a71 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/f06806692d8ede95a0d9f690488cfe0d68c916bf |     
  mips64el   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/886aec52f56cf130e827adffb213ea4def434af1 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/033059d8f354284ef59e2b85a4a6c66d0a823155 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/bf7ae76c9e39a4256e66b8501d36bffeaa2c3bfc |     
    arm      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/db69d95da8c5b9e536143305d279dc4bb502c8ad |     
microblazeel |          libnss-3.93           | NOK | http://autobuild.buildroot.net/results/f7f20904e0fb64e4f0d688ed31261f044a0ddd7a |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/690cb3df29da8abf97777a8fb267699f00290e18 |     
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/26aba92f71217ec4d6b2608cbd3ecd108efc9ea4 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8fed2df268c9f964b910f67ebe4af44c6ae20ef1 | ORPH
  mips64el   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d868132840dfe66dbb3136a0458c9c91c6628914 | ORPH
    arc      |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/97eae7ef3ad2fc57708870b06886fae7870399ee | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/c9c21df2ba2d056851319ea3356c46a35e7c424e | ORPH
   mips64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/73f9d7278a2ffb12404f10851d6f4d0f3d2cab78 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/e7e3120a5f68af62028072e8b7920270bb569d13 | ORPH
 aarch64_be  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/a043a060060068ff1f6cb310424600dbbff35b1f |     
   x86_64    |      lttng-libust-2.13.1       | NOK | http://autobuild.buildroot.net/results/3d2db4a5213e792197978e68ea830ef3633d9c42 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/45b2c1af052271bc2f1bb96544f138d29e4f7dfd |     
 aarch64_be  | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/633ceb38996af7c95331ebe878ae8ba8a4b9b7de |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/ed536cc72208aa38e57439418db2cd9627f5a810 |     
    arm      |        syslog-ng-4.3.1         | NOK | http://autobuild.buildroot.net/results/13d700b8e5a6b062f1390ef72cfa71fad514fd8b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/76dbc52bde2f435e127440f5b243a2f63099dcb6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.19.13 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/cf4deba872c347066238209d02851123f9cb4b73 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a41a55cb533b4f373808c416504f7b072dcadfae |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d8b6a306a50777691c0aa0bf36dc6fc2f9e861e1 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 libcurl-8.2.1 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         libcurl-8.2.1          | NOK | http://autobuild.buildroot.net/results/7f5a5ebc83f0bed38e9b763adb13ae1fc9e829c2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ddb9d9547d2ae09d45e18e0a289020599fa53029 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
