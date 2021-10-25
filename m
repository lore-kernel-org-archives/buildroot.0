Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FB5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:10:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BBF60F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2BBF60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD3880D6E;
	Mon, 25 Oct 2021 12:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui2r2yUeWl7V; Mon, 25 Oct 2021 12:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C3380D5F;
	Mon, 25 Oct 2021 12:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 365651BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2578D80D5F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vihlz7FL2OVU for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:10:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0410E80D53
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:10:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1D84120003;
 Mon, 25 Oct 2021 12:10:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meyoU-00016L-DA; Mon, 25 Oct 2021 14:10:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Arnout Vandecappelle \(Essensium\/Mind\)" <arnout@mind.be>
References: <20211018195822.2263226-1-arnout@mind.be>
Date: Mon, 25 Oct 2021 14:10:50 +0200
In-Reply-To: <20211018195822.2263226-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 18 Oct 2021 21:58:21 +0200")
Message-ID: <87k0i1wbhx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] tests: sample_python_dbus_next: ignore
 F821 flake8 error
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The dbus-next package uses the Python type annotation for dbus types. This is
 > not compatible with the python typing assumption that flake8 makes.

 > Exclude F821 from this line.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829
 > partially:
 > support/testing/tests/package/sample_python_dbus_next.py:17:36: F821 undefined name 's'
 > support/testing/tests/package/sample_python_dbus_next.py:17:48: F821 undefined name 's'
 > support/testing/tests/package/sample_python_dbus_next.py:17:56: F821 undefined name 's'

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
