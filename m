Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEB0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:30:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E2A61101
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6E2A61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AC46073A;
	Sun,  7 Nov 2021 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7ruU1k3K38w; Sun,  7 Nov 2021 20:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 021156072D;
	Sun,  7 Nov 2021 20:30:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03C581BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E714940255
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytJmHoVyer_8 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:30:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3CBA401FC
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:30:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 50115100002;
 Sun,  7 Nov 2021 20:30:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mjooO-0006Jp-Kq; Sun, 07 Nov 2021 21:30:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211106180942.27850-1-ps.report@gmx.net>
Date: Sun, 07 Nov 2021 21:30:44 +0100
In-Reply-To: <20211106180942.27850-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 6 Nov 2021 19:09:42 +0100")
Message-ID: <87v9139097.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/olsr: add upstream patch to fix
 compile with gpsd-3.23.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add upstream patch ([1]) to fix compile with gpsd-3.23.1
 > Fixes:

 >   - http://autobuild.buildroot.org/results/53b06e72fb2d8b4c8b6ba41baf775ff33654cd18
 >   - http://autobuild.buildroot.net/results/54cae924711e26f04045f8208db0d772292a3933

 >   src/gpsdclient.c: In function 'nmeaInfoFromGpsd':
 >   src/gpsdclient.c:374:30: error: 'STATUS_NO_FIX' undeclared (first use in this function); did you mean 'STATUS_PPS_FIX'?
 >     374 |   if (gpsdata->fix.status == STATUS_NO_FIX) {
 >         |                              ^~~~~~~~~~~~~
 >         |                              STATUS_PPS_FIX

 > [1] https://github.com/OLSR/olsrd/commit/665051a845464c0f95edb81432104dac39426f79

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:

 >   - previous upstream patch was (after some discussion) reverted and
 >     replaced with the now provided one

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
