Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF5D462DA
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982144010E;
	Wed, 13 Nov 2024 16:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idC2z5-W8kjh; Wed, 13 Nov 2024 16:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E2D40120
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E2D40120;
	Wed, 13 Nov 2024 16:46:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 884126C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68A9940120
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOvbyVSbJWYl for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41CB54010E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CB54010E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41CB54010E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:46:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DD271BF210;
 Wed, 13 Nov 2024 16:46:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBGVl-00GwPM-2D;
 Wed, 13 Nov 2024 17:46:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
References: <20241029154911.3268784-1-buildroot@bubu1.eu>
 <f3ea39a0-ec59-461c-bbf8-e2b561bd284e@bubu1.eu>
Date: Wed, 13 Nov 2024 17:46:33 +0100
In-Reply-To: <f3ea39a0-ec59-461c-bbf8-e2b561bd284e@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 29 Oct 2024 16:51:48 +0100")
Message-ID: <8734jvytcm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nghttp2: bump to 1.64.0
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > On 29.10.24 16:49, Marcus Hoffmann via buildroot wrote:
 >> Changelog:
 >> * https://github.com/nghttp2/nghttp2/releases/tag/v1.59.0
 >> * https://github.com/nghttp2/nghttp2/releases/tag/v1.60.0
 >> * https://github.com/nghttp2/nghttp2/releases/tag/v1.61.0

 > Turns out that this fixes a security issue:

 > Fixes: CVE-2024-28182 [1] - Reading unbounded number of HTTP/2
 >        CONTINUATION frames to cause excessive CPU usage

 > [1]:
 > https://github.com/nghttp2/nghttp2/security/advisories/GHSA-x6x3-gv8h-m57q

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
