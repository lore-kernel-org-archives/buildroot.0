Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4546CCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CE461547;
	Fri, 29 May 2026 16:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s1Jm4jOMxn7; Fri, 29 May 2026 16:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3322861544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780072813;
	bh=mRINwlJunEQ24/HzSHgsGS2ufIHi1oRR429X3T0TdpE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/V0TIoUUSF1USg0cyJcJD5OOG29ZCOxRfxxy+QyV/mBfQu1eXkzshmPEA+NFTUTu
	 H9QiIcsVQsM1+GuyBV7gys3vG4QJAM+6rGDtSwmhuzeN070kjLM2gqiMa1xBvQm2K6
	 eYXa0wEnAc/Z4/wdZFd/V4Qln6KSSVX7a34Aso969FqRRVXh+2qoTPsNCHeM5LwTT8
	 52LZ+xhhzfyUDgfj9iu0TVecJlltHhhYJkcefV5QyEd9sBVeaeDY4BkFW/9WVeKcQ/
	 aKSMnwB5uVXc7ZBxeOS1Eynq49Ig1XjHYsgFzKhd4rZzjB9g0fsSj4b92UIl3YDKNr
	 wfotbXBppNtUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3322861544;
	Fri, 29 May 2026 16:40:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F00FF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF7461544
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0C-2-Z1lktV for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24D9561543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D9561543
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24D9561543
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1486110242; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 16:40:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wT0Fd-000000037n2-32zc;
 Fri, 29 May 2026 18:40:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260525185212.40430-1-chakrabortyshubham66@gmail.com> (Shubham
 Chakraborty's message of "Tue, 26 May 2026 00:22:11 +0530")
References: <20260525185212.40430-1-chakrabortyshubham66@gmail.com>
Date: Fri, 29 May 2026 18:40:01 +0200
Message-ID: <875x46i2zi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pIpBVt7FqHeWoO582QVoBJQb2yg3CZxKcqFrDR3QVi3PzA3IaNBB3S+WNHez/XpHpIoyCZtgmMuMPIdMzc8xZgaYsr5Qk9qHOjp7sKNQzRn+SsBtux5uq8jHJPCxpc2KWg+50pXk5bp0d3NhMYw1vkLhGh+iHzoGOACbev1qkoUm43iyL8wyllA9fj4vlicUWzOruHnOgXv8PQmYHXnkwwPyu5KpEqLvXRpzLhmG94K/WcZ3DXz0OcMYGuhQbeXhm2CpsntDm2gzkKxyidvKciwBFtyujVFCmnZBr3UVGlEIw4101TJ1v6RJsEwVaFzW22O2F9OLtPWalf2xi466UA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ibC7XRHgcDHKvhSlOjMcYWkYEYRY3Fz3C2OkldcVGSI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pIpBVt7F
Subject: Re: [Buildroot] [PATCH] package/xterm: bump to version 410
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Shubham" == Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

 > Update xterm from version 401 to 410.
 > For detailed changes, see the upstream changelog:
 > https://invisible-island.net/xterm/xterm.log.html

 > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 > ---
 >  package/xterm/xterm.hash | 4 ++--
 >  package/xterm/xterm.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
 > index e86db1c06e..3438e7999a 100644
 > --- a/package/xterm/xterm.hash
 > +++ b/package/xterm/xterm.hash
 > @@ -1,4 +1,4 @@
 >  # Locally calculated after checking pgp signature
 > -sha256  3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a  xterm-401.tgz
 > +sha256  7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f  xterm-410.tgz
 >  # Locally calculated
 > -sha256  99f70364bb769635eb9de18cc286e16cb78026f3b6478276344ee8619098dff6  COPYING
 > +sha256  f272fa007de2cffdb22b4df09e9a3aaec3555d5a6913229b70006ee137ab22b5  COPYING

You should always document why an update of the license file is done (in
this case a change of copyright year).

And like for unrar, please send a patch adding a DEVELOPERS entry.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
