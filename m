Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB2C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A60540A38;
	Tue, 15 Nov 2022 13:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A60540A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baoZFx29KIsL; Tue, 15 Nov 2022 13:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E896409E2;
	Tue, 15 Nov 2022 13:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E896409E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCCD41BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A739D404EB
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A739D404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2p6iL01H2on for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:29:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971A040081
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971A040081
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:29:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CD361C0008;
 Tue, 15 Nov 2022 13:29:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouw0G-008gVu-IO; Tue, 15 Nov 2022 14:29:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221114135126.20201-1-neal.frager@amd.com>
 <20221114221435.2d17a891@windsurf>
Date: Tue, 15 Nov 2022 14:29:28 +0100
In-Reply-To: <20221114221435.2d17a891@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 14 Nov 2022 22:14:35 +0100")
Message-ID: <87r0y4e47b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/kv260/kv260.sh:
 fix u-boot.itb without CONFIG_MULTI_DTB_FIT option
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
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 14 Nov 2022 06:51:26 -0700
 > Neal Frager via buildroot <buildroot@buildroot.org> wrote:

 >> This patch fixes the kv260.sh to generate a working u-boot.itb
 >> now that the CONFIG_MULTI_DTB_FIT u-boot option is no longer used.
 >> 
 >> Fixes:
 >> 
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
 >> 
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> board/zynqmp/kria/kv260/kv260.sh | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
