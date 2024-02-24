Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3BBC5478C
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 13:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E4F404C2;
	Sat, 24 Feb 2024 13:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfNkvIwnkDf8; Sat, 24 Feb 2024 13:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1A640207
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF1A640207;
	Sat, 24 Feb 2024 13:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4681BF27C
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 881B04079B
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrhUQHzKhzgi for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 13:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3566C40796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3566C40796
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3566C40796
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:58:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0942F60005;
 Sat, 24 Feb 2024 13:58:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rdsXn-00DT9D-0n;
 Sat, 24 Feb 2024 14:58:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
 <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
 <20240206233318.593730bd@windsurf>
Date: Sat, 24 Feb 2024 14:58:23 +0100
In-Reply-To: <20240206233318.593730bd@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 6 Feb 2024 23:33:18 +0100")
Message-ID: <87wmqut14w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 3/3] package/python3: bump version to
 3.12.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Adam,
 > On Mon, 18 Dec 2023 15:04:56 -0700
 > Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

 >> Python 3.12.1 has removed distutils support. As such, we remove the distutils
 >> option from pkg-python.mk as well.
 >> 
 >> Tested on Fedora 39, and Debian 11. All 68 package tests pass.
 >> 
 >> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 >> ---
 >> v3 -> v4:
 >> - Drop distutils in pkg-python.mk
 >> - 3.12.0 -> 3.12.1

 > I applied, but after doing a number of changes. The most important one
 > is that I had to reintroduce some of our --disable options: for
 > ncurses, sqlite and expat. Indeed, without these, you ended up with the
 > Python code installed, but not the correspond native library (the
 > py_cv_module__<something>=n/a only disables building the native
 > library).

 > I split up the pkg-python.mk change into a separate commit, which is
 > made before the python 3.12 bump. Indeed, it's semantically separate.

 > Finally, I updated the Buildroot manual to no longer mention distutils
 > support. And I did a separate commit to update the Buildroot manual
 > with other _SETUP_TYPE values that we support.

We unfortunately are still having a number of build failures because of
this, E.G. for target == host or packages using the imp module and we
are very late for 2024.02.x, so I have reverted this again.

We can apply it again 2024.05.x after the release and work on the
remaining issues.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
