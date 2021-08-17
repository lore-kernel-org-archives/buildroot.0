Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C75C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306BC60FA0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 306BC60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED03D605F9;
	Tue, 17 Aug 2021 10:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOAQWgxFfEqW; Tue, 17 Aug 2021 10:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCC860627;
	Tue, 17 Aug 2021 10:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98FFB1BF271
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 886C460627
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2NMHCioqHGw for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 10:56:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D463B605F9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 10:56:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 317BF240008;
 Tue, 17 Aug 2021 10:56:25 +0000 (UTC)
Date: Tue, 17 Aug 2021 12:56:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210817125624.54e64a83@windsurf>
In-Reply-To: <871r6s4avr.fsf@dell.be.48ers.dk>
References: <871r6s4avr.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-08-15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 17 Aug 2021 12:35:20 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >              name              |       CVE        |                             link                            
>  > -------------------------------+------------------+--------------------------------------------------------------
>  >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432    
> 
> Hmm, looks like we have a bug in the version comparison logic. We have
> 2.0.11 and the CPE data states <= 2.0.7:

No, the CPE data states: "Up to (including) 2.07". Notice how 2.07 is
different than 2.0.7 ?

2.07 is indeed "newer" than 2.0.11, so our comparison logic works fine.
You can look at
https://nvd.nist.gov/vuln/detail/CVE-2021-34432/cpes?expandCpeRanges=true
which shows the full list of CPE IDs that are considered vulnerable,
and 2.0.11 is among the one considered vulnerable, based on the
(probably incorrect) 2.07 information.

If you have some evidence that shows that the fix only affects versions
up to 2.0.7, then we can contact the NVD maintainers and get the issue
fixed.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
