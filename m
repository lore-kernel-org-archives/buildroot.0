Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07EAC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 04:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1320B4177E;
	Thu,  2 May 2024 04:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzhQIV0M_IAa; Thu,  2 May 2024 04:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF7A2403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF7A2403E2;
	Thu,  2 May 2024 04:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551D21BF47F
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DC02407D0
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADwr7v_IjKKO for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 04:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79B71407D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B71407D3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79B71407D3
 for <buildroot@buildroot.org>; Thu,  2 May 2024 04:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3DF71C0005
 for <buildroot@buildroot.org>; Thu,  2 May 2024 04:01:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 02 May 2024 04:01:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714622477; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VOQh72jPDpOC2jltFc1sNc4xHz2U3Wx5RDjUmTEbrcs=;
 b=JWh8/ioSCpgnEdqoymaacGbZqVQ7KJOSVI0Aue1E1gMsCAOi57EbJyHY0/52J2Qjsg4UBK
 hDLLYQSmA4nbjTISZicm0Zt67/3QxyBmTUCUa+b0RajDF9tnlneGz6fYYLhaDMCWnBx9jB
 7vt2FJf3uYic58Kt7FekbS3aAHqXMLUpR3Gf8HB96h68osiZke15TSfvg7h9bFRmKQ4EqI
 m3XcvZVQrpQ18VGMeK4G3IZu9j3VQLbCf84l0MHGleyo0m3k0tWF1TXU4aBXItks666/zw
 wX+ejvEWwkHbXpmaINjmR9UA/D33WZX6owRIgqOs3XXZ5DuwlSbmS+uuaAiR5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JWh8/ioS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-01
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
Message-ID: <20240502040117.-zCRBYAQaygw7JeQt-wPKlicAaJXo_Zf5l-U2r0sVgA@z>

Hello,

Autobuild statistics for 2024-05-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
    master   | 20  | 30  |  1  | 51  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
host-heimdal-f4faaeaba371ff... | 2 
                libressl-3.8.4 | 2 
                    ncmpc-0.49 | 2 
         python-remi-2022.7.27 | 2 
               apcupsd-3.14.14 | 1 
             docker-cli-26.0.2 | 1 
                    fcft-3.1.6 | 1 
                  gnupg2-2.4.5 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
      gst1-plugins-base-1.22.9 | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
               libglib2-2.76.1 | 1 
                   linux-6.8.6 | 1 
                     mdadm-4.3 | 1 
package/python-pillow/pytho... | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
python-unittest-xml-reporti... | 1 
                    rtty-8.1.0 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/840c604aa397a17c02d13d4da8d62dd2c3d0a7f3 |     
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/a9810f6955c0ba1ea88dfac9d24f11ad87f9d15c |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/250d49380776cb4e375697950da317a72bc0702f |     
    mips     |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/c0e9d215885d72da15e4aea7cfe745e884a4eedb |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4e9c73235235325d95195a58818829706ae2ff0a |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6c22e40a7894535ea5a7ec1968b347281ef70099 | ORPH
   sparc     |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.net/results/904f13e64b0cc55281b2494a7358a7e024f84cfb | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c037a3cd55364373f04b7ab04c3811a138601543 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8651ea1a2d4227c578f0bbdc29c62dd406e18850 | ORPH
  riscv32    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b2b5f248147b83235a239e4a98491534f2630e40 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cdcb74b5dd38cddd3d572d7896941ea941e1bdbb |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4b272a00a51fed049de3ca230c1d8eccad0f0f95 |     
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4af728083a74e05ec212fe7b0e9c5536888af54f | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/85469717aaf9a392b6d01351c946cd9f4feb5ffa | ORPH
  mips64el   |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/6e7489859056e2c463a6fdce922779a54b9545bc | ORPH
   sparc     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/1a9dfa8284c7d40600e627e199b790137e0e8b69 | ORPH
  sparc64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/8ced1eaadf2f0791d4a41534ea7d422dd129f5fc |     
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/9498202579ba4b5cdfb53a44b12b360a092b9222 |     
    arm      | package/python-pillow/pytho... | NOK | http://autobuild.buildroot.net/results/5a35d83c73367e1b20534b1bc7f2f564cf653a38 |     
    i686     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/9c94c7ba1c647dfa5acc1b3ac119dc430a1c3323 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/97379583f6ad5bb5f5eaba27cc5cb088c72426b0 |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/941ca83ff4b0917a544e9504928c1c20df0af407 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/5762af9b2135e4fc37e51af644ee8ecd2fdd6194 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e5b6f74548e30a1671f0f461831debb935b46548 |     
  mips64el   | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/b46d6a36aed395ff17146f642ba8bf204d523d0f |     
  mips64el   |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/da46149b389d03c54b5c9fb6cfdbfe519ee76f5d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3549652c813380f6ae3ff12fca6a174b3cffe47f |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e7ed01ce4680468eb44312ae6bfa9872b1327919 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5a604753b53ac14a507415fea9645cd156fd1552 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/27ddf3d79e06df38afda8501866bd3166df41290 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5183fc3b834d23a2df82bb10caa518510a34d031 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
          libcamera-apps-1.2.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/52aedc9f581140570aa2654717badfd49d925a4f |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/49f7edc0e43f01ea711c2fac689a6111a4d659c8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
