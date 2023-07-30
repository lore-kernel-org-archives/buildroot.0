Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1129C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 12:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567AF4098A;
	Sun, 30 Jul 2023 12:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567AF4098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDeV-UiNAwGl; Sun, 30 Jul 2023 12:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A09941516;
	Sun, 30 Jul 2023 12:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A09941516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397B81BF419
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C168817C0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C168817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrWkfZ6gJZwL for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 12:10:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E06D8817BD
 for <buildroot@uclibc.org>; Sun, 30 Jul 2023 12:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06D8817BD
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qQ5FS-0003LM-9F
 for buildroot@uclibc.org; Sun, 30 Jul 2023 14:10:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 30 Jul 2023 14:09:48 +0200
Message-ID: <pan$54c76$d9938ed6$13d16be7$b5beaa08@ID-313208.user.individual.net>
References: <20230726171923.334017-1-bernd@kuhls.net>
 <20230728221509.1127286e__5257.07515641756$1690575343$gmane$org@windsurf>
 <pan$70d94$efb9e899$b44728f9$86f0fbf9@ID-313208.user.individual.net>
 <20230730132710.0d52cc18@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.76.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 30 Jul 2023 13:27:10 +0200 schrieb Thomas Petazzoni via buildroot:

> Because this one was skipped, none of the tested configurations had
> BR2_ENABLE_LOCALE disabled I believe, so your test didn't actually
> verify what I asked :-)

Hi Thomas,

building this defconfig

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_LIBGLIB2=y

$ grep BR2_ENABLE_LOCALE= .config
$

was successful:

Configure snippet:
  Run-time dependency iconv found: YES

$ readelf -a output/per-package/libglib2/target/usr/lib/libglib-2.0.so | 
grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libpcre2-8.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
