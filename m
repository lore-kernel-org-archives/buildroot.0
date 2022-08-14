Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A70C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95CF083E32;
	Sun, 14 Aug 2022 10:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CF083E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hujdD6AhsxRa; Sun, 14 Aug 2022 10:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4D0829B1;
	Sun, 14 Aug 2022 10:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4D0829B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7171E1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58FC341730
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58FC341730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHaiwF7EQ672 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6A64109B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6A64109B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:07:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 965ED60004;
 Sun, 14 Aug 2022 10:07:53 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:07:51 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814120751.3006389e@windsurf>
In-Reply-To: <20220813130709.1773465-1-fontaine.fabrice@gmail.com>
References: <20220813130709.1773465-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VAfvABr/chtqu1DFdl71TESo7XJGSVSDfYBQFaHcLKk=;
 b=YFZVeE6s5BazVxhMr7GQJVWcHEa2BigdErtDTbBqWZTbpQC99BaIsmVAluJMjaCJtvE9nl
 yy5uX78+72FHsLQdhB5JYMwOQnQT80SJIhHm2JxAryhbHpvV8Fjpkdosb4zONBjOfz4hbT
 +9vj90HQPuL8pzXXbzMBmTqedbeAU+l48CZIRr7IWHadhUh/IakOhX4tvXekOUW5DviSGW
 JRL/skkPh0xdiujONNSdrNvXZ15NVQlDDUpmRvlNbbuz3fngIT+k1qvousMzj7xmWka8Ff
 eBl1xiWQmK7hSigLeBPMQAha7jiz7LlIHFuU3n1k7msAxCxvKtqXc2Nvvsgv0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YFZVeE6s
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: bump to version
 1.6.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 15:07:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc 12 thanks to
> https://github.com/memcached/memcached/commit/4df826aafdd6abf0fc483d52774047c3533206dc:
> 
> In function 'complete_incr_bin',
>     inlined from 'dispatch_bin_command' at proto_bin.c:1010:17,
>     inlined from 'try_read_command_binary' at proto_bin.c:119:9:
> proto_bin.c:272:31: error: array subscript 'protocol_binary_request_incr[0]' is partly outside array bounds of 'char[45]' [-Werror=array-bounds]
>   272 |     req->message.body.delta = ntohll(req->message.body.delta);
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> https://github.com/memcached/memcached/wiki/ReleaseNotes1616
> https://github.com/memcached/memcached/wiki/ReleaseNotes1615
> https://github.com/memcached/memcached/wiki/ReleaseNotes1614
> https://github.com/memcached/memcached/wiki/ReleaseNotes1613
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/27ae4bc1ce0d37dee09613b1145023f0d96d8c55
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master as it fixes a build issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
