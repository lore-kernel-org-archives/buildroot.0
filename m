Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824CFC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 09:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159E680E48;
	Sat,  5 Nov 2022 09:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159E680E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFYjT-Vs_fuA; Sat,  5 Nov 2022 09:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A14580DB6;
	Sat,  5 Nov 2022 09:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A14580DB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 257231BF4E6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 09:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E45080CF2
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 09:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E45080CF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5cGX61yFhqX for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 09:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F3180BC7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F3180BC7
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 09:29:39 +0000 (UTC)
Received: from [176.231.53.223] ([176.231.53.223]) by web-mail.gmx.net
 (3c-app-mailcom-bs11.server.lan [172.19.170.179]) (via HTTP); Sat, 5 Nov
 2022 10:29:36 +0100
MIME-Version: 1.0
Message-ID: <trinity-5e5104ec-f62c-4643-b0ac-dfd2df7c6f42-1667640576096@3c-app-mailcom-bs11>
From: daggs <daggs@gmx.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Nov 2022 10:29:36 +0100
Importance: normal
Sensitivity: Normal
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:p/Al9LSpUkcs6OWvgG9HdWN4OpUJcTM8YxjcXNwURGqTmpHBmPQofEpyVWUf7hix2O8Xe
 f88ZzACQ48hpQW58zbGAKKaUPPtkz8mcPrCVkEKxX4ipbXmsiZcRisqIngBpiFjYt0+HWX3r5maF
 p4HUPlAIJ+DAvz1AGvpEVNAwt+2maifGqG7zJThYMt11MBWJ8LAFySHjPhfq1tFNjHwDd+k1VThh
 t6gQ1XSjmijC06jZhluCY7AeO+4+9NUYiWtGmYQi2LliNniUNB+vK9jxwARWMnoH3deFyx5qdmGZ
 lk=
UI-OutboundReport: notjunk:1;M01:P0:iRSRqQE3Il0=;V7D/cRXObDzkHEQ8sIE8PPEqAVW
 1jaewlCoQ4evztMLN0lV/N71maWur0dArbdKFgZrQQCOKe4V96ouBXwI1idqlVvLmUbNEBE15
 Vfiorl46nLXaNUNYnGjOQ3ah9TA7hvgKXyYYxJtLz0jv7iymZrAz5YLi+VDVWxCVvCn1C1z3x
 qPIlxI6b/vtuIgTXvWgdGbHy+KjXXU3qqLswylLr7KdSUXtUQFiNHcClVwGdOmcj7BqloTOfp
 a+XPN+Va5AYs93Xz3aYBOZzWulV2anHKkmJggDcq3iuz5VFQ2RlYE0pBTxJibaP6/lsLnHBrl
 x2cqQFouluxv0E8LEzMFM6sgqEDjzSrghLpy+umjxm3MCCpgzQR+NbgIDB3Q+LZrVUIFfnIdc
 x8b6KJcldbTAfQxfEXCoKrLysjWNCd0z13WCMi+WpjeraleBuPlPTgVPdaBpakEHgQ0Yt7S91
 oAPrP3fR6gMOWaJZhvGX7eBJbvGZOtvfzgtSieQvUH6K9oGCHaFJsnGvdtYozufcB6LItdimS
 ASPCH4M+ZjCDHMR2UE+KPk8KlIF1HykSXupIZ62NAZR3cZVuuW0cGd1Pumc9+2OG0keMtqnjs
 ETaAQydMRePGYTOTNAUXMx75g71BAAa20AHQ3/jxz+w5ZW8XZkNzIEA5UzXehg0TX9wv5CWHB
 aI8Q0jQVvduWBOec5GWohY7fu/9+j3RM12+FHSep+FeT/rbtsW5N/QcQq48wcWS/ToqUOZiuC
 He01bupSahpPMyUKR8Ml4jrpqEJkSxgF4PKY0FXOCOKAL7phHGTZSUIx6PDfwz7aueNZJbWk0
 bsBTz1tSJ7ZM6eYHyylWAa26x5jz/kqRuBKqwyKssc7Pg=
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-04
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

Greetings Thomas,

> Sent: Saturday, November 05, 2022 at 9:37 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Subject: [autobuild.buildroot.net] Your daily results for 2022-11-04
>
> Hello,
> 
> Gitlab CI failures
> ==================
> 
> Below is a list of Gitlab CI job failures in relation to defconfigs or
> runtime tests you are in charge of. Please help us improving the quality
> of Buildroot by investigating those build failures and sending patches
> to fix them.
> 
> Results for 'master'
> --------------------
> 
> Build failures related to your defconfigs:
> 
>                         defconfig |                        link to the job                       
> ----------------------------------+--------------------------------------------------------------
>                          odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233868 
> 

I've tried to reproduce it on latest master and the didn't reproduced, any idea how to reproduce it?

Dagg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
