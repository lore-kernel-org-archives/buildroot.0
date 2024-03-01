Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C287C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C522741999;
	Fri,  1 Mar 2024 08:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tt1r5XpkjjU6; Fri,  1 Mar 2024 08:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D807F419D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D807F419D3;
	Fri,  1 Mar 2024 08:24:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 906381BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BFD1405CD
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNMbFBQBXf6L for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9213400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9213400BF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9213400BF
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:24:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FB242000B;
 Fri,  1 Mar 2024 08:24:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfyCA-006cQP-0C;
 Fri, 01 Mar 2024 09:24:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240226203532.12112-1-ju.o@free.fr>
Date: Fri, 01 Mar 2024 09:24:41 +0100
In-Reply-To: <20240226203532.12112-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 26 Feb 2024 21:35:32 +0100")
Message-ID: <87y1b2bbqu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mysql: change default
 implementation to mariadb
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The mysql package is a virtual package with two implementations:
 > oracle-mysql (the initial project), and mariadb (the fork of mysql).
 > This virtual package was introduced in commit [1] (2016).

 > The last version bump of oracle-mysql was in commit [2] (2014). This
 > mysql version 5.1.73 dates from 2013 [3].

 > Package statistics at [4] reports 177 CVEs on this oracle-mysql
 > version (as of Buildroot tag 2024.02-rc1).

 > Finally, oracle-mysql has 12 package patches accumulated over the time
 > and there is nobody registered in the DEVELOPER file for it.

 > On the other hand, the Buildroot mariadb package seems to be in a
 > better shape: the package version is more recent, and received
 > frequent updates, since its introduction.

 > There is several packages selecting BR2_PACKAGE_MYSQL, which will use
 > the old oracle-mysql without the user knowing it (other than
 > generating the CVE list with "make pkg-stats").

 > In the meantime oracle-mysql receive a major update, this commits
 > changes the default implementation of the mysql virtual package from
 > oracle-mysql to mariadb.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d707d2b4fa6362cb37754f6c5fbb06240f5faf5
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/42c56751fc554503a03d4a914ce2e814eeaf5a41
 > [3] https://github.com/mysql/mysql-server/releases/tag/mysql-5.1.73
 > [4] http://autobuild.buildroot.org/stats/master.html

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested on branch master at commit 7a9ba7a with commands:

Thanks. Maybe we should instead get rid of the oracle-mysql package (and
the virtual package) if nobody cares about keeping it updated anyway?


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
