Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33E0C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E24404A3;
	Thu, 11 Jul 2024 09:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkIp-1l7RO2S; Thu, 11 Jul 2024 09:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF0E416A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF0E416A4;
	Thu, 11 Jul 2024 09:00:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6851BF471
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68EBC4032A
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBu5Vzj_uari for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EED8405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EED8405C7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EED8405C7
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:00:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06AA7FF802;
 Thu, 11 Jul 2024 09:00:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRpfS-00Au7n-1B;
 Thu, 11 Jul 2024 11:00:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240708210353.7865483D7D@busybox.osuosl.org>
 <CAEyMn7YCPEKxChPE5z3d2VECaSqT08E9N2aONgiBdyV1a=Wu7Q@mail.gmail.com>
Date: Thu, 11 Jul 2024 11:00:46 +0200
In-Reply-To: <CAEyMn7YCPEKxChPE5z3d2VECaSqT08E9N2aONgiBdyV1a=Wu7Q@mail.gmail.com>
 (Heiko Thiery's message of "Thu, 11 Jul 2024 08:54:37 +0200")
Message-ID: <87plrki9q9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > This patch fixes also 2024.02.x (see
 > http://autobuild.buildroot.net/results/991681bbe0200c652c6d77e5abd9966ef6ca2739/)

Yes, but I think I will instead revert the libopenssl change on
2024.02.x / 2024.05.x. The change is not wrong, but there are a bit too
much fallout for the stable branches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
