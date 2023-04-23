Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341CDC77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6D3417DC;
	Sun, 23 Apr 2023 09:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB6D3417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOaSq6wOW0DD; Sun, 23 Apr 2023 09:43:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6651E417D7;
	Sun, 23 Apr 2023 09:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6651E417D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6340E1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D70D817BD
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D70D817BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW8sbKUzV7YG for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:43:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A35BF81775
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A35BF81775
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:43:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F78C60002;
 Sun, 23 Apr 2023 09:43:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqWFc-002ZZQ-T0; Sun, 23 Apr 2023 11:43:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@gmail.com>
References: <20230403144105.419341-1-vfazio@gmail.com>
Date: Sun, 23 Apr 2023 11:43:20 +0200
In-Reply-To: <20230403144105.419341-1-vfazio@gmail.com> (Vincent Fazio's
 message of "Mon, 3 Apr 2023 09:41:03 -0500")
Message-ID: <877cu36iiv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/3] docs/manual: rewrite section for
 upstream documentation
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@gmail.com> writes:

 > Previously, the documentation only requested links to upstream commits
 > when backporting patches.

 > Based on a mailing list discussion [0], patches should, when possible
 > and when approriate, provide a link as evidence that the patch has been
 > submitted upstream.

 > The motivation is that hopefully the patch gets applied to upstream at
 > some point reducing the long term maintenance burden within Buildroot.
 > This also makes future patch review on subsequent package version bumps
 > more streamlined.

 > For patches that are unique to BR and do not apply to the upstream
 > repository, patches should have a comment explaining why they do not
 > apply upstream.

 > [0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666000.html

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Minor updates commit message body

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
