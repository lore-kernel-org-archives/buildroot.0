Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358DFE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 12:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D084440353;
	Thu,  2 Jan 2025 12:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFqwgM9yFWA7; Thu,  2 Jan 2025 12:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B6740357
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B6740357;
	Thu,  2 Jan 2025 12:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E80EF27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 12:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ABE34044A
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 12:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BR03bcZ1ZiLp for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 12:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7747C403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7747C403B7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7747C403B7
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 12:26:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59C9660009;
 Thu,  2 Jan 2025 12:26:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tTKHq-002yB3-2E;
 Thu, 02 Jan 2025 13:26:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>
References: <20241213-gnutls-3-8-8-error-v1-1-58cec8c3387c@collins.com>
Date: Thu, 02 Jan 2025 13:26:50 +0100
In-Reply-To: <20241213-gnutls-3-8-8-error-v1-1-58cec8c3387c@collins.com>
 (Brandon Maier via buildroot's message of "Fri, 13 Dec 2024 20:57:48
 +0000")
Message-ID: <87v7uxh051.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gnutls: fix autobuild error from
 3.8.8 update
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

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > Fixes: http://autobuild.buildroot.net/results/317/3178fca15cbb2520336b0678a16a5be5a51a8702//
 > Upstream bug report: https://gitlab.com/gnutls/gnutls/-/issues/1604

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
