Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A5EC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83890605D8;
	Mon, 27 May 2024 14:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4atnhbGTEAO; Mon, 27 May 2024 14:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A799260690
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A799260690;
	Mon, 27 May 2024 14:38:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A896B1D1DCC
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94E9F403EA
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBIBe_uXLz3m for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51DB040338
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DB040338
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51DB040338
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:38:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4616F40005;
 Mon, 27 May 2024 14:38:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBbUK-005SW0-2Q;
 Mon, 27 May 2024 16:38:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>
References: <20240524125448.3566-1-alexander.i.mukhin@gmail.com>
Date: Mon, 27 May 2024 16:38:12 +0200
In-Reply-To: <20240524125448.3566-1-alexander.i.mukhin@gmail.com> (Alexander
 Mukhin's message of "Fri, 24 May 2024 15:54:48 +0300")
Message-ID: <87v82z9v6z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyproxy: bump version to
 1.11.2
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

>>>>> "Alexander" == Alexander Mukhin <alexander.i.mukhin@gmail.com> writes:

 > Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
 > ---
 >  ...up-in-error-page-in-invalid-requests.patch | 32 -------------------
 >  package/tinyproxy/tinyproxy.hash              |  4 +--
 >  package/tinyproxy/tinyproxy.mk                |  5 +--

You forgot to remove the reference to the patch in
.checkpackageignore. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
