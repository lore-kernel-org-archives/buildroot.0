Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED2C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 10:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A491861077
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 10:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A491861077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C14401D9;
	Wed,  6 Oct 2021 10:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsMskLkiAfaM; Wed,  6 Oct 2021 10:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE9B40400;
	Wed,  6 Oct 2021 10:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30FC1BF38A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CB783EEC
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sv6M3b5ZXv2r for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 10:22:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C3BE83ED6
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 10:22:37 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 1EC0BC0456
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1633515754;
 bh=dY0QrSwbbuigkRv4x6SMxybgPbp2hJwF7XUMp2vaxRA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=PdWCFy5XP1P1QBWr/cGKiWrCHIiGyN3aaeRN1K4mG4vazW0NFf87yTDJBM/g4m5OG
 6AY9rgDdE/41zFVGlmMTJoSVaTJxha42lX4jh2WvUM0vDWOA3aEg4bUHTyVmTXhNix
 AMrzxIDgFaE0jBhP+4quAUZPhEHW7w+DGiWZOloATVbrpORbI2pKcvCcbpWpYmbtwE
 OkZ4bp5012XLOcqatrhiQQc1Dt+s1oifaOP+6s0luCCF7+S7DNFNxw5E9Zy2T2cSbl
 an2+SGB4lb/s/MaJCmQfiymg+mtEUKh4shQ0hcMNqiA/BIbuPozS+bA7TBzvy2QyRo
 8I2J1d4Kvu9aw==
To: buildroot@buildroot.org
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
 <20211005200111.GC2081069@scaer> <20211006091104.0e61efd6@windsurf>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <3252ce60-6391-03d2-9dd4-01238e2f2b0d@grenoble.cnrs.fr>
Date: Wed, 6 Oct 2021 12:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006091104.0e61efd6@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py:
 prevent the commands from wrapping
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

About testing this patch, Thomas Petazzoni wrote:
>   ./support/testing/tests/package/test_python_flask_expects_json.py
>
> is such a test. The test is doing:
>
>         self.assertEqual(output[-1], str(expects))
>
> [...] if that test works by using output[0] instead of output[-1],
> then the fix of using stty columns 29999 would be confirmed to work!

I tried to run this test but ran into an unexpected issue. The test
issues commands like

    curl -s -o /dev/null -w "%%{http_code}\\n" -X POST ...

and then curl outputs "%{http_code}" literally. The test fails with

    AssertionError: '%{http_code}' != '200'

It looks like curl simply replaced "%%" with "%", which is consistent
with `man curl'. I replaced %%" with "%" in
test_python_flask_expects_json.py and then got the expected behavior:

1. With no changes to master other than the above mentioned 's/%%/%/',
   the test succeeds.

2. If, in addition to this change, I replace output[-1] with output[0],
   the test fails with

     AssertionError: '' != '200'

   Why did it get an empty line? For some reason the command line got
   cut with the sequence CR,CR,CR,LF (yes, 3 CRs in a row). I guess the
   host tty driver may be adding its own CRs, as every CR,LF sequence in
   the output log had another CR right before it.

3. If, in addition to these two changes, I add the patch discussed here,
   the test succeeds again.

I would say the `stty columns 29999' fix is now confirmed to work.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
