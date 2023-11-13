Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73663C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 18:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0481E40123;
	Mon, 13 Nov 2023 18:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0481E40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-fp2fw9Ofhz; Mon, 13 Nov 2023 18:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DAFF40179;
	Mon, 13 Nov 2023 18:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DAFF40179
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80BD01BF228
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 596A960A9C
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596A960A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZnILf9h68gQ for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 18:54:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A84660A88
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 18:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A84660A88
Received: by mail.gandi.net (Postfix) with ESMTPSA id B196E40005;
 Mon, 13 Nov 2023 18:54:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2c4T-00BRUD-2z;
 Mon, 13 Nov 2023 19:54:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231107124439.4105974-1-peter@korsgaard.com>
Date: Mon, 13 Nov 2023 19:54:05 +0100
In-Reply-To: <20231107124439.4105974-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 7 Nov 2023 13:44:38 +0100")
Message-ID: <875y25fprm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] utils/add-custom-hashes: add script to
 manage global patch dir hashes
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add a script to manage the .hash files in the BR2_GLOBAL_PATCH_DIR for
 > packages using custom versions.

 > To use it, run in a configured Buildroot directory, E.G.

 >   make foo_defconfig; ./utils/add-custom-hashes

 > We support multiple patch directories in BR2_GLOBAL_PATCH_DIR.  If multiple
 > directories are specified then use the last one as that is likely to be the
 > most specific one.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
