Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26EBC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8812D4177C;
	Mon,  5 Feb 2024 09:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8812D4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4L3Z99qjkaB; Mon,  5 Feb 2024 09:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C4741775;
	Mon,  5 Feb 2024 09:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C4741775
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBDE1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C4660EFD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C4660EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1_hi7juVOnS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:50:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C644860E83
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C644860E83
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA7CBFF80D;
 Mon,  5 Feb 2024 09:50:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWvcs-00BEm0-37;
 Mon, 05 Feb 2024 10:50:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20240123091317.293492-1-thomas@devoogdt.com>
Date: Mon, 05 Feb 2024 10:50:54 +0100
In-Reply-To: <20240123091317.293492-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Tue, 23 Jan 2024 10:13:17 +0100")
Message-ID: <877cjjw875.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to v2.2.2
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
Cc: grim.delcour@barco.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > A bunch of release notes:
 > https://fluentbit.io/announcements/v2.1.8
 > https://fluentbit.io/announcements/v2.1.9
 > https://fluentbit.io/announcements/v2.1.10
 > https://fluentbit.io/announcements/v2.2.0
 > https://fluentbit.io/announcements/v2.2.1
 > https://fluentbit.io/announcements/v2.2.2

 > In addition:

 > - Dropped -fcommon fix for monkey (multiple definitions of `mk_tls_*'),
 >   as this is fixed upstream [1].

 > - Added WAMR related patches.

 > - Rebased the patches for v2.2.2.

 > [1] https://github.com/monkey/monkey/commit/627422b901af5c3c5b770d02c4a4567a0a8a61e6.

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
