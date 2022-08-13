Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CCCC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E80182A0E;
	Sat, 13 Aug 2022 10:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E80182A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIS6WYTpS70y; Sat, 13 Aug 2022 10:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C89E82865;
	Sat, 13 Aug 2022 10:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C89E82865
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6171BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EDC60BEB
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EDC60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5o2tfLFdxGxq for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182CF60AD3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 182CF60AD3
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:56:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED29660007;
 Sat, 13 Aug 2022 10:56:42 +0000 (UTC)
Date: Sat, 13 Aug 2022 12:56:41 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220813125641.43312d45@windsurf>
In-Reply-To: <20220812124952.182664-1-troglobit@gmail.com>
References: <20220812124952.182664-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6xi86Uu18cnbMUW2EKbim21M1oK+EyzuPhgqm0vhVg=;
 b=UQ1zyMKcL5NL4B7W/PH0/h1ABKbRPsfamp8JNZMalES6iBVpqpiXJxIIkZyXxUHi8cCbzO
 Eg472HXg8+kbY7LfXgiQFQ3swTddeA/QJwPcoRe/lb/n2wZV81mMvLnNJw0R4wuoe0kOXJ
 NIXiLQr33B5+nQZufSkODP5w2k30Xg12c1KzEyNcnBWyeYjqGg3+m3TQgY3pR/OqMwcycK
 d2rbnQN8RaNZlvAklY40bh08fFqook3uT01ddadF1WivO0vHG+av7yt28Ke+xJXEOvM/2o
 BanRjouXFP3OqR5z//KsUChraiSCXRwu2MUqvGfaOSC9usWjJiZ3kwVdFG33jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQ1zyMKc
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 14:49:52 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Fixes garbled tag name in std log file output (critical), and addresses a
> minor issue with confusing project name from `syslogd -v` vs `logger -v`.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Even though we normally don't take version bumps in master at this
point, this seems like a minor release with very few changes, all of
them being bug fixes. So applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
