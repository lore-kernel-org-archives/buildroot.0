Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A65C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2749140012;
	Sat, 25 Nov 2023 11:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2749140012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EByD-Qlx0IQ8; Sat, 25 Nov 2023 11:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3038040217;
	Sat, 25 Nov 2023 11:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3038040217
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE7F1BF27C
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6963E606F5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6963E606F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npSd15IZAk3I for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:25:14 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B97606EC
 for <buildroot@uclibc.org>; Sat, 25 Nov 2023 11:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B97606EC
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1r6qmc-0003aT-7C
 for buildroot@uclibc.org; Sat, 25 Nov 2023 12:25:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 25 Nov 2023 12:24:44 +0100
Message-ID: <pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
 <20231124161523.215078-2-antoine.coutant__4480.32651781745$1700842615$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [[DO NOT MERGE] v3 1/7] package/meson: bump version
 to 1.3.0
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

Hi Antoine,

Am Fri, 24 Nov 2023 17:15:17 +0100 schrieb Antoine Coutant:

> It would be safer not to merge this patch without being sure that the
> problem was from qemu and not meson.

apparently there is a problem with meson for which an untested patch 
exists:
https://github.com/mesonbuild/meson/issues/11914#issuecomment-1764880338
https://github.com/dcbaker/meson/commit/
5440c57a63f81d5d6cdf0cf7a5c5613f766589f0

Also with this version bump you need to update support/misc/cross-
compilation.conf.in

-pkgconfig = '@PKGCONF_HOST_BINARY@'
+pkg-config = '@PKGCONF_HOST_BINARY@'

because of https://mesonbuild.com/Release-notes-for-1-3-0.html#machine-
files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
