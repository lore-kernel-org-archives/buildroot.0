Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A5E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA7A611AD;
	Fri,  6 Dec 2024 09:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBTcHP15oR33; Fri,  6 Dec 2024 09:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5502B611D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5502B611D6;
	Fri,  6 Dec 2024 09:21:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBB8BECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0BA611C5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-W3wbFgLGyt for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F626611AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F626611AD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F626611AD
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:21:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68846C0008;
 Fri,  6 Dec 2024 09:21:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJUWP-006VnW-2Q;
 Fri, 06 Dec 2024 10:21:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
 <874j3wrbta.fsf@dell.be.48ers.dk>
Date: Fri, 06 Dec 2024 10:21:13 +0100
In-Reply-To: <874j3wrbta.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 24 Nov 2024 14:38:57 +0100")
Message-ID: <877c8d88vq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
 >> Hi Peter,
 >> On 23/11/2024 23:51, Peter Korsgaard wrote:
 >>> Fixes
 >>> https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/
 >>> Upstream is no longer accessible, so use s.b.n instead.
 >>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >>> ---
 >>> package/quagga/quagga.mk | 3 ++-
 >>> 1 file changed, 2 insertions(+), 1 deletion(-)
 >>> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
 >>> index 5d8d52263a..dd921552f1 100644
 >>> --- a/package/quagga/quagga.mk
 >>> +++ b/package/quagga/quagga.mk
 >>> @@ -5,7 +5,8 @@
 >>> ################################################################################
 >>> QUAGGA_VERSION = 1.2.4
 >>> -QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 >>> +# upstream (http://download.savannah.gnu.org/releases/quagga) dead
 >>> +QUAGGA_SITE = http://sources.buildroot.net/quagga

 >> Should we use https instead? The default BR2_BACKUP_SITE value
 >> is using it:
 >> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/Config.in#L265

 > Given the download hashes it doesn't really matter. I used HTTP as that
 > is what we use for the other packages and because of the server
 > migration we are currently doing HTTPS is a bit tricky (buildroot.net
 > DNS is at Cloudflare, buildroot.org is at Hetzner).

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
