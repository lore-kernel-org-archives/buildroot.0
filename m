Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7446BC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E536831FB;
	Mon,  6 Jun 2022 12:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWbbszU_oO2g; Mon,  6 Jun 2022 12:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6670582907;
	Mon,  6 Jun 2022 12:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7881BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D98661000
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nleQWZOAEKQw for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:35:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B850F60675
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:35:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6C72240002;
 Mon,  6 Jun 2022 12:35:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyBxF-00CprS-PI; Mon, 06 Jun 2022 14:35:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220518212015.439865-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 14:35:33 +0200
In-Reply-To: <20220518212015.439865-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 May 2022 23:20:15 +0200")
Message-ID: <871qw2vuju.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjpeg: security bump to
 version 2.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-29338: Integer Overflow in OpenJPEG v2.4.0 allows remote
 > attackers to crash the application, causing a Denial of Service (DoS).
 > This occurs when the attacker uses the command line option "-ImgDir" on
 > a directory that contains 1048576 files.

 > Fix CVE-2022-1122: A flaw was found in the opj2_decompress program in
 > openjpeg2 2.4.0 in the way it handles an input directory with a large
 > number of files. When it fails to allocate a buffer to store the
 > filenames of the input directory, it calls free() on an uninitialized
 > pointer, leading to a segmentation fault and a denial of service.

 > Drop patches (already in version)

 > https://github.com/uclouvain/openjpeg/blob/v2.5.0/NEWS.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
