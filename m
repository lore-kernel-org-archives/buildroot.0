Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706ACC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C8282237;
	Thu, 21 Mar 2024 20:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtAkjgXAOPcd; Thu, 21 Mar 2024 20:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2BE8226A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2BE8226A;
	Thu, 21 Mar 2024 20:51:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 846B91BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7211C4054B
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVPZjQzWe8Rq for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1944400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1944400C1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1944400C1
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:51:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B73931C0008;
 Thu, 21 Mar 2024 20:51:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnPNx-005bOl-0Z;
 Thu, 21 Mar 2024 21:51:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240314214125.397970-1-fontaine.fabrice@gmail.com>
Date: Thu, 21 Mar 2024 21:51:37 +0100
In-Reply-To: <20240314214125.397970-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Mar 2024 22:41:25 +0100")
Message-ID: <87edc348bq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: fix pthread option
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix typo added by commit f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
 > Fixes: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
