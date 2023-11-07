Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66689C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152CF60C0F;
	Tue,  7 Nov 2023 21:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152CF60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05zQzYQ1sGir; Tue,  7 Nov 2023 21:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2465660D6E;
	Tue,  7 Nov 2023 21:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2465660D6E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9A41BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 807C6403E7
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807C6403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gIWYNlSuveY for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:56:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 858E440182
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 858E440182
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BBB3913F899;
 Tue,  7 Nov 2023 22:56:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:56:15 +0100
Date: Tue, 7 Nov 2023 22:56:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Hitz <christian@klarinett.li>
Message-ID: <20231107215615.GO229059@scaer>
References: <20231107124157.594529-1-christian@klarinett.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231107124157.594529-1-christian@klarinett.li>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699394178;
 bh=NlWDbXFg08bNTnH4cGqNkTAbYulF4hMeMmCY88wrRos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsQ+BvhA3BiybWmZeMdiLK2L6PcqFoTswoyBMa0YjkPqK6IrtrUyJdEIcQoHeYiua
 lV1TdfS4VhG0OWeYNLT1mRM/uhdsdL+P88d4A+E4Q4392RAzCggTT716mCWgxw0t72
 5zbyK04DPPNL2dG5LqsaSpDWfjlkD8NH1z31Uz6XxGVan5YC5mWzLxbCgtiBFXZACl
 foQojYBzzU8V9F1D4VXMOXkXbnGoxgeG9xowAB7h9N9Jna7ax9cO9o7fwTyYcJpZzS
 bO0lD/Igy0rG4Es8SwrQN5IKrzQbciYSQ3hkBmPO5AMc2AbHS99xbslY3gdw/kqtwe
 OwsDBj6WTRadw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dsQ+BvhA
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: add patch for
 compatibility with curl 8.4
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
Cc: Christian Hitz <christian.hitz@bbv.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-11-07 13:41 +0100, Christian Hitz via buildroot spake thusly:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> This upstream patch restores the connectivity check functionality with
> libcurl 8.4.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Backport to: 2023.02.x, 2023.08.x
> ---
>  ...-curl-timeout-callback-non-repeating.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> 
> diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> new file mode 100644
> index 0000000000..8e25805d0c
> --- /dev/null
> +++ b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> @@ -0,0 +1,44 @@
> +From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
> +From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> +Date: Fri, 13 Oct 2023 16:46:09 +0000
> +Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
> +
> +This reverts commit 05c31da4d9.
> +
> +In the linked commit the callback was made repeating on the assumption
> +that forward progress would result in the callback getting canceled in
> +cb_data_complete. However, this assumption does not hold since a timeout
> +callback does not guarantee completion (or error out) of a request.
> +
> +curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
> +a repeating callback is firing back-to-back without making any progress
> +in doing so.
> +
> +Revert the change and make the callback non-repeating again.
> +
> +Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
> +Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
> +Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> +---
> + src/core/nm-connectivity.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
> +index 92de44f17d..d8b0004c38 100644
> +--- a/src/core/nm-connectivity.c
> ++++ b/src/core/nm-connectivity.c
> +@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
> + {
> +     NMConnectivityCheckHandle *cb_data = user_data;
> + 
> ++    cb_data->concheck.curl_timer = 0;
> +     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
> +     _complete_queued(cb_data->self);
> +-    return G_SOURCE_CONTINUE;
> ++    return G_SOURCE_REMOVE;
> + }
> + 
> + static int
> +-- 
> +GitLab
> +
> -- 
> 2.42.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
