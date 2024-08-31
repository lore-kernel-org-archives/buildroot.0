Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98C9CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CCFA80D83;
	Sat, 31 Aug 2024 17:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEBAlr5oOrbu; Sat, 31 Aug 2024 17:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616D280D84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616D280D84;
	Sat, 31 Aug 2024 17:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 556A71BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4132F80D84
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgBZPGDgJGTi for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1588F80D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1588F80D83
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1588F80D83
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:10:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4D6120005;
 Sat, 31 Aug 2024 17:10:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRcD-00GYcH-0O;
 Sat, 31 Aug 2024 19:10:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
 <20240723231514.0c81f86a@windsurf>
Date: Sat, 31 Aug 2024 19:10:21 +0200
In-Reply-To: <20240723231514.0c81f86a@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 23 Jul 2024 23:15:14 +0200")
Message-ID: <87v7zgwrcy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 23 Jul 2024 14:01:40 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> - Drop all patches (already in version) and so also drop autoreconf
 >> - This bump will also fix the following build failure with gcc >= 14:
 >> 
 >> pgrep.c: In function 'main':
 >> pgrep.c:1066:37: error: implicit declaration of function 'pidfd_open'; did you mean 'fdopen'? [-Wimplicit-function-declaration]
 >> 1066 |                         int pidfd = pidfd_open(procs[i].num, 0);
 >> |                                     ^~~~~~~~~~
 >> |                                     fdopen
 >> 
 >> https://gitlab.com/procps-ng/procps/-/blob/v4.0.4/NEWS
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/bd7b49123905c580842a3dd3b7a338d5aedf55d7
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> .checkpackageignore                           |  3 -
 >> .../0001-configure-Add--disable-w.patch       | 93 -------------------
 >> ...ssing-nl_langinfo-on-certain-configs.patch | 34 -------
 >> .../procps-ng/0003-fix-pifd_open-check.patch  | 59 ------------
 >> package/procps-ng/procps-ng.hash              |  8 +-
 >> package/procps-ng/procps-ng.mk                |  4 +-
 >> 6 files changed, 5 insertions(+), 196 deletions(-)
 >> delete mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
 >> delete mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
 >> delete mode 100644 package/procps-ng/0003-fix-pifd_open-check.patch

 > Applied to master after tweaking the commit title and commit log to
 > mention that it's also a security bump. Thanks!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
