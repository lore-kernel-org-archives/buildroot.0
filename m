Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B82FD3B98E
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1367F42CEE;
	Tue, 26 Nov 2024 13:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwOEgYp-oKDI; Tue, 26 Nov 2024 13:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC704C351
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC704C351;
	Tue, 26 Nov 2024 13:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA34DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44872405A5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imwJ7o05-94M for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0814A400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0814A400D9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0814A400D9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:23:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D09CE0009;
 Tue, 26 Nov 2024 13:23:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFvXG-008nsk-2q;
 Tue, 26 Nov 2024 14:23:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20241115201140.363683-1-bernd@kuhls.net>
Date: Tue, 26 Nov 2024 14:23:22 +0100
In-Reply-To: <20241115201140.363683-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 15 Nov 2024 21:11:40 +0100")
Message-ID: <87serem8mt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20241112
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes:
 > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases

 > CVE-2024-21853
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01101.html

 > CVE-2024-23918
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01079.html

 > CVE-2024-24968
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html

 > CVE-2024-23984
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
