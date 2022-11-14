Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C494C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B861409D9;
	Mon, 14 Nov 2022 15:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B861409D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcPOh-MVgyPf; Mon, 14 Nov 2022 15:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F734067B;
	Mon, 14 Nov 2022 15:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F734067B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A82311BF2C5
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8252B4089E
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8252B4089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JykRf5iEPGh for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:40:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 469D64086B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 469D64086B
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:40:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63761240014;
 Mon, 14 Nov 2022 15:40:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oubZa-006ypx-9d; Mon, 14 Nov 2022 16:40:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@xes-inc.com>
References: <20221104151242.2735240-1-vfazio@xes-inc.com>
Date: Mon, 14 Nov 2022 16:40:34 +0100
In-Reply-To: <20221104151242.2735240-1-vfazio@xes-inc.com> (Vincent Fazio's
 message of "Fri, 4 Nov 2022 10:12:42 -0500")
Message-ID: <878rkdlf2l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: specify SWU_VER
 during build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@xes-inc.com> writes:

 > The swupdate build process uses SWU_VER as part of the build commandline
 > for compiling objects to define the value for use in globals.h (see also
 > Makefile.flags).

 > This value is also used to communicate capabilities to lua handlers
 > (see upstream 0f38ff186e76c55c8d00ccb53739a29bcca91445).

 > When swupdate gets built, SWU_VER defaults to using `git describe` to
 > determine the version. This, unfortunately, picks up the version of the
 > Buildroot checkout and not the actual version of swupdate.

 > Now, specify SWU_VER as part of the make options to override the
 > calculated value so the proper version is reported.

 > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
