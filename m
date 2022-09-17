Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F85EC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85EA61131;
	Sat, 17 Sep 2022 14:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85EA61131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1SRUYGC0bvp; Sat, 17 Sep 2022 14:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1236D6112A;
	Sat, 17 Sep 2022 14:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1236D6112A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACB61BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4341282AA9
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4341282AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YTBtq6CmoGr for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:30:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7F482848
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA7F482848
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:30:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19A2A40008;
 Sat, 17 Sep 2022 14:30:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZYpm-009MKL-S1; Sat, 17 Sep 2022 16:30:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220824094939.22D3787C26@busybox.osuosl.org>
Date: Sat, 17 Sep 2022 16:30:18 +0200
In-Reply-To: <20220824094939.22D3787C26@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 24 Aug 2022 00:00:57 +0200")
Message-ID: <878rmi2hvp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libinput: remove python tools
 scripts
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=15ab53968c5a92a99d5546d259057a87ace2e43c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Some libinput tools are actually python scripts and requires at least
 > tree python modules: libevdev, pyudev and pyyaml:

 > libinput]$ file *
 > libinput-analyze: ELF 32-bit LSB pie executable, ARM, EABI5 version 1
 > (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
 > libinput-analyze-per-slot-delta:    Python script, UTF-8 Unicode text executable
 > libinput-analyze-recording:         Python script, UTF-8 Unicode text executable
 > libinput-analyze-touch-down-state:  Python script, UTF-8 Unicode text executable
 > libinput-debug-events: ELF 32-bit LSB pie executable, ARM, EABI5
 > version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0,
 > stripped
 > libinput-debug-tablet: ELF 32-bit LSB pie executable, ARM, EABI5
 > version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0,
 > stripped
 > libinput-list-devices: ELF 32-bit LSB pie executable, ARM, EABI5
 > version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0,
 > stripped
 > libinput-measure: ELF 32-bit LSB pie executable, ARM, EABI5 version 1
 > (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
 > libinput-measure-fuzz:              Python script, UTF-8 Unicode text executable
 > libinput-measure-touchpad-pressure: Python script, UTF-8 Unicode text executable
 > libinput-measure-touchpad-size:     Python script, UTF-8 Unicode text executable
 > libinput-measure-touchpad-tap:      Python script, UTF-8 Unicode text executable
 > libinput-measure-touch-size:        Python script, UTF-8 Unicode text executable
 > libinput-quirks: ELF 32-bit LSB pie executable, ARM, EABI5 version 1
 > (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
 > libinput-record: ELF 32-bit LSB pie executable, ARM, EABI5 version 1
 > (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
 > libinput-replay:                    Python script, UTF-8 Unicode text executable

 > Since for now we do not have a python-libevdev package, this commit
 > unconditionally removes Python scripts.

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
