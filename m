Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E36C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA07F83BB7;
	Tue, 30 Jan 2024 22:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA07F83BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0U7CLwW7esr; Tue, 30 Jan 2024 22:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C2A835BA;
	Tue, 30 Jan 2024 22:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C2A835BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08FA31BF5DF
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D153542EB8
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D153542EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PO-VDtOXas1G for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:05:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9033642EB9
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9033642EB9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 764991C0002;
 Tue, 30 Jan 2024 22:05:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rUwEo-00GcJh-2d;
 Tue, 30 Jan 2024 23:05:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: David Barbion <davidb@230ruedubac.fr>
References: <20240130105607.1006473-1-davidb@230ruedubac.fr>
Date: Tue, 30 Jan 2024 23:05:50 +0100
In-Reply-To: <20240130105607.1006473-1-davidb@230ruedubac.fr> (David Barbion's
 message of "Tue, 30 Jan 2024 11:56:07 +0100")
Message-ID: <87a5omzdc1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.5
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
Cc: John Stile <johns@msli.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "David" == David Barbion <davidb@230ruedubac.fr> writes:

 > This version contains a fix for aarch64 based systems.
 > On such systems, dhcpcd would crash without setting any IP addresses.
 > See https://github.com/NetworkConfiguration/dhcpcd/commit/6a36f96740f8fb9f9b615b157962505f1ad8a00c
 > and https://github.com/NetworkConfiguration/dhcpcd/issues/260 for more
 > details.

 > Signed-off-by: David Barbion <davidb@230ruedubac.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
