Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97A0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 02:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C92D40573;
	Tue, 15 Feb 2022 02:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81kjmXCkN0mu; Tue, 15 Feb 2022 02:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 542B54056E;
	Tue, 15 Feb 2022 02:17:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 159301BF324
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 014A640543
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuXeCo3J6RS5 for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 02:17:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429ED404F8
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 02:17:02 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JnOmn9KDEXmFAJnOmn8u7q; Tue, 15 Feb 2022 03:17:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644891421; bh=vWTAKGoKLp1erqpNPyvh54BYg8vCj/6sb7VcKEcZBTg=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=LPazJQme3i/nNC9alNtGQUJT4qcFBm+dBMpSqZnx8Il2j4aAHdJ1CNLuwGhsakrNc
 5kG8sK4Fi+L4dP7EeRYU05o8Jx96RpVeEcFn1D7f/4D56mqCPS8FBR5owIk2HmdoRh
 HaoaWYyeEqf7TZr9nC4V/QVBLuATZ2iJLI2d0CLr17WtD30CG1lr6upbNb0EFCTOVZ
 j+3FtKuIYFgkYuX5ERKENTacmny0m8J90UxPOFUFUgIGxrqutooSKeX1Ekv363KjMP
 g0GuDsITVBDgKvQXnX2LiliTPhFDuKhejQUKW6Zvf84BBViXOo1M7ZZ369+88TZMM+
 sB12Ps2k1OY1Q==
Message-ID: <a3e63379-c955-3156-351d-734988d3a668@benettiengineering.com>
Date: Tue, 15 Feb 2022 03:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Luca Ceresoli <luca@lucaceresoli.net>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
 <eff4604f-7630-d8d3-6ebb-dfbef57b8663@lucaceresoli.net>
 <f942379b-566a-dc23-b593-968b8613ef83@mind.be>
 <80ba31da-8a8e-12ed-bded-025e47f5cced@benettiengineering.com>
 <2169b106-8ed7-4eaf-1409-6dfe3eb19c0d@lucaceresoli.net>
 <9c579246-5466-58c8-8831-e8282041d952@benettiengineering.com>
In-Reply-To: <9c579246-5466-58c8-8831-e8282041d952@benettiengineering.com>
X-CMAE-Envelope: MS4wfAJR9bilLu2sLLysR/aNflcyyDybXwLKyz8NOD0VpPPdw1u8wKBfjcZBlCgsqHzafJFyg5c+ya6ZLE46ZDPpZPUniiz4oYGESnjb37WhXcLQUigPi2d4
 6q7LdyC6PKFPNMJThbwVbO+JoCJuFVvvatXDBg3vbMD+WOmaFP3rcEjpVEUDr8ZVDZNeLN6HC/H8j0DQLtjGgUyq9qoIuYJr9FNV1UWLvUCpRs7Ds0PYkCp7
 xjegALYQGsuTSTkABbcxEgx/mqUJwzkvZCeSCAp1c+LKLTssPLETxsj3ewggUu8dprfwL9SC5dfTBdWAEUzUm+N1MEf38Y5LQW3QJ3Yw/mFC0pLJbBud45lf
 C8vxH+Nnl1kFsffl7uUZeRoPSJT+2zK6e4oMf6GoD7K4VhKwOdE=
Subject: Re: [Buildroot] [PATCH] manual: board support: add instructions to
 test defconfig in the official docker
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/02/22 01:49, Giulio Benetti wrote:
>> I think we need simple instructions to ensure that anybody is able to
>> test their config builds without unnoticed host dependencies, before
>> they send a patch. I don't care whether it's docker or gitlab or
>> whatever. But it must be something documented and easy to do in a few
>> commands.
>>
> 
> At this point, once this patch [1] is upstreamed I will modify this
> patch and point to utils/docker-run.

[1]: 
https://lists.buildroot.org/pipermail/buildroot/2022-February/637017.html
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
