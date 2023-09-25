Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E6CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52774817A2;
	Mon, 25 Sep 2023 05:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52774817A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0f3EtcgM3LCz; Mon, 25 Sep 2023 05:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E4A81501;
	Mon, 25 Sep 2023 05:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E4A81501
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5011BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04FCA60F69
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04FCA60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvDoOQ74Pd2u for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:30:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3573860B58
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3573860B58
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B193E0005;
 Mon, 25 Sep 2023 05:30:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkeAT-002EYG-LU; Mon, 25 Sep 2023 07:30:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Reza Arbab <arbab@linux.ibm.com>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-2-arbab@linux.ibm.com>
Date: Mon, 25 Sep 2023 07:30:01 +0200
In-Reply-To: <20230906194609.74080-2-arbab@linux.ibm.com> (Reza Arbab's
 message of "Wed, 6 Sep 2023 14:46:05 -0500")
Message-ID: <87wmwees6e.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/5] package/petitboot: fix
 HOST_PROG_SHUTDOWN value
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
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Reza" == Reza Arbab <arbab@linux.ibm.com> writes:

 > HOST_PROG_SHUTDOWN currently references a file that doesn't exist. Fix
 > by setting it to /usr/libexec/petitboot/bb-kexec-reboot, which this
 > package already installs but doesn't use.

 > Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Committed to 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
