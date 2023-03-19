Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E8EC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 14:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A55640919;
	Sun, 19 Mar 2023 14:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A55640919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_P2OWYBqVXe; Sun, 19 Mar 2023 14:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D82C40914;
	Sun, 19 Mar 2023 14:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D82C40914
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 776D91BF34C
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5252E4016C
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5252E4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3j7OeWbgoUia for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 14:23:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9FA3400A6
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9FA3400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 14:23:44 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 25B4E205CF;
 Sun, 19 Mar 2023 10:23:40 -0400 (EDT)
Message-ID: <498b46b5-8834-80c6-661c-25bd12a00152@stevenhay.com>
Date: Sun, 19 Mar 2023 10:23:38 -0400
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steve Hay via buildroot <buildroot@buildroot.org>
References: <20230319021851.2593117-1-me@stevenhay.com>
 <20230319144436.3085aa75@windsurf>
In-Reply-To: <20230319144436.3085aa75@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1679235823;
 bh=CwcMCqioaJQN/UmIIpjoRI4UiBS5fkpBJUzSUXf8LMI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dk4e0QFSkDqAPlMMODImji9rk6HjEiv2SRr2xuoSK7Kpj9AlyHrYxmgk8M4ygNbrm
 5oQ59cVTAnhOtBfashrGsTWvGaY7ple0R3j2CkrLDzchRgI6LPBMx/Q5AdWSqrBt16
 DYImVM4AGrf2Nv80tQfIZ/wzXijKmVTTslF37o+5HpiAneu31t5mK1AWAnba7tXgVy
 7xzk5yHeNBKQds83Ayfbfu54G++6i6vH76n26wtgCY8cBPO24vy0ag3VV/iBuvkOwL
 Fgc2SW3cPOuTxIgKKvIeatTpLUHNDCk3iquNg1peW6kgGX0swUWVQXLye7vS+P40mS
 bRVDfT0O2Ls+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=Dk4e0QFS
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
From: =?utf-8?b?yo7JkEggx53KjMedyodTIHZpYSBidWlsZHJvb3Q=?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?yo7JkEggx53KjMedyodT?= <me@stevenhay.com>
Cc: Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 3/19/23 9:44 AM, Thomas Petazzoni wrote:
> Hello Steve,
>
> Are you sure your generated the correct version of the patch?

I am now. Fixed. Sorry about that. I am not used to this workflow.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
