Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2921FC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 09:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE560830E2;
	Sun,  7 Jan 2024 09:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE560830E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1AMuhzehJ4W; Sun,  7 Jan 2024 09:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2610282FCB;
	Sun,  7 Jan 2024 09:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2610282FCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97DD61BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7060460743
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 09:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7060460743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmibAhvMfYT0 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 09:29:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A873A606C6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A873A606C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id A25FE1C0003;
 Sun,  7 Jan 2024 09:29:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMPTc-006Yzn-2z;
 Sun, 07 Jan 2024 10:29:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
Date: Sun, 07 Jan 2024 10:29:52 +0100
In-Reply-To: <20231205235919.510051-4-adam.duskett@amarulasolutions.com> (Adam
 Duskett's message of "Tue, 5 Dec 2023 16:59:19 -0700")
Message-ID: <87msth1ofj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 > ---
 >  ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
 >  1 file changed, 61 insertions(+)
 >  create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch

 > diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 > new file mode 100644
 > index 0000000000..1719769872
 > --- /dev/null
 > +++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 > @@ -0,0 +1,61 @@
 > +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
 > +From: Sandro Mani <manisandro@gmail.com>
 > +Date: Tue, 5 Dec 2023 16:38:48 -0700
 > +Subject: [PATCH] Fix several defects found by Coverity scan
 > +
 > +From: giflib-5.2.1-17.fc39.src.rpm
 > +Upstream: Not submitted

No upstream and no CVE? Where does this fix then come from?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
