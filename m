Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B714CD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED3D4027B;
	Sat, 31 Aug 2024 19:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMVkov032mQH; Sat, 31 Aug 2024 19:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1185E402AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1185E402AC;
	Sat, 31 Aug 2024 19:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169381BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF3281432
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQtaDxxBUxb0 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB4408143A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4408143A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB4408143A
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:01:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.123.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbkC-1sW6IX2mJ2-00MLaT; Sat, 31
 Aug 2024 21:01:45 +0200
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:01:23 +0200
Message-ID: <20240831190126.366600-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:F6EkEBVXeoIvsMm2P9HXxp70HtqHtPMteur4rbhhUKPluhzxn7d
 vncxeyFTlSYVfmr+zpW7AYdZxYeyRBn0RyWrmzgWKRvDEcDBuw4zEd8uHz98CNUB6mgwXvx
 Mz4v4JclgWYZiGUejaPESab+NHPK7K0euackVuqo5UHCgXqc5SOTqTR4vcnCgG/wHqW7ziR
 /EuM6gqPmYm0ix2s8FEjg==
UI-OutboundReport: notjunk:1;M01:P0:7sFEQqJy3ZM=;nU00C+9sqqmgJ8oLWmvYEe8kSkJ
 grdb3ngZ/ubL32/Nn14PbWd8Z+9J6NF1sXvZU7LaHW0HxJs928iMTHFPxHDcKGMtM3KWL5+VQ
 0IbBQ8JOkoNZU+6mCE5QE08Lhk9bX37V60oUXVnIiYgINL8YTnRiNbCgyZ3wNV8LMoJEWDIA9
 Elq33fMWpM9HVXj6X0JfvNnXSGHaCKppE28kGhxhIWv3pm953o8DpRRBLsNnQhFkXw6Jo37Cu
 Dl0iNzNGw1P0w1Y/wVoKpRu8M/jViWzkgyibKSCTXcqUku8dUchJIi439szWtHrrZ7R7W3twh
 iuEck2fP3YwVHRZoNQNo0ZRNMBHj0TAWzGxee8p1jyJ/pm7O1tqpti0UQ0DHNu5WKxJZEDffk
 xKhT/j+fkDBsNT83jwI7t4Qp8KqXtuZ0nluXXScp3ToZHeSFbxSuP+Ppx0ERPZSEsZmYtkCI9
 67ISnsgAc9D138OneqTWb/38OetStURtmLPyjEbHnJHLSr86B96gpRTWD6708lc8S7BHu6IBD
 3UtXU5iJKAJ0Na0ZxPC374oLIyQ0y8y7KVWPGe+tGY2NmTQ3o1v39pf4IyN6Ee9X4Ypg9rxIT
 4lQTRHx5A/w0fGiM+P0HAbE5aztKb5BoqJfaCDxTt8YNwW7KnYVYOSwwZwEDaxqZkJWNWv24n
 NpbK3JktM3WAo7PqxUugfxcHYpCaGH5GQWiUg6N6dT4CBPODg5+d42gFt+26sJQjyOmQYBHA+
 nb4hF0MQe1HE0bMiOteyWoasls3PAVO6zvrzS99/4Jz4iDUP5Yh7TnllE5Dk78i0QmeRzFDyY
 ljBEolzbdl7hmETEhLFqAOSg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725130905; x=1725735705; i=fiona.klute@gmx.de;
 bh=tUaOVp5u9/cFYO5xxSjEqLis7H6XPWHnXiFnu4YXN3Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mCV10Xg+/UneMrsVETwi+XANtDXgqP0psyfapSxJc+U3hYW9LZH6mOxrGjy90T0a
 4jYkFwpu97vyYzKPRH9U2emQyADrfYfcGxHWRtg9DQPnobKmjidg2vbGW3rw8X1b/
 Lt5J3VBP74lQcUEqgvjh735oN9b7pFVmZb4q0S44yEzPVTE5xWogUzFH0JeITyFAC
 rHOyBl4nJ46YJNldbCWnpaLJEZhlI3zjQ8/PVX5Lox5EYhF9j2N3rsaIpUNWH8f0z
 mTbZ1Kixjg0LPabkVaG/cM7vVL9TLvdQwA2KHs4pHigdi/kpKas/u7fWJXIhh8mQM
 q2godHT9EfHBff42wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mCV10Xg+
Subject: [Buildroot] [PATCH next v2 0/3] U-Boot on RPi boards
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

I'm working on a system that needs U-Boot to manage booting on an
RPi-based board. These first two patches make working with this setup
easier, the third adds a defconfig to demonstrate a minimal bootable
U-Boot setup.

Fiona Klute (WIWA) (3):
  board/raspberrypi: Support boot.scr for U-Boot
  board/raspberrypi: allow non-matching globs for DTBs
  configs/raspberrypicm4io_64_uboot_defconfig: new defconfig

 board/raspberrypi/boot.scr.in                 |  9 +++
 .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
 board/raspberrypi/post-image.sh               |  8 +++
 board/raspberrypi/readme.txt                  |  4 ++
 configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 board/raspberrypi/boot.scr.in
 create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
 create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
