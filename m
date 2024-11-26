Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C82DD3B98F
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386FC614AD;
	Tue, 26 Nov 2024 13:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmUiD-rWe_RO; Tue, 26 Nov 2024 13:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D02161674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D02161674;
	Tue, 26 Nov 2024 13:17:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3958E4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2712761676
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkMY9n_J5tFx for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53EF6614AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53EF6614AD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53EF6614AD
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:17:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B38E91BF204;
 Tue, 26 Nov 2024 13:17:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFvRt-008mme-0f;
 Tue, 26 Nov 2024 14:17:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20241031221535.338325-1-james.hilliard1@gmail.com>
 <4f3e5676-2c19-4e16-a746-24df4baf3e60@mind.be>
Date: Tue, 26 Nov 2024 14:17:49 +0100
In-Reply-To: <4f3e5676-2c19-4e16-a746-24df4baf3e60@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Tue, 12 Nov 2024 20:55:04
 +0100")
Message-ID: <87ed2ynngi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix webp
 DependencyException
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 31/10/2024 23:15, James Hilliard wrote:
 >> As of baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c webp mux/demux are no
 >> longer optional for webp support in python-pillow.
 >> Fixes:
 >> DependencyException:
 >> The headers or library files could not be found for webp,
 >> which was requested by the option flag --enable-webp

 >  I added:

 > Fixes: baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c

 >  I don't think Peter uses this information at the moment but it could be useful.

I do, it is indeed handy when we clearly mark when an issue was
introduced.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
