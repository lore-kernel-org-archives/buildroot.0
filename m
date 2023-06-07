Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55800C7EE25
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A546C60F31;
	Wed,  7 Jun 2023 19:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A546C60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuckQPeUxFCU; Wed,  7 Jun 2023 19:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D396D60BBE;
	Wed,  7 Jun 2023 19:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D396D60BBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE9A01BF3C8
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 19:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A595E4018E
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 19:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A595E4018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NizM_yNC8lmf for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 19:08:18 +0000 (UTC)
X-Greylist: delayed 00:09:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C02784000B
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C02784000B
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 19:08:17 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 89561A0503
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:59:06 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 6F709A03C1
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:59:06 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 34E5C100592
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:59:06 +0200 (CEST)
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
To: buildroot@buildroot.org
Date: Wed, 07 Jun 2023 20:59:05 +0200
Message-ID: <12221308.O9o76ZdvQC@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1956
X-purgate-ID: 154282::1686164346-197FE7B6-215127FC/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1686164346;
 bh=3Vn3w+sYIXcUfw1JjKdpY2vqxDeXStJQIwOWIabXLYM=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=gRc9TrEKoQMhmTTv2fHb4d2MfXI53zkFt+w+O6ufDG7t8T6Yy3s4uVxTJOxGCZYAT
 jIVHDC119bCkWQYg9Q6eDlPKq0ruxX/AdWcwruLUUuHfyUDnv2vVD7akKs97G97D7j
 bg5rOLyYoxu7th6g30xY4eZ8X8HNq5ioysgj991+llqFtFoeABDDCSyn1H4g6Sjsf1
 7lCtyM2vUkpsYgfSKass75v2MzmwFRRXKWLtvYmQ8j6baesIfr6SYMy6rFvyBV1T5u
 hCgDeqcrJrQwjkbvcLvFeoZkYirb42pDankjTrzDngIjUa0QpaDPT9Byds9p+9pHgI
 D0wAS3JenjxTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=gRc9TrEK
Subject: [Buildroot] Interested in board support for Radxa Rock 5b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

this is my first email on this mailing list (and almost the first on an
opensource mailinglist in general), so please forgive me and notify me about
any mistake I make ;)

I would love to use buildroot to create images for the Radxa Rock 5b. However,
I am not much experienced and have a few questions about it:

There exists a project on github from a user called flatmax, which provides
files to support building bootable images with buildroot for different boards
with Rockchip SoCs. Using this project, I was able to create a bootable image
for the Rock 5b.

However, I would rather like to see buildroot natively supporting the Rock 5b,
if possible.

From what I see, the project from flatmax uses a special Linux kernel and
u-boot, both provided by Radxa. In addition it also seems to need precompiled
ATF binaries, provided by Rockchip. According to a blogpost on the Radxa
forum, Rockchip does not provide the ATF sources for the particular SoC, but
only compiled ATF binaries.

Hence, my first question is: Is it in general ok to provide a board support
(i.e., a defconfig) to buildroot, which then uses such alternative sources
(e.g., Radxa kernel, Radxa u-boot, Rockchip ATF binaries)?

I also saw that someone from Collabora currently works on u-boot networking
support for the Rock 5b. I am particular interested in that, as I would love
to be able to setup a tftpboot. I was already successful in using the u-boot
version from Collabora to boot the kernel image and rootfs from the flatmax
buildroot via tftp and nfs. However, I built the Collabora u-boot seperately,
i.e., not as part of buildroot.

Hence my second question is, are there people interested in (or maybe even
currently working on) buildroot support for the Rock 5b and could help me? I
saw that the defconfigs of other boards with Rockchip SoCs were dropped in the
past due to lack of maintenance.


Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
