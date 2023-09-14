Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE31EDE98F
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C42F4171C;
	Thu, 14 Sep 2023 08:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C42F4171C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szae0liJqnZp; Thu, 14 Sep 2023 08:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C203641711;
	Thu, 14 Sep 2023 08:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C203641711
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BAC51BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4467C4159C
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4467C4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3AR3seKbTX8 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:23:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F826408C0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F826408C0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85543FF80D;
 Thu, 14 Sep 2023 08:23:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qghdU-00851p-FJ; Thu, 14 Sep 2023 10:23:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com>
Date: Thu, 14 Sep 2023 10:23:40 +0200
In-Reply-To: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 28 Aug 2023 23:22:19
 +0200")
Message-ID: <878r99yxgz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/heirloom-mailx: fix comment
 about ignore CVE-2014-7844
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > In commit
 > 15972770cf34ed0b0ba330e3cc42c04f1c80c3c8 ("package/heirloom-mailx:
 > security bump to version 12.5-5 from Debian"), we added CVE-2014-7844
 > in HEIRLOOM_MAILX_IGNORE_CVES, but with the wrong comment about it: it
 > is a different patch in the Debian stack of patches that fixes
 > it. Indeed the description of patch
 > 0011-outof-Introduce-expandaddr-flag.patch is:

 > =====================================================================
 > Subject: [PATCH 1/4] outof: Introduce expandaddr flag

 > Document that address expansion is disabled unless the expandaddr
 > binary option is set.

 > This has been assigned CVE-2014-7844 for BSD mailx, but it is not
 > a vulnerability in Heirloom mailx because this feature was documented.
 > =====================================================================

 > See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
 > details.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
