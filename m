Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0BAC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CD6417D3;
	Thu, 10 Aug 2023 21:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CD6417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39-cyarj0InC; Thu, 10 Aug 2023 21:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C37F40B6D;
	Thu, 10 Aug 2023 21:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C37F40B6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1771BF379
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4D541DFB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4D541DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLQS7wysSvJW for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:16:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72E4741DD1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E4741DD1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 321C3FF803;
 Thu, 10 Aug 2023 21:16:40 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:16:38 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230810231638.6837c8da@windsurf>
In-Reply-To: <20230210215548.1050371-1-yann.morin.1998@free.fr>
References: <20230210215548.1050371-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691702200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2L7h/XbPNcy2T8L4WJNf++MZk8JJ6zS2RwFJ94KNeI=;
 b=gcCTP+UlfQ/F2Aj1heOHI0mNQG7Rvbijs+60IOy0u1xQsoiFiiktIEUHgE/zIcJ51FDLSf
 fP3QmJWwtZKGkwlc4cx4E+SItOwCONC/KRwD1s2UQKIXpYothB8PZgosuKW5CzJ532liSV
 8CoB9qEKPSTsLe6bh9dXK7FsJi9ymx7yeyshFIBaMa8eUsojXJLNMi1/QD9nruHI1ayvPa
 p2PM/lLUkxICvbpl/4w09MBVAkLsgfzzFGbRsPP8R0cVIVtPaCuSz7HpiC6i99L1Zc4BGT
 hsXOjOGPbCZZ7NbyqCttiJ6hG1ifQ0vsXrfZ/qbRy/9HQQ6VkfgnL/43sAAJaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gcCTP+Ul
Subject: Re: [Buildroot] [PATCH] package/erlang: do not hard-code the Erlang
 Interface Version (EI_VSN)
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 Feb 2023 22:55:48 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The note above the erlang version instructs to refer to another note
> further down the file. However, even if it is not too difficult to find,
> it is still located a bit too far away, and the reference is not very
> explicit what note we should look at.
> 
> When we introduced that variable in 6c1d128844c5 (package/erlang: export
> EI_VSN so other packages can use it), the rationale for hard-coding it
> was "to avoid spawning a shell every time the variable is dereferenced".
> 
> However, that can get a bit confusing and hard to follow. Also, that in
> fact spawns a shell only once for each rebar-packages, so the overhead
> is far from being too high.
> 
> The EI_VSN is only used by rebar-package packages, is derefrenced from
> the rebar-infra and not the packages themselves, and is not needed by
> erlang itself (it knows its own EI_VSN), so we can de-hard-code it, and
> rely on build-time detection, by looking in the appropriate file.
> 
> We have two files where we could look:
>   - lib/erl_interface/vsn.mk in the erlang source tree, but it is not
>     installed,
>   - .../lib/erlang/releases/$(ERLANG_RELASE)/installed_application_versions
>     as installed by erlang.
> 
> We use the second one, as it is cleaner, for a package, to look into
> installed files, rather than to look in the source tree of another
> package.
> 
> Although both the host and target erlang are the same, we still look
> into the corresponding file to extract the version. This is so that it
> would be easier if in the future we ever manage to rely on a
> system-installed erlang that could have a EI_VSN different from the
> target one.
> 
> We can't re-use the variable ERLANG_EI_VSN, because it now needs to be
> $(call)-ed with a parameter. Hopefully, external packages that use it
> directly rather than through the rebar infra, are not legion...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Will Newton <will.newton@gmail.com>
> Cc: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang/erlang.mk | 8 ++++----
>  package/pkg-rebar.mk     | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Arnout provided feedback, you replied to it, Arnout never provided
counter feedback, so: I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
