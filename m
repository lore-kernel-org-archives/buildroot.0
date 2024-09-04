Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25469CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0CB400CC;
	Wed,  4 Sep 2024 12:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMqRWmn_Yb46; Wed,  4 Sep 2024 12:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863C9400D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863C9400D1;
	Wed,  4 Sep 2024 12:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7495F1BF47E
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F158811D1
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXYXs13yd7sn for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFFF7811D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFFF7811D0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFFF7811D0
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:01:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B9FF53534FF0; Wed,  4 Sep 2024 14:01:42 +0200 (CEST)
Date: Wed, 4 Sep 2024 14:01:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZthMJn+FHKcJN1xq@waldemar-brodkorb.de>
References: <Zp4XKwrMN9+YZC/B@waldemar-brodkorb.de>
 <87h6b110zi.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6b110zi.fsf@dell.be.48ers.dk>
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1725451302; bh=uIqkiBpDjdTV551R3B4QsL44shVZFqSP9jM5nXr35UM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lfy7ARFQVy38XZfnfdbKTjtRA7t4yoWblf58jpgWHgIxftMkB/w79/I0aRK4lKbqE
 mCMz5Q9i6wCXyb27AN1x1ootIHfK/TGESBO4yFyNSamE6NhJVvrqyZw95PJXc6XPfJ
 JfGzY7ECZ04hF3z3+1WKQEKXox11wnR6uYXc/vbq3G8s9PBOnHvwhp/RSHheXMMax5
 zXERV/zeHAWmPwd1/5uODBoSHCa9J6jZGgIA+NM6MfoBBAZ7wrcIGaHynB3xp6g31+
 j4bFOdKeu2BGvzc6ne5jxtqLiGbuMiCZ+qM8Xxs1potnvzgiiLK7wkBNQB7Nl+EnR1
 5mATQSB2zONwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Lfy7ARFQ
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix compile error
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

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Fix compile error with older Linux kernel headers.
>  > Fixes:
>  >  http://autobuild.buildroot.net/results/dfa46b243aa6e289333cbd98e3162d62ee6fa865
> 
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> I take it that this is related to time64, so an issue that started with
> the bump to uclibc-ng 1.0.49 and hence not applicable to 2024.02.x /
> 2024.05.x?

Right, I think so, too.
 
> It would be great if you could add such info to the commit messages to
> make the LTS work easier, thanks.

Okay.

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
