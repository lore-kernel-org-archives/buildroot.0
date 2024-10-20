Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EB7D3C92A
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 12:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BEB74031F;
	Sun, 20 Oct 2024 12:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHGdd8IgdKm2; Sun, 20 Oct 2024 12:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314D640322
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314D640322;
	Sun, 20 Oct 2024 12:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 244A871F
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12B3180594
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3mCcK8ND0Rl for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 12:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C572A80589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C572A80589
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C572A80589
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:09:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4E2BE0004;
 Sun, 20 Oct 2024 12:09:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2UkR-00Cy6c-1F;
 Sun, 20 Oct 2024 14:09:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: james.hilliard1@gmail.com
Cc: buildroot@buildroot.org
References: <6714767d.170a0220.2b7ad9.12b9@mx.google.com>
Date: Sun, 20 Oct 2024 14:09:27 +0200
In-Reply-To: <6714767d.170a0220.2b7ad9.12b9@mx.google.com> (Buildroot
 Notifications's message of "Sun, 20 Oct 2024 03:18:21 -0000")
Message-ID: <874j57asco.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2024-10-19
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

>>>>> "Buildroot" == Buildroot Notifications <buildroot.notifications@gmail.com> writes:

 > Hello,
 > Autobuild statistics for 2024-10-19
 > ===================================

 >       branch |  OK | NOK | TIM | TOT |
 >   2024.02.x  |  4  |  5  |  0  |  9  |
 >   2024.05.x  | 21  | 28  |  0  | 49  |
 >   2024.08.x  |  4  |  6  |  0  | 10  |
 >     master   |  9  | 65  |  1  | 75  |

 >    mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/bd1affc6985707c38e02e99f1683ddd9594a222a |     

James, we've had these autocommand failures for a while - Any idea what
is going on?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
