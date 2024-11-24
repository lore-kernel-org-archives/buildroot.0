Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9038E66887
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 13:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92ECD840F0;
	Sun, 24 Nov 2024 13:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BemnPFlIVu53; Sun, 24 Nov 2024 13:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94388840D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94388840D1;
	Sun, 24 Nov 2024 13:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EBE64961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E60840E0
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WdNXfaCy1QY for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 13:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A74BE840BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74BE840BC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A74BE840BC
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:39:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1517FF804;
 Sun, 24 Nov 2024 13:38:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFCpF-00G7ul-0v;
 Sun, 24 Nov 2024 14:38:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
Date: Sun, 24 Nov 2024 14:38:57 +0100
In-Reply-To: <3a4e6ae025bfd288bb98c7b492ec499f@free.fr> (Julien Olivain's
 message of "Sun, 24 Nov 2024 01:41:01 +0100")
Message-ID: <874j3wrbta.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Hi Peter,
 > On 23/11/2024 23:51, Peter Korsgaard wrote:
 >> Fixes
 >> https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/
 >> Upstream is no longer accessible, so use s.b.n instead.
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/quagga/quagga.mk | 3 ++-
 >> 1 file changed, 2 insertions(+), 1 deletion(-)
 >> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
 >> index 5d8d52263a..dd921552f1 100644
 >> --- a/package/quagga/quagga.mk
 >> +++ b/package/quagga/quagga.mk
 >> @@ -5,7 +5,8 @@
 >> ################################################################################
 >> QUAGGA_VERSION = 1.2.4
 >> -QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 >> +# upstream (http://download.savannah.gnu.org/releases/quagga) dead
 >> +QUAGGA_SITE = http://sources.buildroot.net/quagga

 > Should we use https instead? The default BR2_BACKUP_SITE value
 > is using it:
 > https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/Config.in#L265

Given the download hashes it doesn't really matter. I used HTTP as that
is what we use for the other packages and because of the server
migration we are currently doing HTTPS is a bit tricky (buildroot.net
DNS is at Cloudflare, buildroot.org is at Hetzner).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
