Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D54BC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 06:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C8060EA7;
	Fri, 25 Aug 2023 06:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C8060EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdRDcYSP8xTG; Fri, 25 Aug 2023 06:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D801D60BAF;
	Fri, 25 Aug 2023 06:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D801D60BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D447B1BF329
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 06:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD4A83459
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 06:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD4A83459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KcgLL5sIR-m for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 06:56:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E7C483180
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 06:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7C483180
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC54FFF807;
 Fri, 25 Aug 2023 06:56:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZQkE-002c32-Uz; Fri, 25 Aug 2023 08:56:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <87y1i0cfjz.fsf@48ers.dk> <20230824231615.44df3647@windsurf>
 <87ttsocexi.fsf@48ers.dk> <20230824232658.616ff7e0@windsurf>
Date: Fri, 25 Aug 2023 08:56:34 +0200
In-Reply-To: <20230824232658.616ff7e0@windsurf> (Thomas Petazzoni's message of
 "Thu, 24 Aug 2023 23:26:58 +0200")
Message-ID: <87pm3bd2zh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Afshin Pir <Afshin.Pir@gallagher.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 24 Aug 2023 23:23:53 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> It is unfortunately not right away clear to me how we can do that - Make
 >> source can fail for all kind of reasons.
 >> 
 >> Any ideas?

 > You could run "make busybox-source" first, to see if at least we're
 > able to source a well known package that's known to work. If that fails
 > (it would have failed with the missing Perl thing), we can abort and
 > notify us.

Ah yes, I will have a look at implementing something like that.

I BTW noticed that host-ccache no longer builds since the bump to 4.7.4
(in 2023.05). According to
https://ccache.dev/platform-compiler-language-support.html it needs
GCC >= 8, and the machine uses GCC 4.8.5.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
