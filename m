Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D11CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:47:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA7FC61053
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA7FC61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F2F40243;
	Wed,  6 Oct 2021 19:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oz7gINVgMOwL; Wed,  6 Oct 2021 19:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C58E3407F9;
	Wed,  6 Oct 2021 19:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F014D1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEEF840D7
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48-ypvF8MOqq for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:47:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A07BF82DE6
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:47:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a11c:d3e8:9e5:2853])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0DEFC78031A;
 Wed,  6 Oct 2021 21:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633549635;
 bh=SjH/WmV9F4NA1m8wMYDDoo6wfO+2OaNA1w/+WdaK0BA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HesVA3x1O3srUVD/JGh2Wu7jf5d8rCS8G/UGpcOEHdrCQp/O+gAQFEgtqNm4lLzKD
 Eiwsf1FsQNlFd3G2+NQ2qt/pGo9cd15biFBC8huD9rhNY8/60WOUBhQ+woOjYmfri8
 HOhOmutuQv9OveMuuaHNStTdGwfrTzkeR8It4pLWTu2fxF0IvLfaGzHO4G1TB8hW09
 2etPuQ9vQBy2tvAvfYo0ciZnjaNsxIBAv5/N5DKCRqkWkwGlnk8Yc9q5cbjjcGufzh
 NqDxWgGta26egj/lGQUIKdPTBx7p/+OrqJWDCaz0b+UM9pzBqrljsnL53C61A0uf3Y
 +psJvS5QOze7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 06 Oct 2021 21:47:10 +0200
Date: Wed, 6 Oct 2021 21:47:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20211006194710.GE2081069@scaer>
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
 <20211005200111.GC2081069@scaer> <20211006091104.0e61efd6@windsurf>
 <3252ce60-6391-03d2-9dd4-01238e2f2b0d@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3252ce60-6391-03d2-9dd4-01238e2f2b0d@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Edgar, All,

On 2021-10-06 12:22 +0200, Edgar Bonet spake thusly:
> About testing this patch, Thomas Petazzoni wrote:
> >   ./support/testing/tests/package/test_python_flask_expects_json.py
> I tried to run this test but ran into an unexpected issue. The test
> issues commands like
>     curl -s -o /dev/null -w "%%{http_code}\\n" -X POST ...
> and then curl outputs "%{http_code}" literally. The test fails with
>     AssertionError: '%{http_code}' != '200'

I can confirm that the test is currently broken for me too...

> It looks like curl simply replaced "%%" with "%", which is consistent
> with `man curl'. I replaced %%" with "%" in
> test_python_flask_expects_json.py and then got the expected behavior:
> 
> 1. With no changes to master other than the above mentioned 's/%%/%/',
>    the test succeeds.
> 
> 2. If, in addition to this change, I replace output[-1] with output[0],
>    the test fails with
> 
>      AssertionError: '' != '200'
> 
>    Why did it get an empty line? For some reason the command line got
>    cut with the sequence CR,CR,CR,LF (yes, 3 CRs in a row). I guess the
>    host tty driver may be adding its own CRs, as every CR,LF sequence in
>    the output log had another CR right before it.
> 
> 3. If, in addition to these two changes, I add the patch discussed here,
>    the test succeeds again.
> 
> I would say the `stty columns 29999' fix is now confirmed to work.

Agreed, it works as expected.

Since the test is already broken before this patch, I'll apply you
change, and we can fix the test case in a subsequent patch.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
