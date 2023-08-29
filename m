Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD5C83F17
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E8AC60BE3;
	Tue, 29 Aug 2023 20:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8AC60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3r72EaktmOY; Tue, 29 Aug 2023 20:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C456960760;
	Tue, 29 Aug 2023 20:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C456960760
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F131BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 002F140908
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 002F140908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYjdQvzipcAK for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:32:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C750E40195
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C750E40195
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78D4DE0005;
 Tue, 29 Aug 2023 20:32:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb5OL-008fhW-Jj; Tue, 29 Aug 2023 22:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230721212545.2371188-1-bernd@kuhls.net>
 <20230721212545.2371188-2-bernd@kuhls.net>
 <20230723154308.GJ2503916@scaer>
Date: Tue, 29 Aug 2023 22:32:49 +0200
In-Reply-To: <20230723154308.GJ2503916@scaer> (Yann E. MORIN's message of
 "Sun, 23 Jul 2023 17:43:08 +0200")
Message-ID: <87ledt37ym.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mariadb: needs pcre2
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > +Peter K. for backports.

 > On 2023-07-21 23:25 +0200, Bernd Kuhls spake thusly:
 >> Upstream added the possibility to build with system-provided pcre2
 >> https://github.com/MariaDB/server/commit/016bd4fc5fff311dc4091b3b7329cd980dbaa14b

 > This commit dates back to 2014, and we introduced mariadb in Buildroot
 > in 2016, so the possibility to use a system-provided pcre2 was already
 > present in Buildroot.

 > Peter:
 >     So, this commit should be backported to stable branches.

From a quick test, it doesn't seem to work with the 10.3.x version we
have in 2023.02.x / 2023.05.x, so I've skipped it for now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
