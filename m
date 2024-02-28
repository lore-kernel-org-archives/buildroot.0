Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1745BC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8AE5410BA;
	Wed, 28 Feb 2024 21:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxrQIFNOPCgb; Wed, 28 Feb 2024 21:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4082410CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4082410CB;
	Wed, 28 Feb 2024 21:19:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1739D1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05016608B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpLwruwE2BxC for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 773E46088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773E46088E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 773E46088E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:17:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8FFF40004;
 Wed, 28 Feb 2024 21:17:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfRIb-0030xF-0r;
 Wed, 28 Feb 2024 22:17:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240203180247.143487-1-fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2024 22:17:09 +0100
In-Reply-To: <20240203180247.143487-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Feb 2024 19:02:47 +0100")
Message-ID: <87ttlsjnl6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/netatalk: update
 NETATALK_CPE_ID_VENDOR
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:netatalk_project:netatalk has been deprecated in favor of
 > cpe:2.3:a:netatalk:netatalk in September 2023:

 >   <cpe-item name="cpe:/a:netatalk_project:netatalk:3.1.13" deprecated="true" deprecation_date="2023-09-29T11:15:00.340Z">
 >       <reference href="https://sourceforge.net/projects/netatalk/files/netatalk/">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:netatalk_project:netatalk:3.1.13:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:netatalk:netatalk:3.1.13:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
