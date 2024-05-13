Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B7C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF63E4011F;
	Mon, 13 May 2024 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAfY6glEzrjx; Mon, 13 May 2024 21:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 088D640B19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 088D640B19;
	Mon, 13 May 2024 21:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA2A1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6710240B19
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ez9VXufeiL91 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8E914011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E914011F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8E914011F
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:52:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1sJ2bN0Jen-008ncQ; Mon, 13
 May 2024 23:52:16 +0200
Date: Mon, 13 May 2024 23:52:15 +0200
To: rosver001@gmail.com
Message-ID: <20240513235215.4e4fe360@gmx.net>
In-Reply-To: <CACmv0XnmX1qfmENT7FkoxG9BfO3=RvnQJ2bDUp1WGBALpxUqCQ@mail.gmail.com>
References: <CACmv0XkyapDVbVCBmJXDpFVn1EwcQHRxVPbvJ-aL4P1iV-5D0A@mail.gmail.com>
 <CACmv0XnmX1qfmENT7FkoxG9BfO3=RvnQJ2bDUp1WGBALpxUqCQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:FkPxnvM51E83+RwkWHU5KxRj2gema+74RaZ9MCdnBAMEi8Cx3Hn
 FZPoC6zGd2l3b9uRFYLOKh/7fxzrHMgGW6Qep3qtOG5CCHMbVTEqL+2lYFK3NOEY+06GHr5
 44fjB5KKMCY03bKrYkh1rLV8ng96PSw+BaoqBgYPo6Xt2jO81lySUo6HC6AgV2ZWZDzBQq0
 Fucq16jB72ACvjxAVtq5w==
UI-OutboundReport: notjunk:1;M01:P0:pFLXG/OrOFc=;4r272lrpp5U5a6GRQs1sC+aZ+Nw
 8yQFFv81Jp2SHzWkXiw6ndO7uqz25/RFh5WjZERMJ7TZSAlY9szvRDugmZC8TVSnAK6L9KDUG
 NtLNOTCmYsPbw0wY7LytX4eAUF9IN9DdTpLFt0ECCC/ULQAAv4+8zsNgkY6i2PY2BDkMXTZjn
 UhRK9sWCfFtKhwA6ChLknyZssjhNpsZRxxioKdXAIAX8WR5F7Mr104ltgkqPPQRjDLW+cZP5u
 FrA0jWJJiUJTwlf7XXLNVfVnGPAvbk0A+KQNXz7TOnkwPTv1E2ADeMcReTQp8NRBIysSjZFrs
 5CrOGuaL2hCikop6yqhMu3R8hqFA+6y/ezFzYZ+OonSbgFPn/5zpgLd5zDz7+tCY0IeIEX1gS
 SM5ULBivW16u2SXp9IHA+I/mLdjj/l53hYpt9BGk8glXchdqyxnp7bkKbQYRDVp011dlQJtjW
 +4Z/eNnS14b0P/B4EtgGZ5EcprSGwQe2ps9rV0IeHnSY3nuo400AG6uzhpKW1rtdajg8B7FOS
 dSp68oYm2vpRPDulCo+Ma+fF/sdcEr9xRgtuki1Zq0B8cxOOB2NELnCcXPHSyGaP3sp+7OL0K
 n4lX5+x3i1qEAFEM1FnnYymlKXEIpxQ0+zvFE8JHXJFz81NQ+Q9BVFHesphWkJOOobT+QsLEl
 hJ28fJujQVMJFysQ1bS8GepWJXBauR/HD8Ip/HbooBFsoi5AprnQoNIh9JVrlR0WVVD5VjH1k
 EVJQPFmWsK2mhIqUBiiiRHYvr/JQVTs5FPiCbu7SzeWDxqUtrLa49Lc/GysyJj7euuAOG/oyy
 MhASOinFuWMSYcLGn+/6OvnWnxENbilXBAoh2qwU+0SsQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715637136; x=1716241936; i=ps.report@gmx.net;
 bh=DPTHsGi/1uxRvGoV1p8j3z0jslsvnOxxQV0DYsBc/t0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=J5x7gQEdDjJFYY2U9u9QYTZRmrFfhx/6pf5lViu2gVIYjbIeRZxXo/xIaL5AzNmH
 t0DXNC9twogVX2SWZS9ak6q9XG0tTpMWpLDrgrxyy2K7wWurBNZONIVsRNHbqZeEd
 ETmSYoUE8GDhU84uEBw2xnCfsaf2rp6JsPV8FqwhHR6DZ6jJVxwBQE+0sOvTYpglL
 r9T+8S/Dp8xOXiYkMBoKM138mEqfhNAClPWwVD57gDpK4uS/EQLG1+nnqGV01kUcD
 DAx8jM4cEPybRMc2VTtPuuOlgGIYQi7QOzsLdgNaw/0tff8U/GxMkSEr1j7oKAPo/
 XJ/4H+Gfk8fBpfrXrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=J5x7gQEd
Subject: Re: [Buildroot] Fwd: WiringPi is alive again
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 17:33:30 +0300, "rosver001@gmail.com" <rosver001@gmail.com> wrote:

> Dear developers,
>
> WiringPi was deprecated some time ago.
> https://web.archive.org/web/20220405225008/http://wiringpi.com/wiringpi-deprecated/
> It was removed from Buildroot.
> https://github.com/buildroot/buildroot/blob/7763ba7007172ceb5e928ae5902735d727aaa90d/Config.in.legacy
>
> But currently, WiringPi is alive again,
> https://github.com/WiringPi/WiringPi
>
> Could you, please, write, if it is planned to add WiringPi back in
> Buildroot?

See [1] for a draft "package/wiringpi: re-add and bump version to 3.4"...

Regards,
Peter

[1] https://lore.kernel.org/buildroot/20240513214832.18094-1-ps.report@gmx.net/T/#u

>
> Best Regards,
> Sverdlov Roman

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
