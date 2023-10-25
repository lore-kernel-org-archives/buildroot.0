Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E598C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A2182061;
	Wed, 25 Oct 2023 19:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A2182061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugUqgqYp65ed; Wed, 25 Oct 2023 19:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3D182052;
	Wed, 25 Oct 2023 19:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3D182052
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABACD1BF295
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834A08205E
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834A08205E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4tQAUodOV5B for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:16:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B93582052
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B93582052
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89018C0005;
 Wed, 25 Oct 2023 19:16:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qvjMR-004OKI-Ou; Wed, 25 Oct 2023 21:16:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231022211721.88737-1-fontaine.fabrice@gmail.com>
Date: Wed, 25 Oct 2023 21:16:11 +0200
In-Reply-To: <20231022211721.88737-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Oct 2023 23:17:21 +0200")
Message-ID: <87r0liqzr8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: security bump to
 version 1.57.0
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2023-44487: The HTTP/2 protocol allows a denial of service
 > (server resource consumption) because request cancellation can reset
 > many streams quickly, as exploited in the wild in August through October
 > 2023.

 > Fix CVE-2023-35945: nghttp2 fails to release memory when PUSH_PROMISE or
 > HEADERS frame cannot be sent, and nghttp2_on_stream_close_callback fails
 > with a fatal error. For example, if GOAWAY frame has been received, a
 > HEADERS frame that opens new stream cannot be sent.

 > https://github.com/nghttp2/nghttp2/security/advisories/GHSA-vx74-f528-fxqg
 > https://github.com/nghttp2/nghttp2/security/advisories/GHSA-6pcr-v3hg-752p
 > https://github.com/nghttp2/nghttp2/compare/v1.41.0...v1.57.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
