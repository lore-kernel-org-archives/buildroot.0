Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAC3C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1FEA40B60;
	Fri,  4 Nov 2022 07:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1FEA40B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzGBC_7eMcjy; Fri,  4 Nov 2022 07:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E5E4404F1;
	Fri,  4 Nov 2022 07:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E5E4404F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B187B1BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D3A361038
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D3A361038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB9U5r-eizRQ for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:43:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9311B6059D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9311B6059D
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:43:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C883624000A;
 Fri,  4 Nov 2022 07:43:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqrMI-00BXpG-UW; Fri, 04 Nov 2022 08:43:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
 <8818_1665746314_6349458A_8818_181_1_964b37c54bd0ea2c0ca9a24787249f3276aec699.1665746266.git.yann.morin@orange.com>
Date: Fri, 04 Nov 2022 08:43:22 +0100
In-Reply-To: <8818_1665746314_6349458A_8818_181_1_964b37c54bd0ea2c0ca9a24787249f3276aec699.1665746266.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 14 Oct 2022 13:18:27 +0200")
Message-ID: <87v8nvnp0l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] toolchain: suppot gconv modules fro
 mglibc >= 2.34
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > Startig with glibc 2.34, the gconv modules description has been split in
 > two:
 >   - a common definition in the old location, /usr/lib/gconv/gconv-modules
 >   - specific defitions in a subdirectory, /usr/lib/gconv/gconv-modules.d/

 > This is done so as to simplify the handling of glibc gconv modules, and
 > eventually to segregate those outside of glibc, and so that third-parties
 > may also provide their own gconv converters and their definitions.

 > And starting with that same glibc version, most of the gconv modules
 > definition is moved to an extra configuration file in that
 > sub-directory.

 > It is thus no longer possible to use special code pages, like cp850,
 > which are very usefull to access FAT-formatted devices.

 > Add suppot for this new gconv layout, while keeping support for older
 > glibc versions. Note that the modules themselves are not moved or
 > renaed, just the definition files have changed.

 > Instead of passing the one old gonv modules definitions file on stdin,
 > we pass the base directory to that file, and move into the script the
 > responsibility to find all the gconv definition files.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
