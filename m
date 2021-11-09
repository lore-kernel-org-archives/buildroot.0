Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33CDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B9761130
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84B9761130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569A440187;
	Tue,  9 Nov 2021 09:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAZPWXPXt-j1; Tue,  9 Nov 2021 09:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C0240144;
	Tue,  9 Nov 2021 09:58:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FED71BF2B0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E01380ED0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxUIRj121OMm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 09:58:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E309C80ECF
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 09:58:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CB3AE240011;
 Tue,  9 Nov 2021 09:58:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mkNtA-0001Y9-2p; Tue, 09 Nov 2021 10:58:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211106180942.27850-1-ps.report@gmx.net>
Date: Tue, 09 Nov 2021 10:58:00 +0100
In-Reply-To: <20211106180942.27850-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 6 Nov 2021 19:09:42 +0100")
Message-ID: <87wnlh1wif.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
