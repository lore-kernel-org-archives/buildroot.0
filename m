Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB708C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92491409FB;
	Sun,  5 Mar 2023 17:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92491409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w8E-SR01tem; Sun,  5 Mar 2023 17:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79FFA409F1;
	Sun,  5 Mar 2023 17:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FFA409F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9991BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355CB401D8
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 355CB401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdsLrgFL7zyC for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:38:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E9B4400F3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E9B4400F3
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:38:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAA101BF207;
 Sun,  5 Mar 2023 17:38:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYsJe-001iAP-RE; Sun, 05 Mar 2023 18:38:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230223141745.303457-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 18:38:34 +0100
In-Reply-To: <20230223141745.303457-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 Feb 2023 15:17:45 +0100")
Message-ID: <87pm9n6qud.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: fix build with fmt >=
 9.0.0
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

 > Fix the following build failure with fmt >= 9.0.0 raised since commit
 > 5c83dc5451fb59ffa5cd40d30c4c532dd25e8333:

 > /tmp/instance-5/output-1/build/gerbera-1.10.0/src/database/sql_database.cc:1688:26:   required from here
 > /tmp/instance-5/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/fmt/format.h:3973:36: error: passing 'const fmt::v9::formatter<fmt::v9::join_view<__gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, __gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, char>, char, void>::formatter_type' {aka 'const fmt::v9::formatter<ColumnUpdate>'} as 'this' argument discards qualifiers [-fpermissive]
 >  3973 |       out = value_formatter_.format(map(*it), ctx);
 >       |             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/56c46fa7e922360d2c4b4093f8a030cc83726799

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
