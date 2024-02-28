Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B169C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41B0E40232;
	Wed, 28 Feb 2024 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSjVFJM4ZvpD; Wed, 28 Feb 2024 21:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A0FB40383
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A0FB40383;
	Wed, 28 Feb 2024 21:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3091BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94D6440232
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgojZMlLonC5 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45777400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45777400AB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45777400AB
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:21:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F51FFF802;
 Wed, 28 Feb 2024 21:21:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfRMY-0031H6-1V;
 Wed, 28 Feb 2024 22:21:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240203183533.162251-1-fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2024 22:21:14 +0100
In-Reply-To: <20240203183533.162251-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Feb 2024 19:35:33 +0100")
Message-ID: <87cysgjned.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: fix CPE variables
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

 > cpe:2.3:a:d-bus_project:d-bus has been deprecated in favor of
 > cpe:2.3:a:freedesktop:dbus in December 2023:

 >   <cpe-item name="cpe:/a:d-bus_project:d-bus:1.15.6" deprecated="true" deprecation_date="2023-12-27T16:36:56.510Z">
 >     <title xml:lang="en-US">D-Bus Project D-Bus 1.15.6</title>
 >       <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/tags">Version</reference>
 >       <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/issues/457">Advisory</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:d-bus_project:d-bus:1.15.6:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:freedesktop:dbus:1.15.6:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
