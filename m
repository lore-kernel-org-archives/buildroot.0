Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3C3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 02:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E311607AA;
	Thu,  3 Feb 2022 02:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfYNRuIcqmdO; Thu,  3 Feb 2022 02:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921D260745;
	Thu,  3 Feb 2022 02:01:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BDAF1BF9C6
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 02:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12F9760745
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 02:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPToSaf4-jRr for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 02:01:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D555F60736
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 02:01:56 +0000 (UTC)
Date: Thu, 03 Feb 2022 02:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail2; t=1643853713;
 bh=Lt161HM+dKNPAsn/n8uzR7cVjHQ1JVUP/RKQ2RBr2u4=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=ljee69G1kP8GvEgshtSIQ+SEI717Ec5snb2mVntA3t1LDofaYvzga6i31M5+ulzof
 0DlTgt1kwkaKPkGn1r3CXrb/DEi2mQXm4iIM7Emzz9Z4Xie7ON2wF4p1i7ETnnr1HN
 UwiKfR9aDPLpsICZW7DTgqvQPa/3wbzIjJ8rheGtT21+bNTWCmKaXJwBFaZA2hhF9a
 TRd2AiyyrcRQms0FSyEd7spuO8Hc7EcRvsrsNdeZwRIoFAfmLeDQnO+wskkHKpcLHN
 NQpljqutKCiGFtcenrGsNn4qHbVbYnrQPoTS1BMdb9GT9GycN4A4AYo7K9VT+3634G
 mIBSN+rF7IYYg==
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
MIME-Version: 1.0
Subject: [Buildroot] package libldns
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
From: ca0 via buildroot <buildroot@buildroot.org>
Reply-To: ca0 <ca0@protonmail.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building this package with orangepi_zero_defconfig results in an useless user system because both thee files are blown away
./output/target/usr/lib/ld-musl-armhf.so.1
./output/host/arm-buildroot-linux-musleabihf/sysroot/usr/lib/ld-musl-armhf.so.1

Is the ldconfig hackery needed for embedded systems and is it supported when cross compiling?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
