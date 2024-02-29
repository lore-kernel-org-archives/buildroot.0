Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABA8C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6872C41899;
	Thu, 29 Feb 2024 14:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YySQXpIypQMw; Thu, 29 Feb 2024 14:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C70A9418A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70A9418A0;
	Thu, 29 Feb 2024 14:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A23501BF3FB
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BDCB417B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k64N7Ocw7fYn for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 14:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7336E417B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7336E417B0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7336E417B0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:21:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02112FF80E;
 Thu, 29 Feb 2024 14:21:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfhHy-003XMs-1M;
 Thu, 29 Feb 2024 15:21:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
References: <20240204201657.33079-1-aleksandr.o.makarov@gmail.com>
 <20240204201657.33079-2-aleksandr.o.makarov@gmail.com>
Date: Thu, 29 Feb 2024 15:21:34 +0100
In-Reply-To: <20240204201657.33079-2-aleksandr.o.makarov@gmail.com> (Aleksandr
 Makarov's message of "Sun, 4 Feb 2024 22:16:57 +0200")
Message-ID: <87edcvic5t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/haproxy: fix runtime 'FATAL
 ERROR: invalid code detected -- cannot go further'
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Aleksandr" == Aleksandr Makarov <aleksandr.o.makarov@gmail.com> writes:

 > Setting HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
 > which were internally set by the haproxy Makefile.

 > Among those omitted CFLAGS is -fwrapv. Compiling haproxy without it and
 > and then running the program results in runtime error:

 > $ haproxy
 > FATAL ERROR: invalid code detected -- cannot go further, please recompile!
 > ...

 > To address this issue, include HAPROXY_CFLAGS in the DEFINE variable instead
 > of CFLAGS in haproxy.mk.

 > ---
 > Changes v1 -> v2
 >   - Drop patch for haproxy program Makefile, make changes to haproxy.mk instead

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
